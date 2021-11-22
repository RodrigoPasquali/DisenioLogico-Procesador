LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY rom_tb IS
END rom_tb;

ARCHITECTURE rom_tb_behavioral OF rom_tb IS
  COMPONENT rom
     PORT (
     		   addr : IN  std_logic_vector(6 DOWNTO 0);
      		rom_out: OUT std_logic_vector(15 DOWNTO 0));     
  END COMPONENT;


SIGNAL addr : std_logic_vector(6 DOWNTO 0);
SIGNAL rom_out :  std_logic_vector(15 DOWNTO 0);



BEGIN
  mi_rom : rom
      PORT MAP (
      			     addr => addr,
                 rom_out => rom_out
               );
                
      PROCESS
        BEGIN
         addr <= "0000000";
         WAIT FOR 10 ns;
         ASSERT rom_out ="0000000101100000" REPORT "falla" SEVERITY FAILURE;
         
         addr <= "1111111";
         WAIT FOR 10 ns; 
         ASSERT rom_out = "0000000000000000" REPORT "falla" SEVERITY FAILURE;
          
         WAIT; 
      END PROCESS; 

END rom_tb_behavioral;
