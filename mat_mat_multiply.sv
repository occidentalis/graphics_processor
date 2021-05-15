module mat_mat_multiply (
    input logic clk, start,
    input logic [31:0] a[4][4],
    input logic [31:0] b[4][4],
    output logic [31:0] c[4][4]
);

logic reset;

enum {
    DONE, RUN
} state, next_state;

int subcycle = 1;
always_ff @(posedge clk) begin
	if (state == next_state)
		subcycle <= subcycle + 1;
	else
		subcycle <= 1;
end

logic c00_we, c01_we, c02_we, c03_we;
logic c10_we, c11_we, c12_we, c13_we;
logic c20_we, c21_we, c22_we, c23_we;
logic c30_we, c31_we, c32_we, c33_we;
logic [31:0] c00_in, c01_in, c02_in, c03_in;
logic [31:0] c10_in, c11_in, c12_in, c13_in;
logic [31:0] c20_in, c21_in, c22_in, c23_in;
logic [31:0] c30_in, c31_in, c32_in, c33_in;
logic [31:0] c00, c01, c02, c03;
logic [31:0] c10, c11, c12, c13;
logic [31:0] c20, c21, c22, c23;
logic [31:0] c30, c31, c32, c33;
reg_32 c00_reg(.clk(clk), .write_en(c00_we), .reset(reset), .data_in(c00_in), .data_out(c00));
reg_32 c01_reg(.clk(clk), .write_en(c01_we), .reset(reset), .data_in(c01_in), .data_out(c01));
reg_32 c02_reg(.clk(clk), .write_en(c02_we), .reset(reset), .data_in(c02_in), .data_out(c02));
reg_32 c03_reg(.clk(clk), .write_en(c03_we), .reset(reset), .data_in(c03_in), .data_out(c03));
reg_32 c10_reg(.clk(clk), .write_en(c10_we), .reset(reset), .data_in(c10_in), .data_out(c10));
reg_32 c11_reg(.clk(clk), .write_en(c11_we), .reset(reset), .data_in(c11_in), .data_out(c11));
reg_32 c12_reg(.clk(clk), .write_en(c12_we), .reset(reset), .data_in(c12_in), .data_out(c12));
reg_32 c13_reg(.clk(clk), .write_en(c13_we), .reset(reset), .data_in(c13_in), .data_out(c13));
reg_32 c20_reg(.clk(clk), .write_en(c20_we), .reset(reset), .data_in(c20_in), .data_out(c20));
reg_32 c21_reg(.clk(clk), .write_en(c21_we), .reset(reset), .data_in(c21_in), .data_out(c21));
reg_32 c22_reg(.clk(clk), .write_en(c22_we), .reset(reset), .data_in(c22_in), .data_out(c22));
reg_32 c23_reg(.clk(clk), .write_en(c23_we), .reset(reset), .data_in(c23_in), .data_out(c23));
reg_32 c30_reg(.clk(clk), .write_en(c30_we), .reset(reset), .data_in(c30_in), .data_out(c30));
reg_32 c31_reg(.clk(clk), .write_en(c31_we), .reset(reset), .data_in(c31_in), .data_out(c31));
reg_32 c32_reg(.clk(clk), .write_en(c32_we), .reset(reset), .data_in(c32_in), .data_out(c32));
reg_32 c33_reg(.clk(clk), .write_en(c33_we), .reset(reset), .data_in(c33_in), .data_out(c33));

assign c[0][0] = c00;
assign c[0][1] = c01;
assign c[0][2] = c02;
assign c[0][3] = c03;
assign c[1][0] = c10;
assign c[1][1] = c11;
assign c[1][2] = c12;
assign c[1][3] = c13;
assign c[2][0] = c20;
assign c[2][1] = c21;
assign c[2][2] = c22;
assign c[2][3] = c23;
assign c[3][0] = c30;
assign c[3][1] = c31;
assign c[3][2] = c32;
assign c[3][3] = c33;

logic [31:0] dot_a0, dot_b0, dot_a1, dot_b1, dot_a2, dot_b2, dot_a3, dot_b3, dot_q;
fp_dot fpu0(.ckk(clk), .reset(reset), .a0(dot_a0), .b0(dot_b0),
                                      .a1(dot_a1), .b1(dot_b1),
                                      .a2(dot_a2), .b2(dot_b2),
                                      .a3(dot_a3), .b3(dot_b3), .q(dot_q));

always_comb begin : fsm

    next_state = state;
    
    c00_we = 1'b0;
    c01_we = 1'b0;
    c02_we = 1'b0;
    c03_we = 1'b0;
    c10_we = 1'b0;
    c11_we = 1'b0;
    c12_we = 1'b0;
    c13_we = 1'b0;
    c20_we = 1'b0;
    c21_we = 1'b0;
    c22_we = 1'b0;
    c23_we = 1'b0;
    c30_we = 1'b0;
    c31_we = 1'b0;
    c32_we = 1'b0;
    c33_we = 1'b0;

    c00_in = 32'b0;
    c01_in = 32'b0;
    c02_in = 32'b0;
    c03_in = 32'b0;
    c10_in = 32'b0;
    c11_in = 32'b0;
    c12_in = 32'b0;
    c13_in = 32'b0;
    c20_in = 32'b0;
    c21_in = 32'b0;
    c22_in = 32'b0;
    c23_in = 32'b0;
    c30_in = 32'b0;
    c31_in = 32'b0;
    c32_in = 32'b0;
    c33_in = 32'b0;
    
    case (state)
        DONE : begin
            if (start) next_state = RUN;
        end

        RUN : begin
            case (subcycle)
                1 : begin
                    dot_a0 = a[0][0]; // 0, 0
                    dot_a1 = a[0][1];
                    dot_a2 = a[0][2];
                    dot_a3 = a[0][3];
                    dot_b0 = b[0][0];
                    dot_b0 = b[1][0];
                    dot_b0 = b[2][0];
                    dot_b0 = b[3][0];
                end
                2 : begin
                    dot_a0 = a[0][0]; // 0, 1
                    dot_a1 = a[0][1];
                    dot_a2 = a[0][2];
                    dot_a3 = a[0][3];
                    dot_b0 = b[0][1];
                    dot_b0 = b[1][1];
                    dot_b0 = b[2][1];
                    dot_b0 = b[3][1];
                end
                3 : begin
                    dot_a0 = a[0][0]; // 0, 2
                    dot_a1 = a[0][1];
                    dot_a2 = a[0][2];
                    dot_a3 = a[0][3];
                    dot_b0 = b[0][2];
                    dot_b0 = b[1][2];
                    dot_b0 = b[2][2];
                    dot_b0 = b[3][2];
                end
                4 : begin
                    dot_a0 = a[0][0]; // 0, 3
                    dot_a1 = a[0][1];
                    dot_a2 = a[0][2];
                    dot_a3 = a[0][3];
                    dot_b0 = b[0][3];
                    dot_b0 = b[1][3];
                    dot_b0 = b[2][3];
                    dot_b0 = b[3][3];
                end
                5 : begin
                    dot_a0 = a[1][0]; // 1, 0
                    dot_a1 = a[1][1];
                    dot_a2 = a[1][2];
                    dot_a3 = a[1][3];
                    dot_b0 = b[0][0];
                    dot_b0 = b[1][0];
                    dot_b0 = b[2][0];
                    dot_b0 = b[3][0];
                end
                6 : begin
                    dot_a0 = a[1][0]; // 1, 1
                    dot_a1 = a[1][1];
                    dot_a2 = a[1][2];
                    dot_a3 = a[1][3];
                    dot_b0 = b[0][1];
                    dot_b0 = b[1][1];
                    dot_b0 = b[2][1];
                    dot_b0 = b[3][1];
                end
                7 : begin
                    dot_a0 = a[1][0]; // 1, 2
                    dot_a1 = a[1][1];
                    dot_a2 = a[1][2];
                    dot_a3 = a[1][3];
                    dot_b0 = b[0][2];
                    dot_b0 = b[1][2];
                    dot_b0 = b[2][2];
                    dot_b0 = b[3][2];
                end
                8 : begin
                    dot_a0 = a[1][0]; // 1, 3
                    dot_a1 = a[1][1];
                    dot_a2 = a[1][2];
                    dot_a3 = a[1][3];
                    dot_b0 = b[0][3];
                    dot_b0 = b[1][3];
                    dot_b0 = b[2][3];
                    dot_b0 = b[3][3];
                end
                9 : begin
                    dot_a0 = a[2][0]; // 2, 0
                    dot_a1 = a[2][1];
                    dot_a2 = a[2][2];
                    dot_a3 = a[2][3];
                    dot_b0 = b[0][0];
                    dot_b0 = b[1][0];
                    dot_b0 = b[2][0];
                    dot_b0 = b[3][0];

                    c00_we = 1'b1;
                    c00_in = dot_q;
                end
                10 : begin
                    dot_a0 = a[2][0]; // 2, 1
                    dot_a1 = a[2][1];
                    dot_a2 = a[2][2];
                    dot_a3 = a[2][3];
                    dot_b0 = b[0][1];
                    dot_b0 = b[1][1];
                    dot_b0 = b[2][1];
                    dot_b0 = b[3][1];

                    c01_we = 1'b1;
                    c01_in = dot_q;
                end
                11 : begin
                    dot_a0 = a[2][0]; // 2, 2
                    dot_a1 = a[2][1];
                    dot_a2 = a[2][2];
                    dot_a3 = a[2][3];
                    dot_b0 = b[0][2];
                    dot_b0 = b[1][2];
                    dot_b0 = b[2][2];
                    dot_b0 = b[3][2];

                    c02_we = 1'b1;
                    c02_in = dot_q;
                end
                12 : begin
                    dot_a0 = a[2][0]; // 2, 3
                    dot_a1 = a[2][1];
                    dot_a2 = a[2][2];
                    dot_a3 = a[2][3];
                    dot_b0 = b[0][3];
                    dot_b0 = b[1][3];
                    dot_b0 = b[2][3];
                    dot_b0 = b[3][3];

                    c03_we = 1'b1;
                    c03_in = dot_q;
                end
                13 : begin
                    dot_a0 = a[3][0]; // 3, 0
                    dot_a1 = a[3][1];
                    dot_a2 = a[3][2];
                    dot_a3 = a[3][3];
                    dot_b0 = b[0][0];
                    dot_b0 = b[1][0];
                    dot_b0 = b[2][0];
                    dot_b0 = b[3][0];

                    c10_we = 1'b1;
                    c10_in = dot_q;
                end
                14 : begin
                    dot_a0 = a[3][0]; // 3, 1
                    dot_a1 = a[3][1];
                    dot_a2 = a[3][2];
                    dot_a3 = a[3][3];
                    dot_b0 = b[0][1];
                    dot_b0 = b[1][1];
                    dot_b0 = b[2][1];
                    dot_b0 = b[3][1];

                    c11_we = 1'b1;
                    c11_in = dot_q;
                end
                15 : begin
                    dot_a0 = a[3][0]; // 3, 2
                    dot_a1 = a[3][1];
                    dot_a2 = a[3][2];
                    dot_a3 = a[3][3];
                    dot_b0 = b[0][2];
                    dot_b0 = b[1][2];
                    dot_b0 = b[2][2];
                    dot_b0 = b[3][2];

                    c12_we = 1'b1;
                    c12_in = dot_q;
                end
                16 : begin
                    dot_a0 = a[3][0]; // 3, 3
                    dot_a1 = a[3][1];
                    dot_a2 = a[3][2];
                    dot_a3 = a[3][3];
                    dot_b0 = b[0][3];
                    dot_b0 = b[1][3];
                    dot_b0 = b[2][3];
                    dot_b0 = b[3][3];

                    c13_we = 1'b1;
                    c13_in = dot_q;
                end
                17 : begin
                    c20_we = 1'b1;
                    c20_in = dot_q;
                end
                18 : begin
                    c21_we = 1'b1;
                    c21_in = dot_q;
                end
                19 : begin
                    c22_we = 1'b1;
                    c22_in = dot_q;
                end
                20 : begin
                    c23_we = 1'b1;
                    c23_in = dot_q;
                end
                21 : begin
                    c30_we = 1'b1;
                    c30_in = dot_q;
                end
                22 : begin
                    c31_we = 1'b1;
                    c31_in = dot_q;
                end
                23 : begin
                    c32_we = 1'b1;
                    c32_in = dot_q;
                end
                24 : begin
                    c33_we = 1'b1;
                    c33_in = dot_q;

                    next_state = DONE;
                end
            endcase
        end 
    endcase
end

endmodule