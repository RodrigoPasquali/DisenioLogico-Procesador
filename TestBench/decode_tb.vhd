LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY decode_tb IS
END decode_tb;


ARCHITECTURE arch_decode_tb OF decode_tb IS 
   -- declaración de componente de unidad bajo testeo
   COMPONENT decode
    PORT(
         decode_in :             IN   std_logic_vector(7 DOWNTO 0);
         decode_out_we :         OUT  std_logic;
         decode_regs_bench_we :  OUT  std_logic;
         decode_alu_op :         OUT  std_logic_vector(2 DOWNTO 0);
         decode_reg_a_we:        OUT  std_logic;
         decode_bus_sel :        OUT  std_logic_vector(1 DOWNTO 0)
         );
   END COMPONENT;             
   
   -- Señal de estímulo
   SIGNAL s_decode_in:              std_logic_vector(7 downto 0);
   SIGNAL s_decode_regs_bench_we:   std_logic;
   SIGNAL s_decode_out_we:          std_logic;
   SIGNAL s_decode_reg_a_we:        std_logic;
   SIGNAL s_decode_alu_op:          std_logic_vector (2 DOWNTO 0);
   SIGNAL s_decode_bus_sel:         std_logic_vector (1 DOWNTO 0);
   
   
BEGIN
   -- Unit Under Test port map
   UUT: decode PORT MAP (
                        decode_in =>            s_decode_in,
                        decode_regs_bench_we => s_decode_regs_bench_we,  
                        decode_out_we =>        s_decode_out_we, 
                        decode_reg_a_we =>      s_decode_reg_a_we,
                        decode_alu_op =>        s_decode_alu_op,
                        decode_bus_sel =>       s_decode_bus_sel
                        );

   -- TestBench
   PROCESS 
    BEGIN
      s_decode_in <= "00000001";  
      WAIT FOR 10 ns;
        
      s_decode_in <= "00000010";  
      WAIT FOR 10 ns;

      s_decode_in <= "00000011";  
      WAIT FOR 10 ns;

      s_decode_in <= "00010101";  
      WAIT FOR 10 ns;
      
      s_decode_in <= "11111111";  
      
      WAIT;
   END PROCESS;          
END arch_decode_tb; 