library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Sprite
entity BombeSprite is
    Port ( relativeX : in INTEGER;
           relativeY : in INTEGER;
		   drawIt : in STD_LOGIC;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
end BombeSprite;

architecture Behavioral of BombeSprite is
begin
	-- Begin of sprite Code
    -- From bomb.png
    RGB <=  "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 13)) else
            "111" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 6)) else
            "111" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 7)) else
            "110" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 8)) else
            "111" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 13)) else
            "100" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 2)) else
            "111" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 6)) else
            "111" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 7)) else
            "110" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 8)) else
            "111" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 13)) else
            "100" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 1)) else
            "111" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 6)) else
            "111" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 7)) else
            "110" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 8)) else
            "111" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 13)) else
            "100" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 13)) else
            "100" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 11)) else
            "000";
    -- End of Sprite Code
end Behavioral;