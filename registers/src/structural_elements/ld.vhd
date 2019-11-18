library ieee;
use ieee.std_logic_1164.all;

entity ld is
	port (
		D, G: in std_logic;
		Q: out std_logic
	);
end ld;

architecture behavioral of ld is
	signal Result: std_logic;
begin
	Result <= D when G = '1';
	Q <= Result;
end behavioral;