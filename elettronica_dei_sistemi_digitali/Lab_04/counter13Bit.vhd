----------------------------------------------------------------------------------
-- Company: Unipd
-- Engineer: Andrea Stanco
-- 
-- Create Date:
-- Design Name: 
-- Module Name: counter13Bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter13Bit is

	Generic (refreshRate : integer := 10;
             step : integer := 1);
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (12 downto 0));
end counter13Bit;

architecture Behavioral of counter13Bit is

signal count: integer := 0;
signal refreshRateCount: integer := 0;

begin

COUNTER <= std_logic_vector(to_unsigned(count, 13));

    process(CLK,RST)
    begin
        if RST = '1' then
            
            count <= 0;
			refreshRateCount <= 0;
			
        elsif rising_edge(CLK) then
            
			refreshRateCount <= refreshRateCount + 1;
            
            if refreshRateCount >= refreshRate then 
                refreshRateCount <= 0;        
                if DIRECTION = '1' then
                    count <= count + step;
                elsif DIRECTION = '0' then
                    count <= count-step;
                end if;
            
            end if;
        end if;
    end process;

end Behavioral;
