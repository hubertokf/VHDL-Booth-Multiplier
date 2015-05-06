LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Soma1 IS
	PORT (	
		CarryIn, val1, val2: IN STD_LOGIC;
		SomaResult, CarryOut: OUT STD_LOGIC 
	);
END Soma1 ;

ARCHITECTURE strc_Soma OF Soma1 IS

BEGIN
	SomaResult <= (val1 XOR val2) XOR CarryIn;
	CarryOut <= (val1 AND val2) OR (CarryIn AND val1) OR (CarryIn AND val2);
END strc_Soma ;

