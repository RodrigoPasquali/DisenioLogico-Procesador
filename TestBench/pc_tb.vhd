library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity PC_TB is
end PC_TB;

architecture Beh_PC of PC_TB is

  component c_pc
      port ( clk : in  STD_LOGIC;
             rst : in  STD_LOGIC;
             output : out  STD_LOGIC_VECTOR (6 downto 0));
  end component; 

  signal clk : STD_LOGIC;
  signal rst : STD_LOGIC;
  signal output : STD_LOGIC_VECTOR (6 downto 0);  
  
begin 
  Mi_PC : c_pc port map (
  				      clk => clk,
                rst => rst,
                output => output
                );
  Clock : process
  begin
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
  end process;
 
  Test : process
  begin
    rst <= '1'; --rst en 1 y clk en 0
    wait until (clk'event and clk = '0');
    assert output = "0000000" report "Reset Activo";
     
    rst <= '0'; --rst en 0 y clk en 1
    wait until (clk'event and clk = '1');
    assert output = "1111111" report "Reset no activo";
    
    rst <= '0'; --rst en 1 y clk en 1
    wait until (clk'event and clk = '1');
    assert output = "0000000" report "Reset Activo "; 
    wait;
  end process; 
  
end Beh_PC;