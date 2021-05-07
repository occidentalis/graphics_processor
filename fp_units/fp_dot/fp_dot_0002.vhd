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
-- VHDL created on Fri May 07 14:58:21 2021


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
    signal expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid33_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid45_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid48_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid65_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid106_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid118_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid132_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid144_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid147_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid164_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid169_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid180_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid205_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid217_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid231_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid243_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid246_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid263_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid268_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid279_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid304_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid308_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid309_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid311_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid312_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid313_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid328_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid330_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid331_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid332_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid342_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid344_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid345_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid347_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid361_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cWFP2_uid363_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid369_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid373_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid374_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid376_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid379_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid382_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid388_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid391_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oneCST_uid392_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid400_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid401_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid402_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid403_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid405_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal wEP2AllOwE_uid407_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid409_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid412_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid413_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid414_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfEQMin_uid415_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid417_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid420_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid421_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid423_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid424_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid426_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid427_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid428_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid429_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid431_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid432_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid433_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid434_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid435_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid436_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid437_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid438_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid439_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid440_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid441_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracX_uid452_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid453_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid472_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid475_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid476_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid486_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid489_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid491_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid505_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid513_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid518_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid520_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracAAddOp_uid523_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid526_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid535_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid544_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid547_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid549_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid553_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid556_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid557_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfEQMin_uid559_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid561_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid565_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid567_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid568_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid570_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid571_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid572_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid573_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid575_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid576_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid577_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid578_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid579_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid580_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid581_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid582_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid584_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid585_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid594_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in : STD_LOGIC_VECTOR (47 downto 0);
    signal osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid607_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid608_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid610_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid615_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid621_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid627_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid632_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid633_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid638_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid641_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid646_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid652_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid658_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid663_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid664_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal wIntCst_uid669_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid671_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid673_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid674_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid676_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid677_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3_uid679_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid680_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4Pad32_uid681_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx4_uid682_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid683_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5Pad40_uid684_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (39 downto 0);
    signal rightShiftStage0Idx5_uid685_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid686_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6Pad48_uid687_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx6_uid688_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid692_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid694_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid695_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid697_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid698_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3_uid700_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid701_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid703_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid704_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5Pad5_uid705_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage1Idx5_uid706_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid707_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6Pad6_uid708_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx6_uid709_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid710_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7Pad7_uid711_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage1Idx7_uid712_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid722_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid725_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad12_uid726_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid728_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid731_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Pad20_uid732_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid734_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid737_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid743_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid746_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid749_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid757_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid759_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid760_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid762_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid763_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3_uid765_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid766_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4_uid768_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid769_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5_uid771_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid772_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6_uid774_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid778_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid780_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid781_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid783_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid784_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3_uid786_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid787_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid789_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid790_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5_uid792_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid793_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6_uid795_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid796_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7_uid798_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid808_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid811_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid814_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid817_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid820_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid823_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid829_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid832_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid835_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset : std_logic;
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset : std_logic;
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset : std_logic;
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset : std_logic;
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist4_cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist17_sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist30_signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist35_signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist61_signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cAmA_uid388_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,387)
    cAmA_uid388_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11100";

    -- zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,604)
    zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000000000";

    -- frac_x_uid217_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,216)@0
    frac_x_uid217_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= a2(22 downto 0);

    -- cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,15)
    cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000000000000000000";

    -- fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,219)@0 + 1
    fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid217_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,989)
    redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,14)
    cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "11111111";

    -- expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,208)@0
    expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= a2(30 downto 23);

    -- expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,218)@0 + 1
    expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,990)
    redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,221)@3
    excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q;

    -- cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,16)
    cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000";

    -- expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,209)@0
    expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= b2(30 downto 23);

    -- excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,231)@0 + 1
    excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,988)
    redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,288)@3
    excYZAndExcXI_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- frac_y_uid231_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,230)@0
    frac_y_uid231_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= b2(22 downto 0);

    -- fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,233)@0 + 1
    fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid231_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,986)
    redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,232)@0 + 1
    expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,987)
    redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,235)@3
    excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q;

    -- excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,217)@0 + 1
    excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= "1" WHEN expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,991)
    redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,289)@3
    excXZAndExcYI_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- ZeroTimesInf_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,290)@3
    ZeroTimesInf_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXZAndExcYI_uid290_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYZAndExcXI_uid289_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- fracXIsNotZero_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,234)@3
    fracXIsNotZero_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist37_fracXIsZero_uid234_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excN_y_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,236)@3
    excN_y_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and fracXIsNotZero_uid235_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- fracXIsNotZero_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,220)@3
    fracXIsNotZero_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist40_fracXIsZero_uid220_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excN_x_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,222)@3
    excN_x_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and fracXIsNotZero_uid221_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excRNaN_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,291)@3
    excRNaN_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excN_x_uid223_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excN_y_uid237_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or ZeroTimesInf_uid291_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- invExcRNaN_uid304_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,303)@3
    invExcRNaN_uid304_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (excRNaN_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- signY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,211)@0
    signY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(b2(31 downto 31));

    -- signX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,210)@0
    signX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(a2(31 downto 31));

    -- signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,250)@0 + 1
    signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= signX_uid211_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b xor signY_uid212_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist35_signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3(DELAY,984)
    redist35_signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist35_signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,304)@3 + 1
    signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi <= redist35_signR_uid251_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and invExcRNaN_uid304_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_qi, xout => signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist30_signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,979)
    redist30_signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist30_signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- ofracX_uid243_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,242)@0
    ofracX_uid243_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= VCC_q & frac_x_uid217_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select(BITSELECT,929)@0
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid243_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(17 downto 0);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid243_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid246_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,245)@0
    ofracY_uid246_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= VCC_q & frac_y_uid231_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select(BITSELECT,930)@0
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid246_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(17 downto 0);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid246_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6(MULT,882)@0 + 2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset <= areset;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_a0,
        datab => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1
    );
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_s1;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15(BITSHIFT,891)@2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3(MULT,879)@0 + 2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset <= areset;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_a0,
        datab => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1
    );
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_s1;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13(BITSHIFT,889)@2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9(MULT,885)@0 + 2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset <= areset;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_component : lpm_mult
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
        dataa => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_a0,
        datab => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1
    );
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_s1;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0(MULT,876)@0 + 2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0 <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset <= areset;
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_a0,
        datab => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1
    );
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_s1;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12(BITJOIN,888)@2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im9_q & prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_im0_q;

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0(ADD,893)@2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_join_12_q);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_13_q);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_b));
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0(ADD,894)@2
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_0_0_q);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_align_15_q);
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_b));
    prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,602)@2
    osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= prodXY_uid602_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,251)@2
    normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(47 downto 47));

    -- roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,67)
    roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "010";

    -- fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,253)@2
    fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,254)@2
    fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,255)@2
    fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNormLow_uid255_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNormHigh_uid254_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,263)@2
    fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,257)@2
    extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,258)@2
    extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
    extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= extraStickyBitOfProd_uid258_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,256)@2
    stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= osig_uid603_prod_uid250_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(21 downto 0);
    stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,259)@2
    stickyExtendedRange_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= extraStickyBit_uid259_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & stickyRange_uid257_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b;

    -- stickyRangeComparator_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,261)@2
    stickyRangeComparator_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid260_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q = cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid263_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,262)@2
    sticky_uid263_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (stickyRangeComparator_uid262_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- lrs_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,264)@2
    lrs_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= fracRPostNorm1dto0_uid264_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b & sticky_uid263_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,266)@2
    roundBitDetectionPattern_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "1" WHEN lrs_uid265_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q = roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid268_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,267)@2
    roundBit_uid268_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (roundBitDetectionPattern_uid267_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,270)@2
    roundBitAndNormalizationOp_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= GND_q & normalizeBit_uid252_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b & cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid268_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,49)
    biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "0001111111";

    -- expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(ADD,246)@0 + 1
    expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid209_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b);
    expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid210_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b);
    expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) + UNSIGNED(expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(8 downto 0);

    -- redist36_expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,985)
    redist36_expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist36_expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(SUB,248)@2
    expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist36_expSum_uid247_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q));
    expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,268)@2
    expFracPreRound_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expSumMBias_uid249_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & fracRPostNorm_uid256_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(ADD,271)@2
    expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(34)) & expFracPreRound_uid269_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q));
    expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid271_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q));
    expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,273)@2
    expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,274)@2
    expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(7 downto 0);

    -- redist33_expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1(DELAY,982)
    redist33_expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, xout => redist33_expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(COMPARE,277)@2 + 1
    expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(11)) & expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n(0) <= not (expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(13));

    -- invExpXIsMax_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,237)@3
    invExpXIsMax_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist38_expXIsMax_uid233_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- InvExpXIsZero_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,238)@3
    InvExpXIsZero_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,239)@3
    excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= InvExpXIsZero_uid239_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and invExpXIsMax_uid238_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- invExpXIsMax_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,223)@3
    invExpXIsMax_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist41_expXIsMax_uid219_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- InvExpXIsZero_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,224)@3
    InvExpXIsZero_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= not (redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q);

    -- excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,225)@3
    excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= InvExpXIsZero_uid225_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and invExpXIsMax_uid224_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,286)@3
    ExcROvfAndInReg_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and expOvf_uid278_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n;

    -- excYRAndExcXI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,285)@3
    excYRAndExcXI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXRAndExcYI_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,284)@3
    excXRAndExcYI_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXIAndExcYI_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,283)@3
    excXIAndExcYI_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excI_x_uid222_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excI_y_uid236_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excRInf_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,287)@3
    excRInf_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXIAndExcYI_uid284_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excXRAndExcYI_uid285_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYRAndExcXI_uid286_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or ExcROvfAndInReg_uid287_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(COMPARE,275)@2 + 1
    expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b(11)) & expRPreExcExt_uid274_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
    expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_a) - SIGNED(expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n(0) <= not (expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_o(13));

    -- excZC3_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,281)@3
    excZC3_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q and expUdf_uid276_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_n;

    -- excYZAndExcXR_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,280)@3
    excYZAndExcXR_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excR_x_uid226_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXZAndExcYR_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,279)@3
    excXZAndExcYR_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and excR_y_uid240_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excXZAndExcYZ_uid279_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,278)@3
    excXZAndExcYZ_uid279_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist42_excZ_x_uid218_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q and redist39_excZ_y_uid232_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_3_q;

    -- excRZero_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOGICAL,282)@3
    excRZero_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excXZAndExcYZ_uid279_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excXZAndExcYR_uid280_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excYZAndExcXR_uid281_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q or excZC3_uid282_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- concExc_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,292)@3
    concExc_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= excRNaN_uid292_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & excRInf_uid288_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q & excRZero_uid283_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;

    -- excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(LOOKUP,293)@3
    excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_combproc: PROCESS (concExc_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid293_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,302)@3 + 1
    expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
                WHEN "00" => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN "01" => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist33_expRPreExc_uid275_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q;
                WHEN "10" => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN "11" => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN OTHERS => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist31_expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,980)
    redist31_expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist31_expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(CONSTANT,96)
    oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00000000000000000000001";

    -- fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITSELECT,272)@2
    fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in <= expFracRPostRounding_uid272_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b <= fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_in(23 downto 1);

    -- redist34_fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1(DELAY,983)
    redist34_fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b, xout => redist34_fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(MUX,297)@3 + 1
    fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s <= excREnc_uid294_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q;
    fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_s) IS
                WHEN "00" => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN "01" => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist34_fracRPreExc_uid273_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_b_1_q;
                WHEN "10" => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN "11" => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
                WHEN OTHERS => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist32_fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2(DELAY,981)
    redist32_fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q, xout => redist32_fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct(BITJOIN,305)@5
    R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q <= redist30_signRPostExc_uid305_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q & redist31_expRPostExc_uid303_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q & redist32_fracRPostExc_uid298_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q_2_q;

    -- sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,454)@5
    sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(31 downto 31));

    -- redist17_sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,966)
    redist17_sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist17_sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,456)@5
    expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(30 downto 23);

    -- redist15_expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,964)
    redist15_expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist15_expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,455)@5
    fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(22 downto 0);

    -- redist16_fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,965)
    redist16_fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist16_fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,457)@6
    ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist17_sigY_uid455_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q & redist15_expY_uid457_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q & redist16_fracY_uid456_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q;

    -- frac_x_uid118_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,117)@0
    frac_x_uid118_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= a1(22 downto 0);

    -- fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,120)@0 + 1
    fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid118_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1003)
    redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,109)@0
    expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= a1(30 downto 23);

    -- expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,119)@0 + 1
    expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1004)
    redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,122)@2
    excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q;

    -- expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,110)@0
    expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= b1(30 downto 23);

    -- excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,132)@0 + 1
    excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1000)
    redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,189)@2
    excYZAndExcXI_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- frac_y_uid132_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,131)@0
    frac_y_uid132_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= b1(22 downto 0);

    -- fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,134)@0 + 1
    fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid132_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,997)
    redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,133)@0 + 1
    expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,998)
    redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,136)@2
    excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q;

    -- excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,118)@0 + 1
    excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= "1" WHEN expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,1006)
    redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,190)@2
    excXZAndExcYI_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ZeroTimesInf_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,191)@2
    ZeroTimesInf_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXZAndExcYI_uid191_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYZAndExcXI_uid190_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- fracXIsNotZero_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,135)@2
    fracXIsNotZero_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist48_fracXIsZero_uid135_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q);

    -- excN_y_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,137)@2
    excN_y_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and fracXIsNotZero_uid136_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- fracXIsNotZero_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,121)@2
    fracXIsNotZero_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist54_fracXIsZero_uid121_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q);

    -- excN_x_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,123)@2
    excN_x_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q and fracXIsNotZero_uid122_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,192)@2 + 1
    excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= excN_x_uid124_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excN_y_uid138_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or ZeroTimesInf_uid192_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid205_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,204)@3
    invExcRNaN_uid205_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- signY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,112)@0
    signY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(b1(31 downto 31));

    -- signX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,111)@0
    signX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(a1(31 downto 31));

    -- signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,151)@0 + 1
    signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi <= signX_uid112_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b xor signY_uid113_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_qi, xout => signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist45_signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,994)
    redist45_signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist45_signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,205)@3
    signRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist45_signR_uid152_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and invExcRNaN_uid205_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ofracX_uid144_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,143)@0
    ofracX_uid144_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= VCC_q & frac_x_uid118_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select(BITSELECT,927)@0
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid144_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(17 downto 0);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid144_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid147_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,146)@0
    ofracY_uid147_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= VCC_q & frac_y_uid132_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select(BITSELECT,928)@0
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid147_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(17 downto 0);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid147_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6(MULT,863)@0 + 2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset <= areset;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_a0,
        datab => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1
    );
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_s1;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15(BITSHIFT,872)@2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3(MULT,860)@0 + 2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset <= areset;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_a0,
        datab => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1
    );
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_s1;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13(BITSHIFT,870)@2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9(MULT,866)@0 + 2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset <= areset;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_component : lpm_mult
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
        dataa => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_a0,
        datab => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1
    );
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_s1;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0(MULT,857)@0 + 2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0 <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset <= areset;
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_a0,
        datab => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1
    );
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_s1;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12(BITJOIN,869)@2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im9_q & prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_im0_q;

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0(ADD,874)@2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_join_12_q);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_13_q);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_b));
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0(ADD,875)@2
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_0_0_q);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_align_15_q);
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_b));
    prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,599)@2
    osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= prodXY_uid599_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,152)@2
    normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(47 downto 47));

    -- fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,154)@2
    fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,155)@2
    fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,156)@2
    fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNormLow_uid156_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNormHigh_uid155_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,164)@2
    fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,158)@2
    extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,159)@2
    extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
    extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= extraStickyBitOfProd_uid159_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,157)@2
    stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= osig_uid600_prod_uid151_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(21 downto 0);
    stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,160)@2
    stickyExtendedRange_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= extraStickyBit_uid160_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & stickyRange_uid158_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b;

    -- stickyRangeComparator_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,162)@2
    stickyRangeComparator_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid161_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q = cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid164_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,163)@2
    sticky_uid164_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (stickyRangeComparator_uid163_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- lrs_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,165)@2
    lrs_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= fracRPostNorm1dto0_uid165_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b & sticky_uid164_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,167)@2
    roundBitDetectionPattern_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "1" WHEN lrs_uid166_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q = roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid169_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,168)@2
    roundBit_uid169_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (roundBitDetectionPattern_uid168_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,171)@2
    roundBitAndNormalizationOp_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= GND_q & normalizeBit_uid153_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b & cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid169_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(ADD,147)@0 + 1
    expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid110_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b);
    expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid111_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b);
    expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) + UNSIGNED(expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(8 downto 0);

    -- redist46_expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2(DELAY,995)
    redist46_expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist46_expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(SUB,149)@2
    expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist46_expSum_uid148_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q));
    expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,169)@2
    expFracPreRound_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expSumMBias_uid150_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & fracRPostNorm_uid157_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(ADD,172)@2
    expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(34)) & expFracPreRound_uid170_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q));
    expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid172_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q));
    expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,174)@2
    expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,175)@2
    expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(7 downto 0);

    -- redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1(DELAY,992)
    redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, xout => redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(COMPARE,178)@2 + 1
    expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(11)) & expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n(0) <= not (expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(13));

    -- redist50_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,999)
    redist50_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist49_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist50_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,138)@3
    invExpXIsMax_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist50_expXIsMax_uid134_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1001)
    redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist51_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,139)@3
    InvExpXIsZero_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,140)@3
    excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= InvExpXIsZero_uid140_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and invExpXIsMax_uid139_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- redist56_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1005)
    redist56_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist55_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist56_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,124)@3
    invExpXIsMax_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist56_expXIsMax_uid120_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3(DELAY,1007)
    redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist57_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_2_q, xout => redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,125)@3
    InvExpXIsZero_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= not (redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q);

    -- excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,126)@3
    excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= InvExpXIsZero_uid126_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and invExpXIsMax_uid125_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,187)@3
    ExcROvfAndInReg_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and expOvf_uid179_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n;

    -- redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1(DELAY,1002)
    redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,186)@3
    excYRAndExcXI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1(DELAY,996)
    redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q, xout => redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,185)@3
    excXRAndExcYI_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- excXIAndExcYI_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,184)@3
    excXIAndExcYI_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist53_excI_x_uid123_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q and redist47_excI_y_uid137_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_1_q;

    -- excRInf_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,188)@3
    excRInf_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXIAndExcYI_uid185_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excXRAndExcYI_uid186_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYRAndExcXI_uid187_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or ExcROvfAndInReg_uid188_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(COMPARE,176)@2 + 1
    expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b(11)) & expRPreExcExt_uid175_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
    expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_a) - SIGNED(expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n(0) <= not (expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_o(13));

    -- excZC3_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,182)@3
    excZC3_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q and expUdf_uid177_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_n;

    -- excYZAndExcXR_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,181)@3
    excYZAndExcXR_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and excR_x_uid127_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excXZAndExcYR_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,180)@3
    excXZAndExcYR_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and excR_y_uid141_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excXZAndExcYZ_uid180_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,179)@3
    excXZAndExcYZ_uid180_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist58_excZ_x_uid119_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q and redist52_excZ_y_uid133_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q_3_q;

    -- excRZero_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOGICAL,183)@3
    excRZero_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excXZAndExcYZ_uid180_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excXZAndExcYR_uid181_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excYZAndExcXR_uid182_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q or excZC3_uid183_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- concExc_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,193)@3
    concExc_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= excRNaN_uid193_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & excRInf_uid189_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & excRZero_uid184_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(LOOKUP,194)@3
    excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (concExc_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid194_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,203)@3
    expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist43_expRPreExc_uid176_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITSELECT,173)@2
    fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in <= expFracRPostRounding_uid173_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b <= fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_in(23 downto 1);

    -- redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1(DELAY,993)
    redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b, xout => redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(MUX,198)@3
    fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s <= excREnc_uid195_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;
    fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q, oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= redist44_fracRPreExc_uid174_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct(BITJOIN,206)@3
    R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q <= signRPostExc_uid206_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & expRPostExc_uid204_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q & fracRPostExc_uid199_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q;

    -- sigY_uid311_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,310)@3
    sigY_uid311_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(31 downto 31));

    -- expY_uid313_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,312)@3
    expY_uid313_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(30 downto 23);

    -- fracY_uid312_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,311)@3
    fracY_uid312_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(22 downto 0);

    -- ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,313)@3
    ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= sigY_uid311_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & expY_uid313_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & fracY_uid312_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- frac_x_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,18)@0
    frac_x_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= a0(22 downto 0);

    -- fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,21)@0 + 1
    fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_x_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1015)
    redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,10)@0
    expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= a0(30 downto 23);

    -- expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,20)@0 + 1
    expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1016)
    redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,23)@2
    excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q;

    -- expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,11)@0
    expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= b0(30 downto 23);

    -- excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,33)@0 + 1
    excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1014)
    redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,90)@2
    excYZAndExcXI_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- frac_y_uid33_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,32)@0
    frac_y_uid33_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= b0(22 downto 0);

    -- fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,35)@0 + 1
    fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_y_uid33_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1012)
    redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,34)@0 + 1
    expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1013)
    redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,37)@2
    excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q;

    -- excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,19)@0 + 1
    excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= "1" WHEN expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1017)
    redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,91)@2
    excXZAndExcYI_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ZeroTimesInf_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,92)@2
    ZeroTimesInf_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXZAndExcYI_uid92_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYZAndExcXI_uid91_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- fracXIsNotZero_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,36)@2
    fracXIsNotZero_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist63_fracXIsZero_uid36_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excN_y_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,38)@2
    excN_y_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and fracXIsNotZero_uid37_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- fracXIsNotZero_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,22)@2
    fracXIsNotZero_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist66_fracXIsZero_uid22_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excN_x_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,24)@2
    excN_x_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and fracXIsNotZero_uid23_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,93)@2 + 1
    excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excN_x_uid25_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excN_y_uid39_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or ZeroTimesInf_uid93_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid106_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,105)@3
    invExcRNaN_uid106_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- signY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,13)@0
    signY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(b0(31 downto 31));

    -- signX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,12)@0
    signX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(a0(31 downto 31));

    -- signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,52)@0 + 1
    signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= signX_uid13_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b xor signY_uid14_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist61_signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3(DELAY,1010)
    redist61_signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist61_signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,106)@3
    signRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist61_signR_uid53_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_3_q and invExcRNaN_uid106_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ofracX_uid45_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,44)@0
    ofracX_uid45_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= VCC_q & frac_x_uid19_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select(BITSELECT,925)@0
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b <= ofracX_uid45_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(17 downto 0);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c <= ofracX_uid45_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 18);

    -- ofracY_uid48_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,47)@0
    ofracY_uid48_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= VCC_q & frac_y_uid33_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select(BITSELECT,926)@0
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b <= ofracY_uid48_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(17 downto 0);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c <= ofracY_uid48_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 18);

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6(MULT,844)@0 + 2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset <= areset;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_component : lpm_mult
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
        dataa => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_a0,
        datab => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_reset,
        clock => clk,
        result => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1
    );
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_s1;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15(BITSHIFT,853)@2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im6_q & "000000000000000000";
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_qint(41 downto 0);

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3(MULT,841)@0 + 2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset <= areset;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_component : lpm_mult
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
        dataa => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_a0,
        datab => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_reset,
        clock => clk,
        result => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1
    );
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_s1;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13(BITSHIFT,851)@2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im3_q & "000000000000000000";
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_qint(41 downto 0);

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9(MULT,847)@0 + 2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_c;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_c;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset <= areset;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_component : lpm_mult
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
        dataa => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_a0,
        datab => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_reset,
        clock => clk,
        result => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1
    );
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_s1;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0(MULT,838)@0 + 2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs1_merged_bit_select_b;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0 <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_bs2_merged_bit_select_b;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset <= areset;
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_component : lpm_mult
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
        dataa => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_a0,
        datab => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_reset,
        clock => clk,
        result => prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1
    );
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_s1;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12(BITJOIN,850)@2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im9_q & prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_im0_q;

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0(ADD,855)@2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_join_12_q);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_13_q);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_a) + UNSIGNED(prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_b));
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_o(48 downto 0);

    -- prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0(ADD,856)@2
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_0_0_q);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000" & prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_align_15_q);
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_a) + UNSIGNED(prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_b));
    prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_o(49 downto 0);

    -- osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,596)@2
    osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= prodXY_uid596_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_result_add_1_0_q(47 downto 0);
    osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(47 downto 0);

    -- normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,53)@2
    normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(47 downto 47));

    -- fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,55)@2
    fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(46 downto 0);
    fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(46 downto 23);

    -- fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,56)@2
    fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(45 downto 0);
    fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(45 downto 22);

    -- fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,57)@2
    fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b)
    BEGIN
        CASE (fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "0" => fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNormLow_uid57_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN "1" => fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNormHigh_uid56_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN OTHERS => fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,65)@2
    fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(1 downto 0);
    fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(1 downto 0);

    -- extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,59)@2
    extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= STD_LOGIC_VECTOR(osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(22 downto 0));
    extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(22 downto 22));

    -- extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,60)@2
    extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
    extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, GND_q, extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b)
    BEGIN
        CASE (extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "0" => extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= GND_q;
            WHEN "1" => extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= extraStickyBitOfProd_uid60_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;
            WHEN OTHERS => extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,58)@2
    stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= osig_uid597_prod_uid52_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(21 downto 0);
    stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(21 downto 0);

    -- stickyExtendedRange_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,61)@2
    stickyExtendedRange_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= extraStickyBit_uid61_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & stickyRange_uid59_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b;

    -- stickyRangeComparator_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,63)@2
    stickyRangeComparator_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "1" WHEN stickyExtendedRange_uid62_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- sticky_uid65_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,64)@2
    sticky_uid65_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (stickyRangeComparator_uid64_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- lrs_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,66)@2
    lrs_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= fracRPostNorm1dto0_uid66_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b & sticky_uid65_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- roundBitDetectionPattern_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,68)@2
    roundBitDetectionPattern_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "1" WHEN lrs_uid67_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = roundBitDetectionConstant_uid68_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- roundBit_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,69)@2
    roundBit_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (roundBitDetectionPattern_uid69_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q);

    -- roundBitAndNormalizationOp_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,72)@2
    roundBitAndNormalizationOp_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= GND_q & normalizeBit_uid54_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b & cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & roundBit_uid70_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(ADD,48)@0 + 1
    expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expX_uid11_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b);
    expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & expY_uid12_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b);
    expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) + UNSIGNED(expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(8 downto 0);

    -- redist62_expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2(DELAY,1011)
    redist62_expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, xout => redist62_expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(SUB,50)@2
    expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist62_expSum_uid49_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q));
    expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(9)) & biasInc_uid50_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(10 downto 0);

    -- expFracPreRound_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,70)@2
    expFracPreRound_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expSumMBias_uid51_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & fracRPostNorm_uid58_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(ADD,73)@2
    expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(34)) & expFracPreRound_uid71_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid73_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) + SIGNED(expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(35 downto 0);

    -- expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,75)@2
    expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(35 downto 24));

    -- expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,76)@2
    expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(7 downto 0);
    expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(7 downto 0);

    -- redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1(DELAY,1008)
    redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, xout => redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(COMPARE,79)@2
    expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(11)) & expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q));
    expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n(0) <= not (expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(13));

    -- invExpXIsMax_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,39)@2
    invExpXIsMax_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist64_expXIsMax_uid35_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- InvExpXIsZero_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,40)@2
    InvExpXIsZero_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,41)@2
    excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= InvExpXIsZero_uid41_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and invExpXIsMax_uid40_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- invExpXIsMax_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,25)@2
    invExpXIsMax_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist67_expXIsMax_uid21_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- InvExpXIsZero_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,26)@2
    InvExpXIsZero_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= not (redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q);

    -- excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,27)@2
    excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= InvExpXIsZero_uid27_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and invExpXIsMax_uid26_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,88)@2 + 1
    ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and expOvf_uid80_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n;
    ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,87)@2 + 1
    excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,86)@2 + 1
    excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,85)@2 + 1
    excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excI_x_uid24_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excI_y_uid38_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRInf_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,89)@3
    excRInf_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXIAndExcYI_uid86_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excXRAndExcYI_uid87_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYRAndExcXI_uid88_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or ExcROvfAndInReg_uid89_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(COMPARE,77)@2
    expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b(11)) & expRPreExcExt_uid76_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_a) - SIGNED(expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b));
    expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n(0) <= not (expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_o(13));

    -- excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,83)@2 + 1
    excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q and expUdf_uid78_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_n;
    excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,82)@2 + 1
    excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excR_x_uid28_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,81)@2 + 1
    excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and excR_y_uid42_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,80)@2 + 1
    excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi <= redist68_excZ_x_uid20_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q and redist65_excZ_y_uid34_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q_2_q;
    excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_qi, xout => excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRZero_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOGICAL,84)@3
    excRZero_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excXZAndExcYZ_uid81_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excXZAndExcYR_uid82_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excYZAndExcXR_uid83_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q or excZC3_uid84_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- concExc_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,94)@3
    concExc_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= excRNaN_uid94_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & excRInf_uid90_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & excRZero_uid85_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(LOOKUP,95)@3
    excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (concExc_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid95_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "100" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "110" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN "111" => excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,104)@3
    expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist59_expRPreExc_uid77_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q;
            WHEN "10" => expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITSELECT,74)@2
    fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in <= expFracRPostRounding_uid74_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b <= fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_in(23 downto 1);

    -- redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1(DELAY,1009)
    redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b, xout => redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(MUX,99)@3
    fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s <= excREnc_uid96_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
    fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q, oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= redist60_fracRPreExc_uid75_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_b_1_q;
            WHEN "10" => fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct(BITJOIN,107)@3
    R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q <= signRPostExc_uid107_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & expRPostExc_uid105_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & fracRPostExc_uid100_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- expFracY_uid309_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,308)@3
    expFracY_uid309_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= R_uid207_dotProdIEEEAssemblymult_1_uid7_fpScalarProduct_q(30 downto 0);

    -- expFracX_uid308_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,307)@3
    expFracX_uid308_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q(30 downto 0);

    -- xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(COMPARE,309)@3
    xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expFracX_uid308_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b);
    xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expFracY_uid309_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b);
    xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) - UNSIGNED(xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n(0) <= not (xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(32));

    -- bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,318)@3
    bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n;
    bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "1" => bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,352)@3
    sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(31 downto 31));

    -- redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1(DELAY,969)
    redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, xout => redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,317)@3
    aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= xGTEy_uid310_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n;
    aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= ypn_uid314_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "1" => aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= R_uid108_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,351)@3
    sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(31 downto 31));

    -- redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1(DELAY,971)
    redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, xout => redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,353)@4
    effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q xor redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q;

    -- exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,336)@3
    exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(30 downto 0);
    exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(30 downto 23);

    -- exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,322)@3
    exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(30 downto 0);
    exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(30 downto 23);

    -- expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(SUB,361)@3
    expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b);
    expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b);
    expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) - UNSIGNED(expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(8 downto 0);

    -- cWFP2_uid363_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,362)
    cWFP2_uid363_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11001";

    -- shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(COMPARE,364)@3
    shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid363_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_c(0) <= shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(10);

    -- iShiftedOut_uid369_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,368)@3
    iShiftedOut_uid369_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (shiftedOut_uid365_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_c);

    -- rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,688)
    rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx7Pad7_uid711_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,710)
    rightShiftStage1Idx7Pad7_uid711_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000";

    -- rightShiftStage0Idx6Pad48_uid687_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,686)
    rightShiftStage0Idx6Pad48_uid687_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "000000000000000000000000000000000000000000000000";

    -- excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,338)@3
    excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,345)@3
    InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,337)@3
    frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= bSig_uid319_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(22 downto 0);
    frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(22 downto 0);

    -- fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,357)@3
    fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;
            WHEN "1" => fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid361_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,360)@3
    oFracB_uid361_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & fracBz_uid358_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- padConst_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,365)
    padConst_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,366)@3
    rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= oFracB_uid361_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & padConst_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- rightShiftStage0Idx6Rng48_uid686_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,685)@3
    rightShiftStage0Idx6Rng48_uid686_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 48);

    -- rightShiftStage0Idx6_uid688_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,687)@3
    rightShiftStage0Idx6_uid688_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage0Idx6Pad48_uid687_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx6Rng48_uid686_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0Idx5Pad40_uid684_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,683)
    rightShiftStage0Idx5Pad40_uid684_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000000000000000000000000000000000";

    -- rightShiftStage0Idx5Rng40_uid683_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,682)@3
    rightShiftStage0Idx5Rng40_uid683_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 40);

    -- rightShiftStage0Idx5_uid685_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,684)@3
    rightShiftStage0Idx5_uid685_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage0Idx5Pad40_uid684_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx5Rng40_uid683_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0Idx4Pad32_uid681_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,680)
    rightShiftStage0Idx4Pad32_uid681_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng32_uid680_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,679)@3
    rightShiftStage0Idx4Rng32_uid680_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 32);

    -- rightShiftStage0Idx4_uid682_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,681)@3
    rightShiftStage0Idx4_uid682_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage0Idx4Pad32_uid681_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx4Rng32_uid680_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1(MUX,898)@3
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s, rightShiftStage0Idx4_uid682_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx5_uid685_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx6_uid688_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx4_uid682_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx5_uid685_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx6_uid688_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,677)
    rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "000000000000000000000000";

    -- rightShiftStage0Idx3Rng24_uid677_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,676)@3
    rightShiftStage0Idx3Rng24_uid677_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 24);

    -- rightShiftStage0Idx3_uid679_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,678)@3
    rightShiftStage0Idx3_uid679_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx3Rng24_uid677_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0Idx2Rng16_uid674_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,673)@3
    rightShiftStage0Idx2Rng16_uid674_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 16);

    -- rightShiftStage0Idx2_uid676_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,675)@3
    rightShiftStage0Idx2_uid676_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx2Rng16_uid674_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0Idx1Rng8_uid671_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,670)@3
    rightShiftStage0Idx1Rng8_uid671_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 8);

    -- rightShiftStage0Idx1_uid673_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,672)@3
    rightShiftStage0Idx1_uid673_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & rightShiftStage0Idx1Rng8_uid671_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0(MUX,897)@3
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s, rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx1_uid673_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx2_uid676_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage0Idx3_uid679_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightPaddedIn_uid367_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx1_uid673_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx2_uid676_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx3_uid679_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,931)@3
    rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_in <= expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(5 downto 0);
    rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,943)@3
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal(MUX,899)@3
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s, rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q, rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid710_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,709)@3
    rightShiftStage1Idx7Rng7_uid710_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid712_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,711)@3
    rightShiftStage1Idx7_uid712_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage1Idx7Pad7_uid711_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx7Rng7_uid710_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage1Idx6Pad6_uid708_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,707)
    rightShiftStage1Idx6Pad6_uid708_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "000000";

    -- rightShiftStage1Idx6Rng6_uid707_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,706)@3
    rightShiftStage1Idx6Rng6_uid707_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid709_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,708)@3
    rightShiftStage1Idx6_uid709_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage1Idx6Pad6_uid708_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx6Rng6_uid707_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage1Idx5Pad5_uid705_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,704)
    rightShiftStage1Idx5Pad5_uid705_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00000";

    -- rightShiftStage1Idx5Rng5_uid704_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,703)@3
    rightShiftStage1Idx5Rng5_uid704_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid706_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,705)@3
    rightShiftStage1Idx5_uid706_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage1Idx5Pad5_uid705_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx5Rng5_uid704_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,618)
    zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000";

    -- rightShiftStage1Idx4Rng4_uid701_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,700)@3
    rightShiftStage1Idx4Rng4_uid701_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid703_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,702)@3
    rightShiftStage1Idx4_uid703_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx4Rng4_uid701_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1(MUX,903)@3
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s, rightShiftStage1Idx4_uid703_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage1Idx5_uid706_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage1Idx6_uid709_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage1Idx7_uid712_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx4_uid703_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "01" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx5_uid706_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx6_uid709_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx7_uid712_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,698)
    rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid698_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,697)@3
    rightShiftStage1Idx3Rng3_uid698_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid700_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,699)@3
    rightShiftStage1Idx3_uid700_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx3Rng3_uid698_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,624)
    zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00";

    -- rightShiftStage1Idx2Rng2_uid695_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,694)@3
    rightShiftStage1Idx2Rng2_uid695_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid697_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,696)@3
    rightShiftStage1Idx2_uid697_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx2Rng2_uid695_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage1Idx1Rng1_uid692_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,691)@3
    rightShiftStage1Idx1Rng1_uid692_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid694_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,693)@3
    rightShiftStage1Idx1_uid694_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= GND_q & rightShiftStage1Idx1Rng1_uid692_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0(MUX,902)@3
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s, rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q, rightShiftStage1Idx1_uid694_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage1Idx2_uid697_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, rightShiftStage1Idx3_uid700_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage0_uid691_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q;
            WHEN "01" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx1_uid694_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx2_uid697_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx3_uid700_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,944)@3
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c(1 downto 0);
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid690_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c(2 downto 2);

    -- rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal(MUX,904)@3
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s, rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q, rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid669_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,668)
    wIntCst_uid669_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "110001";

    -- shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(COMPARE,669)@3
    shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid362_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid669_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n(0) <= not (shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(10));

    -- r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,715)@3
    r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= shiftedOut_uid670_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_n;
    r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q, rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage1_uid714_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q;
            WHEN "1" => r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,369)@3 + 1
    alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid369_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(0)) & iShiftedOut_uid369_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q));
    alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= r_uid716_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;
    alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,932)@4
    stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(22 downto 0);
    stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= alignFracBPostShiftOut_uid370_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(48 downto 23);

    -- fracBAddOp_uid382_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,381)@4
    fracBAddOp_uid382_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= GND_q & stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c;

    -- fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,382)@4
    fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(0)) & effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q));
    fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= fracBAddOp_uid382_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q xor fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,377)
    zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "01";

    -- frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,323)@3
    frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= aSig_uid318_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(22 downto 0);
    frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(22 downto 0);

    -- redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1(DELAY,977)
    redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, xout => redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid373_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,372)@4
    cmpEQ_stickyBits_cZwF_uid373_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN stickyBits_uid371_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b = cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- effSubInvSticky_uid376_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,375)@4
    effSubInvSticky_uid376_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and cmpEQ_stickyBits_cZwF_uid373_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracAAddOp_uid379_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,378)@4
    fracAAddOp_uid379_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q & GND_q & effSubInvSticky_uid376_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(ADD,383)@4
    fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid379_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid383_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) + UNSIGNED(fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,384)@4
    rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracAddResult_uid384_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid374_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,373)@4
    invCmpEQ_stickyBits_cZwF_uid374_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (cmpEQ_stickyBits_cZwF_uid373_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,385)@4
    fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rangeFracAddResultMwfp3Dto0_uid385_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & invCmpEQ_stickyBits_cZwF_uid374_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,605)@4
    rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(27 downto 12);

    -- vCount_uid607_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,606)@4
    vCount_uid607_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,608)@4
    vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(11 downto 0);
    vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(11 downto 0);

    -- mO_uid608_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,607)
    mO_uid608_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1111";

    -- cStage_uid610_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,609)@4
    cStage_uid610_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & mO_uid608_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,611)@4
    vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= vCount_uid607_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, cStage_uid610_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid606_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;
            WHEN "1" => vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cStage_uid610_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,935)@4
    rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(15 downto 8);
    rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= vStagei_uid612_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(7 downto 0);

    -- vCount_uid615_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,614)@4
    vCount_uid615_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,617)@4
    vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= vCount_uid615_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b, rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid614_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,936)@4
    rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(7 downto 4);
    rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= vStagei_uid618_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(3 downto 0);

    -- vCount_uid621_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,620)@4
    vCount_uid621_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b = zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,623)@4
    vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= vCount_uid621_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b, rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid620_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,937)@4
    rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(3 downto 2);
    rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= vStagei_uid624_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(1 downto 0);

    -- vCount_uid627_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,626)@4
    vCount_uid627_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b = zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,629)@4
    vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= vCount_uid627_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b, rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rVStage_uid626_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid632_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,631)@4
    rVStage_uid632_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= vStagei_uid630_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(1 downto 1);

    -- vCount_uid633_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,632)@4
    vCount_uid633_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rVStage_uid632_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = GND_q ELSE "0";

    -- r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,633)@4
    r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= vCount_uid607_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & vCount_uid615_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & vCount_uid621_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & vCount_uid627_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & vCount_uid633_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,388)@4 + 1
    aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q = cAmA_uid388_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";
    aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invAMinusA_uid431_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,430)@5
    invAMinusA_uid431_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2(DELAY,972)
    redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, xout => redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,339)@3 + 1
    expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN exp_bSig_uid337_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2(DELAY,975)
    redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid345_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,344)@5
    invExpXIsMax_uid345_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q);

    -- redist24_InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2(DELAY,973)
    redist24_InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist24_InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excR_bSig_uid347_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,346)@5
    excR_bSig_uid347_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist24_InvExpXIsZero_uid346_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q and invExpXIsMax_uid345_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1(DELAY,978)
    redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, xout => redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,325)@4 + 1
    expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid331_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,330)@5
    invExpXIsMax_uid331_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,324)@4 + 1
    excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid332_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,331)@5
    InvExpXIsZero_uid332_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,332)@5
    excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= InvExpXIsZero_uid332_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and invExpXIsMax_uid331_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- signRReg_uid432_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,431)@5
    signRReg_uid432_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and excR_bSig_uid347_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q and invAMinusA_uid431_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2(DELAY,970)
    redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q, xout => redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q, clk => clk, aclr => areset );

    -- redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2(DELAY,976)
    redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid436_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,435)@5
    excAZBZSigASigB_uid436_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q and redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q and redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q;

    -- excBZARSigA_uid437_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,436)@5
    excBZARSigA_uid437_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q and excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q;

    -- signRZero_uid438_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,437)@5
    signRZero_uid438_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excBZARSigA_uid437_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or excAZBZSigASigB_uid436_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,340)@3 + 1
    fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_bSig_uid338_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2(DELAY,974)
    redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,342)@5
    excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q and redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q;

    -- sigBBInf_uid433_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,432)@5
    sigBBInf_uid433_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist21_sigB_uid353_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q and excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,326)@4 + 1
    fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = redist28_frac_aSig_uid324_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q ELSE "0";
    fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_qi, xout => fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,328)@5
    excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- sigAAInf_uid434_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,433)@5
    sigAAInf_uid434_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist23_sigA_uid352_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_2_q and excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- signRInf_uid435_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,434)@5
    signRInf_uid435_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= sigAAInf_uid434_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or sigBBInf_uid433_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- signRInfRZRReg_uid439_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,438)@5
    signRInfRZRReg_uid439_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= signRInf_uid435_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or signRZero_uid438_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or signRReg_uid432_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracXIsNotZero_uid342_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,341)@5
    fracXIsNotZero_uid342_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (redist25_fracXIsZero_uid341_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q);

    -- excN_bSig_uid344_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,343)@5
    excN_bSig_uid344_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= redist26_expXIsMax_uid340_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q and fracXIsNotZero_uid342_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- fracXIsNotZero_uid328_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,327)@5
    fracXIsNotZero_uid328_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (fracXIsZero_uid327_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- excN_aSig_uid330_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,329)@5
    excN_aSig_uid330_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expXIsMax_uid326_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and fracXIsNotZero_uid328_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- excRNaN2_uid426_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,425)@5
    excRNaN2_uid426_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excN_aSig_uid330_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or excN_bSig_uid344_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1(DELAY,968)
    redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid427_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,426)@5
    excAIBISub_uid427_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q;

    -- excRNaN_uid428_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,427)@5
    excRNaN_uid428_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excAIBISub_uid427_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or excRNaN2_uid426_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- invExcRNaN_uid440_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,439)@5
    invExcRNaN_uid440_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (excRNaN_uid428_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- signRPostExc_uid441_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,440)@5
    signRPostExc_uid441_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= invExcRNaN_uid440_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and signRInfRZRReg_uid439_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- cRBit_uid401_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,400)
    cRBit_uid401_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,747)@5
    leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(24 downto 0);

    -- leftShiftStage1Idx3_uid749_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,748)@5
    leftShiftStage1Idx3_uid749_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx3Rng3_uid748_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,744)@5
    leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(25 downto 0);

    -- leftShiftStage1Idx2_uid746_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,745)@5
    leftShiftStage1Idx2_uid746_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx2Rng2_uid745_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,741)@5
    leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(26 downto 0);

    -- leftShiftStage1Idx1_uid743_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,742)@5
    leftShiftStage1Idx1_uid743_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx1Rng1_uid742_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & GND_q;

    -- leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,737)
    leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000000000000000000000";

    -- leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,735)@4
    leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(3 downto 0);

    -- leftShiftStage0Idx6_uid737_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,736)@4
    leftShiftStage0Idx6_uid737_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0Idx6Rng24_uid736_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,732)@4
    leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(7 downto 0);

    -- leftShiftStage0Idx5Pad20_uid732_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,731)
    leftShiftStage0Idx5Pad20_uid732_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00000000000000000000";

    -- leftShiftStage0Idx5_uid734_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,733)@4
    leftShiftStage0Idx5_uid734_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0Idx5Rng20_uid733_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & leftShiftStage0Idx5Pad20_uid732_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx4_uid731_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,730)@4
    leftShiftStage0Idx4_uid731_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= vStage_uid609_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1(MUX,908)@4
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_combproc: PROCESS (leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s, leftShiftStage0Idx4_uid731_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx5_uid734_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx6_uid737_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx4_uid731_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx5_uid734_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx6_uid737_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,726)@4
    leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(15 downto 0);

    -- leftShiftStage0Idx3Pad12_uid726_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,725)
    leftShiftStage0Idx3Pad12_uid726_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "000000000000";

    -- leftShiftStage0Idx3_uid728_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,727)@4
    leftShiftStage0Idx3_uid728_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0Idx3Rng12_uid727_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & leftShiftStage0Idx3Pad12_uid726_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,723)@4
    leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(19 downto 0);

    -- leftShiftStage0Idx2_uid725_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,724)@4
    leftShiftStage0Idx2_uid725_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0Idx2Rng8_uid724_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,720)@4
    leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(23 downto 0);

    -- leftShiftStage0Idx1_uid722_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,721)@4
    leftShiftStage0Idx1_uid722_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0Idx1Rng4_uid721_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0(MUX,907)@4
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_combproc: PROCESS (leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s, fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx1_uid722_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx2_uid725_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage0Idx3_uid728_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= fracGRS_uid386_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx1_uid722_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx2_uid725_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx3_uid728_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select(BITSELECT,938)@4
    leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b <= r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(4 downto 2);
    leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c <= r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(1 downto 0);

    -- leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,947)@4
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal(MUX,909)@4 + 1
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_s) IS
                WHEN "0" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_0_q;
                WHEN "1" => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_msplit_1_q;
                WHEN OTHERS => leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c_1(DELAY,949)
    redist0_leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c, xout => redist0_leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,750)@5
    leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= redist0_leftShiftStageSel4Dto2_uid739_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_merged_bit_select_c_1_q;
    leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q, leftShiftStage1Idx1_uid743_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage1Idx2_uid746_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, leftShiftStage1Idx3_uid749_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "00" => leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage0_uid740_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_mfinal_q;
            WHEN "01" => leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx1_uid743_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "10" => leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx2_uid746_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN "11" => leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= leftShiftStage1Idx3_uid749_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,398)@5
    LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(4 downto 0));
    LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(4 downto 4));

    -- Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,397)@5
    Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(3 downto 0));
    Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(3 downto 3));

    -- Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,396)@5
    Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(2 downto 0));
    Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(2 downto 2));

    -- Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,395)@5
    Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(1 downto 0));
    Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(1 downto 1));

    -- Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,394)@5
    Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(0 downto 0));
    Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(0 downto 0));

    -- rndBitCond_uid400_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,399)@5
    rndBitCond_uid400_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= LSB_uid399_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & Guard_uid398_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & Round_uid397_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & Sticky1_uid396_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b & Sticky0_uid395_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rBi_uid402_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,401)@5
    rBi_uid402_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rndBitCond_uid400_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q = cRBit_uid401_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- roundBit_uid403_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,402)@5
    roundBit_uid403_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= not (rBi_uid402_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);

    -- oneCST_uid392_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,391)
    oneCST_uid392_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00000001";

    -- expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(ADD,392)@4
    expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & redist29_exp_aSig_uid323_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b_1_q);
    expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & oneCST_uid392_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) + UNSIGNED(expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(8 downto 0);

    -- expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(SUB,393)@4 + 1
    expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expInc_uid393_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & r_uid634_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) - UNSIGNED(expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(9 downto 0);

    -- fracPostNorm_uid391_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,390)@5
    fracPostNorm_uid391_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= leftShiftStage1_uid751_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(27 downto 1);

    -- fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,403)@5
    fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= fracPostNorm_uid391_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b(25 downto 0);
    fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(25 downto 2);

    -- expFracR_uid405_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,404)@5
    expFracR_uid405_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expPostNorm_uid394_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & fracPostNormRndRange_uid404_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(ADD,405)@5
    rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expFracR_uid405_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid403_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_a) + UNSIGNED(rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b));
    rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_o(34 downto 0);

    -- expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,418)@5
    expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(31 downto 0);
    expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(31 downto 24);

    -- rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,410)@5
    rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(33 downto 0);
    rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(33 downto 32);

    -- rOvfExtraBits_uid412_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,411)@5
    rOvfExtraBits_uid412_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rndExpFracOvfBits_uid411_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- wEP2AllOwE_uid407_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,406)
    wEP2AllOwE_uid407_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0011111111";

    -- rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,407)@5
    rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(33 downto 0);
    rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(33 downto 24);

    -- rOvfEQMax_uid409_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,408)@5
    rOvfEQMax_uid409_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = wEP2AllOwE_uid407_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- rOvf_uid413_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,412)@5
    rOvf_uid413_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rOvfEQMax_uid409_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or rOvfExtraBits_uid412_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- regInputs_uid420_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,419)@5
    regInputs_uid420_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excR_aSig_uid333_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and excR_bSig_uid347_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- rInfOvf_uid423_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,422)@5
    rInfOvf_uid423_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= regInputs_uid420_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q and rOvf_uid413_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- excRInfVInC_uid424_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,423)@5
    excRInfVInC_uid424_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rInfOvf_uid423_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excN_bSig_uid344_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excN_aSig_uid330_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excI_bSig_uid343_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excI_aSig_uid329_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & redist19_effSub_uid354_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q;

    -- excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOOKUP,424)@5
    excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (excRInfVInC_uid424_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid424_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q) IS
            WHEN "000000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "000001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "000010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "000011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "000100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "000101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "000110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "000111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "001111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "010111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "011111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "100001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "100111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "101111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "110111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111000" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111001" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111010" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111011" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111100" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111101" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111110" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "111111" => excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,415)@5
    rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= STD_LOGIC_VECTOR(rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(33 downto 0));
    rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(33 downto 33));

    -- wEP2AllZ_uid414_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(CONSTANT,413)
    wEP2AllZ_uid414_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0000000000";

    -- rUdfEQMin_uid415_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,414)@5
    rUdfEQMin_uid415_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1" WHEN rndExp_uid408_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b = wEP2AllZ_uid414_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- rUdf_uid417_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOGICAL,416)@5
    rUdf_uid417_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= rUdfEQMin_uid415_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q or rUdfExtraBit_uid416_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;

    -- excRZeroVInC_uid421_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,420)@5
    excRZeroVInC_uid421_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= aMinusA_uid389_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rUdf_uid417_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & regInputs_uid420_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & redist27_excZ_bSig_uid319_uid339_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_2_q & excZ_aSig_uid318_uid325_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOOKUP,421)@5
    excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (excRZeroVInC_uid421_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid421_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q) IS
            WHEN "00000" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00001" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00010" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00011" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "00100" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00101" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00110" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "00111" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01000" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01001" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01010" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01011" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "01100" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "01101" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01110" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "01111" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10000" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10001" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10010" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10011" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "10100" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "10101" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10110" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "10111" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11000" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11001" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11010" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11011" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "11100" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "1";
            WHEN "11101" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11110" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN "11111" => excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid429_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,428)@5
    concExc_uid429_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= excRNaN_uid428_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excRInf_uid425_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & excRZero_uid422_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(LOOKUP,429)@5
    excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (concExc_uid429_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid429_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "10";
            WHEN "100" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11";
            WHEN "110" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11";
            WHEN "111" => excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,448)@5
    expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= expRPreExc_uid419_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;
            WHEN "10" => expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITSELECT,417)@5
    fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in <= rndExpFrac_uid406_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b <= fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_in(23 downto 1);

    -- fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(MUX,444)@5
    fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s <= excREnc_uid430_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
    fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b, oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= fracRPreExc_uid418_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_b;
            WHEN "10" => fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct(BITJOIN,449)@5
    R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q <= signRPostExc_uid441_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & expRPostExc_uid449_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & fracRPostExc_uid445_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1(DELAY,967)
    redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q, xout => redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- expFracY_uid453_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,452)@5
    expFracY_uid453_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= R_uid306_dotProdIEEEAssemblymult_2_uid8_fpScalarProduct_q(30 downto 0);

    -- expFracX_uid452_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,451)@5
    expFracX_uid452_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q(30 downto 0);

    -- xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(COMPARE,453)@5 + 1
    xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expFracX_uid452_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b);
    xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expFracY_uid453_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b);
    xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) - UNSIGNED(xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
        END IF;
    END PROCESS;
    xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n(0) <= not (xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(32));

    -- bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,462)@6
    bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n;
    bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q, ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q;
            WHEN "1" => bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,496)@6
    sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(31 downto 31));

    -- aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,461)@6
    aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= xGTEy_uid454_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n;
    aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q)
    BEGIN
        CASE (aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= ypn_uid458_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "1" => aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist18_R_uid450_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q_1_q;
            WHEN OTHERS => aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,495)@6
    sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(31 downto 31));

    -- effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,497)@6
    effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b xor sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,480)@6
    exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(30 downto 0);
    exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(30 downto 23);

    -- exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,466)@6
    exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(30 downto 0);
    exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(30 downto 23);

    -- expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(SUB,505)@6
    expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b);
    expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b);
    expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) - UNSIGNED(expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(8 downto 0);

    -- shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(COMPARE,508)@6
    shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid363_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_c(0) <= shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(10);

    -- iShiftedOut_uid513_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,512)@6
    iShiftedOut_uid513_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (shiftedOut_uid509_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_c);

    -- excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,482)@6
    excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,489)@6
    InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,481)@6
    frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= bSig_uid463_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(22 downto 0);
    frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(22 downto 0);

    -- fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,501)@6
    fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;
            WHEN "1" => fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid505_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,504)@6
    oFracB_uid505_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & fracBz_uid502_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,510)@6
    rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= oFracB_uid505_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & padConst_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- rightShiftStage0Idx6Rng48_uid772_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,771)@6
    rightShiftStage0Idx6Rng48_uid772_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 48);

    -- rightShiftStage0Idx6_uid774_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,773)@6
    rightShiftStage0Idx6_uid774_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx6Pad48_uid687_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx6Rng48_uid772_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx5Rng40_uid769_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,768)@6
    rightShiftStage0Idx5Rng40_uid769_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 40);

    -- rightShiftStage0Idx5_uid771_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,770)@6
    rightShiftStage0Idx5_uid771_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx5Pad40_uid684_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx5Rng40_uid769_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx4Rng32_uid766_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,765)@6
    rightShiftStage0Idx4Rng32_uid766_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 32);

    -- rightShiftStage0Idx4_uid768_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,767)@6
    rightShiftStage0Idx4_uid768_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx4Pad32_uid681_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx4Rng32_uid766_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1(MUX,913)@6
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s, rightShiftStage0Idx4_uid768_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx5_uid771_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx6_uid774_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx4_uid768_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx5_uid771_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx6_uid774_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Rng24_uid763_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,762)@6
    rightShiftStage0Idx3Rng24_uid763_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 24);

    -- rightShiftStage0Idx3_uid765_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,764)@6
    rightShiftStage0Idx3_uid765_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx3Rng24_uid763_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx2Rng16_uid760_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,759)@6
    rightShiftStage0Idx2Rng16_uid760_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 16);

    -- rightShiftStage0Idx2_uid762_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,761)@6
    rightShiftStage0Idx2_uid762_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage0Idx2Rng16_uid760_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0Idx1Rng8_uid757_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,756)@6
    rightShiftStage0Idx1Rng8_uid757_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 8);

    -- rightShiftStage0Idx1_uid759_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,758)@6
    rightShiftStage0Idx1_uid759_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q & rightShiftStage0Idx1Rng8_uid757_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0(MUX,912)@6
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s, rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx1_uid759_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx2_uid762_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage0Idx3_uid765_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightPaddedIn_uid511_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx1_uid759_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx2_uid762_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0Idx3_uid765_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,933)@6
    rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_in <= expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(5 downto 0);
    rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,945)@6
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal(MUX,914)@6
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s, rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q, rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid796_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,795)@6
    rightShiftStage1Idx7Rng7_uid796_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid798_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,797)@6
    rightShiftStage1Idx7_uid798_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx7Pad7_uid711_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx7Rng7_uid796_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx6Rng6_uid793_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,792)@6
    rightShiftStage1Idx6Rng6_uid793_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid795_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,794)@6
    rightShiftStage1Idx6_uid795_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx6Pad6_uid708_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx6Rng6_uid793_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx5Rng5_uid790_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,789)@6
    rightShiftStage1Idx5Rng5_uid790_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid792_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,791)@6
    rightShiftStage1Idx5_uid792_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx5Pad5_uid705_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx5Rng5_uid790_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx4Rng4_uid787_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,786)@6
    rightShiftStage1Idx4Rng4_uid787_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid789_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,788)@6
    rightShiftStage1Idx4_uid789_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx4Rng4_uid787_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1(MUX,918)@6
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s, rightShiftStage1Idx4_uid789_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage1Idx5_uid792_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage1Idx6_uid795_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage1Idx7_uid798_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx4_uid789_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "01" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx5_uid792_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx6_uid795_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= rightShiftStage1Idx7_uid798_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Rng3_uid784_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,783)@6
    rightShiftStage1Idx3Rng3_uid784_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid786_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,785)@6
    rightShiftStage1Idx3_uid786_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx3Rng3_uid784_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx2Rng2_uid781_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,780)@6
    rightShiftStage1Idx2Rng2_uid781_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid783_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,782)@6
    rightShiftStage1Idx2_uid783_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & rightShiftStage1Idx2Rng2_uid781_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1Idx1Rng1_uid778_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,777)@6
    rightShiftStage1Idx1Rng1_uid778_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid780_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,779)@6
    rightShiftStage1Idx1_uid780_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= GND_q & rightShiftStage1Idx1Rng1_uid778_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0(MUX,917)@6
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s, rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q, rightShiftStage1Idx1_uid780_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage1Idx2_uid783_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, rightShiftStage1Idx3_uid786_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage0_uid777_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "01" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx1_uid780_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx2_uid783_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= rightShiftStage1Idx3_uid786_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,946)@6
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c(1 downto 0);
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid776_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c(2 downto 2);

    -- rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal(MUX,919)@6
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_combproc: PROCESS (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s, rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q, rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(COMPARE,755)@6
    shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid506_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid669_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) - UNSIGNED(shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n(0) <= not (shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(10));

    -- r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,801)@6
    r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= shiftedOut_uid756_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_n;
    r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q, rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage1_uid800_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "1" => r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rightShiftStage0Idx7_uid689_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,513)@6
    alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid513_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(0)) & iShiftedOut_uid513_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q));
    alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= r_uid802_alignmentShifter_uid510_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,934)@6
    stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(22 downto 0);
    stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= alignFracBPostShiftOut_uid514_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(48 downto 23);

    -- fracBAddOp_uid526_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,525)@6
    fracBAddOp_uid526_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= GND_q & stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c;

    -- fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,526)@6
    fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(0)) & effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q));
    fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= fracBAddOp_uid526_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q xor fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,467)@6
    frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= aSig_uid462_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(22 downto 0);
    frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(22 downto 0);

    -- cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,516)@6
    cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN stickyBits_uid515_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b = cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- effSubInvSticky_uid520_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,519)@6
    effSubInvSticky_uid520_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- fracAAddOp_uid523_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,522)@6
    fracAAddOp_uid523_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q & frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & GND_q & effSubInvSticky_uid520_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(ADD,527)@6
    fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid523_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid527_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) + UNSIGNED(fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,528)@6
    rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracAddResult_uid528_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(26 downto 0);

    -- redist3_rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,952)
    redist3_rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist3_rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- redist4_cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,953)
    redist4_cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist4_cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- invCmpEQ_stickyBits_cZwF_uid518_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,517)@7
    invCmpEQ_stickyBits_cZwF_uid518_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (redist4_cmpEQ_stickyBits_cZwF_uid517_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q);

    -- fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,529)@7
    fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist3_rangeFracAddResultMwfp3Dto0_uid529_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q & invCmpEQ_stickyBits_cZwF_uid518_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,636)@7
    rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(27 downto 12);

    -- vCount_uid638_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,637)@7
    vCount_uid638_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,639)@7
    vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(11 downto 0);
    vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(11 downto 0);

    -- cStage_uid641_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,640)@7
    cStage_uid641_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & mO_uid608_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,642)@7
    vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= vCount_uid638_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, cStage_uid641_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid637_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;
            WHEN "1" => vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cStage_uid641_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,939)@7
    rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(15 downto 8);
    rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid643_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(7 downto 0);

    -- vCount_uid646_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,645)@7
    vCount_uid646_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,648)@7
    vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= vCount_uid646_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid645_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,940)@7
    rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(7 downto 4);
    rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid649_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(3 downto 0);

    -- vCount_uid652_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,651)@7
    vCount_uid652_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b = zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,654)@7
    vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= vCount_uid652_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid651_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,941)@7
    rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(3 downto 2);
    rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= vStagei_uid655_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(1 downto 0);

    -- vCount_uid658_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,657)@7
    vCount_uid658_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b = zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,660)@7
    vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= vCount_uid658_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b, rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "0" => vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b;
            WHEN "1" => vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rVStage_uid657_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid663_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,662)@7
    rVStage_uid663_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= vStagei_uid661_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(1 downto 1);

    -- vCount_uid664_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,663)@7
    vCount_uid664_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rVStage_uid663_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = GND_q ELSE "0";

    -- r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,664)@7
    r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= vCount_uid638_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & vCount_uid646_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & vCount_uid652_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & vCount_uid658_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & vCount_uid664_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,532)@7
    aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q = cAmA_uid388_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- invAMinusA_uid575_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,574)@7
    invAMinusA_uid575_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,956)
    redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,483)@6 + 1
    expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= "1" WHEN exp_bSig_uid481_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";
    expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid489_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,488)@7
    invExpXIsMax_uid489_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- redist8_InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,957)
    redist8_InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist8_InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid491_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,490)@7
    excR_bSig_uid491_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist8_InvExpXIsZero_uid490_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q and invExpXIsMax_uid489_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,963)
    redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,469)@7
    expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q = cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- invExpXIsMax_uid475_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,474)@7
    invExpXIsMax_uid475_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,468)@7
    excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q = cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q ELSE "0";

    -- InvExpXIsZero_uid476_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,475)@7
    InvExpXIsZero_uid476_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,476)@7
    excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= InvExpXIsZero_uid476_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and invExpXIsMax_uid475_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- signRReg_uid576_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,575)@7
    signRReg_uid576_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and excR_bSig_uid491_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q and invAMinusA_uid575_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,955)
    redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,959)
    redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid580_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,579)@7
    excAZBZSigASigB_uid580_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q and redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q and redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q;

    -- excBZARSigA_uid581_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,580)@7
    excBZARSigA_uid581_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q and excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q;

    -- signRZero_uid582_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,581)@7
    signRZero_uid582_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excBZARSigA_uid581_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or excAZBZSigASigB_uid580_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,484)@6 + 1
    fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_bSig_uid482_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,486)@7
    excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- sigBBInf_uid577_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,576)@7
    sigBBInf_uid577_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist6_sigB_uid497_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q and excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,470)@6 + 1
    fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= "1" WHEN cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q = frac_aSig_uid468_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b ELSE "0";
    fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,472)@7
    excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- sigAAInf_uid578_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,577)@7
    sigAAInf_uid578_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist7_sigA_uid496_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q and excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- signRInf_uid579_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,578)@7
    signRInf_uid579_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= sigAAInf_uid578_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or sigBBInf_uid577_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,582)@7 + 1
    signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= signRInf_uid579_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or signRZero_uid582_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or signRReg_uid576_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid486_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,485)@7
    fracXIsNotZero_uid486_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (fracXIsZero_uid485_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,487)@7 + 1
    excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= expXIsMax_uid484_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and fracXIsNotZero_uid486_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid472_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,471)@7
    fracXIsNotZero_uid472_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (fracXIsZero_uid471_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,473)@7 + 1
    excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= expXIsMax_uid470_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and fracXIsNotZero_uid472_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- excRNaN2_uid570_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,569)@8
    excRNaN2_uid570_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2(DELAY,954)
    redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,958)
    redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,961)
    redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid571_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,570)@8
    excAIBISub_uid571_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q and redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q and redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q;

    -- excRNaN_uid572_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,571)@8
    excRNaN_uid572_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excAIBISub_uid571_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or excRNaN2_uid570_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- invExcRNaN_uid584_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,583)@8
    invExcRNaN_uid584_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (excRNaN_uid572_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid585_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,584)@8
    signRPostExc_uid585_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= invExcRNaN_uid584_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and signRInfRZRReg_uid583_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,833)@7
    leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(24 downto 0);

    -- leftShiftStage1Idx3_uid835_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,834)@7
    leftShiftStage1Idx3_uid835_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx3Rng3_uid834_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & rightShiftStage1Idx3Pad3_uid699_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,830)@7
    leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(25 downto 0);

    -- leftShiftStage1Idx2_uid832_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,831)@7
    leftShiftStage1Idx2_uid832_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx2Rng2_uid831_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & zs_uid625_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,827)@7
    leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(26 downto 0);

    -- leftShiftStage1Idx1_uid829_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,828)@7
    leftShiftStage1Idx1_uid829_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx1Rng1_uid828_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & GND_q;

    -- leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,821)@7
    leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(3 downto 0);

    -- leftShiftStage0Idx6_uid823_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,822)@7
    leftShiftStage0Idx6_uid823_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx6Rng24_uid822_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & rightShiftStage0Idx3Pad24_uid678_alignmentShifter_uid366_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,818)@7
    leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(7 downto 0);

    -- leftShiftStage0Idx5_uid820_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,819)@7
    leftShiftStage0Idx5_uid820_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx5Rng20_uid819_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & leftShiftStage0Idx5Pad20_uid732_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx4_uid817_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,816)@7
    leftShiftStage0Idx4_uid817_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= vStage_uid640_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & zs_uid605_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1(MUX,923)@7
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_combproc: PROCESS (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s, leftShiftStage0Idx4_uid817_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx5_uid820_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx6_uid823_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx4_uid817_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx5_uid820_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx6_uid823_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= leftShiftStage0Idx7_uid738_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,812)@7
    leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(15 downto 0);

    -- leftShiftStage0Idx3_uid814_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,813)@7
    leftShiftStage0Idx3_uid814_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx3Rng12_uid813_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & leftShiftStage0Idx3Pad12_uid726_fracPostNormExt_uid390_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,809)@7
    leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(19 downto 0);

    -- leftShiftStage0Idx2_uid811_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,810)@7
    leftShiftStage0Idx2_uid811_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx2Rng8_uid810_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;

    -- leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,806)@7
    leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(23 downto 0);

    -- leftShiftStage0Idx1_uid808_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,807)@7
    leftShiftStage0Idx1_uid808_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0Idx1Rng4_uid807_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & zs_uid619_lzCountVal_uid387_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q;

    -- leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0(MUX,922)@7
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_combproc: PROCESS (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s, fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx1_uid808_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx2_uid811_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage0Idx3_uid814_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= fracGRS_uid530_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "01" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx1_uid808_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx2_uid811_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= leftShiftStage0Idx3_uid814_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select(BITSELECT,948)@7
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal(MUX,924)@7
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_combproc: PROCESS (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s, leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q, leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select(BITSELECT,942)@7
    leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_b <= r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(4 downto 2);
    leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c <= r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(1 downto 0);

    -- leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,836)@7
    leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= leftShiftStageSel4Dto2_uid825_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_merged_bit_select_c;
    leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q, leftShiftStage1Idx1_uid829_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage1Idx2_uid832_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, leftShiftStage1Idx3_uid835_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        CASE (leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage0_uid826_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_mfinal_q;
            WHEN "01" => leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx1_uid829_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "10" => leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx2_uid832_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN "11" => leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= leftShiftStage1Idx3_uid835_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
            WHEN OTHERS => leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,542)@7
    LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(4 downto 0));
    LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(4 downto 4));

    -- Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,541)@7
    Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(3 downto 0));
    Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(3 downto 3));

    -- Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,540)@7
    Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(2 downto 0));
    Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(2 downto 2));

    -- Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,539)@7
    Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(1 downto 0));
    Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(1 downto 1));

    -- Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,538)@7
    Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(0 downto 0));
    Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(0 downto 0));

    -- rndBitCond_uid544_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,543)@7
    rndBitCond_uid544_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= LSB_uid543_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & Guard_uid542_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & Round_uid541_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & Sticky1_uid540_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b & Sticky0_uid539_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,545)@7 + 1
    rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= "1" WHEN rndBitCond_uid544_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q = cRBit_uid401_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";
    rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- roundBit_uid547_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,546)@8
    roundBit_uid547_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= not (rBi_uid546_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);

    -- expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(ADD,536)@7
    expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & redist14_exp_aSig_uid467_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q);
    expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0" & oneCST_uid392_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q);
    expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) + UNSIGNED(expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(8 downto 0);

    -- expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(SUB,537)@7 + 1
    expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expInc_uid537_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("00000" & r_uid665_lzCountVal_uid531_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) - UNSIGNED(expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
        END IF;
    END PROCESS;
    expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(9 downto 0);

    -- fracPostNorm_uid535_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,534)@7
    fracPostNorm_uid535_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= leftShiftStage1_uid837_fracPostNormExt_uid534_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(27 downto 1);

    -- fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,547)@7
    fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= fracPostNorm_uid535_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b(25 downto 0);
    fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(25 downto 2);

    -- redist1_fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1(DELAY,950)
    redist1_fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, xout => redist1_fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid549_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,548)@8
    expFracR_uid549_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expPostNorm_uid538_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & redist1_fracPostNormRndRange_uid548_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b_1_q;

    -- rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(ADD,549)@8
    rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a <= STD_LOGIC_VECTOR("0" & expFracR_uid549_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid547_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q);
    rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_a) + UNSIGNED(rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b));
    rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_o(34 downto 0);

    -- expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,562)@8
    expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(31 downto 0);
    expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(31 downto 24);

    -- rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,554)@8
    rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(33 downto 0);
    rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(33 downto 32);

    -- rOvfExtraBits_uid556_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,555)@8
    rOvfExtraBits_uid556_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rndExpFracOvfBits_uid555_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = zocst_uid378_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,551)@8
    rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(33 downto 0);
    rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(33 downto 24);

    -- rOvfEQMax_uid553_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,552)@8
    rOvfEQMax_uid553_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = wEP2AllOwE_uid407_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- rOvf_uid557_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,556)@8
    rOvf_uid557_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rOvfEQMax_uid553_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or rOvfExtraBits_uid556_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,563)@7 + 1
    regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi <= excR_aSig_uid477_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and excR_bSig_uid491_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_qi, xout => regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, clk => clk, aclr => areset );

    -- rInfOvf_uid567_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,566)@8
    rInfOvf_uid567_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q and rOvf_uid557_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- excRInfVInC_uid568_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,567)@8
    excRInfVInC_uid568_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rInfOvf_uid567_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & excN_bSig_uid488_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & excN_aSig_uid474_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & redist9_excI_bSig_uid487_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q & redist12_excI_aSig_uid473_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q & redist5_effSub_uid498_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q;

    -- excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOOKUP,568)@8
    excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (excRInfVInC_uid568_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid568_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q) IS
            WHEN "000000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "000001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "000010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "000111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "001111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "010111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "011111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "100001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "100111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "101111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "110111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111000" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111001" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111010" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111011" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111100" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111101" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111110" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "111111" => excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist2_aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,951)
    redist2_aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist2_aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,559)@8
    rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= STD_LOGIC_VECTOR(rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(33 downto 0));
    rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(33 downto 33));

    -- rUdfEQMin_uid559_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,558)@8
    rUdfEQMin_uid559_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1" WHEN rndExp_uid552_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b = wEP2AllZ_uid414_dotProdIEEEAssembly_add_tree_1_0_uid9_fpScalarProduct_q ELSE "0";

    -- rUdf_uid561_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOGICAL,560)@8
    rUdf_uid561_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= rUdfEQMin_uid559_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q or rUdfExtraBit_uid560_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;

    -- redist11_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2(DELAY,960)
    redist11_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist10_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, xout => redist11_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q, clk => clk, aclr => areset );

    -- redist13_excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1(DELAY,962)
    redist13_excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q, xout => redist13_excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid565_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,564)@8
    excRZeroVInC_uid565_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= redist2_aMinusA_uid533_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q & rUdf_uid561_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & regInputs_uid564_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & redist11_excZ_bSig_uid463_uid483_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_2_q & redist13_excZ_aSig_uid462_uid469_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q_1_q;

    -- excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOOKUP,565)@8
    excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (excRZeroVInC_uid565_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid565_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q) IS
            WHEN "00000" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00001" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00010" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00011" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "00100" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00101" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00110" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "00111" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01000" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01001" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01010" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01011" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "01100" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "01101" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01110" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "01111" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10000" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10001" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10010" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10011" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "10100" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "10101" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10110" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "10111" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11000" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11001" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11010" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11011" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "11100" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "1";
            WHEN "11101" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11110" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN "11111" => excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid573_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,572)@8
    concExc_uid573_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= excRNaN_uid572_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & excRInf_uid569_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & excRZero_uid566_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(LOOKUP,573)@8
    excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (concExc_uid573_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid573_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q) IS
            WHEN "000" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "01";
            WHEN "001" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "00";
            WHEN "010" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "10";
            WHEN "011" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "10";
            WHEN "100" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "11";
            WHEN "101" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "11";
            WHEN "110" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "11";
            WHEN "111" => excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,592)@8
    expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstAllZWE_uid17_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= expRPreExc_uid563_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;
            WHEN "10" => expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstAllOWE_uid15_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITSELECT,561)@8
    fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in <= rndExpFrac_uid550_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q(23 downto 0);
    fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b <= fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_in(23 downto 1);

    -- fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(MUX,588)@8
    fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s <= excREnc_uid574_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;
    fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_combproc: PROCESS (fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s, cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q, fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b, oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q)
    BEGIN
        CASE (fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_s) IS
            WHEN "00" => fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "01" => fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= fracRPreExc_uid562_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_b;
            WHEN "10" => fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= cstZeroWF_uid16_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN "11" => fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= oneFracRPostExc2_uid97_dotProdIEEEAssemblymult_0_uid6_fpScalarProduct_q;
            WHEN OTHERS => fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid594_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct(BITJOIN,593)@8
    R_uid594_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q <= signRPostExc_uid585_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & expRPostExc_uid593_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q & fracRPostExc_uid589_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

    -- xOut(GPOUT,4)@8
    q <= R_uid594_dotProdIEEEAssembly_add_tree_2_0_uid10_fpScalarProduct_q;

END normal;
