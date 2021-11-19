----------------------------------------------------------------------------------
-- Realizado por la catedra  DISeño Lógico (UNTREF) en 2015
-- Tiene como objeto brINdarle a los alumnos un template del procesador requerido
-- PrOFesores Martín Vázquez - Lucas Leiva
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY procesador IS
    PORT ( 
    	   clk : 	  IN   std_logic;
           rst : 	  IN   std_logic;
           proc_in :  IN   std_logic_vector(7 DOWNTO 0);
           proc_out : OUT  std_logic_vector(7 DOWNTO 0)
           );
END procesador;

ARCHITECTURE procesador_behavioral OF procesador IS

-- ================
-- Declaración de los COMPONENTes utilziados

COMPONENT regs 
    PORT ( 
    	   regs_clk :  IN   std_logic;
           regs_rst :  IN   std_logic;
           regs_we :   IN   std_logic;
           regs_rd :   IN   std_logic_vector(3 DOWNTO 0);        
           regs_rs :   IN   std_logic_vector(3 DOWNTO 0);--aca deberia ir (7 DOWNTO 4);   
           regs_din :  IN   std_logic_vector(7 DOWNTO 0);
           regs_dout : OUT  std_logic_vector(7 DOWNTO 0)
           );
END COMPONENT;

COMPONENT alu PORT ( 
					 alu_op: IN   std_logic_vector(2 DOWNTO 0);
           			 alu_a : IN   std_logic_vector(7 DOWNTO 0);
           			 alu_b : IN   std_logic_vector(7 DOWNTO 0);
           			 alu_s : OUT  std_logic_vector(7 DOWNTO 0)
           			 );
END COMPONENT;

COMPONENT rom_prog PORT (
						 rom_addr : IN   std_logic_vector(6 DOWNTO 0);
						 rom_out :  OUT  std_logic_vector(15 DOWNTO 0)
						 );
END COMPONENT; 


COMPONENT decode PORT (
					   decode_in : 		IN   std_logic_vector(7 DOWNTO 0);
					   decode_reg_we :  OUT  std_logic;
					   decode_out_we :  OUT  std_logic;
					   decode_reg_a_we: OUT  std_logic;
					   decode_alu_op :  OUT  std_logic_vector(2 DOWNTO 0);
					   decode_bus_sel : OUT  std_logic_vector(1 DOWNTO 0)
					   );
END COMPONENT;

COMPONENT program_counter PORT(
								pc_clk : IN  std_logic;
							    rst :    IN  std_logic
								pc_out:  OUT std_logic_vector(6 DOWNTO 0)
								);
END COMPONENT; 

COMPONENT regs_ir 
    PORT ( 
    	   regs_ir_clk : IN  std_logic;
           regs_ir_rst : IN  std_logic;
           --regs_ir_we : IN  std_logic;   VER DOND ESTA ESTE WE
           regs_ir_in :  IN  std_logic_vector(15 DOWNTO 0);
           regs_ir_out : OUT std_logic_vector(15 DOWNTO 0)
           );
END COMPONENT;

COMPONENT regs_aux 
    PORT ( 
    	   regs_aux_clk : IN   std_logic;
           regs_aux_rst : IN   std_logic;
           regs_aux_we :  IN   std_logic;   
           regs_aux_in :  IN   std_logic_vector(7 DOWNTO 0);
           regs_aux_out : OUT  std_logic_vector(7 DOWNTO 0)
           );
END COMPONENT;

COMPONENT mux3_8
	PORT ( 
		  mux_in_0 : IN  std_logic_vector(7 DOWNTO 0); 
		  mux_in_1 : IN  std_logic_vector(7 DOWNTO 0);
		  mux_in_2 : IN  std_logic_vector(7 DOWNTO 0);
		  mux_sel :  IN  std_logic_vector(1 DOWNTO 0);		
		  mux_out :  OUT std_logic_vector(7 DOWNTO 0)
		  );
END COMPONENT;	

-- ================
-- declaración de señales usadas 

-- Banco de regIStros
SIGNAL s_decode_regs_we :  std_logic; -- senal para escribir en el banco de regIStro 
SIGNAL s_reg_ir_out :      std_logic_vector(15 DOWNTO 0);
SIGNAL s_regs_dout :       std_logic_vector(7 DOWNTO 0);

SIGNAL s_decode_alu_op :   std_logic_vector(2 DOWNTO 0);
SIGNAL s_mux_out :         std_logic_vector(7 DOWNTO 0);

SIGNAL s_reg_a_out :       std_logic_vector(7 DOWNTO 0);

SIGNAL s_regout_in :       std_logic_vector(7 DOWNTO 0);

SIGNAL s_pc_out :  		   std_logic_vector(6 DOWNTO 0);
SIGNAL s_rom_out :  	   std_logic_vector(15 DOWNTO 0);

SIGNAL s_decode_out_we :   std_logic;
SIGNAL s_decode_reg_a_we : std_logic;
SIGNAL s_decode_bus_sel :  std_logic_vector(1 DOWNTO 0);



-- SIGNAL ....

-- ================

BEGIN

-- ================
-- INstaciacion de COMPONENTes utilziados

-- Banco de regIStros
c_regs:  regs PORT MAP (
						regs_clk =>  clk,
						regs_rst =>  rst,
						regs_we =>   s_decode_regs_we, 
					    regs_rd =>   s_reg_ir_out(3 DOWNTO 0),
					    regs_rs =>   s_reg_ir_out(7 DOWNTO 4), 
						regs_din =>  s_regout_in,
						regs_dout => s_regs_dout
						); -- hay que cpmpletar esta INstanciación
-- La ALU
c_alu: alu PORT MAP (
					 alu_op => s_decode_alu_op,
           			 alu_a =>  s_mux_out,
           			 alu_b =>  s_reg_a_out,
           			 alu_s =>  s_regout_in
					);

-- La ROM de programa
c_rom: rom_prog PORT MAP (
						  rom_addr => s_pc_out,
						  rom_out =>  s_rom_out
						  );

-- El decodificador de la INstrucción
c_decode: decode PORT MAP (
						    decode_in => 	   s_reg_ir_out(15 DOWNTO 8),
					   		decode_reg_we =>   s_decode_regs_we,
					   		decode_out_we =>   s_decode_out_we,
					   		decode_reg_a_we => s_decode_reg_a_we,
					   		decode_alu_op =>   s_decode_alu_op,
					   		decode_bus_sel =>  s_decode_bus_sel
						   );

-- El program counter
c_program_counter: program_counter PORT MAP (
											 pc_clk =>  clk,
											 pc_out: => s_pc_out,
							    			 rst : =>   rst
											);

c_reg_ir: regs_ir PORT MAP (
							regs_ir_clk => clk,
           					regs_ir_rst => rst,
           					--regs_ir_we => ,VER DOND ESTA ESTE WE
           					regs_ir_in =>  s_rom_out, 
           					regs_ir_out => s_reg_ir_out
							);

c_reg_a: regs_aux PORT MAP(
						 	regs_aux_clk => clk,
           				 	regs_aux_rst => rst,
            			 	regs_aux_we =>  s_decode_reg_a_we,   
             			 	regs_aux_in =>  s_mux_out,
           				 	regs_aux_out => s_reg_a_out
						  );							 


c_reg_OUT: regs_aux PORT MAP(
						 	 regs_aux_clk => clk,
           				 	 regs_aux_rst => rst,
            			 	 regs_aux_we =>  s_decode_out_we,   
             			 	 regs_aux_in =>  s_regout_in,
           				 	 regs_aux_out => proc_out
							);

c_mux3_8: mux3_8 PORT MAP(
						   mux_in_0 => s_regs_dout, 
		  				   mux_in_1 => s_reg_ir_out(7 DOWNTO 0),
		  				   mux_in_2 => proc_in,
		  				   mux_sel =>  s_decode_bus_sel,		
		  				   mux_out =>  s_mux_out
						  );														
-- ================


-- ================
-- Descripción de mux que funciona como "bus"
-- controlado por bus_sel
	--case reg_a_we IS
	-- when '0' s_mux_out   
	-- when '1' 
	-- when others; 

	--case regs_we IS
	-- when '0' s_regout_in => alu_s
	-- when '1' s_regout_in => regs_din
	-- when others; 

-- ================


-- ================
-- Descripción de los almacenamientos
-- Los almacenamientos que se deben decribir aca son: 
-- <reg_a> 8 bits
-- <reg_OUT> de 8 bits
-- <pc> de 8 bits
-- <ir> de 16 bits

	PROCESS (clk, rst)
	
	BEGIN
	     IF (rst = '1') THEN 
--		  	regs_aux_rst = '1';
		  ELSIF (rising_edge(clk)) THEN
		  
		  END IF;
		  
	END PROCESS;
-- ================


END procesador_behavioral;

