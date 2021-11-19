LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY pc_tb IS
END pc_tb;

ARCHITECTURE arch_pc_tb OF pc_tb IS
  COMPONENT program_counter
      PORT (   
            pc_clk : IN  std_logic;
            pc_rst : IN  std_logic;
            pc_out:  OUT std_logic_vector(6 DOWNTO 0)
            );    
  END COMPONENT; 

  SIGNAL s_pc_clk : std_logic;
  SIGNAL s_pc_rst : std_logic;
  SIGNAL s_pc_out : std_logic_vector(6 DOWNTO 0);  
  
BEGIN 
  UUT: program_counter PORT MAP (
                                 pc_clk => s_pc_clk,
                                 pc_rst => s_pc_rst,
                                 pc_out => s_pc_out
                                );

  Clock : PROCESS
      BEGIN
        s_pc_clk <= '1';
        s_pc_rst <= '1';
        WAIT FOR 5 ns;

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--1 CICLO                
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--2 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
        
        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--3 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;      

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--4 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;      

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--5 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--6 CICLO                
        s_pc_clk <= '1';
        s_pc_rst <= '1';
        WAIT FOR 5 ns;

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--7 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
        
        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--8 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;      

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--9 CICLO        
        s_pc_clk <= '1';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;      

        s_pc_clk <= '0';
        s_pc_rst <= '0';
        WAIT FOR 5 ns;
--10 CICLO        
  END PROCESS;
END arch_pc_tb;