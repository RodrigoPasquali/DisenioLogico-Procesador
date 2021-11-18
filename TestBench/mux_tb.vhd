library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_tb is
end Mux_tb;

architecture Beh_Mux_tb of Mux_tb is

component Mux
        port (a: in std_logic_vector(7 downto 0);
              b: in std_logic_vector(7 downto 0);
              c: in std_logic_vector(7 downto 0);
              sel: in std_logic_vector(1 downto 0);
              o: out std_logic_vector(7 downto 0);
          );
end component;

    signal a:  std_logic_vector(7 downto 0);
    signal b:  std_logic_vector(7 downto 0);
    signal c:  std_logic_vector(7 downto 0);
    signal sel:  std_logic_vector(1 downto 0);
    signal o: std_logic_vector(7 downto 0);
                  
begin
    UUT: Mux
    port map (a=> a, b=>b, c=>c, sel=> sel, o=>o);
    
    Test: process
    begin
        a <= "00000011";
        b <= "00000001";
        c <= "00000101";
        sel <= "10";
        wait for 10 ns;
        assert (o = c);
        

        sel <= "01";
        wait for 10 ns;
        assert (o = b);
       
        sel <= "00";
        wait for 10 ns;
        assert (o = a);
        
        wait;      
    end process;
end Beh_Mux_tb;