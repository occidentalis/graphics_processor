module testbench_mm();

timeunit 10ns;
timeprecision 1ns;

logic clk;
logic start;
logic [31:0] x, y, z; // fp numbers
logic [31:0] m[4][4]; // row major - fp numbers
logic [31:0] x_out, y_out, z_out; // fp numbers
logic done;
matrix_multiply mm(.*);

int state;
assign state = mm.state;


always begin : CLOCK_GENERATION
    #1 clk = ~clk;
end

initial begin : INITIALIZATION
    clk = 0;
    
    m[0][0] = 32'h3f100000;
    m[0][1] = 32'b0;
    m[0][2] = 32'b0;
    m[0][3] = 32'b0;

    m[1][0] = 32'b0;
    m[1][1] = 32'h3f800000;
    m[1][2] = 32'b0;
    m[1][3] = 32'b0;

    m[2][0] = 32'b0;
    m[2][1] = 32'b0;
    m[2][2] = 32'hbf9c71c7;
    m[2][3] = 32'hbf800000;

    m[3][0] = 32'b0;
    m[3][1] = 32'b0;
    m[3][2] = 32'hc1b1c71c;
    m[3][3] = 32'b0;

    x = 32'h41f00000;
    y = 32'hc1f00000;
    z = 32'hc2b3cccd;

end

initial begin : TEST_VECTORS
#2
#2 start = 1'b1;
#2 start = 1'b0;

end

endmodule