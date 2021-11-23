LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regs_ir_tb IS
END regs_ir_tb;

ARCHITECTURE regs_ir_tb_behavioral OF regs_ir_tb IS

  COMPONENT regs_ir IS
     PORT (
           regs_ir_clk : IN  std_logic;
           regs_ir_rst : IN  std_logic;
           regs_ir_in  : IN  std_logic_vector (15 DOWNTO 0);
           regs_ir_out : OUT std_logic_vector (15 DOWNTO 0)
           );
  END COMPONENT; 

  SIGNAL s_regs_ir_clk : std_logic;
  SIGNAL s_regs_ir_rst : std_logic;
  SIGNAL s_regs_ir_in  : std_logic_vector (15 DOWNTO 0);
  SIGNAL s_regs_ir_out : std_logic_vector (15 DOWNTO 0);
  
BEGIN 
  Mi_IR : regs_ir PORT MAP (
                            regs_ir_clk => s_regs_ir_clk,
                            regs_ir_rst => s_regs_ir_rst,
                            regs_ir_in  => s_regs_ir_in,
                            regs_ir_out => s_regs_ir_out
                           );
                           
  test : PROCESS
  BEGIN
    s_regs_ir_clk <= '0';
    s_regs_ir_rst <= '1';
    s_regs_ir_in  <= "0000000000000001";
    WAIT FOR 5 ns;

    s_regs_ir_clk <= '1';
    s_regs_ir_rst <= '0';
    WAIT FOR 5 ns;

    s_regs_ir_clk <= '0';
    s_regs_ir_in  <= "0000000000000010";
    WAIT FOR 5 ns;

    s_regs_ir_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_ir_clk <= '0';
    s_regs_ir_in  <= "0000000000000100";
    WAIT FOR 5 ns;
    
    s_regs_ir_clk <= '1';
    WAIT FOR 5 ns;
    
    s_regs_ir_clk <= '0';
    s_regs_ir_in  <= "0000000000001000";

    WAIT FOR 5 ns;
    
    s_regs_ir_clk <= '1';
    s_regs_ir_in  <= "0000000000010000";
  
    WAIT;
  END PROCESS;  
END regs_ir_tb_behavioral;