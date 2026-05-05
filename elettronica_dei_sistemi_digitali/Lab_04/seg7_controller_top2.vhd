----------------------------------------------------------------------------------
-- Company: Unipd
-- Engineer: Andrea Stanco
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

entity seg7_controller_top2 is
    Generic(
            switchingRate: integer := 200000
            );

    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (12 downto 0);
           CAT : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end seg7_controller_top2;

architecture Behavioral of seg7_controller_top2 is

component hex_to_7seg_decoder is
    Port ( BIN : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component  binary_to_bcd_converter is
    Port ( BIN : in STD_LOGIC_VECTOR (12 downto 0);
           BCD : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Declare some signals here
signal bcd_out: std_logic_vector(15 downto 0);

signal disp0, disp1, disp2, disp3 : std_logic_vector(6 downto 0) := (others=> '0');
signal counter: integer := 0;
signal switchDisplay : std_logic_vector(1 downto 0) := "00";

begin
-- instantiate some components here
display0_decoder: hex_to_7seg_decoder
    port map (
            BIN => bcd_out(3 downto 0),
            SEG => disp0
            );
            
display1_decoder: hex_to_7seg_decoder
    port map (
            BIN => bcd_out(7 downto 4),
            SEG => disp1
            );
            
display2_decoder: hex_to_7seg_decoder
    port map (
            BIN => bcd_out(11 downto 8),
            SEG => disp2
            );
            
display3_decoder: hex_to_7seg_decoder
    port map (
            BIN => bcd_out(15 downto 12),
            SEG => disp3
            );
    
bin2BCD: binary_to_bcd_converter
    port map (
            BIN => SW,
            BCD => bcd_out
            );
-- Remember to set generic values if required

    
--Stroboscopic selector
    process(CLK, RST) is
    
    begin
    
        if RST = '1' then
        
            AN <= (others => '1');
            CAT <= (others => '0');
            counter <= 0;
            switchDisplay <= "00";
        
        elsif rising_edge(CLK) then

            if counter >= switchingRate-1 then
            
                case switchDisplay is
                
                when "00" =>
                    AN <= "11111110";
                    CAT <= disp0;
                    switchDisplay <= "01";
                    counter <= 0;
                
                when "01" =>
                    AN <= "11111101";
                    CAT <= disp1;
                    switchDisplay <= "10";
                    counter <= 0;  
                    
                when "10" =>
                    AN <= "11111011";
                    CAT <= disp2;
                    switchDisplay <= "11";
                    counter <= 0;   
                    
                when "11" =>
                    AN <= "11110111";
                    CAT <= disp3;
                    switchDisplay <= "00";
                    counter <= 0;   
                
                when others =>
                    AN <= "11111111";
                    CAT <= "0000000";
                    switchDisplay <= "00";
                    counter <= 0; 
                end case;
            else
                counter <= counter + 1;
            end if;
       
        end if;
    
    end process;


end Behavioral;