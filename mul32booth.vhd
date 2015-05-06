Library ieee;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use work.array32.all; 

entity mul32booth is
	port(
		mr,md		: in	std_logic_vector(31 downto 0);
		out1		: out std_logic_vector(63 downto 0)
	);
end mul32booth;

architecture rtl of mul32booth is 
	
	signal outDecoder : reg_array;
	signal sOutAdd : reg_array;
	signal test : std_logic_vector(2 downto 0);
	
	component RCA IS
		PORT (	
			CarryIn: in std_logic;
			val1,val2: in std_logic_vector (32 downto 0);
			SomaResult: out std_logic_vector (32 downto 0);
			outpart: out std_logic_vector (1 downto 0);
			CarryOut: out std_logic
		);
	END component;
	
	component boothDecoder is
		port(
			md		: in std_logic_vector(31 downto 0);
			decMr	: in std_logic_vector(2 downto 0);
			out1	: out std_logic_vector(32 downto 0)
		);
	end component;
	
begin

	test <= mr(1 downto 0) & '0';

	decoder1: boothDecoder PORT MAP (
		md, test, outDecoder(0) 
	);
	
	GDEC: for i IN 0 TO 14 generate
		decoders: boothDecoder PORT MAP (
			md, mr(((i*2)+3) downto ((i*2)+1)), outDecoder(i+1)
		);
	end generate;
	
	adder1: RCA PORT MAP (
		'0', (others => '0'), outDecoder(0), sOutAdd(0), out1(1 downto 0)
	);
	
	GSOM: for i IN 0 TO 14 generate
		adders: RCA PORT MAP (
			'0', sOutAdd(i), outDecoder(i+1), sOutAdd(i+1), out1(((i*2)+3) downto ((i*2)+2))
		);
	end generate;
	
	out1(63 downto 32) <= sOutAdd(15)(31 downto 0);
	
end rtl;


