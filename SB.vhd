library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SB is
	Port ( 
		A : in STD_LOGIC;
      B : in STD_LOGIC;
      Bin : in STD_LOGIC;
      Ctrl : in STD_LOGIC;
      Op : out STD_LOGIC;
      Bout : out STD_LOGIC
	);
end SB;

architecture Shift_Subtract of SB is
   signal diff : STD_LOGIC;
	signal Mux_Out : STD_LOGIC;
	 
	Component FullSub is
		Port ( 
			A : in STD_LOGIC;     -- Minuendo
			B : in STD_LOGIC;     -- Subtraendo
			Bin : in STD_LOGIC;   -- Borrow in
			Diff : out STD_LOGIC; -- Diferença
			Bout : out STD_LOGIC  -- Borrow out
   );
	end Component;
	
	
	Component MUX_1to2 is
		Port ( 
			sel : in STD_LOGIC;
			in0 : in STD_LOGIC;
			in1 : in STD_LOGIC;
			saida : out STD_LOGIC
	);
	end Component;
	 
begin
	
	U0: FullSub 
		port map (
			A => A,
			B => B,
			Bin => Bin,
			Diff => diff,
			Bout => Bout
	);
	
	U1: MUX_1to2 
		port map (
			sel => Ctrl,
         in0 => diff,
         in1 => A,
         saida => Mux_Out 
	);


	Op <= Mux_Out;

end Shift_Subtract;
