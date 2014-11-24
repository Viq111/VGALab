library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Total FixedWall

entity FixedWall is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			Clk : in STD_LOGIC;
			wallPresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2) );
end FixedWall;

architecture Behavioral of FixedWall is
	signal s_wallPresent : STD_LOGIC := '0';
	signal relativeX : INTEGER;
	signal relativeY : INTEGER;
	component FixedWallLocalCoordinates is
		Port ( 	X : in INTEGER;
				Y : in INTEGER;
				relativeX : out INTEGER;
				relativeY : out INTEGER;
				drawIt : out STD_LOGIC );
	end component;
	component FixedWallSprite is
	    Port (	relativeX : in INTEGER;
				relativeY : in INTEGER;
				drawIt : in STD_LOGIC;
				RGB : out STD_LOGIC_VECTOR (0 to 2) );
	end component;
begin
    wallPresent <= s_wallPresent;
	conversion : FixedWallLocalCoordinates port map (X, Y, relativeX, relativeY, s_wallPresent);
	sprite : FixedWallSprite port map(relativeX, relativeY, s_wallPresent, RGB);
end Behavioral;