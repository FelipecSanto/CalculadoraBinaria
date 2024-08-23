Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

-- Declaração da entidade
entity HEXto7SEG is
    Port (
        Num4bits: in std_logic_vector (3 downto 0);
        HEX: out std_logic_vector (6 downto 0)
    );
end HEXto7SEG;

-- Arquitetura do componente
architecture Conversor of HEXto7SEG is
begin
    -- Processo que realiza S(0) adição
    process(Num4bits(0), Num4bits(1), Num4bits(2), Num4bits(3))
    begin
        HEX(0) <= (not (Num4bits(3) or Num4bits(1)) and (Num4bits(2) xor Num4bits(0))) or (Num4bits(3) and Num4bits(0) and (Num4bits(2) xor Num4bits(1)));
        HEX(1) <= (not (Num4bits(3) or Num4bits(1)) and Num4bits(2) and Num4bits(0)) or (not Num4bits(0) and Num4bits(2) and (Num4bits(1) or Num4bits(3))) or (Num4bits(3) and Num4bits(1) and Num4bits(0));
        HEX(2) <= (not (Num4bits(3) or Num4bits(2)) and Num4bits(1) and not Num4bits(0)) or (Num4bits(3) and Num4bits(2) and (Num4bits(1) or not Num4bits(0)));
        HEX(3) <= (not (Num4bits(3) or Num4bits(1)) and (Num4bits(2) xor Num4bits(0))) or (Num4bits(2) and Num4bits(1) and Num4bits(0)) or (Num4bits(3) and not Num4bits(2) and Num4bits(1) and not Num4bits(0));
        HEX(4) <= (not Num4bits(1) and ((not Num4bits(3) and Num4bits(2)) or (not Num4bits(2) and Num4bits(0)))) or (not Num4bits(3) and Num4bits(0));
        HEX(5) <= (Num4bits(3) and Num4bits(2) and not Num4bits(1) and Num4bits(0)) or (not (Num4bits(3) or Num4bits(2)) and (Num4bits(0) or Num4bits(1))) or (not Num4bits(3) and Num4bits(1) and Num4bits(0));
        HEX(6) <= (not (Num4bits(3) or Num4bits(2)) and not Num4bits(1)) or (not Num4bits(3) and Num4bits(2) and Num4bits(1) and Num4bits(0)) or (Num4bits(3) and Num4bits(2) and not (Num4bits(1) or Num4bits(0)));
    end process;
end Conversor;