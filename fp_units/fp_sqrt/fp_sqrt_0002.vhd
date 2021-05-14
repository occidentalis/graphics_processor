-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_sqrt_0002
-- VHDL created on Tue May 11 07:26:03 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_sqrt_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_sqrt_0002;

architecture normal of fp_sqrt_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid9_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid10_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid12_fpSqrtTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid13_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid17_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid18_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid19_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid20_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid21_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sBias_uid22_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expREven_uid25_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sBiasM1_uid26_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expOddSig_uid27_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expROdd_uid28_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expX0PS_uid29_fpSqrtTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid29_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid30_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal addrFull_uid33_fpSqrtTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yAddr_uid35_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yForPe_uid36_fpSqrtTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yForPe_uid36_fpSqrtTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expInc_uid38_fpSqrtTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal expInc_uid38_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid40_fpSqrtTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid40_fpSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid40_fpSqrtTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid40_fpSqrtTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal invSignX_uid41_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid42_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid43_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid44_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid45_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excConc_uid46_fpSqrtTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracSelIn_uid47_fpSqrtTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracSel_uid48_fpSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRR_uid51_fpSqrtTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRR_uid51_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracNaN_uid54_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal negZero_uid59_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid59_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSqrt_uid60_fpSqrtTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid74_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rndBit_uid76_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid77_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid79_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid79_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid79_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid79_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid80_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rndBit_uid83_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid84_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid86_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid86_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid86_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid86_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid87_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_mergedSignalTM_uid91_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_bottomExtension_uid104_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeX_mergedSignalTM_uid106_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid108_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal topRangeY_mergedSignalTM_uid110_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid112_pT1_uid75_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid112_pT1_uid75_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid112_pT1_uid75_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid112_pT1_uid75_invPolyEval_reset : std_logic;
    signal sm0_uid112_pT1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid113_pT1_uid75_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid113_pT1_uid75_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid128_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid134_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomExtension_uid135_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid137_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid145_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid145_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid146_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid146_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid155_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid156_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid163_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid164_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid177_pT2_uid82_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid177_pT2_uid82_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid177_pT2_uid82_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid177_pT2_uid82_invPolyEval_reset : std_logic;
    signal sm0_uid177_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid178_pT2_uid82_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid178_pT2_uid82_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid178_pT2_uid82_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid178_pT2_uid82_invPolyEval_reset : std_logic;
    signal sm0_uid178_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid179_pT2_uid82_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid179_pT2_uid82_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid179_pT2_uid82_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid179_pT2_uid82_invPolyEval_reset : std_logic;
    signal sm0_uid179_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid180_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid180_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid181_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid182_pT2_uid82_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid182_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid182_pT2_uid82_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid182_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid183_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid184_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid184_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid185_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid186_pT2_uid82_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid186_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid186_pT2_uid82_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid186_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal lev2_a0_uid187_pT2_uid82_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid188_pT2_uid82_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid188_pT2_uid82_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid62_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid65_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid65_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid65_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid65_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid65_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid65_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid68_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid68_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid68_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid68_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid68_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid68_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal redist0_negZero_uid59_fpSqrtTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_fracSel_uid48_fpSqrtTest_q_6_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_yForPe_uid36_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist3_yForPe_uid36_fpSqrtTest_b_4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist4_yAddr_uid35_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid35_fpSqrtTest_b_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_expRMux_uid31_fpSqrtTest_q_6_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signX_uid7_fpSqrtTest(BITSELECT,6)@0
    signX_uid7_fpSqrtTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- cstAllZWE_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWE_uid10_fpSqrtTest_q <= "00000000";

    -- expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_b <= a(30 downto 23);

    -- excZ_x_uid13_fpSqrtTest(LOGICAL,12)@0
    excZ_x_uid13_fpSqrtTest_q <= "1" WHEN expX_uid6_fpSqrtTest_b = cstAllZWE_uid10_fpSqrtTest_q ELSE "0";

    -- negZero_uid59_fpSqrtTest(LOGICAL,58)@0 + 1
    negZero_uid59_fpSqrtTest_qi <= excZ_x_uid13_fpSqrtTest_q and signX_uid7_fpSqrtTest_b;
    negZero_uid59_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => negZero_uid59_fpSqrtTest_qi, xout => negZero_uid59_fpSqrtTest_q, clk => clk, aclr => areset );

    -- redist0_negZero_uid59_fpSqrtTest_q_6(DELAY,192)
    redist0_negZero_uid59_fpSqrtTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => negZero_uid59_fpSqrtTest_q, xout => redist0_negZero_uid59_fpSqrtTest_q_6_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid8_fpSqrtTest(CONSTANT,7)
    cstAllOWE_uid8_fpSqrtTest_q <= "11111111";

    -- expX0PS_uid29_fpSqrtTest(BITSELECT,28)@0
    expX0PS_uid29_fpSqrtTest_in <= STD_LOGIC_VECTOR(expX_uid6_fpSqrtTest_b(0 downto 0));
    expX0PS_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR(expX0PS_uid29_fpSqrtTest_in(0 downto 0));

    -- expOddSelect_uid30_fpSqrtTest(LOGICAL,29)@0
    expOddSelect_uid30_fpSqrtTest_q <= not (expX0PS_uid29_fpSqrtTest_b);

    -- frac_x_uid12_fpSqrtTest(BITSELECT,11)@0
    frac_x_uid12_fpSqrtTest_b <= a(22 downto 0);

    -- addrFull_uid33_fpSqrtTest(BITJOIN,32)@0
    addrFull_uid33_fpSqrtTest_q <= expOddSelect_uid30_fpSqrtTest_q & frac_x_uid12_fpSqrtTest_b;

    -- yAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    yAddr_uid35_fpSqrtTest_b <= addrFull_uid33_fpSqrtTest_q(23 downto 16);

    -- memoryC2_uid68_sqrtTables_lutmem(DUALMEM,191)@0 + 2
    -- in j@20000000
    memoryC2_uid68_sqrtTables_lutmem_aa <= yAddr_uid35_fpSqrtTest_b;
    memoryC2_uid68_sqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid68_sqrtTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sqrt_0002_memoryC2_uid68_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid68_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid68_sqrtTables_lutmem_aa,
        q_a => memoryC2_uid68_sqrtTables_lutmem_ir
    );
    memoryC2_uid68_sqrtTables_lutmem_r <= memoryC2_uid68_sqrtTables_lutmem_ir(11 downto 0);

    -- topRangeY_bottomExtension_uid108_pT1_uid75_invPolyEval(CONSTANT,107)
    topRangeY_bottomExtension_uid108_pT1_uid75_invPolyEval_q <= "00000";

    -- topRangeY_mergedSignalTM_uid110_pT1_uid75_invPolyEval(BITJOIN,109)@2
    topRangeY_mergedSignalTM_uid110_pT1_uid75_invPolyEval_q <= memoryC2_uid68_sqrtTables_lutmem_r & topRangeY_bottomExtension_uid108_pT1_uid75_invPolyEval_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- yForPe_uid36_fpSqrtTest(BITSELECT,35)@0
    yForPe_uid36_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(15 downto 0);
    yForPe_uid36_fpSqrtTest_b <= yForPe_uid36_fpSqrtTest_in(15 downto 0);

    -- redist2_yForPe_uid36_fpSqrtTest_b_2(DELAY,194)
    redist2_yForPe_uid36_fpSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yForPe_uid36_fpSqrtTest_b, xout => redist2_yForPe_uid36_fpSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- yT1_uid74_invPolyEval(BITSELECT,73)@2
    yT1_uid74_invPolyEval_b <= redist2_yForPe_uid36_fpSqrtTest_b_2_q(15 downto 4);

    -- nx_mergedSignalTM_uid91_pT1_uid75_invPolyEval(BITJOIN,90)@2
    nx_mergedSignalTM_uid91_pT1_uid75_invPolyEval_q <= GND_q & yT1_uid74_invPolyEval_b;

    -- topRangeX_bottomExtension_uid104_pT1_uid75_invPolyEval(CONSTANT,103)
    topRangeX_bottomExtension_uid104_pT1_uid75_invPolyEval_q <= "0000";

    -- topRangeX_mergedSignalTM_uid106_pT1_uid75_invPolyEval(BITJOIN,105)@2
    topRangeX_mergedSignalTM_uid106_pT1_uid75_invPolyEval_q <= nx_mergedSignalTM_uid91_pT1_uid75_invPolyEval_q & topRangeX_bottomExtension_uid104_pT1_uid75_invPolyEval_q;

    -- sm0_uid112_pT1_uid75_invPolyEval(MULT,111)@2 + 2
    sm0_uid112_pT1_uid75_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid106_pT1_uid75_invPolyEval_q);
    sm0_uid112_pT1_uid75_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid110_pT1_uid75_invPolyEval_q);
    sm0_uid112_pT1_uid75_invPolyEval_reset <= areset;
    sm0_uid112_pT1_uid75_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid112_pT1_uid75_invPolyEval_a0,
        datab => sm0_uid112_pT1_uid75_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid112_pT1_uid75_invPolyEval_reset,
        clock => clk,
        result => sm0_uid112_pT1_uid75_invPolyEval_s1
    );
    sm0_uid112_pT1_uid75_invPolyEval_q <= sm0_uid112_pT1_uid75_invPolyEval_s1;

    -- osig_uid113_pT1_uid75_invPolyEval(BITSELECT,112)@4
    osig_uid113_pT1_uid75_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid112_pT1_uid75_invPolyEval_q(32 downto 0));
    osig_uid113_pT1_uid75_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid113_pT1_uid75_invPolyEval_in(32 downto 19));

    -- redist4_yAddr_uid35_fpSqrtTest_b_2(DELAY,196)
    redist4_yAddr_uid35_fpSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid35_fpSqrtTest_b, xout => redist4_yAddr_uid35_fpSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid65_sqrtTables_lutmem(DUALMEM,190)@2 + 2
    -- in j@20000000
    memoryC1_uid65_sqrtTables_lutmem_aa <= redist4_yAddr_uid35_fpSqrtTest_b_2_q;
    memoryC1_uid65_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid65_sqrtTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sqrt_0002_memoryC1_uid65_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid65_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid65_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid65_sqrtTables_lutmem_ir
    );
    memoryC1_uid65_sqrtTables_lutmem_r <= memoryC1_uid65_sqrtTables_lutmem_ir(20 downto 0);

    -- rndBit_uid76_invPolyEval(CONSTANT,75)
    rndBit_uid76_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid77_invPolyEval(BITJOIN,76)@4
    cIncludingRoundingBit_uid77_invPolyEval_q <= memoryC1_uid65_sqrtTables_lutmem_r & rndBit_uid76_invPolyEval_q;

    -- ts1_uid79_invPolyEval(ADD,78)@4
    ts1_uid79_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid77_invPolyEval_q(22)) & cIncludingRoundingBit_uid77_invPolyEval_q));
    ts1_uid79_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 14 => osig_uid113_pT1_uid75_invPolyEval_b(13)) & osig_uid113_pT1_uid75_invPolyEval_b));
    ts1_uid79_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid79_invPolyEval_a) + SIGNED(ts1_uid79_invPolyEval_b));
    ts1_uid79_invPolyEval_q <= ts1_uid79_invPolyEval_o(23 downto 0);

    -- s1_uid80_invPolyEval(BITSELECT,79)@4
    s1_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid79_invPolyEval_q(23 downto 1));

    -- rightBottomY_uid146_pT2_uid82_invPolyEval(BITSELECT,145)@4
    rightBottomY_uid146_pT2_uid82_invPolyEval_in <= s1_uid80_invPolyEval_b(5 downto 0);
    rightBottomY_uid146_pT2_uid82_invPolyEval_b <= rightBottomY_uid146_pT2_uid82_invPolyEval_in(5 downto 1);

    -- n1_uid155_pT2_uid82_invPolyEval(BITSELECT,154)@4
    n1_uid155_pT2_uid82_invPolyEval_b <= rightBottomY_uid146_pT2_uid82_invPolyEval_b(4 downto 1);

    -- n1_uid163_pT2_uid82_invPolyEval(BITSELECT,162)@4
    n1_uid163_pT2_uid82_invPolyEval_b <= n1_uid155_pT2_uid82_invPolyEval_b(3 downto 1);

    -- redist3_yForPe_uid36_fpSqrtTest_b_4(DELAY,195)
    redist3_yForPe_uid36_fpSqrtTest_b_4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist2_yForPe_uid36_fpSqrtTest_b_2_q, xout => redist3_yForPe_uid36_fpSqrtTest_b_4_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval(BITJOIN,116)@4
    nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval_q <= GND_q & redist3_yForPe_uid36_fpSqrtTest_b_4_q;

    -- rightBottomX_uid145_pT2_uid82_invPolyEval(BITSELECT,144)@4
    rightBottomX_uid145_pT2_uid82_invPolyEval_in <= nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval_q(8 downto 0);
    rightBottomX_uid145_pT2_uid82_invPolyEval_b <= rightBottomX_uid145_pT2_uid82_invPolyEval_in(8 downto 4);

    -- n0_uid156_pT2_uid82_invPolyEval(BITSELECT,155)@4
    n0_uid156_pT2_uid82_invPolyEval_b <= rightBottomX_uid145_pT2_uid82_invPolyEval_b(4 downto 1);

    -- n0_uid164_pT2_uid82_invPolyEval(BITSELECT,163)@4
    n0_uid164_pT2_uid82_invPolyEval_b <= n0_uid156_pT2_uid82_invPolyEval_b(3 downto 1);

    -- sm0_uid179_pT2_uid82_invPolyEval(MULT,178)@4 + 2
    sm0_uid179_pT2_uid82_invPolyEval_a0 <= n0_uid164_pT2_uid82_invPolyEval_b;
    sm0_uid179_pT2_uid82_invPolyEval_b0 <= n1_uid163_pT2_uid82_invPolyEval_b;
    sm0_uid179_pT2_uid82_invPolyEval_reset <= areset;
    sm0_uid179_pT2_uid82_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 3,
        lpm_widthb => 3,
        lpm_widthp => 6,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid179_pT2_uid82_invPolyEval_a0,
        datab => sm0_uid179_pT2_uid82_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid179_pT2_uid82_invPolyEval_reset,
        clock => clk,
        result => sm0_uid179_pT2_uid82_invPolyEval_s1
    );
    sm0_uid179_pT2_uid82_invPolyEval_q <= sm0_uid179_pT2_uid82_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval(BITSELECT,135)@4
    aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_in <= STD_LOGIC_VECTOR(s1_uid80_invPolyEval_b(5 downto 0));
    aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_in(5 downto 0));

    -- aboveLeftY_bottomExtension_uid135_pT2_uid82_invPolyEval(CONSTANT,134)
    aboveLeftY_bottomExtension_uid135_pT2_uid82_invPolyEval_q <= "00";

    -- aboveLeftY_mergedSignalTM_uid137_pT2_uid82_invPolyEval(BITJOIN,136)@4
    aboveLeftY_mergedSignalTM_uid137_pT2_uid82_invPolyEval_q <= aboveLeftY_bottomRange_uid136_pT2_uid82_invPolyEval_b & aboveLeftY_bottomExtension_uid135_pT2_uid82_invPolyEval_q;

    -- aboveLeftX_uid134_pT2_uid82_invPolyEval(BITSELECT,133)@4
    aboveLeftX_uid134_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval_q(16 downto 9));

    -- sm0_uid178_pT2_uid82_invPolyEval(MULT,177)@4 + 2
    sm0_uid178_pT2_uid82_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid134_pT2_uid82_invPolyEval_b);
    sm0_uid178_pT2_uid82_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid137_pT2_uid82_invPolyEval_q;
    sm0_uid178_pT2_uid82_invPolyEval_reset <= areset;
    sm0_uid178_pT2_uid82_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 9,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid178_pT2_uid82_invPolyEval_a0,
        datab => sm0_uid178_pT2_uid82_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid178_pT2_uid82_invPolyEval_reset,
        clock => clk,
        result => sm0_uid178_pT2_uid82_invPolyEval_s1
    );
    sm0_uid178_pT2_uid82_invPolyEval_q <= sm0_uid178_pT2_uid82_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid128_pT2_uid82_invPolyEval(BITSELECT,127)@4
    topRangeY_uid128_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid80_invPolyEval_b(22 downto 6));

    -- sm0_uid177_pT2_uid82_invPolyEval(MULT,176)@4 + 2
    sm0_uid177_pT2_uid82_invPolyEval_a0 <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid117_pT2_uid82_invPolyEval_q);
    sm0_uid177_pT2_uid82_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid128_pT2_uid82_invPolyEval_b);
    sm0_uid177_pT2_uid82_invPolyEval_reset <= areset;
    sm0_uid177_pT2_uid82_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid177_pT2_uid82_invPolyEval_a0,
        datab => sm0_uid177_pT2_uid82_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid177_pT2_uid82_invPolyEval_reset,
        clock => clk,
        result => sm0_uid177_pT2_uid82_invPolyEval_s1
    );
    sm0_uid177_pT2_uid82_invPolyEval_q <= sm0_uid177_pT2_uid82_invPolyEval_s1;

    -- highABits_uid181_pT2_uid82_invPolyEval(BITSELECT,180)@6
    highABits_uid181_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid177_pT2_uid82_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid182_pT2_uid82_invPolyEval(ADD,181)@6
    lev1_a0high_uid182_pT2_uid82_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid181_pT2_uid82_invPolyEval_b(32)) & highABits_uid181_pT2_uid82_invPolyEval_b));
    lev1_a0high_uid182_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid178_pT2_uid82_invPolyEval_q(15)) & sm0_uid178_pT2_uid82_invPolyEval_q));
    lev1_a0high_uid182_pT2_uid82_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid182_pT2_uid82_invPolyEval_a) + SIGNED(lev1_a0high_uid182_pT2_uid82_invPolyEval_b));
    lev1_a0high_uid182_pT2_uid82_invPolyEval_q <= lev1_a0high_uid182_pT2_uid82_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid180_pT2_uid82_invPolyEval(BITSELECT,179)@6
    lowRangeA_uid180_pT2_uid82_invPolyEval_in <= sm0_uid177_pT2_uid82_invPolyEval_q(0 downto 0);
    lowRangeA_uid180_pT2_uid82_invPolyEval_b <= lowRangeA_uid180_pT2_uid82_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid183_pT2_uid82_invPolyEval(BITJOIN,182)@6
    lev1_a0_uid183_pT2_uid82_invPolyEval_q <= lev1_a0high_uid182_pT2_uid82_invPolyEval_q & lowRangeA_uid180_pT2_uid82_invPolyEval_b;

    -- highABits_uid185_pT2_uid82_invPolyEval(BITSELECT,184)@6
    highABits_uid185_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid183_pT2_uid82_invPolyEval_q(34 downto 3));

    -- lev2_a0high_uid186_pT2_uid82_invPolyEval(ADD,185)@6
    lev2_a0high_uid186_pT2_uid82_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => highABits_uid185_pT2_uid82_invPolyEval_b(31)) & highABits_uid185_pT2_uid82_invPolyEval_b));
    lev2_a0high_uid186_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid179_pT2_uid82_invPolyEval_q));
    lev2_a0high_uid186_pT2_uid82_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid186_pT2_uid82_invPolyEval_a) + SIGNED(lev2_a0high_uid186_pT2_uid82_invPolyEval_b));
    lev2_a0high_uid186_pT2_uid82_invPolyEval_q <= lev2_a0high_uid186_pT2_uid82_invPolyEval_o(32 downto 0);

    -- lowRangeA_uid184_pT2_uid82_invPolyEval(BITSELECT,183)@6
    lowRangeA_uid184_pT2_uid82_invPolyEval_in <= lev1_a0_uid183_pT2_uid82_invPolyEval_q(2 downto 0);
    lowRangeA_uid184_pT2_uid82_invPolyEval_b <= lowRangeA_uid184_pT2_uid82_invPolyEval_in(2 downto 0);

    -- lev2_a0_uid187_pT2_uid82_invPolyEval(BITJOIN,186)@6
    lev2_a0_uid187_pT2_uid82_invPolyEval_q <= lev2_a0high_uid186_pT2_uid82_invPolyEval_q & lowRangeA_uid184_pT2_uid82_invPolyEval_b;

    -- osig_uid188_pT2_uid82_invPolyEval(BITSELECT,187)@6
    osig_uid188_pT2_uid82_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid187_pT2_uid82_invPolyEval_q(32 downto 0));
    osig_uid188_pT2_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid188_pT2_uid82_invPolyEval_in(32 downto 8));

    -- redist5_yAddr_uid35_fpSqrtTest_b_4(DELAY,197)
    redist5_yAddr_uid35_fpSqrtTest_b_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_yAddr_uid35_fpSqrtTest_b_2_q, xout => redist5_yAddr_uid35_fpSqrtTest_b_4_q, clk => clk, aclr => areset );

    -- memoryC0_uid62_sqrtTables_lutmem(DUALMEM,189)@4 + 2
    -- in j@20000000
    memoryC0_uid62_sqrtTables_lutmem_aa <= redist5_yAddr_uid35_fpSqrtTest_b_4_q;
    memoryC0_uid62_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid62_sqrtTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sqrt_0002_memoryC0_uid62_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid62_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid62_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid62_sqrtTables_lutmem_ir
    );
    memoryC0_uid62_sqrtTables_lutmem_r <= memoryC0_uid62_sqrtTables_lutmem_ir(28 downto 0);

    -- rndBit_uid83_invPolyEval(CONSTANT,82)
    rndBit_uid83_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid84_invPolyEval(BITJOIN,83)@6
    cIncludingRoundingBit_uid84_invPolyEval_q <= memoryC0_uid62_sqrtTables_lutmem_r & rndBit_uid83_invPolyEval_q;

    -- ts2_uid86_invPolyEval(ADD,85)@6
    ts2_uid86_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid84_invPolyEval_q(31)) & cIncludingRoundingBit_uid84_invPolyEval_q));
    ts2_uid86_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 25 => osig_uid188_pT2_uid82_invPolyEval_b(24)) & osig_uid188_pT2_uid82_invPolyEval_b));
    ts2_uid86_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid86_invPolyEval_a) + SIGNED(ts2_uid86_invPolyEval_b));
    ts2_uid86_invPolyEval_q <= ts2_uid86_invPolyEval_o(32 downto 0);

    -- s2_uid87_invPolyEval(BITSELECT,86)@6
    s2_uid87_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid86_invPolyEval_q(32 downto 1));

    -- expInc_uid38_fpSqrtTest(BITSELECT,37)@6
    expInc_uid38_fpSqrtTest_in <= STD_LOGIC_VECTOR(s2_uid87_invPolyEval_b(30 downto 0));
    expInc_uid38_fpSqrtTest_b <= STD_LOGIC_VECTOR(expInc_uid38_fpSqrtTest_in(30 downto 30));

    -- sBiasM1_uid26_fpSqrtTest(CONSTANT,25)
    sBiasM1_uid26_fpSqrtTest_q <= "01111110";

    -- expOddSig_uid27_fpSqrtTest(ADD,26)@0
    expOddSig_uid27_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expOddSig_uid27_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid26_fpSqrtTest_q);
    expOddSig_uid27_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid27_fpSqrtTest_a) + UNSIGNED(expOddSig_uid27_fpSqrtTest_b));
    expOddSig_uid27_fpSqrtTest_q <= expOddSig_uid27_fpSqrtTest_o(8 downto 0);

    -- expROdd_uid28_fpSqrtTest(BITSELECT,27)@0
    expROdd_uid28_fpSqrtTest_b <= expOddSig_uid27_fpSqrtTest_q(8 downto 1);

    -- sBias_uid22_fpSqrtTest(CONSTANT,21)
    sBias_uid22_fpSqrtTest_q <= "01111111";

    -- expEvenSig_uid24_fpSqrtTest(ADD,23)@0
    expEvenSig_uid24_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expEvenSig_uid24_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid22_fpSqrtTest_q);
    expEvenSig_uid24_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid24_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid24_fpSqrtTest_b));
    expEvenSig_uid24_fpSqrtTest_q <= expEvenSig_uid24_fpSqrtTest_o(8 downto 0);

    -- expREven_uid25_fpSqrtTest(BITSELECT,24)@0
    expREven_uid25_fpSqrtTest_b <= expEvenSig_uid24_fpSqrtTest_q(8 downto 1);

    -- expRMux_uid31_fpSqrtTest(MUX,30)@0 + 1
    expRMux_uid31_fpSqrtTest_s <= expOddSelect_uid30_fpSqrtTest_q;
    expRMux_uid31_fpSqrtTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid31_fpSqrtTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRMux_uid31_fpSqrtTest_s) IS
                WHEN "0" => expRMux_uid31_fpSqrtTest_q <= expREven_uid25_fpSqrtTest_b;
                WHEN "1" => expRMux_uid31_fpSqrtTest_q <= expROdd_uid28_fpSqrtTest_b;
                WHEN OTHERS => expRMux_uid31_fpSqrtTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist6_expRMux_uid31_fpSqrtTest_q_6(DELAY,198)
    redist6_expRMux_uid31_fpSqrtTest_q_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRMux_uid31_fpSqrtTest_q, xout => redist6_expRMux_uid31_fpSqrtTest_q_6_q, clk => clk, aclr => areset );

    -- expR_uid40_fpSqrtTest(ADD,39)@6
    expR_uid40_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist6_expRMux_uid31_fpSqrtTest_q_6_q);
    expR_uid40_fpSqrtTest_b <= STD_LOGIC_VECTOR("00000000" & expInc_uid38_fpSqrtTest_b);
    expR_uid40_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid40_fpSqrtTest_a) + UNSIGNED(expR_uid40_fpSqrtTest_b));
    expR_uid40_fpSqrtTest_q <= expR_uid40_fpSqrtTest_o(8 downto 0);

    -- expRR_uid51_fpSqrtTest(BITSELECT,50)@6
    expRR_uid51_fpSqrtTest_in <= expR_uid40_fpSqrtTest_q(7 downto 0);
    expRR_uid51_fpSqrtTest_b <= expRR_uid51_fpSqrtTest_in(7 downto 0);

    -- expXIsMax_uid14_fpSqrtTest(LOGICAL,13)@0
    expXIsMax_uid14_fpSqrtTest_q <= "1" WHEN expX_uid6_fpSqrtTest_b = cstAllOWE_uid8_fpSqrtTest_q ELSE "0";

    -- invExpXIsMax_uid19_fpSqrtTest(LOGICAL,18)@0
    invExpXIsMax_uid19_fpSqrtTest_q <= not (expXIsMax_uid14_fpSqrtTest_q);

    -- InvExpXIsZero_uid20_fpSqrtTest(LOGICAL,19)@0
    InvExpXIsZero_uid20_fpSqrtTest_q <= not (excZ_x_uid13_fpSqrtTest_q);

    -- excR_x_uid21_fpSqrtTest(LOGICAL,20)@0
    excR_x_uid21_fpSqrtTest_q <= InvExpXIsZero_uid20_fpSqrtTest_q and invExpXIsMax_uid19_fpSqrtTest_q;

    -- minReg_uid43_fpSqrtTest(LOGICAL,42)@0
    minReg_uid43_fpSqrtTest_q <= excR_x_uid21_fpSqrtTest_q and signX_uid7_fpSqrtTest_b;

    -- cstZeroWF_uid9_fpSqrtTest(CONSTANT,8)
    cstZeroWF_uid9_fpSqrtTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid15_fpSqrtTest(LOGICAL,14)@0
    fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN cstZeroWF_uid9_fpSqrtTest_q = frac_x_uid12_fpSqrtTest_b ELSE "0";

    -- excI_x_uid17_fpSqrtTest(LOGICAL,16)@0
    excI_x_uid17_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and fracXIsZero_uid15_fpSqrtTest_q;

    -- minInf_uid44_fpSqrtTest(LOGICAL,43)@0
    minInf_uid44_fpSqrtTest_q <= excI_x_uid17_fpSqrtTest_q and signX_uid7_fpSqrtTest_b;

    -- fracXIsNotZero_uid16_fpSqrtTest(LOGICAL,15)@0
    fracXIsNotZero_uid16_fpSqrtTest_q <= not (fracXIsZero_uid15_fpSqrtTest_q);

    -- excN_x_uid18_fpSqrtTest(LOGICAL,17)@0
    excN_x_uid18_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and fracXIsNotZero_uid16_fpSqrtTest_q;

    -- excRNaN_uid45_fpSqrtTest(LOGICAL,44)@0
    excRNaN_uid45_fpSqrtTest_q <= excN_x_uid18_fpSqrtTest_q or minInf_uid44_fpSqrtTest_q or minReg_uid43_fpSqrtTest_q;

    -- invSignX_uid41_fpSqrtTest(LOGICAL,40)@0
    invSignX_uid41_fpSqrtTest_q <= not (signX_uid7_fpSqrtTest_b);

    -- inInfAndNotNeg_uid42_fpSqrtTest(LOGICAL,41)@0
    inInfAndNotNeg_uid42_fpSqrtTest_q <= excI_x_uid17_fpSqrtTest_q and invSignX_uid41_fpSqrtTest_q;

    -- excConc_uid46_fpSqrtTest(BITJOIN,45)@0
    excConc_uid46_fpSqrtTest_q <= excRNaN_uid45_fpSqrtTest_q & inInfAndNotNeg_uid42_fpSqrtTest_q & excZ_x_uid13_fpSqrtTest_q;

    -- fracSelIn_uid47_fpSqrtTest(BITJOIN,46)@0
    fracSelIn_uid47_fpSqrtTest_q <= signX_uid7_fpSqrtTest_b & excConc_uid46_fpSqrtTest_q;

    -- fracSel_uid48_fpSqrtTest(LOOKUP,47)@0 + 1
    fracSel_uid48_fpSqrtTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracSel_uid48_fpSqrtTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracSelIn_uid47_fpSqrtTest_q) IS
                WHEN "0000" => fracSel_uid48_fpSqrtTest_q <= "01";
                WHEN "0001" => fracSel_uid48_fpSqrtTest_q <= "00";
                WHEN "0010" => fracSel_uid48_fpSqrtTest_q <= "10";
                WHEN "0011" => fracSel_uid48_fpSqrtTest_q <= "00";
                WHEN "0100" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "0101" => fracSel_uid48_fpSqrtTest_q <= "00";
                WHEN "0110" => fracSel_uid48_fpSqrtTest_q <= "10";
                WHEN "0111" => fracSel_uid48_fpSqrtTest_q <= "00";
                WHEN "1000" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1001" => fracSel_uid48_fpSqrtTest_q <= "00";
                WHEN "1010" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1011" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1100" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1101" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1110" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN "1111" => fracSel_uid48_fpSqrtTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               fracSel_uid48_fpSqrtTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_fracSel_uid48_fpSqrtTest_q_6(DELAY,193)
    redist1_fracSel_uid48_fpSqrtTest_q_6 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracSel_uid48_fpSqrtTest_q, xout => redist1_fracSel_uid48_fpSqrtTest_q_6_q, clk => clk, aclr => areset );

    -- expRPostExc_uid53_fpSqrtTest(MUX,52)@6
    expRPostExc_uid53_fpSqrtTest_s <= redist1_fracSel_uid48_fpSqrtTest_q_6_q;
    expRPostExc_uid53_fpSqrtTest_combproc: PROCESS (expRPostExc_uid53_fpSqrtTest_s, cstAllZWE_uid10_fpSqrtTest_q, expRR_uid51_fpSqrtTest_b, cstAllOWE_uid8_fpSqrtTest_q)
    BEGIN
        CASE (expRPostExc_uid53_fpSqrtTest_s) IS
            WHEN "00" => expRPostExc_uid53_fpSqrtTest_q <= cstAllZWE_uid10_fpSqrtTest_q;
            WHEN "01" => expRPostExc_uid53_fpSqrtTest_q <= expRR_uid51_fpSqrtTest_b;
            WHEN "10" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN "11" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN OTHERS => expRPostExc_uid53_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracNaN_uid54_fpSqrtTest(CONSTANT,53)
    fracNaN_uid54_fpSqrtTest_q <= "00000000000000000000001";

    -- fracRPostProcessings_uid39_fpSqrtTest(BITSELECT,38)@6
    fracRPostProcessings_uid39_fpSqrtTest_in <= s2_uid87_invPolyEval_b(28 downto 0);
    fracRPostProcessings_uid39_fpSqrtTest_b <= fracRPostProcessings_uid39_fpSqrtTest_in(28 downto 6);

    -- fracRPostExc_uid58_fpSqrtTest(MUX,57)@6
    fracRPostExc_uid58_fpSqrtTest_s <= redist1_fracSel_uid48_fpSqrtTest_q_6_q;
    fracRPostExc_uid58_fpSqrtTest_combproc: PROCESS (fracRPostExc_uid58_fpSqrtTest_s, cstZeroWF_uid9_fpSqrtTest_q, fracRPostProcessings_uid39_fpSqrtTest_b, fracNaN_uid54_fpSqrtTest_q)
    BEGIN
        CASE (fracRPostExc_uid58_fpSqrtTest_s) IS
            WHEN "00" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "01" => fracRPostExc_uid58_fpSqrtTest_q <= fracRPostProcessings_uid39_fpSqrtTest_b;
            WHEN "10" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "11" => fracRPostExc_uid58_fpSqrtTest_q <= fracNaN_uid54_fpSqrtTest_q;
            WHEN OTHERS => fracRPostExc_uid58_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSqrt_uid60_fpSqrtTest(BITJOIN,59)@6
    RSqrt_uid60_fpSqrtTest_q <= redist0_negZero_uid59_fpSqrtTest_q_6_q & expRPostExc_uid53_fpSqrtTest_q & fracRPostExc_uid58_fpSqrtTest_q;

    -- xOut(GPOUT,4)@6
    q <= RSqrt_uid60_fpSqrtTest_q;

END normal;
