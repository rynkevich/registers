library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lfsr_external_tb is
end lfsr_external_tb;

architecture tb of lfsr_external_tb is
	constant REGISTER_SIZE: integer := 9;

	component lfsr_external
		generic (N: integer := 9);
		port (
			LS, CLK: in std_logic;
			Pin: in std_logic_vector(N - 1 downto 0);
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	signal LS: std_logic := '0';
	signal CLK: std_logic := '0';
	signal Pin: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "101010101";
	signal Pout: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "000000000";
begin
	behavioral: entity lfsr_external(behavioral)
		generic map (N => REGISTER_SIZE)
		port map (LS, CLK, Pin, Pout);
		
	LS <= not LS after 160 ns;
	CLK <= not CLK after 5 ns;
end tb;