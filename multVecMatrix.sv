module multVecMatrix (
	input logic clk,
	input logic start,
	input shortreal x, y, z,
	input shortreal [3:0][3:0] m, // row major
	output shortreal x_out, y_out, z_out,
	output logic done
);

enum { ADD = 0, SUB = 1, MUL = 2, DIV = 3 } op;
enum {
	START,

	X_MUL1, X_ADD1, X_MUL2, X_ADD2, X_MUL3, X_ADD3, X_MUL4, X_ADD4,
	Y_MUL1, Y_ADD1, Y_MUL2, Y_ADD2, Y_MUL3, Y_ADD3, Y_MUL4, Y_ADD4,
	Z_MUL1, Z_ADD1, Z_MUL2, Z_ADD2, Z_MUL3, Z_ADD3, Z_MUL4, Z_ADD4,
	W_MUL1, W_ADD1, W_MUL2, W_ADD2, W_MUL3, W_ADD3, W_MUL4, W_ADD4,

	X_DONE, Y_DONE, Z_DONE, W_DONE,

	X_NORM1, Y_NORM1, Z_NORM1, W_NORM1,
	X_NORM2, Y_NORM2, Z_NORM2, DONE
	 
} state, next_state;

logic x_we, y_we, z_we, w_we;
logic x_, y_, z_, w_;
logic w_out;
logic reset;

reg_32 x_reg(.clk(clk), .write_en(x_we), .reset(reset), .data_in(x_), .data_out(x_out));
reg_32 y_reg(.clk(clk), .write_en(y_we), .reset(reset), .data_in(y_), .data_out(y_out));
reg_32 z_reg(.clk(clk), .write_en(z_we), .reset(reset), .data_in(z_), .data_out(z_out));
reg_32 w_reg(.clk(clk), .write_en(w_we), .reset(reset), .data_in(w_), .data_out(w_out));

shortreal w = 1.0;
shortreal opa, opb, out;

fpu fpu0(.clk(clk), .rmode(3), .fpu_op(op), .opa(opa), .opb(opb), .out(out))

initial begin
	state = DONE;
end

int cycle_count = 1;
always_ff @(posedge clk) begin : 
	if (state == next_state)
		cycle_count <= cycle_count + 1;
	else
		cycle_count <= 1;

	state <= next_state;
end

always_comb begin
	x_ = x * m[0][0] + y * m[1][0] + z * m[2][0] + m[3][0];
	y_ = x * m[0][1] + y * m[1][1] + z * m[2][1] + m[3][1];
	z_ = x * m[0][2] + y * m[1][2] + z * m[2][2] + m[3][2];
	w_ = x * m[0][3] + y * m[1][3] + z * m[2][3] + m[3][3];
	
	next_state = state;

	unique case (state)

		START : next_state = X_MUL1;

		/*         ROUND 1         */
		X_MUL1 : next_state = Y_MUL1;
		Y_MUL1 : next_state = Z_MUL1;
		Z_MUL1 : next_state = W_MUL1;
		W_MUL1 : next_state = X_ADD1;
		X_ADD1 : next_state = Y_ADD1;
		Y_ADD1 : next_state = Z_ADD1;
		Z_ADD1 : next_state = W_ADD1;
		W_ADD1 : next_state = X_MUL2;

		/*         ROUND 2         */
		X_MUL2 : next_state = Y_MUL2;
		Y_MUL2 : next_state = Z_MUL2;
		Z_MUL2 : next_state = W_MUL2;
		W_MUL2 : next_state = X_ADD2;
		X_ADD2 : next_state = Y_ADD2;
		Y_ADD2 : next_state = Z_ADD2;
		Z_ADD2 : next_state = W_ADD2;
		W_ADD2 : next_state = X_MUL3;

		/*         ROUND 3         */
		X_MUL3 : next_state = Y_MUL3;
		Y_MUL3 : next_state = Z_MUL3;
		Z_MUL3 : next_state = W_MUL3;
		W_MUL3 : next_state = X_ADD3;
		X_ADD3 : next_state = Y_ADD3;
		Y_ADD3 : next_state = Z_ADD3;
		Z_ADD3 : next_state = W_ADD3;
		W_ADD3 : next_state = X_MUL4;

		/*         ROUND 4         */
		X_MUL4 : next_state = Y_MUL4;
		Y_MUL4 : next_state = Z_MUL4;
		Z_MUL4 : next_state = W_MUL4;
		W_MUL4 : next_state = X_ADD4;
		X_ADD4 : next_state = Y_ADD4;
		Y_ADD4 : next_state = Z_ADD4;
		Z_ADD4 : next_state = W_ADD4;
		W_ADD4 : next_state = X_DONE;

		/*       FINISH CALC       */
		X_DONE : next_state = Y_DONE;
		Y_DONE : next_state = Z_DONE;
		Z_DONE : next_state = W_DONE;
		W_DONE : next_state = X_NORM1;

		/*     NORMALIZE VECTOR     */
		X_NORM1 : next_state = Y_NORM1;
		Y_NORM1 : next_state = Z_NORM1;
		Z_NORM1 : next_state = W_NORM1;
		W_NORM1 : next_state = X_NORM2;
		X_NORM2 : next_state = Y_NORM2;
		Y_NORM2 : next_state = Z_NORM2;
		Z_NORM2 : next_state = DONE;

		DONE : begin
			if (start) {
				next_state = START;
			} else {
				next_state = DONE;
			}
		end

	endcase

	opa = 1'b0;
	opb = 1'b0;
	op = 1'b0;
	x_ = 1'b0;
	y_ = 1'b0;
	z_ = 1'b0;
	w_ = 1'b0;
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
			opa = x;
			opb = m[0][0];
			op = MUL;
		end
		Y_MUL1 : begin
			opa = x;
			opb = m[0][1];
			op = MUL;
		end
		Z_MUL1 : begin
			opa = x;
			opb = m[0][2];
			op = MUL;
		end
		W_MUL1 : begin
			opa = x;
			opb = m[0][3];
			op = MUL;
		end
		X_ADD1 : begin
			opa = x_out;
			opb = out; // result of X_MUL1
			op = ADD;
		end
		Y_ADD1 : begin
			opa = y_out;
			opb = out; // result of Y_MUL1
			op = ADD;
		end
		Z_ADD1 : begin
			opa = z_out;
			opb = out; // result of Z_MUL1
			op = ADD;
		end
		W_ADD1 : begin
			opa = w_out;
			opb = out; // result of W_MUL1
			op = ADD;
		end

	// BEGIN ROUND 2
		X_MUL2 : begin
			x_ = out; // result of X_ADD1
			x_we = 1'b1;
			opa = y;
			opb = m[1][0];
			op = MUL;
		end
		Y_MUL2 : begin
			y_ = out; // result of Y_ADD1
			y_we = 1'b1;
			opa = y;
			opb = m[1][1];
			op = MUL;
		end
		Z_MUL2 : begin
			z_ = out; // result of Z_ADD1
			z_we = 1'b1;
			opa = y;
			opb = m[1][2];
			op = MUL;
		end
		W_MUL2 : begin
			w_ = out; // result of W_ADD1
			z_we = 1'b1;
			opa = y;
			opb = m[1][3];
			op = MUL;
		end
		X_ADD2 : begin
			opa = x_out;
			opb = out; // result of X_MUL2
			op = ADD;
		end
		Y_ADD2 : begin
			opa = y_out;
			opb = out; // result of Y_MUL2
			op = ADD;
		end
		Z_ADD2 : begin
			opa = z_out;
			opb = out; // result of Z_MUL2
			op = ADD;
		end
		W_ADD2 : begin
			opa = w_out;
			opb = out; // result of W_MUL2
			op = ADD;
		end

	// BEGIN ROUND 3
		X_MUL3 : begin
			x_ = out; // result of X_ADD2
			x_we = 1'b1;
			opa = z;
			opb = m[2][0];
			op = MUL;
		end
		Y_MUL3 : begin
			y_ = out; // result of Y_ADD2
			y_we = 1'b1;
			opa = z;
			opb = m[2][1];
			op = MUL;
		end
		Z_MUL3 : begin
			z_ = out; // result of Z_ADD2
			z_we = 1'b1;
			opa = z;
			opb = m[2][2];
			op = MUL;
		end
		W_MUL3 : begin
			w_ = out; // result of W_ADD2
			w_we = 1'b1;
			opa = z;
			opb = m[2][3];
			op = MUL;
		end
		X_ADD3 : begin
			opa = x_out;
			opb = out; // result of X_MUL3
			op = ADD;
		end
		Y_ADD3 : begin
			opa = y_out;
			opb = out; // result of Y_MUL3
			op = ADD;
		end
		Z_ADD3 : begin
			opa = z_out;
			opb = out; // result of Z_MUL3
			op = ADD;
		end
		W_ADD3 : begin
			opa = w_out;
			opb = out; // result of W_MUL3
			op = ADD;
		end

	// BEGIN ROUND 4
		X_MUL4 : begin
			x_ = out; // result of X_ADD3
			x_we = 1'b1;
			opa = w;
			opb = m[3][0];
			op = MUL;
		end
		Y_MUL4 : begin
			y_ = out; // result of Y_ADD3
			y_we = 1'b1;
			opa = w;
			opb = m[3][1];
			op = MUL;
		end
		Z_MUL4 : begin
			z_ = out; // result of Z_ADD3
			z_we = 1'b1;
			opa = w;
			opb = m[3][2];
			op = MUL;
		end
		W_MUL4 : begin
			w_ = out; // result of W_ADD3
			w_we = 1'b1;
			opa = w;
			opb = m[3][3];
			op = MUL;
		end
		X_ADD4 : begin
			opa = x_out;
			opb = out; // result of X_MUL4
			op = ADD;
		end
		Y_ADD4 : begin
			opa = y_out;
			opb = out; // result of Y_MUL4
			op = ADD;
		end
		Z_ADD4 : begin
			opa = z_out;
			opb = out; // result of Z_MUL4
			op = ADD;
		end
		W_ADD4 : begin
			opa = w_out;
			opb = out; // result of W_MUL4
			op = ADD;
		end

	// FINISH CALC
		X_DONE : begin
			x_ = out;
			x_we = 1'b1;
		end
		Y_DONE : begin
			y_ = out;
			y_we = 1'b1;
		end
		Z_DONE : begin
			z_ = out;
			z_we = 1'b1;
		end
		W_DONE : begin
			w_ = out;
			w_we = 1'b1;
		end

		
	// NORMALIZE VECTOR
		X_NORM1 : begin
			opa = x_out;
			opb = w_out;
			op = DIV;
		end
		Y_NORM1 : begin
			opa = y_out;
			opb = w_out;
			op = DIV;
		end
		Z_NORM1 : begin
			opa = z_out;
			opb = w_out;
			op = DIV;
		end
		W_NORM1 : begin
			w_ = 1.0;
			w_we = 1'b1;
		end
		X_NORM2 : begin
			x_ = out;
			x_we = 1'b1;
		end
		Y_NORM2 : begin
			y_ = out;
			y_we = 1'b1;
		end
		Z_NORM2 : begin
			z_ = out;
			z_we = 1'b1;
		end

		DONE : begin
			done = 1'b1;
		end

	endcase
	
end

endmodule