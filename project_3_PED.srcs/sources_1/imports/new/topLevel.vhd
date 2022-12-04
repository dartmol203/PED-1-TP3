----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2021 16:07:22
-- Design Name: 
-- Module Name: topLevel - Behavioral
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

entity topLevel is
    Port ( tA : in STD_LOGIC_VECTOR (3 downto 0);
           tB : in STD_LOGIC_VECTOR (3 downto 0);
           tEscolha : in STD_LOGIC_VECTOR (1 downto 0);
           tSeg : buffer STD_LOGIC_VECTOR (7 downto 0);
           tOver : out STD_LOGIC;
           tresult : buffer STD_LOGIC_VECTOR (3 downto 0));
end topLevel;

architecture Behavioral of topLevel is
    
    component ula 
        Port(   A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                escolha : in STD_LOGIC_VECTOR (1 downto 0);
                over : out STD_LOGIC;
                result2 : buffer STD_LOGIC_VECTOR (3 downto 0);
                result : buffer STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component bcd 
        Port(   seg : buffer STD_LOGIC_VECTOR (7 downto 0);
                entrada : in std_logic_vector (3 downto 0) );
    end component;
    
    signal sresult: std_logic_vector(3 downto 0);
    
begin
    uut: ula port map(       A       => tA,
                             B       => tB,
                             result  => sresult,
                             result2 => tresult,
                             over    => tOver,
                             Escolha => tescolha);
                             
    uua: bcd port map(       entrada => sresult,
                             seg     => tseg);

    

end Behavioral;
