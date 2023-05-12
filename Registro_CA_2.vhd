library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Registro_CA_2 is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		COMPLEMENTOA2_Registro_CA_2				         : in std_logic_vector(7 downto 0);
		control_Registro_CA_2                  :in std_logic;
		Registro_CA_2_sumador				         : out std_logic_vector(7 downto 0)
				
	);
	end entity Registro_CA_2;     

architecture Registro_CA_2Arch of Registro_CA_2 is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (7 downto 0);
signal D : std_logic_vector (7 downto 0);
signal E : std_logic;
begin 

D(0)<= COMPLEMENTOA2_Registro_CA_2(0);
D(1)<= COMPLEMENTOA2_Registro_CA_2(1);
D(2)<= COMPLEMENTOA2_Registro_CA_2(2);
D(3)<= COMPLEMENTOA2_Registro_CA_2(3);
D(4)<= COMPLEMENTOA2_Registro_CA_2(4);
D(5)<= COMPLEMENTOA2_Registro_CA_2(5);
D(6)<= COMPLEMENTOA2_Registro_CA_2(6);
D(7)<= COMPLEMENTOA2_Registro_CA_2(7);





FF1: dffe port map (D(0), reloj, Reset, '1',  control_Registro_CA_2 ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', control_Registro_CA_2 ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_Registro_CA_2 ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_Registro_CA_2 ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', control_Registro_CA_2 ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', control_Registro_CA_2 ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', control_Registro_CA_2 ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', control_Registro_CA_2 ,Q(7));


Registro_CA_2_sumador <= Q;


End Registro_CA_2Arch;