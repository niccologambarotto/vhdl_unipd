library IEEE;
use IEEE.std_logic_1164.all;

entity tb_encoder_dataflow is
end tb_encoder_dataflow;

architecture test of tb_encoder_dataflow is
    signal a: std_logic_vector(3 downto 0);
    signal d: std_logic_vector(1 downto 0);
begin
    DUT: entity work.encoder4_to_2
    port map(i => a, o => d);
    process
    begin
        -- Test per '0001'
        a <= "0001";
        wait for 5 ns;
        report "Output of '0001' is: " & TO_STRING(d);
        -- Test per '0010'
        a <= "0010";
        wait for 5 ns;
        report "Output of '0010' is: " & TO_STRING(d);
        -- Test per '0100'
        a <= "0100";
        wait for 5 ns;
        report "Output of '0100' is: " & TO_STRING(d);
        -- Test per '1000'
        a <= "1000";
        wait for 5 ns;
        report "Output of '1000' is: " & TO_STRING(d);
        wait;
    end process;
end test;