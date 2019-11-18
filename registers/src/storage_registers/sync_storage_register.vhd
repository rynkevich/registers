library ieee;
use ieee.std_logic_1164.all;

entity sync_storage_register is
	generic (N: integer := 8);
	port (
		EN, CLK: in std_logic;
		Din: in std_logic_vector(N - 1 downto 0);
		Dout: out std_logic_vector(N - 1 downto 0)
	);
end sync_storage_register;

architecture behavioral of sync_storage_register is
	signal Result: std_logic_vector(N - 1 downto 0);
begin
	process (EN, CLK, Din)
	begin
		if EN = '1' then
			if rising_edge(CLK) then
				Result <= Din;
			end if;
		end if;
	end process;

	Dout <= Result;
end behavioral;

architecture structural of sync_storage_register is
	component fdce is
		port (
			D, CE, CLR, CLK: in std_logic;
			Q: out std_logic
		);
	end component;
begin
	Reg: for I in N - 1 downto 0 generate
		FlipFlop_I: fdce port map (
			D => Din(I),
			CE => EN,
			CLR => '0',
			CLK => CLK,
			Q => Dout(I)
		);
	end generate;
end structural;