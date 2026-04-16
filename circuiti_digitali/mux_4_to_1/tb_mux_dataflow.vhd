library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux_dataflow is
end tb_mux_dataflow;

architecture test of tb_mux_dataflow is
    signal s: std_logic_vector(1 downto 0);
    signal i: std_logic_vector(3 downto 0);
    signal o: std_logic;
begin
    DUT: entity work.mux4_to_1
        port map(s => s, i => i, o => o);
process
begin
    i <= "1001";  -- fisso i dati una volta sola
    
    s <= "00";
    wait for 5 ns;
    report "s=00, output: " & TO_STRING(o);
    
    s <= "01";
    wait for 5 ns;
    report "s=01, output: " & TO_STRING(o);
    
    s <= "10";
    wait for 5 ns;
    report "s=10, output: " & TO_STRING(o);

    s <= "11";
    wait for 5 ns;
    report "s=11, output: " & TO_STRING(o);
    wait;
end process;
end test;