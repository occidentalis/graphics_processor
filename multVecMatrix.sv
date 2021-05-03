module multVecMatrix (
	input logic clk,
	input logic start,
	input logic [31:0] x, y, z, // fp numbers
	input logic [31:0] m[4][4], // row major - fp numbers
	output logic [31:0] x_out, y_out, z_out, // fp numbers
	output logic done
);

enum {
	START,

	X_MUL1, Y_MUL1, Z_MUL1, W_MUL1, WAIT10,
	X_ADD1, Y_ADD1, Z_ADD1, W_ADD1, WAIT11, WAIT12, WAIT13,

	X_MUL2, Y_MUL2, Z_MUL2, W_MUL2, WAIT20,
	X_ADD2, Y_ADD2, Z_ADD2, W_ADD2, WAIT21, WAIT22, WAIT23,
	
	X_MUL3, Y_MUL3, Z_MUL3, W_MUL3, WAIT30,
	X_ADD3, Y_ADD3, Z_ADD3, W_ADD3, WAIT31, WAIT32, WAIT33,

	X_MUL4, Y_MUL4, Z_MUL4, W_MUL4, WAIT40,
	X_ADD4, Y_ADD4, Z_ADD4, W_ADD4, WAIT41, WAIT42, WAIT43,
	
	X_DONE, Y_DONE, Z_DONE, W_DONE,

	X_NORM1, Y_NORM1, Z_NORM1, WAIT01, WAIT02, WAIT03, WAIT04,
	WAIT05, WAIT06, WAIT07, WAIT08, WAIT09, WAIT010,
	X_NORM2, Y_NORM2, Z_NORM2, W_NORM,
	
	DONE
	 
} state, next_state;

logic [31:0] w = 32'h3f800000; // 1.0
logic [31:0] w_out;

logic [31:0] x_, y_, z_, w_;
logic x_we, y_we, z_we, w_we;
logic reset;

reg_32 x_reg(.clk(clk), .write_en(x_we), .reset(reset), .data_in(x_), .data_out(x_out));
reg_32 y_reg(.clk(clk), .write_en(y_we), .reset(reset), .data_in(y_), .data_out(y_out));
reg_32 z_reg(.clk(clk), .write_en(z_we), .reset(reset), .data_in(z_), .data_out(z_out));
reg_32 w_reg(.clk(clk), .write_en(w_we), .reset(reset), .data_in(w_), .data_out(w_out));

logic [31:0] a, b; // inputs to floating point units
logic [31:0] q_add, q_mul, q_div; // outputs of floating point units

fp_addsub fpu0(.clk(clk), .areset(reset), .a(a), .b(b), .q(q_add));
fp_mul    fpu1(.clk(clk), .areset(reset), .a(a), .b(b), .q(q_mul));
fp_div    fpu2(.clk(clk), .areset(reset), .a(a), .b(b), .q(q_div));

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

		START : next_state = X_MUL1;

		/*         ROUND 1         */
		X_MUL1 : next_state = Y_MUL1; // MUL
		Y_MUL1 : next_state = Z_MUL1;
		Z_MUL1 : next_state = W_MUL1;
		W_MUL1 : next_state = WAIT10;
		WAIT10 : next_state = X_ADD1;
		X_ADD1 : next_state = Y_ADD1; // ADD
		Y_ADD1 : next_state = Z_ADD1;
		Z_ADD1 : next_state = W_ADD1;
		W_ADD1 : next_state = WAIT11;
		WAIT11 : next_state = WAIT12;
		WAIT12 : next_state = WAIT13;
		WAIT13 : next_state = X_MUL2;

		/*         ROUND 2         */
		X_MUL2 : next_state = Y_MUL2; // MUL
		Y_MUL2 : next_state = Z_MUL2;
		Z_MUL2 : next_state = W_MUL2;
		W_MUL2 : next_state = WAIT20;
		WAIT20 : next_state = X_ADD2;
		X_ADD2 : next_state = Y_ADD2; // ADD
		Y_ADD2 : next_state = Z_ADD2;
		Z_ADD2 : next_state = W_ADD2;
		W_ADD2 : next_state = WAIT21;
		WAIT21 : next_state = WAIT22;
		WAIT22 : next_state = WAIT23;
		WAIT23 : next_state = X_MUL3;

		/*         ROUND 3         */
		X_MUL3 : next_state = Y_MUL3; // MUL
		Y_MUL3 : next_state = Z_MUL3;
		Z_MUL3 : next_state = W_MUL3;
		W_MUL3 : next_state = WAIT30;
		WAIT30 : next_state = X_ADD3;
		X_ADD3 : next_state = Y_ADD3; // ADD
		Y_ADD3 : next_state = Z_ADD3;
		Z_ADD3 : next_state = W_ADD3;
		W_ADD3 : next_state = WAIT31;
		WAIT31 : next_state = WAIT32;
		WAIT32 : next_state = WAIT33;
		WAIT33 : next_state = X_MUL4;

		/*         ROUND 4         */
		X_MUL4 : next_state = Y_MUL4; // MUL
		Y_MUL4 : next_state = Z_MUL4;
		Z_MUL4 : next_state = W_MUL4;
		W_MUL4 : next_state = WAIT40;
		WAIT40 : next_state = X_ADD4;
		X_ADD4 : next_state = Y_ADD4; // ADD
		Y_ADD4 : next_state = Z_ADD4;
		Z_ADD4 : next_state = W_ADD4;
		W_ADD4 : next_state = WAIT41;
		WAIT41 : next_state = WAIT42;
		WAIT42 : next_state = WAIT43;
		WAIT43 : next_state = X_DONE;

		/*       FINISH CALC       */
		X_DONE : next_state = Y_DONE;
		Y_DONE : next_state = Z_DONE;
		Z_DONE : next_state = W_DONE;
		W_DONE : next_state = X_NORM1;

		/*     NORMALIZE VECTOR     */
		X_NORM1 : next_state = Y_NORM1;
		Y_NORM1 : next_state = Z_NORM1;
		Z_NORM1 : next_state = WAIT01;
		WAIT01  : next_state = WAIT02;
		WAIT02  : next_state = WAIT03;
		WAIT03  : next_state = WAIT04;
		WAIT04  : next_state = WAIT05;
		WAIT05  : next_state = WAIT06;
		WAIT06  : next_state = WAIT07;
		WAIT07  : next_state = WAIT08;
		WAIT08  : next_state = WAIT09;
		WAIT09  : next_state = WAIT010;
		WAIT010 : next_state = X_NORM2;
		X_NORM2 : next_state = Y_NORM2;
		Y_NORM2 : next_state = Z_NORM2;
		Z_NORM2 : next_state = W_NORM;
		W_NORM  : next_state = DONE;

		DONE : begin
			if (start)
				next_state = START;
			else
				next_state = DONE;
		end

	endcase

	a = 32'b0;
	b = 32'b0;
	x_ = 32'b0;
	y_ = 32'b0;
	z_ = 32'b0;
	w_ = 32'b0;
	x_we = 1'b0;
	y_we = 1'b0;
	z_we = 1'b0;
	w_we = 1'b0;
	done = 1'b0;
	reset = 1'b0;

	unique case (state)
		START : begin
			reset = 1'b1;
		end

	// BEGIN ROUND 1
		X_MUL1 : begin
			a = x;
			b = m[0][0];
		end
		Y_MUL1 : begin
			a = x;
			b = m[0][1];
		end
		Z_MUL1 : begin
			a = x;
			b = m[0][2];
		end
		W_MUL1 : begin
			a = x;
			b = m[0][3];
		end
		X_ADD1 : begin
			a = x_out;
			b = q_mul; // result of X_MUL1
		end
		Y_ADD1 : begin
			a = y_out;
			b = q_mul; // result of Y_MUL1
		end
		Z_ADD1 : begin
			a = z_out;
			b = q_mul; // result of Z_MUL1
		end
		W_ADD1 : begin
			a = w_out;
			b = q_mul; // result of W_MUL1
		end

	// BEGIN ROUND 2
		X_MUL2 : begin
			x_ = q_add; // result of X_ADD1
			x_we = 1'b1;
			a = y;
			b = m[1][0];
		end
		Y_MUL2 : begin
			y_ = q_add; // result of Y_ADD1
			y_we = 1'b1;
			a = y;
			b = m[1][1];
		end
		Z_MUL2 : begin
			z_ = q_add; // result of Z_ADD1
			z_we = 1'b1;
			a = y;
			b = m[1][2];
		end
		W_MUL2 : begin
			w_ = q_add; // result of W_ADD1
			z_we = 1'b1;
			a = y;
			b = m[1][3];
		end
		X_ADD2 : begin
			a = x_out;
			b = q_mul; // result of X_MUL2
		end
		Y_ADD2 : begin
			a = y_out;
			b = q_mul; // result of Y_MUL2
		end
		Z_ADD2 : begin
			a = z_out;
			b = q_mul; // result of Z_MUL2
		end
		W_ADD2 : begin
			a = w_out;
			b = q_mul; // result of W_MUL2
		end

	// BEGIN ROUND 3
		X_MUL3 : begin
			x_ = q_add; // result of X_ADD2
			x_we = 1'b1;
			a = z;
			b = m[2][0];
		end
		Y_MUL3 : begin
			y_ = q_add; // result of Y_ADD2
			y_we = 1'b1;
			a = z;
			b = m[2][1];
		end
		Z_MUL3 : begin
			z_ = q_add; // result of Z_ADD2
			z_we = 1'b1;
			a = z;
			b = m[2][2];
		end
		W_MUL3 : begin
			w_ = q_add; // result of W_ADD2
			w_we = 1'b1;
			a = z;
			b = m[2][3];
		end
		X_ADD3 : begin
			a = x_out;
			b = q_mul; // result of X_MUL3
		end
		Y_ADD3 : begin
			a = y_out;
			b = q_mul; // result of Y_MUL3
		end
		Z_ADD3 : begin
			a = z_out;
			b = q_mul; // result of Z_MUL3
		end
		W_ADD3 : begin
			a = w_out;
			b = q_mul; // result of W_MUL3
		end

	// BEGIN ROUND 4
		X_MUL4 : begin
			x_ = q_add; // result of X_ADD3
			x_we = 1'b1;
			a = w;
			b = m[3][0];
		end
		Y_MUL4 : begin
			y_ = q_add; // result of Y_ADD3
			y_we = 1'b1;
			a = w;
			b = m[3][1];
		end
		Z_MUL4 : begin
			z_ = q_add; // result of Z_ADD3
			z_we = 1'b1;
			a = w;
			b = m[3][2];
		end
		W_MUL4 : begin
			w_ = q_add; // result of W_ADD3
			w_we = 1'b1;
			a = w;
			b = m[3][3];
		end
		X_ADD4 : begin
			a = x_out;
			b = q_mul; // result of X_MUL4
		end
		Y_ADD4 : begin
			a = y_out;
			b = q_mul; // result of Y_MUL4
		end
		Z_ADD4 : begin
			a = z_out;
			b = q_mul; // result of Z_MUL4
		end
		W_ADD4 : begin
			a = w_out;
			b = q_mul; // result of W_MUL4
		end

	// FINISH CALC
		X_DONE : begin
			x_ = q_add;
			x_we = 1'b1;
		end
		Y_DONE : begin
			y_ = q_add;
			y_we = 1'b1;
		end
		Z_DONE : begin
			z_ = q_add;
			z_we = 1'b1;
		end
		W_DONE : begin
			w_ = q_add;
			w_we = 1'b1;
		end

		
	// NORMALIZE VECTOR
		X_NORM1 : begin
			a = x_out;
			b = w_out;
		end
		Y_NORM1 : begin
			a = y_out;
			b = w_out;
		end
		Z_NORM1 : begin
			a = z_out;
			b = w_out;
		end
		X_NORM2 : begin
			x_ = q_div;
			x_we = 1'b1;
		end
		Y_NORM2 : begin
			y_ = q_div;
			y_we = 1'b1;
		end
		Z_NORM2 : begin
			z_ = q_div;
			z_we = 1'b1;
		end
		W_NORM : begin
			w_ = 32'h3f800000;
			w_we = 1'b1;
		end

		DONE : begin
			done = 1'b1;
		end

	endcase
	
end

endmodule