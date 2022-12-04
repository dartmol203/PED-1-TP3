--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 19:44:48
-- Design Name: 
-- Module Name: fsm_tb - Behavioral
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

entity fsm_tb is
--  Port ( );
end fsm_tb;

architecture Behavioral of fsm_tb is
    component fsm 
        Port (  rw : in STD_LOGIC;
                enable : in STD_LOGIC;
                reset : in STD_LOGIC;
                clk : in STD_LOGIC;
                we : out STD_LOGIC;
                oe : out STD_LOGIC);
    end component;
    signal srw, senable, sreset, sclk, swe, soe: std_logic;
begin
    uut: fsm port map(  rw => srw,
                        enable => senable,
                        reset => sreset,
                        clk   => sclk,
                        we    => swe,
                        oe    => soe);
                        
    clk: process
    begin
        sclk <= '0';
        wait for 10 ns;
        sclk <= '1';
        wait for 10 ns;
    end process;
    
    teste: process
    begin 
        sreset <= '1' ;senable <= '0'; srw <='0'; sreset <= '0';
        wait for 40 ns; 
        senable <= '1'; srw <='0'; sreset <= '0';
        wait for 60 ns;
        senable <= '1'; srw <='1'; sreset <= '0';
        wait for 60 ns;
        senable <= '1'; srw <='0'; sreset <= '0';
        wait for 60 ns;
        senable <= '1'; srw <='1'; sreset <= '0';
        wait for 60 ns;
        senable <= '1'; srw <='0'; sreset <= '0';
        wait for 60 ns;
        senable <= '1'; srw <='0'; sreset <= '0';
        wait for 60 ns;
        
    end process;

end Behavioral;
