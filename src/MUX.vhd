library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    Port ( drawAvailable : in STD_LOGIC;
           -- Add each Sprite here
           RGB1 : in STD_LOGIC_VECTOR (0 to 2);
    RGB : out STD_LOGIC_VECTOR (0 to 11) );
end MUX;

architecture Behavioral of MUX is
signal RGBs : STD_LOGIC_VECTOR (0 to 11);
begin
    RGB <= RGBs;
    RGBs(1) <= RGBs(0);
    RGBs(2) <= RGBs(0);
    RGBs(3) <= RGBs(0);
    RGBs(5) <= RGBs(4);
    RGBs(6) <= RGBs(4);
    RGBs(7) <= RGBs(4);
    RGBs(9) <= RGBs(8);
    RGBs(10) <= RGBs(8);
    RGBs(11) <= RGBs(8);
    RGBs(0) <= RGB1(0) when (drawAvailable = '1') else '0';
    RGBs(4) <= RGB1(1) when (drawAvailable = '1') else '0';
    RGBs(8) <= RGB1(2) when (drawAvailable = '1') else '0';
end Behavioral;
