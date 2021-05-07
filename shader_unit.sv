module shader_unit (
    input logic clk, start, sreset,
    input logic [31:0] p1[3], p2[3], p3[3], // in NDC coordinates
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
fp_addsub fpu0(.clk(clk), .areset(reset), .a(addsub_a), .b(addsub_b), .q(addsub_q), .s(addsub_s));

logic [31:0] mul_a, mul_b, mul_q;
fp_mul fpu1(.clk(clk), .areset(reset), .a(mul_a), .b(mul_b), .q(mul_q));

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
reg_32 ax_reg(.clk(clk), .write_en(temp_we), .reset(reset), .data_in(temp_in), .data_out(temp));

always_comb begin : fsm
    state = next_state;

    reset = 1'b0;
    color = 4'b0;
    done = 1'b0;


    case (state)
        DONE : begin
            if (start) next_state = START;
        end

        START : begin
            reset = 1;

            next_state = CALC;
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
                end
                4 : begin
                    addsub_a = p3[0]; // queue bx = p3x - p1x
                    addsub_b = p1[0];
                end
                5 : begin
                    addsub_a = p3[1]; // by
                    addsub_b = p1[1];
                end
                6 : begin
                    addsub_a = p3[2]; // bz
                    addsub_b = p1[2];
                end
                8 : begin
                    ax_we = 1;
                    ax_in = addsub_s;
                end
                9 : begin
                    ay_we = 1;
                    ay_in = addsub_s;
                end
                10 : begin
                    az_we = 1;
                    az_in = addsub_s;
                end
                11 : begin
                    bx_we = 1;
                    bx_in = addsub_s;
                end
                12 : begin
                    by_we = 1;
                    by_in = addsub_s;
                end
                13 : begin
                    bz_we = 1;
                    bz_in = addsub_s;
                end
                14 : begin
                    mul_a = ay;
                    mul_b = bz;
                end
                15 : begin
                    mul_a = az;
                    mul_b = by;
                end
                16 : begin
                    mul_a = az;
                    mul_b = bx;
                end
                17 : begin
                    mul_a = ax;
                    mul_b = bz;
                end
                18 : begin
                    mul_a = ax;
                    mul_b = by;
                end
                19 : begin
                    mul_a = ay;
                    mul_b = bx;

                    temp_we = 1;
                    temp_in = mul_q;
                end
                20 : begin
                    addsub_a = temp;
                    addsub_b = mul_q;
                end
                21 : begin
                    temp_we = 1;
                    temp_in = mul_q;
                end
                22 : begin
                    addsub_a = temp;
                    addsub_b = mul_q;
                end
                23 : begin
                    temp_we = 1;
                    temp_in = mul_q;
                end
                24 : begin
                    addsub_a = temp;
                    addsub_b = mul_q;
                end
                27 : begin
                    cx_we = 1;
                    cx_in = addsub_s;
                end
                29 : begin
                    cy_we = 1;
                    cy_in = addsub_s;
                end
                31 : begin
                    cz_we = 1;
                    cz_in = addsub_s;
                end
        end
    endcase
end

endmodule