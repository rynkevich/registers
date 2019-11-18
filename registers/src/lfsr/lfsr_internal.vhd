library ieee;
use ieee.std_logic_1164.all;

entity lfsr_internal is
	generic (N: integer := 9);
	port (
		LS, CLK: in std_logic;
		Pin: in std_logic_vector(N - 1 downto 0);
		Pout: out std_logic_vector(N - 1 downto 0)
	);
end lfsr_internal;

architecture behavioral of lfsr_internal is
	signal StoredValues: std_logic_vector(N - 1 downto 0);
begin
	process (LS, CLK)
	begin
		if LS = '0' then
			StoredValues <= Pin;
		elsif rising_edge(CLK) then
			StoredValues <= StoredValues(0) & (StoredValues(0) xor StoredValues(N - 1))
				& StoredValues(N - 2 downto N - 6) & (StoredValues(0) xor StoredValues(N - 7)) & StoredValues(N - 8 downto 1);
		end if;
	end process;
	
	Pout <= StoredValues;
end behavioral;