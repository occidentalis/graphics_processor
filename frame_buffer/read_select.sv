module read_select (
    input logic [16:0] address_in,
    output logic [14:0] address_out,
    input [15:0] data_in,
    output [3:0] vga_out
);
    
    always_comb begin : data_mux
        case (address_in [1:0])
            2'b00 : vga_out = data_in [3:0];
            2'b01 : vga_out = data_in [7:4];
            2'b10 : vga_out = data_in [11:8];
            2'b11 : vga_out = data_in [15:12];
        endcase
    end

    assign address_out = address_in [16:2];

endmodule