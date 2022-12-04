----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2021 15:45:17
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    Port ( tAddr : in STD_LOGIC_VECTOR (3 downto 0);
           tDin : in STD_LOGIC_VECTOR (3 downto 0);
           tRw : in STD_LOGIC;
           tEnable : in STD_LOGIC;
           tReset : in STD_LOGIC;
           tClk : in STD_LOGIC;
           tSeg : buffer STD_LOGIC_VECTOR (6 downto 0));
end toplevel;

architecture Behavioral of toplevel is

    component fsm
        port(   rw     : in  std_logic;
                enable : in  std_logic;
                reset  : in  std_logic;
                clk    : in  std_logic;
                we     : out std_logic;
                oe     : out std_logic);
    end component;
    
    component ram
        port(   we     : in  std_logic;
                oe     : in  std_logic;
                clk    : in  std_logic;
                addr   : in  std_logic_vector (3 downto 0) ;
                din    : in  std_logic_vector (3 downto 0) ;
                dout   : out std_logic_vector (3 downto 0));
    end component;
    
    component bcd 
        Port(   seg : buffer STD_LOGIC_VECTOR (6 downto 0);
                entrada : in std_logic_vector (3 downto 0) );
    end component;
    
    signal sWe: std_logic;
    signal sOe: std_logic;
    signal sDout: std_logic_vector(3 downto 0);
    
begin
    
    uub: fsm port map(      rw       => tRw,
                            enable   => tEnable,
                            reset    => tReset,
                            clk      => tClk,
                            we       => sWe,
                            oe       => sOe);
    
    uut: ram port map(      we       => sWe,
                            oe       => sOe,
                            clk      => tClk,
                            addr     => tAddr,
                            din      => tdin,
                            dout     => sDout);

    uua: bcd port map(       entrada => sDout,
                             seg     => tSeg);
    

end Behavioral;
