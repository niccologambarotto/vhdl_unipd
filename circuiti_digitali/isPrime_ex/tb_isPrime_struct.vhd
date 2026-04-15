library IEEE;
use IEEE.std_logic_1164.all;

entity tb_isPrime_struct is
end tb_isPrime_struct;

architecture test2 of tb_isPrime is
    signal num: std_logic_vector(3 downto 0);
    signal prime: std_logic;
component isPrime_struct is
    port(num: in STD_LOGIC_VECTOR(3 downto 0);
        prime: out STD_LOGIC);
end component;
begin
DUT: isPrime_struct
 port map(num => num, prime => prime);
    process
    begin
        -- Gli diamo un numero primo
        num <= "0100";
        wait for 5 ns;
        report "0100 -> e' primo? ";
        if(prime = '1') then report "Si";
        else report "No";
        end if;
        wait;
    end process;
end test2;