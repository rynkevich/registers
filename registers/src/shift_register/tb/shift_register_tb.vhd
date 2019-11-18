library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_tb is
end shift_register_tb;

architecture tb of shift_register_tb is
	constant REGISTER_SIZE: integer := 4;

	component shift_register
		generic (N: Integer := 8);
		port (
			Sin, SE, CLK, RST: in std_logic;
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	signal SE: std_logic := '1';
	signal CLK: std_logic := '0';
	signal RST: std_logic := '1';
	signal Sin: std_logic := '1';
	signal Pout_beh: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
	signal Pout_struct: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
	
	signal Error: boolean := False;
begin
	behavioral: entity shift_register(behavioral)
		generic map (N => REGISTER_SIZE)
		port map (Sin, SE, CLK, RST, Pout_beh);
		
	structural: entity shift_register(structural)
		generic map (N => REGISTER_SIZE)
		port map (Sin, SE, CLK, RST, Pout_struct);
		
	RST <= not RST after 160 ns;
	SE <= not SE after 80 ns;
	Sin <= not Sin after 20 ns;
	CLK <= not CLK after 5 ns;
	
	Error <= False when Pout_beh = Pout_struct else True;
end tb;