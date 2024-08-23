library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplicador4_8bit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        P : out STD_LOGIC_VECTOR (11 downto 0)
    );
end Multiplicador4_8bit;

architecture multiplicacao of Multiplicador4_8bit is
	signal carry_Out : STD_LOGIC_VECTOR (27 downto 0);
	signal Sum_internal : STD_LOGIC_VECTOR (27 downto 0);
	
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
	
	
	FA6: entity work.FullAdder
		Port map ( 
			A => A(2) and B(3),
         B => Sum_internal(7),
         Cin => carry_Out(9),
         Sum => Sum_internal(10),
         Cout => carry_Out(10) 
	);
	
	
	FA7: entity work.FullAdder
		Port map ( 
			A => A(3) and B(3),
         B => carry_Out(7),
         Cin => carry_Out(10),
         Sum => Sum_internal(11),
         Cout => carry_Out(11) 
	);
	
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	
	
	HA4: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(4),
         B => Sum_internal(9),
         Sum => Sum_internal(12),
         Carry => carry_Out(12) 
	);
	
	P(4) <= Sum_internal(12);
	
	
	FA8: entity work.FullAdder
		Port map ( 
			A => A(1) and B(4),
         B => Sum_internal(10),
         Cin => carry_Out(12),
         Sum => Sum_internal(13),
         Cout => carry_Out(13) 
	);
	
	
	FA9: entity work.FullAdder
		Port map ( 
			A => A(2) and B(4),
         B => Sum_internal(11),
         Cin => carry_Out(13),
         Sum => Sum_internal(14),
         Cout => carry_Out(14) 
	);
	
	
	FA10: entity work.FullAdder
		Port map ( 
			A => A(3) and B(4),
         B => carry_Out(11),
         Cin => carry_Out(14),
         Sum => Sum_internal(15),
         Cout => carry_Out(15) 
	);
	
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	
	
	HA5: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(5),
         B => Sum_internal(13),
         Sum => Sum_internal(16),
         Carry => carry_Out(16) 
	);
	
	
	P(5) <= Sum_internal(16);
		
	
	FA11: entity work.FullAdder
		Port map ( 
			A => A(1) and B(5),
         B => Sum_internal(14),
         Cin => carry_Out(16),
         Sum => Sum_internal(17),
         Cout => carry_Out(17) 
	);
	
	
	FA12: entity work.FullAdder
		Port map ( 
			A => A(2) and B(5),
         B => Sum_internal(15),
         Cin => carry_Out(17),
         Sum => Sum_internal(18),
         Cout => carry_Out(18) 
	);
	
	
	FA13: entity work.FullAdder
		Port map ( 
			A => A(3) and B(5),
         B => carry_Out(15),
         Cin => carry_Out(18),
         Sum => Sum_internal(19),
         Cout => carry_Out(19) 
	);
	
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	
	
	HA6: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(6),
         B => Sum_internal(17),
         Sum => Sum_internal(20),
         Carry => carry_Out(20) 
	);
	
	
	P(6) <= Sum_internal(20);
		
	
	FA14: entity work.FullAdder
		Port map ( 
			A => A(1) and B(6),
         B => Sum_internal(18),
         Cin => carry_Out(20),
         Sum => Sum_internal(21),
         Cout => carry_Out(21) 
	);
	
	
	FA15: entity work.FullAdder
		Port map ( 
			A => A(2) and B(6),
         B => Sum_internal(19),
         Cin => carry_Out(21),
         Sum => Sum_internal(22),
         Cout => carry_Out(22) 
	);
	
	
	FA16: entity work.FullAdder
		Port map ( 
			A => A(3) and B(6),
         B => carry_Out(19),
         Cin => carry_Out(22),
         Sum => Sum_internal(23),
         Cout => carry_Out(23) 
	);
	
	
	
	
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	
	
	
	HA7: entity work.Half_Adder
		Port map ( 
			A => A(0) and B(7),
         B => Sum_internal(21),
         Sum => Sum_internal(24),
         Carry => carry_Out(24) 
	);
	
	
	P(7) <= Sum_internal(24);
		
	
	FA17: entity work.FullAdder
		Port map ( 
			A => A(1) and B(7),
         B => Sum_internal(22),
         Cin => carry_Out(24),
         Sum => Sum_internal(25),
         Cout => carry_Out(25) 
	);
	
	
	P(8) <= Sum_internal(25);
	
	
	FA18: entity work.FullAdder
		Port map ( 
			A => A(2) and B(7),
         B => Sum_internal(23),
         Cin => carry_Out(25),
         Sum => Sum_internal(26),
         Cout => carry_Out(26) 
	);
	
	P(9) <= Sum_internal(26);
	
	
	FA19: entity work.FullAdder
		Port map ( 
			A => A(3) and B(7),
         B => carry_Out(23),
         Cin => carry_Out(26),
         Sum => Sum_internal(27),
         Cout => carry_Out(27) 
	);
	
	
	P(10) <= Sum_internal(27);
	

   P(11) <= carry_Out(27) ;

end multiplicacao;
