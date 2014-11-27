library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Total Character

entity Character is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			external : in INTEGER;
			command : in STD_LOGIC_VECTOR (0 to 5);
			Clk : in STD_LOGIC;
			vSync : in STD_LOGIC;
			fixedWallPresent : in STD_LOGIC;
			breakWallPresent : in STD_LOGIC;
			characterPresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2) );
end Character;

architecture Behavioral of Character is
	signal s_characterPresent : STD_LOGIC := '0';
	signal relativeX : INTEGER;
	signal relativeY : INTEGER;
	signal animationSeq : INTEGER;
	component CharacterLogic is
		Port ( 	X : in INTEGER;
				Y : in INTEGER;
				external : in INTEGER;
				command : in STD_LOGIC_VECTOR ( 0 to 5); -- 0 to 3 is down, left, up, right
				Clk : in STD_LOGIC;
				vSync : in STD_LOGIC;
				fixedWallPresent : in STD_LOGIC;
				breakWallPresent : in STD_LOGIC;
				relativeX : out INTEGER;
				relativeY : out INTEGER;
				characterPresent : out STD_LOGIC;
				animationSeq : out INTEGER );
	end component;
	component CharacterAnimatedSprite is
    Port ( relativeX : in INTEGER;
           relativeY : in INTEGER;
		   drawIt : in STD_LOGIC;
		   animationSeq : in INTEGER;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
	end component;
begin
    characterPresent <= s_characterPresent;
	logic : CharacterLogic port map (X, Y, external, command, Clk, vSync, fixedWallPresent, breakWallPresent, relativeX, relativeY, s_characterPresent, animationSeq);
	sprite : CharacterAnimatedSprite port map (relativeX, relativeY, s_characterPresent, animationSeq, RGB);
end Behavioral;