module test_top_level (
    input  logic       MAX10_CLK1_50,
    output logic       VGA_HS,
    output logic       VGA_VS,
    output logic [3:0] VGA_R,
    output logic [3:0] VGA_G,
    output logic [3:0] VGA_B
);

    logic clk, reset, start;
    assign clk = MAX10_CLK1_50;

    logic pixel_clk, blank, sync;
    logic _VGA_HS, _VGA_VS;
    logic [9:0] DrawX, DrawY;
    vga_controller display_adapter(.clk(MAX10_CLK1_50), .hs(_VGA_HS), .vs(_VGA_VS), .*);

    always_ff @(posedge pixel_clk) begin : VGA_DELAY
        VGA_HS <= _VGA_HS;
        VGA_VS <= _VGA_VS;
    end

    logic fb_we;
    logic [3:0] fb_data, fb_q;
    logic [16:0] fb_rdaddress, fb_wraddress;
    frame_buffer fb0(.clock(clk), .data(fb_data), .rdaddress(fb_rdaddress), .wraddress(fb_wraddress), .wren(fb_we), .q(fb_q));

    logic zb_we;
    logic [7:0] zb_data, zb_q;
    logic [16:0] zb_rdaddress, zb_wraddress;
    z_buffer zb0(.clock(clk), .data(zb_data), .rdaddress(zb_rdaddress), .wraddress(zb_wraddress), .wren(zb_we), .q(zb_q));

    logic [11:0] poly_address;
    logic [95:0] poly_q;
    vertices v0(.clock(clk), .rdaddress(poly_address), .q(poly_q));

    logic p1x_we, p1y_we, p1z_we, p2x_we, p2y_we, p2z_we, p3x_we, p3y_we, p3z_we;
    logic [31:0] p1x_in, p1y_in, p1z_in, p2x_in, p2y_in, p2z_in, p3x_in, p3y_in, p3z_in;
    logic [31:0] p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z;
    reg_32 p1x_reg(.clk(clk), .write_en(p1x_we), .reset(reset), .data_in(p1x_in), .data_out(p1x));
    reg_32 p1y_reg(.clk(clk), .write_en(p1y_we), .reset(reset), .data_in(p1y_in), .data_out(p1y));
    reg_32 p1z_reg(.clk(clk), .write_en(p1z_we), .reset(reset), .data_in(p1z_in), .data_out(p1z));

    reg_32 p2x_reg(.clk(clk), .write_en(p2x_we), .reset(reset), .data_in(p2x_in), .data_out(p2x));
    reg_32 p2y_reg(.clk(clk), .write_en(p2y_we), .reset(reset), .data_in(p2y_in), .data_out(p2y));
    reg_32 p2z_reg(.clk(clk), .write_en(p2z_we), .reset(reset), .data_in(p2z_in), .data_out(p2z));

    reg_32 p3x_reg(.clk(clk), .write_en(p3x_we), .reset(reset), .data_in(p3x_in), .data_out(p3x));
    reg_32 p3y_reg(.clk(clk), .write_en(p3y_we), .reset(reset), .data_in(p3y_in), .data_out(p3y));
    reg_32 p3z_reg(.clk(clk), .write_en(p3z_we), .reset(reset), .data_in(p3z_in), .data_out(p3z));

    logic curr_poly_we;
    int curr_poly_in, curr_poly;
    reg_32 curr_poly_reg(.clk(clk), .write_en(curr_poly_we), .reset(reset), .data_in(curr_poly_in), .data_out(curr_poly));


    logic su_start, su_done;
    logic [3:0] su_color;
    shader_unit su0 (
        .clk(clk), .start(su_start), .sreset(reset),
        .p1('{p1x, p1y, p1z}), .p2('{p2x, p2y, p2z}), .p3('{p3x, p3y, p3z}),
        .view_vector('{32'b0, 32'b0, 32'hbf800000}),
        .color(su_color), .done(su_done)
    );

    logic proj_start, proj_done;
    logic [31:0] cam_x, cam_y, cam_z, ndc_x, ndc_y, ndc_z;
    logic [31:0] proj_m[4][4];
    matrix_multiply mm0 (
        .clk(clk), .start(proj_start), .done(proj_done),
        .x(cam_x), .y(cam_y), .z(cam_z), .m(proj_m),
        .x_out(ndc_x), .y_out(ndc_y), .z_out(ndc_z)
    );

    logic rast_start, rast_done, rast_fb_we, rast_zb_we;
    logic [3:0] rast_color, rast_fb_data;
    logic [7:0] rast_zb_rdata, rast_zb_wdata;
    logic [9:0] rast_x, rast_y;
    rasterizer_unit ru0 (
        .clk(clk), .sreset(reset), .start(rast_start),
        .p1('{p1x, p1y, p1z}), .p2('{p2x, p2y, p2z}), .p3('{p3x, p3y, p3z}),
        .color(rast_color), .done(rast_done),
        .fb_we(rast_fb_we), .rast_x(rast_x), .rast_y(rast_y), .fb_data(rast_fb_data),
        .zb_rdata(rast_zb_rdata), .zb_wdata(rast_zb_wdata), .zb_we(rast_zb_we),
        .display_width(32'h43200000), .display_height(32'h42f00000)
    );

    logic [16:0] read_pixel_addr, write_pixel_addr;
    address_translator_vga at0(.x(DrawX), .y(DrawY), .addr(read_pixel_addr));
    address_translator_gpu at1(.x(rast_x), .y(rast_y), .addr(write_pixel_addr));

    logic [3:0] vga_data;
    always_comb begin : FB_READ_WRITE_CONTROL
        fb_wraddress = write_pixel_addr;
        zb_wraddress = write_pixel_addr;
        fb_rdaddress = read_pixel_addr;
        fb_data = su_color;
        zb_data = rast_zb_wdata;
        rast_zb_rdata = zb_q;
        fb_we = rast_fb_we;
        zb_we = rast_zb_we;
        poly_address = curr_poly[11:0];

        if (~blank) // active low
            vga_data = 4'b0000;
        else
            vga_data = fb_q;
    end

    assign VGA_R = vga_data;
    assign VGA_G = vga_data;
    assign VGA_B = vga_data;

    enum {
        DONE,
        START,
        READ_VERTICES,
        SHADER_CALC,
        TRANSFORM_VERTEX1,
        TRANSFORM_VERTEX2,
        TRANSFORM_VERTEX3,
        WAIT_FOR_VSYNC,
        CLEAR_SCREEN,
        RASTER_TRIANGLE,
        RASTER_TRIANGLE2
    } state, next_state;

    logic [31:0] pyramid[4][3][3];
    assign pyramid[0] = { '{32'h, 32'h, 32'hc2480000}, // 
                          '{},
                          '{} }; // x, y, z
    logic [31:0] cube [12][3];

    int cycle_count = 1;
    always_ff @(posedge clk) begin : UPDATE_STATE
        if (state == next_state)
            cycle_count = cycle_count + 1;
        else
            cycle_count = 1;

        if (reset)
            state <= DONE;
        else
            state <= next_state;
    end

    always_comb begin

        next_state = state;

        p1x_we = 1'b0;
        p1y_we = 1'b0;
        p2x_we = 1'b0;
        p1z_we = 1'b0;
        p2y_we = 1'b0;
        p2z_we = 1'b0;
        p3x_we = 1'b0;
        p3y_we = 1'b0;
        p3z_we = 1'b0;
        p1x_in = 32'hc1a00000; // (-0.5, 0.5, 0)
        p1y_in = 32'h41f00000;
        p1z_in = 32'hc2700000;
        p2x_in = 32'hc1f00000; // (-0.5, -0.5, 0)
        p2y_in = 32'hc1a00000;
        p2z_in = 32'hc1f00000;
        p3x_in = 32'h41700000; // (0.5, 0, 0)
        p3y_in = 32'hc1700000;
        p3z_in = 32'hc1a00000;

        proj_m[0][0] = 32'h3f100000;
		proj_m[0][1] = 32'b0;
		proj_m[0][2] = 32'b0;
		proj_m[0][3] = 32'b0;

		proj_m[1][0] = 32'b0;
		proj_m[1][1] = 32'h3f800000;
		proj_m[1][2] = 32'b0;
		proj_m[1][3] = 32'b0;

		proj_m[2][0] = 32'b0;
		proj_m[2][1] = 32'b0;
		proj_m[2][2] = 32'hbf9c71c7;
		proj_m[2][3] = 32'hbf800000;

		proj_m[3][0] = 32'b0;
		proj_m[3][1] = 32'b0;
		proj_m[3][2] = 32'hc1b1c71c;
		proj_m[3][3] = 32'b0;
        
        reset = 1'b0;
        rast_start = 1'b0;
        rast_color = 4'b0000;
        su_start = 1'b0;
        proj_start = 1'b0;
        cam_x = 32'b0;
        cam_y = 32'b0;
        cam_z = 32'b0;
        curr_poly_we = 1'b0;
        curr_poly_in = 0;
        // poly_address = 12'b0;
        
        case (state)
            DONE : begin
                next_state = START;
            end

            START : begin
                next_state = READ_VERTICES;
                // p1x_we = 1'b1;
                // p1y_we = 1'b1;
                // p2x_we = 1'b1;
                // p1z_we = 1'b1;
                // p2y_we = 1'b1;
                // p2z_we = 1'b1;
                // p3x_we = 1'b1;
                // p3y_we = 1'b1;
                // p3z_we = 1'b1;
                curr_poly_we = 1'b1;
                curr_poly_in = 0;
            end

            READ_VERTICES : begin
                case (cycle_count)
                    1 : begin
                        // poly_address = curr_poly[11:0];
                        // poly_address = 12'h000;
                        curr_poly_we = 1'b1;
                        curr_poly_in = curr_poly;
                    end
                    2 : begin
                        // poly_address = curr_poly[11:0];
                        // poly_address = 12'h001;
                        curr_poly_we = 1'b1;
                        curr_poly_in = curr_poly + 1;
                        p1x_we = 1'b1;
                        p1y_we = 1'b1;
                        p1z_we = 1'b1;
                        p1x_in = poly_q[95:64];
                        p1y_in = poly_q[63:32];
                        p1z_in = poly_q[31:0];
                    end
                    3 : begin
                        // poly_address = curr_poly[11:0];
                        // poly_address = 12'h002;
                        curr_poly_we = 1'b1;
                        curr_poly_in = curr_poly_in + 1;
                        p2x_we = 1'b1;
                        p2y_we = 1'b1;
                        p2z_we = 1'b1;
                        p2x_in = poly_q[95:64];
                        p2y_in = poly_q[63:32];
                        p2z_in = poly_q[31:0];
                    end
                    4 : begin
                        p3x_we = 1'b1;
                        p3y_we = 1'b1;
                        p3z_we = 1'b1;
                        p3x_in = poly_q[95:64];
                        p3y_in = poly_q[63:32];
                        p3z_in = poly_q[31:0];
                        next_state = SHADER_CALC;
                    end
                endcase
                if (poly_q[95:64] == 32'hFFFFFFFF) next_state = CLEAR_SCREEN;
            end

            SHADER_CALC : begin
                if (cycle_count == 1) su_start = 1'b1;
                else if (su_done) next_state = TRANSFORM_VERTEX1;
            end

            TRANSFORM_VERTEX1 : begin
                if (cycle_count <= 4) begin
                    proj_start = 1'b1;
                    cam_x = p1x;
                    cam_y = p1y;
                    cam_z = p1z;
                end else if (proj_done) begin
                    p1x_we = 1'b1;
                    p1y_we = 1'b1;
                    p1z_we = 1'b1;
                    p1x_in = ndc_x;
                    p1y_in = ndc_y;
                    p1z_in = ndc_z;
                    next_state = TRANSFORM_VERTEX2;
                end
            end

            TRANSFORM_VERTEX2 : begin
                if (cycle_count <= 4) begin
                    proj_start = 1'b1;
                    cam_x = p2x;
                    cam_y = p2y;
                    cam_z = p2z;
                end else if (proj_done) begin
                    p2x_we = 1'b1;
                    p2y_we = 1'b1;
                    p2z_we = 1'b1;
                    p2x_in = ndc_x;
                    p2y_in = ndc_y;
                    p2z_in = ndc_z;
                    next_state = TRANSFORM_VERTEX3;
                end
            end

            TRANSFORM_VERTEX3 : begin
                if (cycle_count <= 4) begin
                    proj_start = 1'b1;
                    cam_x = p3x;
                    cam_y = p3y;
                    cam_z = p3z;
                end else if (proj_done) begin
                    p3x_we = 1'b1;
                    p3y_we = 1'b1;
                    p3z_we = 1'b1;
                    p3x_in = ndc_x;
                    p3y_in = ndc_y;
                    p3z_in = ndc_z;
                    next_state = RASTER_TRIANGLE;
                end
            end

            WAIT_FOR_VSYNC : begin
                // if (DrawY > 10'd480)
                    next_state = RASTER_TRIANGLE;
            end

            RASTER_TRIANGLE : begin
                if (cycle_count < 5) rast_start = 1'b1;
                else if (rast_done) begin
                    curr_poly_we = 1'b1;
                    curr_poly_in = curr_poly + 1;
                    next_state = READ_VERTICES;
                end
            end

            CLEAR_SCREEN : begin
                curr_poly_we = 1'b1;
                curr_poly_in = 0;
                next_state = READ_VERTICES;
            end

            // RASTER_TRIANGLE2 : begin
            //     rast_color = 4'b1111;

            //     if (cycle_count == 1) begin
            //         p1x_we = 1'b1;
            //         p1y_we = 1'b1;
            //         p1z_we = 1'b1;
            //         p2x_we = 1'b1;
            //         p2y_we = 1'b1;
            //         p2z_we = 1'b1;
            //         p3x_we = 1'b1;
            //         p3y_we = 1'b1;
            //         p3z_we = 1'b1;
            //         p1x_in = 32'h430c0000; // 140.0
            //         p1y_in = 32'h42c80000; // 100.0
            //         p1z_in = 32'h3f000000; // 0.5
            //         p2x_in = 32'h430c0000; // 140.0
            //         p2y_in = 32'h43200000; // 160.0
            //         p2z_in = 32'h3f000000; // 0.5
            //         p3x_in = 32'h433e0000; // 190.0
            //         p3y_in = 32'h42ac0000; // 86.0
            //         p3z_in = 32'h3f000000; // 0.5
            //     end
            //     if (cycle_count == 2) raster_start = 1'b1;
            //     if (cycle_count > 5 && raster_done == 1) next_state = CLEAR_SCREEN;

            //     if (rast_we) wren_a = 1'b1;
            // end
        endcase

    end

    

endmodule