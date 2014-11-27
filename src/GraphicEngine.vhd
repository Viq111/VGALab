library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GraphicEngine is
    Port (	Clk : in STD_LOGIC;
			command : in STD_LOGIC_VECTOR (0 to 5);
			hSync : out STD_LOGIC;
			vSync : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR (0 to 11) );
end GraphicEngine;

architecture Behavioral of GraphicEngine is
    signal VGAClk : STD_LOGIC;
    signal X : INTEGER := 0;
    signal Y : INTEGER := 0;
    signal drawAvailable : STD_LOGIC := '0';
	signal external : INTEGER := 0;
	signal s_vSync : STD_LOGIC;
    -- All MUX
    signal fixedWallPresent : STD_LOGIC := '0';
	signal breakWallPresent : STD_LOGIC := '0';
	signal characterPresent : STD_LOGIC := '0';
    signal RGBWall : STD_LOGIC_VECTOR (0 to 2);
	signal RGBChar : STD_LOGIC_VECTOR (0 to 2);
    -- Clock Divider
    component Clock_Generator
        port( Clk : in std_logic;
              VGAClk : out std_logic
            );
    end component;
    -- Sync
    component VGASync
        Port ( VGAClk : in STD_LOGIC;
               currentX : out INTEGER;
               currentY : out INTEGER;
               drawAvailable : out STD_LOGIC;
               hSync : out STD_LOGIC;
               vSync : out STD_LOGIC);
    end component;
    -- Muxer
    component MUX
        Port (  drawAvailable : in STD_LOGIC;
                -- Add each Sprite here
                RGB1 : in STD_LOGIC_VECTOR (0 to 2);
                RGB2 : in STD_LOGIC_VECTOR (0 to 2);
                RGB : out STD_LOGIC_VECTOR (0 to 11) );
    end component;
    -- Sprites
    component FixedWall
	Port ( 	X : in INTEGER;
            Y : in INTEGER;
            Clk : in STD_LOGIC;
            wallPresent : out STD_LOGIC;
            RGB : out STD_LOGIC_VECTOR ( 0 to 2) );
    end component;
	-- Character
	component Character
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
	end component;
begin
    vSync <= s_vSync;
    Clock : Clock_Generator port map ( Clk, VGAClk);
    Sync :  VGASync port map ( VGAClk, X, Y, drawAvailable, hSync, s_vSync);
    Wall : FixedWall port map (X, Y, Clk, fixedWallPresent, RGBWall);
	char : Character port map (X, Y, external, command, Clk, s_vSync, fixedWallPresent, breakWallPresent, characterPresent, RGBChar);
    Muxer : MUX port map ( drawAvailable, RGBWall, RGBChar, RGB );
end Behavioral;
