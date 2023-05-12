LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY operacioneslogicas IS
	PORT	(	Operaciones_operacioneslogicas:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
				NumeroA_operacioneslogicas	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				NumeroB_operacioneslogicas	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				operacioneslogicas_MUX:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
				
	
				);
END ENTITY operacioneslogicas;

ARCHITECTURE gateLevel OF operacioneslogicas IS
SIGNAL numNot, numAND, numOR, resul : STD_LOGIC_VECTOR(15 DOWNTO 0); 
SIGNAL q1, q2, q3 : STD_LOGIC;

BEGIN

	numNOT <= NOT NumeroA_operacioneslogicas;
	numAND <= NumeroA_operacioneslogicas AND NumeroB_operacioneslogicas;
	numOR  <= NumeroA_operacioneslogicas OR  NumeroB_operacioneslogicas;

	q1 <= (NOT Operaciones_operacioneslogicas(0)) AND (NOT Operaciones_operacioneslogicas(1)) AND (NOT Operaciones_operacioneslogicas(2)) AND Operaciones_operacioneslogicas(3);
	q2 <= (NOT Operaciones_operacioneslogicas(0)) AND Operaciones_operacioneslogicas(1) AND Operaciones_operacioneslogicas(2) AND (NOT Operaciones_operacioneslogicas(3));
	q3 <= Operaciones_operacioneslogicas(0) AND Operaciones_operacioneslogicas(1) AND Operaciones_operacioneslogicas(2) AND (NOT Operaciones_operacioneslogicas(3));

	resul(0) <= (numNot(0) AND q1) OR (numAND(0) AND q2) OR (numOR(0) AND q3);
	resul(1) <= (numNot(1) AND q1) OR (numAND(1) AND q2) OR (numOR(1) AND q3);
	resul(2) <= (numNot(2) AND q1) OR (numAND(2) AND q2) OR (numOR(2) AND q3);
	resul(3) <= (numNot(3) AND q1) OR (numAND(3) AND q2) OR (numOR(3) AND q3);
	resul(4) <= (numNot(4) AND q1) OR (numAND(4) AND q2) OR (numOR(4) AND q3);
	resul(5) <= (numNot(5) AND q1) OR (numAND(5) AND q2) OR (numOR(5) AND q3);
	resul(6) <= (numNot(6) AND q1) OR (numAND(6) AND q2) OR (numOR(6) AND q3);
	resul(7) <= (numNot(7) AND q1) OR (numAND(7) AND q2) OR (numOR(7) AND q3);
	resul(8) <= (numNot(8) AND q1) OR (numAND(8) AND q2) OR (numOR(8) AND q3);
	resul(9) <= (numNot(9) AND q1) OR (numAND(9) AND q2) OR (numOR(9) AND q3);
	resul(10) <= (numNot(10) AND q1) OR (numAND(10) AND q2) OR (numOR(10) AND q3);
	resul(11) <= (numNot(11) AND q1) OR (numAND(11) AND q2) OR (numOR(11) AND q3);
	resul(12) <= (numNot(12) AND q1) OR (numAND(12) AND q2) OR (numOR(12) AND q3);
	resul(13) <= (numNot(13) AND q1) OR (numAND(13) AND q2) OR (numOR(13) AND q3);
	resul(14) <= (numNot(14) AND q1) OR (numAND(14) AND q2) OR (numOR(14) AND q3);
	resul(15) <= (numNot(15) AND q1) OR (numAND(15) AND q2) OR (numOR(15) AND q3);
	
	operacioneslogicas_MUX <= resul; 
	
END ARCHITECTURE gateLevel;