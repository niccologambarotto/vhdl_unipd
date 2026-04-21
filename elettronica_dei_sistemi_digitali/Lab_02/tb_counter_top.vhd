----------------------------------------------------------------------------------
-- Company: Unipd	
-- Engineer: Niccolò Gambarotto
--
-- Create Date: 04/21/2026 09:42:27 AM
-- Design Name: 
-- Module Name: tb_counter_top - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_counter_top is
--  Port ( );
end tb_counter_top;

architecture Behavioral of tb_counter_top is

    component counter_top is
        Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

signal clk, rst, direction : std_logic := '0';
signal counter: std_logic_vector(3 downto 0) := (others=>'0');

begin

    DUT: counter_top
    port map (
            CLK => clk,
            RST => rst,
            DIRECTION => direction,
            COUNTER => counter
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
        wait for 20 us;
    end process;
    
    dir_proc: process
    begin
        wait for 500 ns;
        direction <= not direction;
    end process;

end Behavioral;