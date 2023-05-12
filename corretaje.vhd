library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

entity Corretaje is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		control_Corretaje :in std_logic;
		Corretaje_Sumador : out std_LOGIC;
      sumador_Corretaje : in std_LOGIC
		
				
	);
	end entity Corretaje;     

architecture CorretajeArch of Corretaje is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic;
signal D : std_logic;
signal E : std_logic;
begin 

D <= sumador_Corretaje;


FF1: dffe port map (D, reloj, '1', '1', control_Corretaje ,Q);


Corretaje_Sumador <= Q;


End CorretajeArch;