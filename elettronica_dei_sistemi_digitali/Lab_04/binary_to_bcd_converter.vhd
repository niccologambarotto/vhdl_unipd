----------------------------------------------------------------------------------
-- Company: Unipd
-- Engineer: Andrea Stanco
-- 
-- Create Date:
-- Design Name: 
-- Module Name: binary_to_bcd_converter - Behavioral
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

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_to_bcd_converter is
    Port ( BIN : in STD_LOGIC_VECTOR (12 downto 0);
           BCD : out STD_LOGIC_VECTOR (15 downto 0));
end binary_to_bcd_converter;

architecture Behavioral of binary_to_bcd_converter is

begin

    process(BIN)
        variable bcdVar : std_logic_vector(15 downto 0) := (others => '0');
        variable bint : std_logic_vector(12 downto 0) := (others => '0');
       
        begin
        
            bint := BIN;
            bcdVar := (others => '0');
        
            for i in 0 to 12 loop  -- repeating 13 times.
            
                bcdVar(15 downto 1) := bcdVar(14 downto 0);  --shifting the bits.
                bcdVar(0) := bint(12);
                bint(12 downto 1) := bint(11 downto 0);
                bint(0) :='0';
      
                if(i < 12 and bcdVar(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                    bcdVar(3 downto 0) := bcdVar(3 downto 0) + "0011";
                end if;
                
                if(i < 12 and bcdVar(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                    bcdVar(7 downto 4) := bcdVar(7 downto 4) + "0011";
                end if;
                
                if(i < 12 and bcdVar(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                    bcdVar(11 downto 8) := bcdVar(11 downto 8) + "0011";
                end if;
                
                if(i < 12 and bcdVar(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                    bcdVar(15 downto 12) := bcdVar(15 downto 12) + "0011";
                end if;
            
            end loop;
            
        BCD <= bcdVar;
    
    end process;


end Behavioral;
