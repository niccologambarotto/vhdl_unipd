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
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (3 downto 0));
end counter_top;

architecture Behavioral of counter_top is

signal count: integer := 0;

--Uncomment next line if you want to "slow down" the counting
--signal aux_count: integer := 0;

begin

COUNTER <= std_logic_vector(to_unsigned(count, 4));

    process(CLK,RST)
    begin
        if RST = '1' then
            
            count <= 0;                     -- Comment for use std_logic_vector counter
			--aux_count <= 0;				-- Uncomment for "slowing down" the counter
        elsif rising_edge(CLK) then
            
			--aux_count <= aux_count + 1;    -- Uncomment for "slowing down" the counter
            
            --if aux_count >= 30000000 then  -- Uncomment for "slowing down" the counter
                --aux_count <= 0;            -- Uncomment for "slowing down" the counter
                if DIRECTION = '1' then
                    if count = 15 then
                        count <= 0;       -- wrap-around verso l'alto
                    else
                        count <= count + 1;
                    end if;
                elsif DIRECTION = '0' then
                    if count = 0 then
                        count <= 15;      -- wrap-around verso il basso
                    else
                        count <= count - 1;
                    end if;
                end if;
            
            --end if;                        -- Uncomment for "slowing down" the counter
        end if;
    end process;


end Behavioral;
