----------------------------------------------------------------------------------
-- Company: UNIPD
-- Engineer: Niccolo' Gambarotto
-- 
-- Create Date: 04/14/2026 09:22:44 AM
-- Design Name: counter
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple counter
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

entity counters is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CHECKPOINT : out STD_LOGIC);
end counters;

architecture Behavioral of counters is

signal counter: integer := 0;

begin

    process(CLK, RST)
    
    begin
    
        if RST = '1' then 
            
            CHECKPOINT <= '0';
            counter <= 0;
        
        elsif rising_edge(CLK) then
        
            counter <= counter + 1;
            CHECKPOINT <= '0';
            if counter >= 9 then 
                CHECKPOINT <= '1';
                counter <= 0;
            end if;
        end if;
    end process;

end Behavioral;