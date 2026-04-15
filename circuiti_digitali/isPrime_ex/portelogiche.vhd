library IEEE;
use IEEE.std_logic_1164.all;

-- Inverter (not1)
entity inverter is
    port(a: in std_logic;
        y: out std_logic);
end inverter;

architecture rtl of inverter is
begin
    y <= not a;
end rtl;

-- AND2
library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is 
    port(a, b: in std_logic;
        y: out std_logic);
end and2;

architecture rtl of and2 is 
begin
    y <= a and b;
end rtl;

-- AND3
library IEEE;
use IEEE.std_logic_1164.all;

entity and3 is 
    port(a, b, c: in std_logic;
        y: out std_logic);
end and3;

architecture rtl of and3 is 
begin
    y <= a and b and c;
end rtl;

-- OR4
library IEEE;
use IEEE.std_logic_1164.all;

entity or4 is 
    port(a, b, c, d: in std_logic;
        y: out std_logic);
end or4;

architecture rtl of or4 is 
begin
    y <= a or b or c or d;
end rtl;