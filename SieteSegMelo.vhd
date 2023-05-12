library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity SieteSegMelo is
port(
		Reloj    			    			 : in std_logic;
		Reinicio 	 			   		 : in std_logic;
      DATO_RWM_Out		               : in std_logic_vector (15 downto 0);
		UnidaddeControl_RWM		             	      : in std_logic_vector (1 downto 0);
		System_OUT						 			  	: out std_logic_vector (15 downto 0)

	);
	end entity SieteSegMelo;     

architecture SieteSegMeloArch of SieteSegMelo is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E,rst : std_logic;
signal x : std_logic;
begin 

x <= UnidaddeControl_RWM(1); 

D(0) <= (DATO_RWM_Out(0) and x);
D(1) <= (DATO_RWM_Out(1) and x);
D(2) <= (DATO_RWM_Out(2) and x);
D(3) <= (DATO_RWM_Out(3) and x);
D(4) <= (DATO_RWM_Out(4) and x);
D(5) <= (DATO_RWM_Out(5) and x);
D(6) <= (DATO_RWM_Out(6) and x);
D(7) <= (DATO_RWM_Out(7) and x);
D(8) <= (DATO_RWM_Out(8) and x);
D(9) <= (DATO_RWM_Out(9) and x);
D(10) <= (DATO_RWM_Out(10) and x);
D(11) <= (DATO_RWM_Out(11) and x);
D(12) <= (DATO_RWM_Out(12) and x);
D(13) <= (DATO_RWM_Out(13) and x);
D(14) <= (DATO_RWM_Out(14) and x);
D(15) <= (DATO_RWM_Out(15) and x);
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', UnidaddeControl_RWM(1),Q(9));
FF11: dffe port map (D(10), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(10));
FF12: dffe port map (D(11), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(11));
FF13: dffe port map (D(12), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(12));
FF14: dffe port map (D(13), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(13));
FF15: dffe port map (D(14), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(14));
FF16: dffe port map (D(15), reloj, rst, '1', UnidaddeControl_RWM(1) ,Q(15));

System_OUT(0) <= Q(0);
System_OUT(1) <= Q(1);
System_OUT(2) <= Q(2);
System_OUT(3) <= Q(3);
System_OUT(4) <= Q(4);
System_OUT(5) <= Q(5);
System_OUT(6) <= Q(6);
System_OUT(7) <= Q(7);
System_OUT(8) <= Q(8);
System_OUT(9) <= Q(9);
System_OUT(10) <=Q(10);
System_OUT(11) <=Q(11);
System_OUT(12) <=Q(12);
System_OUT(13) <= Q(13);
System_OUT(14) <= Q(14);
System_OUT(15) <= Q(15);


End SieteSegMeloArch;