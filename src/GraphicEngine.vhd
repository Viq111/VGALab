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
    Port ( Clk : in STD_LOGIC;
    hSync : out STD_LOGIC;
    vSync : out STD_LOGIC;
    RGB : out STD_LOGIC_VECTOR (0 to 11);
    Interact : in STD_LOGIC := '0' );
end GraphicEngine;

architecture Behavioral of GraphicEngine is
    signal VGAClk : STD_LOGIC;
    signal X : INTEGER;
    signal Y : INTEGER;
    signal drawAvailable : STD_LOGIC;
    signal s_vSync : STD_LOGIC;
    -- All MUX
    signal wallPresent : STD_LOGIC;
    signal RGBWAll : STD_LOGIC_VECTOR (0 to 2);
	
	signal BreakwallPresent : STD_LOGIC;
	signal RGBBreakWall : STD_LOGIC_VECTOR (0 to 2);
	
	signal BombePresent : STD_LOGIC;
	signal RGBBombe : STD_LOGIC_VECTOR (0 to 2);
	signal ExplodeWall : STD_LOGIC;
	--signal Interact : STD_LOGIC;
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
                RGB3 : in STD_LOGIC_VECTOR (0 to 2);
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
	component DestructibleWall
	Port (	X : in INTEGER;
			Y : in INTEGER;
			Clk : in STD_LOGIC;
			wallPresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2 );
			Interact : in STD_LOGIC );
	end component;
	component Bombe
	Port (	X : in INTEGER;
			Y : in INTEGER;
			Clk : in STD_LOGIC;
			vSync : in STD_LOGIC;
			bombePresent : out STD_LOGIC;
			RGB : out STD_LOGIC_VECTOR ( 0 to 2 );
			Interact : in STD_LOGIC;
			Explode : out STD_LOGIC );
	end component;
begin
    vSync <= s_vSync;
    Clock : Clock_Generator port map ( Clk, VGAClk);
    Sync :  VGASync port map ( VGAClk, X, Y, drawAvailable, hSync, s_vSync);
    Wall : FixedWall port map (X, Y, Clk, wallPresent, RGBWall);
	BreakWall : DestructibleWall port map (X, Y, Clk, BreakwallPresent, RGBBreakWall, ExplodeWall);
	ExplodeBombe : Bombe port map (X, Y, Clk, s_vSync, BombePresent, RGBBombe, Interact, ExplodeWall);
    Muxer : MUX port map ( drawAvailable, RGBWall, RGBBreakWall, RGBBombe, RGB );
end Behavioral;
