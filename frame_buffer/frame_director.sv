module frame_director (
    input reset,
    input logic [9:0] gpu_x, gpu_y,
    input logic [3:0] gpu_data,
    input gpu_we, gpu_done, gpu_clk_150, vga_clk_50,
    output [3:0] vga_r, vga_g, vga_b,
    output vga_hs, vga_vs,
    output gpu_start
);

// Internal VGA X and Y coordinates
logic [9:0] vga_x_internal, vga_y_internal;
// Internal memory access addresses
logic [16:0] gpu_address_internal, vga_address_internal;
// Internal VGA data busses
logic [3:0] vga_data_0_internal, vga_data_1_internal, display_out_internal, selected_buffer_data_internal;
// Internal VGA display enable signal
logic vga_enable_internal;
// Internally generate write enable signals
logic buffer_we_0_internal, buffer_we_1_internal;
// Internal storage of currently writing buffer
logic write_buffer_num_internal;
// Internal register for gpu_start
logic buffer_swap_internal, prev_vs_internal;

// Instantiate VGA controller, two frame buffers, and two address translators
vga_controller vga (.Clk(vga_clk_50), .Reset(reset), .hs(vga_hs), .vs(vga_vs), .blank(vga_enable_internal), .DrawX(vga_x_internal), .DrawY(vga_y_internal));
frame_buffer buffer0 (.gpu_clk(gpu_clk_150), .vga_clk(vga_clk_50), .gpu_pixel_data(gpu_data), .gpu_pixel_addr(gpu_address_internal), .gpu_we(buffer_we_0_internal), .vga_pixel_data(vga_data_0_internal), .vga_pixel_addr(vga_address_internal));
frame_buffer buffer1 (.gpu_clk(gpu_clk_150), .vga_clk(vga_clk_50), .gpu_pixel_data(gpu_data), .gpu_pixel_addr(gpu_address_internal), .gpu_we(buffer_we_1_internal), .vga_pixel_data(vga_data_1_internal), .vga_pixel_addr(vga_address_internal));
address_translator gpu_to_buffer (.pixel_x(gpu_x), .pixel_y(gpu_y), .address(gpu_address_internal));
address_translator buffer_to_vga (.pixel_x(vga_x_internal), .pixel_y(vga_y_internal), .address(vga_address_internal));

always_comb begin : output_muxes
    // Disable data output when display is within front or back porch
    case (vga_enable_internal)
        1'b0 : display_out_internal = 4'b0000;
        1'b1 : display_out_internal = selected_buffer_data_internal;
    endcase

    // Select which buffer to read from and write to
    case (write_buffer_num_internal)
        1'b0 : begin
                    selected_buffer_data_internal = vga_data_1_internal;
                    buffer_we_0_internal = gpu_we;
                    buffer_we_1_internal = 1'b0;
               end
        1'b1 : begin
                    selected_buffer_data_internal = vga_data_0_internal;
                    buffer_we_0_internal = 1'b0;
                    buffer_we_1_internal = gpu_we;
               end
    endcase
end

// Connect the internal display outputs to the VGA DAC
assign vga_r = display_out_internal;
assign vga_g = display_out_internal;
assign vga_b = display_out_internal;

// Connect the internal gpu_start flag to the external port
assign gpu_start = buffer_swap_internal;
assign write_buffer_num_internal = gpu_done;

endmodule