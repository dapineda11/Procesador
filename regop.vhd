
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;



entity regop is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		N1_Boothasaurus_Rex				: in std_logic_vector(7 downto 0);
		Sumar_A			               	: in std_logic_vector(7 downto 0);
		control_NumeroA                  : in std_logic ;
		A_Sumar			               	: OUT std_logic_vector(7 downto 0);
		Boothasaurus_Rex_RESPUESTA				: out std_logic_vector(15 downto 0);
	   controlMult	                     : in std_logic_vector(2 downto 0);
	   cond                             : out  std_logic_vector (1 downto 0)
	);
	end entity regop;     

architecture regopArch of regop is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (16 downto 0);
signal D : std_logic_vector (16 downto 0);
SIGnal MUX : STD_logic_vector(2 downto 0);
signal E : std_logic;
begin 
MUX <=CONtrolmult;

--q-1
D(0)<= '0' or (q(1)AND MUX(2)) or (q(0)AND MUX(1));
--Q
D(1)<= (N1_Boothasaurus_Rex(0)AND MUX(0))or (q(2)AND MUX(2))or (q(1)AND MUX(1));
D(2)<= (N1_Boothasaurus_Rex(1)AND MUX(0))or (q(3)AND MUX(2))or (q(2)AND MUX(1));
D(3)<= (N1_Boothasaurus_Rex(2)AND MUX(0))or (q(4)AND MUX(2))or (q(3)AND MUX(1));
D(4)<= (N1_Boothasaurus_Rex(3)AND MUX(0))or (q(5)AND MUX(2))or (q(4)AND MUX(1));
D(5)<= (N1_Boothasaurus_Rex(4)AND MUX(0))or (q(6)AND MUX(2))or (q(5)AND MUX(1));
D(6)<= (N1_Boothasaurus_Rex(5)AND MUX(0))or (q(7)AND MUX(2))or (q(6)AND MUX(1));
D(7)<= (N1_Boothasaurus_Rex(6)AND MUX(0))or (q(8)AND MUX(2))or (q(7)AND MUX(1));
D(8)<= (N1_Boothasaurus_Rex(7)AND MUX(0))or (q(9)AND MUX(2))or (q(8)AND MUX(1));
--A
D(9)<=  '0'or (Sumar_A(0)AND MUX(1))or (q(10)AND MUX(2));
D(10)<= '0'or (Sumar_A(1)AND MUX(1))or (q(11)AND MUX(2));
D(11)<= '0'or (Sumar_A(2)AND MUX(1))or (q(12)AND MUX(2));
D(12)<= '0'or (Sumar_A(3)AND MUX(1))or (q(13)AND MUX(2));
D(13)<= '0'or (Sumar_A(4)AND MUX(1))or (q(14)AND MUX(2));
D(14)<= '0'or (Sumar_A(5)AND MUX(1))or (q(15)AND MUX(2));
D(15)<= '0'or (Sumar_A(6)AND MUX(1))or (q(16)AND MUX(2));
D(16)<= '0'or (Sumar_A(7)AND MUX(1))or (q(16)AND MUX(2));



--Q-1
FF1: dffe port map (D(0), reloj, Reset, '1', control_NumeroA ,Q(0));
--Q
FF2: dffe port map (D(1), reloj, Reset, '1', control_NumeroA ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_NumeroA ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_NumeroA ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', control_NumeroA ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', control_NumeroA ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', control_NumeroA ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', control_NumeroA ,Q(7));
FF9: dffe port map (D(8), reloj, Reset, '1', control_NumeroA ,Q(8));
--A
FF10: dffe port map (D(9), reloj, Reset, '1', control_NumeroA ,Q(9));
FF11: dffe port map (D(10), reloj, Reset, '1', control_NumeroA ,Q(10));
FF12: dffe port map (D(11), reloj, Reset, '1', control_NumeroA ,Q(11));
FF13: dffe port map (D(12), reloj, Reset, '1', control_NumeroA ,Q(12));
FF14: dffe port map (D(13), reloj, Reset, '1', control_NumeroA ,Q(13));
FF15: dffe port map (D(14), reloj, Reset, '1', control_NumeroA ,Q(14));
FF16: dffe port map (D(15), reloj, Reset, '1', control_NumeroA ,Q(15));
FF17: dffe port map (D(16), reloj, Reset, '1', control_NumeroA ,Q(16));

Boothasaurus_Rex_RESPUESTA(0)<= Q(2);
Boothasaurus_Rex_RESPUESTA(1)<= Q(3);
Boothasaurus_Rex_RESPUESTA(2)<= Q(4);
Boothasaurus_Rex_RESPUESTA(3)<= Q(5);
Boothasaurus_Rex_RESPUESTA(4)<= Q(6);
Boothasaurus_Rex_RESPUESTA(5)<= Q(7);
Boothasaurus_Rex_RESPUESTA(6)<= Q(8);
Boothasaurus_Rex_RESPUESTA(7)<= Q(9);
Boothasaurus_Rex_RESPUESTA(8)<= Q(10);
Boothasaurus_Rex_RESPUESTA(9)<= Q(11);
Boothasaurus_Rex_RESPUESTA(10)<= Q(12);
Boothasaurus_Rex_RESPUESTA(11)<= Q(13);
Boothasaurus_Rex_RESPUESTA(12)<= Q(14);
Boothasaurus_Rex_RESPUESTA(13)<= Q(15);
Boothasaurus_Rex_RESPUESTA(14)<= Q(16);
Boothasaurus_Rex_RESPUESTA(15)<= Q(16);


A_Sumar(0)<=Q(9);
A_Sumar(1)<=Q(10);
A_Sumar(2)<=Q(11);
A_Sumar(3)<=Q(12);
A_Sumar(4)<=Q(13);
A_Sumar(5)<=Q(14);
A_Sumar(6)<=Q(15);
A_Sumar(7)<=Q(16);

cond(1)<= Q(1);
cond(0)<= Q(0);

End regopArch;