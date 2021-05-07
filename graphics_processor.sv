module graphics_processor(
	input  logic [1:0] Keys,
	input  logic MAX10_CLK1_50,
    output logic VGA_HS,
    output logic VGA_VS,
    output logic [3:0] VGA_R,
    output logic [3:0] VGA_G,
    output logic [3:0] VGA_B
);

	enum {
		HALTED, HALTED_DEBOUNCE, RASTER1, RASTER2, SWAP_BUFFERS
	} state, next_state;

	logic gpu_clk_150;
	logic reset, raster_start, user_key;
	logic [31:0] p1[3], p2[3], p3[3];
	logic raster_done;
	logic [9:0] fb_x, fb_y;
	logic [3:0] fb_data;
	logic fb_we;
	int counter;
	logic buffer_num;
	logic zb_we;
	logic [9:0] zb_x, zb_y;
	logic [16:0] zb_address;
	logic [5:0] zb_wdata, zb_rdata;

	assign reset = ~Keys[0];
	assign user_key = ~Keys[1];

	gpu_pll_75 gpu_clk_gen (.inclk0(MAX10_CLK1_50), .c0(gpu_clk_150));

	z_buffer zbuff (.clk(MAX10_CLK1_50), .w_en(zb_we), .w_addr(zb_address), .w_data(zb_wdata), .r_addr(zb_address), .r_data(zb_rdata));

	address_translator_gpu zbuff_addr (.pixel_x(zb_x), .pixel_y(zb_y), .address(zb_address));

	rasterizer_unit ru (
		.clk(gpu_clk_150),
		.areset(reset),
		.start(raster_start),
		.p1(p1), .p2(p2), .p3(p3),
		.done(raster_done),
		.fb_x(fb_x), .fb_y(fb_y),
		.fb_data(fb_data),
		.fb_we(fb_we),
		.zb_we(zb_we),
		.zb_x(zb_x),
		.zb_y(zb_y),
		.zb_wdata(zb_wdata),
		.zb_rdata(zb_rdata)
	);

	frame_director fb (
		.reset(reset),
		.gpu_x(fb_x),
		.gpu_y(fb_y),
		.gpu_data(fb_data),
		.buffer_select(buffer_num),
		.gpu_we(fb_we),
		.gpu_clk_150(gpu_clk_150),
		.vga_clk_50(MAX10_CLK1_50),
		.vga_r(VGA_R),
		.vga_g(VGA_G),
		.vga_b(VGA_B),
		.vga_hs(VGA_HS),
		.vga_vs(VGA_VS)
	);

	logic [31:0] proj_m [4][4];

	always_comb begin
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
	end

	always_comb begin : SET_CONSTANTS
		// Constant points
		p1[0] = 32'h428a0000; // (69.0, 69.0, 1.0)
		p1[1] = 32'h428a0000;
		p1[2] = 32'h3f800000;

		p2[0] = 32'h428a0000; // (69.0, 169.0, 1.0)
		p2[1] = 32'h43290000;
		p2[2] = 32'h3f800000;

		p3[0] = 32'h43290000; // (169.0, 69.0, 1.0)
		p3[1] = 32'h428a0000;
		p3[2] = 32'h3f800000;
	end

	always_ff @( posedge gpu_clk_150 ) begin : UPDATE_STATE_VAR
		// Update current state
		state <= next_state;
		
		// Update counter if held in state
		if (next_state == state) begin
			counter <= counter + 1;
		end
		else begin
			counter <= 0;
		end

		// Swap buffers based on state
		if (state == SWAP_BUFFERS) begin
			buffer_num = ~buffer_num;
		end
	end

	always_comb begin : SET_NEXT_STATES
		case (state)
			HALTED : begin
				if (user_key == 1'b1)
					next_state = HALTED_DEBOUNCE;
				else
					next_state = HALTED;
			end
			HALTED_DEBOUNCE : begin
				if (user_key == 1'b0)
					next_state = RASTER1;
				else
					next_state = HALTED_DEBOUNCE;
			end
			RASTER1 : begin
				if (counter > 2)
					next_state = RASTER2;
				else
					next_state = RASTER1;
			end
			RASTER2 : begin
				if (raster_done == 1'b1)
					next_state = SWAP_BUFFERS;
				else
					next_state = RASTER2;
			end
			SWAP_BUFFERS : begin
				next_state = HALTED;
			end
		endcase

		case (state)
			HALTED : begin
				raster_start = 1'b0;
			end
			HALTED_DEBOUNCE : begin
				raster_start = 1'b0;
			end
			RASTER1 : begin
				raster_start = 1'b1;
			end
			RASTER2 : begin
				raster_start = 1'b0;
			end
			SWAP_BUFFERS : begin
				raster_start = 1'b0;
			end
		endcase
	end

endmodule