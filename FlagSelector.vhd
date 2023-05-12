library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity FlagSelector is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		ResultadoCero_FlagSelector				: in std_logic;
		Banderas						    		: out std_logic_vector(3 downto 0);
		Operaciones_FlagSelector			: in std_logic_vector(3 downto 0);
		Desplazamiento_Rotacion_FlagSelector	: in std_logic;
		
		Sumador_FlagSelector			: in std_logic_vector (2 downto 0);
		Control_FlagSelector			: in std_logic;
		FlagSelector_Sumador			: OUT std_logic_vector (2 downto 0);
		NEGativo_Boothasaurus_Rex	       : in std_logic;
		CERO_MULT                      : in  std_logic;
		overflow_multiplicacion: IN std_logic;
		overflow_multiplicacion_A: IN std_logic
	
				
	);
	end entity FlagSelector;     

architecture FlagSelectorArch of FlagSelector is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (3 downto 0);
signal D,ena : std_logic_vector (3 downto 0);
signal M : std_logic_vector (9 downto 0);
signal E,O : std_logic;
begin 

O <= overflow_multiplicacion OR overflow_multiplicacion_A;
M(0)<=  Operaciones_FlagSelector(0)and not Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(1)<= not Operaciones_FlagSelector(0)and  Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(2)<=Operaciones_FlagSelector(0)and Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(3)<= not Operaciones_FlagSelector(0)and not Operaciones_FlagSelector(1)and  Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(4)<= Operaciones_FlagSelector(0)and  not Operaciones_FlagSelector(1)and Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(5)<=not Operaciones_FlagSelector(0)and Operaciones_FlagSelector(1)and Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(6)<=Operaciones_FlagSelector(0)and Operaciones_FlagSelector(1)and Operaciones_FlagSelector(2)and not Operaciones_FlagSelector(3);
M(7)<= not Operaciones_FlagSelector(0)and not Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and Operaciones_FlagSelector(3);
M(8)<=Operaciones_FlagSelector(0)and not Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and Operaciones_FlagSelector(3);
M(9)<=not Operaciones_FlagSelector(0)and Operaciones_FlagSelector(1)and not Operaciones_FlagSelector(2)and Operaciones_FlagSelector(3);

D(0)<= Desplazamiento_Rotacion_FlagSelector or Sumador_FlagSelector(0) or (NEGativo_Boothasaurus_Rex and m(4));
D(1)<= Sumador_FlagSelector(1) ;
D(2)<= Sumador_FlagSelector(2) OR (O AND M(4));
D(3)<= ResultadoCero_FlagSelector or (CERO_MULT and m(4)) ;

ena(0)<=  (M(0)or M(1)or M(2)or M(3) or M(4)or M(8)or M(9)) and Control_FlagSelector ;
ena(1)<= (M(0)or M(1)) and Control_FlagSelector;
ena(2)<= (M(0)or M(1)or M(2)     or M(4)) and Control_FlagSelector;
ena(3)<= (M(0)or M(1)or M(2)or M(3) or M(4)or M(5)or M(6)or M(7)or M(8)or M(9)) and Control_FlagSelector;
FF1: dffe port map (D(0), reloj, '1','1', ena(0) ,Q(0));
FF2: dffe port map (D(1), reloj, '1', '1',ena(1)  ,Q(1));
FF3: dffe port map (D(2), reloj, '1', '1',ena(2)  ,Q(2));
FF4: dffe port map (D(3), reloj, '1', '1',ena(3)  ,Q(3));

Banderas <= Q;
FlagSelector_Sumador(1)<= Q(1);

End FlagSelectorArch;