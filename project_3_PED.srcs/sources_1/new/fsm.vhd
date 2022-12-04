----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2021 15:42:19
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( rw : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           we : out STD_LOGIC;
           oe : out STD_LOGIC);
end fsm;

architecture Behavioral of fsm is

    type state is (idle, decision, write, read) ;
    signal current_state, next_state : state := idle;

begin

     armazena_estado: process (clk, reset)
     begin
        if rising_edge(clk) then
            if reset = '1' then
                current_state <= idle;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    transicao_estado: process (current_state, enable, rw)
    begin
        case current_state is 
            when idle =>
                we <= '0';
                oe <= '0';
                if enable ='1' then next_state <= decision;
                else next_state <= idle;
                end if;
            when decision =>
                we <= '0';
                oe <= '0';
                if rw ='1' then next_state <= read;
                else next_state <= write;
                end if;
            when read =>
                we <= '0';
                oe <= '1';
                next_state <= idle;
            when write =>
                we <= '1';
                oe <= '0';
                next_state <= idle;
        end case;    
    end process;
end Behavioral;
