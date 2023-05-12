library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;



entity Desplazamiento_Rotacion is
port(
	
		NumeroA_Desplazamiento_Rotacion		               : in std_logic_vector (15 downto 0);
		Control_Desplazamiento_Rotacion                    : in std_logic_vector(1 downto 0);
		Desplazamiento_Rotacion_MUX		            : out std_logic_vector (15 downto 0);
		Desplazamiento_Rotacion_FlagSelector		  	   : out std_logic
		
		);
	end entity Desplazamiento_Rotacion;     

architecture Desplazamiento_RotacionArch of Desplazamiento_Rotacion is

signal R : std_logic_vector (15 downto 0);
signal N : std_logic;
signal D : std_logic_vector (15 downto 0);
begin 

D(0)<=NumeroA_Desplazamiento_Rotacion(1) and Control_Desplazamiento_Rotacion(0);
D(1)<=NumeroA_Desplazamiento_Rotacion	(2)and Control_Desplazamiento_Rotacion(0);
D(2)<=NumeroA_Desplazamiento_Rotacion	(3)and Control_Desplazamiento_Rotacion(0);
D(3)<=NumeroA_Desplazamiento_Rotacion	(4)and Control_Desplazamiento_Rotacion(0);
D(4)<=NumeroA_Desplazamiento_Rotacion	(5)and Control_Desplazamiento_Rotacion(0);
D(5)<=NumeroA_Desplazamiento_Rotacion	(6)and Control_Desplazamiento_Rotacion(0);
D(6)<=NumeroA_Desplazamiento_Rotacion	(7)and Control_Desplazamiento_Rotacion(0);
D(7)<=NumeroA_Desplazamiento_Rotacion	(8)and Control_Desplazamiento_Rotacion(0);
D(8)<=NumeroA_Desplazamiento_Rotacion	(9)and Control_Desplazamiento_Rotacion(0);
D(9)<=NumeroA_Desplazamiento_Rotacion	(10)and Control_Desplazamiento_Rotacion(0);
D(10)<=NumeroA_Desplazamiento_Rotacion	(11)and Control_Desplazamiento_Rotacion(0);
D(11)<=NumeroA_Desplazamiento_Rotacion	(12)and Control_Desplazamiento_Rotacion(0);
D(12)<=NumeroA_Desplazamiento_Rotacion	(13)and Control_Desplazamiento_Rotacion(0);
D(13)<=NumeroA_Desplazamiento_Rotacion	(14)and Control_Desplazamiento_Rotacion(0);
D(14)<=NumeroA_Desplazamiento_Rotacion	(15)and Control_Desplazamiento_Rotacion(0);
D(15)<= '0' and Control_Desplazamiento_Rotacion(0);

R(0)<=NumeroA_Desplazamiento_Rotacion(1)and Control_Desplazamiento_Rotacion(1);
R(1)<=NumeroA_Desplazamiento_Rotacion	(2)and Control_Desplazamiento_Rotacion(1);
R(2)<=NumeroA_Desplazamiento_Rotacion	(3)and Control_Desplazamiento_Rotacion(1);
R(3)<=NumeroA_Desplazamiento_Rotacion	(4)and Control_Desplazamiento_Rotacion(1);
R(4)<=NumeroA_Desplazamiento_Rotacion	(5)and Control_Desplazamiento_Rotacion(1);
R(5)<=NumeroA_Desplazamiento_Rotacion	(6)and Control_Desplazamiento_Rotacion(1);
R(6)<=NumeroA_Desplazamiento_Rotacion	(7)and Control_Desplazamiento_Rotacion(1);
R(7)<=NumeroA_Desplazamiento_Rotacion	(8)and Control_Desplazamiento_Rotacion(1);
R(8)<=NumeroA_Desplazamiento_Rotacion	(9)and Control_Desplazamiento_Rotacion(1);
R(9)<=NumeroA_Desplazamiento_Rotacion	(10)and Control_Desplazamiento_Rotacion(1);
R(10)<=NumeroA_Desplazamiento_Rotacion	(11)and Control_Desplazamiento_Rotacion(1);
R(11)<=NumeroA_Desplazamiento_Rotacion	(12)and Control_Desplazamiento_Rotacion(1);
R(12)<=NumeroA_Desplazamiento_Rotacion	(13)and Control_Desplazamiento_Rotacion(1);
R(13)<=NumeroA_Desplazamiento_Rotacion	(14)and Control_Desplazamiento_Rotacion(1);
R(14)<=NumeroA_Desplazamiento_Rotacion	(15)and Control_Desplazamiento_Rotacion(1);
R(15)<=NumeroA_Desplazamiento_Rotacion	(0) and Control_Desplazamiento_Rotacion(1);
 
Desplazamiento_Rotacion_MUX<= D or R;
Desplazamiento_Rotacion_FlagSelector<= D(15) or R(15);


End Desplazamiento_RotacionArch;