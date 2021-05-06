module test_top_level (
    input  logic        MAX10_CLK1_50,
    input  logic [1:0]  Keys,
    output logic        VGA_HS,
    output logic        VGA_VS,
    output logic [3:0]  VGA_R,
    output logic [3:0]  VGA_G,
    output logic [3:0]  VGA_B,
    output logic [14:0] pixel_addr,
    output logic [9:0]  pixel_x, pixel_y 
);
    logic blank;
    logic Reset;

    logic [3:0] test_data;

    logic [3:0]  vga_data;
    logic [14:0] vga_addr;

    logic sync, pixel_clk;
    
    vga_controller display_adapter (.Clk(MAX10_CLK1_50), .Reset(Reset), .hs(VGA_HS), .vs(VGA_VS), .blank(blank), .DrawX(pixel_x), .DrawY(pixel_y), .sync(sync), .pixel_clk(pixel_clk));
    address_translator translate (.pixel_x(pixel_x), .pixel_y(pixel_y), .address(vga_addr));

    always_comb begin : vga_blank_mux
        if (blank) begin
            vga_data = test_data;
        end else begin
            vga_data = 4'b0000;
		  end
        if (vga_addr < 15'b000011111111111)
            test_data = 4'b1111;
        else
            test_data = 4'b1010;
    end

    assign VGA_R = vga_data;
    assign VGA_G = vga_data;
    assign VGA_B = vga_data;
	assign pixel_addr = vga_addr;
    assign Reset = !Keys[0];
    

endmodule