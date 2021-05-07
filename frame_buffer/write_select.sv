module write_select (
    input logic [16:0] address_in,
    input logic [3:0] write_data_in,
    input logic [15:0] old_data_in,
    output logic [14:0] address_out,
    output logic [15:0] write_data_out
);

    always_comb begin : data_mux
        case (address_in [1:0])
            2'b00 : write_data_out = {old_data_in[15:4], write_data_in};
            2'b01 : write_data_out = {old_data_in[15:8], write_data_in, old_data_in[3:0]};
            2'b10 : write_data_out = {old_data_in[15:12], write_data_in, old_data_in[7:0]};
            2'b11 : write_data_out = {write_data_in, old_data_in[11:0]};
        endcase
    end

    assign address_out = address_in [16:2];

endmodule