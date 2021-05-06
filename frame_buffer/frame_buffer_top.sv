module frame_buffer_top (
    input reset,
    input logic [9:0] gpu_x, gpu_y,
    input logic [3:0] gpu_data,
    input gpu_we, gpu_clk_150, vga_clk_50;
    output [3:0] vga_r, vga_g, vga_b,
    output vga_hs, vga_vs
);

logic [9:0] vga_x_internal, vga_y_internal;
logic [16:0] gpu_address_internal, vga_address_internal;
logic [3:0] vga_data_internal, display_out_internal;
logic vga_display_internal;

vga_controller vga (.Clk(vga_clk_50), .Reset(reset), .hs(vga_hs), .vs(vga_vs), .blank(vga_display_internal), .DrawX(vga_x_internal), .DrawY(vga_y_internal));
frame_buffer buffer (.gpu_clk(gpu_clk_150), .gpu_pixel_data(gpu_data), .gpu_pixel_addr(gpu_address_internal), .gpu_we(gpu_we), .vga_pixel_data(vga_data_internal), .vga_pixel_addr(vga_address_internal));
address_translator gpu_to_buffer (.pixel_x(gpu_x), .pixel_y(gpu_y), .address(gpu_address_internal));
address_translator buffer_to_vga (.pixel_x(vga_x_internal), .pixel_y(vga_y_internal), .address(vga_address_internal));

always_comb begin : vga_porch_block
    if (vga_display_internal)
        display_out_internal = vga_data_internal;
    else
        display_out_internal = 4'b0000;
end

assign vga_r = display_out_internal;
assign vga_g = display_out_internal;
assign vga_b = display_out_internal;

endmodule