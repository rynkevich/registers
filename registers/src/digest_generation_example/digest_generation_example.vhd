library ieee;
use ieee.std_logic_1164.all;

entity digest_generation_example is
	generic (N: integer := 9);
	port (
		LS, CLR, CLK: in std_logic;
		Pin: in std_logic_vector(N - 1 downto 0);
		Pout: out std_logic_vector(N - 1 downto 0)
	);
end digest_generation_example;

architecture structural of digest_generation_example is
	component lfsr_external
		generic (N: integer := 9);
		port (
			LS, CLK: in std_logic;
			Pin: in std_logic_vector(N - 1 downto 0);
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;
	
	component andn
		generic (N: integer);
		port (
			V: in std_logic_vector(N - 1 downto 0);
			Z: out std_logic
		);
	end component;
	
	component signature_analyzer
		generic (N: integer := 9);
		port (
			Pin, CLR, CLK: in std_logic;
			Pout: out std_logic_vector(N - 1 downto 0)
		);
	end component;

	signal GeneratedValues: std_logic_vector(N - 1 downto 0);
	signal UUTResult: std_logic;
begin
	InputGen: lfsr_external
		generic map (N)
		port map (LS, CLK, Pin, GeneratedValues);
		
	UUT: andn
		generic map (N)
		port map (GeneratedValues, UUTResult);
		
	SignatureAnalyzer: signature_analyzer
		generic map (N)
		port map (UUTResult, CLR, CLK, Pout);
end structural;

