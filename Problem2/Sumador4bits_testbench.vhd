library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--No tiene puertos porque solo es solo un "espacio" para pruebas
entity Sumador4bits_testbench is
end Sumador4bits_testbench;

architecture test of Sumador4bits_testbench is

    -- Componente a probar
    component Sumador4bits
        port(
            A, B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;

    -- Señales de prueba
    signal A, B, S : std_logic_vector(3 downto 0);
    signal Cin, Cout : std_logic;

begin

    -- Instanciar el sumador
    UUT: Sumador4bits port map (
        A, B, Cin, S, Cout
    );

    -- Proceso de prueba
    process
    begin
        -- Caso 1: 0000 + 0001 + 0 = 01 = 1
        A <= "0000"; B <= "0001"; Cin <= '0';
        wait for 10 ns;
		  assert (S = "0001" and Cout = '0') report "Caso 1 fallido" severity error;

        -- Caso 2: 0101 + 0011 + 0 = 1000 = 8
        A <= "0101"; B <= "0011"; Cin <= '0';
        wait for 10 ns;
		  assert (S = "1000" and Cout = '0') report "Caso 2 fallido" severity error;

        -- Caso 3: 1111 + 0001 + 0 = 10000 = 16 genera acarreo
        A <= "1111"; B <= "0001"; Cin <= '0';
        wait for 10 ns;
		  assert (S = "0000" and Cout = '1') report "Caso 3 fallido" severity error;

        -- Caso 4: 1001 + 0110 + 1 = 10001 = 17 genera acarreo
        A <= "1001"; B <= "0111"; Cin <= '1';
        wait for 10 ns;
		  assert (S = "0001" and Cout = '1') report "Caso 4 fallido" severity error;

        -- Termina la simulación
        wait;
    end process;

end test;
