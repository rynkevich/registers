library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
	generic (N: Integer := 8);
	port (
		Sin, SE, CLK, RST: in std_logic;
		Pout: out std_logic_vector(N - 1 downto 0)
	);
end shift_register;

architecture behavioral of shift_register is
	signal StoredValues: std_logic_vector(N - 1 downto 0);
begin
	process (SE, CLK, RST, Sin)
	begin
		if RST = '1' then
			StoredValues <= (others => '0');
		elsif SE = '1' then
			if rising_edge(CLK) then
				StoredValues <= Sin & StoredValues(N - 1 downto 1);
			end if;
		end if;
	end process;
	
	Pout <= StoredValues;
end;

architecture structural of shift_register is
	component fdce is
		port (
			D, CE, CLR, CLK: in std_logic;
			Q: out std_logic
		);
	end component;
	
	signal StoredValues: std_logic_vector(N - 1 downto 0);
begin
	FlipFlop_First: fdce port map (
		D => Sin,
		CE => SE,
		CLR => RST,
		CLK => CLK,
		Q => StoredValues(N - 1)
	);
	Reg: for I in N - 1 downto 1 generate
		FlipFlop: fdce port map (
			D => StoredValues(I),
			CE => SE,
			CLR => RST,
			CLK => CLK,
			Q => StoredValues(I - 1)
		);  	
	end generate;
	
	Pout <= StoredValues;
end;