module reg_32 (
    input logic clk, write_en, reset,
    input logic [31:0] data_in,
    output logic [31:0] data_out
);

logic [31:0] register;

always_ff @(posedge clk) begin
    
    if (reset)
        register = 32'b0;
    else if (write_en)
        register = data_in;
end

assign data_out = register;

endmodule