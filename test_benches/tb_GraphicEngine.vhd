-- This testBench was generated by pyVhdl2Sch --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;


-- entity declaration
ENTITY tb_GraphicEngine IS
END tb_GraphicEngine;

ARCHITECTURE behavior OF tb_GraphicEngine IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT GraphicEngine
PORT (
    Clk : IN STD_LOGIC;
    command : IN STD_LOGIC_VECTOR(0 to 5);
    hSync : OUT STD_LOGIC;
    vSync : OUT STD_LOGIC;
    RGB : OUT STD_LOGIC_VECTOR(0 to 11)
);
END COMPONENT;
-- declare inputs and initialize them
    signal Clk : STD_LOGIC;
    signal command : STD_LOGIC_VECTOR(0 to 5);
-- declare inouts and initialize them
-- declare outputs and initialize them
    signal hSync : STD_LOGIC;
    signal vSync : STD_LOGIC;
    signal RGB : STD_LOGIC_VECTOR(0 to 11);
constant clk_period : time := 10 ns;

BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: GraphicEngine PORT MAP (
    Clk => Clk,
    command => command,
    hSync => hSync,
    vSync => vSync,
    RGB => RGB
);
-- Clock process definitions( clock with 50% duty cycle is generated here.)
clk_process :process
begin
    Clk <= '0';
    wait for clk_period/2;  --for 5 ns signal is '0'.
    Clk <= '1';
    wait for clk_period/2;  --for 5 ns signal is '1'.
end process;
-- Stimulus process
stim_proc: process
begin
    command <= "000000";
    wait for 3*clk_period;
    -- Insert your tests
   wait;
end process;
END;