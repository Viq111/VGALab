library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Sprite
entity DestructibleWallSprite is
    Port ( relativeX : in INTEGER;
           relativeY : in INTEGER;
		   drawIt : in STD_LOGIC;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
end DestructibleWallSprite;

architecture Behavioral of DestructibleWallSprite is
begin
	-- To-do : Change Sprite
	-- Begin of sprite Code
	-- From fixed_block.png - MODIFIED
	RGB <=	"100" when ((drawIt = '1') and (relativeY < 3) and (relativeX = 3)) else
			"100" when ((drawIt = '1') and (relativeY < 3) and (relativeX = 11)) else
			"100" when ((drawIt = '1') and (relativeY = 3)) else
			"100" when ((drawIt = '1') and (relativeY > 3) and (relativeY < 7) and (relativeX = 7)) else
			"100" when ((drawIt = '1') and (relativeY > 3) and (relativeY < 7) and (relativeX = 15)) else
			"100" when ((drawIt = '1') and (relativeY = 7)) else
			"100" when ((drawIt = '1') and (relativeY > 7) and (relativeY < 11) and (relativeX = 3)) else
			"100" when ((drawIt = '1') and (relativeY > 7) and (relativeY < 11) and (relativeX = 11)) else
			"100" when ((drawIt = '1') and (relativeY = 11)) else
			"100" when ((drawIt = '1') and (relativeY > 11) and (relativeY < 15) and (relativeX = 7)) else
			"100" when ((drawIt = '1') and (relativeY > 11) and (relativeY < 15) and (relativeX = 15)) else
			"100" when ((drawIt = '1') and (relativeY = 15)) else
			"111" when (drawIt = '1') else
			"000";
	-- End of Sprite Code
end Behavioral;