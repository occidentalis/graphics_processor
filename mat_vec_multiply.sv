module mat_vec_multiply (
	input logic clk,
	input logic start,
	input logic [31:0] x, y, z, // fp numbers
	input logic [31:0] m[4][4], // row major - fp numbers
	output logic [31:0] x_out, y_out, z_out, // fp numbers
	output logic done
);

enum {
	DONE,
	START,
	RUN
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

logic [31:0] div_a, div_b, div_q;
logic [31:0] dot_a0, dot_b0, dot_a1, dot_b1, dot_a2, dot_b2, dot_a3, dot_b3, dot_q; 
fp_div     fpu2(.clk(clk), .areset(reset), .a(div_a), .b(div_b), .q(div_q));
fp_dot	   fpu3(.clk(clk), .areset(reset), .a0(dot_a0), .b0(dot_b0),
										   .a1(dot_a1), .b1(dot_b1),
										   .a2(dot_a2), .b2(dot_b2),
										   .a3(dot_a3), .b3(dot_b3), .q(dot_q));


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

	dot_a0 = 32'b0;
	dot_b0 = 32'b0; 
	dot_a1 = 32'b0; 
	dot_b1 = 32'b0;
	dot_a2 = 32'b0;
	dot_b2 = 32'b0;
	dot_a3 = 32'b0;
	dot_b3 = 32'b0;
	div_a = 32'b0;
	div_b = 32'b0;
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

	case (state)

		DONE : begin
			done = 1'b1;
			if (start) next_state = START;
		end

		START : begin
			reset = 1'b1;
			next_state = RUN;
		end
		
		RUN : begin
			case (cycle_count)
				1 : begin
					x_we = 1'b1;
					y_we = 1'b1;
					z_we = 1'b1;
					w_we = 1'b1;
					x_ = x;
					y_ = y;
					z_ = z;
					w_ = w;

					dot_a0 = x;
					dot_b0 = m[0][0];
					dot_a1 = y;
					dot_b1 = m[1][0];
					dot_a2 = z;
					dot_b2 = m[2][0];
					dot_a3 = w;
					dot_b3 = m[3][0];
				end
				2 : begin
					dot_a0 = x_out;
					dot_b0 = m[0][1];
					dot_a1 = y_out;
					dot_b1 = m[1][1];
					dot_a2 = z_out;
					dot_b2 = m[2][1];
					dot_a3 = w_out;
					dot_b3 = m[3][1];
				end
				3 : begin
					dot_a0 = x_out;
					dot_b0 = m[0][2];
					dot_a1 = y_out;
					dot_b1 = m[1][2];
					dot_a2 = z_out;
					dot_b2 = m[2][2];
					dot_a3 = w_out;
					dot_b3 = m[3][2];
				end
				4 : begin
					dot_a0 = x_out;
					dot_b0 = m[0][3];
					dot_a1 = y_out;
					dot_b1 = m[1][3];
					dot_a2 = z_out;
					dot_b2 = m[2][3];
					dot_a3 = w_out;
					dot_b3 = m[3][3];
				end
				9 : begin
					x_we = 1'b1;
					x_ = dot_q;
				end
				10 : begin
					y_we = 1'b1;
					y_ = dot_q;
				end
				11 : begin
					z_we = 1'b1;
					z_ = dot_q;
				end
				12 : begin
					w_we = 1'b1;
					w_ = dot_q;
				end
				13 : begin
					div_a = x_out;
					div_b = w_out;
				end
				14 : begin
					div_a = y_out;
					div_b = w_out;
				end
				15 : begin
					div_a = z_out;
					div_b = w_out;
				end
				16 : begin
					w_we = 1'b1;
					w_ = w;
				end
				22 : begin
					x_we = 1'b1;
					x_ = div_q;
				end
				23 : begin
					y_we = 1'b1;
					y_ = div_q;
				end
				24 : begin
					z_we = 1'b1;
					z_ = div_q;
					next_state = DONE;
				end
			endcase
		end
	endcase
end

endmodule