library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity AC is
port(
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_AC				                  : in std_logic_vector(2 downto 0);
		DR_AC                            : in std_logic_vector(15 downto 0);
		Resultado_Respuesta              : in std_logic_vector(15 downto 0);
		AC_DR 				               : out std_logic_vector(15 downto 0);
		N2				               : out std_logic_vector(15 downto 0)
				
	);
	end entity AC;     

ARchitecture ACArch of AC is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E,rst : std_logic;
begin 

D(0)<= (DR_AC(0) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(0) AND UnidaddeControl_AC(0));
D(1)<= (DR_AC(1) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(1) AND UnidaddeControl_AC(0));
D(2)<= (DR_AC(2) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(2) AND UnidaddeControl_AC(0));
D(3)<= (DR_AC(3) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(3) AND UnidaddeControl_AC(0));
D(4)<= (DR_AC(4) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(4) AND UnidaddeControl_AC(0));
D(5)<= (DR_AC(5) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(5) AND UnidaddeControl_AC(0));
D(6)<= (DR_AC(6) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(6) AND UnidaddeControl_AC(0));
D(7)<= (DR_AC(7) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(7) AND UnidaddeControl_AC(0));
D(8)<= (DR_AC(8) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(8) AND UnidaddeControl_AC(0));
D(9)<= (DR_AC(9) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(9) AND UnidaddeControl_AC(0));
D(10)<= (DR_AC(10) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(10) AND UnidaddeControl_AC(0));
D(11)<= (DR_AC(11) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(11) AND UnidaddeControl_AC(0));
D(12)<= (DR_AC(12) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(12) AND UnidaddeControl_AC(0));
D(13)<= (DR_AC(13) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(13) AND UnidaddeControl_AC(0));
D(14)<= (DR_AC(14) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(14) AND UnidaddeControl_AC(0));
D(15)<= (DR_AC(15) AND UnidaddeControl_AC(1)) OR (Resultado_Respuesta(15) AND UnidaddeControl_AC(0));
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', UnidaddeControl_AC(2),Q(9));
FF11: dffe port map (D(10), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(10));
FF12: dffe port map (D(11), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(11));
FF13: dffe port map (D(12), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(12));
FF14: dffe port map (D(13), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(13));
FF15: dffe port map (D(14), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(14));
FF16: dffe port map (D(15), reloj, rst, '1', UnidaddeControl_AC(2) ,Q(15));


AC_DR	           <= Q;
N2         <= Q;			         


End ACArch;