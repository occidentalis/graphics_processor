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

-- VHDL created from fp_inv_0002
-- VHDL created on Tue May 11 07:18:01 2021


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

entity fp_inv_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_inv_0002;

architecture normal of fp_inv_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal singX_uid8_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid10_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstNaNWF_uid11_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2BiasM1_uid13_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2Bias_uid14_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid21_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid22_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid24_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid27_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid28_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid29_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid30_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal updatedY_uid32_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid34_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal y_uid34_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompExt_uid39_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRComp_uid40_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRComp_uid40_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid41_fpInverseTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid41_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRCalc_uid47_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid47_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCalc_uid48_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid48_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xRegAndUdf_uid49_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid50_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid51_fpInverseTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid52_fpInverseTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid55_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid55_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid56_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid57_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid58_fpInverseTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid72_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rndBit_uid74_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid75_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal ts1_uid77_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid77_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid77_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid77_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid78_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rndBit_uid81_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid82_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid84_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid84_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid84_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid84_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid85_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_mergedSignalTM_uid89_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_bottomExtension_uid102_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeX_mergedSignalTM_uid104_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid106_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal topRangeY_mergedSignalTM_uid108_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid110_pT1_uid73_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid110_pT1_uid73_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid110_pT1_uid73_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid110_pT1_uid73_invPolyEval_reset : std_logic;
    signal sm0_uid110_pT1_uid73_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid111_pT1_uid73_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid111_pT1_uid73_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal topRangeX_mergedSignalTM_uid127_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid129_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid135_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomExtension_uid136_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_mergedSignalTM_uid138_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid146_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid146_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid147_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid147_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid156_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid157_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid164_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid165_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid172_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid173_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid186_pT2_uid80_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid186_pT2_uid80_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid186_pT2_uid80_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid186_pT2_uid80_invPolyEval_reset : std_logic;
    signal sm0_uid186_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid187_pT2_uid80_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid187_pT2_uid80_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid187_pT2_uid80_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid187_pT2_uid80_invPolyEval_reset : std_logic;
    signal sm0_uid187_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid188_pT2_uid80_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid188_pT2_uid80_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid188_pT2_uid80_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid188_pT2_uid80_invPolyEval_reset : std_logic;
    signal sm0_uid188_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal lowRangeA_uid189_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid189_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid190_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid191_pT2_uid80_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid191_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid191_pT2_uid80_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid191_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid192_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid193_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid193_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal highABits_uid194_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal lev2_a0high_uid195_pT2_uid80_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid195_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid195_pT2_uid80_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid195_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal lev2_a0_uid196_pT2_uid80_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid197_pT2_uid80_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid197_pT2_uid80_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid60_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid63_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid66_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal yAddr_uid36_fpInverseTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid36_fpInverseTest_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_4_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist4_fracXIsZero_uid31_fpInverseTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracXIsZero_uid23_fpInverseTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_singX_uid8_fpInverseTest_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expX_uid6_fpInverseTest_b_6_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- fracX_uid7_fpInverseTest(BITSELECT,6)@0
    fracX_uid7_fpInverseTest_b <= a(22 downto 0);

    -- cstAllZWF_uid10_fpInverseTest(CONSTANT,9)
    cstAllZWF_uid10_fpInverseTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid23_fpInverseTest(LOGICAL,22)@0 + 1
    fracXIsZero_uid23_fpInverseTest_qi <= "1" WHEN cstAllZWF_uid10_fpInverseTest_q = fracX_uid7_fpInverseTest_b ELSE "0";
    fracXIsZero_uid23_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_qi, xout => fracXIsZero_uid23_fpInverseTest_q, clk => clk, aclr => areset );

    -- redist5_fracXIsZero_uid23_fpInverseTest_q_6(DELAY,207)
    redist5_fracXIsZero_uid23_fpInverseTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_q, xout => redist5_fracXIsZero_uid23_fpInverseTest_q_6_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid24_fpInverseTest(LOGICAL,23)@6
    fracXIsNotZero_uid24_fpInverseTest_q <= not (redist5_fracXIsZero_uid23_fpInverseTest_q_6_q);

    -- cstAllOWE_uid9_fpInverseTest(CONSTANT,8)
    cstAllOWE_uid9_fpInverseTest_q <= "11111111";

    -- expX_uid6_fpInverseTest(BITSELECT,5)@0
    expX_uid6_fpInverseTest_b <= a(30 downto 23);

    -- redist7_expX_uid6_fpInverseTest_b_6(DELAY,209)
    redist7_expX_uid6_fpInverseTest_b_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpInverseTest_b, xout => redist7_expX_uid6_fpInverseTest_b_6_q, clk => clk, aclr => areset );

    -- expXIsMax_uid22_fpInverseTest(LOGICAL,21)@6
    expXIsMax_uid22_fpInverseTest_q <= "1" WHEN redist7_expX_uid6_fpInverseTest_b_6_q = cstAllOWE_uid9_fpInverseTest_q ELSE "0";

    -- excN_x_uid26_fpInverseTest(LOGICAL,25)@6
    excN_x_uid26_fpInverseTest_q <= expXIsMax_uid22_fpInverseTest_q and fracXIsNotZero_uid24_fpInverseTest_q;

    -- invExcRNaN_uid56_fpInverseTest(LOGICAL,55)@6
    invExcRNaN_uid56_fpInverseTest_q <= not (excN_x_uid26_fpInverseTest_q);

    -- singX_uid8_fpInverseTest(BITSELECT,7)@0
    singX_uid8_fpInverseTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist6_singX_uid8_fpInverseTest_b_6(DELAY,208)
    redist6_singX_uid8_fpInverseTest_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid8_fpInverseTest_b, xout => redist6_singX_uid8_fpInverseTest_b_6_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid57_fpInverseTest(LOGICAL,56)@6
    signR_uid57_fpInverseTest_q <= redist6_singX_uid8_fpInverseTest_b_6_q and invExcRNaN_uid56_fpInverseTest_q;

    -- cst2Bias_uid14_fpInverseTest(CONSTANT,13)
    cst2Bias_uid14_fpInverseTest_q <= "11111110";

    -- expRCompYIsOneExt_uid42_fpInverseTest(SUB,41)@6
    expRCompYIsOneExt_uid42_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid14_fpInverseTest_q);
    expRCompYIsOneExt_uid42_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist7_expX_uid6_fpInverseTest_b_6_q);
    expRCompYIsOneExt_uid42_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_a) - UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_b));
    expRCompYIsOneExt_uid42_fpInverseTest_q <= expRCompYIsOneExt_uid42_fpInverseTest_o(8 downto 0);

    -- expRCompYIsOne_uid43_fpInverseTest(BITSELECT,42)@6
    expRCompYIsOne_uid43_fpInverseTest_in <= expRCompYIsOneExt_uid42_fpInverseTest_q(7 downto 0);
    expRCompYIsOne_uid43_fpInverseTest_b <= expRCompYIsOne_uid43_fpInverseTest_in(7 downto 0);

    -- cst2BiasM1_uid13_fpInverseTest(CONSTANT,12)
    cst2BiasM1_uid13_fpInverseTest_q <= "11111101";

    -- expRCompExt_uid39_fpInverseTest(SUB,38)@6
    expRCompExt_uid39_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid13_fpInverseTest_q);
    expRCompExt_uid39_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist7_expX_uid6_fpInverseTest_b_6_q);
    expRCompExt_uid39_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid39_fpInverseTest_a) - UNSIGNED(expRCompExt_uid39_fpInverseTest_b));
    expRCompExt_uid39_fpInverseTest_q <= expRCompExt_uid39_fpInverseTest_o(8 downto 0);

    -- expRComp_uid40_fpInverseTest(BITSELECT,39)@6
    expRComp_uid40_fpInverseTest_in <= expRCompExt_uid39_fpInverseTest_q(7 downto 0);
    expRComp_uid40_fpInverseTest_b <= expRComp_uid40_fpInverseTest_in(7 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- updatedY_uid32_fpInverseTest(BITJOIN,31)@0
    updatedY_uid32_fpInverseTest_q <= GND_q & cstAllZWF_uid10_fpInverseTest_q;

    -- fracXIsZero_uid31_fpInverseTest(LOGICAL,32)@0 + 1
    fracXIsZero_uid31_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & fracX_uid7_fpInverseTest_b);
    fracXIsZero_uid31_fpInverseTest_qi <= "1" WHEN fracXIsZero_uid31_fpInverseTest_a = updatedY_uid32_fpInverseTest_q ELSE "0";
    fracXIsZero_uid31_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_qi, xout => fracXIsZero_uid31_fpInverseTest_q, clk => clk, aclr => areset );

    -- redist4_fracXIsZero_uid31_fpInverseTest_q_6(DELAY,206)
    redist4_fracXIsZero_uid31_fpInverseTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_q, xout => redist4_fracXIsZero_uid31_fpInverseTest_q_6_q, clk => clk, aclr => areset );

    -- expRCalc_uid48_fpInverseTest(MUX,47)@6
    expRCalc_uid48_fpInverseTest_s <= redist4_fracXIsZero_uid31_fpInverseTest_q_6_q;
    expRCalc_uid48_fpInverseTest_combproc: PROCESS (expRCalc_uid48_fpInverseTest_s, expRComp_uid40_fpInverseTest_b, expRCompYIsOne_uid43_fpInverseTest_b)
    BEGIN
        CASE (expRCalc_uid48_fpInverseTest_s) IS
            WHEN "0" => expRCalc_uid48_fpInverseTest_q <= expRComp_uid40_fpInverseTest_b;
            WHEN "1" => expRCalc_uid48_fpInverseTest_q <= expRCompYIsOne_uid43_fpInverseTest_b;
            WHEN OTHERS => expRCalc_uid48_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid12_fpInverseTest(CONSTANT,11)
    cstAllZWE_uid12_fpInverseTest_q <= "00000000";

    -- excZ_x_uid21_fpInverseTest(LOGICAL,20)@6
    excZ_x_uid21_fpInverseTest_q <= "1" WHEN redist7_expX_uid6_fpInverseTest_b_6_q = cstAllZWE_uid12_fpInverseTest_q ELSE "0";

    -- udf_uid41_fpInverseTest(BITSELECT,40)@6
    udf_uid41_fpInverseTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid39_fpInverseTest_q(8)) & expRCompExt_uid39_fpInverseTest_q));
    udf_uid41_fpInverseTest_b <= STD_LOGIC_VECTOR(udf_uid41_fpInverseTest_in(9 downto 9));

    -- invExpXIsMax_uid27_fpInverseTest(LOGICAL,26)@6
    invExpXIsMax_uid27_fpInverseTest_q <= not (expXIsMax_uid22_fpInverseTest_q);

    -- InvExpXIsZero_uid28_fpInverseTest(LOGICAL,27)@6
    InvExpXIsZero_uid28_fpInverseTest_q <= not (excZ_x_uid21_fpInverseTest_q);

    -- excR_x_uid29_fpInverseTest(LOGICAL,28)@6
    excR_x_uid29_fpInverseTest_q <= InvExpXIsZero_uid28_fpInverseTest_q and invExpXIsMax_uid27_fpInverseTest_q;

    -- xRegAndUdf_uid49_fpInverseTest(LOGICAL,48)@6
    xRegAndUdf_uid49_fpInverseTest_q <= excR_x_uid29_fpInverseTest_q and udf_uid41_fpInverseTest_b;

    -- excI_x_uid25_fpInverseTest(LOGICAL,24)@6
    excI_x_uid25_fpInverseTest_q <= expXIsMax_uid22_fpInverseTest_q and redist5_fracXIsZero_uid23_fpInverseTest_q_6_q;

    -- xIOrXRUdf_uid50_fpInverseTest(LOGICAL,49)@6
    xIOrXRUdf_uid50_fpInverseTest_q <= excI_x_uid25_fpInverseTest_q or xRegAndUdf_uid49_fpInverseTest_q;

    -- excSelBits_uid51_fpInverseTest(BITJOIN,50)@6
    excSelBits_uid51_fpInverseTest_q <= excN_x_uid26_fpInverseTest_q & excZ_x_uid21_fpInverseTest_q & xIOrXRUdf_uid50_fpInverseTest_q;

    -- outMuxSelEnc_uid52_fpInverseTest(LOOKUP,51)@6
    outMuxSelEnc_uid52_fpInverseTest_combproc: PROCESS (excSelBits_uid51_fpInverseTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid51_fpInverseTest_q) IS
            WHEN "000" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid52_fpInverseTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid52_fpInverseTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid52_fpInverseTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid52_fpInverseTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid55_fpInverseTest(MUX,54)@6
    expRPostExc_uid55_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    expRPostExc_uid55_fpInverseTest_combproc: PROCESS (expRPostExc_uid55_fpInverseTest_s, cstAllZWE_uid12_fpInverseTest_q, expRCalc_uid48_fpInverseTest_q, cstAllOWE_uid9_fpInverseTest_q)
    BEGIN
        CASE (expRPostExc_uid55_fpInverseTest_s) IS
            WHEN "00" => expRPostExc_uid55_fpInverseTest_q <= cstAllZWE_uid12_fpInverseTest_q;
            WHEN "01" => expRPostExc_uid55_fpInverseTest_q <= expRCalc_uid48_fpInverseTest_q;
            WHEN "10" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN "11" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN OTHERS => expRPostExc_uid55_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid11_fpInverseTest(CONSTANT,10)
    cstNaNWF_uid11_fpInverseTest_q <= "00000000000000000000001";

    -- oFracX_uid30_fpInverseTest(BITJOIN,29)@0
    oFracX_uid30_fpInverseTest_q <= VCC_q & fracX_uid7_fpInverseTest_b;

    -- y_uid34_fpInverseTest(BITSELECT,33)@0
    y_uid34_fpInverseTest_in <= oFracX_uid30_fpInverseTest_q(22 downto 0);
    y_uid34_fpInverseTest_b <= y_uid34_fpInverseTest_in(22 downto 0);

    -- yAddr_uid36_fpInverseTest_merged_bit_select(BITSELECT,201)@0
    yAddr_uid36_fpInverseTest_merged_bit_select_b <= y_uid34_fpInverseTest_b(22 downto 15);
    yAddr_uid36_fpInverseTest_merged_bit_select_c <= y_uid34_fpInverseTest_b(14 downto 0);

    -- memoryC2_uid66_inverseTables_lutmem(DUALMEM,200)@0 + 2
    -- in j@20000000
    memoryC2_uid66_inverseTables_lutmem_aa <= yAddr_uid36_fpInverseTest_merged_bit_select_b;
    memoryC2_uid66_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid66_inverseTables_lutmem_dmem : altsyncram
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
        init_file => "fp_inv_0002_memoryC2_uid66_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid66_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid66_inverseTables_lutmem_aa,
        q_a => memoryC2_uid66_inverseTables_lutmem_ir
    );
    memoryC2_uid66_inverseTables_lutmem_r <= memoryC2_uid66_inverseTables_lutmem_ir(11 downto 0);

    -- topRangeY_bottomExtension_uid106_pT1_uid73_invPolyEval(CONSTANT,105)
    topRangeY_bottomExtension_uid106_pT1_uid73_invPolyEval_q <= "00000";

    -- topRangeY_mergedSignalTM_uid108_pT1_uid73_invPolyEval(BITJOIN,107)@2
    topRangeY_mergedSignalTM_uid108_pT1_uid73_invPolyEval_q <= memoryC2_uid66_inverseTables_lutmem_r & topRangeY_bottomExtension_uid106_pT1_uid73_invPolyEval_q;

    -- redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2(DELAY,204)
    redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid36_fpInverseTest_merged_bit_select_c, xout => redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- yT1_uid72_invPolyEval(BITSELECT,71)@2
    yT1_uid72_invPolyEval_b <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q(14 downto 3);

    -- nx_mergedSignalTM_uid89_pT1_uid73_invPolyEval(BITJOIN,88)@2
    nx_mergedSignalTM_uid89_pT1_uid73_invPolyEval_q <= GND_q & yT1_uid72_invPolyEval_b;

    -- topRangeX_bottomExtension_uid102_pT1_uid73_invPolyEval(CONSTANT,101)
    topRangeX_bottomExtension_uid102_pT1_uid73_invPolyEval_q <= "0000";

    -- topRangeX_mergedSignalTM_uid104_pT1_uid73_invPolyEval(BITJOIN,103)@2
    topRangeX_mergedSignalTM_uid104_pT1_uid73_invPolyEval_q <= nx_mergedSignalTM_uid89_pT1_uid73_invPolyEval_q & topRangeX_bottomExtension_uid102_pT1_uid73_invPolyEval_q;

    -- sm0_uid110_pT1_uid73_invPolyEval(MULT,109)@2 + 2
    sm0_uid110_pT1_uid73_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid104_pT1_uid73_invPolyEval_q);
    sm0_uid110_pT1_uid73_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid108_pT1_uid73_invPolyEval_q);
    sm0_uid110_pT1_uid73_invPolyEval_reset <= areset;
    sm0_uid110_pT1_uid73_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid110_pT1_uid73_invPolyEval_a0,
        datab => sm0_uid110_pT1_uid73_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid110_pT1_uid73_invPolyEval_reset,
        clock => clk,
        result => sm0_uid110_pT1_uid73_invPolyEval_s1
    );
    sm0_uid110_pT1_uid73_invPolyEval_q <= sm0_uid110_pT1_uid73_invPolyEval_s1;

    -- osig_uid111_pT1_uid73_invPolyEval(BITSELECT,110)@4
    osig_uid111_pT1_uid73_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid110_pT1_uid73_invPolyEval_q(32 downto 0));
    osig_uid111_pT1_uid73_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid111_pT1_uid73_invPolyEval_in(32 downto 19));

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2(DELAY,202)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid36_fpInverseTest_merged_bit_select_b, xout => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid63_inverseTables_lutmem(DUALMEM,199)@2 + 2
    -- in j@20000000
    memoryC1_uid63_inverseTables_lutmem_aa <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q;
    memoryC1_uid63_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid63_inverseTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_inv_0002_memoryC1_uid63_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid63_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid63_inverseTables_lutmem_aa,
        q_a => memoryC1_uid63_inverseTables_lutmem_ir
    );
    memoryC1_uid63_inverseTables_lutmem_r <= memoryC1_uid63_inverseTables_lutmem_ir(19 downto 0);

    -- rndBit_uid74_invPolyEval(CONSTANT,73)
    rndBit_uid74_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid75_invPolyEval(BITJOIN,74)@4
    cIncludingRoundingBit_uid75_invPolyEval_q <= memoryC1_uid63_inverseTables_lutmem_r & rndBit_uid74_invPolyEval_q;

    -- ts1_uid77_invPolyEval(ADD,76)@4
    ts1_uid77_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => cIncludingRoundingBit_uid75_invPolyEval_q(21)) & cIncludingRoundingBit_uid75_invPolyEval_q));
    ts1_uid77_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 14 => osig_uid111_pT1_uid73_invPolyEval_b(13)) & osig_uid111_pT1_uid73_invPolyEval_b));
    ts1_uid77_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid77_invPolyEval_a) + SIGNED(ts1_uid77_invPolyEval_b));
    ts1_uid77_invPolyEval_q <= ts1_uid77_invPolyEval_o(22 downto 0);

    -- s1_uid78_invPolyEval(BITSELECT,77)@4
    s1_uid78_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid77_invPolyEval_q(22 downto 1));

    -- rightBottomY_uid147_pT2_uid80_invPolyEval(BITSELECT,146)@4
    rightBottomY_uid147_pT2_uid80_invPolyEval_in <= s1_uid78_invPolyEval_b(4 downto 0);
    rightBottomY_uid147_pT2_uid80_invPolyEval_b <= rightBottomY_uid147_pT2_uid80_invPolyEval_in(4 downto 0);

    -- n1_uid156_pT2_uid80_invPolyEval(BITSELECT,155)@4
    n1_uid156_pT2_uid80_invPolyEval_b <= rightBottomY_uid147_pT2_uid80_invPolyEval_b(4 downto 1);

    -- n1_uid164_pT2_uid80_invPolyEval(BITSELECT,163)@4
    n1_uid164_pT2_uid80_invPolyEval_b <= n1_uid156_pT2_uid80_invPolyEval_b(3 downto 1);

    -- n1_uid172_pT2_uid80_invPolyEval(BITSELECT,171)@4
    n1_uid172_pT2_uid80_invPolyEval_b <= n1_uid164_pT2_uid80_invPolyEval_b(2 downto 1);

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_4(DELAY,205)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_4 : dspba_delay
    GENERIC MAP ( width => 15, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q, xout => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_4_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval(BITJOIN,114)@4
    nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval_q <= GND_q & redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_4_q;

    -- rightBottomX_uid146_pT2_uid80_invPolyEval(BITSELECT,145)@4
    rightBottomX_uid146_pT2_uid80_invPolyEval_in <= nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval_q(7 downto 0);
    rightBottomX_uid146_pT2_uid80_invPolyEval_b <= rightBottomX_uid146_pT2_uid80_invPolyEval_in(7 downto 3);

    -- n0_uid157_pT2_uid80_invPolyEval(BITSELECT,156)@4
    n0_uid157_pT2_uid80_invPolyEval_b <= rightBottomX_uid146_pT2_uid80_invPolyEval_b(4 downto 1);

    -- n0_uid165_pT2_uid80_invPolyEval(BITSELECT,164)@4
    n0_uid165_pT2_uid80_invPolyEval_b <= n0_uid157_pT2_uid80_invPolyEval_b(3 downto 1);

    -- n0_uid173_pT2_uid80_invPolyEval(BITSELECT,172)@4
    n0_uid173_pT2_uid80_invPolyEval_b <= n0_uid165_pT2_uid80_invPolyEval_b(2 downto 1);

    -- sm0_uid188_pT2_uid80_invPolyEval(MULT,187)@4 + 2
    sm0_uid188_pT2_uid80_invPolyEval_a0 <= n0_uid173_pT2_uid80_invPolyEval_b;
    sm0_uid188_pT2_uid80_invPolyEval_b0 <= n1_uid172_pT2_uid80_invPolyEval_b;
    sm0_uid188_pT2_uid80_invPolyEval_reset <= areset;
    sm0_uid188_pT2_uid80_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 2,
        lpm_widthb => 2,
        lpm_widthp => 4,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid188_pT2_uid80_invPolyEval_a0,
        datab => sm0_uid188_pT2_uid80_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid188_pT2_uid80_invPolyEval_reset,
        clock => clk,
        result => sm0_uid188_pT2_uid80_invPolyEval_s1
    );
    sm0_uid188_pT2_uid80_invPolyEval_q <= sm0_uid188_pT2_uid80_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval(BITSELECT,136)@4
    aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_in <= STD_LOGIC_VECTOR(s1_uid78_invPolyEval_b(4 downto 0));
    aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_in(4 downto 0));

    -- aboveLeftY_bottomExtension_uid136_pT2_uid80_invPolyEval(CONSTANT,135)
    aboveLeftY_bottomExtension_uid136_pT2_uid80_invPolyEval_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid138_pT2_uid80_invPolyEval(BITJOIN,137)@4
    aboveLeftY_mergedSignalTM_uid138_pT2_uid80_invPolyEval_q <= aboveLeftY_bottomRange_uid137_pT2_uid80_invPolyEval_b & aboveLeftY_bottomExtension_uid136_pT2_uid80_invPolyEval_q;

    -- aboveLeftX_uid135_pT2_uid80_invPolyEval(BITSELECT,134)@4
    aboveLeftX_uid135_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval_q(15 downto 8));

    -- sm0_uid187_pT2_uid80_invPolyEval(MULT,186)@4 + 2
    sm0_uid187_pT2_uid80_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid135_pT2_uid80_invPolyEval_b);
    sm0_uid187_pT2_uid80_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid138_pT2_uid80_invPolyEval_q;
    sm0_uid187_pT2_uid80_invPolyEval_reset <= areset;
    sm0_uid187_pT2_uid80_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid187_pT2_uid80_invPolyEval_a0,
        datab => sm0_uid187_pT2_uid80_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid187_pT2_uid80_invPolyEval_reset,
        clock => clk,
        result => sm0_uid187_pT2_uid80_invPolyEval_s1
    );
    sm0_uid187_pT2_uid80_invPolyEval_q <= sm0_uid187_pT2_uid80_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid129_pT2_uid80_invPolyEval(BITSELECT,128)@4
    topRangeY_uid129_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid78_invPolyEval_b(21 downto 5));

    -- topRangeX_mergedSignalTM_uid127_pT2_uid80_invPolyEval(BITJOIN,126)@4
    topRangeX_mergedSignalTM_uid127_pT2_uid80_invPolyEval_q <= nx_mergedSignalTM_uid115_pT2_uid80_invPolyEval_q & GND_q;

    -- sm0_uid186_pT2_uid80_invPolyEval(MULT,185)@4 + 2
    sm0_uid186_pT2_uid80_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid127_pT2_uid80_invPolyEval_q);
    sm0_uid186_pT2_uid80_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid129_pT2_uid80_invPolyEval_b);
    sm0_uid186_pT2_uid80_invPolyEval_reset <= areset;
    sm0_uid186_pT2_uid80_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid186_pT2_uid80_invPolyEval_a0,
        datab => sm0_uid186_pT2_uid80_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid186_pT2_uid80_invPolyEval_reset,
        clock => clk,
        result => sm0_uid186_pT2_uid80_invPolyEval_s1
    );
    sm0_uid186_pT2_uid80_invPolyEval_q <= sm0_uid186_pT2_uid80_invPolyEval_s1;

    -- highABits_uid190_pT2_uid80_invPolyEval(BITSELECT,189)@6
    highABits_uid190_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid186_pT2_uid80_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid191_pT2_uid80_invPolyEval(ADD,190)@6
    lev1_a0high_uid191_pT2_uid80_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid190_pT2_uid80_invPolyEval_b(32)) & highABits_uid190_pT2_uid80_invPolyEval_b));
    lev1_a0high_uid191_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid187_pT2_uid80_invPolyEval_q(15)) & sm0_uid187_pT2_uid80_invPolyEval_q));
    lev1_a0high_uid191_pT2_uid80_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid191_pT2_uid80_invPolyEval_a) + SIGNED(lev1_a0high_uid191_pT2_uid80_invPolyEval_b));
    lev1_a0high_uid191_pT2_uid80_invPolyEval_q <= lev1_a0high_uid191_pT2_uid80_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid189_pT2_uid80_invPolyEval(BITSELECT,188)@6
    lowRangeA_uid189_pT2_uid80_invPolyEval_in <= sm0_uid186_pT2_uid80_invPolyEval_q(0 downto 0);
    lowRangeA_uid189_pT2_uid80_invPolyEval_b <= lowRangeA_uid189_pT2_uid80_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid192_pT2_uid80_invPolyEval(BITJOIN,191)@6
    lev1_a0_uid192_pT2_uid80_invPolyEval_q <= lev1_a0high_uid191_pT2_uid80_invPolyEval_q & lowRangeA_uid189_pT2_uid80_invPolyEval_b;

    -- highABits_uid194_pT2_uid80_invPolyEval(BITSELECT,193)@6
    highABits_uid194_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid192_pT2_uid80_invPolyEval_q(34 downto 5));

    -- lev2_a0high_uid195_pT2_uid80_invPolyEval(ADD,194)@6
    lev2_a0high_uid195_pT2_uid80_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => highABits_uid194_pT2_uid80_invPolyEval_b(29)) & highABits_uid194_pT2_uid80_invPolyEval_b));
    lev2_a0high_uid195_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid188_pT2_uid80_invPolyEval_q));
    lev2_a0high_uid195_pT2_uid80_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid195_pT2_uid80_invPolyEval_a) + SIGNED(lev2_a0high_uid195_pT2_uid80_invPolyEval_b));
    lev2_a0high_uid195_pT2_uid80_invPolyEval_q <= lev2_a0high_uid195_pT2_uid80_invPolyEval_o(30 downto 0);

    -- lowRangeA_uid193_pT2_uid80_invPolyEval(BITSELECT,192)@6
    lowRangeA_uid193_pT2_uid80_invPolyEval_in <= lev1_a0_uid192_pT2_uid80_invPolyEval_q(4 downto 0);
    lowRangeA_uid193_pT2_uid80_invPolyEval_b <= lowRangeA_uid193_pT2_uid80_invPolyEval_in(4 downto 0);

    -- lev2_a0_uid196_pT2_uid80_invPolyEval(BITJOIN,195)@6
    lev2_a0_uid196_pT2_uid80_invPolyEval_q <= lev2_a0high_uid195_pT2_uid80_invPolyEval_q & lowRangeA_uid193_pT2_uid80_invPolyEval_b;

    -- osig_uid197_pT2_uid80_invPolyEval(BITSELECT,196)@6
    osig_uid197_pT2_uid80_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid196_pT2_uid80_invPolyEval_q(32 downto 0));
    osig_uid197_pT2_uid80_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid197_pT2_uid80_invPolyEval_in(32 downto 9));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_4(DELAY,203)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q, xout => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- memoryC0_uid60_inverseTables_lutmem(DUALMEM,198)@4 + 2
    -- in j@20000000
    memoryC0_uid60_inverseTables_lutmem_aa <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_4_q;
    memoryC0_uid60_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid60_inverseTables_lutmem_dmem : altsyncram
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
        init_file => "fp_inv_0002_memoryC0_uid60_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid60_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid60_inverseTables_lutmem_aa,
        q_a => memoryC0_uid60_inverseTables_lutmem_ir
    );
    memoryC0_uid60_inverseTables_lutmem_r <= memoryC0_uid60_inverseTables_lutmem_ir(28 downto 0);

    -- rndBit_uid81_invPolyEval(CONSTANT,80)
    rndBit_uid81_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid82_invPolyEval(BITJOIN,81)@6
    cIncludingRoundingBit_uid82_invPolyEval_q <= memoryC0_uid60_inverseTables_lutmem_r & rndBit_uid81_invPolyEval_q;

    -- ts2_uid84_invPolyEval(ADD,83)@6
    ts2_uid84_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid82_invPolyEval_q(31)) & cIncludingRoundingBit_uid82_invPolyEval_q));
    ts2_uid84_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 24 => osig_uid197_pT2_uid80_invPolyEval_b(23)) & osig_uid197_pT2_uid80_invPolyEval_b));
    ts2_uid84_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid84_invPolyEval_a) + SIGNED(ts2_uid84_invPolyEval_b));
    ts2_uid84_invPolyEval_q <= ts2_uid84_invPolyEval_o(32 downto 0);

    -- s2_uid85_invPolyEval(BITSELECT,84)@6
    s2_uid85_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid84_invPolyEval_q(32 downto 1));

    -- fxpInverseRes_uid44_fpInverseTest(BITSELECT,43)@6
    fxpInverseRes_uid44_fpInverseTest_in <= s2_uid85_invPolyEval_b(28 downto 0);
    fxpInverseRes_uid44_fpInverseTest_b <= fxpInverseRes_uid44_fpInverseTest_in(28 downto 5);

    -- fxpInverseResFrac_uid46_fpInverseTest(BITSELECT,45)@6
    fxpInverseResFrac_uid46_fpInverseTest_in <= fxpInverseRes_uid44_fpInverseTest_b(22 downto 0);
    fxpInverseResFrac_uid46_fpInverseTest_b <= fxpInverseResFrac_uid46_fpInverseTest_in(22 downto 0);

    -- fracRCalc_uid47_fpInverseTest(MUX,46)@6
    fracRCalc_uid47_fpInverseTest_s <= redist4_fracXIsZero_uid31_fpInverseTest_q_6_q;
    fracRCalc_uid47_fpInverseTest_combproc: PROCESS (fracRCalc_uid47_fpInverseTest_s, fxpInverseResFrac_uid46_fpInverseTest_b, cstAllZWF_uid10_fpInverseTest_q)
    BEGIN
        CASE (fracRCalc_uid47_fpInverseTest_s) IS
            WHEN "0" => fracRCalc_uid47_fpInverseTest_q <= fxpInverseResFrac_uid46_fpInverseTest_b;
            WHEN "1" => fracRCalc_uid47_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN OTHERS => fracRCalc_uid47_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid54_fpInverseTest(MUX,53)@6
    fracRPostExc_uid54_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    fracRPostExc_uid54_fpInverseTest_combproc: PROCESS (fracRPostExc_uid54_fpInverseTest_s, cstAllZWF_uid10_fpInverseTest_q, fracRCalc_uid47_fpInverseTest_q, cstNaNWF_uid11_fpInverseTest_q)
    BEGIN
        CASE (fracRPostExc_uid54_fpInverseTest_s) IS
            WHEN "00" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "01" => fracRPostExc_uid54_fpInverseTest_q <= fracRCalc_uid47_fpInverseTest_q;
            WHEN "10" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "11" => fracRPostExc_uid54_fpInverseTest_q <= cstNaNWF_uid11_fpInverseTest_q;
            WHEN OTHERS => fracRPostExc_uid54_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid58_fpInverseTest(BITJOIN,57)@6
    R_uid58_fpInverseTest_q <= signR_uid57_fpInverseTest_q & expRPostExc_uid55_fpInverseTest_q & fracRPostExc_uid54_fpInverseTest_q;

    -- xOut(GPOUT,4)@6
    q <= R_uid58_fpInverseTest_q;

END normal;
