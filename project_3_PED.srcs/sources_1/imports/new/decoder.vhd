----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2021 13:43:32
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity bcd is
    Port (  seg : buffer STD_LOGIC_VECTOR (6 downto 0);
            entrada : in std_logic_vector (3 downto 0) );
end bcd;

architecture Behavioral of bcd is
    
begin

    with entrada select
        seg <=  "1000000" when "0000", --'0'
                "1111001" when "0001", --'1'
                "0100100" when "0010", --'2'
                "0110000" when "0011", --'3'
                "0011001" when "0100", --'4'
                "0010010" when "0101", --'5'
                "0000010" when "0110", --'6'
                "1111000" when "0111", --'7'
                "0000000" when "1110", --'8'
                "0010000" when "1101", --'9'
                "1111111" when others; -- zerar

end Behavioral;
