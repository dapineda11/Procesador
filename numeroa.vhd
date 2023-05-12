
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity NumeroA is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		Control_NumeroA				      : in std_logic;
		NumeroA_Sumador				  	   : out std_logic_vector(15 downto 0);
		N1									: in std_logic_vector (15 downto 0);
		NumeroA_Desplazamiento_Rotacion				  	   : out std_logic_vector(15 downto 0);
		NumeroA_operacioneSlogicas				  	   : out std_logic_vector(15 downto 0);
		N1_Boothasaurus_Rex			 : out std_logic_vector(7 downto 0);
		overflow_multiplicacion_A: out std_logic
				
	);
	end entity NumeroA;     

architecture NumeroAArch of NumeroA is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (15 downto 0);
signal D : std_logic_vector (15 downto 0);
signal E : std_logic;
begin 

D(0)<= N1(0);
D(1)<= N1(1);
D(2)<= N1(2);
D(3)<= N1(3);
D(4)<= N1(4);
D(5)<= N1(5);
D(6)<= N1(6);
D(7)<= N1(7);
D(8)<= N1(8);
D(9)<= N1(9);
D(10)<= N1(10);
D(11)<= N1(11);
D(12)<= N1(12);
D(13)<= N1(13);
D(14)<= N1(14);
D(15)<= N1(15);




FF1: dffe port map (D(0), reloj, Reset, '1', control_NumeroA ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', control_NumeroA ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_NumeroA ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_NumeroA ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', control_NumeroA ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', control_NumeroA ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', control_NumeroA ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', control_NumeroA ,Q(7));
FF9: dffe port map (D(8), reloj, Reset, '1', control_NumeroA ,Q(8));
FF10: dffe port map (D(9), reloj, Reset, '1', control_NumeroA ,Q(9));
FF11: dffe port map (D(10), reloj, Reset, '1', control_NumeroA ,Q(10));
FF12: dffe port map (D(11), reloj, Reset, '1', control_NumeroA ,Q(11));
FF13: dffe port map (D(12), reloj, Reset, '1', control_NumeroA ,Q(12));
FF14: dffe port map (D(13), reloj, Reset, '1', control_NumeroA ,Q(13));
FF15: dffe port map (D(14), reloj, Reset, '1', control_NumeroA ,Q(14));
FF16: dffe port map (D(15), reloj, Reset, '1', control_NumeroA ,Q(15));

NumeroA_Sumador <= Q;
NumeroA_Desplazamiento_Rotacion	 <= Q;			  	   
NumeroA_operacioneSlogicas <= Q;	
N1_Boothasaurus_Rex(0)<= q(0);
N1_Boothasaurus_Rex(1)<= q(1);
N1_Boothasaurus_Rex(2)<= q(2);
N1_Boothasaurus_Rex(3)<= q(3);
N1_Boothasaurus_Rex(4)<= q(4);
N1_Boothasaurus_Rex(5)<= q(5);
N1_Boothasaurus_Rex(6)<= q(6);
N1_Boothasaurus_Rex(7)<= q(7);
overflow_multiplicacion_A <= q(8) or q(9) or q(10) or q(11) or q(12) or q(13) or q(14) or q(15);
End NumeroAArch;