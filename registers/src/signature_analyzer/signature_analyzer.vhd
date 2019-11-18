library ieee;
use ieee.std_logic_1164.all;

entity signature_analyzer is
	generic (N: integer := 9);
	port (
		Pin, CLR, CLK: in std_logic;
		Pout: out std_logic_vector (N - 1 downto 0)
	);
end signature_analyzer;

architecture behavioral of signature_analyzer is
	signal StoredValues: std_logic_vector(N - 1 downto 0);
begin
	process (Pin, CLR, CLK)
	begin
		if CLR = '1' then
			StoredValues <= (others => '0');
		elsif rising_edge(CLK) then
			StoredValues <= (Pin xor StoredValues(0)) & (StoredValues(0) xor StoredValues(N - 1))
				& StoredValues(N - 2 downto N - 6) & (StoredValues(0) xor StoredValues(N - 7)) & StoredValues(N - 8 downto 1);
		end if;
	end process;
	
	Pout <= StoredValues;
end behavioral;