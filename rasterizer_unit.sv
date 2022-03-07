module rasterizer_unit (
	input logic clk, sreset, start,
	input logic [31:0] p1[3], p2[3], p3[3], // in ndc coordinates
	input logic [3:0] color,
	output logic done,
	output logic fb_we,
	output logic [9:0] rast_x,
	output logic [9:0] rast_y,
	output logic [3:0] fb_data,
	output logic zb_we,
	output logic [7:0] zb_wdata,
	input logic [7:0] zb_rdata,
	input logic [31:0] display_width, display_height // floating point
);

enum {
	DONE,
	START,
	INT_CONVERSION,
	GET_BOUNDS, INIT_XY,
	CALC_EDGES,
	EDGE_CHECK,
	Z_CHECK,
	RASTER,
	NEXT_PIXEL
} state, next_state;

logic reset;

logic [31:0] to_int_a; // floating point
logic [31:0] to_int_q; // unsigned integer
fp_to_int fpu0(.clk(clk), .areset(reset), .a(to_int_a), .q(to_int_q));

logic [31:0] to_fp_a, to_fp_q;
int_to_fp fpu1(.clk(clk), .areset(reset), .a(to_fp_a), .q(to_fp_q));

logic [31:0] addsub_a, addsub_b, addsub_q, addsub_s;
fp_add_sub fpu2(.clk(clk), .areset(reset), .a(addsub_a), .b(addsub_b), .q(addsub_q), .s(addsub_s));

// logic [31:0] addsub_a1, addsub_b1, addsub_q1, addsub_s1;
// fp_add_sub fpu3(.clk(clk), .areset(reset), .a(addsub_a1), .b(addsub_b1), .q(addsub_q1), .s(addsub_s1));

logic [31:0] mul_a, mul_b, mul_q;
fp_mul fpu4(.clk(clk), .areset(reset), .a(mul_a), .b(mul_b), .q(mul_q));

logic [31:0] div_a, div_b, div_q;
fp_div fpu5(.clk(clk), .areset(reset), .a(div_a), .b(div_b), .q(div_q));

logic [31:0] inv_a, inv_q;
fp_inv fpu6(.clk(clk), .areset(reset), .a(inv_a), .q(inv_q));

logic p1x_we, p1y_we, p2x_we, p2y_we, p3x_we, p3y_we;
logic [31:0] p1x_in, p1y_in, p2x_in, p2y_in, p3x_in, p3y_in;
logic [31:0] p1x, p1y, p2x, p2y, p3x, p3y;
reg_32 p1x_reg(.clk(clk), .write_en(p1x_we), .reset(reset), .data_in(p1x_in), .data_out(p1x));
reg_32 p1y_reg(.clk(clk), .write_en(p1y_we), .reset(reset), .data_in(p1y_in), .data_out(p1y));
reg_32 p2x_reg(.clk(clk), .write_en(p2x_we), .reset(reset), .data_in(p2x_in), .data_out(p2x));
reg_32 p2y_reg(.clk(clk), .write_en(p2y_we), .reset(reset), .data_in(p2y_in), .data_out(p2y));
reg_32 p3x_reg(.clk(clk), .write_en(p3x_we), .reset(reset), .data_in(p3x_in), .data_out(p3x));
reg_32 p3y_reg(.clk(clk), .write_en(p3y_we), .reset(reset), .data_in(p3y_in), .data_out(p3y));

logic p1x_int_we, p1y_int_we, p2x_int_we, p2y_int_we, p3x_int_we, p3y_int_we;
logic [31:0] p1x_int_in, p1y_int_in, p2x_int_in, p2y_int_in, p3x_int_in, p3y_int_in;
logic [31:0] p1x_int, p1y_int, p2x_int, p2y_int, p3x_int, p3y_int;
reg_32 p1x_int_reg(.clk(clk), .write_en(p1x_int_we), .reset(reset), .data_in(p1x_int_in), .data_out(p1x_int));
reg_32 p1y_int_reg(.clk(clk), .write_en(p1y_int_we), .reset(reset), .data_in(p1y_int_in), .data_out(p1y_int));
reg_32 p2x_int_reg(.clk(clk), .write_en(p2x_int_we), .reset(reset), .data_in(p2x_int_in), .data_out(p2x_int));
reg_32 p2y_int_reg(.clk(clk), .write_en(p2y_int_we), .reset(reset), .data_in(p2y_int_in), .data_out(p2y_int));
reg_32 p3x_int_reg(.clk(clk), .write_en(p3x_int_we), .reset(reset), .data_in(p3x_int_in), .data_out(p3x_int));
reg_32 p3y_int_reg(.clk(clk), .write_en(p3y_int_we), .reset(reset), .data_in(p3y_int_in), .data_out(p3y_int));

logic z1_inv_we, z2_inv_we, z3_inv_we;
logic [31:0] z1_inv_in, z2_inv_in, z3_inv_in, z1_inv, z2_inv, z3_inv;
reg_32 z1_inv_reg(.clk(clk), .write_en(z1_inv_we), .reset(reset), .data_in(z1_inv_in), .data_out(z1_inv));
reg_32 z2_inv_reg(.clk(clk), .write_en(z2_inv_we), .reset(reset), .data_in(z2_inv_in), .data_out(z2_inv));
reg_32 z3_inv_reg(.clk(clk), .write_en(z3_inv_we), .reset(reset), .data_in(z3_inv_in), .data_out(z3_inv));

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

logic e1_pixel_we, e2_pixel_we, e3_pixel_we;
logic [31:0] e1_pixel_in, e2_pixel_in, e3_pixel_in, e1_pixel, e2_pixel, e3_pixel;
reg_32 e1_pixel_reg(.clk(clk), .write_en(e1_pixel_we), .reset(reset), .data_in(e1_pixel_in), .data_out(e1_pixel));
reg_32 e2_pixel_reg(.clk(clk), .write_en(e2_pixel_we), .reset(reset), .data_in(e2_pixel_in), .data_out(e2_pixel));
reg_32 e3_pixel_reg(.clk(clk), .write_en(e3_pixel_we), .reset(reset), .data_in(e3_pixel_in), .data_out(e3_pixel));

logic inv_area_we;
logic [31:0] inv_area_in, inv_area;
reg_32 inv_area_reg(.clk(clk), .write_en(inv_area_we), .reset(reset), .data_in(inv_area_in), .data_out(inv_area));

logic temp_we;
logic [31:0] temp_in, temp;
reg_32 temp_reg(.clk(clk), .write_en(temp_we), .reset(reset), .data_in(temp_in), .data_out(temp));

int cycle_count = 1;
always_ff @(posedge clk) begin
	if (state == next_state)
		cycle_count <= cycle_count + 1;
	else
		cycle_count <= 1;

	if (sreset == 1)
		state <= DONE;
	else
		state <= next_state;
end

always_comb begin

	reset = 1'b0;
	done = 1'b0;
	fb_we = 1'b0;
	rast_x = curr_x[9:0];
	rast_y = curr_y[9:0];
	fb_data = color;
	zb_we = 1'b0;
	zb_wdata = 6'b0;
	to_int_a = 32'b0;
	to_fp_a = 32'b0;
	addsub_a = 32'b0;
	addsub_b = 32'b0;
	mul_a = 32'b0;
	mul_b = 32'b0;
	div_a = 32'b0;
	div_b = 32'b0;
	inv_a = 32'b0;
	p1x_we = 1'b0;
	p1y_we = 1'b0;
	p2x_we = 1'b0;
	p2y_we = 1'b0;
	p3x_we = 1'b0;
	p3y_we = 1'b0;
	p1x_in = 32'b0;
	p1y_in = 32'b0;
	p2x_in = 32'b0;
	p2y_in = 32'b0;
	p3x_in = 32'b0;
	p3y_in = 32'b0;
	p1x_int_we = 1'b0;
	p1y_int_we = 1'b0;
	p2x_int_we = 1'b0;
	p2y_int_we = 1'b0;
	p3x_int_we = 1'b0;
	p3y_int_we = 1'b0;
	p1x_int_in = 32'b0;
	p1y_int_in = 32'b0;
	p2x_int_in = 32'b0;
	p2y_int_in = 32'b0;
	p3x_int_in = 32'b0;
	p3y_int_in = 32'b0;
	z1_inv_we = 1'b0;
	z2_inv_we = 1'b0;
	z3_inv_we = 1'b0;
	z1_inv_in = 32'b0;
	z2_inv_in = 32'b0;
	z3_inv_in = 32'b0;
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
	e1_pixel_we = 1'b0;
	e2_pixel_we = 1'b0;
	e3_pixel_we = 1'b0;
	e1_pixel_in = 32'b0;
	e2_pixel_in = 32'b0;
	e3_pixel_in = 32'b0;
	inv_area_we = 1'b0;
	inv_area_in = 32'b0;
	temp_we = 1'b0;
	temp_in = 32'b0;
	
	next_state = state;

	unique case (state)

		START : begin
			next_state = INT_CONVERSION;
		end

		INT_CONVERSION : begin
			if (cycle_count == 17)
				next_state = GET_BOUNDS;
		end

		GET_BOUNDS : begin
			next_state = CALC_EDGES;
		end

		CALC_EDGES : begin
			if (cycle_count == 23)
				next_state = INIT_XY;
		end

		INIT_XY : begin
			next_state = EDGE_CHECK;
		end

		EDGE_CHECK : begin
			// next state logic handled below
		end

		Z_CHECK : begin
			// next state logic handled below
		end

		RASTER : begin
			// if (cycle_count == 50)
				next_state = NEXT_PIXEL;
		end

		NEXT_PIXEL : begin
			next_state = EDGE_CHECK;
			// finished condition handled below
		end

		DONE : begin
			if (start == 1)
				next_state = START;
		end
	endcase

	unique case (state)
		START : begin
			reset = 1;
		end

		INT_CONVERSION : begin
			case (cycle_count)
				1 : begin
					addsub_a = p1[0];
					addsub_b = 32'h3f800000;
				end
				2 : begin
					addsub_a = 32'h3f800000;
					addsub_b = p1[1];
				end
				3 : begin
					addsub_a = p2[0];
					addsub_b = 32'h3f800000;
			
					mul_a = addsub_q;
					mul_b = display_width;
				end
				4 : begin
					addsub_a = 32'h3f800000;
					addsub_b = p2[1];

					mul_a = addsub_s;
					mul_b = display_height;
				end
				5 : begin
					addsub_a = p3[0];
					addsub_b = 32'h3f800000;

					mul_a = addsub_q;
					mul_b = display_width;
				end
				6 : begin
					addsub_a = 32'h3f800000;
					addsub_b = p3[1];

					mul_a = addsub_s;
					mul_b = display_height;

					to_int_a = mul_q;
					p1x_we = 1'b1;
					p1x_in = mul_q;
				end
				7 : begin
					mul_a = addsub_q;
					mul_b = display_width;

					to_int_a = mul_q;
					p1y_we = 1'b1;
					p1y_in = mul_q;
					p1x_int_we = 1'b1;
					p1x_int_in = to_int_q;

					addsub_a = p1[2];
					addsub_b = 32'h3f800000;
				end
				8 : begin
					mul_a = addsub_s;
					mul_b = display_height;

					to_int_a = mul_q;
					p2x_we = 1'b1;
					p2x_in = mul_q;
					p1y_int_we = 1'b1;
					p1y_int_in = to_int_q;

					addsub_a = p2[2];
					addsub_b = 32'h3f800000;
				end
				9 : begin
					to_int_a = mul_q;
					p2y_we = 1'b1;
					p2y_in = mul_q;
					p2x_int_we = 1'b1;
					p2x_int_in = to_int_q;

					addsub_a = p3[2];
					addsub_b = 32'h3f800000;

					inv_a = addsub_q;
				end
				10 : begin
					to_int_a = mul_q;
					p3x_we = 1'b1;
					p3x_in = mul_q;
					p2y_int_we = 1'b1;
					p2y_int_in = to_int_q;

					inv_a = addsub_q;
				end
				11 : begin
					to_int_a = mul_q;
					p3y_we = 1'b1;
					p3y_in = mul_q;
					p3x_int_we = 1'b1;
					p3x_int_in = to_int_q;

					inv_a = addsub_q;
				end
				12 : begin
					p3y_int_we = 1'b1;
					p3y_int_in = to_int_q;
				end
				15 : begin
					z1_inv_we = 1'b1;
					z1_inv_in = inv_q;
				end
				16 : begin
					z2_inv_we = 1'b1;
					z2_inv_in = inv_q;
				end
				17 : begin
					z3_inv_we = 1'b1;
					z3_inv_in = inv_q;
				end
				
			endcase
		end

		GET_BOUNDS : begin
			rx_we = 1;
			ty_we = 1;
			lx_we = 1;
			by_we = 1;

			if (p1x_int <= p2x_int) begin 				// p1 left of p2
				if (p1x_int <= p3x_int) lx_in = p1x_int; 		// p1 left of p3
				else lx_in = p3x_int; 					// p3 left of p1
				if (p2x_int <= p3x_int) rx_in = p3x_int; 		// p3 right of p2
				else rx_in = p2x_int; 					// p2 right of p3
			end else begin 						// p1 right of p2
				if (p3x_int <= p1x_int) rx_in = p1x_int; 		// p1 right of p3
				else rx_in = p3x_int; 					// p3 right of p1
				if (p3x_int <= p2x_int) lx_in = p3x_int;		// p3 left of p2
				else lx_in = p2x_int;					// p2 left of p3
			end
			
			if (p1y_int <= p2y_int) begin 				// p1 top of p2
				if (p1y_int <= p3y_int) ty_in = p1y_int; 		// p1 top of p3
				else ty_in = p3y_int; 					// p3 top of p1
				if (p2y_int <= p3y_int) by_in = p3y_int; 		// p3 bottom of p2
				else by_in = p2y_int; 					// p2 bottom of p3
			end else begin 						// p1 bottom of p2
				if (p3y_int <= p1y_int) by_in = p1y_int; 		// p1 bottom of p3
				else by_in = p3y_int; 					// p3 bottom of p1
				if (p3y_int <= p2y_int) ty_in = p3y_int;		// p3 top of p2
				else ty_in = p2y_int;					// p2 top of p3
			end
			
		end

		CALC_EDGES : begin
			case (cycle_count)
			// dX and dY for edge 1
				1 : begin
					addsub_a = p1x; // dX1 = X1 - X3
					addsub_b = p3x;
				end
				2 : begin
					addsub_a = p1y; // dY1 = Y1 - Y3
					addsub_b = p3y;
				end
			// dX and dY for edge 2
				3 : begin
					addsub_a = p2x; // dX2 = X2 - X1
					addsub_b = p1x;

					dx1_we = 1'b1;
					dx1_in = addsub_s;

					mul_a = {1'b1, p1y[30:0]}; // (0 - Y1)dX1
					mul_b = addsub_s;
				end
				4 : begin
					addsub_a = p2y; // dY2 = Y2 - Y1
					addsub_b = p1y;

					dy1_we = 1'b1;
					dy1_in = addsub_s;

					mul_a = {1'b1, p1x[30:0]}; // 0 - X1
					mul_b = addsub_s;
				end
			// dX and dY for edge 3
				5 : begin
					addsub_a = p3x; // dX3 = X3 - X2
					addsub_b = p2x;

					dx2_we = 1'b1;
					dx2_in = addsub_s;

					mul_a = {1'b1, p2y[30:0]}; // 0 - Y2
					mul_b = addsub_s;
				end
				6 : begin
					addsub_a = p3y; // dY3 = Y3 - Y2
					addsub_b = p2y;

					dy2_we = 1'b1;
					dy2_in = addsub_s;

					mul_a = {1'b1, p2x[30:0]}; // 0 - X2
					mul_b = addsub_s;

					temp_we = 1'b1;
					temp_in = mul_q;
				end
			// save dX's and dY's, do subtractions for Ei
				7 : begin
					dx3_we = 1'b1;
					dx3_in = addsub_s;

					mul_a = {1'b1, p3y[30:0]}; // 0 - Y3
					mul_b = addsub_s;

					addsub_a = mul_q;
					addsub_b = temp;
				end
				8 : begin
					dy3_we = 1'b1;
					dy3_in = addsub_s;

					mul_a = {1'b1, p3x[30:0]}; // 0 - X3
					mul_b = addsub_s;

					temp_we = 1'b1;
					temp_in = mul_q;

					addsub_a = p1x;
					addsub_b = p3x;
				end
				9 : begin
					addsub_a = mul_q;
					addsub_b = temp;

					e1_we = 1'b1;
					e1_in = addsub_s;
				end
				10 : begin
					temp_we = 1'b1;
					temp_in = mul_q;

					addsub_a = p1y;
					addsub_b = p3y;

					mul_a = addsub_s;
					mul_b = dy3;
				end
				11 : begin
					addsub_a = mul_q;
					addsub_b = temp;

					e2_we = 1'b1;
					e2_in = addsub_s;
				end
				12 : begin
					mul_a = addsub_s;
					mul_b = dx3;

					to_int_a = dx1;
				end
				13 : begin
					e3_we = 1'b1;
					e3_in = addsub_s;

					temp_we = 1'b1;
					temp_in = mul_q;

					to_int_a = dy1;
					dx1_we = 1'b1;
					dx1_in = to_int_q;
				end
				14 : begin
					to_int_a = dx2;
					dy1_we = 1'b1;
					dy1_in = to_int_q;
				end
				15 : begin
					addsub_a = temp;
					addsub_b = mul_q;

					to_int_a = dy2;
					dx2_we = 1'b1;
					dx2_in = to_int_q;
				end
				16 : begin
					to_int_a = dx3;
					dy2_we = 1'b1;
					dy2_in = to_int_q;
				end
				17 : begin
					inv_a = addsub_s;

					to_int_a = dy3;
					dx3_we = 1'b1;
					dx3_in = to_int_q;
				end
				18 : begin
					to_int_a = e1;
					dy3_we = 1'b1;
					dy3_in = to_int_q;
				end
				19 : begin
					to_int_a = e2;
					e1_we = 1'b1;
					e1_in = to_int_q;
				end
				20 : begin
					to_int_a = e3;
					e2_we = 1'b1;
					e2_in = to_int_q;
				end
				21 : begin
					e3_we = 1'b1;
					e3_in = to_int_q;
				end
				23 : begin
					inv_area_we = 1'b1;
					inv_area_in = inv_q;
				end

			endcase
		end

		INIT_XY : begin
			curr_x_we = 1;
			curr_y_we = 1;
			x_inc_we = 1;
			curr_x_in = lx;
			curr_y_in = ty;
			x_inc_in = 1;
		end

		EDGE_CHECK : begin
			case (cycle_count)
				1 : begin
					e1_pixel_we = 1;
					e1_pixel_in = curr_x * dy1;
					e2_pixel_we = 1;
					e2_pixel_in = curr_x * dy2;
					e3_pixel_we = 1;
					e3_pixel_in = curr_x * dy3;
				end
				2 : begin
					e1_pixel_we = 1;
					e1_pixel_in = e1_pixel - curr_y * dx1;
					e2_pixel_we = 1;
					e2_pixel_in = e2_pixel - curr_y * dx2;
					e3_pixel_we = 1;
					e3_pixel_in = e3_pixel - curr_y * dx3;
				end
				3 : begin
					e1_pixel_we = 1;
					e1_pixel_in = e1_pixel + e1;
					e2_pixel_we = 1;
					e2_pixel_in = e2_pixel + e2;
					e3_pixel_we = 1;
					e3_pixel_in = e3_pixel + e3;
				end
				4 : begin
					if (e1_pixel < 32'h80000000 &&
						e2_pixel < 32'h80000000 &&
						e3_pixel < 32'h80000000) begin
						next_state = Z_CHECK;
					end else begin
						next_state = NEXT_PIXEL;
					end
				end
			endcase
		end

		Z_CHECK : begin
			case (cycle_count)
				1 : begin
					to_fp_a = e3_pixel;
				end
				2 : begin
					to_fp_a = e1_pixel;
					mul_a = to_fp_q;
					mul_b = inv_area;
				end
				3 : begin
					to_fp_a = e2_pixel;
					mul_a = to_fp_q;
					mul_b = inv_area;
				end
				4 : begin
					mul_a = to_fp_q;
					mul_b = inv_area;
				end
				5 : begin
					mul_a = mul_q;
					mul_b = z1_inv;
				end
				6 : begin
					mul_a = mul_q;
					mul_b = z2_inv;
				end
				7 : begin
					mul_a = mul_q;
					mul_b = z3_inv;
				end
				8 : begin
					temp_we = 1'b1;
					temp_in = mul_q;
				end
				9 : begin
					addsub_a = temp;
					addsub_b = mul_q;
				end
				10 : begin
					temp_we = 1'b1;
					temp_in = mul_q;
				end
				11 : begin
					addsub_a = temp;
					addsub_b = addsub_q;
				end
				13 : begin
					inv_a = addsub_q;
				end
				19 : begin
					mul_a = inv_q;
					mul_b = 32'h42fe0000;
				end
				22 : begin
					to_int_a = mul_q;
				end
				23 : begin
					if (to_int_q[7:0] < zb_rdata) begin
						next_state = RASTER;
						zb_wdata = to_int_q[7:0];
						zb_we = 1;
					end else begin
						next_state = NEXT_PIXEL;
					end
				end


				// 1 : begin
				// 	to_fp_a = e3_pixel;
				// end
				// 2 : begin
				// 	to_fp_a = e1_pixel;
				// end
				// 3 : begin
				// 	to_fp_a = e2_pixel;
				// end
				// 6 : begin
				// 	mul_a = to_fp_q;
				// 	mul_b = inv_area;
				// end
				// 7 : begin
				// 	mul_a = to_fp_q;
				// 	mul_b = inv_area;
				// end
				// 8 : begin
				// 	mul_a = to_fp_q;
				// 	mul_b = inv_area;
				// end
				// 11 : begin
				// 	mul_a = mul_q;
				// 	mul_b = z1_inv;
				// end
				// 12 : begin
				// 	mul_a = mul_q;
				// 	mul_b = z2_inv;
				// end
				// 13 : begin
				// 	mul_a = mul_q;
				// 	mul_b = z3_inv;
				// end
				// 16 : begin
				// 	temp_we = 1;
				// 	temp_in = mul_q;
				// end
				// 17 : begin
				// 	addsub_a = mul_q;
				// 	addsub_b = temp;
				// end
				// 18 : begin
				// 	temp_we = 1;
				// 	temp_in = mul_q;
				// end
				// 24 : begin
				// 	addsub_a = addsub_q;
				// 	addsub_b = temp;
				// end
				// 31 : begin
				// 	div_a = 32'h3f800000; // 1.0
				// 	div_b = addsub_q;
				// end
				// 44 : begin
				// 	mul_a = div_q;
				// 	mul_b = 32'h42800000; // 64.0
				// end
				// 49 : begin
				// 	to_int_a = mul_q;
				// end
				// 51 : begin
				// 	zb_x = curr_x[9:0];
				// 	zb_y = curr_y[9:0];
				// end
				// 52 : begin
				// 	if (to_int_q[5:0] < zb_rdata) begin
				// 		next_state = RASTER;
				// 		zb_wdata = to_int_q[5:0];
				// 		zb_we = 1;
				// 		zb_x = curr_x[9:0];
				// 		zb_y = curr_y[9:0];
						
				// 	end else begin
				// 		next_state = NEXT_PIXEL;
				// 	end
				// end
			endcase
		end

		RASTER : begin
			fb_we = 1;
		end

		NEXT_PIXEL : begin
			if (curr_x + x_inc < lx || rx < curr_x + x_inc) begin
				if (curr_y + 1 > by) next_state = DONE;
				curr_y_we = 1;
				curr_y_in = curr_y + 1;
				x_inc_we = 1;
				x_inc_in = -x_inc;
			end else begin
				curr_x_we = 1;
				curr_x_in = curr_x + x_inc;
			end
		end

		DONE : begin
			done = 1'b1;
		end
	endcase
end

endmodule