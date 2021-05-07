module testbench_ru();

timeunit 10ns;
timeprecision 1ns;

logic clk, areset, start;
logic [31:0] p1[3], p2[3], p3[3]; // in raster coordinates
logic [31:0] near_clip_z, far_clip_z;
logic done;
logic [9:0] fb_x;
logic [9:0] fb_y;
logic [3:0] data;
logic fb_we;

rasterizer_unit ru(.*);

int state;
assign state = ru.state;

int cycle_count;
assign cycle_count = ru.cycle_count;

logic [31:0] p1x, p1y, p2x, p2y, p3x, p3y;
assign p1x = ru.p1x;
assign p1y = ru.p1y;
assign p2x = ru.p2x;
assign p2y = ru.p2y;
assign p3x = ru.p3x;
assign p3y = ru.p3y;

logic [31:0] rx, ty, lx, by;
assign rx = ru.rx;
assign ty = ru.ty;
assign lx = ru.lx;
assign by = ru.by;

logic [31:0] curr_x, curr_y, x_inc;
assign curr_x = ru.curr_x;
assign curr_y = ru.curr_y;
assign x_inc = ru.x_inc;

logic [31:0] dx1, dy1, dx2, dy2, dx3, dy3;
assign dx1 = ru.dx1;
assign dy1 = ru.dy1;
assign dx2 = ru.dx2;
assign dy2 = ru.dy2;
assign dx3 = ru.dx3;
assign dy3 = ru.dy3;

logic [31:0] e1, e2, e3;
assign e1 = ru.e1;
assign e2 = ru.e2;
assign e3 = ru.e3;

logic [31:0] c1, c2, c3;
assign c1 = e1 + (curr_x) * dy1 - (curr_y) * dx1;
assign c2 = e2 + (curr_x) * dy2 - (curr_y) * dx2;
assign c3 = e3 + (curr_x) * dy3 - (curr_y) * dx3;

always begin : CLOCK_GENERATION
    #1 clk = ~clk;
end

initial begin : INITIALIZATION
    clk = 0;
    p1[0] = 32'h428a0000; // (69.0, 69.0, 1.0)
    p1[1] = 32'h428a0000;
    p1[2] = 32'h3f800000;

    p2[0] = 32'h428a0000; // (69.0, 169.0, 1.0)
    p2[1] = 32'h43290000;
    p2[2] = 32'h3f800000;

    p3[0] = 32'h43290000; // (169.0, 69.0, 1.0)
    p3[1] = 32'h428a0000;
    p3[2] = 32'h3f800000;
end

initial begin : TEST_VECTORS
    #2 areset = 1;
    #2 areset = 0;
    #10
    #2 start = 1;
    #2 start = 0;

end

endmodule