module z_buffer (
    input logic clk,
    input logic w_en,
    input logic [16:0] w_addr,
    input logic [5:0] w_data,
    input logic [16:0] r_addr
    output logic [5:0] r_data,
);
    // Instantiate internal frame buffer
    logic [5:0] pixels [76800];

    // Memory initialization
//    int i;
//    initial begin
//        for (i = 0; i < 310; i = i + 1) begin
//            pixels[i] = 4'b1111;
//        end
//    end

    always_ff @( posedge clk ) begin : z_buffer_update
        // Synchronous read from z buffer
        r_data <= pixels[r_addr];

        // Synchronous write to selected address from gpu
        if (w_en)
            // Update line from gpu input
            pixels[w_addr] <= w_data;
    end

endmodule
