library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro_TB is
end Registro_TB;

architecture Beh_Reg of Registro_TB is

  component Registro is
     Port (clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           we     : in  STD_LOGIC;
           r_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           r_out : out STD_LOGIC_VECTOR (7 downto 0));
  end component; 

  signal clk    : STD_LOGIC;
  signal rst    : STD_LOGIC;
  signal we     : STD_LOGIC;
  signal r_in  : STD_LOGIC_VECTOR (7 downto 0);
  signal r_out : STD_LOGIC_VECTOR (7 downto 0);
  
begin 
 Reg : Registro port map (clk => clk, 
                             rst => rst,
                             we => we,
                             r_in => r_in, 
                             r_out => r_out);

  Clock : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;
 
  Test : process
  begin
    rst <= '0';
    r_in <= "00001111";
    we <= '1';
    wait until (clk'event and clk = '1');
    assert r_out = "00001111";

    wait;
  end process; 
  
end Beh_Reg;