library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is 
    port(clk, rst, s_in: in std_logic;
        s_out: out std_logic;
        p_out: out std_logic_vector(7 downto 0)
            );
end shift_register;

architecture behavioral of shift_register is
    signal reg: std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                reg <= "00000000";           -- azzera se rst attivo
            else
                reg <= reg(6 downto 0) & s_in;  -- altrimenti shifta
            end if;
        end if;
    end process;
    s_out <= reg(7);
    p_out <= reg;
end behavioral;