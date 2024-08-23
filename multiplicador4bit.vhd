library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplicador4bit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        P : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Multiplicador4bit;

architecture multiplicacao of Multiplicador4bit is
	signal carry_Out : STD_LOGIC_VECTOR (11 downto 0);
	signal Sum_internal : STD_LOGIC_VECTOR (11 downto 0);
	
begin

	P(0) <= B(0) and A(0);

	HA0: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(1),
         B => A(1) and B(0),
         Sum => Sum_internal(0),
         Carry => carry_Out(0) 
	);
	
	P(1) <= Sum_internal(0);
	
	
	FA0: entity work.FullAdder
		Port map ( 
			A => A(1) and B(1),
         B => A(2) and B(0),
         Cin => carry_Out(0),
         Sum => Sum_internal(1),
         Cout => carry_Out(1) 
	);
	
	
	FA1: entity work.FullAdder
		Port map ( 
			A => A(2) and B(1),
         B => A(3) and B(0),
         Cin => carry_Out(1),
         Sum => Sum_internal(2),
         Cout => carry_Out(2) 
	);
	
	
	HA1: entity work.Half_Adder
		Port map ( 
			A => carry_Out(2),
         B => A(3) and B(1),
         Sum => Sum_internal(3),
         Carry => carry_Out(3) 
	);
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	HA2: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(2),
         B => Sum_internal(1),
         Sum => Sum_internal(4),
         Carry => carry_Out(4) 
	);
	
	P(2) <= Sum_internal(4);
	
	
	FA2: entity work.FullAdder
		Port map ( 
			A => A(1) and B(2),
         B => Sum_internal(2),
         Cin => carry_Out(4),
         Sum => Sum_internal(5),
         Cout => carry_Out(5) 
	);
	
	
	FA3: entity work.FullAdder
		Port map ( 
			A => A(2) and B(2),
         B => Sum_internal(3),
         Cin => carry_Out(5),
         Sum => Sum_internal(6),
         Cout => carry_Out(6) 
	);
	
	
	FA4: entity work.FullAdder
		Port map ( 
			A => A(3) and B(2),
         B => carry_Out(3),
         Cin => carry_Out(6),
         Sum => Sum_internal(7),
         Cout => carry_Out(7) 
	);
	
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	
	
	HA3: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(3),
         B => Sum_internal(5),
         Sum => Sum_internal(8),
         Carry => carry_Out(8) 
	);
	
	P(3) <= Sum_internal(8);
	
	
	FA5: entity work.FullAdder
		Port map ( 
			A => A(1) and B(3),
         B => Sum_internal(6),
         Cin => carry_Out(8),
         Sum => Sum_internal(9),
         Cout => carry_Out(9) 
	);
	
	P(4) <= Sum_internal(9);
	
	
	FA6: entity work.FullAdder
		Port map ( 
			A => A(2) and B(3),
         B => Sum_internal(7),
         Cin => carry_Out(9),
         Sum => Sum_internal(10),
         Cout => carry_Out(10) 
	);
	
	P(5) <= Sum_internal(10);
	
	
	FA7: entity work.FullAdder
		Port map ( 
			A => A(3) and B(3),
         B => carry_Out(7),
         Cin => carry_Out(10),
         Sum => Sum_internal(11),
         Cout => carry_Out(11) 
	);
	
	P(6) <= Sum_internal(11);
	P(7) <= carry_Out(11);
	

    

end multiplicacao;
