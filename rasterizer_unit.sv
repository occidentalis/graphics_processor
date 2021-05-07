module rasterizer_unit (
	input logic clk, areset, start,
	input logic [31:0] p1[3], p2[3], p3[3], // in raster coordinates
	input logic [31:0] near_clip_z, far_clip_z,
	output logic done,
	output logic [9:0] fb_x,
	output logic [9:0] fb_y,
	output logic [3:0] data,
	output logic fb_we
);

enum {
	DONE,
	START,
	TO_INT10, TO_INT11, TO_INT20, TO_INT21, TO_INT30, TO_INT31, TO_INT_WAIT,
	INT_CONVERSION,
	GET_BOUNDS, INIT_XY,
	CALC_EDGES,
	EDGE_CHECK,
	Z_CHECK,
	RASTER
} state, next_state;

logic reset;

logic [31:0] a0; // floating point
logic [31:0] q0; // unsigned integer
fp_to_int fpu0(.clk(clk), .areset(reset), .a(a0), .q(q0));

logic [31:0] a1, b1, q1, s1;
fp_addsub fpu1(.clk(clk), .areset(reset), .a(a1), .b(b1), .q(q1), .s(s1));

logic [31:0] a2, b2, q2;
fp_mul fpu2(.clk(clk), .areset(reset), .a(a2), .b(b2), .q(q2));

logic p1x_we, p1y_we, p2x_we, p2y_we, p3x_we, p3y_we;
logic [31:0] p1x, p1y, p2x, p2y, p3x, p3y;
reg_32 p1x_reg(.clk(clk), .write_en(p1x_we), .reset(reset), .data_in(q0), .data_out(p1x));
reg_32 p1y_reg(.clk(clk), .write_en(p1y_we), .reset(reset), .data_in(q0), .data_out(p1y));
reg_32 p2x_reg(.clk(clk), .write_en(p2x_we), .reset(reset), .data_in(q0), .data_out(p2x));
reg_32 p2y_reg(.clk(clk), .write_en(p2y_we), .reset(reset), .data_in(q0), .data_out(p2y));
reg_32 p3x_reg(.clk(clk), .write_en(p3x_we), .reset(reset), .data_in(q0), .data_out(p3x));
reg_32 p3y_reg(.clk(clk), .write_en(p3y_we), .reset(reset), .data_in(q0), .data_out(p3y));

logic rx_we, ty_we, lx_we, by_we;
logic [31:0] rx_in, ty_in, lx_in, by_in, rx, ty, lx, by;
reg_32 rx_reg(.clk(clk), .write_en(rx_we), .reset(reset), .data_in(rx_in), .data_out(rx)); // right boundary
reg_32 ty_reg(.clk(clk), .write_en(ty_we), .reset(reset), .data_in(ty_in), .data_out(ty)); // top boundary
reg_32 lx_reg(.clk(clk), .write_en(lx_we), .reset(reset), .data_in(lx_in), .data_out(lx)); // left boundary
reg_32 by_reg(.clk(clk), .write_en(by_we), .reset(reset), .data_in(by_in), .data_out(by)); // bottom boundary

logic curr_x_we, curr_y_we, x_inc_we;
logic [31:0] curr_x_in, curr_y_in, x_inc_in, curr_x, curr_y, x_inc;
reg_32 curr_x_reg(.clk(clk), .write_en(curr_x_we), .reset(reset), .data_in(curr_x_in), .data_out(curr_x));
reg_32 curr_y_reg(.clk(clk), .write_en(curr_y_we), .reset(reset), .data_in(curr_y_in), .data_out(curr_y));
reg_32 x_inc_reg(.clk(clk), .write_en(x_inc_we), .reset(reset), .data_in(x_inc_in), .data_out(x_inc));

logic dx1_we, dy1_we, dx2_we, dy2_we, dx3_we, dy3_we;
logic [31:0] dx1_in, dy1_in, dx2_in, dy2_in, dx3_in, dy3_in;
logic [31:0] dx1, dy1, dx2, dy2, dx3, dy3;
reg_32 dx1_reg(.clk(clk), .write_en(dx1_we), .reset(reset), .data_in(dx1_in), .data_out(dx1)); // dXi = Xi - X[i-1]
reg_32 dy1_reg(.clk(clk), .write_en(dy1_we), .reset(reset), .data_in(dy1_in), .data_out(dy1));
reg_32 dx2_reg(.clk(clk), .write_en(dx2_we), .reset(reset), .data_in(dx2_in), .data_out(dx2));
reg_32 dy2_reg(.clk(clk), .write_en(dy2_we), .reset(reset), .data_in(dy2_in), .data_out(dy2));
reg_32 dx3_reg(.clk(clk), .write_en(dx3_we), .reset(reset), .data_in(dx3_in), .data_out(dx3));
reg_32 dy3_reg(.clk(clk), .write_en(dy3_we), .reset(reset), .data_in(dy3_in), .data_out(dy3));

logic e1_we, e2_we, e3_we;
logic [31:0] e1_in, e2_in, e3_in, e1, e2, e3;
reg_32 e1_reg(.clk(clk), .write_en(e1_we), .reset(reset), .data_in(e1_in), .data_out(e1)); // Ei(x, y) = (x - Xi)dYi - (y - Yi)dXi
reg_32 e2_reg(.clk(clk), .write_en(e2_we), .reset(reset), .data_in(e2_in), .data_out(e2)); // Ei(x+1, y) = Ei(x, y) + dYi
reg_32 e3_reg(.clk(clk), .write_en(e3_we), .reset(reset), .data_in(e3_in), .data_out(e3));



logic temp_we;
logic [31:0] temp_in, temp;
reg_32 temp_reg(.clk(clk), .write_en(temp_we), .reset(reset), .data_in(temp_in), .data_out(temp));

initial begin

end

int cycle_count = 1;
always_ff @(posedge clk) begin
	if (state == next_state)
		cycle_count <= cycle_count + 1;
	else
		cycle_count <= 1;

	if (areset == 1)
		state <= DONE;
	else
		state <= next_state;
end

always_comb begin

	reset = 1'b0;
	done = 1'b0;
	fb_x = 10'b0;
	fb_y = 10'b0;
	data = 4'b0;
	fb_we = 1'b0;
	a0 = 32'b0;
	a1 = 32'b0;
	b1 = 32'b0;
	a2 = 32'b0;
	b2 = 32'b0;
	p1x_we = 1'b0;
	p1y_we = 1'b0;
	p2x_we = 1'b0;
	p2y_we = 1'b0;
	p3x_we = 1'b0;
	p3y_we = 1'b0;
	rx_we = 1'b0;
	ty_we = 1'b0;
	lx_we = 1'b0;
	by_we = 1'b0;
	rx_in = 32'b0;
	ty_in = 32'b0;
	lx_in = 32'b0;
	by_in = 32'b0;
	curr_x_we = 1'b0;
	curr_y_we = 1'b0;
	x_inc_we = 1'b0;
	curr_x_in = 32'b0;
	curr_y_in = 32'b0;
	x_inc_in = 32'b0;
	dx1_we = 1'b0;
	dy1_we = 1'b0;
	dx2_we = 1'b0;
	dy2_we = 1'b0;
	dx3_we = 1'b0;
	dy3_we = 1'b0;
	dx1_in = 32'b0;
	dy1_in = 32'b0;
	dx2_in = 32'b0;
	dy2_in = 32'b0;
	dx3_in = 32'b0;
	dy3_in = 32'b0;
	e1_we = 1'b0;
	e2_we = 1'b0;
	e3_we = 1'b0;
	e1_in = 32'b0;
	e2_in = 32'b0;
	e3_in = 32'b0;
	temp_we = 1'b0;
	temp_in = 32'b0;
	
	next_state = state;

	unique case (state)

		START : begin
			next_state = TO_INT10;
		end

		GET_BOUNDS : begin
			next_state = SET_START;
		end

		SET_START : begin
			next_state = FIRST_CHECK;
		end

		FIRST_CHECK : begin
			if (cycle_count == 35)
				next_state = RASTER;
		end

		RASTER : begin
			if (done == 1)
				next_state = DONE;
		end

		DONE : begin
			if (start == 1)
				next_state = START;
		end
	endcase

	unique case (state)
		START : begin
			reset = 1'b1;
		end

		INT_CONVERSION : begin
			case (cycle_count)
				1 : a0 = p1[0];
				2 : a0 = p1[1];
				3 : a0 = p2[0];
				4 : begin
					a0 = p2[1];
					p1x_we = 1;
				end
				5 : begin
					a0 = p3[0];
					p1y_we = 1;
				end
				6 : begin
					a0 = p3[1];
					p2x_we = 1;
				end
				7 : p2y_we = 1;
				8 : p3x_we = 1;
				9 : p3y_we = 1;
			endcase
		end

		GET_BOUNDS : begin
			rx_we = 1'b1;
			ty_we = 1'b1;
			lx_we = 1'b1;
			by_we = 1'b1;

			if (p1x <= p2x) begin 				// p1 left of p2
				if (p1x <= p3x) lx_in = p1x; 		// p1 left of p3
				else lx_in = p3x; 					// p3 left of p1
				if (p2x <= p3x) rx_in = p3x; 		// p3 right of p2
				else rx_in = p2x; 					// p2 right of p3
			end else begin 						// p1 right of p2
				if (p3x <= p1x) rx_in = p1x; 		// p1 right of p3
				else rx_in = p3x; 					// p3 right of p1
				if (p3x <= p2x) lx_in = p3x;		// p3 left of p2
				else lx_in = p2x;					// p2 left of p3
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

		INIT_XY : begin
			curr_x_we = 1'b1;
			curr_y_we = 1'b1;
			x_inc_we = 1'b1;
			curr_x_in = lx;
			curr_y_in = ty;
			x_inc_in = 1;
		end

		CALC_EDGES : begin
			case (cycle_count)
			// dX and dY for edge 1
				1 : begin
					a1 = p1[0]; // dX1 = X1 - X3
					b1 = p3[0];
				end
				2 : begin
					a1 = p1[1]; // dY1 = Y1 - X3
					b1 = p3[1];
				end
			// dX and dY for edge 2
				3 : begin
					a1 = p2[0]; // dX2 = X2 - X1
					b1 = p1[0];
				end
				4 : begin
					a1 = p2[1]; // dY2 = Y2 - Y1
					b1 = p1[1];
				end
			// dX and dY for edge 3
				5 : begin
					a1 = p3[0]; // dX3 = X3 - X2
					b1 = p2[0];
				end
				6 : begin
					a1 = p3[1]; // dY3 = Y3 - Y2
					b1 = p2[1];
				end
			// save dX's and dY's, do subtractions for Ei
				8 : begin
					dx1_we = 1'b1;
					dx1_in = s1;

					a1 = 0; // begin E1 calcs
					b1 = p1[0];
				end
				9 : begin
					dy1_we = 1'b1;
					dy1_in = s1;

					a1 = 0;
					b1 = p1[1];
				end
				10 : begin
					dx2_we = 1'b1;
					dx2_in = s1;

					a1 = 0;
					b1 = p2[0];
				end
				11 : begin
					dy2_we = 1'b1;
					dy2_in = s1;

					a1 = 0;
					b1 = p2[1];
				end
				12 : begin
					dx3_we = 1'b1;
					dx3_in = s1;

					a1 = 0;
					b1 = p3[0];
				end
				13 : begin
					dy3_we = 1'b1;
					dy3_in = s1;

					a1 = 0;
					b1 = p3[1];
				end
			// Ei Multiplies
				15 : begin
					a2 = s1; // (x - x1) * dy1
					b2 = dy1;
					
					a0 = dy1;
				end
				16 : begin
					a2 = s1; // (y - y1) * dx1
					b2 = dx1;

					a0 = dx1;
				end
				17 : begin
					a2 = s1; // (x - x2) * dy2
					b2 = dy2;

					a0 = dy2;
				end
				18 : begin
					a2 = s1; // (y - y2) * dx2
					b2 = dx2;

					a0 = dx2;
					dy1_we = 1'b1;
					dy1_in = q0;
				end
				19 : begin
					a2 = s1; // (x - x3) * dy3
					b2 = dy3;

					a0 = dy3;
					dx1_we = 1'b1;
					dx1_in = q0;
				end
				20 : begin
					a2 = s1; // (y - y3) * dx3
					b2 = dx3;

					a0 = dx3;
					dy2_we = 1'b1;
					dy2_in = q0;
					
					temp_we = 1'b1; // result of (x - x1) * dy1
					temp_in = q2;
				end
			// Final Ei subtracts
				21 : begin
					a1 = temp; // E1(x, y) = (x - x1) * dy1 - (y - y1) * dx1
					b1 = q2;

					dx2_we = 1'b1;
					dx2_in = q0;
				end
				22 : begin
					temp_we = 1'b1; // result of (x - x2) * dy2
					temp_in = q2;

					dy3_we = 1'b1;
					dy3_in = q0;		
				end
				23 : begin
					a1 = temp; // E2(x, y) = (x - x2) * dy2 - (y - y2) * dx2
					b1 = q2;

					dx3_we = 1'b1;
					dx3_in = q0;
				end
				24 : begin
					temp_we = 1'b1; // result of (x - x3) * dy3
					temp_in = q2;
				end
				25 : begin
					a1 = temp; // E3(x, y) = (x - x3) * dy3 - (y - y3) * dx3
					b1 = q2;
				end
				28 : begin
					a0 = s1;
				end
				30 : begin
					a0 = s1;
				end
				31 : begin
					e1_we = 1'b1;
					e1_in = q0;
				end
				32 : begin
					a0 = s1;
				end
				33 : begin
					e2_we = 1'b1;
					e2_in = q0;
				end
				35 : begin
					e3_we = 1'b1;
					e3_in = q0;
				end
			endcase
		end

		EDGE_CHECK : begin
			
		end

		RASTER : begin
			fb_x = curr_x[9:0];
			fb_y = curr_y[9:0];
			if (e1 + (curr_x) * dy1 - (curr_y) * dx1 < 32'h80000000 &&
				e2 + (curr_x) * dy2 - (curr_y) * dx2 < 32'h80000000 &&
				e3 + (curr_x) * dy3 - (curr_y) * dx3 < 32'h80000000) begin
				fb_we = 1'b1;
				data = 4'b1111;
			end else begin
					fb_we = 1'b0;
			end

			if (curr_x + x_inc < lx || rx < curr_x + x_inc) begin
				if (curr_y + 1 > by) next_state = DONE;
				curr_y_we = 1'b1;
				curr_y_in = curr_y + 1;
				x_inc_we = 1'b1;
				x_inc_in = -x_inc;
			end else begin
				curr_x_we = 1'b1;
				curr_x_in = curr_x + x_inc;
			end
		end

		DONE : begin
			done = 1'b1;
		end
	endcase
end

endmodule