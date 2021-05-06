
module frame_buffer (
    // GPU Frame Buffer Inputs
    input logic gpu_clk,
    input logic [3:0] gpu_pixel_input,
    input logic [14:0] gpu_pixel_addr,
    input logic gpu_we,
    // VGA Display Adapter Inputs
    output logic [3:0] vga_pixel_output,
    input logic [14:0] vga_pixel_addr
);
    // Instantiate internal frame buffer
    logic [3:0] pixels [76800];

    always_ff @( posedge gpu_clk ) begin : frame_buffer_update
        // Synchronous read from frame buffer
        vga_pixel_output <= pixels[vga_pixel_addr];

        // Synchronous write to selected address from gpu
        if (gpu_we)
            // Update line from gpu input
            pixels[gpu_pixel_addr] <= gpu_pixel_input;
    end

endmodule