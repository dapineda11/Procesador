library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity DR is
port(
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_DR				                  : in std_logic_vector(6 downto 0);
		AC_DR                            : in std_logic_vector(15 downto 0);
		Dato_RWM                         : in std_logic_vector(15 downto 0);
		IR_DR                            : in std_logic_vector(15 downto 0);
		IR_DATO_DR                       : in std_logic_vector(8 downto 0);
		PC_DR                            : in std_logic_vector(9 downto 0);
		SR_DR                            : in std_logic_vector(4 downto 0);
		N1				               : out std_logic_vector(15 downto 0);
		DR_AC  				               : out std_logic_vector(15 downto 0);
		DR_AR  				               : out std_logic_vector(9 downto 0);
		DR_SR 				               : out std_logic_vector(4 downto 0);
		DR_IR                            : OUT std_logic_vector(15 downto 0);
		Dato_RWM_Out                     : out std_logic_vector(15 downto 0);
		DR_PC				                  : out std_logic_vector(9 downto 0)
				
	);
	end entity DR;     

ARchitecture DRArch of DR is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E,rst : std_logic;
begin 

D(0)<= (AC_DR(0) AND UnidaddeControl_DR(1)) OR (Dato_RWM(0) AND UnidaddeControl_DR(3)) OR (IR_DR(0) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(0) AND UnidaddeControl_DR(4)) OR (PC_DR(0) AND UnidaddeControl_DR(2)) OR (SR_DR(0) AND UnidaddeControl_DR(0));
D(1)<= (AC_DR(1) AND UnidaddeControl_DR(1)) OR (Dato_RWM(1) AND UnidaddeControl_DR(3)) OR (IR_DR(1) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(1) AND UnidaddeControl_DR(4)) OR (PC_DR(1) AND UnidaddeControl_DR(2)) OR (SR_DR(1) AND UnidaddeControl_DR(0));
D(2)<= (AC_DR(2) AND UnidaddeControl_DR(1)) OR (Dato_RWM(2) AND UnidaddeControl_DR(3)) OR (IR_DR(2) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(2) AND UnidaddeControl_DR(4)) OR (PC_DR(2) AND UnidaddeControl_DR(2)) OR (SR_DR(2) AND UnidaddeControl_DR(0));
D(3)<= (AC_DR(3) AND UnidaddeControl_DR(1)) OR (Dato_RWM(3) AND UnidaddeControl_DR(3)) OR (IR_DR(3) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(3) AND UnidaddeControl_DR(4)) OR (PC_DR(3) AND UnidaddeControl_DR(2)) OR (SR_DR(3) AND UnidaddeControl_DR(0));
D(4)<= (AC_DR(4) AND UnidaddeControl_DR(1)) OR (Dato_RWM(4) AND UnidaddeControl_DR(3)) OR (IR_DR(4) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(4) AND UnidaddeControl_DR(4)) OR (PC_DR(4) AND UnidaddeControl_DR(2)) OR (SR_DR(4) AND UnidaddeControl_DR(0));
D(5)<= (AC_DR(5) AND UnidaddeControl_DR(1)) OR (Dato_RWM(5) AND UnidaddeControl_DR(3)) OR (IR_DR(5) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(5) AND UnidaddeControl_DR(4)) OR (PC_DR(5) AND UnidaddeControl_DR(2));
D(6)<= (AC_DR(6) AND UnidaddeControl_DR(1)) OR (Dato_RWM(6) AND UnidaddeControl_DR(3)) OR (IR_DR(6) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(6) AND UnidaddeControl_DR(4)) OR (PC_DR(6) AND UnidaddeControl_DR(2));
D(7)<= (AC_DR(7) AND UnidaddeControl_DR(1)) OR (Dato_RWM(7) AND UnidaddeControl_DR(3)) OR (IR_DR(7) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(7) AND UnidaddeControl_DR(4)) OR (PC_DR(7) AND UnidaddeControl_DR(2));
D(8)<= (AC_DR(8) AND UnidaddeControl_DR(1)) OR (Dato_RWM(8) AND UnidaddeControl_DR(3)) OR (IR_DR(8) AND UnidaddeControl_DR(5)) OR (IR_DATO_DR(8) AND UnidaddeControl_DR(4)) OR (PC_DR(8) AND UnidaddeControl_DR(2));
D(9)<= (AC_DR(9) AND UnidaddeControl_DR(1)) OR (Dato_RWM(9) AND UnidaddeControl_DR(3)) OR (IR_DR(9) AND UnidaddeControl_DR(5)) OR (PC_DR(9) AND UnidaddeControl_DR(2));
D(10)<= (AC_DR(10) AND UnidaddeControl_DR(1)) OR (Dato_RWM(10) AND UnidaddeControl_DR(3)) OR (IR_DR(10) AND UnidaddeControl_DR(5));
D(11)<= (AC_DR(11) AND UnidaddeControl_DR(1)) OR (Dato_RWM(11) AND UnidaddeControl_DR(3)) OR (IR_DR(11) AND UnidaddeControl_DR(5));
D(12)<= (AC_DR(12) AND UnidaddeControl_DR(1)) OR (Dato_RWM(12) AND UnidaddeControl_DR(3)) OR (IR_DR(12) AND UnidaddeControl_DR(5));
D(13)<= (AC_DR(13) AND UnidaddeControl_DR(1)) OR (Dato_RWM(13) AND UnidaddeControl_DR(3)) OR (IR_DR(13) AND UnidaddeControl_DR(5));
D(14)<= (AC_DR(14) AND UnidaddeControl_DR(1)) OR (Dato_RWM(14) AND UnidaddeControl_DR(3)) OR (IR_DR(14) AND UnidaddeControl_DR(5));
D(15)<= (AC_DR(15) AND UnidaddeControl_DR(1)) OR (Dato_RWM(15) AND UnidaddeControl_DR(3)) OR (IR_DR(15) AND UnidaddeControl_DR(5));
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(9));
FF11: dffe port map (D(10), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(10));
FF12: dffe port map (D(11), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(11));
FF13: dffe port map (D(12), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(12));
FF14: dffe port map (D(13), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(13));
FF15: dffe port map (D(14), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(14));
FF16: dffe port map (D(15), reloj, rst, '1', UnidaddeControl_DR(6) ,Q(15));


DR_PC(0)	        <= Q(0);
DR_PC(1)	        <= Q(1);
DR_PC(2)	        <= Q(2);
DR_PC(3)	        <= Q(3);
DR_PC(4)	        <= Q(4);
DR_PC(5)	        <= Q(5);
DR_PC(6)	        <= Q(6);
DR_PC(7)	        <= Q(7);
DR_PC(8)	        <= Q(8);
DR_PC(9)	        <= Q(9);
	
DR_SR(0)         <= Q(0);
DR_SR(1)         <= Q(1);
DR_SR(2)         <= Q(2);
DR_SR(3)         <= Q(3);
DR_SR(4)         <= Q(4);
	
N1         <= Q;	
DR_AC            <= Q;

DR_AR(0)	        <= Q(0);
DR_AR(1)	        <= Q(1);
DR_AR(2)	        <= Q(2);
DR_AR(3)	        <= Q(3);
DR_AR(4)	        <= Q(4);
DR_AR(5)	        <= Q(5);
DR_AR(6)	        <= Q(6);
DR_AR(7)	        <= Q(7);
DR_AR(8)	        <= Q(8);
DR_AR(9)	        <= Q(9);

DR_IR            <= Q;
DATO_RWM_Out     <= Q;			         


End DRArch;