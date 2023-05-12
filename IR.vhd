library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity IR is
port(
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_IR				                  : in std_logic_vector(2 downto 0);
		DR_IR                            : in std_logic_vector(15 downto 0);
		ROM_DATO                         : in std_logic_vector(15 downto 0);
		IR_DR 				               : out std_logic_vector(15 downto 0);
		IR_DATO_DR                       : out std_logic_vector(8 downto 0);
		Operacion 				            : out std_logic_vector(3 downto 0);
		IR_AR                            : out std_logic_vector(8 downto 0)
						
	);
	end entity IR;     

ARchitecture IRArch of IR is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E,rst : std_logic;
begin 

D(0)<= (DR_IR(0) AND UnidaddeControl_IR(1)) OR (ROM_DATO(0) AND UnidaddeControl_IR(0));
D(1)<= (DR_IR(1) AND UnidaddeControl_IR(1)) OR (ROM_DATO(1) AND UnidaddeControl_IR(0));
D(2)<= (DR_IR(2) AND UnidaddeControl_IR(1)) OR (ROM_DATO(2) AND UnidaddeControl_IR(0));
D(3)<= (DR_IR(3) AND UnidaddeControl_IR(1)) OR (ROM_DATO(3) AND UnidaddeControl_IR(0));
D(4)<= (DR_IR(4) AND UnidaddeControl_IR(1)) OR (ROM_DATO(4) AND UnidaddeControl_IR(0));
D(5)<= (DR_IR(5) AND UnidaddeControl_IR(1)) OR (ROM_DATO(5) AND UnidaddeControl_IR(0));
D(6)<= (DR_IR(6) AND UnidaddeControl_IR(1)) OR (ROM_DATO(6) AND UnidaddeControl_IR(0));
D(7)<= (DR_IR(7) AND UnidaddeControl_IR(1)) OR (ROM_DATO(7) AND UnidaddeControl_IR(0));
D(8)<= (DR_IR(8) AND UnidaddeControl_IR(1)) OR (ROM_DATO(8) AND UnidaddeControl_IR(0));
D(9)<= (DR_IR(9) AND UnidaddeControl_IR(1)) OR (ROM_DATO(9) AND UnidaddeControl_IR(0));
D(10)<= (DR_IR(10) AND UnidaddeControl_IR(1)) OR (ROM_DATO(10) AND UnidaddeControl_IR(0));
D(11)<= (DR_IR(11) AND UnidaddeControl_IR(1)) OR (ROM_DATO(11) AND UnidaddeControl_IR(0));
D(12)<= (DR_IR(12) AND UnidaddeControl_IR(1)) OR (ROM_DATO(12) AND UnidaddeControl_IR(0));
D(13)<= (DR_IR(13) AND UnidaddeControl_IR(1)) OR (ROM_DATO(13) AND UnidaddeControl_IR(0));
D(14)<= (DR_IR(14) AND UnidaddeControl_IR(1)) OR (ROM_DATO(14) AND UnidaddeControl_IR(0));
D(15)<= (DR_IR(15) AND UnidaddeControl_IR(1)) OR (ROM_DATO(15) AND UnidaddeControl_IR(0));
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(9));
FF11: dffe port map (D(10), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(10));
FF12: dffe port map (D(11), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(11));
FF13: dffe port map (D(12), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(12));
FF14: dffe port map (D(13), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(13));
FF15: dffe port map (D(14), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(14));
FF16: dffe port map (D(15), reloj, rst, '1', UnidaddeControl_IR(2) ,Q(15));


IR_DR	           <= Q;

IR_AR(0)	        <= Q(0);
IR_AR(1)	        <= Q(1);
IR_AR(2)	        <= Q(2);
IR_AR(3)	        <= Q(3);
IR_AR(4)	        <= Q(4);
IR_AR(5)	        <= Q(5);
IR_AR(6)	        <= Q(6);
IR_AR(7)	        <= Q(7);
IR_AR(8)	        <= Q(8);


IR_DATO_DR (0)	        <= Q(0);
IR_DATO_DR (1)	        <= Q(1);
IR_DATO_DR (2)	        <= Q(2);
IR_DATO_DR (3)	        <= Q(3);
IR_DATO_DR (4)	        <= Q(4);
IR_DATO_DR (5)	        <= Q(5);
IR_DATO_DR (6)	        <= Q(6);
IR_DATO_DR (7)	        <= Q(7);
IR_DATO_DR (8)	        <= Q(8);


	
Operacion(0)         <= Q(11);
Operacion(1)         <= Q(12);
Operacion(2)         <= Q(13);
Operacion(3)         <= Q(14);
		         


End IRArch;