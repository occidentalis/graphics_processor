module graphics_processor (
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

    enum {
        DONE,
        START,
        READ_VERTICES,
        READ_TETRA_VERTICES,
        CALC_ROT,
        APPLY_ROT1,
        APPLY_ROT2,
        APPLY_ROT3,
        SHADER_CALC,
        APPLY_TRAN1,
        APPLY_TRAN2,
        APPLY_TRAN3,
        TRANSFORM_VERTEX1,
        TRANSFORM_VERTEX2,
        TRANSFORM_VERTEX3,
        WAIT_FOR_VSYNC,
        CLEAR_SCREEN,
        RASTER_TRIANGLE,
        RASTER_TRIANGLE2
    } state, next_state;

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
        .view_vector('{32'h3e715bdd, 32'h3f715bee, 32'h3e715bdd}),
        .color(su_color), .done(su_done)
    );

    logic mvm_start, mvm_done;
    logic [31:0] vec_in_x, vec_in_y, vec_in_z, vec_out_x, vec_out_y, vec_out_z;
    logic [31:0] mvm_m[4][4];
    mat_vec_multiply mvm0 (
        .clk(clk), .start(mvm_start), .done(mvm_done),
        .x(vec_in_x), .y(vec_in_y), .z(vec_in_z), .m(mvm_m),
        .x_out(vec_out_x), .y_out(vec_out_y), .z_out(vec_out_z)
    );

    // logic mmm_start;
    // logic [31:0] mmm_a[4][4];
    // logic [31:0] mmm_b[4][4];
    // logic [31:0] mmm_c[4][4];
    // mat_mat_multiply mmm0 (
    //     .clk(clk), .start(mmm_start),
    //     .a(mmm_a), .b(mmm_b), .c(mmm_c)
    // );

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

    logic [16:0] clear_write;
    logic [3:0] vga_data;
    always_comb begin : FB_READ_WRITE_CONTROL
        fb_wraddress = state == CLEAR_SCREEN ? clear_write : write_pixel_addr;
        zb_wraddress = state == CLEAR_SCREEN ? clear_write : write_pixel_addr;
        fb_rdaddress = read_pixel_addr;
        fb_data = state == CLEAR_SCREEN ? clear_write[3:0] : su_color;
        zb_data = state == CLEAR_SCREEN ? 8'hFF : rast_zb_wdata;
        rast_zb_rdata = zb_q;
        fb_we = state == CLEAR_SCREEN | rast_fb_we;
        zb_we = state == CLEAR_SCREEN | rast_zb_we;
        poly_address = curr_poly[11:0];

        if (~blank) // active low
            vga_data = 4'b0000;
        else
            vga_data = fb_q;
    end

    assign VGA_R = vga_data;
    assign VGA_G = vga_data;
    assign VGA_B = vga_data;

    logic angle_we;
    logic [31:0] angle_in, angle;
    reg_32 angle_reg(.clk(clk), .write_en(angle_we), .reset(reset), .data_in(angle_in), .data_out(angle));

    logic [31:0] cos_a, cos_q;
    fp_cos fpu0(.clk(clk), .areset(reset), .a(cos_a), .q(cos_q));

    logic [31:0] sin_a, sin_q;
    fp_sin fpu1(.clk(clk), .areset(reset), .a(sin_a), .q(sin_q));

    logic [31:0] addsub_a, addsub_b, addsub_q, addsub_s;
    fp_add_sub fpu3(.clk(clk), .areset(reset), .a(addsub_a), .b(addsub_b), .q(addsub_q), .s(addsub_s));

    logic cos_res_we, sin_res_we;
    logic [31:0] cos_res_in, sin_res_in, cos_res, sin_res;
    reg_32 cos_res_reg(.clk(clk), .write_en(cos_res_we), .reset(reset), .data_in(cos_res_in), .data_out(cos_res));
    reg_32 sin_res_reg(.clk(clk), .write_en(sin_res_we), .reset(reset), .data_in(sin_res_in), .data_out(sin_res));

    logic [31:0] pyramid[4][3][3];
    assign pyramid[0] = '{ '{32'hc1700000, 32'h00000000, 32'h4129b4a2},   // -15,   0, -29.39
                           '{32'h41700000, 32'h00000000, 32'h4129b4a2},   //  15,   0, -29.39
                           '{32'h00000000, 32'h41700000, 32'hc129b4a2} }; //   0,  15, -50.61
    assign pyramid[1] = '{ '{32'hc1700000, 32'h00000000, 32'h4129b4a2},   // -15,   0, -29.39
                           '{32'h00000000, 32'hc1700000, 32'hc129b4a2},   //   0, -15, -50.61
                           '{32'h41700000, 32'h00000000, 32'h4129b4a2} }; //  15,   0, -29.39
    assign pyramid[2] = '{ '{32'hc1700000, 32'h00000000, 32'h4129b4a2},   // -15,   0, -29.39
                           '{32'h00000000, 32'h41700000, 32'hc129b4a2},   //   0,  15, -50.61
                           '{32'h00000000, 32'hc1700000, 32'hc129b4a2} }; //   0, -15, -50.61
    assign pyramid[3] = '{ '{32'h41700000, 32'h00000000, 32'h4129b4a2},   //  15,   0, -29.39
                           '{32'h00000000, 32'hc1700000, 32'hc129b4a2},   //   0, -15, -50.61
                           '{32'h00000000, 32'h41700000, 32'hc129b4a2} }; //   0,  15, -50.61
                                        
    logic [31:0] proj_m[4][4];
    logic [31:0] tran_m[4][4];
    logic [31:0] rot_m[4][4];
    logic [31:0] obj_to_world_m[4][4];
    
    // assign obj_to_world_m = mmm_c;

    logic c00_we, c01_we, c02_we, c03_we;
    logic c10_we, c11_we, c12_we, c13_we;
    logic c20_we, c21_we, c22_we, c23_we;
    logic c30_we, c31_we, c32_we, c33_we;
    logic [31:0] c00_in, c01_in, c02_in, c03_in;
    logic [31:0] c10_in, c11_in, c12_in, c13_in;
    logic [31:0] c20_in, c21_in, c22_in, c23_in;
    logic [31:0] c30_in, c31_in, c32_in, c33_in;
    logic [31:0] c00, c01, c02, c03;
    logic [31:0] c10, c11, c12, c13;
    logic [31:0] c20, c21, c22, c23;
    logic [31:0] c30, c31, c32, c33;
    reg_32 c00_reg(.clk(clk), .write_en(c00_we), .reset(reset), .data_in(c00_in), .data_out(c00));
    reg_32 c01_reg(.clk(clk), .write_en(c01_we), .reset(reset), .data_in(c01_in), .data_out(c01));
    reg_32 c02_reg(.clk(clk), .write_en(c02_we), .reset(reset), .data_in(c02_in), .data_out(c02));
    reg_32 c03_reg(.clk(clk), .write_en(c03_we), .reset(reset), .data_in(c03_in), .data_out(c03));
    reg_32 c10_reg(.clk(clk), .write_en(c10_we), .reset(reset), .data_in(c10_in), .data_out(c10));
    reg_32 c11_reg(.clk(clk), .write_en(c11_we), .reset(reset), .data_in(c11_in), .data_out(c11));
    reg_32 c12_reg(.clk(clk), .write_en(c12_we), .reset(reset), .data_in(c12_in), .data_out(c12));
    reg_32 c13_reg(.clk(clk), .write_en(c13_we), .reset(reset), .data_in(c13_in), .data_out(c13));
    reg_32 c20_reg(.clk(clk), .write_en(c20_we), .reset(reset), .data_in(c20_in), .data_out(c20));
    reg_32 c21_reg(.clk(clk), .write_en(c21_we), .reset(reset), .data_in(c21_in), .data_out(c21));
    reg_32 c22_reg(.clk(clk), .write_en(c22_we), .reset(reset), .data_in(c22_in), .data_out(c22));
    reg_32 c23_reg(.clk(clk), .write_en(c23_we), .reset(reset), .data_in(c23_in), .data_out(c23));
    reg_32 c30_reg(.clk(clk), .write_en(c30_we), .reset(reset), .data_in(c30_in), .data_out(c30));
    reg_32 c31_reg(.clk(clk), .write_en(c31_we), .reset(reset), .data_in(c31_in), .data_out(c31));
    reg_32 c32_reg(.clk(clk), .write_en(c32_we), .reset(reset), .data_in(c32_in), .data_out(c32));
    reg_32 c33_reg(.clk(clk), .write_en(c33_we), .reset(reset), .data_in(c33_in), .data_out(c33));

    assign rot_m[0][0] = c00;
    assign rot_m[1][0] = c01;
    assign rot_m[2][0] = c02;
    assign rot_m[3][0] = c03;
    assign rot_m[0][1] = c10;
    assign rot_m[1][1] = c11;
    assign rot_m[2][1] = c12;
    assign rot_m[3][1] = c13;
    assign rot_m[0][2] = c20;
    assign rot_m[1][2] = c21;
    assign rot_m[2][2] = c22;
    assign rot_m[3][2] = c23;
    assign rot_m[0][3] = c30;
    assign rot_m[1][3] = c31;
    assign rot_m[2][3] = c32;
    assign rot_m[3][3] = c33;

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

        tran_m[0][0] = 32'h3f800000;
		tran_m[1][0] = 32'b0;
		tran_m[2][0] = 32'b0;
		tran_m[3][0] = 32'h0;
		tran_m[0][1] = 32'b0;
		tran_m[1][1] = 32'h3f800000;
		tran_m[2][1] = 32'b0;
		tran_m[3][1] = 32'h0;
		tran_m[0][2] = 32'b0;
		tran_m[1][2] = 32'b0;
		tran_m[2][2] = 32'h3f800000;
		tran_m[3][2] = 32'hc2200000;
		tran_m[0][3] = 32'b0;
		tran_m[1][3] = 32'b0;
		tran_m[2][3] = 32'h0;
		tran_m[3][3] = 32'h3f800000;
        
        reset = 1'b0;
        rast_start = 1'b0;
        rast_color = 4'b0000;
        su_start = 1'b0;
        mvm_start = 1'b0;
        vec_in_x = 32'b0;
        vec_in_y = 32'b0;
        vec_in_z = 32'b0;
        curr_poly_we = 1'b0;
        curr_poly_in = 0;
        addsub_a = 32'b0;
        addsub_b = 32'b0;
        // poly_address = 12'b0;

        c00_we = 1'b0;
        c01_we = 1'b0;
        c02_we = 1'b0;
        c03_we = 1'b0;
        c10_we = 1'b0;
        c11_we = 1'b0;
        c12_we = 1'b0;
        c13_we = 1'b0;
        c20_we = 1'b0;
        c21_we = 1'b0;
        c22_we = 1'b0;
        c23_we = 1'b0;
        c30_we = 1'b0;
        c31_we = 1'b0;
        c32_we = 1'b0;
        c33_we = 1'b0;

        c00_in = cos_res;
        c01_in = 32'b0;
        c02_in = sin_res;
        c03_in = 32'b0;
        c10_in = sin_res;
        c11_in = addsub_q;
        c12_in = 32'b0;
        c13_in = 32'b0;
        c20_in = sin_res[31] ? {1'b0, sin_res[30:0]} : {1'b1, sin_res[30:0]};
        c21_in = 32'b0;
        c22_in = cos_res;
        c23_in = 32'b0;
        c30_in = 32'b0;
        c31_in = 32'b0;
        c32_in = 32'b0;
        c33_in = 32'h3f800000;

        cos_a = 32'b0;
        sin_a = 32'b0;

        cos_res_we = 1'b0;
        sin_res_we = 1'b0;
        cos_res_in = cos_q;
        sin_res_in = sin_q;
        mvm_m = obj_to_world_m;

        angle_we = 1'b0;
        angle_in = 32'h3f060a96; // 32'h3f060a96

        clear_write = 17'b0;
        
        case (state)
            DONE : begin
                next_state = START;
            end

            START : begin
                next_state = READ_TETRA_VERTICES;
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

            READ_TETRA_VERTICES : begin
                p1x_we = 1'b1;
                p1y_we = 1'b1;
                p2x_we = 1'b1;
                p1z_we = 1'b1;
                p2y_we = 1'b1;
                p2z_we = 1'b1;
                p3x_we = 1'b1;
                p3y_we = 1'b1;
                p3z_we = 1'b1;
                p1x_in = pyramid[curr_poly][0][0];
                p1y_in = pyramid[curr_poly][0][1];
                p1z_in = pyramid[curr_poly][0][2];
                p2x_in = pyramid[curr_poly][1][0];
                p2y_in = pyramid[curr_poly][1][1];
                p2z_in = pyramid[curr_poly][1][2];
                p3x_in = pyramid[curr_poly][2][0];
                p3y_in = pyramid[curr_poly][2][1];
                p3z_in = pyramid[curr_poly][2][2];
                curr_poly_we = 1'b1;
                if (curr_poly == 3) begin
                    curr_poly_in = 0;
                end else begin
                    curr_poly_in = curr_poly + 1;
                end
                next_state = CALC_ROT;
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

            CALC_ROT : begin
                case (cycle_count)
                    1 : begin
                        cos_a = angle;
                        sin_a = angle;
                    end
                    9 : begin
                        cos_res_we = 1'b1;
                        sin_res_we = 1'b1;
                        cos_res_in = cos_q;
                        sin_res_in = sin_q;
                        addsub_a = 32'h3f800000;
                        addsub_b = cos_q;
                    end
                    11 : begin
                        c00_we = 1'b1;
                        c01_we = 1'b1;
                        c02_we = 1'b1;
                        c03_we = 1'b1;
                        c10_we = 1'b1;
                        c11_we = 1'b1;
                        c12_we = 1'b1;
                        c13_we = 1'b1;
                        c20_we = 1'b1;
                        c21_we = 1'b1;
                        c22_we = 1'b1;
                        c23_we = 1'b1;
                        c30_we = 1'b1;
                        c31_we = 1'b1;
                        c32_we = 1'b1;
                        c33_we = 1'b1;

                        c00_in = cos_res;
                        c01_in = 32'b0;
                        c02_in = sin_res;
                        c03_in = 32'b0;
                        c10_in = sin_res;
                        c11_in = addsub_q;
                        c12_in = 32'b0;
                        c13_in = 32'b0;
                        c20_in = sin_res[31] ? {1'b0, sin_res[30:0]} : {1'b1, sin_res[30:0]};
                        c21_in = 32'b0;
                        c22_in = cos_res;
                        c23_in = 32'b0;
                        c30_in = 32'b0;
                        c31_in = 32'b0;
                        c32_in = 32'b0;
                        c33_in = 32'h3f800000;

                        next_state = APPLY_ROT1;
                    end
                endcase
            end

            APPLY_ROT1 : begin
                mvm_m = rot_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p1x;
                    vec_in_y = p1y;
                    vec_in_z = p1z;
                end else if (mvm_done) begin
                    p1x_we = 1'b1;
                    p1y_we = 1'b1;
                    p1z_we = 1'b1;
                    p1x_in = vec_out_x;
                    p1y_in = vec_out_y;
                    p1z_in = vec_out_z;
                    next_state = APPLY_ROT2;
                end
            end

            APPLY_ROT2 : begin
                mvm_m = rot_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p2x;
                    vec_in_y = p2y;
                    vec_in_z = p2z;
                end else if (mvm_done) begin
                    p2x_we = 1'b1;
                    p2y_we = 1'b1;
                    p2z_we = 1'b1;
                    p2x_in = vec_out_x;
                    p2y_in = vec_out_y;
                    p2z_in = vec_out_z;
                    next_state = APPLY_ROT3;
                end
            end

            APPLY_ROT3 : begin
                mvm_m = rot_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p3x;
                    vec_in_y = p3y;
                    vec_in_z = p3z;
                end else if (mvm_done) begin
                    p3x_we = 1'b1;
                    p3y_we = 1'b1;
                    p3z_we = 1'b1;
                    p3x_in = vec_out_x;
                    p3y_in = vec_out_y;
                    p3z_in = vec_out_z;
                    next_state = SHADER_CALC;
                end
            end

            SHADER_CALC : begin
                if (cycle_count == 1) su_start = 1'b1;
                else if (su_done) next_state = APPLY_TRAN1;
            end

            APPLY_TRAN1 : begin
                mvm_m = tran_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p1x;
                    vec_in_y = p1y;
                    vec_in_z = p1z;
                end else if (mvm_done) begin
                    p1x_we = 1'b1;
                    p1y_we = 1'b1;
                    p1z_we = 1'b1;
                    p1x_in = vec_out_x;
                    p1y_in = vec_out_y;
                    p1z_in = vec_out_z;
                    next_state = APPLY_TRAN2;
                end
            end

            APPLY_TRAN2 : begin
                mvm_m = tran_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p2x;
                    vec_in_y = p2y;
                    vec_in_z = p2z;
                end else if (mvm_done) begin
                    p2x_we = 1'b1;
                    p2y_we = 1'b1;
                    p2z_we = 1'b1;
                    p2x_in = vec_out_x;
                    p2y_in = vec_out_y;
                    p2z_in = vec_out_z;
                    next_state = APPLY_TRAN3;
                end
            end

            APPLY_TRAN3 : begin
                mvm_m = tran_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p3x;
                    vec_in_y = p3y;
                    vec_in_z = p3z;
                end else if (mvm_done) begin
                    p3x_we = 1'b1;
                    p3y_we = 1'b1;
                    p3z_we = 1'b1;
                    p3x_in = vec_out_x;
                    p3y_in = vec_out_y;
                    p3z_in = vec_out_z;
                    next_state = TRANSFORM_VERTEX1;
                end
            end

            TRANSFORM_VERTEX1 : begin
                mvm_m = proj_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p1x;
                    vec_in_y = p1y;
                    vec_in_z = p1z;
                end else if (mvm_done) begin
                    p1x_we = 1'b1;
                    p1y_we = 1'b1;
                    p1z_we = 1'b1;
                    p1x_in = vec_out_x;
                    p1y_in = vec_out_y;
                    p1z_in = vec_out_z;
                    next_state = TRANSFORM_VERTEX2;
                end
            end

            TRANSFORM_VERTEX2 : begin
                mvm_m = proj_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p2x;
                    vec_in_y = p2y;
                    vec_in_z = p2z;
                end else if (mvm_done) begin
                    p2x_we = 1'b1;
                    p2y_we = 1'b1;
                    p2z_we = 1'b1;
                    p2x_in = vec_out_x;
                    p2y_in = vec_out_y;
                    p2z_in = vec_out_z;
                    next_state = TRANSFORM_VERTEX3;
                end
            end

            TRANSFORM_VERTEX3 : begin
                mvm_m = proj_m;
                if (cycle_count <= 4) begin
                    mvm_start = 1'b1;
                    vec_in_x = p3x;
                    vec_in_y = p3y;
                    vec_in_z = p3z;
                end else if (mvm_done) begin
                    p3x_we = 1'b1;
                    p3y_we = 1'b1;
                    p3z_we = 1'b1;
                    p3x_in = vec_out_x;
                    p3y_in = vec_out_y;
                    p3z_in = vec_out_z;
                    next_state = RASTER_TRIANGLE;
                end
            end


            RASTER_TRIANGLE : begin
                if (cycle_count < 5) rast_start = 1'b1;
                else if (rast_done) begin
                    if (curr_poly == 0)
                        next_state = WAIT_FOR_VSYNC;
                    else
                        next_state = READ_TETRA_VERTICES;
                end
                case (cycle_count)
                    1 : begin
                        addsub_a = angle;
                        addsub_b = 32'h38d1b717;
                    end
                    3 : begin
                        angle_we = 1'b1;
                        angle_in = addsub_q;
                    end
                endcase
            end

            WAIT_FOR_VSYNC : begin
                 if (DrawY >= 10'd480)
                    next_state = CLEAR_SCREEN;
            end

            CLEAR_SCREEN : begin
                clear_write = cycle_count - 1;
                if (cycle_count == 76800)
                    next_state = READ_TETRA_VERTICES;
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