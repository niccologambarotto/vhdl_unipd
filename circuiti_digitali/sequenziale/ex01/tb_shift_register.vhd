library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_shift_register is
end tb_shift_register;

architecture test of tb_shift_register is
    signal clk, rst, s_in, s_out: std_logic;
    signal p_out: std_logic_vector(7 downto 0);
begin
    DUT: entity work.shift_register port map(clk, rst, s_in, s_out, p_out);
    process
    begin
        wait for 5 ns;
        report "Stato iniziale: " & to_String(p_out);
        wait;
    end process;
end test;