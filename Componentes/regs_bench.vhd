LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY regs_bench IS
    PORT ( 
           regs_bench_clk  : IN   std_logic;
           regs_bench_rst  : IN   std_logic;
           regs_bench_we   : IN   std_logic;
           regs_bench_rd   : IN   std_logic_vector (3 DOWNTO 0);
           regs_bench_rs   : IN   std_logic_vector (3 DOWNTO 0);
           regs_bench_din  : IN   std_logic_vector (7 DOWNTO 0);
           regs_bench_dout : OUT  std_logic_vector (7 DOWNTO 0)
          );
END regs_bench;

ARCHITECTURE regs_bench_behavioral OF regs_bench IS
  CONSTANT reg_tam : integer := 16;
  
  TYPE mem IS ARRAY(reg_tam-1 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
  
  SIGNAL reg: mem;
  
BEGIN 
  PROCESS (regs_bench_clk,regs_bench_rst)
  BEGIN
    IF regs_bench_rst = '1' THEN
      FOR i IN 0 TO reg_tam-1 LOOP
        reg(i) <= (OTHERS => '0');
      END LOOP; 
    ELSIF (regs_bench_clk'EVENT AND regs_bench_clk = '1') THEN
      IF (regs_bench_we = '1') THEN
--rd --> indica posicion del array donde se escribe
        reg(conv_integer(unsigned(regs_bench_rd))) <= regs_bench_din;
      END IF;
    END IF; 
  END PROCESS; 
--rs --> indica que posicion entrega en la salida(lectura)
  regs_bench_dout <= reg(conv_integer(unsigned(regs_bench_rs))); 
END regs_bench_behavioral;