library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Total BombeWall

entity Bombe is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			Clk : in STD_LOGIC;
			vSync : in STD_LOGIC;
			bombePresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2);
			Interact : in STD_LOGIC;
			Explode : out STD_LOGIC );
end Bombe;

architecture Behavioral of Bombe is
	signal s_bombePresent : STD_LOGIC := '0';
	signal relativeX : INTEGER;
	signal relativeY : INTEGER;
	component BombeLocalCoordinates is
		Port ( 	Clk : in STD_LOGIC;
				X : in INTEGER;
				Y : in INTEGER;
				relativeX : out INTEGER;
				relativeY : out INTEGER;
				drawIt : out STD_LOGIC;
				Interact : in STD_LOGIC;
				Explode : out STD_LOGIC;
				vSync : in STD_LOGIC	);
	end component;
	component BombeSprite is
	    Port (	relativeX : in INTEGER;
				relativeY : in INTEGER;
				drawIt : in STD_LOGIC;
				RGB : out STD_LOGIC_VECTOR (0 to 2) );
	end component;
begin
    bombePresent <= s_bombePresent;
	conversion : BombeLocalCoordinates port map (Clk, X, Y, relativeX, relativeY, s_bombePresent, Interact, Explode, vSync);
	sprite : BombeSprite port map(relativeX, relativeY, s_wallPresent, RGB);
end Behavioral;