
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY PC IS 
	GENERIC		(	N				      :	INTEGER	:=10);
	PORT			(	Reloj			      :	IN STD_LOGIC;
						Reinicio			:	IN STD_LOGIC;
						UnidaddeControl_PC			      :	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
						AR_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
						DR_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
                  Direccion_Interrupcion_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
						PC_DR		         :	OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
						Direccion_ROM		:	OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl OF PC IS
	CONSTANT ONES			:	UNSIGNED(9 DOWNTO 0)	:= (OTHERS => '1');
	CONSTANT ZEROS			:	UNSIGNED(9 DOWNTO 0)	:= (OTHERS => '0');

	SIGNAL count_s			:	UNSIGNED(9 DOWNTO 0);
	SIGNAL count_next		:	UNSIGNED(9 DOWNTO 0);
	SIGNAL d		         :	STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL load			   :  STD_LOGIC;
	SIGNAL counter       :	STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN
load <= UnidaddeControl_PC(3) or UnidaddeControl_PC(2) or UnidaddeControl_PC(1);
d(0)    <= (AR_PC(0) AND UnidaddeControl_PC(2)) OR (DR_PC(0) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(0) AND UnidaddeControl_PC(3));
d(1)    <= (AR_PC(1) AND UnidaddeControl_PC(2)) OR (DR_PC(1) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(1) AND UnidaddeControl_PC(3));
d(2)    <= (AR_PC(2) AND UnidaddeControl_PC(2)) OR (DR_PC(2) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(2) AND UnidaddeControl_PC(3));
d(3)    <= (AR_PC(3) AND UnidaddeControl_PC(2)) OR (DR_PC(3) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(3) AND UnidaddeControl_PC(3));
d(4)    <= (AR_PC(4) AND UnidaddeControl_PC(2)) OR (DR_PC(4) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(4) AND UnidaddeControl_PC(3));
d(5)    <= (AR_PC(5) AND UnidaddeControl_PC(2)) OR (DR_PC(5) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(5) AND UnidaddeControl_PC(3));
d(6)    <= (AR_PC(6) AND UnidaddeControl_PC(2)) OR (DR_PC(6) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(6) AND UnidaddeControl_PC(3));
d(7)    <= (AR_PC(7) AND UnidaddeControl_PC(2)) OR (DR_PC(7) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(7) AND UnidaddeControl_PC(3));
d(8)    <= (AR_PC(8) AND UnidaddeControl_PC(2)) OR (DR_PC(8) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(8) AND UnidaddeControl_PC(3));
d(9)    <= (AR_PC(9) AND UnidaddeControl_PC(2)) OR (DR_PC(9) AND UnidaddeControl_PC(1)) OR (Direccion_Interrupcion_PC(9) AND UnidaddeControl_PC(3));

	count_next <=		
							UNSIGNED(d) 	  WHEN load =   '1'			    ELSE
							count_s + 1      WHEN (UnidaddeControl_PC(0) = '1' AND UnidaddeControl_PC(0)= '1') ELSE
							count_s - 1      WHEN (UnidaddeControl_PC(0) = '1' AND UnidaddeControl_PC(0)= '0') ELSE
							count_s;

							
	PROCESS(Reloj,Reinicio)
		VARIABLE temp	:	UNSIGNED(9 DOWNTO 0);
	BEGIN
		IF(Reinicio='1')	THEN
			temp := (OTHERS => '0');
		ELSIF (rising_edge(Reloj)) THEN
			IF (UnidaddeControl_PC(0)='1')	THEN
				temp := count_next;
			END IF;
		END IF;
		counter <= STD_LOGIC_VECTOR(temp);
		count_s <= temp;
	END PROCESS;
	PC_DR         <= Counter;      
	Direccion_ROM <= Counter;	

	
END ARCHITECTURE;