----------------------------------------------------------------------------------
-- Company: UNIPD
-- Engineer: Niccolo' Gambarotto
-- 
-- Create Date: 04/14/2026 09:52:21 AM
-- Design Name: 
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench simulation of Simple counter
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_counter is
--  Port ( );
end tb_counter;

architecture Behavioral of tb_counter is

    component counter is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CHECKPOINT : out STD_LOGIC);
    end component;
    
signal clk, rst, checkpoint: std_logic := '0';
    
begin

    DUT: counter
    port map(
            CLK => clk, 
            RST => rst, 
            CHECKPOINT => checkpoint
            );
    
    clk_proc: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    
    rst_proc: process
    begin
        wait for 5 ns;
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 10 us;
    end process;
end Behavioral;