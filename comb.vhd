library IEEE;

use IEEE.std_logic_1164.all;

entity comb is

port(

EV : in std_logic;
CW : in std_logic;
current_state : in std_logic_vector(3 downto 0);
next_state : out std_logic_vector(3 downto 0);
Yellow : out std_logic;
Red : out std_logic;
Green : out std_logic
);
end comb;

architecture asm_chart of comb is

-- State blocks for Green

constant SG1: std_logic_vector(3 downto 0) := "0000";
constant SG2: std_logic_vector(3 downto 0) := "0001";
constant SG3: std_logic_vector(3 downto 0) := "0010";
constant SG4: std_logic_vector(3 downto 0) := "0011";
constant SG5: std_logic_vector(3 downto 0) := "0100";

-- State blocks for Yellow

constant SY1: std_logic_vector(3 downto 0) := "0101";
constant SY2: std_logic_vector(3 downto 0) := "0110";

-- State blocks for Red

constant SR1: std_logic_vector(3 downto 0) := "0111";
constant SR2: std_logic_vector(3 downto 0) := "1000";
constant SR3: std_logic_vector(3 downto 0) := "1001";
constant SR4: std_logic_vector(3 downto 0) := "1010";


begin

-- Declare Output for Yellow

Yellow <= 
'1' when (current_state = SG1 and EV = '1') or 
         (current_state = SG2 and EV = '1') or
			(current_state = SG3 and EV = '1') or
			(current_state = SG4 and EV = '1') or
			(current_state = SG5 and EV = '1') or
			(current_state = SY1) or
			(current_state = SG5 and EV = '0' and CW = '1') else '0';

-- Declare Output for Green

Green <= 
'0' when (current_state = SG1 and EV = '1') or 
         (current_state = SG2 and EV = '1') or
			(current_state = SG3 and EV = '1') or
			(current_state = SG4 and EV = '1') or
			(current_state = SG5 and EV = '1') or
			(current_state = SY1) or
			(current_state = SY2) or 
         (current_state = SR1) or
			(current_state = SR2) or
			(current_state = SR3) or
			(current_state = SR4 and EV = '1') or
			(current_state = SG5 and EV = '0' and CW = '1') else '1';
			

-- Declare Output for Red

Red <=
'1' when (current_state = SY2) or 
         (current_state = SR1) or
			(current_state = SR2) or
			(current_state = SR3) or
			(current_state = SR4 and EV = '1') else '0';

    
-- State Transitions


next_state <= 
-- When current state is SG1
SG2 when current_state = SG1 and EV = '0' else
SY2 when current_state = SG1 and EV = '1' else

-- When current state is SG2
SG3 when current_state = SG2 and EV = '0' else
SY2 when current_state = SG2 and EV = '1' else

-- When current state is SG3
SG4 when current_state = SG3 and EV = '0' else
SY2 when current_state = SG3 and EV = '1' else

-- When current state is SG4
SG5 when current_state = SG4 and EV = '0' else
SY2 when current_state = SG4 and EV = '1' else 

-- When current state is SG5
SG1 when current_state = SG5 and EV = '0' and CW = '0' else
SY1 when current_state = SG5 and EV = '0' and CW = '1' else
SY2 when current_state = SG5 and EV = '1' else

-- When current state is SY1
SY2 when current_state = SY1 else

-- When current state is SY2
SR1 when current_state = SY2 else

--When current state is SR1
SR2 when current_state = SR1 else

-- When current state is SR2
SR3 when current_state = SR2 else

-- When current state is SR3
SR4 when current_state = SR3 else

-- When current state is SR4
SR4 when current_state = SR4 and EV = '1' else
SG1 when current_state = SR4 and EV = '0' else

current_state;

end asm_chart;
