library IEEE;
use IEEE.std_logic_1164.all;

entity fulltest is
end fulltest;

architecture tb of fulltest is
signal a, b, cin, s, cout: std_logic;
component fulladder is
	port(a, b, cin: in std_logic;
    	s, cout:out std_logic);
end component;
begin
DUT: fulladder port map (a, b, cin, s, cout);
process begin
	a <= '1';
    b <= '1';
    cin <= '0';
    wait for 10 ns;
    report "output1 = " & to_string(s);
    report "output2 = " & to_string(cout);
    wait;
end process;
end tb;