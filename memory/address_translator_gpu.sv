module address_translator_gpu (
    input  logic [9:0] x, y,
    output logic [16:0] addr
);

    int x_int, y_int, addr_int;

    assign x_int = x;
    assign y_int = y;
    assign addr_int = x_int + 320 * y_int;

    assign addr = addr_int[16:0];

endmodule