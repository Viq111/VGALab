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
    RGB : out STD_LOGIC_VECTOR (0 to 11) );
end MUX;

architecture Behavioral of MUX is
begin
    RGB <= "111100000000" when (drawAvailable = '1') else "000000000000";
end Behavioral;
