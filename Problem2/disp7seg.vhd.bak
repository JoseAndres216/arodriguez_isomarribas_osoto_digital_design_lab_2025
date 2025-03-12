library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity disp7seg is
    port(
        Bin  : in std_logic_vector(3 downto 0);
        Cout : in std_logic; -- Señal de acarreo
        seg  : out std_logic_vector(6 downto 0)
    );
end disp7seg;

architecture Behavioral of disp7seg is
begin
    process(Bin, Cout)  -- Se agregan las señales sensibles al proceso
    begin
        if Cout = '1' then
            Seg <= "1111111"; -- Apagar display en caso de desbordamiento
        else
				case Bin is
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
			end if; -- Cerrar el `if Cout = '1'`
    end process;
end Behavioral;
