library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CharacterLogic is
	Port ( 	X : in INTEGER;
			Y : in INTEGER;
			explosionPresent : in STD_LOGIC;
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
signal targetX  : INTEGER := 8;
signal targetY  : INTEGER := 8;
signal direction : INTEGER := 0;
signal vSyncCounter : INTEGER := 1;
-- Direction: 0 down idle, 1 down moving, 2 left idle, 3 left moving, 4 up idle, 5 up moving, 6 right idle, 7 right moving
begin
	-- ToDo : Manage External events	
	-- Move the character each vSync (60 Hz)
	vSyncProcess : Process(vSync)
	begin
	   If (vSync'Event and vSync = '1') then -- On each tick, we move closer to our target
				-- Check direction
				If (command(0 to 3) = "0000") then
					If (direction = 1) then
						direction <= 0;
					End If;
					If (direction = 3) then
						direction <= 2;
					End If;
					If (direction = 5) then
						direction <= 4;
					End If;
					If (direction = 7) then
						direction <= 6;
					End If;
				Else
					If (command(0 to 3) = "1000") then
						direction <= 1;
					End If;
					If (command(0 to 3) = "0100") then
						direction <= 3;
					End If;
					If (command(0 to 3) = "0010") then
						direction <= 5;
					End If;
					If (command(0 to 3) = "0001") then
						direction <= 7;
					End If;
				End If;
                -- Let's count vSync
                vSyncCounter <= vSyncCounter + 1;
                If (vSyncCounter >= 12) then
                    vSyncCounter <= 1;
                End If;
                
                If (targetX > currentX) then
                    currentX <= currentX + 1;
                End If;
                If (targetX < currentX) then
                    currentX <= currentX - 1;
                End If;
                If (targetY > currentY) then
                    currentY <= currentY + 1;
                End If;
                If (targetY < currentY) then
                    currentY <= currentY - 1;
                End If;
            End If;
	End Process;
	-- Third check if movement
	CharacterProcess : Process(Clk)
	begin
		If (Clk'Event and Clk = '1') then
			If (currentX = targetX and currentY = targetY) then -- Ok we are here, wait for an action from the user
				If (direction = 1 and X = (currentX + 8) and Y = (currentY + 17) and fixedWallPresent = '0' and breakWallPresent = '0') then -- Going down
					targetY <= targetY + 16;
				End If;
				If (direction = 3 and X = (currentX - 1) and Y = (currentY + 8) and fixedWallPresent = '0' and breakWallPresent = '0') then -- Going left
					targetX <= targetX - 16;
				End If;
				If (direction = 5 and X = (currentX + 8) and Y = (currentY - 1) and fixedWallPresent = '0' and breakWallPresent = '0') then
					targetY <= targetY - 16;
				End If;
				If (direction = 7 and X = (currentX + 17) and Y = (currentY + 8) and fixedWallPresent = '0' and breakWallPresent = '0') then
					targetX <= targetX + 16;
				End If;
		   End If;
	   End If;
	End Process;
	relativeX <= (X - currentX) mod 16 when (X >= currentX and X < (currentX + 16)) else 0;
	relativeY <= (Y - currentY) mod 16 when (X >= currentX and X < (currentX + 16)) else 0;
	-- Compute if we are on character
	characterPresent <= '1' when (X >= currentX) and (X < (currentX + 16)) and (Y >= currentY) and (Y < (currentY + 16)) else
						'0';
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