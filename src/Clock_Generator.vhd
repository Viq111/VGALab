----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2014 15:54:07
-- Design Name: 
-- Module Name: Clock_Slower - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Clock_Generator is
port(   Clk : in std_logic;
        VGAClk : out std_logic
        );
end Clock_Generator;

architecture Behavioral of Clock_Generator is

signal counter : integer := 0;
-- Input Clock is 100Mhz
-- Output Clock for 640x480 60Hz is 25.175 Mhz, we divide by 4
signal divide : integer := 4;

begin
process(Clk)
begin
    if( rising_edge(Clk) ) then
        if(counter < divide/2-1) then
            counter <= counter + 1;
            VGAClk <= '0';
        elsif(counter < divide-1) then
            counter <= counter + 1;
            VGAClk <= '1';
        else
            VGAClk <= '0';
            counter <= 0;
        end if;
    end if;
end process;   

end Behavioral;