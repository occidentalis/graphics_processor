module address_translator_gpu (
    input logic  [9:0] pixel_x, pixel_y,
    output logic [16:0] address
);

    logic [16:0] address_x, address_y;

    always_comb begin : translator
        address_x = {7'b0000000, pixel_x[9:0]};
        address_y = {7'b0000000, pixel_y[9:0]} * 17'b00000000101000000;
        address = address_x + address_y;
    end

endmodule