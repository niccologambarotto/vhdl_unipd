library IEEE;
use IEEE.std_logic_1164.all;


entity isPrime_struc is
    port(num: in STD_LOGIC_VECTOR(3 downto 0);
        prime: out STD_LOGIC);
end isPrime_struc;

architecture struct of isPrime_struc is
    component inverter is
    port(a: in std_logic;
        y: out std_logic);
    end component;
    
    component and2 is 
    port(a, b: in std_logic;
        y: out std_logic);
    end component;

    component and3 is 
    port(a, b, c: in std_logic;
        y: out std_logic);
    end component;

    component or4 is 
    port(a, b, c, d: in std_logic;
        y: out std_logic);
    end component;
signal n1, n2, n3, a1, a2, a3, a4, o: std_logic;
begin
i1: inverter port map(a => num(3), y => n1);
i2:  inverter port map(a => num(2), y => n2);
i3:  inverter port map(a => num(1), y => n3);
u1:  and2 port map(a => n1, b => num(3), y => a1);
u2:  and3 port map(a => n1, b => num(1), c => n2, y => a2);
u3:  and3 port map(a => n2, b => num(1), c => num(0), y => a3);
u4:  and3 port map(a => n3, b => num(2), c => num(0), y => a4);
s:  or4 port map(a => a1, b => a2, c => a3, d => a4, y => prime);
end struct;