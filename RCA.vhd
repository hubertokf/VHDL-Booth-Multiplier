-- Somador 8_bits --
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY RCA IS
	PORT (	
		CarryIn: in std_logic;
		val1,val2: in std_logic_vector (32 downto 0);
		SomaResult: out std_logic_vector (32 downto 0);
		outpart: out std_logic_vector (1 downto 0);
		CarryOut: out std_logic
	);
END RCA ;

ARCHITECTURE strc_RCA OF RCA IS
	signal carry: std_logic_vector (32 downto 1);
	signal sigSomaResult: std_logic_vector (32 downto 0);
	
	COMPONENT Soma1
		port (	
			CarryIn,val1,val2: in std_logic ;
			SomaResult,CarryOut: out std_logic 
		);
	END COMPONENT ;
	
BEGIN	
	--somador--
	Som0: Soma1 PORT MAP ( 
		CarryIn, 
		val1(0), 
		val2(0), 
		sigSomaResult(0), 
		carry(1)
	);	
	
	SOM: FOR i IN 1 TO 31 GENERATE
		Som1: Soma1 PORT MAP ( 
			carry(i),
			val1(i),
			val2(i),
			sigSomaResult(i),
			carry(i+1)
		);
	END GENERATE;
	
	Som8: Soma1 PORT MAP (
		carry(32),
		val1(32),
		val2(32),
		sigSomaResult(32),
		CarryOut
	);

	SomaResult <=	"00" & sigSomaResult(32 downto 2) when	sigSomaResult(32) = '0'
				else	"11" & sigSomaResult(32 downto 2) when sigSomaResult(32) = '1';
	outpart <= sigSomaResult(1 downto 0);
	
	
END strc_RCA ;