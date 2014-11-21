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
    constant VBP : INTEGER := 33 * (HBP + HR + HFP + HRet);  --Vertical Back Porch
    constant VFP : INTEGER := 10 * (HBP + HR + HFP + HRet);  --Vertical Front Porch
    constant VRet: INTEGER := 2 * (HBP + HR + HFP + HRet);   --Vertical Retrace
    -- FSM
    type STATE_TYPE is (init, HBP_wait, drawLine, HFP_wait, HRetrace_wait, VFP_wait, VRetrace_wait, VBP_wait);
    signal state : STATE_TYPE := init;
    signal counter : INTEGER;
begin
    FSMAffichage : Process(VGAClk)
    begin
        If (VGAClk'Event and VGAClk = '1') then
            Case state is
                when init =>
                    currentX <= 0;
                    currentY <= 0;
                    drawAvaible <= '0';
                    hSync <= '0';
                    vSync <= '0';
                    counter <= 0;
                    state <= HPB_wait;
                when HPB_wait =>
                    counter <= counter + 1;
                    If (counter >= HBP) then
                        counter <= 0;
                        state <= drawLine;
                    End If;
                when drawLine =>
                    currentX <= currentX + 1;
                    If (currentX >= HR) then
                        currentX <= 0;
                        state <= HFP_wait;
                    End If;
                when HFP_wait =>
                    counter <= counter + 1;
                    If (counter >= HFP) then
                        counter <= 0;
                        state <= HRetrace_wait;
                    End If;
                when Hretrace_wait =>
                    counter <= counter +1;
                    If (counter >= HRet) then
                        counter <= 0;
                        currentY <= currentY + 1;
                        currentX <= 0;
                        -- If we are at the end of the line, go to VFP, otherwise go to next line
                        If (currentY >= VR) then
                            counter <= 0;
                            state <= VFP_wait;
                        Else
                            counter <= 0;
                            state <= HPB_wait;
                        End If;
                    End If;
                when VFP_wait =>
                    counter <= counter + 1;
                    If (counter >= VFP) then
                        counter <= 0;
                        state <= VRetrace_wait;
                    End If;
                when VRetrace_wait =>
                    counter <= counter + 1;
                    If (counter >= VRet) then
                        counter <= 0;
                        currentX <= 0;
                        currentY <= 0;
                        state <= VBP_wait;
                    End If;
                when VBP_wait =>
                    counter <= counter + 1;
                    If (counter >= VBP) then
                        counter <= 0;
                        state <= HBP_wait;
                    End If;
            End Case;
        End If;
    End Process;
end Behavioral;
