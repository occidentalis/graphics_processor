module address_translator (
	 input logic Clk,
    input logic [9:0] pixel_x, pixel_y,
    output logic [14:0] address
);

    logic [14:0] address_x, address_y;

    always_comb begin : translator
        address_x = {7'b000000, pixel_x[9:1]};
        address_y = {7'b000000, pixel_y[9:1]} * 15'b000000101000000;
        address = address_x + address_y;
    end

endmodule