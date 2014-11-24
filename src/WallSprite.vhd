library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WallSprite is
    Port ( X : in INTEGER;
           Y : in INTEGER;
		   Clk : in STD_LOGIC;
		   RGB : out STD_LOGIC_VECTOR (0 to 2) );
end WallSprite;

architecture Behavioral of WallSprite is
begin
	RGB <= "111" when ((((((X+8)/16) mod 2) = 0) and ((((Y+8)/16) mod 2) = 0)) or (X < 8 or X >= 632 or Y < 8 or Y >= 472)) else "000";
	
end Behavioral;
