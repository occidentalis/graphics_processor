module testbench_su();

timeunit 10ns;
timeprecision 1ns;

logic clk, start, sreset;
logic [31:0] p1[3], p2[3], p3[3]; // in NDC coordinates
logic [31:0] view_vector[3];
logic [3:0] color;
logic done;
shader_unit su(.*);

logic [31:0] ax, ay, az, bx, by, bz, cx, cy, cz;
assign ax = su.ax;
assign ay = su.ay;
assign az = su.az;
assign bx = su.bx;
assign by = su.by;
assign bz = su.bz;
assign cx = su.cx;
assign cy = su.cy;
assign cz = su.cz;

int state;
assign state = su.state;

logic [31:0] dot_q;
assign dot_q = su.dot_q;

always begin : CLOCK_GENERATION
    #1 clk = ~clk;
end

initial begin : INITIALIZATION
    clk = 0;
    
    
end

initial begin : TEST_VECTORS

    p1[0] = 32'hbf000000; // (-0.5, 0.5, 0)
    p1[1] = 32'h3f000000;
    p1[2] = 32'h3dcccccd;
    p2[0] = 32'hbf000000; // (-0.5, -0.5, 0)
    p2[1] = 32'hbf000000;
    p2[2] = 32'h3dcccccd;
    p3[0] = 32'h3f000000; // (0.5, 0, 0)
    p3[1] = 32'h0;
    p3[2] = 32'h3dcccccd;

    view_vector[0] = 32'h3e715bdd;
    view_vector[1] = 32'h3f715bee;
    view_vector[2] = 32'h3e715bdd;

#2
#2 start = 1'b1;
#2 start = 1'b0;

end

endmodule