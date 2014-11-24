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
    RGB : out STD_LOGIC_VECTOR (0 to 11) );
end GraphicEngine;

architecture Behavioral of GraphicEngine is
    signal VGAClk : STD_LOGIC;
    signal X : INTEGER;
    signal Y : INTEGER;
    signal drawAvailable : STD_LOGIC;
    signal RGB1 : STD_LOGIC_VECTOR (0 to 2);
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
                RGB : out STD_LOGIC_VECTOR (0 to 11) );
    end component;
    -- Sprites
    component WallSprite
        Port ( X : in INTEGER;
               Y : in INTEGER;
               Clk : in STD_LOGIC;
               RGB : out STD_LOGIC_VECTOR (0 to 2) );
    end component;
begin
    Clock : Clock_Generator port map ( Clk, VGAClk);
    Sync :  VGASync port map ( VGAClk, X, Y, drawAvailable, hSync, vSync);
    Wall : WallSprite port map (X, Y, Clk, RGB1);
    Muxer : MUX port map ( drawAvailable, RGB1, RGB );
end Behavioral;
