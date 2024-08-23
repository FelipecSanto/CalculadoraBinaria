library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullSub is
    Port ( 
        A : in STD_LOGIC;     -- Minuendo
        B : in STD_LOGIC;     -- Subtraendo
        Bin : in STD_LOGIC;   -- Borrow in
        Diff : out STD_LOGIC; -- Diferença
        Bout : out STD_LOGIC  -- Borrow out
    );
end FullSub;

architecture Behavioral of FullSub is
begin
	Diff <= (A xor B) xor Bin;        
   Bout <=  (not A and B) or (((not A) or B) and Bin);
end Behavioral;
