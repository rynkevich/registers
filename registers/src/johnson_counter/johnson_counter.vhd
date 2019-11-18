library ieee;
use ieee.std_logic_1164.all;

entity johnson_counter is
	generic (N: Integer := 8);
	port (
		LS, RST, CLK: in std_logic;
		Pin: in std_logic_vector(N - 1 downto 0);
		Pout: out std_logic_vector(N - 1 downto 0)
	);
end johnson_counter;

architecture behavioral of johnson_counter is
	signal StoredValues: std_logic_vector(N - 1 downto 0);
begin
	process (LS, RST, CLK)
	begin
		if RST = '1' then
			StoredValues <= (others => '0');
		elsif LS = '0' then
			StoredValues <= Pin;
		elsif LS = '1' then
			if rising_edge(CLK) then
				StoredValues <= (not StoredValues(0)) & StoredValues(N - 1 downto 1);
			end if;
		end if;
	end process;
	
	Pout <= StoredValues;
end behavioral;
