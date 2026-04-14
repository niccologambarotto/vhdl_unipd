library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
	port(a, b, cin: in std_logic;
    	s, cout:out std_logic);
end fulladder;

architecture behv of fulladder is

signal s1, s2, s3: std_logic;

begin
	s1 <= a xor b;
    s2 <= a and b;
    s <= s1 xor cin;
    s3 <= s1 and cin;
    cout <= s2 or s3;

end behv;