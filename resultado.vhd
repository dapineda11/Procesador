library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Resultado is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		Control_Resultado				      : in std_logic;
		Resultado_Respuesta				  	: out std_logic_vector(15 downto 0);
		MUX_Resultado						   : in std_logic_vector (15 downto 0);
		Resultado_ResultadoCero			       	: out std_logic_vector(15 downto 0)
				
	);
	end entity Resultado;     

architecture ResultadoArch of Resultado is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E : std_logic;
begin 

D(0) <= MUX_Resultado(0);
D(1) <= MUX_Resultado(1);
D(2) <= MUX_Resultado(2);
D(3) <= MUX_Resultado(3);
D(4) <= MUX_Resultado(4);
D(5) <= MUX_Resultado(5);
D(6) <= MUX_Resultado(6);
D(7) <= MUX_Resultado(7);
D(8) <= MUX_Resultado(8);
D(9) <= MUX_Resultado(9);
D(10) <= MUX_Resultado(10);
D(11) <= MUX_Resultado(11);
D(12) <= MUX_Resultado(12);
D(13) <= MUX_Resultado(13);
D(14) <= MUX_Resultado(14);
D(15) <= MUX_Resultado(15);

FF1: dffe port map (D(0), reloj, '1', '1', control_Resultado ,Q(0));
FF2: dffe port map (D(1), reloj,  '1', '1', control_Resultado ,Q(1));
FF3: dffe port map (D(2), reloj, '1', '1', control_Resultado ,Q(2));
FF4: dffe port map (D(3), reloj,  '1', '1', control_Resultado ,Q(3));
FF5: dffe port map (D(4), reloj, '1', '1', control_Resultado ,Q(4));
FF6: dffe port map (D(5), reloj,  '1', '1', control_Resultado ,Q(5));
FF7: dffe port map (D(6), reloj,  '1', '1', control_Resultado ,Q(6));
FF8: dffe port map (D(7), reloj,  '1', '1', control_Resultado ,Q(7));
FF9: dffe port map (D(8), reloj,  '1', '1', control_Resultado ,Q(8));
FF10: dffe port map (D(9), reloj,  '1', '1', control_Resultado ,Q(9));
FF11: dffe port map (D(10), reloj, '1', '1', control_Resultado ,Q(10));
FF12: dffe port map (D(11), reloj,  '1', '1', control_Resultado ,Q(11));
FF13: dffe port map (D(12), reloj, '1', '1', control_Resultado ,Q(12));
FF14: dffe port map (D(13), reloj,  '1', '1', control_Resultado ,Q(13));
FF15: dffe port map (D(14), reloj,  '1', '1', control_Resultado ,Q(14));
FF16: dffe port map (D(15), reloj,  '1', '1', control_Resultado ,Q(15));

Resultado_Respuesta <= Q;
Resultado_ResultadoCero <= Q;

End ResultadoArch;