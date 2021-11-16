LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY decoder IS
   PORT (
         decode_in : IN  std_logic_vector (7 DOWNTO 0);
         decode_reg_we : OUT  std_logic;
         decode_out_we : OUT  std_logic;
         decode_reg_a_we: OUT  std_logic;
         decode_alu_op : OUT  std_logic_vector (2 DOWNTO 0);
         decode_bus_sel : OUT  std_logic_vector (1 DOWNTO 0)
         );
END decoder;

-- Arquitectura basada en sentencia case
ARCHITECTURE decoder_behavioral OF decoder IS 
BEGIN
   decode_bus_sel <= decode_in(7 DOWNTO 6);
   decode_alu_op <= decode_in(5 DOWNTO 3);
   decode_reg_a_we <= decode_in(2);
   decode_out_we <= decode_in(1);
   decode_reg_we <= decode_in(0);            
END decoder_behavioral; 