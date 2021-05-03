module rasterizer_unit (
	input logic clk, reset, start,
	input logic [31:0] p1[3], p2[3], p3[3], // in raster coordinates
	input logic [31:0] near_clip_z, far_clip_z,
	output logic done,
	output logic [9:0] fb_x,
	output logic [8:0] fb_y,
	output logic [3:0] data,
	output logic fb_we
);

enum {
	START,
	TO_INT10, TO_INT11, TO_INT20, TO_INT21, TO_INT30, TO_INT31,
	GET_BOUNDS,
	RASTER,
	DONE
} state, next_state;

logic [31:0] a; // floating point
logic [31:0] q; // unsigned integer
fp_to_int fpu0(.clk(clk), .areset(reset), .a(a), .q(q));

logic p1x_we, p1y_we, p2x_we, p2y_we, p3x_we, p3y_we;
logic [31:0] p1x, p1y, p2x, p2y, p3x, p3y;
reg_32 p1x_reg(.clk(clk), .write_en(p1x_we), .reset(reset), .data_in(q), .data_out(p1x));
reg_32 p1y_reg(.clk(clk), .write_en(p1y_we), .reset(reset), .data_in(q), .data_out(p1y));
reg_32 p2x_reg(.clk(clk), .write_en(p2x_we), .reset(reset), .data_in(q), .data_out(p2x));
reg_32 p2y_reg(.clk(clk), .write_en(p2y_we), .reset(reset), .data_in(q), .data_out(p2y));
reg_32 p3x_reg(.clk(clk), .write_en(p3x_we), .reset(reset), .data_in(q), .data_out(p3x));
reg_32 p4y_reg(.clk(clk), .write_en(p4y_we), .reset(reset), .data_in(q), .data_out(p3y));

logic rx_we, ty_we, lx_we, by_we;
logic [31:0] rx_in, ty_in, lx_in, by_in, rx, ty, lx, by;
reg_32 rx_reg(.clk(clk), .write_en(rx_we), .reset(reset), .data_in(rx_in), .data_out(rx));
reg_32 ty_reg(.clk(clk), .write_en(ty_we), .reset(reset), .data_in(ty_in), .data_out(ty));
reg_32 lx_reg(.clk(clk), .write_en(lx_we), .reset(reset), .data_in(lx_in), .data_out(lx));
reg_32 by_reg(.clk(clk), .write_en(by_we), .reset(reset), .data_in(by_in), .data_out(by));

initial begin
	state = DONE;
end

int cycle_count = 1;
always_ff @(posedge clk) begin
	if (state == next_state)
		cycle_count <= cycle_count + 1;
	else
		cycle_count <= 1;

	state <= next_state;
end

always_comb begin
	
	next_state = state;

	unique case (state)

		START : begin
			
		end

		TO_INT10 : begin
				next_state = TO_INT11;
		end

		TO_INT11 : begin
				next_state = TO_INT20;
		end

		TO_INT20 : begin
				next_state = TO_INT21;
		end

		TO_INT21 : begin
				next_state = TO_INT30;
		end

		TO_INT30 : begin
				next_state = TO_INT31;
		end

		TO_INT31 : begin
				next_state = GET_BOUNDS;
		end

		DONE : begin
			
		end
	endcase

	unique case (state)
		START : begin
			
		end

		TO_INT10 : begin
			a = p1[0];
		end

		TO_INT11 : begin
			a = p1[1];
		end

		TO_INT20 : begin
			p1x_we = 1'b1;
			a = p2[0];
		end

		TO_INT21 : begin
			p1y_we = 1'b1;
			a = p2[1]'
		end

		TO_INT30 : begin
			p2x_we = 1'b1;
			a = p3[0];
		end

		TO_INT31 : begin
			p2y_we = 1'b1;
			a = p3[1];
		end

		TO_INT_WAIT : begin
			case (cycle_count)
				1 : p3x_we = 1'b1;
				2 : p3y_we = 1'b1;
			endcase
		end

		GET_BOUNDS : begin

			rx_we = 1'b1;
			ty_we = 1'b1;
			lx_we = 1'b1;
			by_we = 1'b1;

			if (p1x <= p2x) begin 				// p1 top of p2
				if (p1x <= p3x) lx_in = p1x; 		// p1 top of p3
				else lx_in = p3x; 					// p3 top of p1
				if (p2x <= p3x) rx_in = p3x; 		// p3 right of p2
				else rx_in = p2x; 					// p2 right of p3
			end else begin 						// p1 right of p2
				if (p3x <= p1x) rx_in = p1x; 		// p1 right of p3
				else rx_in = p3x; 					// p3 right of p1
				if (p3x <= p2x) lx_in = p3x;		// p3 top of p2
				else lx_in = p2x;					// p2 top of p3
			end
			
			if (p1y <= p2y) begin 				// p1 top of p2
				if (p1y <= p3y) ty_in = p1y; 		// p1 top of p3
				else ty_in = p3y; 					// p3 top of p1
				if (p2y <= p3y) by_in = p3y; 		// p3 bottom of p2
				else by_in = p2y; 					// p2 bottom of p3
			end else begin 						// p1 bottom of p2
				if (p3y <= p1y) by_in = p1y; 		// p1 bottom of p3
				else by_in = p3y; 					// p3 bottom of p1
				if (p3y <= p2y) ty_in = p3y;		// p3 top of p2
				else ty_in = p2y;					// p2 top of p3
			end

		end

		RASTER : begin
			
		end


		DONE : begin
			
		end
	endcase
end

endmodule