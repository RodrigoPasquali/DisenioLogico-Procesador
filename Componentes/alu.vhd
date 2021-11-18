library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu is
  port ( a:  in std_logic_vector (7 downto 0);
         b:  in std_logic_vector (7 downto 0);
         op: in std_logic_vector (2 downto 0);
         s:  out std_logic_vector (7 downto 0)
        );    
end alu;
 
architecture Beh_arqui of alu is
  
 signal aux : std_logic_vector (7 downto 0); 

begin
     
 process (a, b, op)
 
 begin
   
    case op is
      when "000" => aux <= a;
      when "001" => aux <=(a(6 downto 0) & '0');
      when "010" => aux <= a+b;
      when "011" => aux <= a-b;
      when "100" => aux <= a and b;
      when "101" => aux <= a or b;
      when "110" => aux <= a xor b; 
      when "111" => aux <=(a(7) & a(7 downto 1));
      when others => aux <= (others => '0');                  
    end case;
  end process;
 
s <= aux;
end Beh_arqui;