LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux3_8_tb IS
END mux3_8_tb;

ARCHITECTURE arch_mux_tb OF mux3_8_tb IS

    COMPONENT mux3_8
            PORT (
                  mux_in_0: IN  std_logic_vector(7 DOWNTO 0);
                  mux_in_1: IN  std_logic_vector(7 DOWNTO 0);
                  mux_in_2: IN  std_logic_vector(7 DOWNTO 0);
                  mux_sel:  IN  std_logic_vector(1 DOWNTO 0);
                  mux_out:  OUT std_logic_vector(7 DOWNTO 0)
                 );
    END COMPONENT;

    SIGNAL s_mux_in_0: std_logic_vector(7 DOWNTO 0);
    SIGNAL s_mux_in_1: std_logic_vector(7 DOWNTO 0);
    SIGNAL s_mux_in_2: std_logic_vector(7 DOWNTO 0);
    SIGNAL s_mux_sel:  std_logic_vector(1 DOWNTO 0);
    SIGNAL s_mux_out:  std_logic_vector(7 DOWNTO 0);
                  
BEGIN
    UUT: mux3_8 PORT MAP (
                       mux_in_0 => s_mux_in_0,
                       mux_in_1 => s_mux_in_1,
                       mux_in_2 => s_mux_in_2,
                       mux_sel  => s_mux_sel,
                       mux_out  => s_mux_out
                      );
    
    Test: PROCESS
    BEGIN
        s_mux_in_0 <= "00000011";
        s_mux_in_1 <= "00000001";
        s_mux_in_2 <= "00000101";
        s_mux_sel <= "10";
        WAIT FOR 10 ns;
        ASSERT (s_mux_out = s_mux_in_2);
        

        s_mux_sel <= "01";
        WAIT FOR 10 ns;
        ASSERT (s_mux_out = s_mux_in_1);
       
        s_mux_sel <= "00";
        WAIT FOR 10 ns;
        ASSERT (s_mux_out = s_mux_in_0);
        
        WAIT;      
    END PROCESS;
END arch_mux_tb;