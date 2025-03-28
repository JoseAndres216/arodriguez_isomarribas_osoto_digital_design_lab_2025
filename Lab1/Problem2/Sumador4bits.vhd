library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador4bits is
	 --Señales externas
    port(
        A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        S : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Sumador4bits;




architecture Behavioral of Sumador4bits is

	--Declaración del sumador de 1 bit
	component Sumador1bit is
		port(
           A, B, Cin : in std_logic;
           S, Cout : out std_logic);
	end component;
	
	signal C1,C2,C3 : STD_LOGIC_VECTOR(3 downto 0);  -- Señales internas

	
	begin
    -- Instancias del sumador de 1 bit
		adder1 : Sumador1bit
			port map (
						A(0), B(0), Cin, S(0), C1(0)
						);

		adder2 : Sumador1bit
			port map (
						A(1), B(1), C1(0), S(1), C2(1)						
						);

		adderr3 : Sumador1bit
			port map (
						A(2), B(2), C2(1), S(2), C3(2)					
						);

		adder4 : Sumador1bit
			port map (
						A(3), B(3), C3(2), S(3), Cout					
						);
	
	 
end Behavioral;