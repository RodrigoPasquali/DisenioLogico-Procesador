LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regs_aux_tb IS
END regs_aux_tb;

ARCHITECTURE arch_regs_aux_tb OF regs_aux_tb IS
  COMPONENT regs_aux IS
     PORT (
           regs_aux_clk : IN  std_logic;
           regs_aux_rst : IN  std_logic;
           regs_aux_we  : IN  std_logic;
           regs_aux_in  : IN  std_logic_vector (7 DOWNTO 0);
           regs_aux_out : OUT std_logic_vector (7 DOWNTO 0)
           );
  END COMPONENT; 

  SIGNAL s_regs_aux_clk : std_logic;
  SIGNAL s_regs_aux_rst : std_logic;
  SIGNAL s_regs_aux_we  : std_logic;
  SIGNAL s_regs_aux_in  : std_logic_vector (7 DOWNTO 0);
  SIGNAL s_regs_aux_out : std_logic_vector (7 DOWNTO 0);
  
BEGIN 
  p_regs_aux : regs_aux PORT MAP (
                                  regs_aux_clk => s_regs_aux_clk, 
                                  regs_aux_rst => s_regs_aux_rst,
                                  regs_aux_we =>  s_regs_aux_we,
                                  regs_aux_in =>  s_regs_aux_in, 
                                  regs_aux_out => s_regs_aux_out
                                  );

  test : PROCESS
  BEGIN
    s_regs_aux_clk <= '0';
    s_regs_aux_rst <= '1';
    s_regs_aux_we  <= '1';
    s_regs_aux_in  <= "00000001";
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '1';
    s_regs_aux_rst <= '0';
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '0';
    s_regs_aux_in  <= "00000010";
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '0';
    s_regs_aux_in  <= "00000100";
    WAIT FOR 5 ns;
    
    s_regs_aux_clk <= '1';
    WAIT FOR 5 ns;
    
    s_regs_aux_clk <= '0';
    s_regs_aux_in  <= "00001000";

    WAIT FOR 5 ns;
    
    s_regs_aux_clk <= '1';
    s_regs_aux_in <= "00010000";
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '0';
    s_regs_aux_we  <= '0';
    s_regs_aux_in  <= "00100000";
    WAIT FOR 5 ns;
    
    s_regs_aux_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_aux_clk <= '0';
    s_regs_aux_rst <= '1';
    s_regs_aux_we  <= '1';
    s_regs_aux_in  <= "01000000";
    WAIT FOR 5 ns;
    
    s_regs_aux_clk <= '1';

    WAIT;
  END process;   
END arch_regs_aux_tb;