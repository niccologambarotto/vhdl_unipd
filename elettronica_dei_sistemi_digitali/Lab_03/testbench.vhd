----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date:
-- Design Name: 
-- Module Name: seg7_controller_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_controller is
end tb_controller;

architecture Behavioral of tb_controller is
    component seg7_controller_top is
	--useful generic to set the switching rate
    Generic(switchingRate: integer := 10000);
		   port(CLK: in std_logic;
                RST: in std_logic;
                SW: in std_logic_vector(15 downto 0);
                CAT: out std_logic_vector(6 downto 0);
                AN: out std_logic_vector(7 downto 0));
    end component;

signal clk, rst: std_logic := '0';
signal sw: std_logic_vector(15 downto 0);
signal cat: std_logic_vector(6 downto 0);
signal an: std_logic_vector(7 downto 0);

begin
    DUT: seg7_controller_top
    port map(CLK => clk,
            RST => rst,
            SW => sw,
            CAT => cat,
            AN => an);

    clk_proc: process
    begin
        wait for 10 ns;
        clk <= not clk;
    end process;

    rst_proc: process
    begin
        wait for 5 ns;
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 4 ms;
    end process;

    test: process
    begin
        report "do a sw un valore abbastanza a caso: 0111011101110111";
        sw <= "0111011101110111";
        wait for 4500 us;
        
    end process;

end architecture;