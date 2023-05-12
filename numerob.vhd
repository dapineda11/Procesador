library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity NumeroB is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		Control_NumeroB				      : in std_logic;
		NumeroB_CA_2				: out std_logic_vector(15 downto 0);
		N2									: in std_logic_vector (15 downto 0);
		NumeroB_operacioneslogicas				: out std_logic_vector(15 downto 0);
		NumeroB_Registro_NumB				       : out std_logic_vector(7 downto 0);
		overflow_multiplicacion: out std_logic
				
	);
	end entity NumeroB;     

architecture NumeroBArch of NumeroB is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E : std_logic;
begin 

D(0)<= N2(0);
D(1)<= N2(1);
D(2)<= N2(2);
D(3)<= N2(3);
D(4)<= N2(4);
D(5)<= N2(5);
D(6)<= N2(6);
D(7)<= N2(7);
D(8)<= N2(8);
D(9)<= N2(9);
D(10)<= N2(10);
D(11)<= N2(11);
D(12)<= N2(12);
D(13)<= N2(13);
D(14)<= N2(14);
D(15)<= N2(15);




FF1: dffe port map (D(0), reloj, Reset, '1',  control_NumeroB ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', control_NumeroB ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_NumeroB ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_NumeroB ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', control_NumeroB ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', control_NumeroB ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', control_NumeroB ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', control_NumeroB ,Q(7));
FF9: dffe port map (D(8), reloj, Reset, '1', control_NumeroB ,Q(8));
FF10: dffe port map (D(9), reloj, Reset, '1', control_NumeroB ,Q(9));
FF11: dffe port map (D(10), reloj, Reset, '1', control_NumeroB ,Q(10));
FF12: dffe port map (D(11), reloj, Reset, '1', control_NumeroB ,Q(11));
FF13: dffe port map (D(12), reloj, Reset, '1', control_NumeroB ,Q(12));
FF14: dffe port map (D(13), reloj, Reset, '1', control_NumeroB ,Q(13));
FF15: dffe port map (D(14), reloj, Reset, '1', control_NumeroB ,Q(14));
FF16: dffe port map (D(15), reloj, Reset, '1', control_NumeroB ,Q(15));

NumeroB_CA_2 <= Q;
NumeroB_operacioneslogicas <= Q;
NumeroB_Registro_NumB(0) <= q(0);
NumeroB_Registro_NumB(1) <= q(1);
NumeroB_Registro_NumB(2) <= q(2);
NumeroB_Registro_NumB(3) <= q(3);
NumeroB_Registro_NumB(4) <= q(4);
NumeroB_Registro_NumB(5) <= q(5);
NumeroB_Registro_NumB(6) <= q(6);
NumeroB_Registro_NumB(7) <= q(7);
overflow_multiplicacion <= q(8) or q(9) or q(10) or q(11) or q(12) or q(13) or q(14) or q(15);
End NumeroBArch;