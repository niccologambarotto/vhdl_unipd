----------------------------------------------------------------------------------
-- Nome Modulo:  Testbench del Decoder 2 to 4
-- Autore:       Niccolò Gambarotto
-- Data:         16 Aprile 2026
--
-- Descrizione:  Testbench per la simulazione di un Decoder 2 to 4, in particolare
--               vengono testati tutti e 4 gli ingressi possibili.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_decoder_dataflow is
end tb_decoder_dataflow;

architecture test of tb_decoder_dataflow is
    signal a0, a1: std_logic;
    signal d: STD_LOGIC_VECTOR(3 downto 0);
component decoder2_to_4 is 
    port (i0, i1: in STD_LOGIC;
        o: out STD_LOGIC_VECTOR(3 downto 0));
end component;
begin
DUT: decoder2_to_4
    port map(a0, a1, d);
    process
    begin
        -- Test 00 -> atteso: 0001
        a0 <= '0'; a1 <= '0';
        wait for 5 ns;
        report "i1=0 i0=0 | Output: " & TO_STRING(d);

        -- Test 01 -> atteso: 0010
        a0 <= '1'; a1 <= '0';
        wait for 5 ns;
        report "i1=0 i0=1 | Output: " & TO_STRING(d);

        -- Test 10 -> atteso: 0100
        a0 <= '0'; a1 <= '1';
        wait for 5 ns;
        report "i1=1 i0=0 | Output: " & TO_STRING(d);

        -- Test 11 -> atteso: 1000
        a0 <= '1'; a1 <= '1';
        wait for 5 ns;
        report "i1=1 i0=1 | Output: " & TO_STRING(d);
        wait;
    end process;
end architecture;