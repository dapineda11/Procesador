library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Control_Boothsaurus is
port(
		
		Reset 						: in std_logic;
		Reloj							: in std_logic;
		UnidaddeControl_ALU                   : in std_LOGIC;
		  control_contador    : OUT STD_LOGIC;
		  control_Registro_CA_2                  :OUT std_logic;
		  control_NumeroB                  :OUT std_logic;
		  control_NumeroA                  : OUT std_logic ;
        cnt_control: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		  controlMult	: out std_logic_vector(2 downto 0);
cond : in  std_logic_vector (1 downto 0);
SELECTOR_SUMADOR : OUT STD_logic_vector (1 DOWNTO 0);
fin_conteo : in std_LOGIC;
CONTROL_RESP : OUT STD_LOGIC;
habilitado: out std_logic;
UnidaddeControl_CONTROL : in std_LOGIC
	
		
      
		

		
	);
	end entity Control_Boothsaurus;     

architecture Control_BoothsaurusArch of Control_Boothsaurus is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
			
end component;
signal Q : std_logic_vector (7 downto 0);
signal D : std_logic_vector (7 downto 0);
signal E : std_logic;
begin 

D(0)<= ( not UnidaddeControl_ALU AND Q(0)) or q(7)  ;
D(1)<= (Q(0) and UnidaddeControl_ALU);
D(2)<= (q(1)) or (not fin_conteo and q(5));
D(3)<= Q(2)and cond(1) and not cond(0) ;
D(4)<= Q(2) and not cond(1) and cond(0);
D(5)<= q(4) or q(3) or (not cond(1) and not cond(0) and q(2)) or ( cond(1) and cond(0) and q(2));
d(6)<= ( fin_conteo and q(5));
d(7)<= q(6);





FF1: dffe port map (D(0), reloj, '1', reset, UnidaddeControl_CONTROL ,Q(0));
FF2: dffe port map (D(1), reloj, reset, '1', UnidaddeControl_CONTROL ,Q(1));
FF3: dffe port map (D(2), reloj, reset, '1', UnidaddeControl_CONTROL ,Q(2));
FF4: dffe port map (D(3), reloj, reset, '1', UnidaddeControl_CONTROL ,Q(3));
FF5: dffe port map (D(4), reloj,reset, '1', UnidaddeControl_CONTROL ,Q(4));
FF6: dffe port map (D(5), reloj, reset, '1', UnidaddeControl_CONTROL ,Q(5));
FF7: dffe port map (D(6), reloj,reset, '1', UnidaddeControl_CONTROL ,Q(6));
FF8: dffe port map (D(7), reloj, reset, '1', UnidaddeControl_CONTROL ,Q(7));

control_contador <= Q(5);
control_Registro_CA_2 <= Q(2);
control_NumeroB <=Q(1) ;
control_NumeroA <= q(1)OR Q(3) OR Q(4) or q(5) ;

SELECTOR_SUMADOR(1)<= Q(4);
SELECTOR_SUMADOR(0)<= Q(3);
controlMult(0)<= q(1);
controlMult(1)<= q(3) or q(4);
controlMult(2)<= q(5);
CONTROL_RESP<= fin_conteo and q(5);
habilitado <= q(7);
End Control_BoothsaurusArch;