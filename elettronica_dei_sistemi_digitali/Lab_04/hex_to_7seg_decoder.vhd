----------------------------------------------------------------------------------
-- Company: Unipd
-- Engineer: Andrea Stanco
-- 
-- Create Date:
-- Design Name: 
-- Module Name: hex_to_7seg_decoder - Behavioral
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

entity hex_to_7seg_decoder is
    Port ( BIN : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end hex_to_7seg_decoder;

architecture Behavioral of hex_to_7seg_decoder is

begin

    SEG <= "1000000" when BIN = x"0" else
           "1111001" when BIN = x"1" else
           "0100100" when BIN = x"2" else
           "0110000" when BIN = x"3" else
           "0011001" when BIN = x"4" else
           "0010010" when BIN = x"5" else
           "0000010" when BIN = x"6" else
           "1111000" when BIN = x"7" else
           "0000000" when BIN = x"8" else
           "0010000" when BIN = x"9" else
           "0001000" when BIN = x"A" else
           "0000011" when BIN = x"B" else
           "1000110" when BIN = x"C" else
           "0100001" when BIN = x"D" else
           "0000110" when BIN = x"E" else
           "0001110" when BIN = x"F" else
           "1111111";


end Behavioral;
