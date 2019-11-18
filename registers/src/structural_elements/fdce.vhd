library ieee;
use ieee.std_logic_1164.all;

entity fdce is
	port (
		D, CE, CLR, CLK: in std_logic;
		Q: out std_logic
	);
end fdce;

architecture behavioral of fdce is
	signal Result: std_logic;
begin
	process (D, CE, CLR, CLK)
	begin
		if CLR = '1' then
			Result <= '0';
		elsif CE = '1' then
			if rising_edge(CLK) then
				Result <= D;
			end if;
		end if;
	end process;
	
	Q <= Result;
end behavioral;