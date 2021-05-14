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

-- VHDL created from fp_sin_0002
-- VHDL created on Tue May 11 07:30:50 2021


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

entity fp_sin_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_sin_0002;

architecture normal of fp_sin_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpSinPiTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_fpSinPiTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid8_fpSinPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid10_fpSinPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid11_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPwF_uid12_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid16_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid19_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid20_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid21_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid21_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid22_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid23_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid24_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid25_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid26_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid27_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIntExp_uid28_fpSinPiTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal xIntExp_uid28_fpSinPiTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal xIntExp_uid28_fpSinPiTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal xIntExp_uid28_fpSinPiTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal biasM1_uid29_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xFrac_uid30_fpSinPiTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal xFrac_uid30_fpSinPiTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal xFrac_uid30_fpSinPiTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal xFrac_uid30_fpSinPiTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal biasMwShift_uid31_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sinXIsX_uid32_fpSinPiTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal sinXIsX_uid32_fpSinPiTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sinXIsX_uid32_fpSinPiTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal sinXIsX_uid32_fpSinPiTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid33_fpSinPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal shiftBias_uid34_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValue_uid35_fpSinPiTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid35_fpSinPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid35_fpSinPiTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid35_fpSinPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cst01pWShift_uid36_fpSinPiTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal extendedFracX_uid37_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal fxpShifterBits_uid38_fpSinPiTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fxpShifterBits_uid38_fpSinPiTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal intXParity_uid40_fpSinPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid41_fpSinPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal y_uid41_fpSinPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal yIsZero_uid42_fpSinPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal yIsZero_uid42_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid42_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ozz_uid43_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yIsHalfCmpEqSecondOp_uid44_fpSinPiTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal yIsZero_uid45_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid45_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cOne_uid46_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal oneMinusY_uid47_fpSinPiTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal oneMinusY_uid47_fpSinPiTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal oneMinusY_uid47_fpSinPiTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal oneMinusY_uid47_fpSinPiTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal cmpYToOneMinusY_uid49_fpSinPiTest_a : STD_LOGIC_VECTOR (39 downto 0);
    signal cmpYToOneMinusY_uid49_fpSinPiTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal cmpYToOneMinusY_uid49_fpSinPiTest_o : STD_LOGIC_VECTOR (39 downto 0);
    signal cmpYToOneMinusY_uid49_fpSinPiTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oMyBottom_uid50_fpSinPiTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal oMyBottom_uid50_fpSinPiTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yBottom_uid51_fpSinPiTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal yBottom_uid51_fpSinPiTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal z_uid52_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal z_uid52_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal alignedZLow_uid56_fpSinPiTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal pHardCase_uid57_fpSinPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal p_uid58_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal p_uid58_fpSinPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expXP1_uid62_fpSinPiTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXP1_uid62_fpSinPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXP1_uid62_fpSinPiTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXP1_uid62_fpSinPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expXP1R_uid63_fpSinPiTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expXP1R_uid63_fpSinPiTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid67_fpSinPiTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal zPPolyEval_uid68_fpSinPiTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal zPPolyEval_uid68_fpSinPiTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpSinRes_uid70_fpSinPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal fxpSinRes_uid70_fpSinPiTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal piwFP2_uid71_fpSinPiTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal multRightOp_uid73_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal multRightOp_uid73_fpSinPiTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal normBit_uid75_fpSinPiTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal normBit_uid75_fpSinPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highRes_uid76_fpSinPiTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal highRes_uid76_fpSinPiTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRes_uid77_fpSinPiTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal lowRes_uid77_fpSinPiTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRCompPreRnd_uid78_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCompPreRnd_uid78_fpSinPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracPreRnd_uid79_fpSinPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rndExpUpdate_uid84_fpSinPiTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracComp_uid85_fpSinPiTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid85_fpSinPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid85_fpSinPiTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid85_fpSinPiTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invSinXIsX_uid88_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZSinXNX_uid89_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIntYz_uid90_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsInt_uid91_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIntExp_uid92_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRyHalf_uid94_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xRyHalf_uid94_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndInt_uid95_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid96_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid96_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xHalfRZI_uid98_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc1_uid100_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc1_uid100_fpSinPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oneFracRPostExc2_uid101_fpSinPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid102_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid102_fpSinPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rZOrXInt_uid103_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostExc1_uid106_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostExc1_uid106_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excRIoN_uid107_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostExc_r3_uid108_fpSinPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid109_fpSinPiTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid109_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invXFrac_uid110_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXIsInt_uid111_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signComp_uid112_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invYIsZero_uid113_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZSC_uid114_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid115_fpSinPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid115_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid116_fpSinPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid118_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid119_lzcZ_uid54_fpSinPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid120_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid121_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal vStage_uid122_lzcZ_uid54_fpSinPiTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal vStage_uid122_lzcZ_uid54_fpSinPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal cStage_uid123_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid125_lzcZ_uid54_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid125_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid126_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid128_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid131_lzcZ_uid54_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid131_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid134_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid137_lzcZ_uid54_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid137_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid138_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid140_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid143_lzcZ_uid54_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid143_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid144_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid146_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid149_lzcZ_uid54_fpSinPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid149_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid151_lzcZ_uid54_fpSinPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid152_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid153_lzcZ_uid54_fpSinPiTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid167_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid169_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid170_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid172_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid172_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid172_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid172_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid173_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rndBit_uid176_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid177_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid179_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid179_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid179_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid179_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid180_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_mergedSignalTM_uid184_pT1_uid168_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid196_pT1_uid168_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal topRangeY_mergedSignalTM_uid200_pT1_uid168_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid202_pT1_uid168_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid202_pT1_uid168_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid202_pT1_uid168_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid202_pT1_uid168_invPolyEval_reset : std_logic;
    signal sm0_uid202_pT1_uid168_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid203_pT1_uid168_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid203_pT1_uid168_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid218_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid224_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid227_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid235_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid235_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid236_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid236_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid245_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid246_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid253_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid254_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid267_pT2_uid175_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid267_pT2_uid175_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid267_pT2_uid175_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid267_pT2_uid175_invPolyEval_reset : std_logic;
    signal sm0_uid267_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid268_pT2_uid175_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid268_pT2_uid175_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid268_pT2_uid175_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid268_pT2_uid175_invPolyEval_reset : std_logic;
    signal sm0_uid268_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid269_pT2_uid175_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid269_pT2_uid175_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid269_pT2_uid175_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid269_pT2_uid175_invPolyEval_reset : std_logic;
    signal sm0_uid269_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid270_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid270_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid271_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid272_pT2_uid175_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid272_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid272_pT2_uid175_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid272_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid273_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid274_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid274_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid275_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid276_pT2_uid175_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid276_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid276_pT2_uid175_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid276_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal lev2_a0_uid277_pT2_uid175_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid278_pT2_uid175_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid278_pT2_uid175_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx1_uid284_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal leftShiftStage0Idx2_uid287_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx3Pad24_uid288_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage0Idx3_uid290_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx4_uid293_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1_uid301_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2_uid304_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx3_uid307_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx4_uid310_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx5Pad5_uid311_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5_uid313_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx6Pad6_uid314_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx6_uid316_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx7Pad7_uid317_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx7_uid319_fixedPointX_uid39_fpSinPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1_uid327_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2_uid330_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx3_uid333_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx4_uid336_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx1_uid344_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx2_uid347_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3_uid350_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx4_uid353_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx5_uid356_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx6_uid359_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx7_uid362_alignedZ_uid55_fpSinPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im0_reset : std_logic;
    signal mul2xSinRes_uid74_fpSinPiTest_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im3_b0 : STD_LOGIC_VECTOR (6 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im3_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im3_reset : std_logic;
    signal mul2xSinRes_uid74_fpSinPiTest_im3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im6_reset : std_logic;
    signal mul2xSinRes_uid74_fpSinPiTest_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im9_a0 : STD_LOGIC_VECTOR (6 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im9_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_im9_reset : std_logic;
    signal mul2xSinRes_uid74_fpSinPiTest_im9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_join_12_q : STD_LOGIC_VECTOR (48 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_align_13_q : STD_LOGIC_VECTOR (42 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_align_13_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_a : STD_LOGIC_VECTOR (50 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_b : STD_LOGIC_VECTOR (50 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_o : STD_LOGIC_VECTOR (50 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_q : STD_LOGIC_VECTOR (50 downto 0);
    signal memoryC0_uid155_sinPiXTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid155_sinPiXTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid155_sinPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC0_uid155_sinPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC0_uid155_sinPiXTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid155_sinPiXTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid158_sinPiXTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid158_sinPiXTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid158_sinPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC1_uid158_sinPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC1_uid158_sinPiXTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid158_sinPiXTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid161_sinPiXTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid161_sinPiXTables_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC2_uid161_sinPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC2_uid161_sinPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC2_uid161_sinPiXTables_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC2_uid161_sinPiXTables_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal fracRComp_uid86_fpSinPiTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRComp_uid86_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRComp_uid86_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_signR_uid115_fpSinPiTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_excRNaN_uid97_fpSinPiTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_excRZero_uid96_fpSinPiTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_xRyHalf_uid94_fpSinPiTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_xIsInt_uid91_fpSinPiTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_zPPolyEval_uid68_fpSinPiTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_zPPolyEval_uid68_fpSinPiTest_b_3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist8_yAddr_uid67_fpSinPiTest_b_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist9_yAddr_uid67_fpSinPiTest_b_4_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist10_p_uid58_fpSinPiTest_q_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist11_alignedZLow_uid56_fpSinPiTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist12_z_uid52_fpSinPiTest_q_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist13_intXParity_uid40_fpSinPiTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid33_fpSinPiTest_q_2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_sinXIsX_uid32_fpSinPiTest_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sinXIsX_uid32_fpSinPiTest_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_signX_uid8_fpSinPiTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpSinPiTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest(CONSTANT,293)
    leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q <= "0000000000000000000000000000000000000";

    -- cst01pWShift_uid36_fpSinPiTest(CONSTANT,35)
    cst01pWShift_uid36_fpSinPiTest_q <= "0000000000000";

    -- fracX_uid7_fpSinPiTest(BITSELECT,6)@0
    fracX_uid7_fpSinPiTest_b <= a(22 downto 0);

    -- oFracX_uid33_fpSinPiTest(BITJOIN,32)@0
    oFracX_uid33_fpSinPiTest_q <= VCC_q & fracX_uid7_fpSinPiTest_b;

    -- extendedFracX_uid37_fpSinPiTest(BITJOIN,36)@0
    extendedFracX_uid37_fpSinPiTest_q <= cst01pWShift_uid36_fpSinPiTest_q & oFracX_uid33_fpSinPiTest_q;

    -- leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest(BITSELECT,291)@0
    leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_in <= extendedFracX_uid37_fpSinPiTest_q(4 downto 0);
    leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_in(4 downto 0);

    -- zs_uid118_lzcZ_uid54_fpSinPiTest(CONSTANT,117)
    zs_uid118_lzcZ_uid54_fpSinPiTest_q <= "00000000000000000000000000000000";

    -- leftShiftStage0Idx4_uid293_fixedPointX_uid39_fpSinPiTest(BITJOIN,292)@0
    leftShiftStage0Idx4_uid293_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage0Idx4Rng32_uid292_fixedPointX_uid39_fpSinPiTest_b & zs_uid118_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1(MUX,391)@0
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_s <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_s, leftShiftStage0Idx4_uid293_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage0Idx4_uid293_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "01" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "10" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "11" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage0Idx5_uid294_fixedPointX_uid39_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest(BITSELECT,288)@0
    leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_in <= extendedFracX_uid37_fpSinPiTest_q(12 downto 0);
    leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_in(12 downto 0);

    -- leftShiftStage0Idx3Pad24_uid288_fixedPointX_uid39_fpSinPiTest(CONSTANT,287)
    leftShiftStage0Idx3Pad24_uid288_fixedPointX_uid39_fpSinPiTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid290_fixedPointX_uid39_fpSinPiTest(BITJOIN,289)@0
    leftShiftStage0Idx3_uid290_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage0Idx3Rng24_uid289_fixedPointX_uid39_fpSinPiTest_b & leftShiftStage0Idx3Pad24_uid288_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest(BITSELECT,285)@0
    leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_in <= extendedFracX_uid37_fpSinPiTest_q(20 downto 0);
    leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_in(20 downto 0);

    -- zs_uid126_lzcZ_uid54_fpSinPiTest(CONSTANT,125)
    zs_uid126_lzcZ_uid54_fpSinPiTest_q <= "0000000000000000";

    -- leftShiftStage0Idx2_uid287_fixedPointX_uid39_fpSinPiTest(BITJOIN,286)@0
    leftShiftStage0Idx2_uid287_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage0Idx2Rng16_uid286_fixedPointX_uid39_fpSinPiTest_b & zs_uid126_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest(BITSELECT,282)@0
    leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_in <= extendedFracX_uid37_fpSinPiTest_q(28 downto 0);
    leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_in(28 downto 0);

    -- cstAllZWE_uid16_fpSinPiTest(CONSTANT,15)
    cstAllZWE_uid16_fpSinPiTest_q <= "00000000";

    -- leftShiftStage0Idx1_uid284_fixedPointX_uid39_fpSinPiTest(BITJOIN,283)@0
    leftShiftStage0Idx1_uid284_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage0Idx1Rng8_uid283_fixedPointX_uid39_fpSinPiTest_b & cstAllZWE_uid16_fpSinPiTest_q;

    -- leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0(MUX,390)@0
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_s <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_s, extendedFracX_uid37_fpSinPiTest_q, leftShiftStage0Idx1_uid284_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage0Idx2_uid287_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage0Idx3_uid290_fixedPointX_uid39_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= extendedFracX_uid37_fpSinPiTest_q;
            WHEN "01" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx1_uid284_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "10" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx2_uid287_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "11" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx3_uid290_fixedPointX_uid39_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftBias_uid34_fpSinPiTest(CONSTANT,33)
    shiftBias_uid34_fpSinPiTest_q <= "01110010";

    -- expX_uid6_fpSinPiTest(BITSELECT,5)@0
    expX_uid6_fpSinPiTest_b <= a(30 downto 23);

    -- shiftValue_uid35_fpSinPiTest(SUB,34)@0
    shiftValue_uid35_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSinPiTest_b);
    shiftValue_uid35_fpSinPiTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid34_fpSinPiTest_q);
    shiftValue_uid35_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid35_fpSinPiTest_a) - UNSIGNED(shiftValue_uid35_fpSinPiTest_b));
    shiftValue_uid35_fpSinPiTest_q <= shiftValue_uid35_fpSinPiTest_o(8 downto 0);

    -- fxpShifterBits_uid38_fpSinPiTest(BITSELECT,37)@0
    fxpShifterBits_uid38_fpSinPiTest_in <= shiftValue_uid35_fpSinPiTest_q(5 downto 0);
    fxpShifterBits_uid38_fpSinPiTest_b <= fxpShifterBits_uid38_fpSinPiTest_in(5 downto 0);

    -- leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select(BITSELECT,408)@0
    leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_b <= fxpShifterBits_uid38_fpSinPiTest_b(5 downto 3);
    leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_c <= fxpShifterBits_uid38_fpSinPiTest_b(2 downto 0);

    -- leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select(BITSELECT,417)@0
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal(MUX,392)@0
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_s <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_combproc: PROCESS (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_s, leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q, leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest(BITSELECT,317)@0
    leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(29 downto 0);
    leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_in(29 downto 0);

    -- leftShiftStage1Idx7Pad7_uid317_fixedPointX_uid39_fpSinPiTest(CONSTANT,316)
    leftShiftStage1Idx7Pad7_uid317_fixedPointX_uid39_fpSinPiTest_q <= "0000000";

    -- leftShiftStage1Idx7_uid319_fixedPointX_uid39_fpSinPiTest(BITJOIN,318)@0
    leftShiftStage1Idx7_uid319_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx7Rng7_uid318_fixedPointX_uid39_fpSinPiTest_b & leftShiftStage1Idx7Pad7_uid317_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest(BITSELECT,314)@0
    leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(30 downto 0);
    leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_in(30 downto 0);

    -- leftShiftStage1Idx6Pad6_uid314_fixedPointX_uid39_fpSinPiTest(CONSTANT,313)
    leftShiftStage1Idx6Pad6_uid314_fixedPointX_uid39_fpSinPiTest_q <= "000000";

    -- leftShiftStage1Idx6_uid316_fixedPointX_uid39_fpSinPiTest(BITJOIN,315)@0
    leftShiftStage1Idx6_uid316_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx6Rng6_uid315_fixedPointX_uid39_fpSinPiTest_b & leftShiftStage1Idx6Pad6_uid314_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest(BITSELECT,311)@0
    leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(31 downto 0);
    leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_in(31 downto 0);

    -- leftShiftStage1Idx5Pad5_uid311_fixedPointX_uid39_fpSinPiTest(CONSTANT,310)
    leftShiftStage1Idx5Pad5_uid311_fixedPointX_uid39_fpSinPiTest_q <= "00000";

    -- leftShiftStage1Idx5_uid313_fixedPointX_uid39_fpSinPiTest(BITJOIN,312)@0
    leftShiftStage1Idx5_uid313_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx5Rng5_uid312_fixedPointX_uid39_fpSinPiTest_b & leftShiftStage1Idx5Pad5_uid311_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest(BITSELECT,308)@0
    leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(32 downto 0);
    leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_in(32 downto 0);

    -- zs_uid138_lzcZ_uid54_fpSinPiTest(CONSTANT,137)
    zs_uid138_lzcZ_uid54_fpSinPiTest_q <= "0000";

    -- leftShiftStage1Idx4_uid310_fixedPointX_uid39_fpSinPiTest(BITJOIN,309)@0
    leftShiftStage1Idx4_uid310_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx4Rng4_uid309_fixedPointX_uid39_fpSinPiTest_b & zs_uid138_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1(MUX,396)@0
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_s <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_combproc: PROCESS (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_s, leftShiftStage1Idx4_uid310_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage1Idx5_uid313_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage1Idx6_uid316_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage1Idx7_uid319_fixedPointX_uid39_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx4_uid310_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "01" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx5_uid313_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "10" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx6_uid316_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "11" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx7_uid319_fixedPointX_uid39_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest(BITSELECT,305)@0
    leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(33 downto 0);
    leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_in(33 downto 0);

    -- topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval(CONSTANT,197)
    topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval_q <= "000";

    -- leftShiftStage1Idx3_uid307_fixedPointX_uid39_fpSinPiTest(BITJOIN,306)@0
    leftShiftStage1Idx3_uid307_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx3Rng3_uid306_fixedPointX_uid39_fpSinPiTest_b & topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest(BITSELECT,302)@0
    leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(34 downto 0);
    leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_in(34 downto 0);

    -- zs_uid144_lzcZ_uid54_fpSinPiTest(CONSTANT,143)
    zs_uid144_lzcZ_uid54_fpSinPiTest_q <= "00";

    -- leftShiftStage1Idx2_uid304_fixedPointX_uid39_fpSinPiTest(BITJOIN,303)@0
    leftShiftStage1Idx2_uid304_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx2Rng2_uid303_fixedPointX_uid39_fpSinPiTest_b & zs_uid144_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest(BITSELECT,299)@0
    leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_in <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q(35 downto 0);
    leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_b <= leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_in(35 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- leftShiftStage1Idx1_uid301_fixedPointX_uid39_fpSinPiTest(BITJOIN,300)@0
    leftShiftStage1Idx1_uid301_fixedPointX_uid39_fpSinPiTest_q <= leftShiftStage1Idx1Rng1_uid300_fixedPointX_uid39_fpSinPiTest_b & GND_q;

    -- leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0(MUX,395)@0
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_s <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_combproc: PROCESS (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_s, leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q, leftShiftStage1Idx1_uid301_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage1Idx2_uid304_fixedPointX_uid39_fpSinPiTest_q, leftShiftStage1Idx3_uid307_fixedPointX_uid39_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage0_uid298_fixedPointX_uid39_fpSinPiTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx1_uid301_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "10" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx2_uid304_fixedPointX_uid39_fpSinPiTest_q;
            WHEN "11" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx3_uid307_fixedPointX_uid39_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select(BITSELECT,418)@0
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_c(1 downto 0);
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid297_fixedPointX_uid39_fpSinPiTest_merged_bit_select_c(2 downto 2);

    -- leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal(MUX,397)@0
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_s <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_combproc: PROCESS (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_s, leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q, leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- intXParity_uid40_fpSinPiTest(BITSELECT,39)@0
    intXParity_uid40_fpSinPiTest_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q(36 downto 36));

    -- redist13_intXParity_uid40_fpSinPiTest_b_1(DELAY,434)
    redist13_intXParity_uid40_fpSinPiTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => intXParity_uid40_fpSinPiTest_b, xout => redist13_intXParity_uid40_fpSinPiTest_b_1_q, clk => clk, aclr => areset );

    -- redist18_expX_uid6_fpSinPiTest_b_1(DELAY,439)
    redist18_expX_uid6_fpSinPiTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpSinPiTest_b, xout => redist18_expX_uid6_fpSinPiTest_b_1_q, clk => clk, aclr => areset );

    -- biasM1_uid29_fpSinPiTest(CONSTANT,28)
    biasM1_uid29_fpSinPiTest_q <= "01111110";

    -- xFrac_uid30_fpSinPiTest(COMPARE,29)@1
    xFrac_uid30_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & biasM1_uid29_fpSinPiTest_q);
    xFrac_uid30_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & redist18_expX_uid6_fpSinPiTest_b_1_q);
    xFrac_uid30_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xFrac_uid30_fpSinPiTest_a) - UNSIGNED(xFrac_uid30_fpSinPiTest_b));
    xFrac_uid30_fpSinPiTest_n(0) <= not (xFrac_uid30_fpSinPiTest_o(9));

    -- invXFrac_uid110_fpSinPiTest(LOGICAL,109)@1
    invXFrac_uid110_fpSinPiTest_q <= not (xFrac_uid30_fpSinPiTest_n);

    -- biasMwShift_uid31_fpSinPiTest(CONSTANT,30)
    biasMwShift_uid31_fpSinPiTest_q <= "01110011";

    -- sinXIsX_uid32_fpSinPiTest(COMPARE,31)@1
    sinXIsX_uid32_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & redist18_expX_uid6_fpSinPiTest_b_1_q);
    sinXIsX_uid32_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShift_uid31_fpSinPiTest_q);
    sinXIsX_uid32_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid32_fpSinPiTest_a) - UNSIGNED(sinXIsX_uid32_fpSinPiTest_b));
    sinXIsX_uid32_fpSinPiTest_c(0) <= sinXIsX_uid32_fpSinPiTest_o(9);

    -- invSinXIsX_uid88_fpSinPiTest(LOGICAL,87)@1
    invSinXIsX_uid88_fpSinPiTest_q <= not (sinXIsX_uid32_fpSinPiTest_c);

    -- y_uid41_fpSinPiTest(BITSELECT,40)@0
    y_uid41_fpSinPiTest_in <= leftShiftStage1_uid321_fixedPointX_uid39_fpSinPiTest_mfinal_q(35 downto 0);
    y_uid41_fpSinPiTest_b <= y_uid41_fpSinPiTest_in(35 downto 0);

    -- yIsZero_uid42_fpSinPiTest(LOGICAL,41)@0 + 1
    yIsZero_uid42_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & GND_q);
    yIsZero_uid42_fpSinPiTest_qi <= "1" WHEN y_uid41_fpSinPiTest_b = yIsZero_uid42_fpSinPiTest_b ELSE "0";
    yIsZero_uid42_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yIsZero_uid42_fpSinPiTest_qi, xout => yIsZero_uid42_fpSinPiTest_q, clk => clk, aclr => areset );

    -- yZSinXNX_uid89_fpSinPiTest(LOGICAL,88)@1
    yZSinXNX_uid89_fpSinPiTest_q <= yIsZero_uid42_fpSinPiTest_q and invSinXIsX_uid88_fpSinPiTest_q;

    -- cstBiasPwF_uid12_fpSinPiTest(CONSTANT,11)
    cstBiasPwF_uid12_fpSinPiTest_q <= "10010110";

    -- xIntExp_uid28_fpSinPiTest(COMPARE,27)@1
    xIntExp_uid28_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid12_fpSinPiTest_q);
    xIntExp_uid28_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & redist18_expX_uid6_fpSinPiTest_b_1_q);
    xIntExp_uid28_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xIntExp_uid28_fpSinPiTest_a) - UNSIGNED(xIntExp_uid28_fpSinPiTest_b));
    xIntExp_uid28_fpSinPiTest_c(0) <= xIntExp_uid28_fpSinPiTest_o(9);

    -- xIntYz_uid90_fpSinPiTest(LOGICAL,89)@1
    xIntYz_uid90_fpSinPiTest_q <= xIntExp_uid28_fpSinPiTest_c or yZSinXNX_uid89_fpSinPiTest_q;

    -- cstAllOWE_uid9_fpSinPiTest(CONSTANT,8)
    cstAllOWE_uid9_fpSinPiTest_q <= "11111111";

    -- expXIsMax_uid20_fpSinPiTest(LOGICAL,19)@1
    expXIsMax_uid20_fpSinPiTest_q <= "1" WHEN redist18_expX_uid6_fpSinPiTest_b_1_q = cstAllOWE_uid9_fpSinPiTest_q ELSE "0";

    -- invExpXIsMax_uid25_fpSinPiTest(LOGICAL,24)@1
    invExpXIsMax_uid25_fpSinPiTest_q <= not (expXIsMax_uid20_fpSinPiTest_q);

    -- excZ_x_uid19_fpSinPiTest(LOGICAL,18)@1
    excZ_x_uid19_fpSinPiTest_q <= "1" WHEN redist18_expX_uid6_fpSinPiTest_b_1_q = cstAllZWE_uid16_fpSinPiTest_q ELSE "0";

    -- InvExpXIsZero_uid26_fpSinPiTest(LOGICAL,25)@1
    InvExpXIsZero_uid26_fpSinPiTest_q <= not (excZ_x_uid19_fpSinPiTest_q);

    -- excR_x_uid27_fpSinPiTest(LOGICAL,26)@1
    excR_x_uid27_fpSinPiTest_q <= InvExpXIsZero_uid26_fpSinPiTest_q and invExpXIsMax_uid25_fpSinPiTest_q;

    -- xIsInt_uid91_fpSinPiTest(LOGICAL,90)@1
    xIsInt_uid91_fpSinPiTest_q <= excR_x_uid27_fpSinPiTest_q and xIntYz_uid90_fpSinPiTest_q;

    -- invXIsInt_uid111_fpSinPiTest(LOGICAL,110)@1
    invXIsInt_uid111_fpSinPiTest_q <= not (xIsInt_uid91_fpSinPiTest_q);

    -- signComp_uid112_fpSinPiTest(LOGICAL,111)@1
    signComp_uid112_fpSinPiTest_q <= invXIsInt_uid111_fpSinPiTest_q and invXFrac_uid110_fpSinPiTest_q and redist13_intXParity_uid40_fpSinPiTest_b_1_q;

    -- invYIsZero_uid113_fpSinPiTest(LOGICAL,112)@1
    invYIsZero_uid113_fpSinPiTest_q <= not (yIsZero_uid42_fpSinPiTest_q);

    -- yZSC_uid114_fpSinPiTest(LOGICAL,113)@1
    yZSC_uid114_fpSinPiTest_q <= invYIsZero_uid113_fpSinPiTest_q and signComp_uid112_fpSinPiTest_q;

    -- signX_uid8_fpSinPiTest(BITSELECT,7)@0
    signX_uid8_fpSinPiTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist17_signX_uid8_fpSinPiTest_b_1(DELAY,438)
    redist17_signX_uid8_fpSinPiTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid8_fpSinPiTest_b, xout => redist17_signX_uid8_fpSinPiTest_b_1_q, clk => clk, aclr => areset );

    -- signR_uid115_fpSinPiTest(LOGICAL,114)@1 + 1
    signR_uid115_fpSinPiTest_qi <= redist17_signX_uid8_fpSinPiTest_b_1_q xor yZSC_uid114_fpSinPiTest_q;
    signR_uid115_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid115_fpSinPiTest_qi, xout => signR_uid115_fpSinPiTest_q, clk => clk, aclr => areset );

    -- redist1_signR_uid115_fpSinPiTest_q_7(DELAY,422)
    redist1_signR_uid115_fpSinPiTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid115_fpSinPiTest_q, xout => redist1_signR_uid115_fpSinPiTest_q_7_q, clk => clk, aclr => areset );

    -- cstBias_uid11_fpSinPiTest(CONSTANT,10)
    cstBias_uid11_fpSinPiTest_q <= "01111111";

    -- redist14_oFracX_uid33_fpSinPiTest_q_2(DELAY,435)
    redist14_oFracX_uid33_fpSinPiTest_q_2 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracX_uid33_fpSinPiTest_q, xout => redist14_oFracX_uid33_fpSinPiTest_q_2_q, clk => clk, aclr => areset );

    -- ozz_uid43_fpSinPiTest(CONSTANT,42)
    ozz_uid43_fpSinPiTest_q <= "00000000000000000000000000000000000";

    -- cOne_uid46_fpSinPiTest(CONSTANT,45)
    cOne_uid46_fpSinPiTest_q <= "1000000000000000000000000000000000000";

    -- oneMinusY_uid47_fpSinPiTest(SUB,46)@0
    oneMinusY_uid47_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & cOne_uid46_fpSinPiTest_q);
    oneMinusY_uid47_fpSinPiTest_b <= STD_LOGIC_VECTOR("00" & y_uid41_fpSinPiTest_b);
    oneMinusY_uid47_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid47_fpSinPiTest_a) - UNSIGNED(oneMinusY_uid47_fpSinPiTest_b));
    oneMinusY_uid47_fpSinPiTest_q <= oneMinusY_uid47_fpSinPiTest_o(37 downto 0);

    -- oMyBottom_uid50_fpSinPiTest(BITSELECT,49)@0
    oMyBottom_uid50_fpSinPiTest_in <= oneMinusY_uid47_fpSinPiTest_q(34 downto 0);
    oMyBottom_uid50_fpSinPiTest_b <= oMyBottom_uid50_fpSinPiTest_in(34 downto 0);

    -- yBottom_uid51_fpSinPiTest(BITSELECT,50)@0
    yBottom_uid51_fpSinPiTest_in <= y_uid41_fpSinPiTest_b(34 downto 0);
    yBottom_uid51_fpSinPiTest_b <= yBottom_uid51_fpSinPiTest_in(34 downto 0);

    -- cmpYToOneMinusY_uid49_fpSinPiTest(COMPARE,48)@0
    cmpYToOneMinusY_uid49_fpSinPiTest_a <= STD_LOGIC_VECTOR("00" & oneMinusY_uid47_fpSinPiTest_q);
    cmpYToOneMinusY_uid49_fpSinPiTest_b <= STD_LOGIC_VECTOR("0000" & y_uid41_fpSinPiTest_b);
    cmpYToOneMinusY_uid49_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid49_fpSinPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid49_fpSinPiTest_b));
    cmpYToOneMinusY_uid49_fpSinPiTest_c(0) <= cmpYToOneMinusY_uid49_fpSinPiTest_o(39);

    -- z_uid52_fpSinPiTest(MUX,51)@0
    z_uid52_fpSinPiTest_s <= cmpYToOneMinusY_uid49_fpSinPiTest_c;
    z_uid52_fpSinPiTest_combproc: PROCESS (z_uid52_fpSinPiTest_s, yBottom_uid51_fpSinPiTest_b, oMyBottom_uid50_fpSinPiTest_b)
    BEGIN
        CASE (z_uid52_fpSinPiTest_s) IS
            WHEN "0" => z_uid52_fpSinPiTest_q <= yBottom_uid51_fpSinPiTest_b;
            WHEN "1" => z_uid52_fpSinPiTest_q <= oMyBottom_uid50_fpSinPiTest_b;
            WHEN OTHERS => z_uid52_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist12_z_uid52_fpSinPiTest_q_1(DELAY,433)
    redist12_z_uid52_fpSinPiTest_q_1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => z_uid52_fpSinPiTest_q, xout => redist12_z_uid52_fpSinPiTest_q_1_q, clk => clk, aclr => areset );

    -- vStage_uid122_lzcZ_uid54_fpSinPiTest(BITSELECT,121)@1
    vStage_uid122_lzcZ_uid54_fpSinPiTest_in <= redist12_z_uid52_fpSinPiTest_q_1_q(2 downto 0);
    vStage_uid122_lzcZ_uid54_fpSinPiTest_b <= vStage_uid122_lzcZ_uid54_fpSinPiTest_in(2 downto 0);

    -- leftShiftStage0Idx4_uid336_alignedZ_uid55_fpSinPiTest(BITJOIN,335)@1
    leftShiftStage0Idx4_uid336_alignedZ_uid55_fpSinPiTest_q <= vStage_uid122_lzcZ_uid54_fpSinPiTest_b & zs_uid118_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1(MUX,401)@1
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_s <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_s, leftShiftStage0Idx4_uid336_alignedZ_uid55_fpSinPiTest_q, ozz_uid43_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q <= leftShiftStage0Idx4_uid336_alignedZ_uid55_fpSinPiTest_q;
            WHEN "01" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q <= ozz_uid43_fpSinPiTest_q;
            WHEN "10" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q <= ozz_uid43_fpSinPiTest_q;
            WHEN "11" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q <= ozz_uid43_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest(BITSELECT,331)@1
    leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_in <= redist12_z_uid52_fpSinPiTest_q_1_q(10 downto 0);
    leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_in(10 downto 0);

    -- leftShiftStage0Idx3_uid333_alignedZ_uid55_fpSinPiTest(BITJOIN,332)@1
    leftShiftStage0Idx3_uid333_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage0Idx3Rng24_uid332_alignedZ_uid55_fpSinPiTest_b & leftShiftStage0Idx3Pad24_uid288_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest(BITSELECT,328)@1
    leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_in <= redist12_z_uid52_fpSinPiTest_q_1_q(18 downto 0);
    leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_in(18 downto 0);

    -- leftShiftStage0Idx2_uid330_alignedZ_uid55_fpSinPiTest(BITJOIN,329)@1
    leftShiftStage0Idx2_uid330_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage0Idx2Rng16_uid329_alignedZ_uid55_fpSinPiTest_b & zs_uid126_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest(BITSELECT,325)@1
    leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_in <= redist12_z_uid52_fpSinPiTest_q_1_q(26 downto 0);
    leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_in(26 downto 0);

    -- leftShiftStage0Idx1_uid327_alignedZ_uid55_fpSinPiTest(BITJOIN,326)@1
    leftShiftStage0Idx1_uid327_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage0Idx1Rng8_uid326_alignedZ_uid55_fpSinPiTest_b & cstAllZWE_uid16_fpSinPiTest_q;

    -- leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0(MUX,400)@1
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_s <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_s, redist12_z_uid52_fpSinPiTest_q_1_q, leftShiftStage0Idx1_uid327_alignedZ_uid55_fpSinPiTest_q, leftShiftStage0Idx2_uid330_alignedZ_uid55_fpSinPiTest_q, leftShiftStage0Idx3_uid333_alignedZ_uid55_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q <= redist12_z_uid52_fpSinPiTest_q_1_q;
            WHEN "01" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx1_uid327_alignedZ_uid55_fpSinPiTest_q;
            WHEN "10" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx2_uid330_alignedZ_uid55_fpSinPiTest_q;
            WHEN "11" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage0Idx3_uid333_alignedZ_uid55_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid119_lzcZ_uid54_fpSinPiTest(BITSELECT,118)@1
    rVStage_uid119_lzcZ_uid54_fpSinPiTest_b <= redist12_z_uid52_fpSinPiTest_q_1_q(34 downto 3);

    -- vCount_uid120_lzcZ_uid54_fpSinPiTest(LOGICAL,119)@1
    vCount_uid120_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid119_lzcZ_uid54_fpSinPiTest_b = zs_uid118_lzcZ_uid54_fpSinPiTest_q ELSE "0";

    -- mO_uid121_lzcZ_uid54_fpSinPiTest(CONSTANT,120)
    mO_uid121_lzcZ_uid54_fpSinPiTest_q <= "11111111111111111111111111111";

    -- cStage_uid123_lzcZ_uid54_fpSinPiTest(BITJOIN,122)@1
    cStage_uid123_lzcZ_uid54_fpSinPiTest_q <= vStage_uid122_lzcZ_uid54_fpSinPiTest_b & mO_uid121_lzcZ_uid54_fpSinPiTest_q;

    -- vStagei_uid125_lzcZ_uid54_fpSinPiTest(MUX,124)@1
    vStagei_uid125_lzcZ_uid54_fpSinPiTest_s <= vCount_uid120_lzcZ_uid54_fpSinPiTest_q;
    vStagei_uid125_lzcZ_uid54_fpSinPiTest_combproc: PROCESS (vStagei_uid125_lzcZ_uid54_fpSinPiTest_s, rVStage_uid119_lzcZ_uid54_fpSinPiTest_b, cStage_uid123_lzcZ_uid54_fpSinPiTest_q)
    BEGIN
        CASE (vStagei_uid125_lzcZ_uid54_fpSinPiTest_s) IS
            WHEN "0" => vStagei_uid125_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid119_lzcZ_uid54_fpSinPiTest_b;
            WHEN "1" => vStagei_uid125_lzcZ_uid54_fpSinPiTest_q <= cStage_uid123_lzcZ_uid54_fpSinPiTest_q;
            WHEN OTHERS => vStagei_uid125_lzcZ_uid54_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select(BITSELECT,412)@1
    rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_b <= vStagei_uid125_lzcZ_uid54_fpSinPiTest_q(31 downto 16);
    rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_c <= vStagei_uid125_lzcZ_uid54_fpSinPiTest_q(15 downto 0);

    -- vCount_uid128_lzcZ_uid54_fpSinPiTest(LOGICAL,127)@1
    vCount_uid128_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_b = zs_uid126_lzcZ_uid54_fpSinPiTest_q ELSE "0";

    -- vStagei_uid131_lzcZ_uid54_fpSinPiTest(MUX,130)@1
    vStagei_uid131_lzcZ_uid54_fpSinPiTest_s <= vCount_uid128_lzcZ_uid54_fpSinPiTest_q;
    vStagei_uid131_lzcZ_uid54_fpSinPiTest_combproc: PROCESS (vStagei_uid131_lzcZ_uid54_fpSinPiTest_s, rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_b, rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid131_lzcZ_uid54_fpSinPiTest_s) IS
            WHEN "0" => vStagei_uid131_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid131_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid127_lzcZ_uid54_fpSinPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid131_lzcZ_uid54_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select(BITSELECT,413)@1
    rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_b <= vStagei_uid131_lzcZ_uid54_fpSinPiTest_q(15 downto 8);
    rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_c <= vStagei_uid131_lzcZ_uid54_fpSinPiTest_q(7 downto 0);

    -- vCount_uid134_lzcZ_uid54_fpSinPiTest(LOGICAL,133)@1
    vCount_uid134_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_b = cstAllZWE_uid16_fpSinPiTest_q ELSE "0";

    -- vStagei_uid137_lzcZ_uid54_fpSinPiTest(MUX,136)@1
    vStagei_uid137_lzcZ_uid54_fpSinPiTest_s <= vCount_uid134_lzcZ_uid54_fpSinPiTest_q;
    vStagei_uid137_lzcZ_uid54_fpSinPiTest_combproc: PROCESS (vStagei_uid137_lzcZ_uid54_fpSinPiTest_s, rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_b, rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid137_lzcZ_uid54_fpSinPiTest_s) IS
            WHEN "0" => vStagei_uid137_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid137_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid133_lzcZ_uid54_fpSinPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid137_lzcZ_uid54_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select(BITSELECT,414)@1
    rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_b <= vStagei_uid137_lzcZ_uid54_fpSinPiTest_q(7 downto 4);
    rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_c <= vStagei_uid137_lzcZ_uid54_fpSinPiTest_q(3 downto 0);

    -- vCount_uid140_lzcZ_uid54_fpSinPiTest(LOGICAL,139)@1
    vCount_uid140_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_b = zs_uid138_lzcZ_uid54_fpSinPiTest_q ELSE "0";

    -- vStagei_uid143_lzcZ_uid54_fpSinPiTest(MUX,142)@1
    vStagei_uid143_lzcZ_uid54_fpSinPiTest_s <= vCount_uid140_lzcZ_uid54_fpSinPiTest_q;
    vStagei_uid143_lzcZ_uid54_fpSinPiTest_combproc: PROCESS (vStagei_uid143_lzcZ_uid54_fpSinPiTest_s, rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_b, rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid143_lzcZ_uid54_fpSinPiTest_s) IS
            WHEN "0" => vStagei_uid143_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid143_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid139_lzcZ_uid54_fpSinPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid143_lzcZ_uid54_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select(BITSELECT,415)@1
    rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_b <= vStagei_uid143_lzcZ_uid54_fpSinPiTest_q(3 downto 2);
    rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_c <= vStagei_uid143_lzcZ_uid54_fpSinPiTest_q(1 downto 0);

    -- vCount_uid146_lzcZ_uid54_fpSinPiTest(LOGICAL,145)@1
    vCount_uid146_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_b = zs_uid144_lzcZ_uid54_fpSinPiTest_q ELSE "0";

    -- vStagei_uid149_lzcZ_uid54_fpSinPiTest(MUX,148)@1
    vStagei_uid149_lzcZ_uid54_fpSinPiTest_s <= vCount_uid146_lzcZ_uid54_fpSinPiTest_q;
    vStagei_uid149_lzcZ_uid54_fpSinPiTest_combproc: PROCESS (vStagei_uid149_lzcZ_uid54_fpSinPiTest_s, rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_b, rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid149_lzcZ_uid54_fpSinPiTest_s) IS
            WHEN "0" => vStagei_uid149_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid149_lzcZ_uid54_fpSinPiTest_q <= rVStage_uid145_lzcZ_uid54_fpSinPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid149_lzcZ_uid54_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid151_lzcZ_uid54_fpSinPiTest(BITSELECT,150)@1
    rVStage_uid151_lzcZ_uid54_fpSinPiTest_b <= vStagei_uid149_lzcZ_uid54_fpSinPiTest_q(1 downto 1);

    -- vCount_uid152_lzcZ_uid54_fpSinPiTest(LOGICAL,151)@1
    vCount_uid152_lzcZ_uid54_fpSinPiTest_q <= "1" WHEN rVStage_uid151_lzcZ_uid54_fpSinPiTest_b = GND_q ELSE "0";

    -- r_uid153_lzcZ_uid54_fpSinPiTest(BITJOIN,152)@1
    r_uid153_lzcZ_uid54_fpSinPiTest_q <= vCount_uid120_lzcZ_uid54_fpSinPiTest_q & vCount_uid128_lzcZ_uid54_fpSinPiTest_q & vCount_uid134_lzcZ_uid54_fpSinPiTest_q & vCount_uid140_lzcZ_uid54_fpSinPiTest_q & vCount_uid146_lzcZ_uid54_fpSinPiTest_q & vCount_uid152_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select(BITSELECT,416)@1
    leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_b <= r_uid153_lzcZ_uid54_fpSinPiTest_q(5 downto 3);
    leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_c <= r_uid153_lzcZ_uid54_fpSinPiTest_q(2 downto 0);

    -- leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select(BITSELECT,419)@1
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal(MUX,402)@1
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_s <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_combproc: PROCESS (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_s, leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q, leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest(BITSELECT,360)@1
    leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(27 downto 0);
    leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_in(27 downto 0);

    -- leftShiftStage1Idx7_uid362_alignedZ_uid55_fpSinPiTest(BITJOIN,361)@1
    leftShiftStage1Idx7_uid362_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx7Rng7_uid361_alignedZ_uid55_fpSinPiTest_b & leftShiftStage1Idx7Pad7_uid317_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest(BITSELECT,357)@1
    leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(28 downto 0);
    leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_in(28 downto 0);

    -- leftShiftStage1Idx6_uid359_alignedZ_uid55_fpSinPiTest(BITJOIN,358)@1
    leftShiftStage1Idx6_uid359_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx6Rng6_uid358_alignedZ_uid55_fpSinPiTest_b & leftShiftStage1Idx6Pad6_uid314_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest(BITSELECT,354)@1
    leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(29 downto 0);
    leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_in(29 downto 0);

    -- leftShiftStage1Idx5_uid356_alignedZ_uid55_fpSinPiTest(BITJOIN,355)@1
    leftShiftStage1Idx5_uid356_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx5Rng5_uid355_alignedZ_uid55_fpSinPiTest_b & leftShiftStage1Idx5Pad5_uid311_fixedPointX_uid39_fpSinPiTest_q;

    -- leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest(BITSELECT,351)@1
    leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(30 downto 0);
    leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_in(30 downto 0);

    -- leftShiftStage1Idx4_uid353_alignedZ_uid55_fpSinPiTest(BITJOIN,352)@1
    leftShiftStage1Idx4_uid353_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx4Rng4_uid352_alignedZ_uid55_fpSinPiTest_b & zs_uid138_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1(MUX,406)@1
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_s <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_combproc: PROCESS (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_s, leftShiftStage1Idx4_uid353_alignedZ_uid55_fpSinPiTest_q, leftShiftStage1Idx5_uid356_alignedZ_uid55_fpSinPiTest_q, leftShiftStage1Idx6_uid359_alignedZ_uid55_fpSinPiTest_q, leftShiftStage1Idx7_uid362_alignedZ_uid55_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx4_uid353_alignedZ_uid55_fpSinPiTest_q;
            WHEN "01" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx5_uid356_alignedZ_uid55_fpSinPiTest_q;
            WHEN "10" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx6_uid359_alignedZ_uid55_fpSinPiTest_q;
            WHEN "11" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q <= leftShiftStage1Idx7_uid362_alignedZ_uid55_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest(BITSELECT,348)@1
    leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(31 downto 0);
    leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_in(31 downto 0);

    -- leftShiftStage1Idx3_uid350_alignedZ_uid55_fpSinPiTest(BITJOIN,349)@1
    leftShiftStage1Idx3_uid350_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx3Rng3_uid349_alignedZ_uid55_fpSinPiTest_b & topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval_q;

    -- leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest(BITSELECT,345)@1
    leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(32 downto 0);
    leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_in(32 downto 0);

    -- leftShiftStage1Idx2_uid347_alignedZ_uid55_fpSinPiTest(BITJOIN,346)@1
    leftShiftStage1Idx2_uid347_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx2Rng2_uid346_alignedZ_uid55_fpSinPiTest_b & zs_uid144_lzcZ_uid54_fpSinPiTest_q;

    -- leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest(BITSELECT,342)@1
    leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_in <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q(33 downto 0);
    leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_b <= leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_in(33 downto 0);

    -- leftShiftStage1Idx1_uid344_alignedZ_uid55_fpSinPiTest(BITJOIN,343)@1
    leftShiftStage1Idx1_uid344_alignedZ_uid55_fpSinPiTest_q <= leftShiftStage1Idx1Rng1_uid343_alignedZ_uid55_fpSinPiTest_b & GND_q;

    -- leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0(MUX,405)@1
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_s <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_combproc: PROCESS (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_s, leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q, leftShiftStage1Idx1_uid344_alignedZ_uid55_fpSinPiTest_q, leftShiftStage1Idx2_uid347_alignedZ_uid55_fpSinPiTest_q, leftShiftStage1Idx3_uid350_alignedZ_uid55_fpSinPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage0_uid341_alignedZ_uid55_fpSinPiTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx1_uid344_alignedZ_uid55_fpSinPiTest_q;
            WHEN "10" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx2_uid347_alignedZ_uid55_fpSinPiTest_q;
            WHEN "11" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q <= leftShiftStage1Idx3_uid350_alignedZ_uid55_fpSinPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select(BITSELECT,420)@1
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_c(1 downto 0);
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid340_alignedZ_uid55_fpSinPiTest_merged_bit_select_c(2 downto 2);

    -- leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal(MUX,407)@1
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_s <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_combproc: PROCESS (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_s, leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q, leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_q <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_q <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignedZLow_uid56_fpSinPiTest(BITSELECT,55)@1
    alignedZLow_uid56_fpSinPiTest_b <= leftShiftStage1_uid364_alignedZ_uid55_fpSinPiTest_mfinal_q(34 downto 12);

    -- redist11_alignedZLow_uid56_fpSinPiTest_b_1(DELAY,432)
    redist11_alignedZLow_uid56_fpSinPiTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignedZLow_uid56_fpSinPiTest_b, xout => redist11_alignedZLow_uid56_fpSinPiTest_b_1_q, clk => clk, aclr => areset );

    -- pHardCase_uid57_fpSinPiTest(BITJOIN,56)@2
    pHardCase_uid57_fpSinPiTest_q <= redist11_alignedZLow_uid56_fpSinPiTest_b_1_q & GND_q;

    -- redist15_sinXIsX_uid32_fpSinPiTest_c_1(DELAY,436)
    redist15_sinXIsX_uid32_fpSinPiTest_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinXIsX_uid32_fpSinPiTest_c, xout => redist15_sinXIsX_uid32_fpSinPiTest_c_1_q, clk => clk, aclr => areset );

    -- p_uid58_fpSinPiTest(MUX,57)@2 + 1
    p_uid58_fpSinPiTest_s <= redist15_sinXIsX_uid32_fpSinPiTest_c_1_q;
    p_uid58_fpSinPiTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid58_fpSinPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (p_uid58_fpSinPiTest_s) IS
                WHEN "0" => p_uid58_fpSinPiTest_q <= pHardCase_uid57_fpSinPiTest_q;
                WHEN "1" => p_uid58_fpSinPiTest_q <= redist14_oFracX_uid33_fpSinPiTest_q_2_q;
                WHEN OTHERS => p_uid58_fpSinPiTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist10_p_uid58_fpSinPiTest_q_4(DELAY,431)
    redist10_p_uid58_fpSinPiTest_q_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => p_uid58_fpSinPiTest_q, xout => redist10_p_uid58_fpSinPiTest_q_4_q, clk => clk, aclr => areset );

    -- mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select(BITSELECT,409)@6
    mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_b <= redist10_p_uid58_fpSinPiTest_q_4_q(17 downto 0);
    mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_c <= redist10_p_uid58_fpSinPiTest_q_4_q(23 downto 18);

    -- piwFP2_uid71_fpSinPiTest(CONSTANT,70)
    piwFP2_uid71_fpSinPiTest_q <= "1100100100001111110110101";

    -- yAddr_uid67_fpSinPiTest(BITSELECT,66)@0
    yAddr_uid67_fpSinPiTest_b <= z_uid52_fpSinPiTest_q(34 downto 28);

    -- memoryC2_uid161_sinPiXTables_lutmem(DUALMEM,387)@0 + 2
    -- in j@20000000
    memoryC2_uid161_sinPiXTables_lutmem_aa <= yAddr_uid67_fpSinPiTest_b;
    memoryC2_uid161_sinPiXTables_lutmem_reset0 <= areset;
    memoryC2_uid161_sinPiXTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 7,
        numwords_a => 128,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sin_0002_memoryC2_uid161_sinPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid161_sinPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid161_sinPiXTables_lutmem_aa,
        q_a => memoryC2_uid161_sinPiXTables_lutmem_ir
    );
    memoryC2_uid161_sinPiXTables_lutmem_r <= memoryC2_uid161_sinPiXTables_lutmem_ir(13 downto 0);

    -- topRangeY_mergedSignalTM_uid200_pT1_uid168_invPolyEval(BITJOIN,199)@2
    topRangeY_mergedSignalTM_uid200_pT1_uid168_invPolyEval_q <= memoryC2_uid161_sinPiXTables_lutmem_r & topRangeY_bottomExtension_uid198_pT1_uid168_invPolyEval_q;

    -- zPPolyEval_uid68_fpSinPiTest(BITSELECT,67)@1
    zPPolyEval_uid68_fpSinPiTest_in <= redist12_z_uid52_fpSinPiTest_q_1_q(27 downto 0);
    zPPolyEval_uid68_fpSinPiTest_b <= zPPolyEval_uid68_fpSinPiTest_in(27 downto 12);

    -- redist6_zPPolyEval_uid68_fpSinPiTest_b_1(DELAY,427)
    redist6_zPPolyEval_uid68_fpSinPiTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => zPPolyEval_uid68_fpSinPiTest_b, xout => redist6_zPPolyEval_uid68_fpSinPiTest_b_1_q, clk => clk, aclr => areset );

    -- yT1_uid167_invPolyEval(BITSELECT,166)@2
    yT1_uid167_invPolyEval_b <= redist6_zPPolyEval_uid68_fpSinPiTest_b_1_q(15 downto 2);

    -- nx_mergedSignalTM_uid184_pT1_uid168_invPolyEval(BITJOIN,183)@2
    nx_mergedSignalTM_uid184_pT1_uid168_invPolyEval_q <= GND_q & yT1_uid167_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid196_pT1_uid168_invPolyEval(BITJOIN,195)@2
    topRangeX_mergedSignalTM_uid196_pT1_uid168_invPolyEval_q <= nx_mergedSignalTM_uid184_pT1_uid168_invPolyEval_q & zs_uid144_lzcZ_uid54_fpSinPiTest_q;

    -- sm0_uid202_pT1_uid168_invPolyEval(MULT,201)@2 + 2
    sm0_uid202_pT1_uid168_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid196_pT1_uid168_invPolyEval_q);
    sm0_uid202_pT1_uid168_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid200_pT1_uid168_invPolyEval_q);
    sm0_uid202_pT1_uid168_invPolyEval_reset <= areset;
    sm0_uid202_pT1_uid168_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid202_pT1_uid168_invPolyEval_a0,
        datab => sm0_uid202_pT1_uid168_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid202_pT1_uid168_invPolyEval_reset,
        clock => clk,
        result => sm0_uid202_pT1_uid168_invPolyEval_s1
    );
    sm0_uid202_pT1_uid168_invPolyEval_q <= sm0_uid202_pT1_uid168_invPolyEval_s1;

    -- osig_uid203_pT1_uid168_invPolyEval(BITSELECT,202)@4
    osig_uid203_pT1_uid168_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid202_pT1_uid168_invPolyEval_q(32 downto 0));
    osig_uid203_pT1_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid203_pT1_uid168_invPolyEval_in(32 downto 17));

    -- redist8_yAddr_uid67_fpSinPiTest_b_2(DELAY,429)
    redist8_yAddr_uid67_fpSinPiTest_b_2 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid67_fpSinPiTest_b, xout => redist8_yAddr_uid67_fpSinPiTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid158_sinPiXTables_lutmem(DUALMEM,386)@2 + 2
    -- in j@20000000
    memoryC1_uid158_sinPiXTables_lutmem_aa <= redist8_yAddr_uid67_fpSinPiTest_b_2_q;
    memoryC1_uid158_sinPiXTables_lutmem_reset0 <= areset;
    memoryC1_uid158_sinPiXTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 7,
        numwords_a => 128,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sin_0002_memoryC1_uid158_sinPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid158_sinPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid158_sinPiXTables_lutmem_aa,
        q_a => memoryC1_uid158_sinPiXTables_lutmem_ir
    );
    memoryC1_uid158_sinPiXTables_lutmem_r <= memoryC1_uid158_sinPiXTables_lutmem_ir(20 downto 0);

    -- rndBit_uid169_invPolyEval(CONSTANT,168)
    rndBit_uid169_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid170_invPolyEval(BITJOIN,169)@4
    cIncludingRoundingBit_uid170_invPolyEval_q <= memoryC1_uid158_sinPiXTables_lutmem_r & rndBit_uid169_invPolyEval_q;

    -- ts1_uid172_invPolyEval(ADD,171)@4
    ts1_uid172_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid170_invPolyEval_q(22)) & cIncludingRoundingBit_uid170_invPolyEval_q));
    ts1_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 16 => osig_uid203_pT1_uid168_invPolyEval_b(15)) & osig_uid203_pT1_uid168_invPolyEval_b));
    ts1_uid172_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid172_invPolyEval_a) + SIGNED(ts1_uid172_invPolyEval_b));
    ts1_uid172_invPolyEval_q <= ts1_uid172_invPolyEval_o(23 downto 0);

    -- s1_uid173_invPolyEval(BITSELECT,172)@4
    s1_uid173_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid172_invPolyEval_q(23 downto 1));

    -- rightBottomY_uid236_pT2_uid175_invPolyEval(BITSELECT,235)@4
    rightBottomY_uid236_pT2_uid175_invPolyEval_in <= s1_uid173_invPolyEval_b(5 downto 0);
    rightBottomY_uid236_pT2_uid175_invPolyEval_b <= rightBottomY_uid236_pT2_uid175_invPolyEval_in(5 downto 1);

    -- n1_uid245_pT2_uid175_invPolyEval(BITSELECT,244)@4
    n1_uid245_pT2_uid175_invPolyEval_b <= rightBottomY_uid236_pT2_uid175_invPolyEval_b(4 downto 1);

    -- n1_uid253_pT2_uid175_invPolyEval(BITSELECT,252)@4
    n1_uid253_pT2_uid175_invPolyEval_b <= n1_uid245_pT2_uid175_invPolyEval_b(3 downto 1);

    -- redist7_zPPolyEval_uid68_fpSinPiTest_b_3(DELAY,428)
    redist7_zPPolyEval_uid68_fpSinPiTest_b_3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_zPPolyEval_uid68_fpSinPiTest_b_1_q, xout => redist7_zPPolyEval_uid68_fpSinPiTest_b_3_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval(BITJOIN,206)@4
    nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval_q <= GND_q & redist7_zPPolyEval_uid68_fpSinPiTest_b_3_q;

    -- rightBottomX_uid235_pT2_uid175_invPolyEval(BITSELECT,234)@4
    rightBottomX_uid235_pT2_uid175_invPolyEval_in <= nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval_q(8 downto 0);
    rightBottomX_uid235_pT2_uid175_invPolyEval_b <= rightBottomX_uid235_pT2_uid175_invPolyEval_in(8 downto 4);

    -- n0_uid246_pT2_uid175_invPolyEval(BITSELECT,245)@4
    n0_uid246_pT2_uid175_invPolyEval_b <= rightBottomX_uid235_pT2_uid175_invPolyEval_b(4 downto 1);

    -- n0_uid254_pT2_uid175_invPolyEval(BITSELECT,253)@4
    n0_uid254_pT2_uid175_invPolyEval_b <= n0_uid246_pT2_uid175_invPolyEval_b(3 downto 1);

    -- sm0_uid269_pT2_uid175_invPolyEval(MULT,268)@4 + 2
    sm0_uid269_pT2_uid175_invPolyEval_a0 <= n0_uid254_pT2_uid175_invPolyEval_b;
    sm0_uid269_pT2_uid175_invPolyEval_b0 <= n1_uid253_pT2_uid175_invPolyEval_b;
    sm0_uid269_pT2_uid175_invPolyEval_reset <= areset;
    sm0_uid269_pT2_uid175_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid269_pT2_uid175_invPolyEval_a0,
        datab => sm0_uid269_pT2_uid175_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid269_pT2_uid175_invPolyEval_reset,
        clock => clk,
        result => sm0_uid269_pT2_uid175_invPolyEval_s1
    );
    sm0_uid269_pT2_uid175_invPolyEval_q <= sm0_uid269_pT2_uid175_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval(BITSELECT,225)@4
    aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_in <= STD_LOGIC_VECTOR(s1_uid173_invPolyEval_b(5 downto 0));
    aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid227_pT2_uid175_invPolyEval(BITJOIN,226)@4
    aboveLeftY_mergedSignalTM_uid227_pT2_uid175_invPolyEval_q <= aboveLeftY_bottomRange_uid226_pT2_uid175_invPolyEval_b & zs_uid144_lzcZ_uid54_fpSinPiTest_q;

    -- aboveLeftX_uid224_pT2_uid175_invPolyEval(BITSELECT,223)@4
    aboveLeftX_uid224_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval_q(16 downto 9));

    -- sm0_uid268_pT2_uid175_invPolyEval(MULT,267)@4 + 2
    sm0_uid268_pT2_uid175_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid224_pT2_uid175_invPolyEval_b);
    sm0_uid268_pT2_uid175_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid227_pT2_uid175_invPolyEval_q;
    sm0_uid268_pT2_uid175_invPolyEval_reset <= areset;
    sm0_uid268_pT2_uid175_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid268_pT2_uid175_invPolyEval_a0,
        datab => sm0_uid268_pT2_uid175_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid268_pT2_uid175_invPolyEval_reset,
        clock => clk,
        result => sm0_uid268_pT2_uid175_invPolyEval_s1
    );
    sm0_uid268_pT2_uid175_invPolyEval_q <= sm0_uid268_pT2_uid175_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid218_pT2_uid175_invPolyEval(BITSELECT,217)@4
    topRangeY_uid218_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid173_invPolyEval_b(22 downto 6));

    -- sm0_uid267_pT2_uid175_invPolyEval(MULT,266)@4 + 2
    sm0_uid267_pT2_uid175_invPolyEval_a0 <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid207_pT2_uid175_invPolyEval_q);
    sm0_uid267_pT2_uid175_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid218_pT2_uid175_invPolyEval_b);
    sm0_uid267_pT2_uid175_invPolyEval_reset <= areset;
    sm0_uid267_pT2_uid175_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid267_pT2_uid175_invPolyEval_a0,
        datab => sm0_uid267_pT2_uid175_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid267_pT2_uid175_invPolyEval_reset,
        clock => clk,
        result => sm0_uid267_pT2_uid175_invPolyEval_s1
    );
    sm0_uid267_pT2_uid175_invPolyEval_q <= sm0_uid267_pT2_uid175_invPolyEval_s1;

    -- highABits_uid271_pT2_uid175_invPolyEval(BITSELECT,270)@6
    highABits_uid271_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid267_pT2_uid175_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid272_pT2_uid175_invPolyEval(ADD,271)@6
    lev1_a0high_uid272_pT2_uid175_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid271_pT2_uid175_invPolyEval_b(32)) & highABits_uid271_pT2_uid175_invPolyEval_b));
    lev1_a0high_uid272_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid268_pT2_uid175_invPolyEval_q(15)) & sm0_uid268_pT2_uid175_invPolyEval_q));
    lev1_a0high_uid272_pT2_uid175_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid272_pT2_uid175_invPolyEval_a) + SIGNED(lev1_a0high_uid272_pT2_uid175_invPolyEval_b));
    lev1_a0high_uid272_pT2_uid175_invPolyEval_q <= lev1_a0high_uid272_pT2_uid175_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid270_pT2_uid175_invPolyEval(BITSELECT,269)@6
    lowRangeA_uid270_pT2_uid175_invPolyEval_in <= sm0_uid267_pT2_uid175_invPolyEval_q(0 downto 0);
    lowRangeA_uid270_pT2_uid175_invPolyEval_b <= lowRangeA_uid270_pT2_uid175_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid273_pT2_uid175_invPolyEval(BITJOIN,272)@6
    lev1_a0_uid273_pT2_uid175_invPolyEval_q <= lev1_a0high_uid272_pT2_uid175_invPolyEval_q & lowRangeA_uid270_pT2_uid175_invPolyEval_b;

    -- highABits_uid275_pT2_uid175_invPolyEval(BITSELECT,274)@6
    highABits_uid275_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid273_pT2_uid175_invPolyEval_q(34 downto 3));

    -- lev2_a0high_uid276_pT2_uid175_invPolyEval(ADD,275)@6
    lev2_a0high_uid276_pT2_uid175_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => highABits_uid275_pT2_uid175_invPolyEval_b(31)) & highABits_uid275_pT2_uid175_invPolyEval_b));
    lev2_a0high_uid276_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid269_pT2_uid175_invPolyEval_q));
    lev2_a0high_uid276_pT2_uid175_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid276_pT2_uid175_invPolyEval_a) + SIGNED(lev2_a0high_uid276_pT2_uid175_invPolyEval_b));
    lev2_a0high_uid276_pT2_uid175_invPolyEval_q <= lev2_a0high_uid276_pT2_uid175_invPolyEval_o(32 downto 0);

    -- lowRangeA_uid274_pT2_uid175_invPolyEval(BITSELECT,273)@6
    lowRangeA_uid274_pT2_uid175_invPolyEval_in <= lev1_a0_uid273_pT2_uid175_invPolyEval_q(2 downto 0);
    lowRangeA_uid274_pT2_uid175_invPolyEval_b <= lowRangeA_uid274_pT2_uid175_invPolyEval_in(2 downto 0);

    -- lev2_a0_uid277_pT2_uid175_invPolyEval(BITJOIN,276)@6
    lev2_a0_uid277_pT2_uid175_invPolyEval_q <= lev2_a0high_uid276_pT2_uid175_invPolyEval_q & lowRangeA_uid274_pT2_uid175_invPolyEval_b;

    -- osig_uid278_pT2_uid175_invPolyEval(BITSELECT,277)@6
    osig_uid278_pT2_uid175_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid277_pT2_uid175_invPolyEval_q(32 downto 0));
    osig_uid278_pT2_uid175_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid278_pT2_uid175_invPolyEval_in(32 downto 8));

    -- redist9_yAddr_uid67_fpSinPiTest_b_4(DELAY,430)
    redist9_yAddr_uid67_fpSinPiTest_b_4 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_yAddr_uid67_fpSinPiTest_b_2_q, xout => redist9_yAddr_uid67_fpSinPiTest_b_4_q, clk => clk, aclr => areset );

    -- memoryC0_uid155_sinPiXTables_lutmem(DUALMEM,385)@4 + 2
    -- in j@20000000
    memoryC0_uid155_sinPiXTables_lutmem_aa <= redist9_yAddr_uid67_fpSinPiTest_b_4_q;
    memoryC0_uid155_sinPiXTables_lutmem_reset0 <= areset;
    memoryC0_uid155_sinPiXTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 7,
        numwords_a => 128,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_sin_0002_memoryC0_uid155_sinPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid155_sinPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid155_sinPiXTables_lutmem_aa,
        q_a => memoryC0_uid155_sinPiXTables_lutmem_ir
    );
    memoryC0_uid155_sinPiXTables_lutmem_r <= memoryC0_uid155_sinPiXTables_lutmem_ir(28 downto 0);

    -- rndBit_uid176_invPolyEval(CONSTANT,175)
    rndBit_uid176_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid177_invPolyEval(BITJOIN,176)@6
    cIncludingRoundingBit_uid177_invPolyEval_q <= memoryC0_uid155_sinPiXTables_lutmem_r & rndBit_uid176_invPolyEval_q;

    -- ts2_uid179_invPolyEval(ADD,178)@6
    ts2_uid179_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid177_invPolyEval_q(31)) & cIncludingRoundingBit_uid177_invPolyEval_q));
    ts2_uid179_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 25 => osig_uid278_pT2_uid175_invPolyEval_b(24)) & osig_uid278_pT2_uid175_invPolyEval_b));
    ts2_uid179_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid179_invPolyEval_a) + SIGNED(ts2_uid179_invPolyEval_b));
    ts2_uid179_invPolyEval_q <= ts2_uid179_invPolyEval_o(32 downto 0);

    -- s2_uid180_invPolyEval(BITSELECT,179)@6
    s2_uid180_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid179_invPolyEval_q(32 downto 1));

    -- fxpSinRes_uid70_fpSinPiTest(BITSELECT,69)@6
    fxpSinRes_uid70_fpSinPiTest_in <= s2_uid180_invPolyEval_b(29 downto 0);
    fxpSinRes_uid70_fpSinPiTest_b <= fxpSinRes_uid70_fpSinPiTest_in(29 downto 5);

    -- redist16_sinXIsX_uid32_fpSinPiTest_c_5(DELAY,437)
    redist16_sinXIsX_uid32_fpSinPiTest_c_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_sinXIsX_uid32_fpSinPiTest_c_1_q, xout => redist16_sinXIsX_uid32_fpSinPiTest_c_5_q, clk => clk, aclr => areset );

    -- multRightOp_uid73_fpSinPiTest(MUX,72)@6
    multRightOp_uid73_fpSinPiTest_s <= redist16_sinXIsX_uid32_fpSinPiTest_c_5_q;
    multRightOp_uid73_fpSinPiTest_combproc: PROCESS (multRightOp_uid73_fpSinPiTest_s, fxpSinRes_uid70_fpSinPiTest_b, piwFP2_uid71_fpSinPiTest_q)
    BEGIN
        CASE (multRightOp_uid73_fpSinPiTest_s) IS
            WHEN "0" => multRightOp_uid73_fpSinPiTest_q <= fxpSinRes_uid70_fpSinPiTest_b;
            WHEN "1" => multRightOp_uid73_fpSinPiTest_q <= piwFP2_uid71_fpSinPiTest_q;
            WHEN OTHERS => multRightOp_uid73_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select(BITSELECT,410)@6
    mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_b <= multRightOp_uid73_fpSinPiTest_q(17 downto 0);
    mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_c <= multRightOp_uid73_fpSinPiTest_q(24 downto 18);

    -- mul2xSinRes_uid74_fpSinPiTest_im6(MULT,372)@6 + 2
    mul2xSinRes_uid74_fpSinPiTest_im6_a0 <= mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_b;
    mul2xSinRes_uid74_fpSinPiTest_im6_b0 <= mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_c;
    mul2xSinRes_uid74_fpSinPiTest_im6_reset <= areset;
    mul2xSinRes_uid74_fpSinPiTest_im6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 6,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mul2xSinRes_uid74_fpSinPiTest_im6_a0,
        datab => mul2xSinRes_uid74_fpSinPiTest_im6_b0,
        clken => VCC_q(0),
        aclr => mul2xSinRes_uid74_fpSinPiTest_im6_reset,
        clock => clk,
        result => mul2xSinRes_uid74_fpSinPiTest_im6_s1
    );
    mul2xSinRes_uid74_fpSinPiTest_im6_q <= mul2xSinRes_uid74_fpSinPiTest_im6_s1;

    -- mul2xSinRes_uid74_fpSinPiTest_align_15(BITSHIFT,381)@8
    mul2xSinRes_uid74_fpSinPiTest_align_15_qint <= mul2xSinRes_uid74_fpSinPiTest_im6_q & "000000000000000000";
    mul2xSinRes_uid74_fpSinPiTest_align_15_q <= mul2xSinRes_uid74_fpSinPiTest_align_15_qint(41 downto 0);

    -- mul2xSinRes_uid74_fpSinPiTest_im3(MULT,369)@6 + 2
    mul2xSinRes_uid74_fpSinPiTest_im3_a0 <= mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_b;
    mul2xSinRes_uid74_fpSinPiTest_im3_b0 <= mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_c;
    mul2xSinRes_uid74_fpSinPiTest_im3_reset <= areset;
    mul2xSinRes_uid74_fpSinPiTest_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 7,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mul2xSinRes_uid74_fpSinPiTest_im3_a0,
        datab => mul2xSinRes_uid74_fpSinPiTest_im3_b0,
        clken => VCC_q(0),
        aclr => mul2xSinRes_uid74_fpSinPiTest_im3_reset,
        clock => clk,
        result => mul2xSinRes_uid74_fpSinPiTest_im3_s1
    );
    mul2xSinRes_uid74_fpSinPiTest_im3_q <= mul2xSinRes_uid74_fpSinPiTest_im3_s1;

    -- mul2xSinRes_uid74_fpSinPiTest_align_13(BITSHIFT,379)@8
    mul2xSinRes_uid74_fpSinPiTest_align_13_qint <= mul2xSinRes_uid74_fpSinPiTest_im3_q & "000000000000000000";
    mul2xSinRes_uid74_fpSinPiTest_align_13_q <= mul2xSinRes_uid74_fpSinPiTest_align_13_qint(42 downto 0);

    -- mul2xSinRes_uid74_fpSinPiTest_im9(MULT,375)@6 + 2
    mul2xSinRes_uid74_fpSinPiTest_im9_a0 <= mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_c;
    mul2xSinRes_uid74_fpSinPiTest_im9_b0 <= mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_c;
    mul2xSinRes_uid74_fpSinPiTest_im9_reset <= areset;
    mul2xSinRes_uid74_fpSinPiTest_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 7,
        lpm_widthb => 6,
        lpm_widthp => 13,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mul2xSinRes_uid74_fpSinPiTest_im9_a0,
        datab => mul2xSinRes_uid74_fpSinPiTest_im9_b0,
        clken => VCC_q(0),
        aclr => mul2xSinRes_uid74_fpSinPiTest_im9_reset,
        clock => clk,
        result => mul2xSinRes_uid74_fpSinPiTest_im9_s1
    );
    mul2xSinRes_uid74_fpSinPiTest_im9_q <= mul2xSinRes_uid74_fpSinPiTest_im9_s1;

    -- mul2xSinRes_uid74_fpSinPiTest_im0(MULT,366)@6 + 2
    mul2xSinRes_uid74_fpSinPiTest_im0_a0 <= mul2xSinRes_uid74_fpSinPiTest_bs1_merged_bit_select_b;
    mul2xSinRes_uid74_fpSinPiTest_im0_b0 <= mul2xSinRes_uid74_fpSinPiTest_bs2_merged_bit_select_b;
    mul2xSinRes_uid74_fpSinPiTest_im0_reset <= areset;
    mul2xSinRes_uid74_fpSinPiTest_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mul2xSinRes_uid74_fpSinPiTest_im0_a0,
        datab => mul2xSinRes_uid74_fpSinPiTest_im0_b0,
        clken => VCC_q(0),
        aclr => mul2xSinRes_uid74_fpSinPiTest_im0_reset,
        clock => clk,
        result => mul2xSinRes_uid74_fpSinPiTest_im0_s1
    );
    mul2xSinRes_uid74_fpSinPiTest_im0_q <= mul2xSinRes_uid74_fpSinPiTest_im0_s1;

    -- mul2xSinRes_uid74_fpSinPiTest_join_12(BITJOIN,378)@8
    mul2xSinRes_uid74_fpSinPiTest_join_12_q <= mul2xSinRes_uid74_fpSinPiTest_im9_q & mul2xSinRes_uid74_fpSinPiTest_im0_q;

    -- mul2xSinRes_uid74_fpSinPiTest_result_add_0_0(ADD,383)@8
    mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & mul2xSinRes_uid74_fpSinPiTest_join_12_q);
    mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & mul2xSinRes_uid74_fpSinPiTest_align_13_q);
    mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_a) + UNSIGNED(mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_b));
    mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_q <= mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_o(49 downto 0);

    -- mul2xSinRes_uid74_fpSinPiTest_result_add_1_0(ADD,384)@8
    mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & mul2xSinRes_uid74_fpSinPiTest_result_add_0_0_q);
    mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_b <= STD_LOGIC_VECTOR("000000000" & mul2xSinRes_uid74_fpSinPiTest_align_15_q);
    mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_a) + UNSIGNED(mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_b));
    mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_q <= mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_o(50 downto 0);

    -- normBit_uid75_fpSinPiTest(BITSELECT,74)@8
    normBit_uid75_fpSinPiTest_in <= STD_LOGIC_VECTOR(mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_q(48 downto 0));
    normBit_uid75_fpSinPiTest_b <= STD_LOGIC_VECTOR(normBit_uid75_fpSinPiTest_in(48 downto 48));

    -- cstAllZWF_uid10_fpSinPiTest(CONSTANT,9)
    cstAllZWF_uid10_fpSinPiTest_q <= "00000000000000000000000";

    -- rndExpUpdate_uid84_fpSinPiTest(BITJOIN,83)@8
    rndExpUpdate_uid84_fpSinPiTest_q <= normBit_uid75_fpSinPiTest_b & cstAllZWF_uid10_fpSinPiTest_q & VCC_q;

    -- expXP1_uid62_fpSinPiTest(ADD,61)@1
    expXP1_uid62_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & redist18_expX_uid6_fpSinPiTest_b_1_q);
    expXP1_uid62_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
    expXP1_uid62_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXP1_uid62_fpSinPiTest_a) + UNSIGNED(expXP1_uid62_fpSinPiTest_b));
    expXP1_uid62_fpSinPiTest_q <= expXP1_uid62_fpSinPiTest_o(8 downto 0);

    -- expXP1R_uid63_fpSinPiTest(BITSELECT,62)@1
    expXP1R_uid63_fpSinPiTest_in <= expXP1_uid62_fpSinPiTest_q(7 downto 0);
    expXP1R_uid63_fpSinPiTest_b <= expXP1R_uid63_fpSinPiTest_in(7 downto 0);

    -- expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged(SUB,365)@1 + 1
    expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_a <= STD_LOGIC_VECTOR("0" & biasM1_uid29_fpSinPiTest_q);
    expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_b <= STD_LOGIC_VECTOR("000" & r_uid153_lzcZ_uid54_fpSinPiTest_q);
    expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_i <= "0" & expXP1R_uid63_fpSinPiTest_b;
    expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sinXIsX_uid32_fpSinPiTest_c = "1") THEN
                expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_o <= expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_i;
            ELSE
                expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_a) - UNSIGNED(expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_b));
            END IF;
        END IF;
    END PROCESS;
    expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q <= expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_o(7 downto 0);

    -- redist0_expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q_6(DELAY,421)
    redist0_expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q, xout => redist0_expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q_6_q, clk => clk, aclr => areset );

    -- highRes_uid76_fpSinPiTest(BITSELECT,75)@8
    highRes_uid76_fpSinPiTest_in <= mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_q(47 downto 0);
    highRes_uid76_fpSinPiTest_b <= highRes_uid76_fpSinPiTest_in(47 downto 24);

    -- lowRes_uid77_fpSinPiTest(BITSELECT,76)@8
    lowRes_uid77_fpSinPiTest_in <= mul2xSinRes_uid74_fpSinPiTest_result_add_1_0_q(46 downto 0);
    lowRes_uid77_fpSinPiTest_b <= lowRes_uid77_fpSinPiTest_in(46 downto 23);

    -- fracRCompPreRnd_uid78_fpSinPiTest(MUX,77)@8
    fracRCompPreRnd_uid78_fpSinPiTest_s <= normBit_uid75_fpSinPiTest_b;
    fracRCompPreRnd_uid78_fpSinPiTest_combproc: PROCESS (fracRCompPreRnd_uid78_fpSinPiTest_s, lowRes_uid77_fpSinPiTest_b, highRes_uid76_fpSinPiTest_b)
    BEGIN
        CASE (fracRCompPreRnd_uid78_fpSinPiTest_s) IS
            WHEN "0" => fracRCompPreRnd_uid78_fpSinPiTest_q <= lowRes_uid77_fpSinPiTest_b;
            WHEN "1" => fracRCompPreRnd_uid78_fpSinPiTest_q <= highRes_uid76_fpSinPiTest_b;
            WHEN OTHERS => fracRCompPreRnd_uid78_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracPreRnd_uid79_fpSinPiTest(BITJOIN,78)@8
    expFracPreRnd_uid79_fpSinPiTest_q <= redist0_expHardCase_uid60_fpSinPiTest_expP_uid65_fpSinPiTest_merged_q_6_q & fracRCompPreRnd_uid78_fpSinPiTest_q;

    -- expFracComp_uid85_fpSinPiTest(ADD,84)@8
    expFracComp_uid85_fpSinPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid79_fpSinPiTest_q);
    expFracComp_uid85_fpSinPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid84_fpSinPiTest_q);
    expFracComp_uid85_fpSinPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid85_fpSinPiTest_a) + UNSIGNED(expFracComp_uid85_fpSinPiTest_b));
    expFracComp_uid85_fpSinPiTest_q <= expFracComp_uid85_fpSinPiTest_o(32 downto 0);

    -- fracRComp_uid86_fpSinPiTest_merged_bit_select(BITSELECT,411)@8
    fracRComp_uid86_fpSinPiTest_merged_bit_select_in <= expFracComp_uid85_fpSinPiTest_q(31 downto 0);
    fracRComp_uid86_fpSinPiTest_merged_bit_select_b <= fracRComp_uid86_fpSinPiTest_merged_bit_select_in(23 downto 1);
    fracRComp_uid86_fpSinPiTest_merged_bit_select_c <= fracRComp_uid86_fpSinPiTest_merged_bit_select_in(31 downto 24);

    -- redist5_xIsInt_uid91_fpSinPiTest_q_7(DELAY,426)
    redist5_xIsInt_uid91_fpSinPiTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIsInt_uid91_fpSinPiTest_q, xout => redist5_xIsInt_uid91_fpSinPiTest_q_7_q, clk => clk, aclr => areset );

    -- regXAndInt_uid95_fpSinPiTest(LOGICAL,94)@1
    regXAndInt_uid95_fpSinPiTest_q <= xIsInt_uid91_fpSinPiTest_q and excR_x_uid27_fpSinPiTest_q;

    -- excRZero_uid96_fpSinPiTest(LOGICAL,95)@1 + 1
    excRZero_uid96_fpSinPiTest_qi <= regXAndInt_uid95_fpSinPiTest_q or excZ_x_uid19_fpSinPiTest_q;
    excRZero_uid96_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid96_fpSinPiTest_qi, xout => excRZero_uid96_fpSinPiTest_q, clk => clk, aclr => areset );

    -- redist3_excRZero_uid96_fpSinPiTest_q_7(DELAY,424)
    redist3_excRZero_uid96_fpSinPiTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid96_fpSinPiTest_q, xout => redist3_excRZero_uid96_fpSinPiTest_q_7_q, clk => clk, aclr => areset );

    -- rZOrXInt_uid103_fpSinPiTest(LOGICAL,102)@8
    rZOrXInt_uid103_fpSinPiTest_q <= redist3_excRZero_uid96_fpSinPiTest_q_7_q or redist5_xIsInt_uid91_fpSinPiTest_q_7_q;

    -- expRPostExc1_uid106_fpSinPiTest(MUX,105)@8
    expRPostExc1_uid106_fpSinPiTest_s <= rZOrXInt_uid103_fpSinPiTest_q;
    expRPostExc1_uid106_fpSinPiTest_combproc: PROCESS (expRPostExc1_uid106_fpSinPiTest_s, fracRComp_uid86_fpSinPiTest_merged_bit_select_c, cstAllZWE_uid16_fpSinPiTest_q)
    BEGIN
        CASE (expRPostExc1_uid106_fpSinPiTest_s) IS
            WHEN "0" => expRPostExc1_uid106_fpSinPiTest_q <= fracRComp_uid86_fpSinPiTest_merged_bit_select_c;
            WHEN "1" => expRPostExc1_uid106_fpSinPiTest_q <= cstAllZWE_uid16_fpSinPiTest_q;
            WHEN OTHERS => expRPostExc1_uid106_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xIntExp_uid92_fpSinPiTest(LOGICAL,91)@1
    xIntExp_uid92_fpSinPiTest_q <= not (xIntExp_uid28_fpSinPiTest_c);

    -- yIsHalfCmpEqSecondOp_uid44_fpSinPiTest(BITJOIN,43)@0
    yIsHalfCmpEqSecondOp_uid44_fpSinPiTest_q <= VCC_q & ozz_uid43_fpSinPiTest_q;

    -- yIsZero_uid45_fpSinPiTest(LOGICAL,44)@0 + 1
    yIsZero_uid45_fpSinPiTest_qi <= "1" WHEN y_uid41_fpSinPiTest_b = yIsHalfCmpEqSecondOp_uid44_fpSinPiTest_q ELSE "0";
    yIsZero_uid45_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yIsZero_uid45_fpSinPiTest_qi, xout => yIsZero_uid45_fpSinPiTest_q, clk => clk, aclr => areset );

    -- xRyHalf_uid94_fpSinPiTest(LOGICAL,93)@1 + 1
    xRyHalf_uid94_fpSinPiTest_qi <= excR_x_uid27_fpSinPiTest_q and yIsZero_uid45_fpSinPiTest_q and invSinXIsX_uid88_fpSinPiTest_q and xIntExp_uid92_fpSinPiTest_q;
    xRyHalf_uid94_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xRyHalf_uid94_fpSinPiTest_qi, xout => xRyHalf_uid94_fpSinPiTest_q, clk => clk, aclr => areset );

    -- redist4_xRyHalf_uid94_fpSinPiTest_q_7(DELAY,425)
    redist4_xRyHalf_uid94_fpSinPiTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => xRyHalf_uid94_fpSinPiTest_q, xout => redist4_xRyHalf_uid94_fpSinPiTest_q_7_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid21_fpSinPiTest(LOGICAL,20)@0 + 1
    fracXIsZero_uid21_fpSinPiTest_qi <= "1" WHEN cstAllZWF_uid10_fpSinPiTest_q = fracX_uid7_fpSinPiTest_b ELSE "0";
    fracXIsZero_uid21_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid21_fpSinPiTest_qi, xout => fracXIsZero_uid21_fpSinPiTest_q, clk => clk, aclr => areset );

    -- excI_x_uid23_fpSinPiTest(LOGICAL,22)@1
    excI_x_uid23_fpSinPiTest_q <= expXIsMax_uid20_fpSinPiTest_q and fracXIsZero_uid21_fpSinPiTest_q;

    -- fracXIsNotZero_uid22_fpSinPiTest(LOGICAL,21)@1
    fracXIsNotZero_uid22_fpSinPiTest_q <= not (fracXIsZero_uid21_fpSinPiTest_q);

    -- excN_x_uid24_fpSinPiTest(LOGICAL,23)@1
    excN_x_uid24_fpSinPiTest_q <= expXIsMax_uid20_fpSinPiTest_q and fracXIsNotZero_uid22_fpSinPiTest_q;

    -- excRNaN_uid97_fpSinPiTest(LOGICAL,96)@1 + 1
    excRNaN_uid97_fpSinPiTest_qi <= excN_x_uid24_fpSinPiTest_q or excI_x_uid23_fpSinPiTest_q;
    excRNaN_uid97_fpSinPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid97_fpSinPiTest_qi, xout => excRNaN_uid97_fpSinPiTest_q, clk => clk, aclr => areset );

    -- redist2_excRNaN_uid97_fpSinPiTest_q_7(DELAY,423)
    redist2_excRNaN_uid97_fpSinPiTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid97_fpSinPiTest_q, xout => redist2_excRNaN_uid97_fpSinPiTest_q_7_q, clk => clk, aclr => areset );

    -- excRIoN_uid107_fpSinPiTest(LOGICAL,106)@8
    excRIoN_uid107_fpSinPiTest_q <= GND_q or redist2_excRNaN_uid97_fpSinPiTest_q_7_q;

    -- expRPostExc_r3_uid108_fpSinPiTest(BITJOIN,107)@8
    expRPostExc_r3_uid108_fpSinPiTest_q <= redist4_xRyHalf_uid94_fpSinPiTest_q_7_q & excRIoN_uid107_fpSinPiTest_q;

    -- expRPostExc_uid109_fpSinPiTest(MUX,108)@8
    expRPostExc_uid109_fpSinPiTest_s <= expRPostExc_r3_uid108_fpSinPiTest_q;
    expRPostExc_uid109_fpSinPiTest_combproc: PROCESS (expRPostExc_uid109_fpSinPiTest_s, expRPostExc1_uid106_fpSinPiTest_q, cstAllOWE_uid9_fpSinPiTest_q, cstBias_uid11_fpSinPiTest_q)
    BEGIN
        CASE (expRPostExc_uid109_fpSinPiTest_s) IS
            WHEN "00" => expRPostExc_uid109_fpSinPiTest_q <= expRPostExc1_uid106_fpSinPiTest_q;
            WHEN "01" => expRPostExc_uid109_fpSinPiTest_q <= cstAllOWE_uid9_fpSinPiTest_q;
            WHEN "10" => expRPostExc_uid109_fpSinPiTest_q <= cstBias_uid11_fpSinPiTest_q;
            WHEN "11" => expRPostExc_uid109_fpSinPiTest_q <= cstBias_uid11_fpSinPiTest_q;
            WHEN OTHERS => expRPostExc_uid109_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid101_fpSinPiTest(CONSTANT,100)
    oneFracRPostExc2_uid101_fpSinPiTest_q <= "00000000000000000000001";

    -- xHalfRZI_uid98_fpSinPiTest(LOGICAL,97)@8
    xHalfRZI_uid98_fpSinPiTest_q <= redist4_xRyHalf_uid94_fpSinPiTest_q_7_q or redist3_excRZero_uid96_fpSinPiTest_q_7_q or GND_q;

    -- fracRPostExc1_uid100_fpSinPiTest(MUX,99)@8
    fracRPostExc1_uid100_fpSinPiTest_s <= xHalfRZI_uid98_fpSinPiTest_q;
    fracRPostExc1_uid100_fpSinPiTest_combproc: PROCESS (fracRPostExc1_uid100_fpSinPiTest_s, fracRComp_uid86_fpSinPiTest_merged_bit_select_b, cstAllZWF_uid10_fpSinPiTest_q)
    BEGIN
        CASE (fracRPostExc1_uid100_fpSinPiTest_s) IS
            WHEN "0" => fracRPostExc1_uid100_fpSinPiTest_q <= fracRComp_uid86_fpSinPiTest_merged_bit_select_b;
            WHEN "1" => fracRPostExc1_uid100_fpSinPiTest_q <= cstAllZWF_uid10_fpSinPiTest_q;
            WHEN OTHERS => fracRPostExc1_uid100_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid102_fpSinPiTest(MUX,101)@8
    fracRPostExc_uid102_fpSinPiTest_s <= redist2_excRNaN_uid97_fpSinPiTest_q_7_q;
    fracRPostExc_uid102_fpSinPiTest_combproc: PROCESS (fracRPostExc_uid102_fpSinPiTest_s, fracRPostExc1_uid100_fpSinPiTest_q, oneFracRPostExc2_uid101_fpSinPiTest_q)
    BEGIN
        CASE (fracRPostExc_uid102_fpSinPiTest_s) IS
            WHEN "0" => fracRPostExc_uid102_fpSinPiTest_q <= fracRPostExc1_uid100_fpSinPiTest_q;
            WHEN "1" => fracRPostExc_uid102_fpSinPiTest_q <= oneFracRPostExc2_uid101_fpSinPiTest_q;
            WHEN OTHERS => fracRPostExc_uid102_fpSinPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid116_fpSinPiTest(BITJOIN,115)@8
    R_uid116_fpSinPiTest_q <= redist1_signR_uid115_fpSinPiTest_q_7_q & expRPostExc_uid109_fpSinPiTest_q & fracRPostExc_uid102_fpSinPiTest_q;

    -- xOut(GPOUT,4)@8
    q <= R_uid116_fpSinPiTest_q;

END normal;
