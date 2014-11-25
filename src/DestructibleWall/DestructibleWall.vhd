library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Total DestructibleWall

entity DestructibleWall is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			Clk : in STD_LOGIC;
			wallPresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2) );
end DestructibleWall;

architecture Behavioral of DestructibleWall is
	signal s_wallPresent : STD_LOGIC := '0';
	signal relativeX : INTEGER;
	signal relativeY : INTEGER;
	component DestructibleWallLocalCoordinates is
		Port ( 	Clk : in STD_LOGIC;
				X : in INTEGER;
				Y : in INTEGER;
				relativeX : out INTEGER;
				relativeY : out INTEGER;
				drawIt : out STD_LOGIC );
	end component;
	component DestructibleWallSprite is
	    Port (	relativeX : in INTEGER;
				relativeY : in INTEGER;
				drawIt : in STD_LOGIC;
				RGB : out STD_LOGIC_VECTOR (0 to 2) );
	end component;
begin
    wallPresent <= s_wallPresent;
	conversion : DestructibleWallLocalCoordinates port map (Clk, X, Y, relativeX, relativeY, s_wallPresent);
	sprite : DestructibleWallSprite port map(relativeX, relativeY, s_wallPresent, RGB);
end Behavioral;