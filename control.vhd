library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity control is
port(
		
		Reset 						: in std_logic;
		UnidaddeControl_ALU 		: in std_logic;
		Reloj							: in std_logic;
		Control_NumeroA         : out std_logic;
      Control_NumeroB         : out std_logic;
      Control_Resultado     	: out std_logic;
      Control_Contador        : out std_logic;
		OP_UnidaddeControl		             	: in std_logic_vector(3 downto 0);
		Control_Desplazamiento_Rotacion                    : out std_logic_vector(1 downto 0);
		control_operaciones					: OUT std_logic;

Control_FlagSelector			: out std_logic;
disponibilidad: out std_logic;
control_Corretaje :out std_logic;
control_suma :out std_LOGIC_vector(1 downto 0);
control_sumas_Corretaje :OUT std_LOGIC;
habilitado: in std_logic;
UnidaddeControl_CONTROL                     : out std_LOGIC
	
		
      
		

		
	);
	end entity control;     

architecture ControlArch of Control is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
			
end component;
signal Q : std_logic_vector (33 downto 0);
signal D : std_logic_vector (33 downto 0);
signal E : std_logic;
begin 

D(0)<= ((not UnidaddeControl_ALU and Q(0)) or(not OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and OP_UnidaddeControl(0)) OR (not OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and not OP_UnidaddeControl(0)) or (OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and OP_UnidaddeControl(0)) or ( OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) ) or ( OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and OP_UnidaddeControl(0) ) or (OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and  OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) ) or (OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and  OP_UnidaddeControl(1) and OP_UnidaddeControl(0) )) OR Q(33) ;
D(1)<= (UnidaddeControl_ALU ANd Q(0));
D(2)<= Q(1);
D(3)<= (not OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and OP_UnidaddeControl(0) and Q(2));
D(4)<= (Q(3));
D(5)<= Q(4);
D(6)<=  (not OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) and Q(2));
D(7)<= Q(6);
D(8)<= Q(7);
D(9)<= (not OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and OP_UnidaddeControl(0)) and Q(2); 
D(10)<= (Q(9));
D(11)<= Q(10);
D(12)<= Q(11);
D(13)<= (not OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) and Q(2)); 
D(14)<= Q(13);
D(15)<= Q(14);
D(16)<= Q(15) ;
D(17)<= ((not OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) and Q(2)));
D(18)<= Q(17);
D(19)<= Q(18);
D(20)<= ((not OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and OP_UnidaddeControl(0) and Q(2)) );
D(21)<= Q(20);
D(22)<= Q(21);
D(23)<= ((OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) and Q(2)) );
D(24)<= Q(23);
D(25)<= Q(24);
D(26)<= ((OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and OP_UnidaddeControl(0) and Q(2)));
D(27)<= Q(26);
D(28)<= Q(27);
D(29)<= ((OP_UnidaddeControl(3)and not OP_UnidaddeControl(2) and OP_UnidaddeControl(1) and not OP_UnidaddeControl(0) and Q(2)) );
D(30)<= Q(29);
D(31)<= Q(30);
d(32)<=(not OP_UnidaddeControl(3)and OP_UnidaddeControl(2) and not OP_UnidaddeControl(1) and OP_UnidaddeControl(0) and Q(1));
d(33)<=(q(5) or Q(8))or (Q(12))or ( Q(16))or ( Q(19))or (Q(22))or ( Q(25))or ( Q(28))or ( Q(31)) ;


FF1: dffe port map (D(0), reloj, '1', Reset, '1' ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', '1' ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', '1' ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', '1' ,Q(3));
FF5: dffe port map (D(4), reloj, Reset, '1', '1' ,Q(4));
FF6: dffe port map (D(5), reloj, Reset, '1', '1' ,Q(5));
FF7: dffe port map (D(6), reloj, Reset, '1', '1' ,Q(6));
FF8: dffe port map (D(7), reloj, Reset, '1', '1' ,Q(7));
FF9: dffe port map (D(8), reloj, Reset, '1', '1' ,Q(8));
FF10: dffe port map (D(9), reloj, Reset, '1', '1' ,Q(9));
FF11: dffe port map (D(10), reloj, Reset, '1', '1' ,Q(10));
FF12: dffe port map (D(11), reloj, Reset, '1', '1' ,Q(11));
FF13: dffe port map (D(12), reloj, Reset, '1', '1' ,Q(12));
FF14: dffe port map (D(13), reloj, Reset, '1', '1' ,Q(13));
FF15: dffe port map (D(14), reloj, Reset, '1', '1' ,Q(14));
FF16: dffe port map (D(15), reloj, Reset, '1', '1' ,Q(15));
FF17: dffe port map (D(16), reloj, Reset, '1', '1' ,Q(16));
FF18: dffe port map (D(17), reloj, Reset, '1', '1' ,Q(17));
FF19: dffe port map (D(18), reloj, Reset, '1', '1' ,Q(18));
FF20: dffe port map (D(19), reloj, Reset, '1', '1' ,Q(19));
FF21: dffe port map (D(20), reloj, Reset, '1', '1' ,Q(20));
FF22: dffe port map (D(21), reloj, Reset, '1', '1' ,Q(21));
FF23: dffe port map (D(22), reloj, Reset, '1', '1' ,Q(22));
FF24: dffe port map (D(23), reloj, Reset, '1', '1' ,Q(23));
FF25: dffe port map (D(24), reloj, Reset, '1', '1' ,Q(24));
FF26: dffe port map (D(25), reloj, Reset, '1', '1' ,Q(25));
FF27: dffe port map (D(26), reloj, Reset, '1', '1' ,Q(26));
FF28: dffe port map (D(27), reloj, Reset, '1', '1' ,Q(27));
FF29: dffe port map (D(28), reloj, Reset, '1', '1' ,Q(28));
FF30: dffe port map (D(29), reloj, Reset, '1', '1' ,Q(29));
FF31: dffe port map (D(30), reloj, Reset, '1', '1' ,Q(30));
FF32: dffe port map (D(31), reloj, Reset, '1', '1' ,Q(31));
FF33: dffe port map (D(32), reloj, Reset, '1', '1' ,Q(32));
FF34: dffe port map (D(33), reloj, Reset, '1', '1' ,Q(33));

Control_NumeroA <= (Q(1) );
Control_NumeroB <= (Q(1) ); 
Control_Resultado	<= ( Q(4) OR Q(7) or Q(11)OR Q(15) or Q(18) OR Q(21) OR Q(24) or Q(26) OR Q(29) or q(32) );-- Q(1) OR Q(2) OR Q(3) OR

Control_Desplazamiento_Rotacion(0) <= Q(26);   
Control_Desplazamiento_Rotacion(1) <= Q(29);                
control_operaciones <= Q(1);
control_suma(0) <= q(3) or q(4) or q(5) or q(6) or q(7) or q(8);
control_suma(1) <= q(9) or q(10) or q(11) or q(12) or q(13) or q(14)or q(15) or q(16);
disponibilidad<= q(33) or habilitado;
control_Corretaje <=Q(7);
control_sumas_Corretaje <=  Q(2) OR Q(3) OR Q(4) OR Q(5);
Control_FlagSelector <= (Q(4) OR Q(7) or Q(11)OR Q(15) or Q(18) OR Q(21) OR Q(24) or Q(27) OR Q(30) or q(32) );
UnidaddeControl_CONTROL            <= q(32) ;
End ControlArch;