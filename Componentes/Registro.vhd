library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro is
    Port ( 
           r_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           r_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk   : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           we     : in  STD_LOGIC;
          );
end Registro;

architecture Beh_Reg of Registro is
  
begin 

  process (clk, rst)
  begin
    if rst = '1' then
      r_out <= (others => '0');
      
    elsif (clk'event and clk = '1' and we = '1') then
      r_out <= r_in;
    end if; 
  end process; 
  
end Beh_Reg;