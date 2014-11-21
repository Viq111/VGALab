-- This testBench was generated by pyVhdl2Sch --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;


-- entity declaration
ENTITY tb_MUX IS
END tb_MUX;

ARCHITECTURE behavior OF tb_MUX IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT MUX
PORT (
    RGB : OUT STD_LOGIC_VECTOR(0 to 2)
);
END COMPONENT;
-- declare inputs and initialize them
-- declare inouts and initialize them
-- declare outputs and initialize them
    signal RGB : STD_LOGIC_VECTOR(0 to 2);
constant clk_period : time := 10 ns;

BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: MUX PORT MAP (
    RGB => RGB
);
-- Stimulus process
stim_proc: process
begin
wait for 3*clk_period;
-- Insert your tests
   wait;
end process;
END;