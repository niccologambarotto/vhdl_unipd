library IEEE;
use IEEE.std_logic_1164.all;

entity encoder4_to_2 is
    port(i: in std_logic_vector(3 downto 0);
        o: out std_logic_vector(1 downto 0));
end encoder4_to_2;

architecture dataflow of encoder4_to_2 is
begin
    o(1) <= i(2) or i(3);
    o(0) <= i(1) or i(3);
end architecture;