library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity SR is
port(
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_SR				                  : in std_logic_vector(4 downto 0);
		Banderas                         : in std_logic_vector(3 downto 0);
		DR_SR                            : in std_logic_vector(4 downto 0);
		SR_DR				                  : out std_logic_vector(4 downto 0);
		SR_UnidaddeControl				                  : out std_logic_vector(2 downto 0)
				
	);
	end entity SR;     

ARchitecture SRARch of SR is

component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (4 downto 0);
signal D : std_logic_vector (4 downto 0);
signal E,rst,enai : std_logic;
begin 

D(0)<= (Banderas(0) AND UnidaddeControl_SR(1)) OR (DR_SR(0) AND UnidaddeControl_SR(0));
D(1)<= (Banderas(1) AND UnidaddeControl_SR(1)) OR (DR_SR(1) AND UnidaddeControl_SR(0));
D(2)<= (Banderas(2) AND UnidaddeControl_SR(1)) OR (DR_SR(2) AND UnidaddeControl_SR(0));
D(3)<= (Banderas(3) AND UnidaddeControl_SR(1)) OR (DR_SR(3) AND UnidaddeControl_SR(0));
D(4)<=  UnidaddeControl_SR(3) OR (DR_SR(4) AND UnidaddeControl_SR(0));
rst<= not Reinicio;
enai <= UnidaddeControl_SR(3) OR (DR_SR(4) AND UnidaddeControl_SR(0)) or UnidaddeControl_SR(4) ;

FF1: dffe port map (D(0), reloj, rst, '1', UnidaddeControl_SR(2) ,Q(0));
FF2: dffe port map (D(1), reloj, rst, '1', UnidaddeControl_SR(2) ,Q(1));
FF3: dffe port map (D(2), reloj, rst, '1', UnidaddeControl_SR(2) ,Q(2));
FF4: dffe port map (D(3), reloj, rst, '1', UnidaddeControl_SR(2) ,Q(3));
FF5: dffe port map (D(4), reloj, rst, '1', enai ,Q(4));



SR_DR	           <= Q;

SR_UnidaddeControl(0)            <= Q(3);
SR_UnidaddeControl(1)            <= Q(0);			                  
SR_UnidaddeControl(2)            <= Q(4);			         


End SRARch;
