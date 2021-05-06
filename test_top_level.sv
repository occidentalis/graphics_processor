module test_top_level (
    input  logic        MAX10_CLK1_50,
    input  logic [1:0]  Keys,
    output logic        VGA_HS,
    output logic        VGA_VS,
    output logic [3:0]  VGA_R,
    output logic [3:0]  VGA_G,
    output logic [3:0]  VGA_B
);
    logic reset;
    logic gpu_clk_internal;

    gpu_pll gpu_clk_gen (.areset(1'b0), .inclk0(MAX10_CLK1_50), .c0(gpu_clk_internal));
    frame_buffer_top buff (.reset(reset), .gpu_x(9'b000000000), .gpu_y(9'b000000000), .gpu_data(4'b0000), .gpu_we(1'b0), .gpu_clk_150(gpu_clk_internal), .vga_clk_50(MAX10_CLK1_50), .vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B), .vga_hs(VGA_HS), .vga_vs(VGA_VS));

    assign reset = !Keys[0];
endmodule