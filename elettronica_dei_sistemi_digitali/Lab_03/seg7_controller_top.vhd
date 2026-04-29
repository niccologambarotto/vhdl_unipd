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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg7_controller_top is
	--useful generic to set the switching rate
    Generic(switchingRate: integer := 100000);
		   port(CLK: in std_logic;
                RST: in std_logic;
                SW: in std_logic_vector(15 downto 0);
                CAT: out std_logic_vector(6 downto 0);
                An: out std_logic_vector(7 downto 0));
end seg7_controller_top;

architecture Behavioral of seg7_controller_top is

    component hex_to_7seg_decoder is 
    Port ( BIN : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
	end component;

--signal counter: integer := 0;

--Other signals?

begin
    
-- How many components? Which port map? 

    process(CLK, RST)
	--process (CLK) --> for synchronous reset. Remember to change if statement accordingly
    
    begin
    
        if RST = '1' then
        
			--RESET something here
        
        elsif rising_edge(CLK) then
		
			-- do something at each clk cycle
			-- counter <= counter + 1;
			-- if counter greater than some value then counter <= 0;

        end if;
    
    end process;


end Behavioral;
