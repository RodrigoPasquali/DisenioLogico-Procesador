library IEEE;
use IEEE.std_logic_1164.ALL;

entity alu_tb is
end alu_tb;
 
architecture Beh_alu_tb of alu_tb is 
 
    component c_alu
    port(
    a       : in std_logic_vector(7 downto 0);
    b       : in std_logic_vector(7 downto 0);
    op      : in std_logic_vector(2 downto 0);
    s       : out std_logic_vector(7 downto 0));
     
    end component;
    
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic_vector(2 downto 0) := (others => '0'); 
   signal s : std_logic_vector(7 downto 0);

   begin 
   uut: c_alu port map (
          a => a,
          b => b,
          op => op,
          s => s
        );
  process 
  begin
        a <= "00000110"; --6
        b <= "00000011"; --3
        op <= "000";  wait for 20 ns; -- A
        op <= "001";  wait for 20 ns; -- A << 1 (desplazamiento izq)
        op <= "010";  wait for 20 ns; -- A + B
        op <= "011";  wait for 20 ns; -- A - B
        op <= "100";  wait for 20 ns; -- A and B
        op <= "101";  wait for 20 ns; -- A or B
        op <= "110";  wait for 20 ns; -- A xor B
        op <= "111";  wait for 20 ns; -- A >> 1 (desplazamiento der)
       
      wait; 
  end process;    
end Beh_alu_tb;
