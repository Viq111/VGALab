library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGASync is
    Port ( VGAClk : in STD_LOGIC;
           currentX : out INTEGER;
           currentY : out INTEGER;
           drawAvailable : out STD_LOGIC;
           hSync : out STD_LOGIC;
           vSync : out STD_LOGIC);
end VGASync;

architecture Behavioral of VGASync is

begin
    
end Behavioral;
