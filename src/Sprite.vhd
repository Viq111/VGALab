library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sprite is
    Port ( relativeX : in INTEGER;
           relativeY : in INTEGER;
		   drawIt : in STD_LOGIC;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
end Sprite;

architecture Behavioral of Sprite is
begin
	-- Begin of sprite Code
	RGB <= "111" when ((drawIt = '1') and (X = 5) and (Y = 5)) else "000";
	-- End of Sprite Code
end Behavioral;
