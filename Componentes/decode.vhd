LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY decode IS
   PORT (
         decode_in :             IN   std_logic_vector(7 DOWNTO 0);
         decode_out_we :         OUT  std_logic;
         decode_regs_bench_we :  OUT  std_logic;
         decode_alu_op :         OUT  std_logic_vector(2 DOWNTO 0);
         decode_reg_a_we:        OUT  std_logic;
         decode_bus_sel :        OUT  std_logic_vector(1 DOWNTO 0)
         );
END decode;

-- Arquitectura basada en sentencia case
ARCHITECTURE decoder_behavioral OF decode IS 
BEGIN
   PROCESS (decode_in)
      BEGIN   
       CASE decode_in IS
      --IN
         WHEN "00000001" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "10";
      --OUT
         WHEN "00000010" => decode_regs_bench_we <= '0';
                            decode_out_we        <= '1';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "00";
      --MOV
         WHEN "00000011" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "00";
      --LDA
         WHEN "00000100" => decode_regs_bench_we <= '0'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '1';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "00";
      --LDI
         WHEN "00000101" => decode_regs_bench_we <= '0'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '1';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "01";
      --ADD
         WHEN "00001010" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "010";
                            decode_bus_sel       <= "00";
      --SUB   
         WHEN "00001011" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "011";
                            decode_bus_sel       <= "00";
      --AND 
         WHEN "00001100" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "100";
                            decode_bus_sel       <= "00";
      --OR
         WHEN "00001101" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "101";
                            decode_bus_sel       <= "00";
      --XOR
         WHEN "00001110" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "110";
                            decode_bus_sel       <= "00";
      --SHL
         WHEN "00010100" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "001";
                            decode_bus_sel       <= "00";
      --SHR
         WHEN "00010101" => decode_regs_bench_we <= '1'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "111";
                            decode_bus_sel       <= "00";

         WHEN OTHERS =>     decode_regs_bench_we <= '0'; 
                            decode_out_we        <= '0';
                            decode_reg_a_we      <= '0';
                            decode_alu_op        <= "000";
                            decode_bus_sel       <= "00";                  
       END CASE;
  END PROCESS;            
END decoder_behavioral; 