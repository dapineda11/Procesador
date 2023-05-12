
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity regresp is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		CONtrol_resp						   : in std_logic;
		Boothasaurus_Rex_RESPUESTA				: IN std_logic_vector(15 downto 0);
		Respuesta_Mux           			: OUT std_logic_vector(15 downto 0);
	   NEGativo_Boothasaurus_Rex	         : OUT std_logic;
	   CERO_MULT                        : out  std_logic
	);
	end entity regresp;     

architecture regrespArch of regresp is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
SIGnal MUX : STD_logic_vector(2 downto 0);
signal E : std_logic;
begin 

D(0)<= Boothasaurus_Rex_RESPUESTA(1);
D(1)<= Boothasaurus_Rex_RESPUESTA(2);
D(2)<= Boothasaurus_Rex_RESPUESTA(3);
D(3)<= Boothasaurus_Rex_RESPUESTA(4);
D(4)<= Boothasaurus_Rex_RESPUESTA(5);
D(5)<= Boothasaurus_Rex_RESPUESTA(6);
D(6)<= Boothasaurus_Rex_RESPUESTA(7);
D(7)<= Boothasaurus_Rex_RESPUESTA(8);
D(8)<= Boothasaurus_Rex_RESPUESTA(9);
D(9)<=  Boothasaurus_Rex_RESPUESTA(10);
D(10)<= Boothasaurus_Rex_RESPUESTA(11);
D(11)<= Boothasaurus_Rex_RESPUESTA(12);
D(12)<= Boothasaurus_Rex_RESPUESTA(13);
D(13)<= Boothasaurus_Rex_RESPUESTA(14);
D(14)<= Boothasaurus_Rex_RESPUESTA(15);
D(15)<= Boothasaurus_Rex_RESPUESTA(15);





FF1: dffe port map (D(0), reloj, '1', '1', control_resp ,Q(0));
FF2: dffe port map (D(1), reloj, '1', '1', control_resp ,Q(1));
FF3: dffe port map (D(2), reloj, '1', '1', control_resp ,Q(2));
FF4: dffe port map (D(3), reloj, '1', '1', control_resp ,Q(3));
FF5: dffe port map (D(4), reloj, '1', '1', control_resp ,Q(4));
FF6: dffe port map (D(5), reloj, '1', '1', control_resp ,Q(5));
FF7: dffe port map (D(6), reloj, '1', '1', control_resp ,Q(6));
FF8: dffe port map (D(7), reloj, '1', '1', control_resp ,Q(7));
FF9: dffe port map (D(8), reloj, '1', '1', control_resp ,Q(8));
FF10: dffe port map (D(9), reloj, '1', '1', control_resp ,Q(9));
FF11: dffe port map (D(10), reloj, '1', '1', control_resp ,Q(10));
FF12: dffe port map (D(11), reloj, '1', '1', control_resp ,Q(11));
FF13: dffe port map (D(12), reloj, '1', '1', control_resp ,Q(12));
FF14: dffe port map (D(13), reloj, '1', '1', control_resp ,Q(13));
FF15: dffe port map (D(14), reloj, '1', '1', control_resp ,Q(14));
FF16: dffe port map (D(15), reloj, '1', '1', control_resp,Q(15));


Respuesta_Mux<= Q;

Negativo_Boothasaurus_Rex<=Q(15);
CERO_MULT<= NOT(Q(0)OR Q(1)OR Q(2) OR Q(3)OR Q(4)OR Q(5) OR Q(6)OR Q(7)OR Q(8) OR Q(9)OR Q(10)OR Q(11) OR Q(12)OR Q(13)OR Q(14) OR Q(15));

End regrespArch;