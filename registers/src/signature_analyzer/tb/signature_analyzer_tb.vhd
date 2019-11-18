library ieee;
use ieee.std_logic_1164.all;

entity signature_analyzer_tb is
end signature_analyzer_tb;

architecture tb of signature_analyzer_tb is
	constant REGISTER_SIZE: integer := 9;

	component signature_analyzer
		generic (N: integer := 9);
		port (
			Pin, CLR, CLK: in std_logic;
			Pout: out std_logic_vector (N - 1 downto 0)
		);
	end component;
	
	signal Pin: std_logic;
	signal CLR: std_logic := '1';
	signal CLK: std_logic := '0';
	signal Pout: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "000000000";
	
	constant Input: std_logic_vector := "110011001";
begin
	behavioral: entity signature_analyzer(behavioral)
		generic map (N => REGISTER_SIZE)
		port map (Pin, CLR, CLK, Pout);

	CLR <= not CLR after 90 ns;
	CLK <= not CLK after 5 ns;
	
	process (CLK)
		variable I: integer := 0;
	begin
		Pin <= Input(I mod REGISTER_SIZE);
		I := I + 1;
	end process;
end tb;