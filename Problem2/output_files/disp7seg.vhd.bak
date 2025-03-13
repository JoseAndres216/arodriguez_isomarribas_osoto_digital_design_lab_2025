library ieee;
use ieee.std_logic_1164.all;

entity disp7seg is

    Port ( 
        b_num : in  STD_LOGIC_VECTOR (3 downto 0);   -- Entrada de 4 bits que representa un número en binario
        seg : out  STD_LOGIC_VECTOR (6 downto 0)    -- Salida para el display de 7 segmentos
    );
	 
end disp7seg;

architecture Behavioral of disp7seg is

begin

process (b_num)

BEGIN
    -- Enciende el segmento de 7 segmentos correspondiente para cada valor de entrada
    case b_num is
        when "0000"=> seg <="1000000";  -- 0   
        when "0001"=> seg <="1111001";  -- 1
        when "0010"=> seg <="0100100";  -- 2
        when "0011"=> seg <="0110000";  -- 3
        when "0100"=> seg <="0011001";  -- 4 
        when "0101"=> seg <="0010010";  -- 5
        when "0110"=> seg <="0000010";  -- 6
        when "0111"=> seg <="1111000";  -- 7
        when "1000"=> seg <="0000000";  -- 8
        when "1001"=> seg <="0010000";  -- 9
        when "1010"=> seg <="0001000";  -- A
        when "1011"=> seg <="0000011";  -- b (minúscula por el 8)
        when "1100"=> seg <="1000110";  -- C
        when "1101"=> seg <="0100001";  -- d (minúcula por el 0)
        when "1110"=> seg <="0000110";  -- E
        when "1111"=> seg <="0001110";  -- F
        when others =>  seg <= "1111111";  -- Apagar todos los segmentos;             -- En caso de una entrada no válida, se deja la salida en NULL
    end case;
	 
end process;

end Behavioral;