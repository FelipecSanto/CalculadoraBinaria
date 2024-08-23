-- Half Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
	Port ( 
		A : in STD_LOGIC;
      B : in STD_LOGIC;
      Sum : out STD_LOGIC;
      Carry : out STD_LOGIC
	);
end Half_Adder;

architecture Gate_Level of Half_Adder is
begin
    Sum <= A XOR B;
    Carry <= A AND B;
end Gate_Level;
