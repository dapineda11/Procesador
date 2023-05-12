library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;



entity ResultadoCero is
port(
	
	mux_ResultadoCero		: in std_logic_vector (15 downto 0);
	ResultadoCero_FlagSelector		  	: out std_logic

		);
	end entity ResultadoCero;     

architecture ResultadoCeroArch of ResultadoCero is

begin 
ResultadoCero_FlagSelector <= ((not mux_ResultadoCero(15))and(not mux_ResultadoCero(14))and(not mux_ResultadoCero(13))and(not mux_ResultadoCero(12))and(not mux_ResultadoCero(11))and(not mux_ResultadoCero(10))and(not mux_ResultadoCero(9))and (not mux_ResultadoCero(8))and(not mux_ResultadoCero(7))and(not mux_ResultadoCero(6))and(not mux_ResultadoCero(5))and(not mux_ResultadoCero(4))and(not mux_ResultadoCero(3))and(not mux_ResultadoCero(2))and(not mux_ResultadoCero(1))and(not mux_ResultadoCero(0)));
 
End ResultadoCeroArch;