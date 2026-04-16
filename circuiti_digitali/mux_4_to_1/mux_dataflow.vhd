library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_to_1 is
    port(s: in std_logic_vector(1 downto 0);
        i: in std_logic_vector(3 downto 0);
        o: out std_logic);
end mux4_to_1;

architecture dataflow of mux4_to_1 is
begin
    o <= (i(0) and not s(1) and not s(0)) or
     (i(1) and not s(1) and s(0))     or
     (i(2) and s(1) and not s(0))     or
     (i(3) and s(1) and s(0));
end architecture;