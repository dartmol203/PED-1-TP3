----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 02:26:43
-- Design Name: 
-- Module Name: toplevel_tb - Behavioral
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

entity toplevel_tb is
--  Port ( );
end toplevel_tb;

architecture Behavioral of toplevel_tb is

    component toplevel
        port(   tAddr : in STD_LOGIC_VECTOR (3 downto 0);
                tDin : in STD_LOGIC_VECTOR (3 downto 0);
                tRw : in STD_LOGIC;
                tEnable : in STD_LOGIC;
                tReset : in STD_LOGIC;
                tClk : in STD_LOGIC;
                tDout_7seg : buffer STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal sclk, sreset, srw, senable: std_logic;
    signal saddr, sdin: std_logic_vector(3 downto 0);
    signal sdout_7seg: std_logic_vector(6 downto 0);
begin

    uut: toplevel port map(     tAddr      => saddr,
                                tDin       => sdin,
                                tRw        => srw,
                                tEnable    => senable,
                                tReset     => sreset,
                                tClk       => sclk,
                                tDout_7seg => sdout_7seg);
                                                           
    clk: process
    begin
        sclk <= '0';
        wait for 10 ns;
        sclk <= '1';
        wait for 10 ns;
    end process;
    
    stin: process
    begin
        --------------------------ESCRITA----------------------------------
        sreset <= '1'; saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '0'; 
        wait for 30 ns;
        sreset <= '0'; saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0010"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0001"; sdin <= "0000"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0010"; sdin <= "0000"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0011"; sdin <= "0000"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0100"; sdin <= "0001"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0101"; sdin <= "0100"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0110"; sdin <= "0100"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0111"; sdin <= "0100"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '0'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "1000"; sdin <= "0111"; srw <= '0'; senable <= '0'; 
        wait for 60 ns;
        --------------------LEITURA-------------------------
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0010"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0001"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0010"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0011"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0100"; sdin <= "0001"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0101"; sdin <= "0100"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0110"; sdin <= "0100"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0111"; sdin <= "0100"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "1000"; sdin <= "0110"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;

        ----------------LEITURA ALEATORIA ------------------------
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0010"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0010"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0101"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0110"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '1'; 
        wait for 60 ns;
        saddr <= "0000"; sdin <= "0000"; srw <= '1'; senable <= '0'; 
        wait;
        
    end process;
    
end Behavioral;
