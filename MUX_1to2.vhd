library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_1to2 is
	Port ( 
		sel : in STD_LOGIC;
      in0 : in STD_LOGIC;
      in1 : in STD_LOGIC;
      saida : out STD_LOGIC
	);
end MUX_1to2;

architecture Gate_Level of MUX_1to2 is
    signal not_sel : STD_LOGIC;
    signal and0, and1 : STD_LOGIC;
begin
    not_sel <= NOT sel;
    
    and0 <= in0 AND not_sel;
    and1 <= in1 AND sel;
    
    saida <= and0 OR and1;
end Gate_Level;
