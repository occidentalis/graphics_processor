module test_top_level (
    input  logic       MAX10_CLK1_50,

    output logic       VGA_HS,
    output logic       VGA_VS,
    output logic [3:0] VGA_R,
    output logic [3:0] VGA_G,
    output logic [3:0] VGA_B
);
    logic gpu_clk;
    logic blank;

    logic Reset;

    logic [3:0] gpu_data;
    logic [14:0] gpu_addr;
    logic gpu_we;

    logic [3:0] frame_data;

    logic [3:0]  vga_data;
    logic [14:0] vga_addr;
    
    gpu_pll graphtime (.areset(Reset), .inclk0(MAX10_CLK1_50), .c0(gpu_clk));
    vga_controller display_adapter (.Clk(MAX10_CLK1_50), .Reset(Reset), .hs(VGA_HS), .vs(VGA_VS), .blank(blank), .pixel_addr(vga_addr));
    frame_buffer frame0 (.gpu_clk(MAX10_CLK1_50), .gpu_pixel_data(gpu_data), .gpu_pixel_addr(gpu_addr), .gpu_we(gpu_we), .vga_pixel_data(frame_data), .vga_pixel_addr(vga_addr));

    always_comb begin : vga_blank_mux
        if (blank)
            vga_data = frame_data;
        else
            vga_data = 4'b0000;
    end

    assign gpu_data = 4'b0000;
    assign gpu_addr = 15'b000000000000000;
    assign gpu_we = 1'b0;

    assign VGA_R = vga_data;
    assign VGA_G = vga_data;
    assign VGA_B = vga_data;
    assign Reset = 1'b0;

endmodule