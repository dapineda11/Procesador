library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Registro_NumB is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		NumeroB_Registro_NumB				         : in std_logic_vector(7 downto 0);
		control_NumeroB                  :in std_logic;
		Registro_NumB_sumador				         : out std_logic_vector(7 downto 0)
				
	);
	end entity Registro_NumB;     

architecture Registro_NumBArch of Registro_NumB is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (7 downto 0);
signal D : std_logic_vector (7 downto 0);
signal E : std_logic;
begin 

D(0)<= NumeroB_Registro_NumB(0);
D(1)<= NumeroB_Registro_NumB(1);
D(2)<= NumeroB_Registro_NumB(2);
D(3)<= NumeroB_Registro_NumB(3);
D(4)<= NumeroB_Registro_NumB(4);
D(5)<= NumeroB_Registro_NumB(5);
D(6)<= NumeroB_Registro_NumB(6);
D(7)<= NumeroB_Registro_NumB(7);





FF1: dffe port map (D(0), reloj, Reset, '1',  control_NumeroB ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', control_NumeroB ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_NumeroB ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_NumeroB ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', control_NumeroB ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', control_NumeroB ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', control_NumeroB ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', control_NumeroB ,Q(7));


Registro_NumB_sumador <= Q;


End Registro_NumBArch;