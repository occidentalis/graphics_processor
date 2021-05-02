module graphics_processor(
	input logic clk
);

	logic start;
	logic [31:0] x, y, z; // fp numbers
	logic [31:0] m[4][4]; // row major - fp numbers
	logic [31:0] x_out, y_out, z_out; // fp numbers
	logic done;

multVecMatrix mvm(.*);

endmodule