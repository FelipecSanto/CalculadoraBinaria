library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity potencia4_2bit is
    Port (
        Ba : in STD_LOGIC_VECTOR (3 downto 0);
        Expoente : in STD_LOGIC_VECTOR (1 downto 0);
        Resultado : out STD_LOGIC_VECTOR (11 downto 0)
    );
end potencia4_2bit;

architecture potenciacao of potencia4_2bit is
	signal intermediario0 : STD_LOGIC_VECTOR (7 downto 0);
	signal intermediario1 : STD_LOGIC_VECTOR (11 downto 0);

begin

	M0: entity work.Multiplicador4bit
		Port map ( 
			A => Ba,
         B => Ba,
         P => intermediario0
	);
	
	M1: entity work.Multiplicador4_8bit
		Port map ( 
			A => Ba,
         B => intermediario0,
         P => intermediario1
	);
	
	
	process(intermediario0, intermediario1)
	begin
		if(Expoente = "00") then
			Resultado <= "000000000001";
		elsif(Expoente = "01") then
			Resultado <= "00000000" & Ba;
		elsif(Expoente = "10") then
			Resultado <= "0000" & intermediario0;
		else
			Resultado <= intermediario1;
		end if;
	
	end process;


end potenciacao;
