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

-- VHDL created from fp_cos_0002
-- VHDL created on Tue May 11 07:31:53 2021


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

entity fp_cos_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_cos_0002;

architecture normal of fp_cos_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid9_fpCosPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid10_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM1_uid11_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPwF_uid12_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal biasMwShiftMO_uid13_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst01pWShift_uid14_fpCosPiTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal cstZwSwF_uid15_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal cstHalfwSwFP1_uid18_fpCosPiTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal cstAllZWE_uid21_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid24_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid27_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid28_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid29_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid30_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid31_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid32_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xEvenInt_uid33_fpCosPiTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal xEvenInt_uid33_fpCosPiTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal xEvenInt_uid33_fpCosPiTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal xEvenInt_uid33_fpCosPiTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal cosXIsOne_uid34_fpCosPiTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal cosXIsOne_uid34_fpCosPiTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal cosXIsOne_uid34_fpCosPiTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal cosXIsOne_uid34_fpCosPiTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid35_fpCosPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal shiftValFxPX_uid36_fpCosPiTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxPX_uid36_fpCosPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxPX_uid36_fpCosPiTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxPX_uid36_fpCosPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal oFracXExt_uid37_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal fxpShifterBits_uid38_fpCosPiTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fxpShifterBits_uid38_fpCosPiTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xMSB_uid40_fpCosPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpXFrac_uid42_fpCosPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpXFrac_uid42_fpCosPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xMSB_uid43_fpCosPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpXFracZero_uid45_fpCosPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal fxpXFracZero_uid45_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpXFracHalf_uid46_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal padACst_uid47_fpCosPiTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal aPostPad_uid48_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal oMFxpXFrac_uid49_fpCosPiTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal oMFxpXFrac_uid50_fpCosPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal oMFxpXFrac_uid50_fpCosPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal rangeReducedFxPX_uid53_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rangeReducedFxPX_uid53_fpCosPiTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal z_halfMRRFxPXE_uid56_fpCosPiTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal z_halfMRRFxPXE_uid56_fpCosPiTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal z_halfMRRFxPXE_uid56_fpCosPiTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal z_halfMRRFxPXE_uid56_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal z_uid57_fpCosPiTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal z_uid57_fpCosPiTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal alignedZLow_uid61_fpCosPiTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expHardCase_uid62_fpCosPiTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid62_fpCosPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid62_fpCosPiTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expHardCase_uid62_fpCosPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expP_uid63_fpCosPiTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expP_uid63_fpCosPiTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid65_fpCosPiTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal zPPolyEval_uid66_fpCosPiTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal zPPolyEval_uid66_fpCosPiTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpSinRes_uid68_fpCosPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal fxpSinRes_uid68_fpCosPiTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal normBit_uid70_fpCosPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highRes_uid71_fpCosPiTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal highRes_uid71_fpCosPiTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRes_uid72_fpCosPiTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRes_uid72_fpCosPiTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRCompPreRnd_uid73_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCompPreRnd_uid73_fpCosPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracPreRnd_uid74_fpCosPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rndExpUpdate_uid79_fpCosPiTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracComp_uid80_fpCosPiTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid80_fpCosPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid80_fpCosPiTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracComp_uid80_fpCosPiTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invCosXIsOne_uid83_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXEvenInt_uid84_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracZCosNotOne_uid85_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal evenIntCosNotOneFZ_uid86_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsInt_uid87_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsHalf_uid88_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpCosPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bigCond_uid90_fpCosPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal bigCond_uid90_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc1_uid91_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc1_uid91_fpCosPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oneFracRPostExc2_uid92_fpCosPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid93_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid93_fpCosPiTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc1_uid96_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostExc1_uid96_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rInfOrNaN_uid97_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIntOrXZOrCosOne_uid98_fpCosPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xIntOrXZOrCosOne_uid98_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concXIntOrXZOrCosOneRInfOrNaN_uid99_fpCosPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpCosPiTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xParityXorHalfParity_uid101_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRComp_uid102_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invFxpXFracHalf_uid103_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid104_fpCosPiTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid104_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid105_fpCosPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid107_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid108_lzcZ_uid59_fpCosPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid109_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid110_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal vStage_uid111_lzcZ_uid59_fpCosPiTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal vStage_uid111_lzcZ_uid59_fpCosPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal cStage_uid112_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid114_lzcZ_uid59_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid114_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid115_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid117_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid120_lzcZ_uid59_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid120_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid123_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid126_lzcZ_uid59_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid126_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid127_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid129_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid132_lzcZ_uid59_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid132_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid133_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid135_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid138_lzcZ_uid59_fpCosPiTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid138_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid140_lzcZ_uid59_fpCosPiTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid141_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid142_lzcZ_uid59_fpCosPiTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid156_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rndBit_uid158_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid159_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid161_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid161_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid161_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid162_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rndBit_uid165_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid166_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid168_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid168_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid169_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal topRangeX_uid179_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid180_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid185_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_mergedSignalTM_uid188_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_mergedSignalTM_uid192_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomY_uid194_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid207_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid208_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid209_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid210_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid215_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid216_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid217_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid218_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid223_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid224_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n1_uid225_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid226_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_reset : std_logic;
    signal sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_reset : std_logic;
    signal sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_reset : std_logic;
    signal sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_reset : std_logic;
    signal sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_reset : std_logic;
    signal sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1_uid248_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a2_uid249_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid254_mul2xSinRes_uid69_fpCosPiTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal osig_uid255_mul2xSinRes_uid69_fpCosPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid255_mul2xSinRes_uid69_fpCosPiTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal nx_mergedSignalTM_uid259_pT1_uid157_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid271_pT1_uid157_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_mergedSignalTM_uid275_pT1_uid157_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid277_pT1_uid157_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid277_pT1_uid157_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid277_pT1_uid157_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid277_pT1_uid157_invPolyEval_reset : std_logic;
    signal sm0_uid277_pT1_uid157_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid278_pT1_uid157_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid278_pT1_uid157_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid293_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid299_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid302_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid310_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid310_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid311_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid311_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid320_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid321_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid328_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid329_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid342_pT2_uid164_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid342_pT2_uid164_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid342_pT2_uid164_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid342_pT2_uid164_invPolyEval_reset : std_logic;
    signal sm0_uid342_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid343_pT2_uid164_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid343_pT2_uid164_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid343_pT2_uid164_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid343_pT2_uid164_invPolyEval_reset : std_logic;
    signal sm0_uid343_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid344_pT2_uid164_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid344_pT2_uid164_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid344_pT2_uid164_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid344_pT2_uid164_invPolyEval_reset : std_logic;
    signal sm0_uid344_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid345_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid345_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid346_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid347_pT2_uid164_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid347_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid347_pT2_uid164_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid347_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid348_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid349_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid349_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid350_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid351_pT2_uid164_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid351_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid351_pT2_uid164_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid351_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal lev2_a0_uid352_pT2_uid164_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid353_pT2_uid164_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid353_pT2_uid164_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx1_uid359_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal leftShiftStage0Idx2_uid362_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx3Pad24_uid363_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage0Idx3_uid365_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx4_uid368_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1_uid376_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2_uid379_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx3_uid382_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx4_uid385_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx5Pad5_uid386_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx5_uid388_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx6Pad6_uid389_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx6_uid391_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx7Pad7_uid392_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx7_uid394_fxpX_uid39_fpCosPiTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1_uid402_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2_uid405_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx3_uid408_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx4_uid411_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal leftShiftStage1Idx1_uid419_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage1Idx2_uid422_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3_uid425_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx4_uid428_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx5_uid431_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage1Idx6_uid434_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx7_uid437_alignedZ_uid60_fpCosPiTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal memoryC0_uid144_cosPiXTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid144_cosPiXTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid144_cosPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC0_uid144_cosPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC0_uid144_cosPiXTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid144_cosPiXTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid147_cosPiXTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid147_cosPiXTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid147_cosPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC1_uid147_cosPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC1_uid147_cosPiXTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid147_cosPiXTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid150_cosPiXTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid150_cosPiXTables_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC2_uid150_cosPiXTables_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC2_uid150_cosPiXTables_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal memoryC2_uid150_cosPiXTables_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC2_uid150_cosPiXTables_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expX_uid6_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid6_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal fracRComp_uid81_fpCosPiTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRComp_uid81_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRComp_uid81_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_r_uid142_lzcZ_uid59_fpCosPiTest_q_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_signR_uid104_fpCosPiTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_xIntOrXZOrCosOne_uid98_fpCosPiTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_bigCond_uid90_fpCosPiTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_excRNaN_uid89_fpCosPiTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_xIsHalf_uid88_fpCosPiTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_zPPolyEval_uid66_fpCosPiTest_b_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_yAddr_uid65_fpCosPiTest_b_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist8_yAddr_uid65_fpCosPiTest_b_4_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist9_alignedZLow_uid61_fpCosPiTest_b_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist10_z_uid57_fpCosPiTest_b_2_q : STD_LOGIC_VECTOR (34 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest(CONSTANT,368)
    leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q <= "0000000000000000000000000000000000000";

    -- cst01pWShift_uid14_fpCosPiTest(CONSTANT,13)
    cst01pWShift_uid14_fpCosPiTest_q <= "0000000000000";

    -- expX_uid6_fpCosPiTest_merged_bit_select(BITSELECT,463)@0
    expX_uid6_fpCosPiTest_merged_bit_select_b <= STD_LOGIC_VECTOR(a(30 downto 23));
    expX_uid6_fpCosPiTest_merged_bit_select_c <= STD_LOGIC_VECTOR(a(22 downto 0));

    -- oFracX_uid35_fpCosPiTest(BITJOIN,34)@0
    oFracX_uid35_fpCosPiTest_q <= VCC_q & expX_uid6_fpCosPiTest_merged_bit_select_c;

    -- oFracXExt_uid37_fpCosPiTest(BITJOIN,36)@0
    oFracXExt_uid37_fpCosPiTest_q <= cst01pWShift_uid14_fpCosPiTest_q & oFracX_uid35_fpCosPiTest_q;

    -- leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest(BITSELECT,366)@0
    leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_in <= oFracXExt_uid37_fpCosPiTest_q(4 downto 0);
    leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_b <= leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_in(4 downto 0);

    -- zs_uid107_lzcZ_uid59_fpCosPiTest(CONSTANT,106)
    zs_uid107_lzcZ_uid59_fpCosPiTest_q <= "00000000000000000000000000000000";

    -- leftShiftStage0Idx4_uid368_fxpX_uid39_fpCosPiTest(BITJOIN,367)@0
    leftShiftStage0Idx4_uid368_fxpX_uid39_fpCosPiTest_q <= leftShiftStage0Idx4Rng32_uid367_fxpX_uid39_fpCosPiTest_b & zs_uid107_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1(MUX,446)@0
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_s <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_s, leftShiftStage0Idx4_uid368_fxpX_uid39_fpCosPiTest_q, leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage0Idx4_uid368_fxpX_uid39_fpCosPiTest_q;
            WHEN "01" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q;
            WHEN "10" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q;
            WHEN "11" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage0Idx5_uid369_fxpX_uid39_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest(BITSELECT,363)@0
    leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_in <= oFracXExt_uid37_fpCosPiTest_q(12 downto 0);
    leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_b <= leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_in(12 downto 0);

    -- leftShiftStage0Idx3Pad24_uid363_fxpX_uid39_fpCosPiTest(CONSTANT,362)
    leftShiftStage0Idx3Pad24_uid363_fxpX_uid39_fpCosPiTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid365_fxpX_uid39_fpCosPiTest(BITJOIN,364)@0
    leftShiftStage0Idx3_uid365_fxpX_uid39_fpCosPiTest_q <= leftShiftStage0Idx3Rng24_uid364_fxpX_uid39_fpCosPiTest_b & leftShiftStage0Idx3Pad24_uid363_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest(BITSELECT,360)@0
    leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_in <= oFracXExt_uid37_fpCosPiTest_q(20 downto 0);
    leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_b <= leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_in(20 downto 0);

    -- zs_uid115_lzcZ_uid59_fpCosPiTest(CONSTANT,114)
    zs_uid115_lzcZ_uid59_fpCosPiTest_q <= "0000000000000000";

    -- leftShiftStage0Idx2_uid362_fxpX_uid39_fpCosPiTest(BITJOIN,361)@0
    leftShiftStage0Idx2_uid362_fxpX_uid39_fpCosPiTest_q <= leftShiftStage0Idx2Rng16_uid361_fxpX_uid39_fpCosPiTest_b & zs_uid115_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest(BITSELECT,357)@0
    leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_in <= oFracXExt_uid37_fpCosPiTest_q(28 downto 0);
    leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_b <= leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_in(28 downto 0);

    -- cstAllZWE_uid21_fpCosPiTest(CONSTANT,20)
    cstAllZWE_uid21_fpCosPiTest_q <= "00000000";

    -- leftShiftStage0Idx1_uid359_fxpX_uid39_fpCosPiTest(BITJOIN,358)@0
    leftShiftStage0Idx1_uid359_fxpX_uid39_fpCosPiTest_q <= leftShiftStage0Idx1Rng8_uid358_fxpX_uid39_fpCosPiTest_b & cstAllZWE_uid21_fpCosPiTest_q;

    -- leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0(MUX,445)@0
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_s <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_s, oFracXExt_uid37_fpCosPiTest_q, leftShiftStage0Idx1_uid359_fxpX_uid39_fpCosPiTest_q, leftShiftStage0Idx2_uid362_fxpX_uid39_fpCosPiTest_q, leftShiftStage0Idx3_uid365_fxpX_uid39_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q <= oFracXExt_uid37_fpCosPiTest_q;
            WHEN "01" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx1_uid359_fxpX_uid39_fpCosPiTest_q;
            WHEN "10" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx2_uid362_fxpX_uid39_fpCosPiTest_q;
            WHEN "11" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx3_uid365_fxpX_uid39_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- biasMwShiftMO_uid13_fpCosPiTest(CONSTANT,12)
    biasMwShiftMO_uid13_fpCosPiTest_q <= "01110010";

    -- shiftValFxPX_uid36_fpCosPiTest(SUB,35)@0
    shiftValFxPX_uid36_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpCosPiTest_merged_bit_select_b);
    shiftValFxPX_uid36_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & biasMwShiftMO_uid13_fpCosPiTest_q);
    shiftValFxPX_uid36_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValFxPX_uid36_fpCosPiTest_a) - UNSIGNED(shiftValFxPX_uid36_fpCosPiTest_b));
    shiftValFxPX_uid36_fpCosPiTest_q <= shiftValFxPX_uid36_fpCosPiTest_o(8 downto 0);

    -- fxpShifterBits_uid38_fpCosPiTest(BITSELECT,37)@0
    fxpShifterBits_uid38_fpCosPiTest_in <= shiftValFxPX_uid36_fpCosPiTest_q(5 downto 0);
    fxpShifterBits_uid38_fpCosPiTest_b <= fxpShifterBits_uid38_fpCosPiTest_in(5 downto 0);

    -- leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select(BITSELECT,464)@0
    leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_b <= fxpShifterBits_uid38_fpCosPiTest_b(5 downto 3);
    leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_c <= fxpShifterBits_uid38_fpCosPiTest_b(2 downto 0);

    -- leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select(BITSELECT,473)@0
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal(MUX,447)@0
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_s <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_combproc: PROCESS (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_s, leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q, leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest(BITSELECT,392)@0
    leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(29 downto 0);
    leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_in(29 downto 0);

    -- leftShiftStage1Idx7Pad7_uid392_fxpX_uid39_fpCosPiTest(CONSTANT,391)
    leftShiftStage1Idx7Pad7_uid392_fxpX_uid39_fpCosPiTest_q <= "0000000";

    -- leftShiftStage1Idx7_uid394_fxpX_uid39_fpCosPiTest(BITJOIN,393)@0
    leftShiftStage1Idx7_uid394_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx7Rng7_uid393_fxpX_uid39_fpCosPiTest_b & leftShiftStage1Idx7Pad7_uid392_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest(BITSELECT,389)@0
    leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(30 downto 0);
    leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_in(30 downto 0);

    -- leftShiftStage1Idx6Pad6_uid389_fxpX_uid39_fpCosPiTest(CONSTANT,388)
    leftShiftStage1Idx6Pad6_uid389_fxpX_uid39_fpCosPiTest_q <= "000000";

    -- leftShiftStage1Idx6_uid391_fxpX_uid39_fpCosPiTest(BITJOIN,390)@0
    leftShiftStage1Idx6_uid391_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx6Rng6_uid390_fxpX_uid39_fpCosPiTest_b & leftShiftStage1Idx6Pad6_uid389_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest(BITSELECT,386)@0
    leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(31 downto 0);
    leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_in(31 downto 0);

    -- leftShiftStage1Idx5Pad5_uid386_fxpX_uid39_fpCosPiTest(CONSTANT,385)
    leftShiftStage1Idx5Pad5_uid386_fxpX_uid39_fpCosPiTest_q <= "00000";

    -- leftShiftStage1Idx5_uid388_fxpX_uid39_fpCosPiTest(BITJOIN,387)@0
    leftShiftStage1Idx5_uid388_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx5Rng5_uid387_fxpX_uid39_fpCosPiTest_b & leftShiftStage1Idx5Pad5_uid386_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest(BITSELECT,383)@0
    leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(32 downto 0);
    leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_in(32 downto 0);

    -- zs_uid127_lzcZ_uid59_fpCosPiTest(CONSTANT,126)
    zs_uid127_lzcZ_uid59_fpCosPiTest_q <= "0000";

    -- leftShiftStage1Idx4_uid385_fxpX_uid39_fpCosPiTest(BITJOIN,384)@0
    leftShiftStage1Idx4_uid385_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx4Rng4_uid384_fxpX_uid39_fpCosPiTest_b & zs_uid127_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1(MUX,451)@0
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_s <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_combproc: PROCESS (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_s, leftShiftStage1Idx4_uid385_fxpX_uid39_fpCosPiTest_q, leftShiftStage1Idx5_uid388_fxpX_uid39_fpCosPiTest_q, leftShiftStage1Idx6_uid391_fxpX_uid39_fpCosPiTest_q, leftShiftStage1Idx7_uid394_fxpX_uid39_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx4_uid385_fxpX_uid39_fpCosPiTest_q;
            WHEN "01" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx5_uid388_fxpX_uid39_fpCosPiTest_q;
            WHEN "10" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx6_uid391_fxpX_uid39_fpCosPiTest_q;
            WHEN "11" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx7_uid394_fxpX_uid39_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest(BITSELECT,380)@0
    leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(33 downto 0);
    leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_in(33 downto 0);

    -- rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest(CONSTANT,189)
    rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q <= "000";

    -- leftShiftStage1Idx3_uid382_fxpX_uid39_fpCosPiTest(BITJOIN,381)@0
    leftShiftStage1Idx3_uid382_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx3Rng3_uid381_fxpX_uid39_fpCosPiTest_b & rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q;

    -- leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest(BITSELECT,377)@0
    leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(34 downto 0);
    leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_in(34 downto 0);

    -- zs_uid133_lzcZ_uid59_fpCosPiTest(CONSTANT,132)
    zs_uid133_lzcZ_uid59_fpCosPiTest_q <= "00";

    -- leftShiftStage1Idx2_uid379_fxpX_uid39_fpCosPiTest(BITJOIN,378)@0
    leftShiftStage1Idx2_uid379_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx2Rng2_uid378_fxpX_uid39_fpCosPiTest_b & zs_uid133_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest(BITSELECT,374)@0
    leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_in <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q(35 downto 0);
    leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_b <= leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_in(35 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- leftShiftStage1Idx1_uid376_fxpX_uid39_fpCosPiTest(BITJOIN,375)@0
    leftShiftStage1Idx1_uid376_fxpX_uid39_fpCosPiTest_q <= leftShiftStage1Idx1Rng1_uid375_fxpX_uid39_fpCosPiTest_b & GND_q;

    -- leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0(MUX,450)@0
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_s <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_combproc: PROCESS (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_s, leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q, leftShiftStage1Idx1_uid376_fxpX_uid39_fpCosPiTest_q, leftShiftStage1Idx2_uid379_fxpX_uid39_fpCosPiTest_q, leftShiftStage1Idx3_uid382_fxpX_uid39_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage0_uid373_fxpX_uid39_fpCosPiTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx1_uid376_fxpX_uid39_fpCosPiTest_q;
            WHEN "10" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx2_uid379_fxpX_uid39_fpCosPiTest_q;
            WHEN "11" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx3_uid382_fxpX_uid39_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select(BITSELECT,474)@0
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_c(1 downto 0);
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid372_fxpX_uid39_fpCosPiTest_merged_bit_select_c(2 downto 2);

    -- leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal(MUX,452)@0
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_s <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_combproc: PROCESS (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_s, leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q, leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpXFrac_uid42_fpCosPiTest(BITSELECT,41)@0
    fxpXFrac_uid42_fpCosPiTest_in <= leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q(35 downto 0);
    fxpXFrac_uid42_fpCosPiTest_b <= fxpXFrac_uid42_fpCosPiTest_in(35 downto 0);

    -- xMSB_uid43_fpCosPiTest(BITSELECT,42)@0
    xMSB_uid43_fpCosPiTest_b <= STD_LOGIC_VECTOR(fxpXFrac_uid42_fpCosPiTest_b(35 downto 35));

    -- xMSB_uid40_fpCosPiTest(BITSELECT,39)@0
    xMSB_uid40_fpCosPiTest_b <= STD_LOGIC_VECTOR(leftShiftStage1_uid396_fxpX_uid39_fpCosPiTest_mfinal_q(36 downto 36));

    -- xParityXorHalfParity_uid101_fpCosPiTest(LOGICAL,100)@0
    xParityXorHalfParity_uid101_fpCosPiTest_q <= xMSB_uid40_fpCosPiTest_b xor xMSB_uid43_fpCosPiTest_b;

    -- cstBiasPwF_uid12_fpCosPiTest(CONSTANT,11)
    cstBiasPwF_uid12_fpCosPiTest_q <= "10010110";

    -- xEvenInt_uid33_fpCosPiTest(COMPARE,32)@0
    xEvenInt_uid33_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid12_fpCosPiTest_q);
    xEvenInt_uid33_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpCosPiTest_merged_bit_select_b);
    xEvenInt_uid33_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xEvenInt_uid33_fpCosPiTest_a) - UNSIGNED(xEvenInt_uid33_fpCosPiTest_b));
    xEvenInt_uid33_fpCosPiTest_c(0) <= xEvenInt_uid33_fpCosPiTest_o(9);

    -- invXEvenInt_uid84_fpCosPiTest(LOGICAL,83)@0
    invXEvenInt_uid84_fpCosPiTest_q <= not (xEvenInt_uid33_fpCosPiTest_c);

    -- cosXIsOne_uid34_fpCosPiTest(COMPARE,33)@0
    cosXIsOne_uid34_fpCosPiTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpCosPiTest_merged_bit_select_b);
    cosXIsOne_uid34_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShiftMO_uid13_fpCosPiTest_q);
    cosXIsOne_uid34_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cosXIsOne_uid34_fpCosPiTest_a) - UNSIGNED(cosXIsOne_uid34_fpCosPiTest_b));
    cosXIsOne_uid34_fpCosPiTest_c(0) <= cosXIsOne_uid34_fpCosPiTest_o(9);

    -- invCosXIsOne_uid83_fpCosPiTest(LOGICAL,82)@0
    invCosXIsOne_uid83_fpCosPiTest_q <= not (cosXIsOne_uid34_fpCosPiTest_c);

    -- signRComp_uid102_fpCosPiTest(LOGICAL,101)@0
    signRComp_uid102_fpCosPiTest_q <= invCosXIsOne_uid83_fpCosPiTest_q and invXEvenInt_uid84_fpCosPiTest_q and xParityXorHalfParity_uid101_fpCosPiTest_q;

    -- cstZwSwF_uid15_fpCosPiTest(CONSTANT,14)
    cstZwSwF_uid15_fpCosPiTest_q <= "00000000000000000000000000000000000";

    -- cstHalfwSwFP1_uid18_fpCosPiTest(BITJOIN,17)@0
    cstHalfwSwFP1_uid18_fpCosPiTest_q <= VCC_q & cstZwSwF_uid15_fpCosPiTest_q;

    -- fxpXFracHalf_uid46_fpCosPiTest(LOGICAL,45)@0
    fxpXFracHalf_uid46_fpCosPiTest_q <= "1" WHEN fxpXFrac_uid42_fpCosPiTest_b = cstHalfwSwFP1_uid18_fpCosPiTest_q ELSE "0";

    -- invFxpXFracHalf_uid103_fpCosPiTest(LOGICAL,102)@0
    invFxpXFracHalf_uid103_fpCosPiTest_q <= not (fxpXFracHalf_uid46_fpCosPiTest_q);

    -- signR_uid104_fpCosPiTest(LOGICAL,103)@0 + 1
    signR_uid104_fpCosPiTest_qi <= invFxpXFracHalf_uid103_fpCosPiTest_q and signRComp_uid102_fpCosPiTest_q;
    signR_uid104_fpCosPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid104_fpCosPiTest_qi, xout => signR_uid104_fpCosPiTest_q, clk => clk, aclr => areset );

    -- redist1_signR_uid104_fpCosPiTest_q_8(DELAY,478)
    redist1_signR_uid104_fpCosPiTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid104_fpCosPiTest_q, xout => redist1_signR_uid104_fpCosPiTest_q_8_q, clk => clk, aclr => areset );

    -- cstBias_uid10_fpCosPiTest(CONSTANT,9)
    cstBias_uid10_fpCosPiTest_q <= "01111111";

    -- cstAllOWE_uid8_fpCosPiTest(CONSTANT,7)
    cstAllOWE_uid8_fpCosPiTest_q <= "11111111";

    -- padACst_uid47_fpCosPiTest(CONSTANT,46)
    padACst_uid47_fpCosPiTest_q <= "000000000000000000000000000000000000";

    -- aPostPad_uid48_fpCosPiTest(BITJOIN,47)@0
    aPostPad_uid48_fpCosPiTest_q <= VCC_q & padACst_uid47_fpCosPiTest_q;

    -- oMFxpXFrac_uid49_fpCosPiTest(SUB,48)@0
    oMFxpXFrac_uid49_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid48_fpCosPiTest_q);
    oMFxpXFrac_uid49_fpCosPiTest_b <= STD_LOGIC_VECTOR("00" & fxpXFrac_uid42_fpCosPiTest_b);
    oMFxpXFrac_uid49_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMFxpXFrac_uid49_fpCosPiTest_a) - UNSIGNED(oMFxpXFrac_uid49_fpCosPiTest_b));
    oMFxpXFrac_uid49_fpCosPiTest_q <= oMFxpXFrac_uid49_fpCosPiTest_o(37 downto 0);

    -- oMFxpXFrac_uid50_fpCosPiTest(BITSELECT,49)@0
    oMFxpXFrac_uid50_fpCosPiTest_in <= oMFxpXFrac_uid49_fpCosPiTest_q(35 downto 0);
    oMFxpXFrac_uid50_fpCosPiTest_b <= oMFxpXFrac_uid50_fpCosPiTest_in(35 downto 0);

    -- rangeReducedFxPX_uid53_fpCosPiTest(MUX,52)@0
    rangeReducedFxPX_uid53_fpCosPiTest_s <= xMSB_uid43_fpCosPiTest_b;
    rangeReducedFxPX_uid53_fpCosPiTest_combproc: PROCESS (rangeReducedFxPX_uid53_fpCosPiTest_s, fxpXFrac_uid42_fpCosPiTest_b, oMFxpXFrac_uid50_fpCosPiTest_b)
    BEGIN
        CASE (rangeReducedFxPX_uid53_fpCosPiTest_s) IS
            WHEN "0" => rangeReducedFxPX_uid53_fpCosPiTest_q <= fxpXFrac_uid42_fpCosPiTest_b;
            WHEN "1" => rangeReducedFxPX_uid53_fpCosPiTest_q <= oMFxpXFrac_uid50_fpCosPiTest_b;
            WHEN OTHERS => rangeReducedFxPX_uid53_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- z_halfMRRFxPXE_uid56_fpCosPiTest(SUB,55)@0
    z_halfMRRFxPXE_uid56_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & cstHalfwSwFP1_uid18_fpCosPiTest_q);
    z_halfMRRFxPXE_uid56_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & rangeReducedFxPX_uid53_fpCosPiTest_q);
    z_halfMRRFxPXE_uid56_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(z_halfMRRFxPXE_uid56_fpCosPiTest_a) - UNSIGNED(z_halfMRRFxPXE_uid56_fpCosPiTest_b));
    z_halfMRRFxPXE_uid56_fpCosPiTest_q <= z_halfMRRFxPXE_uid56_fpCosPiTest_o(36 downto 0);

    -- z_uid57_fpCosPiTest(BITSELECT,56)@0
    z_uid57_fpCosPiTest_in <= z_halfMRRFxPXE_uid56_fpCosPiTest_q(34 downto 0);
    z_uid57_fpCosPiTest_b <= z_uid57_fpCosPiTest_in(34 downto 0);

    -- yAddr_uid65_fpCosPiTest(BITSELECT,64)@0
    yAddr_uid65_fpCosPiTest_b <= z_uid57_fpCosPiTest_b(34 downto 28);

    -- memoryC2_uid150_cosPiXTables_lutmem(DUALMEM,442)@0 + 2
    -- in j@20000000
    memoryC2_uid150_cosPiXTables_lutmem_aa <= yAddr_uid65_fpCosPiTest_b;
    memoryC2_uid150_cosPiXTables_lutmem_reset0 <= areset;
    memoryC2_uid150_cosPiXTables_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_0002_memoryC2_uid150_cosPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid150_cosPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid150_cosPiXTables_lutmem_aa,
        q_a => memoryC2_uid150_cosPiXTables_lutmem_ir
    );
    memoryC2_uid150_cosPiXTables_lutmem_r <= memoryC2_uid150_cosPiXTables_lutmem_ir(13 downto 0);

    -- topRangeY_mergedSignalTM_uid275_pT1_uid157_invPolyEval(BITJOIN,274)@2
    topRangeY_mergedSignalTM_uid275_pT1_uid157_invPolyEval_q <= memoryC2_uid150_cosPiXTables_lutmem_r & rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q;

    -- redist10_z_uid57_fpCosPiTest_b_2(DELAY,487)
    redist10_z_uid57_fpCosPiTest_b_2 : dspba_delay
    GENERIC MAP ( width => 35, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => z_uid57_fpCosPiTest_b, xout => redist10_z_uid57_fpCosPiTest_b_2_q, clk => clk, aclr => areset );

    -- zPPolyEval_uid66_fpCosPiTest(BITSELECT,65)@2
    zPPolyEval_uid66_fpCosPiTest_in <= redist10_z_uid57_fpCosPiTest_b_2_q(27 downto 0);
    zPPolyEval_uid66_fpCosPiTest_b <= zPPolyEval_uid66_fpCosPiTest_in(27 downto 12);

    -- yT1_uid156_invPolyEval(BITSELECT,155)@2
    yT1_uid156_invPolyEval_b <= zPPolyEval_uid66_fpCosPiTest_b(15 downto 2);

    -- nx_mergedSignalTM_uid259_pT1_uid157_invPolyEval(BITJOIN,258)@2
    nx_mergedSignalTM_uid259_pT1_uid157_invPolyEval_q <= GND_q & yT1_uid156_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid271_pT1_uid157_invPolyEval(BITJOIN,270)@2
    topRangeX_mergedSignalTM_uid271_pT1_uid157_invPolyEval_q <= nx_mergedSignalTM_uid259_pT1_uid157_invPolyEval_q & zs_uid133_lzcZ_uid59_fpCosPiTest_q;

    -- sm0_uid277_pT1_uid157_invPolyEval(MULT,276)@2 + 2
    sm0_uid277_pT1_uid157_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid271_pT1_uid157_invPolyEval_q);
    sm0_uid277_pT1_uid157_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid275_pT1_uid157_invPolyEval_q);
    sm0_uid277_pT1_uid157_invPolyEval_reset <= areset;
    sm0_uid277_pT1_uid157_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid277_pT1_uid157_invPolyEval_a0,
        datab => sm0_uid277_pT1_uid157_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid277_pT1_uid157_invPolyEval_reset,
        clock => clk,
        result => sm0_uid277_pT1_uid157_invPolyEval_s1
    );
    sm0_uid277_pT1_uid157_invPolyEval_q <= sm0_uid277_pT1_uid157_invPolyEval_s1;

    -- osig_uid278_pT1_uid157_invPolyEval(BITSELECT,277)@4
    osig_uid278_pT1_uid157_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid277_pT1_uid157_invPolyEval_q(32 downto 0));
    osig_uid278_pT1_uid157_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid278_pT1_uid157_invPolyEval_in(32 downto 17));

    -- redist7_yAddr_uid65_fpCosPiTest_b_2(DELAY,484)
    redist7_yAddr_uid65_fpCosPiTest_b_2 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid65_fpCosPiTest_b, xout => redist7_yAddr_uid65_fpCosPiTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid147_cosPiXTables_lutmem(DUALMEM,441)@2 + 2
    -- in j@20000000
    memoryC1_uid147_cosPiXTables_lutmem_aa <= redist7_yAddr_uid65_fpCosPiTest_b_2_q;
    memoryC1_uid147_cosPiXTables_lutmem_reset0 <= areset;
    memoryC1_uid147_cosPiXTables_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_0002_memoryC1_uid147_cosPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid147_cosPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid147_cosPiXTables_lutmem_aa,
        q_a => memoryC1_uid147_cosPiXTables_lutmem_ir
    );
    memoryC1_uid147_cosPiXTables_lutmem_r <= memoryC1_uid147_cosPiXTables_lutmem_ir(20 downto 0);

    -- rndBit_uid158_invPolyEval(CONSTANT,157)
    rndBit_uid158_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid159_invPolyEval(BITJOIN,158)@4
    cIncludingRoundingBit_uid159_invPolyEval_q <= memoryC1_uid147_cosPiXTables_lutmem_r & rndBit_uid158_invPolyEval_q;

    -- ts1_uid161_invPolyEval(ADD,160)@4
    ts1_uid161_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid159_invPolyEval_q(22)) & cIncludingRoundingBit_uid159_invPolyEval_q));
    ts1_uid161_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 16 => osig_uid278_pT1_uid157_invPolyEval_b(15)) & osig_uid278_pT1_uid157_invPolyEval_b));
    ts1_uid161_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid161_invPolyEval_a) + SIGNED(ts1_uid161_invPolyEval_b));
    ts1_uid161_invPolyEval_q <= ts1_uid161_invPolyEval_o(23 downto 0);

    -- s1_uid162_invPolyEval(BITSELECT,161)@4
    s1_uid162_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid161_invPolyEval_q(23 downto 1));

    -- rightBottomY_uid311_pT2_uid164_invPolyEval(BITSELECT,310)@4
    rightBottomY_uid311_pT2_uid164_invPolyEval_in <= s1_uid162_invPolyEval_b(5 downto 0);
    rightBottomY_uid311_pT2_uid164_invPolyEval_b <= rightBottomY_uid311_pT2_uid164_invPolyEval_in(5 downto 1);

    -- n1_uid320_pT2_uid164_invPolyEval(BITSELECT,319)@4
    n1_uid320_pT2_uid164_invPolyEval_b <= rightBottomY_uid311_pT2_uid164_invPolyEval_b(4 downto 1);

    -- n1_uid328_pT2_uid164_invPolyEval(BITSELECT,327)@4
    n1_uid328_pT2_uid164_invPolyEval_b <= n1_uid320_pT2_uid164_invPolyEval_b(3 downto 1);

    -- redist6_zPPolyEval_uid66_fpCosPiTest_b_2(DELAY,483)
    redist6_zPPolyEval_uid66_fpCosPiTest_b_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => zPPolyEval_uid66_fpCosPiTest_b, xout => redist6_zPPolyEval_uid66_fpCosPiTest_b_2_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval(BITJOIN,281)@4
    nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval_q <= GND_q & redist6_zPPolyEval_uid66_fpCosPiTest_b_2_q;

    -- rightBottomX_uid310_pT2_uid164_invPolyEval(BITSELECT,309)@4
    rightBottomX_uid310_pT2_uid164_invPolyEval_in <= nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval_q(8 downto 0);
    rightBottomX_uid310_pT2_uid164_invPolyEval_b <= rightBottomX_uid310_pT2_uid164_invPolyEval_in(8 downto 4);

    -- n0_uid321_pT2_uid164_invPolyEval(BITSELECT,320)@4
    n0_uid321_pT2_uid164_invPolyEval_b <= rightBottomX_uid310_pT2_uid164_invPolyEval_b(4 downto 1);

    -- n0_uid329_pT2_uid164_invPolyEval(BITSELECT,328)@4
    n0_uid329_pT2_uid164_invPolyEval_b <= n0_uid321_pT2_uid164_invPolyEval_b(3 downto 1);

    -- sm0_uid344_pT2_uid164_invPolyEval(MULT,343)@4 + 2
    sm0_uid344_pT2_uid164_invPolyEval_a0 <= n0_uid329_pT2_uid164_invPolyEval_b;
    sm0_uid344_pT2_uid164_invPolyEval_b0 <= n1_uid328_pT2_uid164_invPolyEval_b;
    sm0_uid344_pT2_uid164_invPolyEval_reset <= areset;
    sm0_uid344_pT2_uid164_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid344_pT2_uid164_invPolyEval_a0,
        datab => sm0_uid344_pT2_uid164_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid344_pT2_uid164_invPolyEval_reset,
        clock => clk,
        result => sm0_uid344_pT2_uid164_invPolyEval_s1
    );
    sm0_uid344_pT2_uid164_invPolyEval_q <= sm0_uid344_pT2_uid164_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval(BITSELECT,300)@4
    aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_in <= STD_LOGIC_VECTOR(s1_uid162_invPolyEval_b(5 downto 0));
    aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid302_pT2_uid164_invPolyEval(BITJOIN,301)@4
    aboveLeftY_mergedSignalTM_uid302_pT2_uid164_invPolyEval_q <= aboveLeftY_bottomRange_uid301_pT2_uid164_invPolyEval_b & zs_uid133_lzcZ_uid59_fpCosPiTest_q;

    -- aboveLeftX_uid299_pT2_uid164_invPolyEval(BITSELECT,298)@4
    aboveLeftX_uid299_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval_q(16 downto 9));

    -- sm0_uid343_pT2_uid164_invPolyEval(MULT,342)@4 + 2
    sm0_uid343_pT2_uid164_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid299_pT2_uid164_invPolyEval_b);
    sm0_uid343_pT2_uid164_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid302_pT2_uid164_invPolyEval_q;
    sm0_uid343_pT2_uid164_invPolyEval_reset <= areset;
    sm0_uid343_pT2_uid164_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid343_pT2_uid164_invPolyEval_a0,
        datab => sm0_uid343_pT2_uid164_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid343_pT2_uid164_invPolyEval_reset,
        clock => clk,
        result => sm0_uid343_pT2_uid164_invPolyEval_s1
    );
    sm0_uid343_pT2_uid164_invPolyEval_q <= sm0_uid343_pT2_uid164_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid293_pT2_uid164_invPolyEval(BITSELECT,292)@4
    topRangeY_uid293_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid162_invPolyEval_b(22 downto 6));

    -- sm0_uid342_pT2_uid164_invPolyEval(MULT,341)@4 + 2
    sm0_uid342_pT2_uid164_invPolyEval_a0 <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid282_pT2_uid164_invPolyEval_q);
    sm0_uid342_pT2_uid164_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid293_pT2_uid164_invPolyEval_b);
    sm0_uid342_pT2_uid164_invPolyEval_reset <= areset;
    sm0_uid342_pT2_uid164_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid342_pT2_uid164_invPolyEval_a0,
        datab => sm0_uid342_pT2_uid164_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid342_pT2_uid164_invPolyEval_reset,
        clock => clk,
        result => sm0_uid342_pT2_uid164_invPolyEval_s1
    );
    sm0_uid342_pT2_uid164_invPolyEval_q <= sm0_uid342_pT2_uid164_invPolyEval_s1;

    -- highABits_uid346_pT2_uid164_invPolyEval(BITSELECT,345)@6
    highABits_uid346_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid342_pT2_uid164_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid347_pT2_uid164_invPolyEval(ADD,346)@6
    lev1_a0high_uid347_pT2_uid164_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid346_pT2_uid164_invPolyEval_b(32)) & highABits_uid346_pT2_uid164_invPolyEval_b));
    lev1_a0high_uid347_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid343_pT2_uid164_invPolyEval_q(15)) & sm0_uid343_pT2_uid164_invPolyEval_q));
    lev1_a0high_uid347_pT2_uid164_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid347_pT2_uid164_invPolyEval_a) + SIGNED(lev1_a0high_uid347_pT2_uid164_invPolyEval_b));
    lev1_a0high_uid347_pT2_uid164_invPolyEval_q <= lev1_a0high_uid347_pT2_uid164_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid345_pT2_uid164_invPolyEval(BITSELECT,344)@6
    lowRangeA_uid345_pT2_uid164_invPolyEval_in <= sm0_uid342_pT2_uid164_invPolyEval_q(0 downto 0);
    lowRangeA_uid345_pT2_uid164_invPolyEval_b <= lowRangeA_uid345_pT2_uid164_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid348_pT2_uid164_invPolyEval(BITJOIN,347)@6
    lev1_a0_uid348_pT2_uid164_invPolyEval_q <= lev1_a0high_uid347_pT2_uid164_invPolyEval_q & lowRangeA_uid345_pT2_uid164_invPolyEval_b;

    -- highABits_uid350_pT2_uid164_invPolyEval(BITSELECT,349)@6
    highABits_uid350_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid348_pT2_uid164_invPolyEval_q(34 downto 3));

    -- lev2_a0high_uid351_pT2_uid164_invPolyEval(ADD,350)@6
    lev2_a0high_uid351_pT2_uid164_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => highABits_uid350_pT2_uid164_invPolyEval_b(31)) & highABits_uid350_pT2_uid164_invPolyEval_b));
    lev2_a0high_uid351_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid344_pT2_uid164_invPolyEval_q));
    lev2_a0high_uid351_pT2_uid164_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid351_pT2_uid164_invPolyEval_a) + SIGNED(lev2_a0high_uid351_pT2_uid164_invPolyEval_b));
    lev2_a0high_uid351_pT2_uid164_invPolyEval_q <= lev2_a0high_uid351_pT2_uid164_invPolyEval_o(32 downto 0);

    -- lowRangeA_uid349_pT2_uid164_invPolyEval(BITSELECT,348)@6
    lowRangeA_uid349_pT2_uid164_invPolyEval_in <= lev1_a0_uid348_pT2_uid164_invPolyEval_q(2 downto 0);
    lowRangeA_uid349_pT2_uid164_invPolyEval_b <= lowRangeA_uid349_pT2_uid164_invPolyEval_in(2 downto 0);

    -- lev2_a0_uid352_pT2_uid164_invPolyEval(BITJOIN,351)@6
    lev2_a0_uid352_pT2_uid164_invPolyEval_q <= lev2_a0high_uid351_pT2_uid164_invPolyEval_q & lowRangeA_uid349_pT2_uid164_invPolyEval_b;

    -- osig_uid353_pT2_uid164_invPolyEval(BITSELECT,352)@6
    osig_uid353_pT2_uid164_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid352_pT2_uid164_invPolyEval_q(32 downto 0));
    osig_uid353_pT2_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid353_pT2_uid164_invPolyEval_in(32 downto 8));

    -- redist8_yAddr_uid65_fpCosPiTest_b_4(DELAY,485)
    redist8_yAddr_uid65_fpCosPiTest_b_4 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_yAddr_uid65_fpCosPiTest_b_2_q, xout => redist8_yAddr_uid65_fpCosPiTest_b_4_q, clk => clk, aclr => areset );

    -- memoryC0_uid144_cosPiXTables_lutmem(DUALMEM,440)@4 + 2
    -- in j@20000000
    memoryC0_uid144_cosPiXTables_lutmem_aa <= redist8_yAddr_uid65_fpCosPiTest_b_4_q;
    memoryC0_uid144_cosPiXTables_lutmem_reset0 <= areset;
    memoryC0_uid144_cosPiXTables_lutmem_dmem : altsyncram
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
        init_file => "fp_cos_0002_memoryC0_uid144_cosPiXTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid144_cosPiXTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid144_cosPiXTables_lutmem_aa,
        q_a => memoryC0_uid144_cosPiXTables_lutmem_ir
    );
    memoryC0_uid144_cosPiXTables_lutmem_r <= memoryC0_uid144_cosPiXTables_lutmem_ir(28 downto 0);

    -- rndBit_uid165_invPolyEval(CONSTANT,164)
    rndBit_uid165_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid166_invPolyEval(BITJOIN,165)@6
    cIncludingRoundingBit_uid166_invPolyEval_q <= memoryC0_uid144_cosPiXTables_lutmem_r & rndBit_uid165_invPolyEval_q;

    -- ts2_uid168_invPolyEval(ADD,167)@6
    ts2_uid168_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid166_invPolyEval_q(31)) & cIncludingRoundingBit_uid166_invPolyEval_q));
    ts2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 25 => osig_uid353_pT2_uid164_invPolyEval_b(24)) & osig_uid353_pT2_uid164_invPolyEval_b));
    ts2_uid168_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid168_invPolyEval_a) + SIGNED(ts2_uid168_invPolyEval_b));
    ts2_uid168_invPolyEval_q <= ts2_uid168_invPolyEval_o(32 downto 0);

    -- s2_uid169_invPolyEval(BITSELECT,168)@6
    s2_uid169_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid168_invPolyEval_q(32 downto 1));

    -- fxpSinRes_uid68_fpCosPiTest(BITSELECT,67)@6
    fxpSinRes_uid68_fpCosPiTest_in <= s2_uid169_invPolyEval_b(29 downto 0);
    fxpSinRes_uid68_fpCosPiTest_b <= fxpSinRes_uid68_fpCosPiTest_in(29 downto 5);

    -- aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,200)@6
    aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_in <= fxpSinRes_uid68_fpCosPiTest_b(15 downto 0);
    aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_b <= aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_in(15 downto 11);

    -- n1_uid209_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,208)@6
    n1_uid209_mul2xSinRes_uid69_fpCosPiTest_b <= aboveLeftY_uid201_mul2xSinRes_uid69_fpCosPiTest_b(4 downto 1);

    -- n1_uid217_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,216)@6
    n1_uid217_mul2xSinRes_uid69_fpCosPiTest_b <= n1_uid209_mul2xSinRes_uid69_fpCosPiTest_b(3 downto 1);

    -- n1_uid225_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,224)@6
    n1_uid225_mul2xSinRes_uid69_fpCosPiTest_b <= n1_uid217_mul2xSinRes_uid69_fpCosPiTest_b(2 downto 1);

    -- vStage_uid111_lzcZ_uid59_fpCosPiTest(BITSELECT,110)@2
    vStage_uid111_lzcZ_uid59_fpCosPiTest_in <= redist10_z_uid57_fpCosPiTest_b_2_q(2 downto 0);
    vStage_uid111_lzcZ_uid59_fpCosPiTest_b <= vStage_uid111_lzcZ_uid59_fpCosPiTest_in(2 downto 0);

    -- leftShiftStage0Idx4_uid411_alignedZ_uid60_fpCosPiTest(BITJOIN,410)@2
    leftShiftStage0Idx4_uid411_alignedZ_uid60_fpCosPiTest_q <= vStage_uid111_lzcZ_uid59_fpCosPiTest_b & zs_uid107_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1(MUX,456)@2
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_s <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_s, leftShiftStage0Idx4_uid411_alignedZ_uid60_fpCosPiTest_q, cstZwSwF_uid15_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q <= leftShiftStage0Idx4_uid411_alignedZ_uid60_fpCosPiTest_q;
            WHEN "01" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q <= cstZwSwF_uid15_fpCosPiTest_q;
            WHEN "10" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q <= cstZwSwF_uid15_fpCosPiTest_q;
            WHEN "11" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q <= cstZwSwF_uid15_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest(BITSELECT,406)@2
    leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_in <= redist10_z_uid57_fpCosPiTest_b_2_q(10 downto 0);
    leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_in(10 downto 0);

    -- leftShiftStage0Idx3_uid408_alignedZ_uid60_fpCosPiTest(BITJOIN,407)@2
    leftShiftStage0Idx3_uid408_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage0Idx3Rng24_uid407_alignedZ_uid60_fpCosPiTest_b & leftShiftStage0Idx3Pad24_uid363_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest(BITSELECT,403)@2
    leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_in <= redist10_z_uid57_fpCosPiTest_b_2_q(18 downto 0);
    leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_in(18 downto 0);

    -- leftShiftStage0Idx2_uid405_alignedZ_uid60_fpCosPiTest(BITJOIN,404)@2
    leftShiftStage0Idx2_uid405_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage0Idx2Rng16_uid404_alignedZ_uid60_fpCosPiTest_b & zs_uid115_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest(BITSELECT,400)@2
    leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_in <= redist10_z_uid57_fpCosPiTest_b_2_q(26 downto 0);
    leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_in(26 downto 0);

    -- leftShiftStage0Idx1_uid402_alignedZ_uid60_fpCosPiTest(BITJOIN,401)@2
    leftShiftStage0Idx1_uid402_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage0Idx1Rng8_uid401_alignedZ_uid60_fpCosPiTest_b & cstAllZWE_uid21_fpCosPiTest_q;

    -- leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0(MUX,455)@2
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_s <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_s, redist10_z_uid57_fpCosPiTest_b_2_q, leftShiftStage0Idx1_uid402_alignedZ_uid60_fpCosPiTest_q, leftShiftStage0Idx2_uid405_alignedZ_uid60_fpCosPiTest_q, leftShiftStage0Idx3_uid408_alignedZ_uid60_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q <= redist10_z_uid57_fpCosPiTest_b_2_q;
            WHEN "01" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx1_uid402_alignedZ_uid60_fpCosPiTest_q;
            WHEN "10" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx2_uid405_alignedZ_uid60_fpCosPiTest_q;
            WHEN "11" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage0Idx3_uid408_alignedZ_uid60_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid108_lzcZ_uid59_fpCosPiTest(BITSELECT,107)@2
    rVStage_uid108_lzcZ_uid59_fpCosPiTest_b <= redist10_z_uid57_fpCosPiTest_b_2_q(34 downto 3);

    -- vCount_uid109_lzcZ_uid59_fpCosPiTest(LOGICAL,108)@2
    vCount_uid109_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid108_lzcZ_uid59_fpCosPiTest_b = zs_uid107_lzcZ_uid59_fpCosPiTest_q ELSE "0";

    -- mO_uid110_lzcZ_uid59_fpCosPiTest(CONSTANT,109)
    mO_uid110_lzcZ_uid59_fpCosPiTest_q <= "11111111111111111111111111111";

    -- cStage_uid112_lzcZ_uid59_fpCosPiTest(BITJOIN,111)@2
    cStage_uid112_lzcZ_uid59_fpCosPiTest_q <= vStage_uid111_lzcZ_uid59_fpCosPiTest_b & mO_uid110_lzcZ_uid59_fpCosPiTest_q;

    -- vStagei_uid114_lzcZ_uid59_fpCosPiTest(MUX,113)@2
    vStagei_uid114_lzcZ_uid59_fpCosPiTest_s <= vCount_uid109_lzcZ_uid59_fpCosPiTest_q;
    vStagei_uid114_lzcZ_uid59_fpCosPiTest_combproc: PROCESS (vStagei_uid114_lzcZ_uid59_fpCosPiTest_s, rVStage_uid108_lzcZ_uid59_fpCosPiTest_b, cStage_uid112_lzcZ_uid59_fpCosPiTest_q)
    BEGIN
        CASE (vStagei_uid114_lzcZ_uid59_fpCosPiTest_s) IS
            WHEN "0" => vStagei_uid114_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid108_lzcZ_uid59_fpCosPiTest_b;
            WHEN "1" => vStagei_uid114_lzcZ_uid59_fpCosPiTest_q <= cStage_uid112_lzcZ_uid59_fpCosPiTest_q;
            WHEN OTHERS => vStagei_uid114_lzcZ_uid59_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select(BITSELECT,466)@2
    rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_b <= vStagei_uid114_lzcZ_uid59_fpCosPiTest_q(31 downto 16);
    rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_c <= vStagei_uid114_lzcZ_uid59_fpCosPiTest_q(15 downto 0);

    -- vCount_uid117_lzcZ_uid59_fpCosPiTest(LOGICAL,116)@2
    vCount_uid117_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_b = zs_uid115_lzcZ_uid59_fpCosPiTest_q ELSE "0";

    -- vStagei_uid120_lzcZ_uid59_fpCosPiTest(MUX,119)@2
    vStagei_uid120_lzcZ_uid59_fpCosPiTest_s <= vCount_uid117_lzcZ_uid59_fpCosPiTest_q;
    vStagei_uid120_lzcZ_uid59_fpCosPiTest_combproc: PROCESS (vStagei_uid120_lzcZ_uid59_fpCosPiTest_s, rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_b, rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid120_lzcZ_uid59_fpCosPiTest_s) IS
            WHEN "0" => vStagei_uid120_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid120_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid116_lzcZ_uid59_fpCosPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid120_lzcZ_uid59_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select(BITSELECT,467)@2
    rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_b <= vStagei_uid120_lzcZ_uid59_fpCosPiTest_q(15 downto 8);
    rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_c <= vStagei_uid120_lzcZ_uid59_fpCosPiTest_q(7 downto 0);

    -- vCount_uid123_lzcZ_uid59_fpCosPiTest(LOGICAL,122)@2
    vCount_uid123_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_b = cstAllZWE_uid21_fpCosPiTest_q ELSE "0";

    -- vStagei_uid126_lzcZ_uid59_fpCosPiTest(MUX,125)@2
    vStagei_uid126_lzcZ_uid59_fpCosPiTest_s <= vCount_uid123_lzcZ_uid59_fpCosPiTest_q;
    vStagei_uid126_lzcZ_uid59_fpCosPiTest_combproc: PROCESS (vStagei_uid126_lzcZ_uid59_fpCosPiTest_s, rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_b, rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid126_lzcZ_uid59_fpCosPiTest_s) IS
            WHEN "0" => vStagei_uid126_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid126_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid122_lzcZ_uid59_fpCosPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid126_lzcZ_uid59_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select(BITSELECT,468)@2
    rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_b <= vStagei_uid126_lzcZ_uid59_fpCosPiTest_q(7 downto 4);
    rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_c <= vStagei_uid126_lzcZ_uid59_fpCosPiTest_q(3 downto 0);

    -- vCount_uid129_lzcZ_uid59_fpCosPiTest(LOGICAL,128)@2
    vCount_uid129_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_b = zs_uid127_lzcZ_uid59_fpCosPiTest_q ELSE "0";

    -- vStagei_uid132_lzcZ_uid59_fpCosPiTest(MUX,131)@2
    vStagei_uid132_lzcZ_uid59_fpCosPiTest_s <= vCount_uid129_lzcZ_uid59_fpCosPiTest_q;
    vStagei_uid132_lzcZ_uid59_fpCosPiTest_combproc: PROCESS (vStagei_uid132_lzcZ_uid59_fpCosPiTest_s, rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_b, rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid132_lzcZ_uid59_fpCosPiTest_s) IS
            WHEN "0" => vStagei_uid132_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid132_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid128_lzcZ_uid59_fpCosPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid132_lzcZ_uid59_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select(BITSELECT,469)@2
    rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_b <= vStagei_uid132_lzcZ_uid59_fpCosPiTest_q(3 downto 2);
    rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_c <= vStagei_uid132_lzcZ_uid59_fpCosPiTest_q(1 downto 0);

    -- vCount_uid135_lzcZ_uid59_fpCosPiTest(LOGICAL,134)@2
    vCount_uid135_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_b = zs_uid133_lzcZ_uid59_fpCosPiTest_q ELSE "0";

    -- vStagei_uid138_lzcZ_uid59_fpCosPiTest(MUX,137)@2
    vStagei_uid138_lzcZ_uid59_fpCosPiTest_s <= vCount_uid135_lzcZ_uid59_fpCosPiTest_q;
    vStagei_uid138_lzcZ_uid59_fpCosPiTest_combproc: PROCESS (vStagei_uid138_lzcZ_uid59_fpCosPiTest_s, rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_b, rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid138_lzcZ_uid59_fpCosPiTest_s) IS
            WHEN "0" => vStagei_uid138_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid138_lzcZ_uid59_fpCosPiTest_q <= rVStage_uid134_lzcZ_uid59_fpCosPiTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid138_lzcZ_uid59_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid140_lzcZ_uid59_fpCosPiTest(BITSELECT,139)@2
    rVStage_uid140_lzcZ_uid59_fpCosPiTest_b <= vStagei_uid138_lzcZ_uid59_fpCosPiTest_q(1 downto 1);

    -- vCount_uid141_lzcZ_uid59_fpCosPiTest(LOGICAL,140)@2
    vCount_uid141_lzcZ_uid59_fpCosPiTest_q <= "1" WHEN rVStage_uid140_lzcZ_uid59_fpCosPiTest_b = GND_q ELSE "0";

    -- r_uid142_lzcZ_uid59_fpCosPiTest(BITJOIN,141)@2
    r_uid142_lzcZ_uid59_fpCosPiTest_q <= vCount_uid109_lzcZ_uid59_fpCosPiTest_q & vCount_uid117_lzcZ_uid59_fpCosPiTest_q & vCount_uid123_lzcZ_uid59_fpCosPiTest_q & vCount_uid129_lzcZ_uid59_fpCosPiTest_q & vCount_uid135_lzcZ_uid59_fpCosPiTest_q & vCount_uid141_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select(BITSELECT,470)@2
    leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_b <= r_uid142_lzcZ_uid59_fpCosPiTest_q(5 downto 3);
    leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_c <= r_uid142_lzcZ_uid59_fpCosPiTest_q(2 downto 0);

    -- leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select(BITSELECT,475)@2
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal(MUX,457)@2
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_s <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_combproc: PROCESS (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_s, leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q, leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest(BITSELECT,435)@2
    leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(27 downto 0);
    leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_in(27 downto 0);

    -- leftShiftStage1Idx7_uid437_alignedZ_uid60_fpCosPiTest(BITJOIN,436)@2
    leftShiftStage1Idx7_uid437_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx7Rng7_uid436_alignedZ_uid60_fpCosPiTest_b & leftShiftStage1Idx7Pad7_uid392_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest(BITSELECT,432)@2
    leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(28 downto 0);
    leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_in(28 downto 0);

    -- leftShiftStage1Idx6_uid434_alignedZ_uid60_fpCosPiTest(BITJOIN,433)@2
    leftShiftStage1Idx6_uid434_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx6Rng6_uid433_alignedZ_uid60_fpCosPiTest_b & leftShiftStage1Idx6Pad6_uid389_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest(BITSELECT,429)@2
    leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(29 downto 0);
    leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_in(29 downto 0);

    -- leftShiftStage1Idx5_uid431_alignedZ_uid60_fpCosPiTest(BITJOIN,430)@2
    leftShiftStage1Idx5_uid431_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx5Rng5_uid430_alignedZ_uid60_fpCosPiTest_b & leftShiftStage1Idx5Pad5_uid386_fxpX_uid39_fpCosPiTest_q;

    -- leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest(BITSELECT,426)@2
    leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(30 downto 0);
    leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_in(30 downto 0);

    -- leftShiftStage1Idx4_uid428_alignedZ_uid60_fpCosPiTest(BITJOIN,427)@2
    leftShiftStage1Idx4_uid428_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx4Rng4_uid427_alignedZ_uid60_fpCosPiTest_b & zs_uid127_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1(MUX,461)@2
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_s <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_combproc: PROCESS (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_s, leftShiftStage1Idx4_uid428_alignedZ_uid60_fpCosPiTest_q, leftShiftStage1Idx5_uid431_alignedZ_uid60_fpCosPiTest_q, leftShiftStage1Idx6_uid434_alignedZ_uid60_fpCosPiTest_q, leftShiftStage1Idx7_uid437_alignedZ_uid60_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx4_uid428_alignedZ_uid60_fpCosPiTest_q;
            WHEN "01" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx5_uid431_alignedZ_uid60_fpCosPiTest_q;
            WHEN "10" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx6_uid434_alignedZ_uid60_fpCosPiTest_q;
            WHEN "11" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q <= leftShiftStage1Idx7_uid437_alignedZ_uid60_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest(BITSELECT,423)@2
    leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(31 downto 0);
    leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_in(31 downto 0);

    -- leftShiftStage1Idx3_uid425_alignedZ_uid60_fpCosPiTest(BITJOIN,424)@2
    leftShiftStage1Idx3_uid425_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx3Rng3_uid424_alignedZ_uid60_fpCosPiTest_b & rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q;

    -- leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest(BITSELECT,420)@2
    leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(32 downto 0);
    leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_in(32 downto 0);

    -- leftShiftStage1Idx2_uid422_alignedZ_uid60_fpCosPiTest(BITJOIN,421)@2
    leftShiftStage1Idx2_uid422_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx2Rng2_uid421_alignedZ_uid60_fpCosPiTest_b & zs_uid133_lzcZ_uid59_fpCosPiTest_q;

    -- leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest(BITSELECT,417)@2
    leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_in <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q(33 downto 0);
    leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_b <= leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_in(33 downto 0);

    -- leftShiftStage1Idx1_uid419_alignedZ_uid60_fpCosPiTest(BITJOIN,418)@2
    leftShiftStage1Idx1_uid419_alignedZ_uid60_fpCosPiTest_q <= leftShiftStage1Idx1Rng1_uid418_alignedZ_uid60_fpCosPiTest_b & GND_q;

    -- leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0(MUX,460)@2
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_s <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b;
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_combproc: PROCESS (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_s, leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q, leftShiftStage1Idx1_uid419_alignedZ_uid60_fpCosPiTest_q, leftShiftStage1Idx2_uid422_alignedZ_uid60_fpCosPiTest_q, leftShiftStage1Idx3_uid425_alignedZ_uid60_fpCosPiTest_q)
    BEGIN
        CASE (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage0_uid416_alignedZ_uid60_fpCosPiTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx1_uid419_alignedZ_uid60_fpCosPiTest_q;
            WHEN "10" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx2_uid422_alignedZ_uid60_fpCosPiTest_q;
            WHEN "11" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q <= leftShiftStage1Idx3_uid425_alignedZ_uid60_fpCosPiTest_q;
            WHEN OTHERS => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select(BITSELECT,476)@2
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_b <= leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_c(1 downto 0);
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c <= leftShiftStageSel5Dto3_uid415_alignedZ_uid60_fpCosPiTest_merged_bit_select_c(2 downto 2);

    -- leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal(MUX,462)@2
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_s <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_selLSBs_merged_bit_select_c;
    leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_combproc: PROCESS (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_s, leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q, leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_s) IS
            WHEN "0" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_q <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_0_q;
            WHEN "1" => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_q <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignedZLow_uid61_fpCosPiTest(BITSELECT,60)@2
    alignedZLow_uid61_fpCosPiTest_b <= leftShiftStage1_uid439_alignedZ_uid60_fpCosPiTest_mfinal_q(34 downto 11);

    -- redist9_alignedZLow_uid61_fpCosPiTest_b_4(DELAY,486)
    redist9_alignedZLow_uid61_fpCosPiTest_b_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignedZLow_uid61_fpCosPiTest_b, xout => redist9_alignedZLow_uid61_fpCosPiTest_b_4_q, clk => clk, aclr => areset );

    -- aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,199)@6
    aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_in <= redist9_alignedZLow_uid61_fpCosPiTest_b_4_q(5 downto 0);
    aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_b <= aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_in(5 downto 1);

    -- n0_uid210_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,209)@6
    n0_uid210_mul2xSinRes_uid69_fpCosPiTest_b <= aboveLeftX_uid200_mul2xSinRes_uid69_fpCosPiTest_b(4 downto 1);

    -- n0_uid218_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,217)@6
    n0_uid218_mul2xSinRes_uid69_fpCosPiTest_b <= n0_uid210_mul2xSinRes_uid69_fpCosPiTest_b(3 downto 1);

    -- n0_uid226_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,225)@6
    n0_uid226_mul2xSinRes_uid69_fpCosPiTest_b <= n0_uid218_mul2xSinRes_uid69_fpCosPiTest_b(2 downto 1);

    -- sm1_uid241_mul2xSinRes_uid69_fpCosPiTest(MULT,240)@6 + 2
    sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_a0 <= n0_uid226_mul2xSinRes_uid69_fpCosPiTest_b;
    sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_b0 <= n1_uid225_mul2xSinRes_uid69_fpCosPiTest_b;
    sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_reset <= areset;
    sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_component : lpm_mult
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
        dataa => sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_a0,
        datab => sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_b0,
        clken => VCC_q(0),
        aclr => sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_reset,
        clock => clk,
        result => sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_s1
    );
    sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_q <= sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_s1;

    -- lev1_a2_uid249_mul2xSinRes_uid69_fpCosPiTest(BITJOIN,248)@8
    lev1_a2_uid249_mul2xSinRes_uid69_fpCosPiTest_q <= VCC_q & sm1_uid241_mul2xSinRes_uid69_fpCosPiTest_q;

    -- lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest(ADD,252)@8
    lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c);
    lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000" & lev1_a2_uid249_mul2xSinRes_uid69_fpCosPiTest_q);
    lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_a) + UNSIGNED(lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_b));
    lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_q <= lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_o(33 downto 0);

    -- rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,198)@6
    rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_in <= fxpSinRes_uid68_fpCosPiTest_b(6 downto 0);
    rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_b <= rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_in(6 downto 2);

    -- n1_uid207_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,206)@6
    n1_uid207_mul2xSinRes_uid69_fpCosPiTest_b <= rightBottomY_uid199_mul2xSinRes_uid69_fpCosPiTest_b(4 downto 1);

    -- n1_uid215_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,214)@6
    n1_uid215_mul2xSinRes_uid69_fpCosPiTest_b <= n1_uid207_mul2xSinRes_uid69_fpCosPiTest_b(3 downto 1);

    -- n1_uid223_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,222)@6
    n1_uid223_mul2xSinRes_uid69_fpCosPiTest_b <= n1_uid215_mul2xSinRes_uid69_fpCosPiTest_b(2 downto 1);

    -- rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,197)@6
    rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_in <= redist9_alignedZLow_uid61_fpCosPiTest_b_4_q(14 downto 0);
    rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_b <= rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_in(14 downto 10);

    -- n0_uid208_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,207)@6
    n0_uid208_mul2xSinRes_uid69_fpCosPiTest_b <= rightBottomX_uid198_mul2xSinRes_uid69_fpCosPiTest_b(4 downto 1);

    -- n0_uid216_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,215)@6
    n0_uid216_mul2xSinRes_uid69_fpCosPiTest_b <= n0_uid208_mul2xSinRes_uid69_fpCosPiTest_b(3 downto 1);

    -- n0_uid224_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,223)@6
    n0_uid224_mul2xSinRes_uid69_fpCosPiTest_b <= n0_uid216_mul2xSinRes_uid69_fpCosPiTest_b(2 downto 1);

    -- sm0_uid240_mul2xSinRes_uid69_fpCosPiTest(MULT,239)@6 + 2
    sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_a0 <= n0_uid224_mul2xSinRes_uid69_fpCosPiTest_b;
    sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_b0 <= n1_uid223_mul2xSinRes_uid69_fpCosPiTest_b;
    sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_reset <= areset;
    sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_component : lpm_mult
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
        dataa => sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_a0,
        datab => sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_reset,
        clock => clk,
        result => sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_s1
    );
    sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_q <= sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_s1;

    -- lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest(ADD,246)@8
    lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c);
    lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_b <= STD_LOGIC_VECTOR("0000000000" & sm0_uid240_mul2xSinRes_uid69_fpCosPiTest_q);
    lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_a) + UNSIGNED(lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_b));
    lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_q <= lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_o(13 downto 0);

    -- rightBottomY_uid194_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,193)@6
    rightBottomY_uid194_mul2xSinRes_uid69_fpCosPiTest_b <= fxpSinRes_uid68_fpCosPiTest_b(24 downto 16);

    -- rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,190)@6
    rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_in <= redist9_alignedZLow_uid61_fpCosPiTest_b_4_q(5 downto 0);
    rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_b <= rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_in(5 downto 0);

    -- rightBottomX_mergedSignalTM_uid192_mul2xSinRes_uid69_fpCosPiTest(BITJOIN,191)@6
    rightBottomX_mergedSignalTM_uid192_mul2xSinRes_uid69_fpCosPiTest_q <= rightBottomX_bottomRange_uid191_mul2xSinRes_uid69_fpCosPiTest_b & rightBottomX_bottomExtension_uid190_mul2xSinRes_uid69_fpCosPiTest_q;

    -- sm1_uid239_mul2xSinRes_uid69_fpCosPiTest(MULT,238)@6 + 2
    sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_a0 <= rightBottomX_mergedSignalTM_uid192_mul2xSinRes_uid69_fpCosPiTest_q;
    sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_b0 <= rightBottomY_uid194_mul2xSinRes_uid69_fpCosPiTest_b;
    sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_reset <= areset;
    sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 9,
        lpm_widthp => 18,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_a0,
        datab => sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_b0,
        clken => VCC_q(0),
        aclr => sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_reset,
        clock => clk,
        result => sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_s1
    );
    sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_q <= sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_s1;

    -- lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select(BITSELECT,471)@8
    lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b <= sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_q(4 downto 0);
    lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c <= sm1_uid239_mul2xSinRes_uid69_fpCosPiTest_q(17 downto 5);

    -- lev1_a1_uid248_mul2xSinRes_uid69_fpCosPiTest(BITJOIN,247)@8
    lev1_a1_uid248_mul2xSinRes_uid69_fpCosPiTest_q <= lev1_a1high_uid247_mul2xSinRes_uid69_fpCosPiTest_q & lowRangeA_uid245_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b;

    -- aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,186)@6
    aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_in <= fxpSinRes_uid68_fpCosPiTest_b(6 downto 0);
    aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_b <= aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_in(6 downto 0);

    -- aboveLeftY_mergedSignalTM_uid188_mul2xSinRes_uid69_fpCosPiTest(BITJOIN,187)@6
    aboveLeftY_mergedSignalTM_uid188_mul2xSinRes_uid69_fpCosPiTest_q <= aboveLeftY_bottomRange_uid187_mul2xSinRes_uid69_fpCosPiTest_b & zs_uid133_lzcZ_uid59_fpCosPiTest_q;

    -- aboveLeftX_uid185_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,184)@6
    aboveLeftX_uid185_mul2xSinRes_uid69_fpCosPiTest_b <= redist9_alignedZLow_uid61_fpCosPiTest_b_4_q(23 downto 15);

    -- sm0_uid238_mul2xSinRes_uid69_fpCosPiTest(MULT,237)@6 + 2
    sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_a0 <= aboveLeftX_uid185_mul2xSinRes_uid69_fpCosPiTest_b;
    sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_b0 <= aboveLeftY_mergedSignalTM_uid188_mul2xSinRes_uid69_fpCosPiTest_q;
    sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_reset <= areset;
    sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 9,
        lpm_widthp => 18,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_a0,
        datab => sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_reset,
        clock => clk,
        result => sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_s1
    );
    sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_q <= sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_s1;

    -- topRangeY_uid180_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,179)@6
    topRangeY_uid180_mul2xSinRes_uid69_fpCosPiTest_b <= fxpSinRes_uid68_fpCosPiTest_b(24 downto 7);

    -- topRangeX_uid179_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,178)@6
    topRangeX_uid179_mul2xSinRes_uid69_fpCosPiTest_b <= redist9_alignedZLow_uid61_fpCosPiTest_b_4_q(23 downto 6);

    -- sm0_uid237_mul2xSinRes_uid69_fpCosPiTest(MULT,236)@6 + 2
    sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_a0 <= topRangeX_uid179_mul2xSinRes_uid69_fpCosPiTest_b;
    sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_b0 <= topRangeY_uid180_mul2xSinRes_uid69_fpCosPiTest_b;
    sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_reset <= areset;
    sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_component : lpm_mult
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
        dataa => sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_a0,
        datab => sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_reset,
        clock => clk,
        result => sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_s1
    );
    sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_q <= sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_s1;

    -- lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest(ADD,243)@8
    lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & sm0_uid237_mul2xSinRes_uid69_fpCosPiTest_q);
    lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & sm0_uid238_mul2xSinRes_uid69_fpCosPiTest_q);
    lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_a) + UNSIGNED(lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_b));
    lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_q <= lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_o(36 downto 0);

    -- lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest(ADD,249)@8
    lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & lev1_a0_uid244_mul2xSinRes_uid69_fpCosPiTest_q);
    lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & lev1_a1_uid248_mul2xSinRes_uid69_fpCosPiTest_q);
    lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_a) + UNSIGNED(lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_b));
    lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_q <= lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_o(37 downto 0);

    -- lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select(BITSELECT,472)@8
    lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b <= lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_q(4 downto 0);
    lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_c <= lev2_a0_uid250_mul2xSinRes_uid69_fpCosPiTest_q(37 downto 5);

    -- lev3_a0_uid254_mul2xSinRes_uid69_fpCosPiTest(BITJOIN,253)@8
    lev3_a0_uid254_mul2xSinRes_uid69_fpCosPiTest_q <= lev3_a0high_uid253_mul2xSinRes_uid69_fpCosPiTest_q & lowRangeA_uid251_mul2xSinRes_uid69_fpCosPiTest_merged_bit_select_b;

    -- osig_uid255_mul2xSinRes_uid69_fpCosPiTest(BITSELECT,254)@8
    osig_uid255_mul2xSinRes_uid69_fpCosPiTest_in <= lev3_a0_uid254_mul2xSinRes_uid69_fpCosPiTest_q(35 downto 0);
    osig_uid255_mul2xSinRes_uid69_fpCosPiTest_b <= osig_uid255_mul2xSinRes_uid69_fpCosPiTest_in(35 downto 10);

    -- normBit_uid70_fpCosPiTest(BITSELECT,69)@8
    normBit_uid70_fpCosPiTest_b <= STD_LOGIC_VECTOR(osig_uid255_mul2xSinRes_uid69_fpCosPiTest_b(25 downto 25));

    -- cstAllZWF_uid9_fpCosPiTest(CONSTANT,8)
    cstAllZWF_uid9_fpCosPiTest_q <= "00000000000000000000000";

    -- rndExpUpdate_uid79_fpCosPiTest(BITJOIN,78)@8
    rndExpUpdate_uid79_fpCosPiTest_q <= normBit_uid70_fpCosPiTest_b & cstAllZWF_uid9_fpCosPiTest_q & VCC_q;

    -- redist0_r_uid142_lzcZ_uid59_fpCosPiTest_q_6(DELAY,477)
    redist0_r_uid142_lzcZ_uid59_fpCosPiTest_q_6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid142_lzcZ_uid59_fpCosPiTest_q, xout => redist0_r_uid142_lzcZ_uid59_fpCosPiTest_q_6_q, clk => clk, aclr => areset );

    -- cstBiasM1_uid11_fpCosPiTest(CONSTANT,10)
    cstBiasM1_uid11_fpCosPiTest_q <= "01111110";

    -- expHardCase_uid62_fpCosPiTest(SUB,61)@8
    expHardCase_uid62_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid11_fpCosPiTest_q);
    expHardCase_uid62_fpCosPiTest_b <= STD_LOGIC_VECTOR("000" & redist0_r_uid142_lzcZ_uid59_fpCosPiTest_q_6_q);
    expHardCase_uid62_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid62_fpCosPiTest_a) - UNSIGNED(expHardCase_uid62_fpCosPiTest_b));
    expHardCase_uid62_fpCosPiTest_q <= expHardCase_uid62_fpCosPiTest_o(8 downto 0);

    -- expP_uid63_fpCosPiTest(BITSELECT,62)@8
    expP_uid63_fpCosPiTest_in <= expHardCase_uid62_fpCosPiTest_q(7 downto 0);
    expP_uid63_fpCosPiTest_b <= expP_uid63_fpCosPiTest_in(7 downto 0);

    -- highRes_uid71_fpCosPiTest(BITSELECT,70)@8
    highRes_uid71_fpCosPiTest_in <= osig_uid255_mul2xSinRes_uid69_fpCosPiTest_b(24 downto 0);
    highRes_uid71_fpCosPiTest_b <= highRes_uid71_fpCosPiTest_in(24 downto 1);

    -- lowRes_uid72_fpCosPiTest(BITSELECT,71)@8
    lowRes_uid72_fpCosPiTest_in <= osig_uid255_mul2xSinRes_uid69_fpCosPiTest_b(23 downto 0);
    lowRes_uid72_fpCosPiTest_b <= lowRes_uid72_fpCosPiTest_in(23 downto 0);

    -- fracRCompPreRnd_uid73_fpCosPiTest(MUX,72)@8
    fracRCompPreRnd_uid73_fpCosPiTest_s <= normBit_uid70_fpCosPiTest_b;
    fracRCompPreRnd_uid73_fpCosPiTest_combproc: PROCESS (fracRCompPreRnd_uid73_fpCosPiTest_s, lowRes_uid72_fpCosPiTest_b, highRes_uid71_fpCosPiTest_b)
    BEGIN
        CASE (fracRCompPreRnd_uid73_fpCosPiTest_s) IS
            WHEN "0" => fracRCompPreRnd_uid73_fpCosPiTest_q <= lowRes_uid72_fpCosPiTest_b;
            WHEN "1" => fracRCompPreRnd_uid73_fpCosPiTest_q <= highRes_uid71_fpCosPiTest_b;
            WHEN OTHERS => fracRCompPreRnd_uid73_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracPreRnd_uid74_fpCosPiTest(BITJOIN,73)@8
    expFracPreRnd_uid74_fpCosPiTest_q <= expP_uid63_fpCosPiTest_b & fracRCompPreRnd_uid73_fpCosPiTest_q;

    -- expFracComp_uid80_fpCosPiTest(ADD,79)@8
    expFracComp_uid80_fpCosPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid74_fpCosPiTest_q);
    expFracComp_uid80_fpCosPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid79_fpCosPiTest_q);
    expFracComp_uid80_fpCosPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid80_fpCosPiTest_a) + UNSIGNED(expFracComp_uid80_fpCosPiTest_b));
    expFracComp_uid80_fpCosPiTest_q <= expFracComp_uid80_fpCosPiTest_o(32 downto 0);

    -- fracRComp_uid81_fpCosPiTest_merged_bit_select(BITSELECT,465)@8
    fracRComp_uid81_fpCosPiTest_merged_bit_select_in <= expFracComp_uid80_fpCosPiTest_q(31 downto 0);
    fracRComp_uid81_fpCosPiTest_merged_bit_select_b <= fracRComp_uid81_fpCosPiTest_merged_bit_select_in(23 downto 1);
    fracRComp_uid81_fpCosPiTest_merged_bit_select_c <= fracRComp_uid81_fpCosPiTest_merged_bit_select_in(31 downto 24);

    -- expXIsMax_uid25_fpCosPiTest(LOGICAL,24)@0
    expXIsMax_uid25_fpCosPiTest_q <= "1" WHEN expX_uid6_fpCosPiTest_merged_bit_select_b = cstAllOWE_uid8_fpCosPiTest_q ELSE "0";

    -- invExpXIsMax_uid30_fpCosPiTest(LOGICAL,29)@0
    invExpXIsMax_uid30_fpCosPiTest_q <= not (expXIsMax_uid25_fpCosPiTest_q);

    -- excZ_x_uid24_fpCosPiTest(LOGICAL,23)@0
    excZ_x_uid24_fpCosPiTest_q <= "1" WHEN expX_uid6_fpCosPiTest_merged_bit_select_b = cstAllZWE_uid21_fpCosPiTest_q ELSE "0";

    -- InvExpXIsZero_uid31_fpCosPiTest(LOGICAL,30)@0
    InvExpXIsZero_uid31_fpCosPiTest_q <= not (excZ_x_uid24_fpCosPiTest_q);

    -- excR_x_uid32_fpCosPiTest(LOGICAL,31)@0
    excR_x_uid32_fpCosPiTest_q <= InvExpXIsZero_uid31_fpCosPiTest_q and invExpXIsMax_uid30_fpCosPiTest_q;

    -- xIsHalf_uid88_fpCosPiTest(LOGICAL,87)@0
    xIsHalf_uid88_fpCosPiTest_q <= excR_x_uid32_fpCosPiTest_q and fxpXFracHalf_uid46_fpCosPiTest_q and invCosXIsOne_uid83_fpCosPiTest_q and invXEvenInt_uid84_fpCosPiTest_q;

    -- redist5_xIsHalf_uid88_fpCosPiTest_q_8(DELAY,482)
    redist5_xIsHalf_uid88_fpCosPiTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIsHalf_uid88_fpCosPiTest_q, xout => redist5_xIsHalf_uid88_fpCosPiTest_q_8_q, clk => clk, aclr => areset );

    -- expRPostExc1_uid96_fpCosPiTest(MUX,95)@8
    expRPostExc1_uid96_fpCosPiTest_s <= redist5_xIsHalf_uid88_fpCosPiTest_q_8_q;
    expRPostExc1_uid96_fpCosPiTest_combproc: PROCESS (expRPostExc1_uid96_fpCosPiTest_s, fracRComp_uid81_fpCosPiTest_merged_bit_select_c, cstAllZWE_uid21_fpCosPiTest_q)
    BEGIN
        CASE (expRPostExc1_uid96_fpCosPiTest_s) IS
            WHEN "0" => expRPostExc1_uid96_fpCosPiTest_q <= fracRComp_uid81_fpCosPiTest_merged_bit_select_c;
            WHEN "1" => expRPostExc1_uid96_fpCosPiTest_q <= cstAllZWE_uid21_fpCosPiTest_q;
            WHEN OTHERS => expRPostExc1_uid96_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpXFracZero_uid45_fpCosPiTest(LOGICAL,44)@0
    fxpXFracZero_uid45_fpCosPiTest_b <= STD_LOGIC_VECTOR("0" & cstZwSwF_uid15_fpCosPiTest_q);
    fxpXFracZero_uid45_fpCosPiTest_q <= "1" WHEN fxpXFrac_uid42_fpCosPiTest_b = fxpXFracZero_uid45_fpCosPiTest_b ELSE "0";

    -- fracZCosNotOne_uid85_fpCosPiTest(LOGICAL,84)@0
    fracZCosNotOne_uid85_fpCosPiTest_q <= fxpXFracZero_uid45_fpCosPiTest_q and invCosXIsOne_uid83_fpCosPiTest_q;

    -- evenIntCosNotOneFZ_uid86_fpCosPiTest(LOGICAL,85)@0
    evenIntCosNotOneFZ_uid86_fpCosPiTest_q <= xEvenInt_uid33_fpCosPiTest_c or fracZCosNotOne_uid85_fpCosPiTest_q;

    -- xIsInt_uid87_fpCosPiTest(LOGICAL,86)@0
    xIsInt_uid87_fpCosPiTest_q <= excR_x_uid32_fpCosPiTest_q and evenIntCosNotOneFZ_uid86_fpCosPiTest_q;

    -- xIntOrXZOrCosOne_uid98_fpCosPiTest(LOGICAL,97)@0 + 1
    xIntOrXZOrCosOne_uid98_fpCosPiTest_qi <= xIsInt_uid87_fpCosPiTest_q or excZ_x_uid24_fpCosPiTest_q or cosXIsOne_uid34_fpCosPiTest_c;
    xIntOrXZOrCosOne_uid98_fpCosPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIntOrXZOrCosOne_uid98_fpCosPiTest_qi, xout => xIntOrXZOrCosOne_uid98_fpCosPiTest_q, clk => clk, aclr => areset );

    -- redist2_xIntOrXZOrCosOne_uid98_fpCosPiTest_q_8(DELAY,479)
    redist2_xIntOrXZOrCosOne_uid98_fpCosPiTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIntOrXZOrCosOne_uid98_fpCosPiTest_q, xout => redist2_xIntOrXZOrCosOne_uid98_fpCosPiTest_q_8_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid26_fpCosPiTest(LOGICAL,25)@0
    fracXIsZero_uid26_fpCosPiTest_q <= "1" WHEN cstAllZWF_uid9_fpCosPiTest_q = expX_uid6_fpCosPiTest_merged_bit_select_c ELSE "0";

    -- excI_x_uid28_fpCosPiTest(LOGICAL,27)@0
    excI_x_uid28_fpCosPiTest_q <= expXIsMax_uid25_fpCosPiTest_q and fracXIsZero_uid26_fpCosPiTest_q;

    -- fracXIsNotZero_uid27_fpCosPiTest(LOGICAL,26)@0
    fracXIsNotZero_uid27_fpCosPiTest_q <= not (fracXIsZero_uid26_fpCosPiTest_q);

    -- excN_x_uid29_fpCosPiTest(LOGICAL,28)@0
    excN_x_uid29_fpCosPiTest_q <= expXIsMax_uid25_fpCosPiTest_q and fracXIsNotZero_uid27_fpCosPiTest_q;

    -- excRNaN_uid89_fpCosPiTest(LOGICAL,88)@0 + 1
    excRNaN_uid89_fpCosPiTest_qi <= excN_x_uid29_fpCosPiTest_q or excI_x_uid28_fpCosPiTest_q;
    excRNaN_uid89_fpCosPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid89_fpCosPiTest_qi, xout => excRNaN_uid89_fpCosPiTest_q, clk => clk, aclr => areset );

    -- redist4_excRNaN_uid89_fpCosPiTest_q_8(DELAY,481)
    redist4_excRNaN_uid89_fpCosPiTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid89_fpCosPiTest_q, xout => redist4_excRNaN_uid89_fpCosPiTest_q_8_q, clk => clk, aclr => areset );

    -- rInfOrNaN_uid97_fpCosPiTest(LOGICAL,96)@8
    rInfOrNaN_uid97_fpCosPiTest_q <= GND_q or redist4_excRNaN_uid89_fpCosPiTest_q_8_q;

    -- concXIntOrXZOrCosOneRInfOrNaN_uid99_fpCosPiTest(BITJOIN,98)@8
    concXIntOrXZOrCosOneRInfOrNaN_uid99_fpCosPiTest_q <= redist2_xIntOrXZOrCosOne_uid98_fpCosPiTest_q_8_q & rInfOrNaN_uid97_fpCosPiTest_q;

    -- expRPostExc_uid100_fpCosPiTest(MUX,99)@8
    expRPostExc_uid100_fpCosPiTest_s <= concXIntOrXZOrCosOneRInfOrNaN_uid99_fpCosPiTest_q;
    expRPostExc_uid100_fpCosPiTest_combproc: PROCESS (expRPostExc_uid100_fpCosPiTest_s, expRPostExc1_uid96_fpCosPiTest_q, cstAllOWE_uid8_fpCosPiTest_q, cstBias_uid10_fpCosPiTest_q)
    BEGIN
        CASE (expRPostExc_uid100_fpCosPiTest_s) IS
            WHEN "00" => expRPostExc_uid100_fpCosPiTest_q <= expRPostExc1_uid96_fpCosPiTest_q;
            WHEN "01" => expRPostExc_uid100_fpCosPiTest_q <= cstAllOWE_uid8_fpCosPiTest_q;
            WHEN "10" => expRPostExc_uid100_fpCosPiTest_q <= cstBias_uid10_fpCosPiTest_q;
            WHEN "11" => expRPostExc_uid100_fpCosPiTest_q <= cstBias_uid10_fpCosPiTest_q;
            WHEN OTHERS => expRPostExc_uid100_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid92_fpCosPiTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpCosPiTest_q <= "00000000000000000000001";

    -- bigCond_uid90_fpCosPiTest(LOGICAL,89)@0 + 1
    bigCond_uid90_fpCosPiTest_qi <= cosXIsOne_uid34_fpCosPiTest_c or xIsInt_uid87_fpCosPiTest_q or fxpXFracHalf_uid46_fpCosPiTest_q or excZ_x_uid24_fpCosPiTest_q or xIsHalf_uid88_fpCosPiTest_q or GND_q;
    bigCond_uid90_fpCosPiTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => bigCond_uid90_fpCosPiTest_qi, xout => bigCond_uid90_fpCosPiTest_q, clk => clk, aclr => areset );

    -- redist3_bigCond_uid90_fpCosPiTest_q_8(DELAY,480)
    redist3_bigCond_uid90_fpCosPiTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => bigCond_uid90_fpCosPiTest_q, xout => redist3_bigCond_uid90_fpCosPiTest_q_8_q, clk => clk, aclr => areset );

    -- fracRPostExc1_uid91_fpCosPiTest(MUX,90)@8
    fracRPostExc1_uid91_fpCosPiTest_s <= redist3_bigCond_uid90_fpCosPiTest_q_8_q;
    fracRPostExc1_uid91_fpCosPiTest_combproc: PROCESS (fracRPostExc1_uid91_fpCosPiTest_s, fracRComp_uid81_fpCosPiTest_merged_bit_select_b, cstAllZWF_uid9_fpCosPiTest_q)
    BEGIN
        CASE (fracRPostExc1_uid91_fpCosPiTest_s) IS
            WHEN "0" => fracRPostExc1_uid91_fpCosPiTest_q <= fracRComp_uid81_fpCosPiTest_merged_bit_select_b;
            WHEN "1" => fracRPostExc1_uid91_fpCosPiTest_q <= cstAllZWF_uid9_fpCosPiTest_q;
            WHEN OTHERS => fracRPostExc1_uid91_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid93_fpCosPiTest(MUX,92)@8
    fracRPostExc_uid93_fpCosPiTest_s <= redist4_excRNaN_uid89_fpCosPiTest_q_8_q;
    fracRPostExc_uid93_fpCosPiTest_combproc: PROCESS (fracRPostExc_uid93_fpCosPiTest_s, fracRPostExc1_uid91_fpCosPiTest_q, oneFracRPostExc2_uid92_fpCosPiTest_q)
    BEGIN
        CASE (fracRPostExc_uid93_fpCosPiTest_s) IS
            WHEN "0" => fracRPostExc_uid93_fpCosPiTest_q <= fracRPostExc1_uid91_fpCosPiTest_q;
            WHEN "1" => fracRPostExc_uid93_fpCosPiTest_q <= oneFracRPostExc2_uid92_fpCosPiTest_q;
            WHEN OTHERS => fracRPostExc_uid93_fpCosPiTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid105_fpCosPiTest(BITJOIN,104)@8
    R_uid105_fpCosPiTest_q <= redist1_signR_uid104_fpCosPiTest_q_8_q & expRPostExc_uid100_fpCosPiTest_q & fracRPostExc_uid93_fpCosPiTest_q;

    -- xOut(GPOUT,4)@8
    q <= R_uid105_fpCosPiTest_q;

END normal;
