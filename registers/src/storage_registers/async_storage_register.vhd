library ieee;
use ieee.std_logic_1164.all;

entity async_storage_register is
	generic (N: integer := 8);
	port (
		EN: in std_logic;
		Din: in std_logic_vector(N - 1 downto 0);
		Dout: out std_logic_vector(N - 1 downto 0)
	);
end async_storage_register;

architecture behavioral of async_storage_register is
	signal Result: std_logic_vector(N - 1 downto 0);
begin
	Dout <= Din when EN = '1';
end behavioral;

architecture structural of async_storage_register is
	component ld is
		port (
			D, G: in std_logic;
			Q: out std_logic
		);
	end component;
begin
	Reg: for I in N - 1 downto 0 generate
		Latch_I: ld port map (
			D => Din(I),
			G => EN,
			Q => Dout(I)
		);
	end generate;
end structural;