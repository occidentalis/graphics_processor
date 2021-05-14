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

-- VHDL created from fp_dot_0002
-- VHDL created on Tue May 11 15:21:01 2021


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

entity fp_dot_0002 is
    port (
        a0 : in std_logic_vector(31 downto 0);  -- float32_m23
        b0 : in std_logic_vector(31 downto 0);  -- float32_m23
        a1 : in std_logic_vector(31 downto 0);  -- float32_m23
        b1 : in std_logic_vector(31 downto 0);  -- float32_m23
        a2 : in std_logic_vector(31 downto 0);  -- float32_m23
        b2 : in std_logic_vector(31 downto 0);  -- float32_m23
        a3 : in std_logic_vector(31 downto 0);  -- float32_m23
        b3 : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_dot_0002;

architecture normal of fp_dot_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid29_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid43_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid47_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid72_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid109_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid114_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid115_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid128_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid142_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid146_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid149_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid171_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid196_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid208_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid213_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid214_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid227_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid241_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid245_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid248_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid270_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid295_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid307_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid312_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid313_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid318_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid322_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid324_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid325_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid326_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid332_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid336_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid338_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid339_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid340_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid344_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid347_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid361_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid363_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid364_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid366_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid368_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid369_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid370_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid372_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid384_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid389_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid390_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid391_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid392_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid394_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid405_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid406_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid409_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid410_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid412_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid413_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid414_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid429_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid431_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid432_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid433_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid443_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid445_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid446_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid448_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid462_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid470_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid474_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid475_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid477_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid480_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid483_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid492_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid501_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid503_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid504_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid506_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid510_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid513_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid514_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfEQMin_uid516_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid518_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid521_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid522_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid524_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid525_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid527_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid528_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid529_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid530_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid532_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid533_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid534_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid535_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid536_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid537_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid538_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid539_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid540_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid541_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid542_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid553_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid554_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid556_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid557_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid558_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid573_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid575_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid576_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid577_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid587_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid589_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid590_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid592_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid606_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid614_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid618_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid619_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid621_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAAddOp_uid624_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid627_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid636_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid645_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid647_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid648_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid650_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid654_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid657_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid658_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfEQMin_uid660_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid662_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid665_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid666_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid668_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid669_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid671_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid672_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid673_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid674_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid676_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid677_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid678_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid679_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid680_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid681_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid682_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid683_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid684_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid685_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid686_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid697_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid698_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid717_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid720_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid721_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid730_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid731_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid734_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid735_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid750_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid758_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid763_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid765_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAAddOp_uid768_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid771_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid780_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid789_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid792_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid794_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid798_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid801_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid802_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfEQMin_uid804_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid806_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid810_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid812_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid813_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid815_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid816_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid817_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid818_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid820_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid821_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid822_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid823_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid824_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid825_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid826_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid827_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid829_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid830_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid839_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid855_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid858_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid863_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid869_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid875_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid880_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid881_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid886_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid889_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid894_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid900_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid906_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid911_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid912_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid917_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid920_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid925_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid931_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid937_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid942_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid943_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid950_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid952_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid953_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid955_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid956_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3_uid958_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid959_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx4_uid961_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid962_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (39 downto 0);
    signal rightShiftStage0Idx5_uid964_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid965_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx6_uid967_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid971_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid973_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid974_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid976_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid977_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3_uid979_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid980_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid982_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid983_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage1Idx5_uid985_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid986_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx6_uid988_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid989_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage1Idx7_uid991_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid1001_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid1004_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid1007_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid1010_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid1013_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid1016_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid1022_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid1025_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid1028_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid1036_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid1038_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid1039_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid1041_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid1042_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3_uid1044_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid1045_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4_uid1047_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid1048_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5_uid1050_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid1051_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6_uid1053_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid1057_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid1059_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid1060_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid1062_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid1063_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3_uid1065_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid1066_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid1068_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid1069_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5_uid1071_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid1072_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6_uid1074_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid1075_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7_uid1077_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid1087_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid1090_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid1093_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid1096_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid1099_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid1102_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid1108_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid1111_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid1114_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid1122_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid1124_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid1125_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid1127_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid1128_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3_uid1130_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid1131_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4_uid1133_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid1134_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5_uid1136_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid1137_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6_uid1139_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid1143_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid1145_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid1146_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid1148_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid1149_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3_uid1151_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid1152_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid1154_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid1155_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5_uid1157_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid1158_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6_uid1160_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid1161_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7_uid1163_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid1173_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid1176_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid1179_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid1182_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid1185_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid1188_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid1194_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid1197_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid1200_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist3_aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist5_cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist44_signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist54_signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist70_signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist86_signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist97_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,488)
    cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11100";

    -- zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,852)
    zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000000000";

    -- frac_x_uid318_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,317)@0
    frac_x_uid318_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= a3(22 downto 0);

    -- cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,17)
    cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000000000000000000";

    -- fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,320)@0 + 1
    fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid318_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1408)
    redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,16)
    cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "11111111";

    -- expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,309)@0
    expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= a3(30 downto 23);

    -- expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,319)@0 + 1
    expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1409)
    redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,322)@2
    excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q;

    -- cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,18)
    cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000";

    -- expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,310)@0
    expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= b3(30 downto 23);

    -- excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,332)@0 + 1
    excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1407)
    redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid390_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,389)@2
    excYZAndExcXI_uid390_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- frac_y_uid332_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,331)@0
    frac_y_uid332_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= b3(22 downto 0);

    -- fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,334)@0 + 1
    fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid332_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1405)
    redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,333)@0 + 1
    expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1406)
    redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,336)@2
    excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q;

    -- excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,318)@0 + 1
    excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= "1" WHEN expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1410)
    redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid391_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,390)@2
    excXZAndExcYI_uid391_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- ZeroTimesInf_uid392_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,391)@2
    ZeroTimesInf_uid392_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= excXZAndExcYI_uid391_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excYZAndExcXI_uid390_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- fracXIsNotZero_uid336_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,335)@2
    fracXIsNotZero_uid336_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist46_fracXIsZero_uid335_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- excN_y_uid338_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,337)@2
    excN_y_uid338_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and fracXIsNotZero_uid336_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- fracXIsNotZero_uid322_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,321)@2
    fracXIsNotZero_uid322_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist49_fracXIsZero_uid321_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- excN_x_uid324_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,323)@2
    excN_x_uid324_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and fracXIsNotZero_uid322_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,392)@2 + 1
    excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excN_x_uid324_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excN_y_uid338_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or ZeroTimesInf_uid392_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid405_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,404)@3
    invExcRNaN_uid405_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q);

    -- signY_uid313_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,312)@0
    signY_uid313_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(b3(31 downto 31));

    -- signX_uid312_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,311)@0
    signX_uid312_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(a3(31 downto 31));

    -- signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,351)@0 + 1
    signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= signX_uid312_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b xor signY_uid313_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
    signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist44_signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_3(DELAY,1403)
    redist44_signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist44_signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid406_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,405)@3
    signRPostExc_uid406_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist44_signR_uid352_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_3_q and invExcRNaN_uid405_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- ofracX_uid344_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,343)@0
    ofracX_uid344_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= VCC_q & frac_x_uid318_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select(BITSELECT,1330)@0
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid344_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(17 downto 0);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid344_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid347_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,346)@0
    ofracY_uid347_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= VCC_q & frac_y_uid332_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select(BITSELECT,1331)@0
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid347_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(17 downto 0);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid347_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6(MULT,1266)@0 + 2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_a0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_b0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_reset <= areset;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_a0,
        datab => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_s1
    );
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_s1;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15(BITSHIFT,1275)@2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_qint <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3(MULT,1263)@0 + 2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_a0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_b0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_reset <= areset;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_a0,
        datab => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_s1
    );
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_s1;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13(BITSHIFT,1273)@2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_qint <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9(MULT,1269)@0 + 2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_a0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_b0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_reset <= areset;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 6,
        lpm_widthb => 6,
        lpm_widthp => 12,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_a0,
        datab => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_s1
    );
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_s1;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0(MULT,1260)@0 + 2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_a0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_b0 <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_reset <= areset;
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_a0,
        datab => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_s1
    );
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_s1;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_join_12(BITJOIN,1272)@2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_join_12_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im9_q & prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_im0_q;

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0(ADD,1277)@2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_join_12_q);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_13_q);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_b));
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0(ADD,1278)@2
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_0_0_q);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_align_15_q);
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_b));
    prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_q <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,850)@2
    osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= prodXY_uid850_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,352)@2
    normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(47 downto 47));

    -- roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,69)
    roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "010";

    -- fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,354)@2
    fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,355)@2
    fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(MUX,356)@2
    fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s <= normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
    fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s, fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b, fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= fracRPostNormLow_uid356_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= fracRPostNormHigh_uid355_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,364)@2
    fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,358)@2
    extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(MUX,359)@2
    extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s <= normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
    extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= extraStickyBitOfProd_uid359_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,357)@2
    stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= osig_uid851_prod_uid351_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(21 downto 0);
    stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid361_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,360)@2
    stickyExtendedRange_uid361_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= extraStickyBit_uid360_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & stickyRange_uid358_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b;

    -- stickyRangeComparator_uid363_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,362)@2
    stickyRangeComparator_uid363_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid361_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid364_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,363)@2
    sticky_uid364_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (stickyRangeComparator_uid363_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q);

    -- lrs_uid366_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,365)@2
    lrs_uid366_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= fracRPostNorm1dto0_uid365_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b & sticky_uid364_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid368_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,367)@2
    roundBitDetectionPattern_uid368_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "1" WHEN lrs_uid366_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q = roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid369_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,368)@2
    roundBit_uid369_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (roundBitDetectionPattern_uid368_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid372_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,371)@2
    roundBitAndNormalizationOp_uid372_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= GND_q & normalizeBit_uid353_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b & cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid369_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,51)
    biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "0001111111";

    -- expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(ADD,347)@0 + 1
    expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid310_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b);
    expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid311_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b);
    expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a) + UNSIGNED(expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o(8 downto 0);

    -- redist45_expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2(DELAY,1404)
    redist45_expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, xout => redist45_expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(SUB,349)@2
    expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist45_expSum_uid348_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q));
    expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a) - SIGNED(expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid370_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,369)@2
    expFracPreRound_uid370_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= expSumMBias_uid350_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & fracRPostNorm_uid357_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(ADD,372)@2
    expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid370_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(34)) & expFracPreRound_uid370_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q));
    expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid372_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q));
    expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,374)@2
    expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,375)@2
    expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(7 downto 0);

    -- redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1(DELAY,1401)
    redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b, xout => redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(COMPARE,378)@2
    expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(11)) & expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a) - SIGNED(expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n(0) <= not (expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o(13));

    -- invExpXIsMax_uid339_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,338)@2
    invExpXIsMax_uid339_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist47_expXIsMax_uid334_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- InvExpXIsZero_uid340_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,339)@2
    InvExpXIsZero_uid340_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,340)@2
    excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= InvExpXIsZero_uid340_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and invExpXIsMax_uid339_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- invExpXIsMax_uid325_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,324)@2
    invExpXIsMax_uid325_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist50_expXIsMax_uid320_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- InvExpXIsZero_uid326_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,325)@2
    InvExpXIsZero_uid326_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= not (redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q);

    -- excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,326)@2
    excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= InvExpXIsZero_uid326_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and invExpXIsMax_uid325_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,387)@2 + 1
    ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and expOvf_uid379_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n;
    ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,386)@2 + 1
    excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,385)@2 + 1
    excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,384)@2 + 1
    excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excI_x_uid323_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and excI_y_uid337_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRInf_uid389_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,388)@3
    excRInf_uid389_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= excXIAndExcYI_uid385_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excXRAndExcYI_uid386_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excYRAndExcXI_uid387_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or ExcROvfAndInReg_uid388_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(COMPARE,376)@2
    expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b(11)) & expRPreExcExt_uid375_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_a) - SIGNED(expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b));
    expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n(0) <= not (expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_o(13));

    -- excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,382)@2 + 1
    excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q and expUdf_uid377_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_n;
    excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,381)@2 + 1
    excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and excR_x_uid327_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,380)@2 + 1
    excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and excR_y_uid341_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,379)@2 + 1
    excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi <= redist51_excZ_x_uid319_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q and redist48_excZ_y_uid333_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q_2_q;
    excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_qi, xout => excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRZero_uid384_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOGICAL,383)@3
    excRZero_uid384_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= excXZAndExcYZ_uid380_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excXZAndExcYR_uid381_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excYZAndExcXR_uid382_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q or excZC3_uid383_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- concExc_uid394_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,393)@3
    concExc_uid394_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= excRNaN_uid393_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & excRInf_uid389_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & excRZero_uid384_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(LOOKUP,394)@3
    excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_combproc: PROCESS (concExc_uid394_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid394_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(MUX,403)@3
    expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s <= excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_combproc: PROCESS (expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist42_expRPreExc_uid376_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,98)
    oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000000000000000001";

    -- fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITSELECT,373)@2
    fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in <= expFracRPostRounding_uid373_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b <= fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_in(23 downto 1);

    -- redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1(DELAY,1402)
    redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b, xout => redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(MUX,398)@3
    fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s <= excREnc_uid395_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;
    fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= redist43_fracRPreExc_uid374_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct(BITJOIN,406)@3
    R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q <= signRPostExc_uid406_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & expRPostExc_uid404_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q & fracRPostExc_uid399_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q;

    -- sigY_uid556_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,555)@3
    sigY_uid556_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(31 downto 31));

    -- expY_uid558_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,557)@3
    expY_uid558_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(30 downto 23);

    -- fracY_uid557_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,556)@3
    fracY_uid557_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(22 downto 0);

    -- ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,558)@3
    ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= sigY_uid556_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & expY_uid558_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & fracY_uid557_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- frac_x_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,218)@0
    frac_x_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= a2(22 downto 0);

    -- fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,221)@0 + 1
    fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1422)
    redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,210)@0
    expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= a2(30 downto 23);

    -- expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,220)@0 + 1
    expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1423)
    redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,223)@2
    excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q;

    -- expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,211)@0
    expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= b2(30 downto 23);

    -- excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,233)@0 + 1
    excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1419)
    redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,290)@2
    excYZAndExcXI_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- frac_y_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,232)@0
    frac_y_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= b2(22 downto 0);

    -- fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,235)@0 + 1
    fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1416)
    redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,234)@0 + 1
    expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1417)
    redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,237)@2
    excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q;

    -- excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,219)@0 + 1
    excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1425)
    redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,291)@2
    excXZAndExcYI_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- ZeroTimesInf_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,292)@2
    ZeroTimesInf_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXZAndExcYI_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYZAndExcXI_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- fracXIsNotZero_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,236)@2
    fracXIsNotZero_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist57_fracXIsZero_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q);

    -- excN_y_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,238)@2
    excN_y_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and fracXIsNotZero_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- fracXIsNotZero_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,222)@2
    fracXIsNotZero_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist63_fracXIsZero_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q);

    -- excN_x_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,224)@2
    excN_x_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q and fracXIsNotZero_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,293)@2 + 1
    excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= excN_x_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excN_y_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or ZeroTimesInf_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,305)@3
    invExcRNaN_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- signY_uid214_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,213)@0
    signY_uid214_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(b2(31 downto 31));

    -- signX_uid213_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,212)@0
    signX_uid213_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(a2(31 downto 31));

    -- signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,252)@0 + 1
    signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= signX_uid213_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b xor signY_uid214_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist54_signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,1413)
    redist54_signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist54_signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid307_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,306)@3
    signRPostExc_uid307_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist54_signR_uid253_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and invExcRNaN_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- ofracX_uid245_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,244)@0
    ofracX_uid245_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= VCC_q & frac_x_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select(BITSELECT,1328)@0
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid245_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(17 downto 0);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid245_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid248_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,247)@0
    ofracY_uid248_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= VCC_q & frac_y_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select(BITSELECT,1329)@0
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid248_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(17 downto 0);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid248_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6(MULT,1247)@0 + 2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset <= areset;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0,
        datab => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1
    );
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15(BITSHIFT,1256)@2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3(MULT,1244)@0 + 2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset <= areset;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0,
        datab => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1
    );
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13(BITSHIFT,1254)@2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9(MULT,1250)@0 + 2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset <= areset;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 6,
        lpm_widthb => 6,
        lpm_widthp => 12,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0,
        datab => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1
    );
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0(MULT,1241)@0 + 2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0 <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset <= areset;
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0,
        datab => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1
    );
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12(BITJOIN,1253)@2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q & prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q;

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0(ADD,1258)@2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b));
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0(ADD,1259)@2
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q);
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b));
    prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,847)@2
    osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= prodXY_uid847_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,253)@2
    normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(47 downto 47));

    -- fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,255)@2
    fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,256)@2
    fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,257)@2
    fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNormLow_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNormHigh_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,265)@2
    fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,259)@2
    extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,260)@2
    extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= extraStickyBitOfProd_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,258)@2
    stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid848_prod_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(21 downto 0);
    stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,261)@2
    stickyExtendedRange_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= extraStickyBit_uid261_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & stickyRange_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- stickyRangeComparator_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,263)@2
    stickyRangeComparator_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,264)@2
    sticky_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (stickyRangeComparator_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- lrs_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,266)@2
    lrs_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNorm1dto0_uid266_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b & sticky_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,268)@2
    roundBitDetectionPattern_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "1" WHEN lrs_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q = roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid270_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,269)@2
    roundBit_uid270_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (roundBitDetectionPattern_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,272)@2
    roundBitAndNormalizationOp_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= GND_q & normalizeBit_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b & cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid270_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(ADD,248)@0 + 1
    expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b);
    expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b);
    expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) + UNSIGNED(expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(8 downto 0);

    -- redist55_expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,1414)
    redist55_expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist55_expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(SUB,250)@2
    expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist55_expSum_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q));
    expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,270)@2
    expFracPreRound_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSumMBias_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & fracRPostNorm_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(ADD,273)@2
    expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(34)) & expFracPreRound_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q));
    expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q));
    expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,275)@2
    expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,276)@2
    expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(7 downto 0);

    -- redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1(DELAY,1411)
    redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, xout => redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(COMPARE,279)@2 + 1
    expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(11)) & expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n(0) <= not (expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(13));

    -- redist59_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,1418)
    redist59_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist58_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, xout => redist59_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,239)@3
    invExpXIsMax_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist59_expXIsMax_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,1420)
    redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist60_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, xout => redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid241_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,240)@3
    InvExpXIsZero_uid241_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,241)@3
    excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= InvExpXIsZero_uid241_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and invExpXIsMax_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- redist65_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,1424)
    redist65_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist64_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, xout => redist65_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,225)@3
    invExpXIsMax_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist65_expXIsMax_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,1426)
    redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist66_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, xout => redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid227_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,226)@3
    InvExpXIsZero_uid227_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,227)@3
    excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= InvExpXIsZero_uid227_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and invExpXIsMax_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,288)@3
    ExcROvfAndInReg_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and expOvf_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n;

    -- redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1(DELAY,1421)
    redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,287)@3
    excYRAndExcXI_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q;

    -- redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1(DELAY,1415)
    redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,286)@3
    excXRAndExcYI_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q;

    -- excXIAndExcYI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,285)@3
    excXIAndExcYI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist62_excI_x_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q and redist56_excI_y_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_1_q;

    -- excRInf_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,289)@3
    excRInf_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXIAndExcYI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excXRAndExcYI_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYRAndExcXI_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or ExcROvfAndInReg_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(COMPARE,277)@2 + 1
    expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(11)) & expRPreExcExt_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n(0) <= not (expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(13));

    -- excZC3_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,283)@3
    excZC3_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and expUdf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n;

    -- excYZAndExcXR_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,282)@3
    excYZAndExcXR_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excR_x_uid228_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXZAndExcYR_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,281)@3
    excXZAndExcYR_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excR_y_uid242_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXZAndExcYZ_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,280)@3
    excXZAndExcYZ_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist67_excZ_x_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and redist61_excZ_y_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q;

    -- excRZero_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,284)@3
    excRZero_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXZAndExcYZ_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excXZAndExcYR_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYZAndExcXR_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excZC3_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- concExc_uid295_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,294)@3
    concExc_uid295_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excRNaN_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & excRInf_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & excRZero_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOOKUP,295)@3
    excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (concExc_uid295_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid295_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,304)@3
    expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist52_expRPreExc_uid277_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,274)@2
    fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= expFracRPostRounding_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(23 downto 1);

    -- redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1(DELAY,1412)
    redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, xout => redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,299)@3
    fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= excREnc_uid296_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist53_fracRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,307)@3
    R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= signRPostExc_uid307_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & expRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & fracRPostExc_uid300_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expFracY_uid554_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,553)@3
    expFracY_uid554_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= R_uid407_dotProdIEEEAssemblymult_3_uid9_fpScalarProduct_q(30 downto 0);

    -- expFracX_uid553_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,552)@3
    expFracX_uid553_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(30 downto 0);

    -- xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(COMPARE,554)@3
    xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expFracX_uid553_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b);
    xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expFracY_uid554_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b);
    xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) - UNSIGNED(xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n(0) <= not (xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(32));

    -- bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,563)@3
    bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n;
    bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
            WHEN "1" => bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,597)@3
    sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(31 downto 31));

    -- redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1(DELAY,1379)
    redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, xout => redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,562)@3
    aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= xGTEy_uid555_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n;
    aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q)
    BEGIN
        CASE (aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= ypn_uid559_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "1" => aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= R_uid308_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
            WHEN OTHERS => aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,596)@3
    sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(31 downto 31));

    -- redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1(DELAY,1381)
    redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, xout => redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,598)@4
    effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q xor redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q;

    -- exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,581)@3
    exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(30 downto 0);
    exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(30 downto 23);

    -- exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,567)@3
    exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(30 downto 0);
    exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(30 downto 23);

    -- expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(SUB,606)@3
    expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b);
    expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b);
    expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) - UNSIGNED(expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(8 downto 0);

    -- cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,463)
    cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11001";

    -- shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(COMPARE,609)@3
    shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_c(0) <= shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(10);

    -- iShiftedOut_uid614_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,613)@3
    iShiftedOut_uid614_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (shiftedOut_uid610_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_c);

    -- rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,967)
    rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,989)
    rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000";

    -- rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,965)
    rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "000000000000000000000000000000000000000000000000";

    -- excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,583)@3
    excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,590)@3
    InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,582)@3
    frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= bSig_uid564_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(22 downto 0);
    frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(22 downto 0);

    -- fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,602)@3
    fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;
            WHEN "1" => fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid606_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,605)@3
    oFracB_uid606_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & fracBz_uid603_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,466)
    padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,611)@3
    rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= oFracB_uid606_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rightShiftStage0Idx6Rng48_uid1051_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1050)@3
    rightShiftStage0Idx6Rng48_uid1051_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 48);

    -- rightShiftStage0Idx6_uid1053_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1052)@3
    rightShiftStage0Idx6_uid1053_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx6Rng48_uid1051_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,962)
    rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000000000000000000000000000000000";

    -- rightShiftStage0Idx5Rng40_uid1048_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1047)@3
    rightShiftStage0Idx5Rng40_uid1048_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 40);

    -- rightShiftStage0Idx5_uid1050_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1049)@3
    rightShiftStage0Idx5_uid1050_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx5Rng40_uid1048_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,959)
    rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng32_uid1045_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1044)@3
    rightShiftStage0Idx4Rng32_uid1045_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 32);

    -- rightShiftStage0Idx4_uid1047_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1046)@3
    rightShiftStage0Idx4_uid1047_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx4Rng32_uid1045_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1(MUX,1297)@3
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s, rightShiftStage0Idx4_uid1047_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx5_uid1050_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx6_uid1053_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx4_uid1047_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx5_uid1050_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx6_uid1053_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,956)
    rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "000000000000000000000000";

    -- rightShiftStage0Idx3Rng24_uid1042_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1041)@3
    rightShiftStage0Idx3Rng24_uid1042_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 24);

    -- rightShiftStage0Idx3_uid1044_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1043)@3
    rightShiftStage0Idx3_uid1044_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx3Rng24_uid1042_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0Idx2Rng16_uid1039_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1038)@3
    rightShiftStage0Idx2Rng16_uid1039_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 16);

    -- rightShiftStage0Idx2_uid1041_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1040)@3
    rightShiftStage0Idx2_uid1041_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx2Rng16_uid1039_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0Idx1Rng8_uid1036_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1035)@3
    rightShiftStage0Idx1Rng8_uid1036_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 8);

    -- rightShiftStage0Idx1_uid1038_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1037)@3
    rightShiftStage0Idx1_uid1038_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & rightShiftStage0Idx1Rng8_uid1036_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0(MUX,1296)@3
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s, rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx1_uid1038_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx2_uid1041_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage0Idx3_uid1044_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightPaddedIn_uid612_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx1_uid1038_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx2_uid1041_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx3_uid1044_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1334)@3
    rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_in <= expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(5 downto 0);
    rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1352)@3
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal(MUX,1298)@3
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s, rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q, rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid1075_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1074)@3
    rightShiftStage1Idx7Rng7_uid1075_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid1077_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1076)@3
    rightShiftStage1Idx7_uid1077_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx7Rng7_uid1075_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,986)
    rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "000000";

    -- rightShiftStage1Idx6Rng6_uid1072_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1071)@3
    rightShiftStage1Idx6Rng6_uid1072_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid1074_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1073)@3
    rightShiftStage1Idx6_uid1074_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx6Rng6_uid1072_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,983)
    rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00000";

    -- rightShiftStage1Idx5Rng5_uid1069_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1068)@3
    rightShiftStage1Idx5Rng5_uid1069_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid1071_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1070)@3
    rightShiftStage1Idx5_uid1071_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx5Rng5_uid1069_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,866)
    zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000";

    -- rightShiftStage1Idx4Rng4_uid1066_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1065)@3
    rightShiftStage1Idx4Rng4_uid1066_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid1068_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1067)@3
    rightShiftStage1Idx4_uid1068_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx4Rng4_uid1066_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1(MUX,1302)@3
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s, rightShiftStage1Idx4_uid1068_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage1Idx5_uid1071_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage1Idx6_uid1074_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage1Idx7_uid1077_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx4_uid1068_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "01" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx5_uid1071_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx6_uid1074_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx7_uid1077_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,977)
    rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid1063_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1062)@3
    rightShiftStage1Idx3Rng3_uid1063_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid1065_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1064)@3
    rightShiftStage1Idx3_uid1065_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx3Rng3_uid1063_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,872)
    zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00";

    -- rightShiftStage1Idx2Rng2_uid1060_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1059)@3
    rightShiftStage1Idx2Rng2_uid1060_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid1062_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1061)@3
    rightShiftStage1Idx2_uid1062_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx2Rng2_uid1060_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage1Idx1Rng1_uid1057_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1056)@3
    rightShiftStage1Idx1Rng1_uid1057_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid1059_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1058)@3
    rightShiftStage1Idx1_uid1059_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= GND_q & rightShiftStage1Idx1Rng1_uid1057_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0(MUX,1301)@3
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s, rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q, rightShiftStage1Idx1_uid1059_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage1Idx2_uid1062_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, rightShiftStage1Idx3_uid1065_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage0_uid1056_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q;
            WHEN "01" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx1_uid1059_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx2_uid1062_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx3_uid1065_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1353)@3
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c(1 downto 0);
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1055_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c(2 downto 2);

    -- rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal(MUX,1303)@3
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s, rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q, rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,947)
    wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "110001";

    -- shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(COMPARE,1034)@3
    shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid607_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n(0) <= not (shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(10));

    -- r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,1080)@3
    r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= shiftedOut_uid1035_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_n;
    r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage1_uid1079_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q;
            WHEN "1" => r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,614)@3 + 1
    alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid614_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(0)) & iShiftedOut_uid614_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q));
    alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= r_uid1081_alignmentShifter_uid611_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;
    alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1335)@4
    stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(22 downto 0);
    stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= alignFracBPostShiftOut_uid615_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(48 downto 23);

    -- fracBAddOp_uid627_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,626)@4
    fracBAddOp_uid627_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= GND_q & stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c;

    -- fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,627)@4
    fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(0)) & effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q));
    fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= fracBAddOp_uid627_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q xor fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,478)
    zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "01";

    -- frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,568)@3
    frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= aSig_uid563_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(22 downto 0);
    frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(22 downto 0);

    -- redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1(DELAY,1387)
    redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, xout => redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid618_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,617)@4
    cmpEQ_stickyBits_cZwF_uid618_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN stickyBits_uid616_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- effSubInvSticky_uid621_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,620)@4
    effSubInvSticky_uid621_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and cmpEQ_stickyBits_cZwF_uid618_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracAAddOp_uid624_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,623)@4
    fracAAddOp_uid624_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q & GND_q & effSubInvSticky_uid621_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(ADD,628)@4
    fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid624_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid628_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) + UNSIGNED(fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,629)@4
    rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracAddResult_uid629_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid619_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,618)@4
    invCmpEQ_stickyBits_cZwF_uid619_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (cmpEQ_stickyBits_cZwF_uid618_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,630)@4
    fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rangeFracAddResultMwfp3Dto0_uid630_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & invCmpEQ_stickyBits_cZwF_uid619_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,884)@4
    rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(27 downto 12);

    -- vCount_uid886_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,885)@4
    vCount_uid886_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,887)@4
    vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(11 downto 0);
    vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(11 downto 0);

    -- mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,855)
    mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1111";

    -- cStage_uid889_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,888)@4
    cStage_uid889_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,890)@4
    vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= vCount_uid886_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, cStage_uid889_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid885_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;
            WHEN "1" => vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cStage_uid889_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1342)@4
    rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(15 downto 8);
    rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= vStagei_uid891_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(7 downto 0);

    -- vCount_uid894_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,893)@4
    vCount_uid894_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,896)@4
    vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= vCount_uid894_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b, rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid893_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1343)@4
    rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(7 downto 4);
    rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= vStagei_uid897_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(3 downto 0);

    -- vCount_uid900_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,899)@4
    vCount_uid900_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b = zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,902)@4
    vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= vCount_uid900_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b, rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid899_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1344)@4
    rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(3 downto 2);
    rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= vStagei_uid903_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(1 downto 0);

    -- vCount_uid906_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,905)@4
    vCount_uid906_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b = zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,908)@4
    vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= vCount_uid906_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b, rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rVStage_uid905_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid911_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,910)@4
    rVStage_uid911_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= vStagei_uid909_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(1 downto 1);

    -- vCount_uid912_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,911)@4
    vCount_uid912_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rVStage_uid911_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = GND_q ELSE "0";

    -- r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,912)@4
    r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= vCount_uid886_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & vCount_uid894_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & vCount_uid900_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & vCount_uid906_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & vCount_uid912_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,633)@4 + 1
    aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q = cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";
    aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invAMinusA_uid676_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,675)@5
    invAMinusA_uid676_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2(DELAY,1382)
    redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, xout => redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,584)@3 + 1
    expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN exp_bSig_uid582_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2(DELAY,1385)
    redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, xout => redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid590_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,589)@5
    invExpXIsMax_uid590_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q);

    -- redist24_InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2(DELAY,1383)
    redist24_InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, xout => redist24_InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excR_bSig_uid592_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,591)@5
    excR_bSig_uid592_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist24_InvExpXIsZero_uid591_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q and invExpXIsMax_uid590_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1(DELAY,1388)
    redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, xout => redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,570)@4 + 1
    expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid576_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,575)@5
    invExpXIsMax_uid576_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,569)@4 + 1
    excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid577_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,576)@5
    InvExpXIsZero_uid577_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,577)@5
    excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= InvExpXIsZero_uid577_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and invExpXIsMax_uid576_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- signRReg_uid677_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,676)@5
    signRReg_uid677_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and excR_bSig_uid592_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q and invAMinusA_uid676_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2(DELAY,1380)
    redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q, xout => redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2(DELAY,1386)
    redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, xout => redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid681_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,680)@5
    excAZBZSigASigB_uid681_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q and redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q and redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q;

    -- excBZARSigA_uid682_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,681)@5
    excBZARSigA_uid682_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q and excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q;

    -- signRZero_uid683_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,682)@5
    signRZero_uid683_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excBZARSigA_uid682_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or excAZBZSigASigB_uid681_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,585)@3 + 1
    fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_bSig_uid583_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2(DELAY,1384)
    redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, xout => redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,587)@5
    excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q and redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q;

    -- sigBBInf_uid678_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,677)@5
    sigBBInf_uid678_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist21_sigB_uid598_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q and excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,571)@4 + 1
    fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = redist28_frac_aSig_uid569_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q ELSE "0";
    fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_qi, xout => fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,573)@5
    excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- sigAAInf_uid679_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,678)@5
    sigAAInf_uid679_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist23_sigA_uid597_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_2_q and excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- signRInf_uid680_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,679)@5
    signRInf_uid680_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= sigAAInf_uid679_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or sigBBInf_uid678_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- signRInfRZRReg_uid684_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,683)@5
    signRInfRZRReg_uid684_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= signRInf_uid680_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or signRZero_uid683_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or signRReg_uid677_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracXIsNotZero_uid587_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,586)@5
    fracXIsNotZero_uid587_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (redist25_fracXIsZero_uid586_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q);

    -- excN_bSig_uid589_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,588)@5
    excN_bSig_uid589_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= redist26_expXIsMax_uid585_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q and fracXIsNotZero_uid587_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- fracXIsNotZero_uid573_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,572)@5
    fracXIsNotZero_uid573_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (fracXIsZero_uid572_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- excN_aSig_uid575_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,574)@5
    excN_aSig_uid575_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expXIsMax_uid571_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and fracXIsNotZero_uid573_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- excRNaN2_uid671_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,670)@5
    excRNaN2_uid671_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excN_aSig_uid575_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or excN_bSig_uid589_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1(DELAY,1378)
    redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, xout => redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid672_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,671)@5
    excAIBISub_uid672_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1_q;

    -- excRNaN_uid673_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,672)@5
    excRNaN_uid673_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excAIBISub_uid672_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or excRNaN2_uid671_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- invExcRNaN_uid685_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,684)@5
    invExcRNaN_uid685_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (excRNaN_uid673_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- signRPostExc_uid686_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,685)@5
    signRPostExc_uid686_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= invExcRNaN_uid685_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and signRInfRZRReg_uid684_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,501)
    cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1112)@5
    leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(24 downto 0);

    -- leftShiftStage1Idx3_uid1114_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1113)@5
    leftShiftStage1Idx3_uid1114_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx3Rng3_uid1113_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1109)@5
    leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(25 downto 0);

    -- leftShiftStage1Idx2_uid1111_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1110)@5
    leftShiftStage1Idx2_uid1111_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx2Rng2_uid1110_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1106)@5
    leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(26 downto 0);

    -- leftShiftStage1Idx1_uid1108_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1107)@5
    leftShiftStage1Idx1_uid1108_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx1Rng1_uid1107_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & GND_q;

    -- leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,1016)
    leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000000000000000000000";

    -- leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1100)@4
    leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(3 downto 0);

    -- leftShiftStage0Idx6_uid1102_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1101)@4
    leftShiftStage0Idx6_uid1102_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0Idx6Rng24_uid1101_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1097)@4
    leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(7 downto 0);

    -- leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,1010)
    leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00000000000000000000";

    -- leftShiftStage0Idx5_uid1099_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1098)@4
    leftShiftStage0Idx5_uid1099_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0Idx5Rng20_uid1098_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx4_uid1096_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1095)@4
    leftShiftStage0Idx4_uid1096_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= vStage_uid888_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1(MUX,1307)@4
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_combproc: PROCESS (leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s, leftShiftStage0Idx4_uid1096_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx5_uid1099_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx6_uid1102_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx4_uid1096_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx5_uid1099_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx6_uid1102_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1091)@4
    leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(15 downto 0);

    -- leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,1004)
    leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "000000000000";

    -- leftShiftStage0Idx3_uid1093_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1092)@4
    leftShiftStage0Idx3_uid1093_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0Idx3Rng12_uid1092_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1088)@4
    leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(19 downto 0);

    -- leftShiftStage0Idx2_uid1090_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1089)@4
    leftShiftStage0Idx2_uid1090_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0Idx2Rng8_uid1089_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,1085)@4
    leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(23 downto 0);

    -- leftShiftStage0Idx1_uid1087_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,1086)@4
    leftShiftStage0Idx1_uid1087_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0Idx1Rng4_uid1086_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0(MUX,1306)@4
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_combproc: PROCESS (leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s, fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx1_uid1087_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx2_uid1090_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage0Idx3_uid1093_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= fracGRS_uid631_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx1_uid1087_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx2_uid1090_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx3_uid1093_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select(BITSELECT,1345)@4
    leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b <= r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(4 downto 2);
    leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c <= r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(1 downto 0);

    -- leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1357)@4
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal(MUX,1308)@4 + 1
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_s) IS
                WHEN "0" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_0_q;
                WHEN "1" => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_msplit_1_q;
                WHEN OTHERS => leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c_1(DELAY,1359)
    redist0_leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c, xout => redist0_leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,1115)@5
    leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= redist0_leftShiftStageSel4Dto2_uid1104_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_merged_bit_select_c_1_q;
    leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q, leftShiftStage1Idx1_uid1108_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage1Idx2_uid1111_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q, leftShiftStage1Idx3_uid1114_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "00" => leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage0_uid1105_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_mfinal_q;
            WHEN "01" => leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx1_uid1108_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "10" => leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx2_uid1111_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN "11" => leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= leftShiftStage1Idx3_uid1114_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,643)@5
    LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(4 downto 0));
    LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(4 downto 4));

    -- Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,642)@5
    Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(3 downto 0));
    Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(3 downto 3));

    -- Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,641)@5
    Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(2 downto 0));
    Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(2 downto 2));

    -- Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,640)@5
    Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(1 downto 0));
    Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(1 downto 1));

    -- Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,639)@5
    Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(0 downto 0));
    Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(0 downto 0));

    -- rndBitCond_uid645_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,644)@5
    rndBitCond_uid645_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= LSB_uid644_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & Guard_uid643_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & Round_uid642_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & Sticky1_uid641_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b & Sticky0_uid640_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rBi_uid647_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,646)@5
    rBi_uid647_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rndBitCond_uid645_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q = cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- roundBit_uid648_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,647)@5
    roundBit_uid648_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= not (rBi_uid647_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);

    -- oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,492)
    oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00000001";

    -- expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(ADD,637)@4
    expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & redist29_exp_aSig_uid568_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b_1_q);
    expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) + UNSIGNED(expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(8 downto 0);

    -- expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(SUB,638)@4 + 1
    expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expInc_uid638_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & r_uid913_lzCountVal_uid632_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) - UNSIGNED(expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(9 downto 0);

    -- fracPostNorm_uid636_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,635)@5
    fracPostNorm_uid636_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= leftShiftStage1_uid1116_fracPostNormExt_uid635_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(27 downto 1);

    -- fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,648)@5
    fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= fracPostNorm_uid636_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b(25 downto 0);
    fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(25 downto 2);

    -- expFracR_uid650_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,649)@5
    expFracR_uid650_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expPostNorm_uid639_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & fracPostNormRndRange_uid649_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(ADD,650)@5
    rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expFracR_uid650_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid648_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q);
    rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_a) + UNSIGNED(rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b));
    rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_o(34 downto 0);

    -- expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,663)@5
    expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(31 downto 0);
    expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(31 downto 24);

    -- rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,655)@5
    rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(33 downto 0);
    rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(33 downto 32);

    -- rOvfExtraBits_uid657_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,656)@5
    rOvfExtraBits_uid657_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rndExpFracOvfBits_uid656_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,507)
    wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0011111111";

    -- rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,652)@5
    rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(33 downto 0);
    rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(33 downto 24);

    -- rOvfEQMax_uid654_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,653)@5
    rOvfEQMax_uid654_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rOvf_uid658_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,657)@5
    rOvf_uid658_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rOvfEQMax_uid654_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or rOvfExtraBits_uid657_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- regInputs_uid665_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,664)@5
    regInputs_uid665_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excR_aSig_uid578_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and excR_bSig_uid592_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- rInfOvf_uid668_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,667)@5
    rInfOvf_uid668_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= regInputs_uid665_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q and rOvf_uid658_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- excRInfVInC_uid669_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,668)@5
    excRInfVInC_uid669_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rInfOvf_uid668_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excN_bSig_uid589_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excN_aSig_uid575_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excI_bSig_uid588_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excI_aSig_uid574_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & redist19_effSub_uid599_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_1_q;

    -- excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOOKUP,669)@5
    excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (excRInfVInC_uid669_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid669_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q) IS
            WHEN "000000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "000001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "000010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "000011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "000100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "000101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "000110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "000111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "001111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "010111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "011111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "100001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "100111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "101111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "110111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111000" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111001" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111010" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111011" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111100" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111101" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111110" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "111111" => excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,660)@5
    rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= STD_LOGIC_VECTOR(rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(33 downto 0));
    rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(33 downto 33));

    -- wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(CONSTANT,514)
    wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0000000000";

    -- rUdfEQMin_uid660_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,659)@5
    rUdfEQMin_uid660_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1" WHEN rndExp_uid653_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b = wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rUdf_uid662_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOGICAL,661)@5
    rUdf_uid662_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= rUdfEQMin_uid660_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q or rUdfExtraBit_uid661_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;

    -- excRZeroVInC_uid666_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,665)@5
    excRZeroVInC_uid666_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= aMinusA_uid634_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & rUdf_uid662_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & regInputs_uid665_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & redist27_excZ_bSig_uid564_uid584_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q_2_q & excZ_aSig_uid563_uid570_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOOKUP,666)@5
    excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (excRZeroVInC_uid666_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid666_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q) IS
            WHEN "00000" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00001" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00010" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00011" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "00100" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00101" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00110" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "00111" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01000" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01001" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01010" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01011" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "01100" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "01101" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01110" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "01111" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10000" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10001" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10010" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10011" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "10100" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "10101" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10110" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "10111" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11000" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11001" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11010" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11011" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "11100" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "1";
            WHEN "11101" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11110" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN "11111" => excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid674_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,673)@5
    concExc_uid674_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= excRNaN_uid673_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excRInf_uid670_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & excRZero_uid667_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(LOOKUP,674)@5
    excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (concExc_uid674_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid674_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "10";
            WHEN "100" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "11";
            WHEN "110" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "11";
            WHEN "111" => excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,693)@5
    expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= expRPreExc_uid664_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;
            WHEN "10" => expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITSELECT,662)@5
    fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in <= rndExpFrac_uid651_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b <= fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_in(23 downto 1);

    -- fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(MUX,689)@5
    fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s <= excREnc_uid675_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;
    fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= fracRPreExc_uid663_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_b;
            WHEN "10" => fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct(BITJOIN,694)@5
    R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q <= signRPostExc_uid686_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & expRPostExc_uid694_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q & fracRPostExc_uid690_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q;

    -- sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,699)@5
    sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(31 downto 31));

    -- redist18_sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1377)
    redist18_sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist18_sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,701)@5
    expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(30 downto 23);

    -- redist16_expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1375)
    redist16_expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist16_expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,700)@5
    fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(22 downto 0);

    -- redist17_fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1376)
    redist17_fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist17_fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,702)@6
    ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist18_sigY_uid700_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q & redist16_expY_uid702_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q & redist17_fracY_uid701_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q;

    -- frac_x_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,119)@0
    frac_x_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= a1(22 downto 0);

    -- fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,122)@0 + 1
    fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1438)
    redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,111)@0
    expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= a1(30 downto 23);

    -- expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,121)@0 + 1
    expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1439)
    redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,124)@2
    excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q;

    -- expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,112)@0
    expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= b1(30 downto 23);

    -- excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,134)@0 + 1
    excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1435)
    redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,191)@2
    excYZAndExcXI_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- frac_y_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,133)@0
    frac_y_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= b1(22 downto 0);

    -- fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,136)@0 + 1
    fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1432)
    redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,135)@0 + 1
    expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1433)
    redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,138)@2
    excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q;

    -- excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,120)@0 + 1
    excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1441)
    redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,192)@2
    excXZAndExcYI_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ZeroTimesInf_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,193)@2
    ZeroTimesInf_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXZAndExcYI_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYZAndExcXI_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- fracXIsNotZero_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,137)@2
    fracXIsNotZero_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist73_fracXIsZero_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q);

    -- excN_y_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,139)@2
    excN_y_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and fracXIsNotZero_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- fracXIsNotZero_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,123)@2
    fracXIsNotZero_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist79_fracXIsZero_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q);

    -- excN_x_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,125)@2
    excN_x_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and fracXIsNotZero_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,194)@2 + 1
    excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= excN_x_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excN_y_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or ZeroTimesInf_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,206)@3
    invExcRNaN_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- signY_uid115_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,114)@0
    signY_uid115_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(b1(31 downto 31));

    -- signX_uid114_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,113)@0
    signX_uid114_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(a1(31 downto 31));

    -- signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,153)@0 + 1
    signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= signX_uid114_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b xor signY_uid115_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist70_signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1429)
    redist70_signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist70_signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid208_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,207)@3
    signRPostExc_uid208_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist70_signR_uid154_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and invExcRNaN_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ofracX_uid146_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,145)@0
    ofracX_uid146_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= VCC_q & frac_x_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select(BITSELECT,1326)@0
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid146_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(17 downto 0);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid146_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid149_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,148)@0
    ofracY_uid149_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= VCC_q & frac_y_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select(BITSELECT,1327)@0
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid149_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(17 downto 0);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid149_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6(MULT,1228)@0 + 2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset <= areset;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0,
        datab => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1
    );
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15(BITSHIFT,1237)@2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3(MULT,1225)@0 + 2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset <= areset;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0,
        datab => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1
    );
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13(BITSHIFT,1235)@2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9(MULT,1231)@0 + 2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset <= areset;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 6,
        lpm_widthb => 6,
        lpm_widthp => 12,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0,
        datab => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1
    );
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0(MULT,1222)@0 + 2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0 <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset <= areset;
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0,
        datab => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1
    );
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12(BITJOIN,1234)@2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q & prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q;

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0(ADD,1239)@2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b));
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0(ADD,1240)@2
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q);
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b));
    prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,844)@2
    osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= prodXY_uid844_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,154)@2
    normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(47 downto 47));

    -- fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,156)@2
    fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,157)@2
    fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,158)@2
    fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNormLow_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNormHigh_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,166)@2
    fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,160)@2
    extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,161)@2
    extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= extraStickyBitOfProd_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,159)@2
    stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid845_prod_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(21 downto 0);
    stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,162)@2
    stickyExtendedRange_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= extraStickyBit_uid162_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & stickyRange_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- stickyRangeComparator_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,164)@2
    stickyRangeComparator_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,165)@2
    sticky_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (stickyRangeComparator_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- lrs_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,167)@2
    lrs_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNorm1dto0_uid167_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b & sticky_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,169)@2
    roundBitDetectionPattern_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "1" WHEN lrs_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q = roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid171_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,170)@2
    roundBit_uid171_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (roundBitDetectionPattern_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,173)@2
    roundBitAndNormalizationOp_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= GND_q & normalizeBit_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b & cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid171_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(ADD,149)@0 + 1
    expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b);
    expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b);
    expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) + UNSIGNED(expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(8 downto 0);

    -- redist71_expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1430)
    redist71_expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist71_expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(SUB,151)@2
    expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist71_expSum_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q));
    expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,171)@2
    expFracPreRound_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSumMBias_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & fracRPostNorm_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(ADD,174)@2
    expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(34)) & expFracPreRound_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q));
    expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q));
    expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,176)@2
    expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,177)@2
    expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(7 downto 0);

    -- redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1(DELAY,1427)
    redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, xout => redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(COMPARE,180)@2 + 1
    expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(11)) & expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n(0) <= not (expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(13));

    -- redist75_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1434)
    redist75_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist74_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist75_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,140)@3
    invExpXIsMax_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist75_expXIsMax_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1436)
    redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist76_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid142_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,141)@3
    InvExpXIsZero_uid142_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,142)@3
    excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= InvExpXIsZero_uid142_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and invExpXIsMax_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- redist81_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1440)
    redist81_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist80_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist81_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,126)@3
    invExpXIsMax_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist81_expXIsMax_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1442)
    redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist82_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid128_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,127)@3
    InvExpXIsZero_uid128_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,128)@3
    excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= InvExpXIsZero_uid128_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and invExpXIsMax_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,189)@3
    ExcROvfAndInReg_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and expOvf_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n;

    -- redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1(DELAY,1437)
    redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,188)@3
    excYRAndExcXI_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1(DELAY,1431)
    redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,187)@3
    excXRAndExcYI_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- excXIAndExcYI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,186)@3
    excXIAndExcYI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist78_excI_x_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q and redist72_excI_y_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- excRInf_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,190)@3
    excRInf_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXIAndExcYI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excXRAndExcYI_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYRAndExcXI_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or ExcROvfAndInReg_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(COMPARE,178)@2 + 1
    expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(11)) & expRPreExcExt_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n(0) <= not (expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(13));

    -- excZC3_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,184)@3
    excZC3_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and expUdf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n;

    -- excYZAndExcXR_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,183)@3
    excYZAndExcXR_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and excR_x_uid129_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excXZAndExcYR_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,182)@3
    excXZAndExcYR_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and excR_y_uid143_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excXZAndExcYZ_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,181)@3
    excXZAndExcYZ_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist83_excZ_x_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and redist77_excZ_y_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q;

    -- excRZero_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,185)@3
    excRZero_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXZAndExcYZ_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excXZAndExcYR_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYZAndExcXR_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excZC3_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- concExc_uid196_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,195)@3
    concExc_uid196_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excRNaN_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & excRInf_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & excRZero_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOOKUP,196)@3
    excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (concExc_uid196_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid196_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,205)@3
    expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist68_expRPreExc_uid178_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,175)@2
    fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= expFracRPostRounding_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(23 downto 1);

    -- redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1(DELAY,1428)
    redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, xout => redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,200)@3
    fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= excREnc_uid197_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist69_fracRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,208)@3
    R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= signRPostExc_uid208_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & expRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & fracRPostExc_uid201_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- sigY_uid412_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,411)@3
    sigY_uid412_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(31 downto 31));

    -- expY_uid414_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,413)@3
    expY_uid414_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(30 downto 23);

    -- fracY_uid413_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,412)@3
    fracY_uid413_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(22 downto 0);

    -- ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,414)@3
    ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= sigY_uid412_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & expY_uid414_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & fracY_uid413_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- frac_x_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,20)@0
    frac_x_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= a0(22 downto 0);

    -- fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,23)@0 + 1
    fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1454)
    redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,12)@0
    expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= a0(30 downto 23);

    -- expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,22)@0 + 1
    expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1455)
    redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,25)@2
    excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q;

    -- expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,13)@0
    expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= b0(30 downto 23);

    -- excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,35)@0 + 1
    excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1451)
    redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,92)@2
    excYZAndExcXI_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- frac_y_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,34)@0
    frac_y_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= b0(22 downto 0);

    -- fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,37)@0 + 1
    fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1448)
    redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,36)@0 + 1
    expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1449)
    redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,39)@2
    excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q;

    -- excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,21)@0 + 1
    excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1457)
    redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,93)@2
    excXZAndExcYI_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ZeroTimesInf_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,94)@2
    ZeroTimesInf_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXZAndExcYI_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYZAndExcXI_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- fracXIsNotZero_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,38)@2
    fracXIsNotZero_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist89_fracXIsZero_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excN_y_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,40)@2
    excN_y_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and fracXIsNotZero_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- fracXIsNotZero_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,24)@2
    fracXIsNotZero_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist95_fracXIsZero_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excN_x_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,26)@2
    excN_x_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and fracXIsNotZero_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,95)@2 + 1
    excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excN_x_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excN_y_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or ZeroTimesInf_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,107)@3
    invExcRNaN_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- signY_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,15)@0
    signY_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(b0(31 downto 31));

    -- signX_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,14)@0
    signX_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(a0(31 downto 31));

    -- signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,54)@0 + 1
    signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= signX_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b xor signY_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist86_signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1445)
    redist86_signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist86_signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid109_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,108)@3
    signRPostExc_uid109_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist86_signR_uid55_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q and invExcRNaN_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ofracX_uid47_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,46)@0
    ofracX_uid47_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= VCC_q & frac_x_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select(BITSELECT,1324)@0
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid47_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(17 downto 0);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid47_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,49)@0
    ofracY_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= VCC_q & frac_y_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select(BITSELECT,1325)@0
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(17 downto 0);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6(MULT,1209)@0 + 2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset <= areset;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0,
        datab => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1
    );
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15(BITSHIFT,1218)@2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3(MULT,1206)@0 + 2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset <= areset;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0,
        datab => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1
    );
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13(BITSHIFT,1216)@2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9(MULT,1212)@0 + 2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset <= areset;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 6,
        lpm_widthb => 6,
        lpm_widthp => 12,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0,
        datab => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1
    );
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0(MULT,1203)@0 + 2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0 <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset <= areset;
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0,
        datab => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1
    );
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12(BITJOIN,1215)@2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q & prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q;

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0(ADD,1220)@2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b));
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0(ADD,1221)@2
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q);
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b));
    prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,841)@2
    osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= prodXY_uid841_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,55)@2
    normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(47 downto 47));

    -- fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,57)@2
    fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,58)@2
    fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,59)@2
    fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNormLow_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNormHigh_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,67)@2
    fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,61)@2
    extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,62)@2
    extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= extraStickyBitOfProd_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,60)@2
    stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid842_prod_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(21 downto 0);
    stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,63)@2
    stickyExtendedRange_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= extraStickyBit_uid63_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & stickyRange_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- stickyRangeComparator_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,65)@2
    stickyRangeComparator_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,66)@2
    sticky_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (stickyRangeComparator_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- lrs_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,68)@2
    lrs_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNorm1dto0_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b & sticky_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,70)@2
    roundBitDetectionPattern_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "1" WHEN lrs_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = roundBitDetectionConstant_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid72_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,71)@2
    roundBit_uid72_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (roundBitDetectionPattern_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,74)@2
    roundBitAndNormalizationOp_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= GND_q & normalizeBit_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b & cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid72_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(ADD,50)@0 + 1
    expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b);
    expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b);
    expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) + UNSIGNED(expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(8 downto 0);

    -- redist87_expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1446)
    redist87_expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist87_expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(SUB,52)@2
    expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist87_expSum_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q));
    expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,72)@2
    expFracPreRound_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSumMBias_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & fracRPostNorm_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(ADD,75)@2
    expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(34)) & expFracPreRound_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,77)@2
    expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,78)@2
    expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(7 downto 0);

    -- redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1(DELAY,1443)
    redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, xout => redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(COMPARE,81)@2 + 1
    expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(11)) & expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n(0) <= not (expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(13));

    -- redist91_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1450)
    redist91_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist90_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, xout => redist91_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,41)@3
    invExpXIsMax_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist91_expXIsMax_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q);

    -- redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1452)
    redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist92_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, xout => redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid43_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,42)@3
    InvExpXIsZero_uid43_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q);

    -- excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,43)@3
    excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= InvExpXIsZero_uid43_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and invExpXIsMax_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- redist97_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1456)
    redist97_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist96_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, xout => redist97_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,27)@3
    invExpXIsMax_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist97_expXIsMax_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q);

    -- redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1458)
    redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist98_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, xout => redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid29_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,28)@3
    InvExpXIsZero_uid29_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q);

    -- excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,29)@3
    excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= InvExpXIsZero_uid29_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and invExpXIsMax_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,90)@3
    ExcROvfAndInReg_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and expOvf_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n;

    -- redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1(DELAY,1453)
    redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,89)@3
    excYRAndExcXI_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q;

    -- redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1(DELAY,1447)
    redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,88)@3
    excXRAndExcYI_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q;

    -- excXIAndExcYI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,87)@3
    excXIAndExcYI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist94_excI_x_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q and redist88_excI_y_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_1_q;

    -- excRInf_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,91)@3
    excRInf_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXIAndExcYI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excXRAndExcYI_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYRAndExcXI_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or ExcROvfAndInReg_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(COMPARE,79)@2 + 1
    expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(11)) & expRPreExcExt_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n(0) <= not (expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(13));

    -- excZC3_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,85)@3
    excZC3_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and expUdf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n;

    -- excYZAndExcXR_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,84)@3
    excYZAndExcXR_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q and excR_x_uid30_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excXZAndExcYR_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,83)@3
    excXZAndExcYR_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q and excR_y_uid44_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excXZAndExcYZ_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,82)@3
    excXZAndExcYZ_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist99_excZ_x_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q and redist93_excZ_y_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q;

    -- excRZero_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,86)@3
    excRZero_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXZAndExcYZ_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excXZAndExcYR_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYZAndExcXR_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excZC3_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- concExc_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,96)@3
    concExc_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excRNaN_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & excRInf_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & excRZero_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOOKUP,97)@3
    excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (concExc_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,106)@3
    expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist84_expRPreExc_uid79_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,76)@2
    fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= expFracRPostRounding_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(23 downto 1);

    -- redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1(DELAY,1444)
    redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, xout => redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,101)@3
    fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= excREnc_uid98_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist85_fracRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,109)@3
    R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= signRPostExc_uid109_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & expRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & fracRPostExc_uid102_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expFracY_uid410_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,409)@3
    expFracY_uid410_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= R_uid209_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(30 downto 0);

    -- expFracX_uid409_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,408)@3
    expFracX_uid409_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(30 downto 0);

    -- xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(COMPARE,410)@3
    xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expFracX_uid409_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b);
    xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expFracY_uid410_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b);
    xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) - UNSIGNED(xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n(0) <= not (xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(32));

    -- bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,419)@3
    bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n;
    bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "1" => bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,453)@3
    sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(31 downto 31));

    -- redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1(DELAY,1391)
    redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, xout => redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,418)@3
    aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= xGTEy_uid411_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n;
    aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= ypn_uid415_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "1" => aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= R_uid110_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,452)@3
    sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(31 downto 31));

    -- redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1(DELAY,1393)
    redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, xout => redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,454)@4
    effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q xor redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q;

    -- exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,437)@3
    exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(30 downto 0);
    exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(30 downto 23);

    -- exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,423)@3
    exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(30 downto 0);
    exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(30 downto 23);

    -- expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(SUB,462)@3
    expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b);
    expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b);
    expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) - UNSIGNED(expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(8 downto 0);

    -- shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(COMPARE,465)@3
    shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_c(0) <= shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(10);

    -- iShiftedOut_uid470_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,469)@3
    iShiftedOut_uid470_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (shiftedOut_uid466_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_c);

    -- excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,439)@3
    excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,446)@3
    InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,438)@3
    frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= bSig_uid420_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(22 downto 0);
    frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(22 downto 0);

    -- fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,458)@3
    fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;
            WHEN "1" => fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid462_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,461)@3
    oFracB_uid462_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & fracBz_uid459_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,467)@3
    rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= oFracB_uid462_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rightShiftStage0Idx6Rng48_uid965_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,964)@3
    rightShiftStage0Idx6Rng48_uid965_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 48);

    -- rightShiftStage0Idx6_uid967_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,966)@3
    rightShiftStage0Idx6_uid967_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx6Rng48_uid965_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx5Rng40_uid962_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,961)@3
    rightShiftStage0Idx5Rng40_uid962_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 40);

    -- rightShiftStage0Idx5_uid964_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,963)@3
    rightShiftStage0Idx5_uid964_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx5Rng40_uid962_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx4Rng32_uid959_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,958)@3
    rightShiftStage0Idx4Rng32_uid959_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 32);

    -- rightShiftStage0Idx4_uid961_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,960)@3
    rightShiftStage0Idx4_uid961_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx4Rng32_uid959_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1(MUX,1282)@3
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s, rightShiftStage0Idx4_uid961_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx5_uid964_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx6_uid967_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx4_uid961_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx5_uid964_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx6_uid967_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Rng24_uid956_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,955)@3
    rightShiftStage0Idx3Rng24_uid956_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 24);

    -- rightShiftStage0Idx3_uid958_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,957)@3
    rightShiftStage0Idx3_uid958_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx3Rng24_uid956_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx2Rng16_uid953_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,952)@3
    rightShiftStage0Idx2Rng16_uid953_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 16);

    -- rightShiftStage0Idx2_uid955_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,954)@3
    rightShiftStage0Idx2_uid955_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx2Rng16_uid953_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx1Rng8_uid950_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,949)@3
    rightShiftStage0Idx1Rng8_uid950_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 8);

    -- rightShiftStage0Idx1_uid952_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,951)@3
    rightShiftStage0Idx1_uid952_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & rightShiftStage0Idx1Rng8_uid950_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0(MUX,1281)@3
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s, rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx1_uid952_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx2_uid955_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage0Idx3_uid958_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightPaddedIn_uid468_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx1_uid952_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx2_uid955_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx3_uid958_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1332)@3
    rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_in <= expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(5 downto 0);
    rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1350)@3
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal(MUX,1283)@3
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s, rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q, rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid989_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,988)@3
    rightShiftStage1Idx7Rng7_uid989_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid991_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,990)@3
    rightShiftStage1Idx7_uid991_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx7Rng7_uid989_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx6Rng6_uid986_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,985)@3
    rightShiftStage1Idx6Rng6_uid986_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid988_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,987)@3
    rightShiftStage1Idx6_uid988_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx6Rng6_uid986_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx5Rng5_uid983_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,982)@3
    rightShiftStage1Idx5Rng5_uid983_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid985_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,984)@3
    rightShiftStage1Idx5_uid985_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx5Rng5_uid983_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx4Rng4_uid980_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,979)@3
    rightShiftStage1Idx4Rng4_uid980_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid982_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,981)@3
    rightShiftStage1Idx4_uid982_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx4Rng4_uid980_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1(MUX,1287)@3
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s, rightShiftStage1Idx4_uid982_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage1Idx5_uid985_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage1Idx6_uid988_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage1Idx7_uid991_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx4_uid982_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx5_uid985_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx6_uid988_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx7_uid991_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Rng3_uid977_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,976)@3
    rightShiftStage1Idx3Rng3_uid977_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid979_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,978)@3
    rightShiftStage1Idx3_uid979_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx3Rng3_uid977_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx2Rng2_uid974_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,973)@3
    rightShiftStage1Idx2Rng2_uid974_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid976_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,975)@3
    rightShiftStage1Idx2_uid976_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx2Rng2_uid974_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx1Rng1_uid971_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,970)@3
    rightShiftStage1Idx1Rng1_uid971_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid973_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,972)@3
    rightShiftStage1Idx1_uid973_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= GND_q & rightShiftStage1Idx1Rng1_uid971_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0(MUX,1286)@3
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s, rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q, rightShiftStage1Idx1_uid973_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage1Idx2_uid976_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, rightShiftStage1Idx3_uid979_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0_uid970_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "01" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx1_uid973_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx2_uid976_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx3_uid979_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1351)@3
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c(1 downto 0);
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid969_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c(2 downto 2);

    -- rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal(MUX,1288)@3
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s, rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q, rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(COMPARE,948)@3
    shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid463_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n(0) <= not (shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(10));

    -- r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,994)@3
    r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= shiftedOut_uid949_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_n;
    r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage1_uid993_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "1" => r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,470)@3 + 1
    alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid470_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(0)) & iShiftedOut_uid470_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q));
    alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= r_uid995_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;
    alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1333)@4
    stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(22 downto 0);
    stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= alignFracBPostShiftOut_uid471_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(48 downto 23);

    -- fracBAddOp_uid483_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,482)@4
    fracBAddOp_uid483_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= GND_q & stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c;

    -- fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,483)@4
    fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(0)) & effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q));
    fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= fracBAddOp_uid483_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q xor fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,424)@3
    frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= aSig_uid419_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(22 downto 0);
    frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(22 downto 0);

    -- redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1(DELAY,1399)
    redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, xout => redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid474_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,473)@4
    cmpEQ_stickyBits_cZwF_uid474_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN stickyBits_uid472_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- effSubInvSticky_uid477_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,476)@4
    effSubInvSticky_uid477_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and cmpEQ_stickyBits_cZwF_uid474_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracAAddOp_uid480_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,479)@4
    fracAAddOp_uid480_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q & GND_q & effSubInvSticky_uid477_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(ADD,484)@4
    fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid480_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid484_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) + UNSIGNED(fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,485)@4
    rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracAddResult_uid485_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid475_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,474)@4
    invCmpEQ_stickyBits_cZwF_uid475_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (cmpEQ_stickyBits_cZwF_uid474_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,486)@4
    fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rangeFracAddResultMwfp3Dto0_uid486_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & invCmpEQ_stickyBits_cZwF_uid475_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,853)@4
    rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(27 downto 12);

    -- vCount_uid855_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,854)@4
    vCount_uid855_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,856)@4
    vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(11 downto 0);
    vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(11 downto 0);

    -- cStage_uid858_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,857)@4
    cStage_uid858_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,859)@4
    vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= vCount_uid855_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, cStage_uid858_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid854_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;
            WHEN "1" => vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cStage_uid858_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1338)@4
    rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(15 downto 8);
    rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid860_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(7 downto 0);

    -- vCount_uid863_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,862)@4
    vCount_uid863_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,865)@4
    vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= vCount_uid863_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid862_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1339)@4
    rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(7 downto 4);
    rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid866_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(3 downto 0);

    -- vCount_uid869_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,868)@4
    vCount_uid869_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b = zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,871)@4
    vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= vCount_uid869_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid868_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1340)@4
    rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(3 downto 2);
    rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid872_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(1 downto 0);

    -- vCount_uid875_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,874)@4
    vCount_uid875_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b = zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,877)@4
    vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= vCount_uid875_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rVStage_uid874_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid880_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,879)@4
    rVStage_uid880_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= vStagei_uid878_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(1 downto 1);

    -- vCount_uid881_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,880)@4
    vCount_uid881_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid880_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = GND_q ELSE "0";

    -- r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,881)@4
    r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= vCount_uid855_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & vCount_uid863_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & vCount_uid869_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & vCount_uid875_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & vCount_uid881_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,489)@4 + 1
    aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q = cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";
    aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invAMinusA_uid532_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,531)@5
    invAMinusA_uid532_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2(DELAY,1394)
    redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, xout => redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,440)@3 + 1
    expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN exp_bSig_uid438_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2(DELAY,1397)
    redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid446_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,445)@5
    invExpXIsMax_uid446_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q);

    -- redist36_InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2(DELAY,1395)
    redist36_InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist36_InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excR_bSig_uid448_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,447)@5
    excR_bSig_uid448_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist36_InvExpXIsZero_uid447_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q and invExpXIsMax_uid446_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1(DELAY,1400)
    redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, xout => redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,426)@4 + 1
    expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid432_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,431)@5
    invExpXIsMax_uid432_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,425)@4 + 1
    excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid433_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,432)@5
    InvExpXIsZero_uid433_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,433)@5
    excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= InvExpXIsZero_uid433_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and invExpXIsMax_uid432_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- signRReg_uid533_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,532)@5
    signRReg_uid533_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and excR_bSig_uid448_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q and invAMinusA_uid532_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2(DELAY,1392)
    redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q, xout => redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2(DELAY,1398)
    redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid537_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,536)@5
    excAZBZSigASigB_uid537_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q and redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q and redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q;

    -- excBZARSigA_uid538_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,537)@5
    excBZARSigA_uid538_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q and excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q;

    -- signRZero_uid539_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,538)@5
    signRZero_uid539_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excBZARSigA_uid538_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or excAZBZSigASigB_uid537_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,441)@3 + 1
    fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_bSig_uid439_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2(DELAY,1396)
    redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,443)@5
    excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q and redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q;

    -- sigBBInf_uid534_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,533)@5
    sigBBInf_uid534_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist33_sigB_uid454_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q and excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,427)@4 + 1
    fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = redist40_frac_aSig_uid425_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q ELSE "0";
    fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_qi, xout => fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,429)@5
    excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- sigAAInf_uid535_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,534)@5
    sigAAInf_uid535_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist35_sigA_uid453_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_2_q and excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- signRInf_uid536_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,535)@5
    signRInf_uid536_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= sigAAInf_uid535_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or sigBBInf_uid534_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- signRInfRZRReg_uid540_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,539)@5
    signRInfRZRReg_uid540_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= signRInf_uid536_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or signRZero_uid539_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or signRReg_uid533_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracXIsNotZero_uid443_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,442)@5
    fracXIsNotZero_uid443_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (redist37_fracXIsZero_uid442_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q);

    -- excN_bSig_uid445_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,444)@5
    excN_bSig_uid445_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= redist38_expXIsMax_uid441_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q and fracXIsNotZero_uid443_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- fracXIsNotZero_uid429_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,428)@5
    fracXIsNotZero_uid429_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (fracXIsZero_uid428_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- excN_aSig_uid431_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,430)@5
    excN_aSig_uid431_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expXIsMax_uid427_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and fracXIsNotZero_uid429_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- excRNaN2_uid527_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,526)@5
    excRNaN2_uid527_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excN_aSig_uid431_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or excN_bSig_uid445_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1(DELAY,1390)
    redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid528_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,527)@5
    excAIBISub_uid528_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q;

    -- excRNaN_uid529_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,528)@5
    excRNaN_uid529_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excAIBISub_uid528_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or excRNaN2_uid527_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- invExcRNaN_uid541_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,540)@5
    invExcRNaN_uid541_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (excRNaN_uid529_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- signRPostExc_uid542_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,541)@5
    signRPostExc_uid542_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= invExcRNaN_uid541_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and signRInfRZRReg_uid540_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1026)@5
    leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(24 downto 0);

    -- leftShiftStage1Idx3_uid1028_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1027)@5
    leftShiftStage1Idx3_uid1028_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx3Rng3_uid1027_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1023)@5
    leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(25 downto 0);

    -- leftShiftStage1Idx2_uid1025_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1024)@5
    leftShiftStage1Idx2_uid1025_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx2Rng2_uid1024_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1020)@5
    leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(26 downto 0);

    -- leftShiftStage1Idx1_uid1022_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1021)@5
    leftShiftStage1Idx1_uid1022_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx1Rng1_uid1021_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & GND_q;

    -- leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1014)@4
    leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(3 downto 0);

    -- leftShiftStage0Idx6_uid1016_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1015)@4
    leftShiftStage0Idx6_uid1016_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx6Rng24_uid1015_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1011)@4
    leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(7 downto 0);

    -- leftShiftStage0Idx5_uid1013_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1012)@4
    leftShiftStage0Idx5_uid1013_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx5Rng20_uid1012_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx4_uid1010_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1009)@4
    leftShiftStage0Idx4_uid1010_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= vStage_uid857_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1(MUX,1292)@4
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s, leftShiftStage0Idx4_uid1010_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx5_uid1013_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx6_uid1016_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx4_uid1010_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx5_uid1013_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx6_uid1016_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1005)@4
    leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(15 downto 0);

    -- leftShiftStage0Idx3_uid1007_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1006)@4
    leftShiftStage0Idx3_uid1007_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx3Rng12_uid1006_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,1002)@4
    leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(19 downto 0);

    -- leftShiftStage0Idx2_uid1004_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1003)@4
    leftShiftStage0Idx2_uid1004_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx2Rng8_uid1003_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,999)@4
    leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(23 downto 0);

    -- leftShiftStage0Idx1_uid1001_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,1000)@4
    leftShiftStage0Idx1_uid1001_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx1Rng4_uid1000_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0(MUX,1291)@4
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s, fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx1_uid1001_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx2_uid1004_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage0Idx3_uid1007_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= fracGRS_uid487_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx1_uid1001_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx2_uid1004_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx3_uid1007_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,1341)@4
    leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b <= r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(4 downto 2);
    leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c <= r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(1 downto 0);

    -- leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1356)@4
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal(MUX,1293)@4 + 1
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_s) IS
                WHEN "0" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_0_q;
                WHEN "1" => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_msplit_1_q;
                WHEN OTHERS => leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c_1(DELAY,1360)
    redist1_leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c, xout => redist1_leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,1029)@5
    leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= redist1_leftShiftStageSel4Dto2_uid1018_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_merged_bit_select_c_1_q;
    leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q, leftShiftStage1Idx1_uid1022_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage1Idx2_uid1025_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, leftShiftStage1Idx3_uid1028_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage0_uid1019_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "01" => leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx1_uid1022_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx2_uid1025_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx3_uid1028_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,499)@5
    LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(4 downto 0));
    LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(4 downto 4));

    -- Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,498)@5
    Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(3 downto 0));
    Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(3 downto 3));

    -- Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,497)@5
    Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(2 downto 0));
    Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(2 downto 2));

    -- Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,496)@5
    Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(1 downto 0));
    Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(1 downto 1));

    -- Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,495)@5
    Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(0 downto 0));
    Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(0 downto 0));

    -- rndBitCond_uid501_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,500)@5
    rndBitCond_uid501_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= LSB_uid500_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & Guard_uid499_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & Round_uid498_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & Sticky1_uid497_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b & Sticky0_uid496_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rBi_uid503_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,502)@5
    rBi_uid503_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rndBitCond_uid501_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q = cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- roundBit_uid504_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,503)@5
    roundBit_uid504_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= not (rBi_uid503_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);

    -- expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(ADD,493)@4
    expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & redist41_exp_aSig_uid424_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b_1_q);
    expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) + UNSIGNED(expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(8 downto 0);

    -- expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(SUB,494)@4 + 1
    expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expInc_uid494_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & r_uid882_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) - UNSIGNED(expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(9 downto 0);

    -- fracPostNorm_uid492_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,491)@5
    fracPostNorm_uid492_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= leftShiftStage1_uid1030_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(27 downto 1);

    -- fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,504)@5
    fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= fracPostNorm_uid492_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b(25 downto 0);
    fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(25 downto 2);

    -- expFracR_uid506_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,505)@5
    expFracR_uid506_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expPostNorm_uid495_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & fracPostNormRndRange_uid505_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(ADD,506)@5
    rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expFracR_uid506_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid504_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_a) + UNSIGNED(rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b));
    rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_o(34 downto 0);

    -- expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,519)@5
    expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(31 downto 0);
    expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(31 downto 24);

    -- rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,511)@5
    rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(33 downto 0);
    rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(33 downto 32);

    -- rOvfExtraBits_uid513_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,512)@5
    rOvfExtraBits_uid513_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rndExpFracOvfBits_uid512_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,508)@5
    rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(33 downto 0);
    rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(33 downto 24);

    -- rOvfEQMax_uid510_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,509)@5
    rOvfEQMax_uid510_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rOvf_uid514_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,513)@5
    rOvf_uid514_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rOvfEQMax_uid510_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or rOvfExtraBits_uid513_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- regInputs_uid521_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,520)@5
    regInputs_uid521_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excR_aSig_uid434_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and excR_bSig_uid448_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rInfOvf_uid524_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,523)@5
    rInfOvf_uid524_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= regInputs_uid521_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q and rOvf_uid514_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- excRInfVInC_uid525_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,524)@5
    excRInfVInC_uid525_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rInfOvf_uid524_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excN_bSig_uid445_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excN_aSig_uid431_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excI_bSig_uid444_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excI_aSig_uid430_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & redist31_effSub_uid455_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q;

    -- excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOOKUP,525)@5
    excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (excRInfVInC_uid525_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid525_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q) IS
            WHEN "000000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "000001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "000010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "100001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111000" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111001" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111010" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111011" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111100" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111101" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111110" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111111" => excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,516)@5
    rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(33 downto 0));
    rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(33 downto 33));

    -- rUdfEQMin_uid516_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,515)@5
    rUdfEQMin_uid516_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1" WHEN rndExp_uid509_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b = wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rUdf_uid518_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOGICAL,517)@5
    rUdf_uid518_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= rUdfEQMin_uid516_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q or rUdfExtraBit_uid517_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;

    -- excRZeroVInC_uid522_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,521)@5
    excRZeroVInC_uid522_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= aMinusA_uid490_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rUdf_uid518_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & regInputs_uid521_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & redist39_excZ_bSig_uid420_uid440_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_2_q & excZ_aSig_uid419_uid426_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOOKUP,522)@5
    excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (excRZeroVInC_uid522_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid522_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q) IS
            WHEN "00000" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00001" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00010" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00011" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "00100" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00101" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00110" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00111" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01000" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01001" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01010" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01011" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "01100" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "01101" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01110" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01111" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10000" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10001" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10010" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10011" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "10100" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "10101" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10110" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10111" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11000" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11001" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11010" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11011" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "11100" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "1";
            WHEN "11101" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11110" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11111" => excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid530_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,529)@5
    concExc_uid530_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= excRNaN_uid529_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excRInf_uid526_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & excRZero_uid523_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(LOOKUP,530)@5
    excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (concExc_uid530_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid530_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "10";
            WHEN "100" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11";
            WHEN "110" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11";
            WHEN "111" => excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,549)@5
    expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= expRPreExc_uid520_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;
            WHEN "10" => expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITSELECT,518)@5
    fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in <= rndExpFrac_uid507_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b <= fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_in(23 downto 1);

    -- fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(MUX,545)@5
    fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s <= excREnc_uid531_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
    fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= fracRPreExc_uid519_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_b;
            WHEN "10" => fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct(BITJOIN,550)@5
    R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q <= signRPostExc_uid542_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & expRPostExc_uid550_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & fracRPostExc_uid546_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1(DELAY,1389)
    redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q, xout => redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- expFracY_uid698_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,697)@5
    expFracY_uid698_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= R_uid695_dotProdIEEEAssembly_add_tree_1_1_uid11_fpScalarProduct_q(30 downto 0);

    -- expFracX_uid697_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,696)@5
    expFracX_uid697_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q(30 downto 0);

    -- xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(COMPARE,698)@5 + 1
    xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expFracX_uid697_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b);
    xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expFracY_uid698_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b);
    xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) - UNSIGNED(xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
        END IF;
    END PROCESS;
    xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n(0) <= not (xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(32));

    -- bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,707)@6
    bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n;
    bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q, ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q;
            WHEN "1" => bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,741)@6
    sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(31 downto 31));

    -- aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,706)@6
    aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= xGTEy_uid699_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n;
    aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q)
    BEGIN
        CASE (aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= ypn_uid703_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "1" => aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist30_R_uid551_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q_1_q;
            WHEN OTHERS => aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,740)@6
    sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(31 downto 31));

    -- effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,742)@6
    effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b xor sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,725)@6
    exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(30 downto 0);
    exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(30 downto 23);

    -- exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,711)@6
    exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(30 downto 0);
    exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(30 downto 23);

    -- expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(SUB,750)@6
    expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b);
    expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b);
    expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) - UNSIGNED(expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(8 downto 0);

    -- shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(COMPARE,753)@6
    shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid464_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_c(0) <= shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(10);

    -- iShiftedOut_uid758_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,757)@6
    iShiftedOut_uid758_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (shiftedOut_uid754_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_c);

    -- excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,727)@6
    excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid735_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,734)@6
    InvExpXIsZero_uid735_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,726)@6
    frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= bSig_uid708_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(22 downto 0);
    frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(22 downto 0);

    -- fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,746)@6
    fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;
            WHEN "1" => fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid750_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,749)@6
    oFracB_uid750_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= InvExpXIsZero_uid735_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & fracBz_uid747_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,755)@6
    rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= oFracB_uid750_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & padConst_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- rightShiftStage0Idx6Rng48_uid1137_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1136)@6
    rightShiftStage0Idx6Rng48_uid1137_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 48);

    -- rightShiftStage0Idx6_uid1139_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1138)@6
    rightShiftStage0Idx6_uid1139_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage0Idx6Pad48_uid966_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx6Rng48_uid1137_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0Idx5Rng40_uid1134_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1133)@6
    rightShiftStage0Idx5Rng40_uid1134_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 40);

    -- rightShiftStage0Idx5_uid1136_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1135)@6
    rightShiftStage0Idx5_uid1136_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage0Idx5Pad40_uid963_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx5Rng40_uid1134_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0Idx4Rng32_uid1131_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1130)@6
    rightShiftStage0Idx4Rng32_uid1131_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 32);

    -- rightShiftStage0Idx4_uid1133_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1132)@6
    rightShiftStage0Idx4_uid1133_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage0Idx4Pad32_uid960_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx4Rng32_uid1131_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1(MUX,1312)@6
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s, rightShiftStage0Idx4_uid1133_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx5_uid1136_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx6_uid1139_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx4_uid1133_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx5_uid1136_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx6_uid1139_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Rng24_uid1128_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1127)@6
    rightShiftStage0Idx3Rng24_uid1128_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 24);

    -- rightShiftStage0Idx3_uid1130_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1129)@6
    rightShiftStage0Idx3_uid1130_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx3Rng24_uid1128_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0Idx2Rng16_uid1125_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1124)@6
    rightShiftStage0Idx2Rng16_uid1125_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 16);

    -- rightShiftStage0Idx2_uid1127_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1126)@6
    rightShiftStage0Idx2_uid1127_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage0Idx2Rng16_uid1125_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0Idx1Rng8_uid1122_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1121)@6
    rightShiftStage0Idx1Rng8_uid1122_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 8);

    -- rightShiftStage0Idx1_uid1124_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1123)@6
    rightShiftStage0Idx1_uid1124_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & rightShiftStage0Idx1Rng8_uid1122_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0(MUX,1311)@6
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s, rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx1_uid1124_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx2_uid1127_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage0Idx3_uid1130_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightPaddedIn_uid756_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx1_uid1124_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx2_uid1127_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx3_uid1130_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1336)@6
    rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_in <= expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(5 downto 0);
    rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1354)@6
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal(MUX,1313)@6
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s, rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q, rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid1161_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1160)@6
    rightShiftStage1Idx7Rng7_uid1161_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid1163_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1162)@6
    rightShiftStage1Idx7_uid1163_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage1Idx7Pad7_uid990_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx7Rng7_uid1161_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1Idx6Rng6_uid1158_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1157)@6
    rightShiftStage1Idx6Rng6_uid1158_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid1160_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1159)@6
    rightShiftStage1Idx6_uid1160_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage1Idx6Pad6_uid987_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx6Rng6_uid1158_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1Idx5Rng5_uid1155_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1154)@6
    rightShiftStage1Idx5Rng5_uid1155_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid1157_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1156)@6
    rightShiftStage1Idx5_uid1157_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage1Idx5Pad5_uid984_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx5Rng5_uid1155_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1Idx4Rng4_uid1152_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1151)@6
    rightShiftStage1Idx4Rng4_uid1152_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid1154_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1153)@6
    rightShiftStage1Idx4_uid1154_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx4Rng4_uid1152_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1(MUX,1317)@6
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s, rightShiftStage1Idx4_uid1154_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage1Idx5_uid1157_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage1Idx6_uid1160_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage1Idx7_uid1163_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx4_uid1154_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "01" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx5_uid1157_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx6_uid1160_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx7_uid1163_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Rng3_uid1149_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1148)@6
    rightShiftStage1Idx3Rng3_uid1149_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid1151_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1150)@6
    rightShiftStage1Idx3_uid1151_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx3Rng3_uid1149_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1Idx2Rng2_uid1146_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1145)@6
    rightShiftStage1Idx2Rng2_uid1146_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid1148_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1147)@6
    rightShiftStage1Idx2_uid1148_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & rightShiftStage1Idx2Rng2_uid1146_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1Idx1Rng1_uid1143_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1142)@6
    rightShiftStage1Idx1Rng1_uid1143_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid1145_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1144)@6
    rightShiftStage1Idx1_uid1145_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= GND_q & rightShiftStage1Idx1Rng1_uid1143_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0(MUX,1316)@6
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s, rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q, rightShiftStage1Idx1_uid1145_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage1Idx2_uid1148_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, rightShiftStage1Idx3_uid1151_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage0_uid1142_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q;
            WHEN "01" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx1_uid1145_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx2_uid1148_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx3_uid1151_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1355)@6
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c(1 downto 0);
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid1141_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c(2 downto 2);

    -- rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal(MUX,1318)@6
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s, rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q, rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(COMPARE,1120)@6
    shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid751_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid948_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n(0) <= not (shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(10));

    -- r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,1166)@6
    r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= shiftedOut_uid1121_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_n;
    r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q, rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage1_uid1165_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q;
            WHEN "1" => r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rightShiftStage0Idx7_uid968_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,758)@6
    alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid758_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(0)) & iShiftedOut_uid758_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q));
    alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= r_uid1167_alignmentShifter_uid755_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1337)@6
    stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(22 downto 0);
    stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= alignFracBPostShiftOut_uid759_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(48 downto 23);

    -- fracBAddOp_uid771_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,770)@6
    fracBAddOp_uid771_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= GND_q & stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c;

    -- fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,771)@6
    fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(0)) & effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q));
    fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= fracBAddOp_uid771_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q xor fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,712)@6
    frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= aSig_uid707_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(22 downto 0);
    frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(22 downto 0);

    -- cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,761)@6
    cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN stickyBits_uid760_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b = cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- effSubInvSticky_uid765_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,764)@6
    effSubInvSticky_uid765_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- fracAAddOp_uid768_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,767)@6
    fracAAddOp_uid768_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q & frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & GND_q & effSubInvSticky_uid765_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(ADD,772)@6
    fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid768_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid772_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) + UNSIGNED(fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,773)@6
    rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracAddResult_uid773_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(26 downto 0);

    -- redist4_rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1363)
    redist4_rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist4_rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- redist5_cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1(DELAY,1364)
    redist5_cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist5_cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- invCmpEQ_stickyBits_cZwF_uid763_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,762)@7
    invCmpEQ_stickyBits_cZwF_uid763_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (redist5_cmpEQ_stickyBits_cZwF_uid762_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q);

    -- fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,774)@7
    fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist4_rangeFracAddResultMwfp3Dto0_uid774_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q & invCmpEQ_stickyBits_cZwF_uid763_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,915)@7
    rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(27 downto 12);

    -- vCount_uid917_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,916)@7
    vCount_uid917_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,918)@7
    vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(11 downto 0);
    vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(11 downto 0);

    -- cStage_uid920_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,919)@7
    cStage_uid920_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & mO_uid856_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,921)@7
    vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= vCount_uid917_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, cStage_uid920_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid916_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;
            WHEN "1" => vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cStage_uid920_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1346)@7
    rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(15 downto 8);
    rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= vStagei_uid922_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(7 downto 0);

    -- vCount_uid925_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,924)@7
    vCount_uid925_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,927)@7
    vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= vCount_uid925_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b, rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid924_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1347)@7
    rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(7 downto 4);
    rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= vStagei_uid928_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(3 downto 0);

    -- vCount_uid931_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,930)@7
    vCount_uid931_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b = zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,933)@7
    vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= vCount_uid931_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b, rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid930_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1348)@7
    rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(3 downto 2);
    rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= vStagei_uid934_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(1 downto 0);

    -- vCount_uid937_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,936)@7
    vCount_uid937_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b = zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,939)@7
    vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= vCount_uid937_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b, rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rVStage_uid936_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid942_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,941)@7
    rVStage_uid942_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= vStagei_uid940_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(1 downto 1);

    -- vCount_uid943_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,942)@7
    vCount_uid943_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rVStage_uid942_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = GND_q ELSE "0";

    -- r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,943)@7
    r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= vCount_uid917_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & vCount_uid925_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & vCount_uid931_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & vCount_uid937_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & vCount_uid943_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,777)@7
    aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q = cAmA_uid489_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- invAMinusA_uid820_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,819)@7
    invAMinusA_uid820_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1367)
    redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,728)@6
    expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN exp_bSig_uid726_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- invExpXIsMax_uid734_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,733)@6
    invExpXIsMax_uid734_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,735)@6 + 1
    excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= InvExpXIsZero_uid735_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and invExpXIsMax_uid734_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1374)
    redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,714)@7
    expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q = cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- invExpXIsMax_uid720_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,719)@7
    invExpXIsMax_uid720_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,713)@7
    excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q = cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid721_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,720)@7
    InvExpXIsZero_uid721_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,721)@7
    excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= InvExpXIsZero_uid721_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and invExpXIsMax_uid720_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- signRReg_uid821_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,820)@7
    signRReg_uid821_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q and invAMinusA_uid820_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1366)
    redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1(DELAY,1370)
    redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid825_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,824)@7
    excAZBZSigASigB_uid825_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q and redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q and redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q;

    -- excBZARSigA_uid826_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,825)@7
    excBZARSigA_uid826_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q and excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q;

    -- signRZero_uid827_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,826)@7
    signRZero_uid827_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excBZARSigA_uid826_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or excAZBZSigASigB_uid825_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- fracXIsZero_uid730_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,729)@6
    fracXIsZero_uid730_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_bSig_uid727_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b ELSE "0";

    -- excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,731)@6 + 1
    excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and fracXIsZero_uid730_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- sigBBInf_uid822_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,821)@7
    sigBBInf_uid822_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist7_sigB_uid742_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q and excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,715)@6 + 1
    fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_aSig_uid713_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,717)@7
    excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- sigAAInf_uid823_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,822)@7
    sigAAInf_uid823_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist8_sigA_uid741_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q and excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- signRInf_uid824_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,823)@7
    signRInf_uid824_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= sigAAInf_uid823_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or sigBBInf_uid822_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,827)@7 + 1
    signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= signRInf_uid824_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or signRZero_uid827_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or signRReg_uid821_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid731_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,730)@6
    fracXIsNotZero_uid731_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (fracXIsZero_uid730_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,732)@6 + 1
    excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= expXIsMax_uid729_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and fracXIsNotZero_uid731_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2(DELAY,1368)
    redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid717_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,716)@7
    fracXIsNotZero_uid717_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (fracXIsZero_uid716_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,718)@7 + 1
    excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= expXIsMax_uid715_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and fracXIsNotZero_uid717_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRNaN2_uid815_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,814)@8
    excRNaN2_uid815_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q;

    -- redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2(DELAY,1365)
    redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2(DELAY,1369)
    redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1(DELAY,1372)
    redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid816_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,815)@8
    excAIBISub_uid816_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q and redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q and redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q;

    -- excRNaN_uid817_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,816)@8
    excRNaN_uid817_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excAIBISub_uid816_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or excRNaN2_uid815_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- invExcRNaN_uid829_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,828)@8
    invExcRNaN_uid829_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (excRNaN_uid817_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid830_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,829)@8
    signRPostExc_uid830_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= invExcRNaN_uid829_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and signRInfRZRReg_uid828_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1198)@7
    leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(24 downto 0);

    -- leftShiftStage1Idx3_uid1200_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1199)@7
    leftShiftStage1Idx3_uid1200_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx3Rng3_uid1199_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & rightShiftStage1Idx3Pad3_uid978_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1195)@7
    leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(25 downto 0);

    -- leftShiftStage1Idx2_uid1197_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1196)@7
    leftShiftStage1Idx2_uid1197_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx2Rng2_uid1196_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & zs_uid873_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1192)@7
    leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(26 downto 0);

    -- leftShiftStage1Idx1_uid1194_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1193)@7
    leftShiftStage1Idx1_uid1194_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx1Rng1_uid1193_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & GND_q;

    -- leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1186)@7
    leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(3 downto 0);

    -- leftShiftStage0Idx6_uid1188_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1187)@7
    leftShiftStage0Idx6_uid1188_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0Idx6Rng24_uid1187_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & rightShiftStage0Idx3Pad24_uid957_alignmentShifter_uid467_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1183)@7
    leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(7 downto 0);

    -- leftShiftStage0Idx5_uid1185_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1184)@7
    leftShiftStage0Idx5_uid1185_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0Idx5Rng20_uid1184_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & leftShiftStage0Idx5Pad20_uid1011_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx4_uid1182_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1181)@7
    leftShiftStage0Idx4_uid1182_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= vStage_uid919_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & zs_uid853_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1(MUX,1322)@7
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_combproc: PROCESS (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s, leftShiftStage0Idx4_uid1182_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx5_uid1185_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx6_uid1188_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx4_uid1182_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx5_uid1185_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx6_uid1188_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx7_uid1017_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1177)@7
    leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(15 downto 0);

    -- leftShiftStage0Idx3_uid1179_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1178)@7
    leftShiftStage0Idx3_uid1179_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0Idx3Rng12_uid1178_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & leftShiftStage0Idx3Pad12_uid1005_fracPostNormExt_uid491_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1174)@7
    leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(19 downto 0);

    -- leftShiftStage0Idx2_uid1176_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1175)@7
    leftShiftStage0Idx2_uid1176_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0Idx2Rng8_uid1175_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,1171)@7
    leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(23 downto 0);

    -- leftShiftStage0Idx1_uid1173_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,1172)@7
    leftShiftStage0Idx1_uid1173_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0Idx1Rng4_uid1172_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & zs_uid867_lzCountVal_uid488_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q;

    -- leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0(MUX,1321)@7
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_combproc: PROCESS (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s, fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx1_uid1173_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx2_uid1176_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage0Idx3_uid1179_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= fracGRS_uid775_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx1_uid1173_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx2_uid1176_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx3_uid1179_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,1358)@7
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal(MUX,1323)@7
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_combproc: PROCESS (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s, leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q, leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select(BITSELECT,1349)@7
    leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_b <= r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(4 downto 2);
    leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c <= r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(1 downto 0);

    -- leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,1201)@7
    leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= leftShiftStageSel4Dto2_uid1190_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_merged_bit_select_c;
    leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q, leftShiftStage1Idx1_uid1194_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage1Idx2_uid1197_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, leftShiftStage1Idx3_uid1200_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "00" => leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage0_uid1191_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_mfinal_q;
            WHEN "01" => leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx1_uid1194_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "10" => leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx2_uid1197_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN "11" => leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= leftShiftStage1Idx3_uid1200_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,787)@7
    LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(4 downto 0));
    LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(4 downto 4));

    -- Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,786)@7
    Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(3 downto 0));
    Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(3 downto 3));

    -- Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,785)@7
    Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(2 downto 0));
    Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(2 downto 2));

    -- Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,784)@7
    Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(1 downto 0));
    Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(1 downto 1));

    -- Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,783)@7
    Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(0 downto 0));
    Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(0 downto 0));

    -- rndBitCond_uid789_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,788)@7
    rndBitCond_uid789_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= LSB_uid788_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & Guard_uid787_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & Round_uid786_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & Sticky1_uid785_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b & Sticky0_uid784_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,790)@7 + 1
    rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= "1" WHEN rndBitCond_uid789_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q = cRBit_uid502_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";
    rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- roundBit_uid792_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,791)@8
    roundBit_uid792_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= not (rBi_uid791_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);

    -- expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(ADD,781)@7
    expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & redist15_exp_aSig_uid712_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q);
    expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & oneCST_uid493_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q);
    expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) + UNSIGNED(expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(8 downto 0);

    -- expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(SUB,782)@7 + 1
    expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expInc_uid782_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & r_uid944_lzCountVal_uid776_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) - UNSIGNED(expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(9 downto 0);

    -- fracPostNorm_uid780_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,779)@7
    fracPostNorm_uid780_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= leftShiftStage1_uid1202_fracPostNormExt_uid779_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(27 downto 1);

    -- fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,792)@7
    fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= fracPostNorm_uid780_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b(25 downto 0);
    fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(25 downto 2);

    -- redist2_fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1(DELAY,1361)
    redist2_fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, xout => redist2_fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid794_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,793)@8
    expFracR_uid794_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expPostNorm_uid783_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & redist2_fracPostNormRndRange_uid793_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b_1_q;

    -- rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(ADD,794)@8
    rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expFracR_uid794_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid792_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q);
    rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_a) + UNSIGNED(rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b));
    rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_o(34 downto 0);

    -- expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,807)@8
    expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(31 downto 0);
    expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(31 downto 24);

    -- rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,799)@8
    rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(33 downto 0);
    rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(33 downto 32);

    -- rOvfExtraBits_uid801_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,800)@8
    rOvfExtraBits_uid801_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rndExpFracOvfBits_uid800_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = zocst_uid479_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,796)@8
    rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(33 downto 0);
    rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(33 downto 24);

    -- rOvfEQMax_uid798_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,797)@8
    rOvfEQMax_uid798_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = wEP2AllOwE_uid508_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rOvf_uid802_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,801)@8
    rOvf_uid802_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rOvfEQMax_uid798_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or rOvfExtraBits_uid801_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,808)@7 + 1
    regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi <= excR_aSig_uid722_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and excR_bSig_uid736_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_qi, xout => regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, clk => clk, aclr => areset );

    -- rInfOvf_uid812_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,811)@8
    rInfOvf_uid812_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q and rOvf_uid802_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- excRInfVInC_uid813_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,812)@8
    excRInfVInC_uid813_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rInfOvf_uid812_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & redist9_excN_bSig_uid733_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q & excN_aSig_uid719_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & redist10_excI_bSig_uid732_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q & redist13_excI_aSig_uid718_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q & redist6_effSub_uid743_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q;

    -- excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOOKUP,813)@8
    excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (excRInfVInC_uid813_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid813_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q) IS
            WHEN "000000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "000001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "000010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "000011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "000100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "000101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "000110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "000111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "001111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "010111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "011111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "100001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "100111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "101111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "110111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111000" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111001" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111010" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111011" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111100" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111101" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111110" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "111111" => excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist3_aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1(DELAY,1362)
    redist3_aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist3_aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,804)@8
    rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= STD_LOGIC_VECTOR(rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(33 downto 0));
    rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(33 downto 33));

    -- rUdfEQMin_uid804_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,803)@8
    rUdfEQMin_uid804_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1" WHEN rndExp_uid797_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b = wEP2AllZ_uid515_dotProdIEEEAssembly_add_tree_1_0_uid10_fpScalarProduct_q ELSE "0";

    -- rUdf_uid806_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOGICAL,805)@8
    rUdf_uid806_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= rUdfEQMin_uid804_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q or rUdfExtraBit_uid805_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;

    -- redist12_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2(DELAY,1371)
    redist12_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist11_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, xout => redist12_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- redist14_excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1(DELAY,1373)
    redist14_excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q, xout => redist14_excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid810_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,809)@8
    excRZeroVInC_uid810_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= redist3_aMinusA_uid778_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q & rUdf_uid806_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & regInputs_uid809_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & redist12_excZ_bSig_uid708_uid728_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_2_q & redist14_excZ_aSig_uid707_uid714_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q_1_q;

    -- excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOOKUP,810)@8
    excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (excRZeroVInC_uid810_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid810_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q) IS
            WHEN "00000" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00001" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00010" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00011" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "00100" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00101" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00110" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "00111" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01000" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01001" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01010" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01011" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "01100" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "01101" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01110" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "01111" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10000" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10001" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10010" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10011" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "10100" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "10101" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10110" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "10111" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11000" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11001" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11010" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11011" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "11100" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "1";
            WHEN "11101" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11110" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN "11111" => excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid818_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,817)@8
    concExc_uid818_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= excRNaN_uid817_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & excRInf_uid814_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & excRZero_uid811_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(LOOKUP,818)@8
    excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (concExc_uid818_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid818_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "10";
            WHEN "100" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "11";
            WHEN "110" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "11";
            WHEN "111" => excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,837)@8
    expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstAllZWE_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= expRPreExc_uid808_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;
            WHEN "10" => expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstAllOWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITSELECT,806)@8
    fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in <= rndExpFrac_uid795_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b <= fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_in(23 downto 1);

    -- fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(MUX,833)@8
    fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s <= excREnc_uid819_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;
    fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s, cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b, oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= fracRPreExc_uid807_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_b;
            WHEN "10" => fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= cstZeroWF_uid18_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= oneFracRPostExc2_uid99_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid839_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct(BITJOIN,838)@8
    R_uid839_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q <= signRPostExc_uid830_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & expRPostExc_uid838_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q & fracRPostExc_uid834_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

    -- xOut(GPOUT,4)@8
    q <= R_uid839_dotProdIEEEAssembly_add_tree_2_0_uid12_fpScalarProduct_q;

END normal;
