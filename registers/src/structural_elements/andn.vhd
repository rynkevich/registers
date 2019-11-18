library ieee;
use ieee.std_logic_1164.all;

entity andn is
	generic (N: integer);
	port (
		V: in std_logic_vector(N - 1 downto 0);
		Z: out std_logic
	);
end andn;

architecture behavioral of andn is
begin
	process (V)
		variable Result: std_logic;
	begin
		Result := V(N - 1);
		for I in N - 2 downto 0 loop
			Result := Result and V(I);
		end loop;
		
		Z <= Result;
	end process;
end behavioral;