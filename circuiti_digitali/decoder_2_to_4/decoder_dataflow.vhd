library IEEE;
use IEEE.std_logic_1164.all;

entity decoder2_to_4 is 
    port(i0, i1: in STD_LOGIC;
        o: out STD_LOGIC_VECTOR(3 downto 0));
end decoder2_to_4;

architecture dataflow of decoder2_to_4 is
begin
    o(0) <= (not i0) and (not i1);
    o(1) <= i0 and (not i1);
    o(2) <= (not i0) and i1;
    o(3) <= i0 and i1;
end dataflow;