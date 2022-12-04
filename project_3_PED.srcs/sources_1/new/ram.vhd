----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2021 14:54:51
-- Design Name: 
-- Module Name: ram - Behavioral
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

entity ram is
    generic(    N: integer := 4;
                M: integer := 4);
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           oe : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (N-1 downto 0);
           din : in STD_LOGIC_VECTOR (M-1 downto 0);
           dout : out STD_LOGIC_VECTOR (M-1 downto 0));
end ram;

architecture Behavioral of ram is
    type mem_array is array ((2**N-1) downto 0) of STD_LOGIC_VECTOR (M-1 downto 0);
    signal mem: mem_array;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(to_integer(unsigned(addr))) <= din;
            elsif oe = '1' then
                dout <= mem(to_integer(unsigned(addr)));
            end if;
        end if;
    end process;
end Behavioral;
