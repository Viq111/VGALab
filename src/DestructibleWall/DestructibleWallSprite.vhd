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
	-- Begin of sprite Code
    -- From breakable_block1.png
    RGB <=  "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 1)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 2)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 3)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 11)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 12)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 13)) else
            "011" when ((drawIt = '1') and (relativeX = 0) and (relativeY = 14)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 1)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 2)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 3)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 8)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 9)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 10)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 11)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 12)) else
            "011" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 1) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 4)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 5)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 6)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 2) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 4)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 5)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 6)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 3) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 5)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 6)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 8)) else
            "011" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 4) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 5) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 6) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 4)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 5)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 7)) else
            "011" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 7) and (relativeY = 14)) else
            "011" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 7)) else
            "010" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 8) and (relativeY = 14)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 7)) else
            "010" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 9) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 7)) else
            "010" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 10) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 7)) else
            "010" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 11) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 4)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 5)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 6)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 12) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 1)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 2)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 3)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 4)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 5)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 6)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 7)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 8)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 9)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 10)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 11)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 12)) else
            "001" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 13) and (relativeY = 15)) else
            "011" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 0)) else
            "011" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 1)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 2)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 3)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 6)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 7)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 8)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 9)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 10)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 11)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 12)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 14)) else
            "010" when ((drawIt = '1') and (relativeX = 14) and (relativeY = 15)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 1)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 2)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 3)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 4)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 5)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 6)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 9)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 10)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 11)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 12)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 13)) else
            "010" when ((drawIt = '1') and (relativeX = 15) and (relativeY = 14)) else
            "000";
    -- End of Sprite Code
end Behavioral;