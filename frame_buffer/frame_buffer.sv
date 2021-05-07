
module frame_buffer (
    // GPU Frame Buffer Inputs
    input logic gpu_clk, vga_clk,
    input logic [3:0] gpu_pixel_data,
    input logic [16:0] gpu_pixel_addr,
    input logic gpu_we,
    // VGA Display Adapter Inputs
    output logic [3:0] vga_pixel_data,
    input logic [16:0] vga_pixel_addr
);
    // Instantiate internal frame buffer
    logic [3:0] pixels [76800];

    // Memory initialization
    //int i;
    //initial begin
    //    for (i = 0; i < 310; i = i + 1) begin
    //        pixels[i] = 4'b1111;
    //    end
    //end

    always_ff @( posedge gpu_clk ) begin : frame_buffer_update
        // Synchronous write to selected address from gpu
        if (gpu_we)
            // Update line from gpu input
            pixels[gpu_pixel_addr] <= gpu_pixel_data;
    end

    always_ff @( posedge vga_clk ) begin : blockName
        // Synchronous read from frame buffer
        vga_pixel_data <= pixels[vga_pixel_addr];
    end

endmodule
