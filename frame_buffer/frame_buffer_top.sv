module frame_buffer_top (
    input logic gpu_access,
    input logic [9:0] gpu_x, gpu_y,
    input logic [3:0] gpu_data,
    input gpu_we, gpu_clk, vga_clk, reset,
    output [3:0] vga_r, vga_g, vga_b,
    output vga_hs, vga_vs
);
    
    logic [16:0] gpu_address_long, vga_address_long;
    logic [14:0] gpu_address_short, vga_address_short, buffer_rd_address;
    logic [9:0] vga_x, vga_y;
    logic [3:0] vga_data;
    logic [15:0] mem_in, mem_out;
    logic [3:0] vga_out, display_out, vga_intern;
    logic vga_mux, we_guard, display;

    address_translator_gpu gpu_to_buffer (.pixel_x(gpu_x), .pixel_y(gpu_y), .address(gpu_address_long)); // Check
    address_translator_vga buffer_to_vga (.pixel_x(vga_x), .pixel_y(vga_y), .address(vga_address_long)); // Check
    read_select vga_word_sel (.address_in(vga_address_long), .address_out(vga_address_short), .data_in(mem_out), .vga_out(vga_out)); // Check
    write_select gpu_word_sel (.address_in(gpu_address_long), .address_out(gpu_address_short), .write_data_in(gpu_data), .old_data_in(mem_out), .write_data_out(mem_in)); // Check
    vga_controller controller (.Clk(vga_clk), .Reset(reset), .hs(vga_hs), .vs(vga_vs), .blank(display), .DrawX(vga_x), .DrawY(vga_y)); // Check
    video_buffer buffer (.data(mem_in), .rdaddress(buffer_rd_address), .rdclock(vga_clk), .wraddress(gpu_address_short), .wrclock(gpu_clk), .wren(we_guard), .q(mem_out)); // Check

    always_comb begin : display_mux_block
         case (1'b1)
            1'b0 : display_out = 4'b0000;
            1'b1 : display_out = vga_intern;
         endcase
    end

    always_comb begin : control_mux
        case (gpu_access)
            1'b1 : begin
                buffer_rd_address = gpu_address_short;
                we_guard = gpu_we;
                vga_intern = 4'b0000;
            end
            1'b0 : begin
                buffer_rd_address = vga_address_short;
                we_guard = gpu_we;
                vga_intern = vga_out;
            end
        endcase
    end

    assign vga_r = display_out;
    assign vga_g = display_out;
    assign vga_b = display_out;
endmodule