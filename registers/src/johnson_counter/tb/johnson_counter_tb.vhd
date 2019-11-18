library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity johnson_counter_tb is
end johnson_counter_tb;

architecture tb of johnson_counter_tb is
	constant REGISTER_SIZE: integer := 4;

	component johnson_counter
		generic (N: Integer := 8);
		port (
			LS, RST, CLK: in std_logic;
			Pin: in std_logic_vector(N - 1 downto 0);
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	signal LS: std_logic := '0';
	signal RST: std_logic := '0';
	signal CLK: std_logic := '0';
	signal Pin: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "1100";
	signal Pout: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
begin
	behavioral: entity johnson_counter(behavioral)
		generic map (N => REGISTER_SIZE)
		port map (LS, RST, CLK, Pin, Pout);
		
	RST <= not RST after 160 ns;
	LS <= not LS after 80 ns;
	CLK <= not CLK after 5 ns;
end tb;