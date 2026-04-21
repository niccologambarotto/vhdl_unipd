----------------------------------------------------------------------------------
-- Company: UNIPD
-- Engineer: Niccolo' Gambarotto
-- 
-- Create Date: 04/21/2026 08:40:44 AM
-- Design Name: counter_top
-- Module Name: counter_top - Behavioral
-- Project Name: Lab_02
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple counter up/down to 15
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: In this repo you will not find the costraints neccecaris for
--                      for the actual board. But it's usefull to keep track of the progress
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values -> gonna use this for comodity.
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DIRECTION: in STD_LOGIC; -- It's a switch for counting up or down
           COUNTER : out STD_LOGIC_VECTOR(3 downto 0));
end counter_top;

architecture Behavioral of counter_top is
signal count: integer := 0;
signal CHECKPOINT: std_logic := '0';

begin
    process(CLK, RST)
    begin
        if RST = '1' then 
            CHECKPOINT <= '0';
            count <= 0;
        elsif rising_edge(CLK) then
            count <= count + 1;
            CHECKPOINT <= '0';
            if count >= 9 then 
                CHECKPOINT <= '1';
                count <= 0;
            end if;
        end if;
    end process;

end Behavioral;