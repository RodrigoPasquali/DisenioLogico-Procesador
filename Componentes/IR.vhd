library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port ( clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           ir_in  : in  STD_LOGIC_VECTOR (15 downto 0);
           ir_out : out STD_LOGIC_VECTOR (15 downto 0));
end IR;

architecture Beh_IR of IR is
  
  signal aux : STD_LOGIC_VECTOR (15 downto 0);
  
begin 

  process (clk, rst)
  begin
    if rst = '1' then
      aux <= (others => '0');
    elsif (clk'event and clk = '1') then
      aux <= ir_in;
    end if; 
  end process; 

  ir_out <= aux;
  
end Beh_IR;