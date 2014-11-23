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
    -- Video Parameters
    constant HBP : INTEGER := 48;  --Horizontal Back Porch
    constant HR :  INTEGER := 640; --Horizontal Resolution
    constant HFP : INTEGER := 16;  --Horizontal Front Porch
    constant HRet: INTEGER := 96;  --Horizontal retrace
    
    constant VR :  INTEGER := 480; --Vertical Resolution
    constant VBP : INTEGER := 33;  --Vertical Back Porch -- Or 29 ???
    constant VFP : INTEGER := 10;  --Vertical Front Porch
    constant VRet: INTEGER := 2;   --Vertical Retrace
    -- FSM 1&2
    type FSM1_STATES is (VBP_wait, drawLine, VFP_wait, VRetrace);
    type FSM2_STATES is (HBP_wait, drawColumn, HFP_wait, HRetrace);
    signal stateFSM1 : FSM1_STATES := VBP_wait;
    signal stateFSM2 : FSM2_STATES := HBP_wait;
    signal counterFSM1 : INTEGER := 1; -- 1 because we will already have done 1 tick
    signal counterFSM2 : INTEGER := 1; -- 1 because we will already have done 1 tick
    signal internalX : INTEGER := 0;
    signal internalY : INTEGER := 0;
begin
    currentX <= internalX;
    currentY <= internalY;
    -- ToDo: Add state1 = drawLine & state2 = draw -> drawAvailable
    drawAvailable <= '1' when ((stateFSM1 = drawLine) and (stateFSM2 = drawColumn)) else '0';

    FSM2Clk : Process(VGAClk)
    variable lineClk : STD_LOGIC;
    begin
        If (VGAClk'Event and VGAClk = '1') then
            Case stateFSM2 is
                when HBP_wait =>
                    hSync <= '1';
                    internalX <= 0;
                    lineClk := '0';
                    counterFSM2 <= counterFSM2 + 1;
                    If (counterFSM2 >= HBP) then
                        counterFSM2 <= 1; -- 1 because we will already have done 1 tick
                        stateFSM2 <= drawColumn;
                    End If;
                when drawColumn =>
                    internalX <= internalX + 1;
                    If ( internalX + 1 >= HR) then
                        counterFSM2 <= 1;
                        stateFSM2 <= HFP_wait;
                    End If;
                when HFP_wait =>
                    counterFSM2 <= counterFSM2 + 1;
                    If ( counterFSM2 >= HFP ) then
                        counterFSM2 <= 1;
                        hSync <= '0';
                        stateFSM2 <= HRetrace;
                    End If;
                when HRetrace =>
                    counterFSM2 <= counterFSM2 + 1;
                    If ( counterFSM2 >= HRet ) then
                        counterFSM2 <= 1;
                        hSync <= '1';
                        lineClk := '1';
                        stateFSM2 <= HBP_wait;
                    End If;
            End Case;
            If ( lineClk = '1' ) then
                Case stateFSM1 is
                    when VBP_wait =>
                        internalY <= 0;
                        vSync <= '1';
                        counterFSM1 <= counterFSM1 + 1;
                        If (counterFSM1 >= VBP) then
                            counterFSM1 <= 1;
                            stateFSM1 <= drawLine;
                        End If;
                    when drawLine =>
                        internalY <= internalY + 1;
                        If ( internalY + 1 >= VR) then
                            counterFSM1 <= 1;
                            stateFSM1 <= VFP_wait;
                        End If;
                    when VFP_wait =>
                        counterFSM1 <= counterFSM1 + 1;
                        If ( counterFSM1 >= VFP ) then
                            counterFSM1 <= 1;
                            vSync <= '0';
                            stateFSM1 <= VRetrace;
                        End If;
                    when VRetrace =>
                        counterFSM1 <= counterFSM1 + 1;
                        If ( counterFSM1 >= VRet ) then
                            counterFSM1 <= 1;
                            vSync <= '1';
                            stateFSM1 <= VBP_wait;
                        End If;
                End Case;
            End If;
        End If;
    End Process;
End Behavioral;
