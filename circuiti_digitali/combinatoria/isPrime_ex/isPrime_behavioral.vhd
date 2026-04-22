library IEEE;
use IEEE.std_logic_1164.all;

entity Prime is
    port(num: in STD_LOGIC_VECTOR(3 downto 0);
        prim: out STD_LOGIC);
end Prime;

architecture beh of Prime is
begin
    process(num) 
    begin
        case num Is
            when x"1" | x"2" | x"3" | x"5" | x"7" | x"b" | x"d" => prim <= '1';
            when others => prim <= '0';
        end case;
    end process;
end beh;