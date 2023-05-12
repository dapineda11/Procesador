library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Operaciones is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		control_operaciones					: in std_logic;
		Operacion				            : in std_logic_vector(3 downto 0);
		OP_UnidaddeControl           				  	   : out std_logic_vector(3 downto 0);
		Operaciones_FlagSelector				            : out std_logic_vector(3 downto 0);
		Operaciones_operacioneslogicas				            : out std_logic_vector(3 downto 0);
		operaciones_sumador : out std_LOGIC_VECTOR (15 downto 0)
		
				
	);
	end entity Operaciones;     

architecture OperacionesArch of Operaciones is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (3 downto 0);
signal D : std_logic_vector (3 downto 0);
signal E : std_logic;
begin 

D(0)<= Operacion(0);
D(1)<= Operacion(1);
D(2)<= Operacion(2);
D(3)<= Operacion(3);





FF1: dffe port map (D(0), reloj, Reset, '1',  control_operaciones ,Q(0));
FF2: dffe port map (D(1), reloj, Reset, '1', control_operaciones ,Q(1));
FF3: dffe port map (D(2), reloj, Reset, '1', control_operaciones ,Q(2));
FF4: dffe port map (D(3), reloj, Reset, '1', control_operaciones ,Q(3));


OP_UnidaddeControl <= Q;
Operaciones_FlagSelector <= Q;				          
Operaciones_operacioneslogicas	<= Q;		
  
	
	           
End OperacionesArch;