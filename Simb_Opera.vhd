library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Simb_Opera is
    Port (
        Sel : in STD_LOGIC_VECTOR (2 downto 0);
		  HEX_potencia : in STD_LOGIC_VECTOR (6 downto 0);
        HEX22 : out STD_LOGIC_VECTOR (6 downto 0);
		  HEX33 : out STD_LOGIC_VECTOR (6 downto 0)
    );
end Simb_Opera;

architecture Behavioral of Simb_Opera is
begin
    process (Sel)
    begin
        case Sel is
            when "000" =>
					 HEX22 <= "0001111";
					 HEX33 <= "0111001";
            when "010" =>
					 HEX22 <= "0111111";
					 HEX33 <= "0111111";
            when "100" =>
					 HEX22 <= "1000110";
					 HEX33 <= "1110000";
            when "110" =>
					 HEX22 <= "1001110";
					 HEX33 <= "1110001";
            when others =>
                HEX22 <= "0001100";
					 HEX33 <= HEX_potencia;
        end case;
    end process;
end Behavioral;
