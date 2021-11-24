LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regs_bench_tb IS
END regs_bench_tb;

ARCHITECTURE arch_regs_bench_tb OF regs_bench_tb IS
  COMPONENT regs_bench IS
     PORT (
           regs_bench_clk  : IN   std_logic;
           regs_bench_rst  : IN   std_logic;
           regs_bench_we   : IN   std_logic;
           regs_bench_rd   : IN   std_logic_vector (3 DOWNTO 0);
           regs_bench_rs   : IN   std_logic_vector (3 DOWNTO 0);
           regs_bench_din  : IN   std_logic_vector (7 DOWNTO 0);
           regs_bench_dout : OUT  std_logic_vector (7 DOWNTO 0)
           );
  END COMPONENT; 

  SIGNAL s_regs_bench_clk  : std_logic;
  SIGNAL s_regs_bench_rst  : std_logic;
  SIGNAL s_regs_bench_we   : std_logic;
  SIGNAL s_regs_bench_rd   : std_logic_vector (3 DOWNTO 0);
  SIGNAL s_regs_bench_rs   : std_logic_vector (3 DOWNTO 0);
  SIGNAL s_regs_bench_din  : std_logic_vector (7 DOWNTO 0);
  SIGNAL s_regs_bench_dout : std_logic_vector (7 DOWNTO 0);
  
BEGIN 
  p_regs_bench : regs_bench PORT MAP (
                                      regs_bench_clk  => s_regs_bench_clk, 
                                      regs_bench_rst  => s_regs_bench_rst,
                                      regs_bench_we   => s_regs_bench_we,
                                      regs_bench_rd   => s_regs_bench_rd,
                                      regs_bench_rs   => s_regs_bench_rs,
                                      regs_bench_din  => s_regs_bench_din, 
                                      regs_bench_dout => s_regs_bench_dout
                                  );

  test : PROCESS
  BEGIN
    s_regs_bench_clk <= '0';
    s_regs_bench_rst <= '1';
    s_regs_bench_we  <= '1';
--rd --> escribo en posicion 1 lo de din   
    s_regs_bench_rd  <= "0001";
--rs --> mostrame posicion 1  en dout  
    WAIT FOR 5 ns;

    s_regs_bench_din <= "10000000"; --80
    s_regs_bench_rs  <= "0001";
    s_regs_bench_clk <= '1';
    s_regs_bench_rst <= '0';
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_rd  <= "0010";
    WAIT FOR 5 ns;

    s_regs_bench_din  <= "10000001"; --81
    s_regs_bench_rs  <= "0010";
    s_regs_bench_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_rd  <= "0011";
    s_regs_bench_din  <= "10000010"; --82
    WAIT FOR 5 ns;
    
    s_regs_bench_clk <= '1';
    s_regs_bench_rs  <= "0011";
    WAIT FOR 5 ns;
   
    s_regs_bench_clk <= '0';
    s_regs_bench_rd  <= "0100";
    s_regs_bench_din  <= "10000011";
    WAIT FOR 5 ns;
    
    s_regs_bench_clk <= '1';
    s_regs_bench_rs  <= "0100";
    s_regs_bench_din <= "00010000";
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_rd  <= "0101";
    s_regs_bench_we  <= '0';
    s_regs_bench_din  <= "10000100";
    WAIT FOR 5 ns;
    
    s_regs_bench_rs  <= "0101";
    s_regs_bench_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_we  <= '1';
    s_regs_bench_rd  <= "0001";
    s_regs_bench_din  <= "10000110";
    WAIT FOR 5 ns;
    
    s_regs_bench_rs  <= "0001";
    s_regs_bench_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_we  <= '0';
    s_regs_bench_rd  <= "0010";
    s_regs_bench_din  <= "10000110";
    WAIT FOR 5 ns;
    
    s_regs_bench_rs  <= "0010";
    s_regs_bench_clk <= '1';
    WAIT FOR 5 ns;

    s_regs_bench_clk <= '0';
    s_regs_bench_rst <= '1';
    s_regs_bench_we  <= '1';
    s_regs_bench_rd  <= "0110";
    s_regs_bench_din  <= "10000101";
    WAIT FOR 5 ns;
    
    s_regs_bench_rs  <= "0110";
    s_regs_bench_clk <= '1';

    WAIT; 
  END process;   
END arch_regs_bench_tb;