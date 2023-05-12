library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity AR is
port(
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_AR				                  : in std_logic_vector(4 downto 0);
		IR_AR                            : in std_logic_vector(8 downto 0);
		DR_AR                            : in std_logic_vector(9 downto 0);
		SP_AR                            : in std_logic_vector(9 downto 0);
		AR_PC				                  : out std_logic_vector(9 downto 0);
		Direccion_RWM				         : out std_logic_vector(9 downto 0)
				
	);
	end entity AR;     

architecture ARArch of AR is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (9 downto 0);
signal D : std_logic_vector (9 downto 0);
signal E,rst : std_logic;
begin 

D(0)<= (IR_AR(0) AND UnidaddeControl_AR(3)) OR (DR_AR(0) AND UnidaddeControl_AR(2)) OR (SP_AR(0) AND UnidaddeControl_AR(1));
D(1)<= (IR_AR(1) AND UnidaddeControl_AR(3)) OR (DR_AR(1) AND UnidaddeControl_AR(2)) OR (SP_AR(1) AND UnidaddeControl_AR(1));
D(2)<= (IR_AR(2) AND UnidaddeControl_AR(3)) OR (DR_AR(2) AND UnidaddeControl_AR(2)) OR (SP_AR(2) AND UnidaddeControl_AR(1));
D(3)<= (IR_AR(3) AND UnidaddeControl_AR(3)) OR (DR_AR(3) AND UnidaddeControl_AR(2)) OR (SP_AR(3) AND UnidaddeControl_AR(1));
D(4)<= (IR_AR(4) AND UnidaddeControl_AR(3)) OR (DR_AR(4) AND UnidaddeControl_AR(2)) OR (SP_AR(4) AND UnidaddeControl_AR(1));
D(5)<= (IR_AR(5) AND UnidaddeControl_AR(3)) OR (DR_AR(5) AND UnidaddeControl_AR(2)) OR (SP_AR(5) AND UnidaddeControl_AR(1));
D(6)<= (IR_AR(6) AND UnidaddeControl_AR(3)) OR (DR_AR(6) AND UnidaddeControl_AR(2)) OR (SP_AR(6) AND UnidaddeControl_AR(1));
D(7)<= (IR_AR(7) AND UnidaddeControl_AR(3)) OR (DR_AR(7) AND UnidaddeControl_AR(2)) OR (SP_AR(7) AND UnidaddeControl_AR(1));
D(8)<= (IR_AR(8) AND UnidaddeControl_AR(3)) OR (DR_AR(8) AND UnidaddeControl_AR(2)) OR (SP_AR(8) AND UnidaddeControl_AR(1));
D(9)<=                            (DR_AR(9) AND UnidaddeControl_AR(2)) OR (SP_AR(9) AND UnidaddeControl_AR(1));
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(6));
FF8: dffe port map (D(7), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', UnidaddeControl_AR(4) ,Q(8));
FF10: dffe port map (D(9), reloj,rst, '1', UnidaddeControl_AR(4) ,Q(9));


AR_PC	           <= Q;			                  
Direccion_RWM    <= Q;			         


End ARArch;