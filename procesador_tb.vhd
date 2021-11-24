LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY procesador_tb IS
END procesador_tb;


ARCHITECTURE arch_procesador_tb OF procesador_tb IS 
   -- declaración de componente de unidad bajo testeo
   COMPONENT procesador
   	PORT(
           clk :      IN   std_logic;
           rst :    IN   std_logic;
           proc_in :  IN   std_logic_vector(7 DOWNTO 0);
           proc_out : OUT  std_logic_vector(7 DOWNTO 0)
         );
   END COMPONENT;             
   
   -- Señal de estímulo
   SIGNAL s_clk :      std_logic;
   SIGNAL s_rst :      std_logic;
   SIGNAL s_proc_in :  std_logic_vector(7 DOWNTO 0);
   SIGNAL s_proc_out : std_logic_vector(7 DOWNTO 0);
   
   
BEGIN
   -- Unit Under Test port map
   UUT: procesador PORT MAP (
               			      clk =>      s_clk,
                              rst =>      s_rst,  
		 				      proc_in =>  s_proc_in, 
		 				      proc_out => s_proc_out
                            );
                            
   PROCESS 
   	BEGIN
         s_clk <= '0';
         s_rst <= '1';
         WAIT FOR 1 ns;

--0: in r3 
         s_proc_in <= "10101010";  
         s_clk <= '1';
         s_rst <= '0';
         WAIT FOR 1 ns;
         
--2
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--3
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--4
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--5
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--6
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--7
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--8
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--9
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--10
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--11
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--12
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--13
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--14
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';               
      WAIT;
   END PROCESS;          
END arch_procesador_tb; 