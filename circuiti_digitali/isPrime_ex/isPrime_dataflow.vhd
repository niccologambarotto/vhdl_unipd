library IEEE;
use IEEE.std_logic_1164.all;

entity isPrime is
    port(num: in STD_LOGIC_VECTOR(3 downto 0);
        prime: out STD_LOGIC);
end isPrime;

architecture behv of isPrime is
begin
    prime <= (num(0) and not num(1) and num(2)) OR 
                (num(0) and num(1) and not num(2)) OR
                (num(1) and not num(2) and not num(3)) OR
                (num(0) and not num(3));
end behv;