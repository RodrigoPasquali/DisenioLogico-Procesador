LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY rom_prog_tb IS
END rom_prog_tb;

ARCHITECTURE rom_prog_tb_behavioral OF rom_prog_tb IS
  COMPONENT rom_prog
     PORT (
        rom_prog_addr : IN  std_logic_vector(6 DOWNTO 0);
          rom_prog_out: OUT std_logic_vector(15 DOWNTO 0)
           );     
  END COMPONENT;

SIGNAL s_rom_prog_addr : std_logic_vector(6 DOWNTO 0);
SIGNAL s_rom_prog_out :  std_logic_vector(15 DOWNTO 0);

BEGIN
  mi_rom : rom_prog
      PORT MAP (
                rom_prog_addr => s_rom_prog_addr,
                rom_prog_out =>  s_rom_prog_out
                );
                
      PROCESS
        BEGIN
         s_rom_prog_addr <= "0000000";
         WAIT FOR 10 ns;
         ASSERT s_rom_prog_out ="0000000101100000" REPORT "falla" SEVERITY FAILURE;

         s_rom_prog_addr <= "1111111";
         WAIT FOR 10 ns; 
         ASSERT s_rom_prog_out = "0000000000000000" REPORT "falla" SEVERITY FAILURE;
         
         s_rom_prog_addr <= "0000001";
         WAIT FOR 10 ns; 
         ASSERT s_rom_prog_out = "0000010000000011" REPORT "falla" SEVERITY FAILURE;
          
         WAIT; 
      END PROCESS; 

END rom_prog_tb_behavioral;
