module shader_unit (
    input logic clk, start, sreset,
    input logic [31:0] p1[3], p2[3], p3[3], // in NDC coordinates
    input logic [31:0] view_vector[3],
    output logic [3:0] color,
    output logic done
);

enum {
    DONE, START, CALC_NORMAL, COMPARE
} state, next_state;

int subcycle = 1;
always_ff @(posedge clk) begin
	if (state == next_state)
		subcycle <= subcycle + 1;
	else
		subcycle <= 1;

	if (sreset == 1)
		state <= DONE;
	else
		state <= next_state;
end

logic reset;

logic [31:0] addsub_a, addsub_b, addsub_q, addsub_s;
fp_add_sub fpu0(.clk(clk), .areset(reset), .a(addsub_a), .b(addsub_b), .q(addsub_q), .s(addsub_s));

logic [31:0] mul_a, mul_b, mul_q;
fp_mul fpu1(.clk(clk), .areset(reset), .a(mul_a), .b(mul_b), .q(mul_q));

logic [31:0] sqrt_a, sqrt_q;
fp_sqrt fpu2(.clk(clk), .areset(reset), .a(sqrt_a), .q(sqrt_q));

logic [31:0] div_a, div_b, div_q;
fp_div fpu3(.clk(clk), .areset(reset), .a(div_a), .b(div_b), .q(div_q));

logic [31:0] dot_a0, dot_b0, dot_a1, dot_b1, dot_a2, dot_b2, dot_q;
fp_dot fpu4(.clk(clk), .areset(reset), .a0(dot_a0), .b0(dot_b0), .a1(dot_a1), .b1(dot_b1), .a2(dot_a2), .b2(dot_b2), .q(dot_q));

logic [31:0] to_int_a, to_int_q;
fp_to_int fpu5(.clk(clk), .areset(reset), .a(to_int_a), .q(to_int_q));

logic ax_we, ay_we, az_we, bx_we, by_we, bz_we, cx_we, cy_we, cz_we;
logic [31:0] ax_in, ay_in, az_in, bx_in, by_in, bz_in, cx_in, cy_in, cz_in;
logic [31:0] ax, ay, az, bx, by, bz, cx, cy, cz;
reg_32 ax_reg(.clk(clk), .write_en(ax_we), .reset(reset), .data_in(ax_in), .data_out(ax));
reg_32 ay_reg(.clk(clk), .write_en(ay_we), .reset(reset), .data_in(ay_in), .data_out(ay));
reg_32 az_reg(.clk(clk), .write_en(az_we), .reset(reset), .data_in(az_in), .data_out(az));
reg_32 bx_reg(.clk(clk), .write_en(bx_we), .reset(reset), .data_in(bx_in), .data_out(bx));
reg_32 by_reg(.clk(clk), .write_en(by_we), .reset(reset), .data_in(by_in), .data_out(by));
reg_32 bz_reg(.clk(clk), .write_en(bz_we), .reset(reset), .data_in(bz_in), .data_out(bz));
reg_32 cx_reg(.clk(clk), .write_en(cx_we), .reset(reset), .data_in(cx_in), .data_out(cx));
reg_32 cy_reg(.clk(clk), .write_en(cy_we), .reset(reset), .data_in(cy_in), .data_out(cy));
reg_32 cz_reg(.clk(clk), .write_en(cz_we), .reset(reset), .data_in(cz_in), .data_out(cz));

logic temp_we;
logic [31:0] temp_in, temp;
reg_32 temp_reg(.clk(clk), .write_en(temp_we), .reset(reset), .data_in(temp_in), .data_out(temp));

always_comb begin : fsm

    next_state = state;

    reset = 1'b0;
    color = 4'b0;
    done = 1'b0;

    addsub_a = 32'b0;
    addsub_b = 32'b0;
    mul_a = 32'b0;
    mul_b = 32'b0;
    sqrt_a = 32'b0;
    div_a = 32'b0;
    div_b = 32'b0;
    dot_a0 = 32'b0;
    dot_b0 = 32'b0;
    dot_a1 = 32'b0;
    dot_b1 = 32'b0;
    dot_a2 = 32'b0;
    dot_b2 = 32'b0;
    to_int_a = 32'b0;

    ax_we = 1'b0;
    ay_we = 1'b0;
    az_we = 1'b0;
    bx_we = 1'b0;
    by_we = 1'b0;
    bz_we = 1'b0;
    cx_we = 1'b0;
    cy_we = 1'b0;
    cz_we = 1'b0;
    ax_in = 32'b0;
    ay_in = 32'b0;
    az_in = 32'b0;
    bx_in = 32'b0;
    by_in = 32'b0;
    bz_in = 32'b0;
    cx_in = 32'b0;
    cy_in = 32'b0;
    cz_in = 32'b0;
    
    temp_we = 1'b0;
    temp_in = 32'b0;

    case (state)
        DONE : begin
            color = temp[3:0];
            done = 1'b1;
            if (start) next_state = START;
        end

        START : begin
            reset = 1'b1;
            next_state = CALC_NORMAL;
        end

        CALC_NORMAL : begin
            case (subcycle)
                1 : begin
                    addsub_a = p2[0]; // queue ax = p2x - p1x
                    addsub_b = p1[0];
                end
                2 : begin
                    addsub_a = p2[1]; // ay
                    addsub_b = p1[1];
                end
                3 : begin
                    addsub_a = p2[2]; // az
                    addsub_b = p1[2];

                    ax_we = 1'b1;
                    ax_in = addsub_s;
                end
                4 : begin
                    addsub_a = p3[0]; // queue bx = p3x - p1x
                    addsub_b = p1[0];

                    ay_we = 1'b1;
                    ax_in = addsub_s;
                end
                5 : begin
                    addsub_a = p3[1]; // by
                    addsub_b = p1[1];

                    az_we = 1'b1;
                    az_in = addsub_s;
                end
                6 : begin
                    addsub_a = p3[2]; // bz
                    addsub_b = p1[2];

                    bx_we = 1'b1;
                    bx_in = addsub_s;
                end
                8 : begin
                    by_we = 1'b1;
                    by_in = addsub_s;
                end
                9 : begin
                    bz_we = 1'b1;
                    bz_in = addsub_s;
                end
                10 : begin
                    mul_a = ay;
                    mul_b = bz;
                end
                11 : begin
                    mul_a = az;
                    mul_b = by;
                end
                12 : begin
                    mul_a = az;
                    mul_b = bx;
                end
                13 : begin
                    mul_a = ax;
                    mul_b = bz;

                    temp_we = 1'b1;
                    temp_in = mul_q;
                end
                14 : begin
                    mul_a = ax;
                    mul_b = by;

                    addsub_a = temp;
                    addsub_b = mul_q;
                end
                15 : begin
                    mul_a = ay;
                    mul_b = bx;

                    temp_we = 1'b1;
                    temp_in = mul_q;
                end
                16 : begin
                    addsub_a = temp;
                    addsub_b = mul_q;

                    cx_we = 1'b1;
                    cx_in = addsub_s;

                    mul_a = addsub_s;
                    mul_b = addsub_s;
                end
                17 : begin
                    temp_we = 1'b1;
                    temp_in = mul_q;
                end
                18 : begin
                    addsub_a = temp;
                    addsub_b = mul_q;

                    cy_we = 1'b1;
                    cy_in = addsub_s;

                    mul_a = addsub_s;
                    mul_b = addsub_s;
                end
                19 : begin
                    temp_we = 1'b1;
                    temp_in = mul_q;
                end
                20 : begin
                    cz_we = 1'b1;
                    cz_in = addsub_s;

                    mul_a = addsub_s;
                    mul_b = addsub_s;
                end
                21 : begin
                    addsub_a = mul_q;
                    addsub_b = temp;
                end
                23 : begin
                    addsub_a = mul_q;
                    addsub_b = addsub_q;
                end
                25 : begin
                    sqrt_a = addsub_q;
                end
                31 : begin
                    div_a = cx;
                    div_b = sqrt_q;

                    temp_we = 1'b1;
                    temp_in = sqrt_q;
                end
                32 : begin
                    div_a = cy;
                    div_b = temp;
                end
                33 : begin
                    div_a = cz;
                    div_b = temp;
                end
                40 : begin
                    cx_we = 1'b1;
                    cx_in = div_q;
                end
                41 : begin
                    cy_we = 1'b1;
                    cy_in = div_q;
                end
                42 : begin
                    cz_we = 1'b1;
                    cz_in = div_q;

                    next_state = COMPARE;
                end
            endcase
        end

        COMPARE : begin
            case (subcycle)
                1 : begin
                    dot_a0 = cx;
                    dot_b0 = view_vector[0];
                    dot_a1 = cy;
                    dot_b1 = view_vector[1];
                    dot_a2 = cz;
                    dot_b2 = view_vector[2];
                end
                9 : begin
                    addsub_a = dot_q;
                    addsub_b = 32'h3f800000;
                end
                11 : begin
                    mul_a = addsub_q;
                    mul_b = 32'h41000000; // 8.0
                end
                14 : begin
                    to_int_a = mul_q;
                end
                15 : begin
                    temp_we = 1'b1;
                    temp_in = to_int_q;
                    next_state = DONE;
                end
            endcase
        end
    endcase
end

endmodule