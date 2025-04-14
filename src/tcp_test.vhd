----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2025 09:33:50 PM
-- Design Name: 
-- Module Name: tcp_test - Behavioral
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

entity tcp_test is
    Port ( 
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           
           -- out to the ethernet core
           tx_data : out STD_LOGIC_VECTOR (7 downto 0);
           tx_valid : out STD_LOGIC;
           tx_ready : in STD_LOGIC;
           
           -- in from the ethernet core
           rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           rx_valid : in STD_LOGIC;
           rx_ready : out STD_LOGIC);
end tcp_test;

architecture Behavioral of tcp_test is

signal tcp_out : std_logic_vector(7 downto 0);

signal rx_reg : std_logic_vector(7 downto 0);


begin

process(clk, rst)
begin

    if rst = '1' then
        
        tx_data <= (others => '0');
        tx_valid <= '0';
        
        rx_ready <= '0';
        
        tcp_out <= (others => '0');
        rx_reg <= (others => '0');
    
    elsif rising_edge(clk) then
        
        rx_ready <= '1';
        
        if rx_valid = '1' then
            rx_reg <= rx_data;
        end if;
        
        
        if tx_ready = '1' then
            tx_data <= x"41";
            tx_valid <= '1';
        else
            tx_data <= (others => '0');
            tx_valid <= '0';

        end if;
            
    
    end if;

end process;


end Behavioral;