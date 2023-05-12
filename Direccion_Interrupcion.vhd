library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Direccion_Interrupcion is
port(
		
		Reinicio										            : in std_logic;
		reloj										            : in std_logic;
		Direccion_Interrupcion_PC				         : out std_logic_vector(9 downto 0)
				
	);
	end entity Direccion_Interrupcion;     

architecture Direccion_InterrupcionArch of Direccion_Interrupcion is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (9 downto 0);
signal D : std_logic_vector (9 downto 0);
signal E,rst : std_logic;
begin 

D(0)<= '0';
D(1)<= '1';
D(2)<= '0';
D(3)<= '1';
D(4)<= '1';
D(5)<= '0';
D(6)<= '1';
D(7)<= '0';
D(8)<= '0';
D(9)<= '0';
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', '1' ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', '1' ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', '1' ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', '1' ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', '1' ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', '1' ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', '1' ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', '1' ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', '1' ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', '1' ,Q(9));


Direccion_Interrupcion_PC <= Q;


End Direccion_InterrupcionArch;