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
	logic [31:0] p1[3], p2[3], p3[3], p4[3], p5[3], p6[3];
	logic [31:0] pru1[3], pru2[3], pru3[3];
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

	z_buffer zbuff (.clk(MAX10_CLK1_50), .w_en(zb_we), .w_addr(zb_address), .w_data(zb_wdata), .r_addr(zb_address), .r_data(zb_rdata));

	address_translator_gpu zbuff_addr (.pixel_x(zb_x), .pixel_y(zb_y), .address(zb_address));

	rasterizer_unit ru (
		.clk(MAX10_CLK1_50),
		.areset(reset),
		.start(raster_start),
		.p1(pru1), .p2(pru2), .p3(pru3),
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
		.gpu_clk_150(MAX10_CLK1_50),
		.vga_clk_50(MAX10_CLK1_50),
		.vga_r(VGA_R),
		.vga_g(VGA_G),
		.vga_b(VGA_B),
		.vga_hs(VGA_HS),
		.vga_vs(VGA_VS)
	);

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

		// Constant points
		p4[0] = 32'h438c0000; // (280.0, 69.0, 1.0)
		p4[1] = 32'h328a0000;
		p4[2] = 32'h3f800000;

		p5[0] = 32'h42280000; // (42.0, 69.0, 1.0)
		p5[1] = 32'h328a0000;
		p5[2] = 32'h3f800000;

		p6[0] = 32'h42600000; // (56.0, 169.0, 1.0)
		p6[1] = 32'h33290000;
		p6[2] = 32'h3f800000;
	end

	always_ff @( posedge MAX10_CLK1_50 ) begin : UPDATE_STATE_VAR
		if (state != SWAP_BUFFERS) begin
		// Update current state
		state <= next_state;	
		end else begin
			if (VGA_VS == 1'b0) begin
				buffer_num = ~buffer_num;
				state <= next_state;
			end
		end
		
		// Update counter if held in state
		if (next_state == state) begin
			counter <= counter + 1;
		end
		else begin
			counter <= 0;
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

		case (buffer_num)
			1'b0 : begin
					pru1 = p1;
					pru2 = p2;
					pru3 = p3;
			end
			1'b1 : begin
					pru1 = p4;
					pru2 = p5;
					pru3 = p6;
			end 
		endcase
	end

endmodule