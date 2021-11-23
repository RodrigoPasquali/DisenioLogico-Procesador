LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux3_8 IS
	PORT (
		  mux_in_0 : IN  std_logic_vector(7 DOWNTO 0); 
		  mux_in_1 : IN  std_logic_vector(7 DOWNTO 0);
		  mux_in_2 : IN  std_logic_vector(7 DOWNTO 0);
		  mux_sel :  IN  std_logic_vector(1 DOWNTO 0);		
		  mux_out :  OUT std_logic_vector(7 DOWNTO 0)
          );
END mux3_8;

ARCHITECTURE mux3_8_behavioral OF mux3_8 IS

BEGIN
	mux_out <= mux_in_2 WHEN (mux_sel = "10") ELSE --el input
         	   mux_in_1 WHEN (mux_sel = "01") ELSE -- IR inmediato
        	   mux_in_0;						   --Regs
END mux3_8_behavioral;