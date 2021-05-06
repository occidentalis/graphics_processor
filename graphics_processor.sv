module graphics_processor(
	input  logic MAX10_CLK1_50,
    output logic VGA_HS,
    output logic VGA_VS,
    output logic [3:0] VGA_R,
    output logic [3:0] VGA_G,
    output logic [3:0] VGA_B
);

	enum {
		RENDER, NOT_RENDER
	} state, next_state;

	logic gpu_clk_150;
	logic reset, raster_start;
	logic [31:0] p1[3], p2[3], p3[3];
	logic raster_done;
	logic [9:0] fb_x, fb_y;
	logic [3:0] fb_data;
	logic fb_we;

	gpu_pll gpu_clk_gen (.areset(1'b0), .inclk0(MAX10_CLK1_50), .c0(gpu_clk_150));

	rasterizer_unit ru (
		.clk(gpu_clk_150),
		.areset(reset),
		.start(raster_start),
		.p1(p1), .p2(p2), .p3(p3),
		.done(raster_done),
		.fb_x(fb_x), .fb_y(fb_y),
		.data(fb_data),
		.fb_we(fb_we)
	);

	frame_buffer_top fb (
		.reset(reset),
		.gpu_x(fb_x),
		.gpu_y(fb_y),
		.gpu_data(fb_data),
		.gpu_we(fb_we),
		.gpu_clk_150(gpu_clk_150),
		.vga_clk_50(MAX10_CLK1_50),
		.vga_r(VGA_R),
		.vga_g(VGA_G),
		.vga_b(VGA_B),
		.vga_hs(VGA_HS),
		.vga_vs(VGA_VS)
	);

	initial begin
		state = RENDER;

		p1[0] = 32'h428a0000;
		p1[1] = 32'h428a0000;
		p1[2] = 32'h3f800000;

		p2[0] = 32'h43290000;
		p2[1] = 32'h428a0000;
		p2[2] = 32'h3f800000;

		p3[0] = 32'h428a0000;
		p3[1] = 32'h43290000;
		p3[2] = 32'h3f800000;
	end

	int cycle_count = 1;
	always_ff @(posedge gpu_clk_150) begin : blockName
		if (state == next_state)
			cycle_count <= cycle_count + 1;
		else 
			cycle_count <= 1;

		state <= next_state;
	end

	always_comb begin

		next_state = state;

		raster_start = 1'b1;

	end
endmodule