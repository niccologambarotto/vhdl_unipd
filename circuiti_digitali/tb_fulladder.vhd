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
    -- 0,0,0
    a <= '0'; b <= '0'; cin <= '0';
    wait for 10 ns;
    report "a=0 b=0 cin=0 -> s=" & to_string(s) & " cout=" & to_string(cout);
    
    -- 0,0,1
    a <= '0'; b <= '0'; cin <= '1';
    wait for 10 ns;
    report "a=0 b=0 cin=1 -> s=" & to_string(s) & " cout=" & to_string(cout);

    -- 0,1,0
    a <= '0'; b <= '1'; cin <= '0';
    wait for 10 ns;
    report "a=0 b=1 cin=0 -> s=" & to_string(s) & " cout=" & to_string(cout);

    -- 1,1,1
    a <= '1'; b <= '1'; cin <= '1';
    wait for 10 ns;
    report "a=1 b=1 cin=1 -> s=" & to_string(s) & " cout=" & to_string(cout);

    wait;
end process;
end tb;