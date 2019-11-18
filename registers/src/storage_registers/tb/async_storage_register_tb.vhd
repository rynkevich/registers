library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity async_storage_register_tb is
end async_storage_register_tb;

architecture tb of async_storage_register_tb is
	constant REGISTER_SIZE: integer := 4;

	component async_storage_register
		generic (N: integer := 8);
		port (
			EN: in std_logic;
			Din: in std_logic_vector(N - 1 downto 0);
			Dout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	signal EN: std_logic := '0';
	signal Din: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
	signal Dout_beh: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
	signal Dout_struct: std_logic_vector(REGISTER_SIZE - 1 downto 0) := "0000";
	
	signal Error: boolean := False;
begin
	behavioral: entity async_storage_register(behavioral)
		generic map (N => REGISTER_SIZE)
		port map (EN, Din, Dout_beh);
		
	structural: entity async_storage_register(structural)
		generic map (N => REGISTER_SIZE)
		port map (EN, Din, Dout_struct); 
		
	EN <= not EN after 5 ns;
	Din <= std_logic_vector(unsigned(Din) + 1) after 10 ns;
	
	Error <= False when Dout_beh = Dout_struct else True;
end tb;