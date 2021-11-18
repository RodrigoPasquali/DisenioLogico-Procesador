library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR_TB is
end IR_TB;

architecture Beh_IR_TB of IR_TB is

  component IR is
     Port (clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           ir_in   : in  STD_LOGIC_VECTOR (15 downto 0);
           ir_out : out STD_LOGIC_VECTOR (15 downto 0));
  end component; 

  signal clk    : STD_LOGIC;
  signal rst    : STD_LOGIC;
  signal ir_in   : STD_LOGIC_VECTOR (15 downto 0);
  signal ir_out : STD_LOGIC_VECTOR (15 downto 0);
  
begin 
  Mi_IR : IR port map (
  			    clk => clk,
            rst => rst,
            ir_in => ir_in,
            ir_out => ir_out
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
    rst <= '1';
    ir_in  <= "0000000011111111";
    wait until (clk'event and clk = '1');
    assert ir_out = "0000000000000000" report "Reset";
    
    rst <= '0';
    wait until (clk'event and clk = '1');
    ir_in  <= "1111111100000000";   
    assert ir_out = "1111111100000000" report "ok"; --revisar test

    wait;
  end process; 
  
end Beh_IR_TB;