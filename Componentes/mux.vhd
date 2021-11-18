library IEEE;
use IEEE.std_logic_1164.all;

entity Mux is
	port (a: in std_logic_vector(7 downto 0);
    	  b: in std_logic_vector(7 downto 0);
          c: in std_logic_vector(7 downto 0);
          sel: in std_logic_vector(1 downto 0);
          o: out std_logic_vector(7 downto 0);
          );
end Mux;

architecture Beh_Mux of Mux is

begin

	o <= c when (sel(1) = '1') else --el input
         b when (sel(0) = '1') else -- IR inmediato
         a; --Regs


end Beh_Mux;