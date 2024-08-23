library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dividy4bits is
    Port (
        a : in STD_LOGIC_VECTOR(3 downto 0);
        b : in STD_LOGIC_VECTOR(3 downto 0);
        q : out STD_LOGIC_VECTOR(3 downto 0);
        r : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Dividy4bits;

architecture Behavioral of Dividy4bits is

    component Dividy4bit is
        Port (
            a : in STD_LOGIC_VECTOR(3 downto 0);
            b : in STD_LOGIC_VECTOR(3 downto 0);
            q : out STD_LOGIC_VECTOR(3 downto 0);
            r : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal a_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal b_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal q_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal r_internal : STD_LOGIC_VECTOR(3 downto 0);

begin

    process(a, b)
        variable a_unsigned : UNSIGNED(3 downto 0);
        variable b_unsigned : UNSIGNED(3 downto 0);
    begin
        a_unsigned := UNSIGNED(a);
        b_unsigned := UNSIGNED(b);

        -- Troca os valores se b for maior que a
        if b_unsigned > a_unsigned then
            a_internal <= b;
            b_internal <= a;
        else
            a_internal <= a;
            b_internal <= b;
        end if;
    end process;

    U1: Dividy4bit
        port map (
            a => a_internal,
            b => b_internal,
            q => q_internal,
            r => r_internal
        );

    q <= q_internal;
    r <= r_internal;

end Behavioral;
