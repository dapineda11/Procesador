library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

entity UnidaddeControl is
port(
		
		Reinicio 						: in std_logic;
		Ya_Pues 						: in std_logic;
		Reloj							: in std_logic;
		
      Unterbrechung          : in std_logic;
      SR_UnidaddeControl                	: in std_logic_vector (2 downto 0);
      Disponibilidad                  : in std_logic;
		UnidaddeControl_IR 	             	: out std_logic_vector(2 downto 0);
		UnidaddeControl_DR                   : out std_logic_vector(6 downto 0);
		UnidaddeControl_AC                   : out std_logic_vector(2 downto 0);
		UnidaddeControl_AR					      : OUT std_logic_vector(4 downto 0);
		UnidaddeControl_PC              		: OUT std_logic_vector(3 downto 0);
      UnidaddeControl_SP             		: OUT std_logic_vector(2 downto 0);
      UnidaddeControl_SR			            : out std_logic_vector(4 downto 0);
		UnidaddeControl_ALU                  : out std_logic;
		UnidaddeControl_ROM                  : out std_logic;
		
		
		UnidaddeControl_RWM                  : out std_logic_vector(1 downto 0);
		ROM_DATO                         : in std_logic_vector(15 downto 0);
		Reset 	 			   			 : out std_logic
	
	);
	end entity UnidaddeControl;     

architecture UnidaddeControlArch of UnidaddeControl is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
			
end component;
signal Q : std_logic_vector (57 downto 0);
signal D : std_logic_vector (57 downto 0);
signal IR_UnidaddeControl                   : std_logic_vector (6 downto 0);
signal E, OP,rst : std_logic;
begin 
IR_UnidaddeControl (0)	        <= ROM_DATO(9);
IR_UnidaddeControl (1)	        <= ROM_DATO(10);
IR_UnidaddeControl (2)	        <= ROM_DATO(11);
IR_UnidaddeControl (3)	        <= ROM_DATO(12);
IR_UnidaddeControl (4)	        <= ROM_DATO(13);
IR_UnidaddeControl (5)	        <= ROM_DATO(14);
IR_UnidaddeControl (6)	        <= ROM_DATO(15);


D(0)<= (not Ya_Pues and Q(0)) or   Reinicio; 
D(1)<= (Ya_Pues ANd Q(0))or (not SR_UnidaddeControl(2) and Unterbrechung AND Q(52)) or (not SR_UnidaddeControl(2) and not Unterbrechung AND Q(52)) or (SR_UnidaddeControl(2) and not Unterbrechung AND Q(52)) OR (not SR_UnidaddeControl(2) and Unterbrechung AND Q(54)) or (not SR_UnidaddeControl(2) and not Unterbrechung AND Q(54)) or (SR_UnidaddeControl(2) and not Unterbrechung AND Q(54));
D(2)<= Q(1);
D(3)<= Q(2);
D(4)<= ((NOT IR_UnidaddeControl(1) AND NOT IR_UnidaddeControl(0) AND Q(3)));
D(5)<= (( IR_UnidaddeControl(1) AND NOT IR_UnidaddeControl(0) AND Q(3)));
D(6)<= Q(5) OR Q(13);
D(7)<= Q(6) AND OP;
D(8)<= Q(7);
D(9)<= Q(8);
D(10)<= (( IR_UnidaddeControl(1) AND IR_UnidaddeControl(0) AND Q(3)));
D(11)<= Q(10);
D(12)<= Q(11);
D(13)<= Q(12);
D(14)<= Q(4) OR Q(9);
D(15)<= (NOT Disponibilidad AND Q(15)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT  IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14)) OR (NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(14)); 
D(16)<= (NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(14));
D(17)<= (( NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)));
D(18)<= Q(17);
D(19)<= Q(18);
D(20)<= (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)) OR (SR_UnidaddeControl(0) AND Q(21)) OR (NOT SR_UnidaddeControl(1) AND Q(22)) OR (SR_UnidaddeControl(1) AND Q(23)));
D(21)<= (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(6)));
D(22)<= (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)));
D(23)<= (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(6)));
D(24)<= q(55);
D(25)<= Q(24) OR Q(53);
D(26)<= Q(25);
D(27)<= Q(26);
D(28)<= Q(27);
D(29)<= Q(28);
D(30)<= Q(29);
D(31)<= Q(30);
d(32)<= Q(31);
D(33)<= ((NOT IR_UnidaddeControl(1) AND IR_UnidaddeControl(0) AND Q(3)));
D(34)<= (NOT  IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(33)) OR (NOT Unterbrechung AND Q(34));
D(35)<= (NOT  IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(33)) OR ((IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(33)));
D(36)<= Q(35);
D(37)<= Q(36);
D(38)<= Q(37); 
D(39)<= Q(38);
D(40)<= Q(39);
D(41)<= Q(40);
D(42)<= Q(41);
D(43)<= Q(42);
D(44)<= ((IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(33)));
D(45)<= Q(44);
D(46)<= Q(45);
D(47)<= ((IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(33)));
D(48)<= Q(47);
D(49)<= Q(48);
D(50)<= ((IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(33)));
D(51)<= ((IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(33)));
D(52)<= Q(51) OR Q(50) OR Q(49) OR Q(46) OR q(57) or (Q(34) AND Unterbrechung) OR Q(20) OR Q(19) or (Q(21) and not SR_UnidaddeControl(0)) OR (Q(22)and SR_UnidaddeControl(1) ) OR (Q(23)and not SR_UnidaddeControl(1) ) OR Q(32) OR Q(16);
D(53)<= (SR_UnidaddeControl(2) and Unterbrechung AND Q(52))OR(SR_UnidaddeControl(2) and Unterbrechung AND Q(54));
D(54)<= (Disponibilidad AND Q(15))  ;
D(55)<= (( NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(6)));
D(56)<=  Q(43) ;
D(57)<= q(56);
OP <= NOT((( NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)))OR (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)))OR (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(6)))OR (( IR_UnidaddeControl(6) AND NOT IR_UnidaddeControl(5) AND NOT IR_UnidaddeControl(4) AND IR_UnidaddeControl(3) AND NOT IR_UnidaddeControl(2) AND Q(6)))OR (( NOT IR_UnidaddeControl(6) AND IR_UnidaddeControl(5) AND IR_UnidaddeControl(4) AND NOT IR_UnidaddeControl(3) AND IR_UnidaddeControl(2) AND Q(6))));
rst<= not Reinicio;

FF1: dffe port map (D(0), reloj, '1', rst, '1' ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', '1' ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', '1' ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', '1' ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', '1' ,Q(4));
FF6: dffe port map (D(5), reloj, rst, '1', '1' ,Q(5));
FF7: dffe port map (D(6), reloj, rst, '1', '1' ,Q(6));
FF8: dffe port map (D(7), reloj,  rst, '1', '1' ,Q(7));
FF9: dffe port map (D(8), reloj, rst, '1', '1' ,Q(8));
FF10: dffe port map (D(9), reloj, rst, '1', '1' ,Q(9));
FF11: dffe port map (D(10), reloj,rst, '1', '1' ,Q(10));
FF12: dffe port map (D(11), reloj, rst, '1', '1' ,Q(11));
FF13: dffe port map (D(12), reloj, rst, '1', '1' ,Q(12));
FF14: dffe port map (D(13), reloj, rst, '1', '1' ,Q(13));
FF15: dffe port map (D(14), reloj, rst, '1', '1' ,Q(14));
FF16: dffe port map (D(15), reloj, rst, '1', '1' ,Q(15));
FF17: dffe port map (D(16), reloj, rst, '1', '1' ,Q(16));
FF18: dffe port map (D(17), reloj, rst, '1', '1' ,Q(17));
FF19: dffe port map (D(18), reloj, rst, '1', '1' ,Q(18));
FF20: dffe port map (D(19), reloj, rst, '1', '1' ,Q(19));
FF21: dffe port map (D(20), reloj, rst, '1', '1' ,Q(20));
FF22: dffe port map (D(21), reloj, rst, '1', '1' ,Q(21));
FF23: dffe port map (D(22), reloj, rst, '1', '1' ,Q(22));
FF24: dffe port map (D(23), reloj, rst, '1', '1' ,Q(23));
FF25: dffe port map (D(24), reloj, rst, '1', '1' ,Q(24));
FF26: dffe port map (D(25), reloj, rst, '1', '1' ,Q(25));
FF27: dffe port map (D(26), reloj, rst, '1', '1' ,Q(26));
FF28: dffe port map (D(27), reloj, rst, '1', '1' ,Q(27));
FF29: dffe port map (D(28), reloj, rst, '1', '1' ,Q(28));
FF30: dffe port map (D(29), reloj, rst, '1', '1' ,Q(29));
FF31: dffe port map (D(30), reloj, rst, '1', '1' ,Q(30));
FF32: dffe port map (D(31), reloj, rst, '1', '1' ,Q(31));
FF33: dffe port map (D(32), reloj, rst, '1', '1' ,Q(32));
FF34: dffe port map (D(33), reloj, rst, '1', '1' ,Q(33));
FF35: dffe port map (D(34), reloj, rst, '1', '1' ,Q(34));
FF36: dffe port map (D(35), reloj, rst, '1', '1' ,Q(35));
FF37: dffe port map (D(36), reloj, rst, '1', '1' ,Q(36));
FF38: dffe port map (D(37), reloj, rst, '1', '1' ,Q(37));
FF39: dffe port map (D(38), reloj, rst, '1', '1' ,Q(38));
FF40: dffe port map (D(39), reloj, rst, '1', '1' ,Q(39));
FF41: dffe port map (D(40), reloj, rst, '1', '1' ,Q(40));
FF42: dffe port map (D(41), reloj, rst, '1', '1' ,Q(41));
FF43: dffe port map (D(42), reloj, rst, '1', '1' ,Q(42));
FF44: dffe port map (D(43), reloj, rst, '1', '1' ,Q(43));
FF45: dffe port map (D(44), reloj, rst, '1', '1' ,Q(44));
FF46: dffe port map (D(45), reloj, rst, '1', '1' ,Q(45));
FF47: dffe port map (D(46), reloj, rst, '1', '1' ,Q(46));
FF48: dffe port map (D(47), reloj, rst, '1', '1' ,Q(47));
FF49: dffe port map (D(48), reloj, rst, '1', '1' ,Q(48));
FF50: dffe port map (D(49), reloj, rst, '1', '1' ,Q(49));
FF51: dffe port map (D(50), reloj, rst, '1', '1' ,Q(50));
FF52: dffe port map (D(51), reloj, rst, '1', '1' ,Q(51));
FF53: dffe port map (D(52), reloj, rst, '1', '1' ,Q(52));
FF54: dffe port map (D(53), reloj, rst, '1', '1' ,Q(53));
FF55: dffe port map (D(54), reloj, rst, '1', '1' ,Q(54));
FF56: dffe port map (D(55), reloj, rst, '1', '1' ,Q(55));
FF57: dffe port map (D(56), reloj, rst, '1', '1' ,Q(56));
FF58: dffe port map (D(57), reloj, rst, '1', '1' ,Q(57));

UnidaddeControl_IR(2)  <= Q(3) OR Q(49);
UnidaddeControl_IR(1)  <= Q(49);
UnidaddeControl_IR(0)  <= Q(3);

UnidaddeControl_DR(6)  <= Q(4) OR Q(5) OR Q(9) OR Q(13) OR Q(17)OR Q(24) OR Q(27) OR Q(30) OR Q(37) OR Q(41) OR Q(56) OR Q(44) OR Q(49) OR Q(53);
UnidaddeControl_DR(5)  <= Q(44);
UnidaddeControl_DR(4)  <= Q(4) OR Q(5);
UnidaddeControl_DR(3)  <= Q(9) OR Q(13) OR Q(37) OR Q(41) OR Q(56) OR Q(49) ;
UnidaddeControl_DR(2)  <= Q(24) OR Q(53);
UnidaddeControl_DR(1)  <= Q(17) OR Q(27);
UnidaddeControl_DR(0)  <= Q(30);
 
UnidaddeControl_AC(2)  <= Q(16) OR Q(42) OR Q(54);
UnidaddeControl_AC(1)  <= Q(42) OR Q(16);
UnidaddeControl_AC(0)  <= Q(54);
                  
UnidaddeControl_AR(4)  <= Q(6) OR Q(10) OR Q(24) OR Q(27) OR Q(30) OR Q(35) OR Q(38) OR Q(41) OR Q(44) OR Q(47) OR Q(53) ;
UnidaddeControl_AR(3)  <= Q(10) ;
UnidaddeControl_AR(2)  <= Q(6) ;
UnidaddeControl_AR(1)  <= Q(24) OR Q(27) OR Q(30) OR Q(35) OR Q(38) OR Q(41) OR Q(44) OR Q(47) OR Q(53);
UnidaddeControl_AR(0)  <= '0';
					   
UnidaddeControl_PC(3)  <= Q(53);
UnidaddeControl_PC(2)  <= Q(20) OR Q(24);
UnidaddeControl_PC(1)  <= Q(57);
UnidaddeControl_PC(0)  <= q(3) OR  Q(57) OR Q(20) OR Q(24) OR Q(53);

UnidaddeControl_SP(2)  <= Q(55) or q(53) ;             		
UnidaddeControl_SP(1)  <= Q(26)OR Q(29) OR Q(37) OR Q(40) OR Q(44) OR Q(49) or Q(55)  or q(53);
UnidaddeControl_SP(0)  <= Q(37) OR Q(40)OR Q(49) ;

UnidaddeControl_SR(4)  <= Q(53);	           		
UnidaddeControl_SR(3)  <= Q(50);	
UnidaddeControl_SR(2)  <= Q(15) OR Q(38) or Q(50) ;
UnidaddeControl_SR(1)  <= Q(15);
UnidaddeControl_SR(0)  <= Q(38);
		           
UnidaddeControl_ALU    <= Q(15);
 
UnidaddeControl_ROM    <= Q(1) OR Q(2) OR Q(3);
                 
UnidaddeControl_RWM(1) <= Q(18) OR Q(19) OR Q(25) OR Q(26) OR Q(28) OR Q(29) OR Q(31) OR Q(32) OR Q(45) OR Q(46);    
UnidaddeControl_RWM(0) <= Q(7) OR Q(8) OR Q(9) OR Q(11) OR Q(12) OR Q(13) OR Q(35) OR Q(36) OR Q(37) OR Q(38) OR Q(39) OR Q(40) OR Q(41) OR Q(42) OR Q(43) OR Q(47) OR Q(48) OR Q(49);            

Reset <= q(15);
End UnidaddeControlArch;