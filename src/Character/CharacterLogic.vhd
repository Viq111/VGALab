library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CharacterLogic is
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
end CharacterLogic;

architecture Behavioral of CharacterLogic is
signal currentX : INTEGER := 8;
signal currentY : INTEGER := 8;
signal direction : INTEGER := 0;
signal vSyncCounter : INTEGER := 1;
signal letsMove : STD_LOGIC := '0';
-- Direction: 0 down idle, 1 down moving, 2 left idle, 3 left moving, 4 up idle, 5 up moving, 6 right idle, 7 right moving
begin
	-- ToDo : Manage External events
	-- First change direction
	direction <= 	0 when (direction = 1) and (command(0 to 3) = "0000") else -- When no command is pressed idle
					2 when (direction = 3) and (command(0 to 3) = "0000") else -- When no command is pressed idle
					4 when (direction = 5) and (command(0 to 3) = "0000") else -- When no command is pressed idle
					6 when (direction = 7) and (command(0 to 3) = "0000") else -- When no command is pressed idle
					1 when (command(0 to 3) = "1000") else	-- Only change when 1 button is pressed
					3 when (command(0 to 3) = "0100") else	-- Only change when 1 button is pressed
					5 when (command(0 to 3) = "0010") else	-- Only change when 1 button is pressed
					7 when (command(0 to 3) = "0001") else  -- Only change when 1 button is pressed
					direction;		
	-- Second move the character each vSync (60 Hz)
	MoveCharacter : Process(vSync)
	begin
		If (vSync'Event and vSync = '1') then
			letsMove <= '1';
		End If;
		If (letsMove = '1' and direction = 1 and X = (currentX + 17) and Y = (currentY + 8) and fixedWallPresent = '0' and breakWallPresent = '0') then
			letsMove <= '0';
			currentX <= currentX + 1;
		End If;
		If (letsMove = '1' and direction = 3 and X = (currentX + 8) and Y = (currentY - 1) and fixedWallPresent = '0' and breakWallPresent = '0') then
			letsMove <= '0';
			currentY <= currentY - 1;
		End If;
		If (letsMove = '1' and direction = 5 and X = (currentX - 1) and Y = (currentY + 8) and fixedWallPresent = '0' and breakWallPresent = '0') then
			letsMove <= '0';
			currentX <= currentX - 1;
		End If;
		If (letsMove = '1' and direction = 7 and X = (currentX + 8) and Y = (currentY + 17) and fixedWallPresent = '0' and breakWallPresent = '0') then
			letsMove <= '0';
			currentY <= currentY + 1;
		End If;
	End Process;
	relativeX <= (X - currentX) mod 16 when (X >= currentX and X < (currentX + 16)) else 0;
	relativeY <= (Y - currentY) mod 16 when (X >= currentX and X < (currentX + 16)) else 0;
	-- Compute if we are on character
	characterPresent <= '1' when (X >= currentX) and (X < (currentX + 16)) and (Y >= currentY) and (Y < (currentY + 16)) else
						'0';
	-- Last compute animationSeq
	UpdateCharacterSprite : Process(vSync)
	begin
		If (vSync'Event and vSync = '1') then
			vSyncCounter <= vSyncCounter + 1;
		End If;
		If (vSyncCounter >= 12) then
			vSyncCounter <= 1;
		End If;
	End Process;
	animationSeq <= 1  when direction = 0 else
					11 when direction = 2 else
					21 when direction = 4 else
					31 when direction = 6 else
					2  when direction = 1 and (vSyncCounter <= 6) else
					3  when direction = 1 and (vSyncCounter > 6)  else
					12 when direction = 3 and (vSyncCounter <= 6) else
					13 when direction = 3 and (vSyncCounter > 6)  else
					22 when direction = 5 and (vSyncCounter <= 6) else
					23 when direction = 5 and (vSyncCounter > 6)  else
					32 when direction = 7 and (vSyncCounter <= 6) else
					33 when direction = 7 and (vSyncCounter > 6) else
					1; -- This should not happen 	
end Behavioral;