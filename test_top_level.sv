module test_top_level (
    input  logic        MAX10_CLK1_50,
    input  logic [1:0]  Keys,
    output logic        VGA_HS,
    output logic        VGA_VS,
    output logic [3:0]  VGA_R,
    output logic [3:0]  VGA_G,
    output logic [3:0]  VGA_B
);
    logic reset;
    logic gpu_clk_internal, gpu_we, gpu_done, render_man, test_key;
    logic [9:0] gpu_x, gpu_y;
    logic [3:0] gpu_data;

    enum logic [25:0] {
		DRAW, SWAP
	}   state, next_state;		// Internal state logic

    gpu_pll gpu_clk_gen (.areset(1'b0), .inclk0(MAX10_CLK1_50), .c0(gpu_clk_internal));
    frame_director buff (.reset(reset), .gpu_x(gpu_x), .gpu_y(gpu_y), .gpu_data(gpu_data), .gpu_we(gpu_we), .gpu_done(gpu_done), .gpu_clk_150(gpu_clk_internal), .vga_clk_50(MAX10_CLK1_50), .vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B), .vga_hs(VGA_HS), .vga_vs(VGA_VS));

    assign reset = ~Keys[0];
	assign test_key = ~Keys[1];

    always_ff @( posedge gpu_clk_internal ) begin : test_top_ff
        // Increment and reset x
        if (gpu_x == 10'd639) begin
            gpu_x <= 10'b0000000000;
            if (gpu_y == 10'd479) begin
                gpu_y <= 10'b0000000000;
            end else begin
                gpu_y <= gpu_y + 10'b0000000001;
            end
        end else begin
            gpu_x <= gpu_x + 10'b0000000001;
        end
    end

    always_ff @( negedge Keys[1] ) begin : swap_render
        render_man <= ~render_man;
    end

    always_comb begin : test_top_comb
        if (render_man) begin
            gpu_done = 0;
            if ((gpu_x < 10'd160) && (gpu_y < 10'd120)) begin
                gpu_data = 4'b1111;
                gpu_we = 1'b1;
            end else begin
                gpu_data = 4'b0000;
                gpu_we = 1'b0;
            end
        end
        else begin
            gpu_done = 1;
            if (((gpu_x > 10'd320) && (gpu_x < 10'd639)) && (gpu_y < 10'd120)) begin
                gpu_data = 4'b1111;
                gpu_we = 1'b1;
            end else begin
                gpu_data = 4'b0000;
                gpu_we = 1'b0;
            end
        end
    end
endmodule