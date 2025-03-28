library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity implementacion_sumador is
    port(
        Switches : in  std_logic_vector(8 downto 0);  -- Entradas de los switches
        Segments : out std_logic_vector(6 downto 0)   -- Salida hacia el 7 segmentos
    );
end implementacion_sumador;

--Señales internas
architecture Behavioral of implementacion_sumador is

    signal A, B, Sum : std_logic_vector(3 downto 0);
    signal Cin  : std_logic;
    signal Cout : std_logic;

    -- Declaración de componentes
	 --Sumador de 4 bits
    component Sumador4bits
        port(
            A, B : in std_logic_vector(3 downto 0);
            Cin  : in std_logic;
            S    : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;
	--7 segmentos
    component disp7seg
		 port(
			  BinNumber  : in std_logic_vector(3 downto 0);
			  Cout : in std_logic; 
			  seg  : out std_logic_vector(6 downto 0)
		 );
    end component;


begin
    -- Mapeo de los switches a las señales de entrada
    A   <= Switches(3 downto 0);  -- Primeros 4 switches para A
    B   <= Switches(7 downto 4);  -- Siguientes 4 switches para B
    Cin <= Switches(8);           -- Último switch para el acarreo de entrada

    -- Instancia del sumador de 4 bits
    Sumador: Sumador4bits port map(A, B, Cin, Sum, Cout);

    -- Instancia del decodificador de 7 segmentos
    Decodificador: disp7seg port map(Sum, Cout, Segments);
	 
end Behavioral;
