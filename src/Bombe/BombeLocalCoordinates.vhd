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

type matrix is array(0 to 28, 0 to 38) of STD_LOGIC;
signal BombeLocation : matrix := (	
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000",
									"000000000000000000000000000000000000000"
								);
signal BombePresent : STD_LOGIC := '0';
signal BombeCounter : INTEGER := 0;

begin
	relativeX <= (X+8) mod 16;
	relativeY <= (Y+8) mod 16;
	process(Clk)
	begin
		if( Clk'Event and Clk = '1' ) then
			-- Draw Bombe
			If ((X >= 8 and Y >= 8 ) and (X < (640-8) and Y < (480-8) )) then
				If BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) = '1' then
					drawIt <= '1';
				Else
					drawIt <= '0';
				End If;
			Else
				drawIt <= '0';
			End If;
			
			-- Destroy
			If ((X >= 8 and Y >= 8 ) and (X < (640-8) and Y < (480-8) )) then
				If (BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) = '0' and Interact = '1' and BombePresent = '0') then
					BombeLocation((((Y+8)/16)-1), (((X+8)/16)-1)) <= '1';
					BombePresent <= '1';
				End If;
			End If;
		end if;
	end process; 
	
	
	process(vSync)
	begin
		if( vSync'Event and vSync = '1' ) then	
			-- Count Bombe
			If (BombePresent = '1') then
				BombeCounter <= BombeCounter + 1;
				If (BombeCounter = 120) then
					
					
					BombeCounter <= 0;
				End If;
			End If;
		end if;
	end process; 
end Behavioral;