library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_shift_register is
end tb_shift_register;

architecture test of tb_shift_register is
    signal clk  : std_logic := '0';  -- inizializzato!
    signal rst  : std_logic := '0';  -- inizializzato!
    signal s_in : std_logic := '0';  -- inizializzato!
    signal s_out: std_logic;
    signal p_out: std_logic_vector(7 downto 0);
begin
    
    DUT: entity work.shift_register port map(clk, rst, s_in, s_out, p_out);

    clk_proc: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    process
    begin
        wait for 5 ns;
        s_in <= '1';
        wait for 5 ns;
        report "Stato iniziale: " & TO_STRING(p_out);
        wait;
    end process;
end test;