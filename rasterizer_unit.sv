module rasterizer_unit (
	input logic clk,
	input logic [31:0] p1[3], p2[3], p3[3]
);

enum {
	DONE
} state, next_state;

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
		DONE : begin
			
		end
	endcase
end

endmodule