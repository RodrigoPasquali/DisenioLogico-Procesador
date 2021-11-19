LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY program_counter IS
  PORT (   
        pc_clk : IN  std_logic;
        pc_rst : IN  std_logic;
        pc_out:  OUT std_logic_vector(6 DOWNTO 0)
        );    
END program_counter;
   
ARCHITECTURE pc_behavioral OF program_counter IS
    
    SIGNAL count: std_logic_vector(6 downto 0); 

BEGIN    

  PROCESS (pc_clk, pc_rst)
      BEGIN

          IF(pc_rst = '1') THEN       
              count  <= (OTHERS => '0');
          ELSIF (pc_clk'EVENT AND pc_clk = '1') THEN
              count  <= count + 1 ;  
          END IF;

  END PROCESS;

  pc_out <= count;
END pc_behavioral;
