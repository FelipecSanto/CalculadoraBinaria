library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddSub4bit is
    Port (
        A : 			in STD_LOGIC_VECTOR (3 downto 0);
        B : 			in STD_LOGIC_VECTOR (3 downto 0);
        Sel : 			in STD_LOGIC;  									-- 0 para adição, 1 para subtração
        Result : 		out STD_LOGIC_VECTOR (3 downto 0);
        Carry_Out : 	out STD_LOGIC
    );
end AddSub4bit;

architecture GateLevel of AddSub4bit is
    signal B_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Carry : STD_LOGIC_VECTOR (3 downto 0);
	 
	 signal A_temp : STD_LOGIC_VECTOR (3 downto 0) := A;
	 signal B_temp : STD_LOGIC_VECTOR (3 downto 0) := B;
begin
    -- Seleção de operação: B ou ~B+1 (complemento de 2 para subtração)
    B_in(0) <= B_temp(0) XOR Sel;
    B_in(1) <= B_temp(1) XOR Sel;
    B_in(2) <= B_temp(2) XOR Sel;
    B_in(3) <= B_temp(3) XOR Sel;
	 
	 process(Sel, A, B)
      variable d: unsigned(3 downto 0);
      variable e: unsigned(3 downto 0);
	 begin
		if (Sel = '1') then
            d := to_unsigned(to_integer(unsigned(A)), 4);  -- Convertendo A para unsigned
            e := to_unsigned(to_integer(unsigned(B)), 4);  -- Convertendo B para unsigned
            
            if(e > d) then
					A_temp <= B;
					B_temp <= A;
				else
					A_temp <= A;
					B_temp <= B;
				end if;
		else
			A_temp <= A;
			B_temp <= B;
		end if;
	 end process;
	 

    -- Conectando os somadores completos
    FA0: entity work.FullAdder port map(A => A_temp(0), B => B_in(0), Cin => Sel, Sum => Result(0), Cout => Carry(0));
    FA1: entity work.FullAdder port map(A => A_temp(1), B => B_in(1), Cin => Carry(0), Sum => Result(1), Cout => Carry(1));
    FA2: entity work.FullAdder port map(A => A_temp(2), B => B_in(2), Cin => Carry(1), Sum => Result(2), Cout => Carry(2));
    FA3: entity work.FullAdder port map(A => A_temp(3), B => B_in(3), Cin => Carry(2), Sum => Result(3), Cout => Carry(3));
	 
	 Carry_Out <= Carry(3) XOR Sel;

end GateLevel;
