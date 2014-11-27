library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- X,Y to Relative X,Y
entity BombeLocalCoordinates is
	Port ( 	Clk : in STD_LOGIC;
			X : in INTEGER;
			Y : in INTEGER;
			relativeX : out INTEGER;
			relativeY : out INTEGER;
			drawIt : out STD_LOGIC;
			Interact : in STD_LOGIC;
			Explode : out STD_LOGIC := '0';
			vSync : in STD_LOGIC );
end BombeLocalCoordinates;

architecture Behavioral of BombeLocalCoordinates is

type matrix is array(0 to 28, 0 to 38) of INTEGER range 0 to 30;
signal BombeLocation : matrix := (	
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
									(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
								);
--signal BombePresent : STD_LOGIC := '0';
signal BombeCounter : INTEGER := 0;
signal TimeCounter : INTEGER := 0;
--signal BombeX : INTEGER := 0;
--signal BombeY : INTEGER := 0;
signal s_Explode : STD_LOGIC := '0';

begin
    Explode <= s_Explode;
	relativeX <= (X+8) mod 16;
	relativeY <= (Y+8) mod 16;
	process(Clk)
	begin
		if( Clk'Event and Clk = '1' ) then
			-- Draw Bombe
			If ((X >= 8 and Y >= 8 ) and (X < (640-8) and Y < (480-8) )) then
				If BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) > 0 then
					drawIt <= '1';
				Else
					drawIt <= '0';
				End If;
			Else
				drawIt <= '0';
			End If;
			-- Pose
			If ((X >= 8 and Y >= 8 ) and (X < (640-8) and Y < (480-8) )) then
				If (BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) = 0 and Interact = '1') then
					BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) <= 1;
					--BombeX <= (((X+8)/16)-1);
					--BombeY <= (((Y+8)/16)-1);
					---BombePresent <= '1';
				End If;
			End If;
			
			--Time Bombe
			TimeCounter <= TimeCounter + 1;
			If (TimeCounter >= 10000000) then
				For i in 0 to 28 loop
					For j in 0 to 38 loop
						If (BombeLocation(i,j) >= 26) then
							s_Explode <= '0';
							BombeLocation(i,j) <= 0;
						ElsIf (BombeLocation(i,j) >= 25) then
							s_Explode <= '1';
						ElsIf (BombeLocation(i,j) > 0) then
							BombeLocation(i,j) <= BombeLocation(i,j) + 1;
						End If;
					End loop;
				End loop;
				TimeCounter <= 0;
			End If;
	
		end if;
	end process; 
	
	
--	process(vSync)
--	begin
--		If( vSync'Event and vSync = '1' ) then	
--			-- Count Bombe
--			If (BombePresent = '1') then
--				BombeCounter <= BombeCounter + 1;
--				If (BombeCounter >= 120 and s_Explode = '0') then
--					s_Explode <= '1';
--				ElsIf (BombeCounter >= 125 and s_Explode = '1') then
--					s_Explode <= '0';
--					BombeCounter <= 0;
--					BombePresent <= '0';
--					BombeLocation(BombeY, BombeX) <= '0';
--				End If;
--			End If;
--	   End If;
--	end process; 
end Behavioral;