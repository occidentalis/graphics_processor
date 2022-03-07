module testbench_ru();

timeunit 10ns;
timeprecision 1ns;

logic clk, sreset, start;
logic [31:0] p1[3], p2[3], p3[3]; // in raster coordinates
logic [3:0] color;
logic done;
logic fb_we;
logic [9:0] rast_x;
logic [9:0] rast_y;
logic [3:0] fb_data;
logic zb_we;
logic [7:0] zb_wdata;
logic [7:0] zb_rdata;
logic [31:0] display_width, display_height;

rasterizer_unit ru(.*);

assign zb_rdata = 8'hFF;

// logic w_en;
// logic [16:0] w_addr;
// logic [5:0] w_data;
// logic [16:0] r_addr;
// logic [5:0] r_data;

// z_buffer zu(.*);

// assign w_en = zb_we;
// assign w_addr = zb_x + 320 * zb_y;
// assign w_data = zb_wdata;
// assign r_addr = w_addr;

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
assign c1 = ru.e1_pixel;
assign c2 = ru.e2_pixel;
assign c3 = ru.e3_pixel;

logic [31:0] inv_area, z1_inv, z2_inv, z3_inv;
assign inv_area = ru.inv_area;
assign z1_inv = ru.z1_inv;
assign z2_inv = ru.z2_inv;
assign z3_inv = ru.z3_inv;

always begin : CLOCK_GENERATION
    #1 clk = ~clk;
end

initial begin : INITIALIZATION
    clk = 0;
    
    p1[0] = 32'hbf000000; // (-0.5, 0.5, 0)
    p1[1] = 32'h3f000000;
    p1[2] = 32'h3dcccccd;
    p2[0] = 32'hbf000000; // (-0.5, -0.5, 0)
    p2[1] = 32'hbf000000;
    p2[2] = 32'h3dcccccd;
    p3[0] = 32'h3f000000; // (0.5, 0, 0)
    p3[1] = 32'h0;
    p3[2] = 32'h3dcccccd;

    display_width = 32'h43200000;
    display_height = 32'h42f00000;
	 
	// p1[0] = 32'h438c0000; // (280.0, 69.0, 1.0)
    // p1[1] = 32'h428a0000;
    // p1[2] = 32'h3f800000;

    // p2[0] = 32'h42280000; // (42.0, 69.0, 1.0)
    // p2[1] = 32'h428a0000;
    // p2[2] = 32'h3f800000;

    // p3[0] = 32'h42600000; // (56.0, 169.0, 1.0)
    // p3[1] = 32'h43290000;
    // p3[2] = 32'h3f800000;

end

initial begin : TEST_VECTORS

    #2 sreset = 1;
    #2 sreset = 0;
    #10
    #2 start = 1;
    #2 start = 0;

end

endmodule