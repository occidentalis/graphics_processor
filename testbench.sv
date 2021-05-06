module testbench();

timeunit 1ns;

timeprecision 1ns;

logic Clk, VGA_HS, VGA_VS;
logic [3:0] VGA_R, VGA_G, VGA_B;
logic [9:0] pixel_x, pixel_y;
logic [14:0] pixel_addr;
logic blank, sync;
logic [1:0] Keys;


test_top_level top (.MAX10_CLK1_50(Clk), .Keys(Keys), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .pixel_x(pixel_x), .pixel_y(pixel_y), .pixel_addr(pixel_addr));

always begin : CLOCK_GENERATION
    #2 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION
    Clk = 0;
end

initial begin : Test
    #1 Keys[0] = 1'b1;

    #2 Keys[0] = 1'b0;

end

endmodule