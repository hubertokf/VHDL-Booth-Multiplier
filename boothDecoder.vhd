Library ieee;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity boothDecoder is
	port(
		md		: in std_logic_vector(31 downto 0);
		decMr	: in std_logic_vector(2 downto 0);
		out1	: out std_logic_vector(32 downto 0)
	);
end boothDecoder;

architecture rtl of boothDecoder is 
	signal notMD : std_logic_vector(31 downto 0);
	signal multMD : std_logic_vector(32 downto 0);
	signal multNotMD : std_logic_vector(32 downto 0);
begin

	notMD			<= (not md) + '1';
	
	multMD		<= md & '0';
	multnotMD	<= notMD & '0';
	
	out1 <=	(others	=> '0')	when	decMr="000"	or	decMr="111"
		else	'1' & md				when  ((decMr="001"	or	decMr="010") and md(31)='1')
		else	'0' & md				when  ((decMr="001"	or	decMr="010") and md(31)='0')
		else	multMD				when  decMr="011"
		else	multnotMD			when  decMr="100"
		else	'1' & notMD			when  ((decMr="101"	or	decMr="110") and notMD(31)='1')
		else	'0' & notMD			when  ((decMr="101"	or	decMr="110") and notMD(31)='0')
		else (others	=> '0');
end rtl;


