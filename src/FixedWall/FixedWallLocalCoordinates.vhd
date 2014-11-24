library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- X,Y to Relative X,Y
entity FixedWallLocalCoordinates is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			relativeX : out INTEGER;
			relativeY : out INTEGER;
			drawIt : out STD_LOGIC );
end FixedWallLocalCoordinates;

architecture Behavioral of FixedWallLocalCoordinates is
begin
	drawIt <= '1' when (((((X+8)/16) mod 2) = 0) and ((((Y+8)/16) mod 2) = 0)) else '0';
	relativeX <= (X+8) mod 16;
	relativeY <= (Y+8) mod 16;
end Behavioral;