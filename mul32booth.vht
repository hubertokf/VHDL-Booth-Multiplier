-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/28/2015 10:39:04"
                                                            
-- Vhdl Test Bench template for design  :  mul32booth
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mul32booth_vhd_tst IS
END mul32booth_vhd_tst;
ARCHITECTURE mul32booth_arch OF mul32booth_vhd_tst IS
	-- constants                                                 
	-- signals                                                   
	SIGNAL md : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mr : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL out1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
	
	COMPONENT mul32booth
		PORT (
		md : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		mr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		out1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;
	
BEGIN
	i1 : mul32booth PORT MAP (
		-- list connections between master ports and signals
		md => md,
		mr => mr,
		out1 => out1
	);

	md <= "00111000000000000000000000000010";
	mr <= "01100000000000000000000000000010";



	
END mul32booth_arch;
