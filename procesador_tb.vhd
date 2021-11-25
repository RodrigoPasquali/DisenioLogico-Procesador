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
           rst :      IN   std_logic;
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
--0: reset
         s_clk <= '0';
         s_rst <= '1';
         s_proc_in <= "00000001";  
         WAIT FOR 1 ns;

--1: in(rd)     r3      r3 = 1 
         s_clk <= '1';
         s_rst <= '0';
         WAIT FOR 1 ns;
         
--2: lda(rs)    r3      r3 = 1 ra = 1
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--3: add(rd-rs) r4,r3   r4 = 2 ra = 1
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--4: sub(rd-rs) r5, r4  r5 = 1 ra = 1
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--5: or(rd-rs)  r6, r4  r6 = 3 ra = 1
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--6: and(rd-rs) r7, r0  r7 = 0
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--7: mov(rd-rs) r14, r4 r14 = 2
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--8: out(rs)    r3 = 1     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--9: out(rs)    r4 = 2     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--10: out(rs)    r5 = 1     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--11: out(rs)    r6 = 3     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--12: out(rs)    r7 = 0     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--13: out(rs)    r8 = 0     
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';
         WAIT FOR 1 ns;
--14: out(rs)    r13 = 0    
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';  
         WAIT FOR 1 ns;
--15: out(rs)    r14 = 2    
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1';  
         WAIT FOR 1 ns;
         
--16: para ver out 15
         s_clk <= '0';
         WAIT FOR 1 ns;

         s_clk <= '1'; 
      WAIT;
   END PROCESS;          
END arch_procesador_tb; 