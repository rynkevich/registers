library ieee;
use ieee.std_logic_1164.all;

entity digest_generation_example_tb is
end digest_generation_example_tb;

architecture tb of digest_generation_example_tb is
	constant REGISTER_SIZE: integer := 9;

	component digest_generation_example
		generic (N: integer := 9);
		port (
			LS, CLR, CLK: in std_logic;
			Pin: in std_logic_vector(N - 1 downto 0);
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	signal LS: std_logic := '0';
	signal CLR: std_logic := '1';
	signal CLK: std_logic := '0';
	signal Pin: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "111111111";
	signal Pout: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "000000000";
begin
	structural: entity digest_generation_example(structural)
		generic map (N => REGISTER_SIZE)
		port map (LS, CLR, CLK, Pin, Pout);
		
	CLR <= not CLR after 180 ns; 
	LS <= not LS after 90 ns;
	CLK <= not CLK after 5 ns;
end tb;