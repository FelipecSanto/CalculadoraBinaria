library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to4 is
    Port (
        Sel : in STD_LOGIC_VECTOR (2 downto 0); -- Seleção de 3 bits
        In0 : in STD_LOGIC_VECTOR (7 downto 0); -- Entrada 0 de 8 bits
        In1 : in STD_LOGIC_VECTOR (7 downto 0); -- Entrada 1 de 8 bits
        In2 : in STD_LOGIC_VECTOR (7 downto 0); -- Entrada 2 de 8 bits
        In3 : in STD_LOGIC_VECTOR (7 downto 0); -- Entrada 3 de 8 bits
		  In4 : in STD_LOGIC_VECTOR (7 downto 0);
        Saida : out STD_LOGIC_VECTOR (7 downto 0) -- Saída de 8 bits
    );
end Mux2to4;

architecture Behavioral of Mux2to4 is
begin
    process (Sel, In0, In1, In2, In3)
    begin
        case Sel is
            when "000" =>
                Saida <= In0;
            when "010" =>
                Saida <= In1;
            when "100" =>
                Saida <= In2;
            when "110" =>
                Saida <= In3;
            when others =>
                Saida <= In4;
        end case;
    end process;
end Behavioral;
