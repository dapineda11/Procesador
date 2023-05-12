LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
library ALTERA;
use ALTERA.altera_primitives_components.all;

ENTITY CA_2 IS
	PORT	(	NumeroB_CA_2	:	IN		STD_LOGIC_VECTOR(15 DOWNTO 0);
				CA_2_Sumador:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
				
				);
END ENTITY CA_2;

ARCHITECTURE CA_2Arch OF CA_2 IS
SIGNAL 	compA1 	: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL 	Cout 		: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL 	sum 		: STD_LOGIC_VECTOR(15 DOWNTO 0);
CONSTANT uno 		: STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000001";
BEGIN

	compA1	<= NOT NumeroB_CA_2;

	sum(0)	<=	((NOT compA1(0)) AND (uno(0))) OR ((compA1(0)) AND (NOT uno(0)));
	Cout(0)	<=	compA1(0) AND uno(0);
	sum(1)	<=	((NOT compA1(1)) AND (NOT uno(1)) AND (Cout(0))) OR ((NOT compA1(1)) AND (uno(1)) AND (NOT Cout(0))) OR ((compA1(1)) AND (NOT uno(1)) AND (NOT Cout(0))) OR ((compA1(1)) AND (uno(1)) AND (Cout(0)));
	Cout(1)	<=	(compA1(1) AND uno(1)) OR (compA1(1) AND (Cout(0))) OR (Cout(0) AND uno(1));
	sum(2)	<=	((NOT compA1(2)) AND (NOT uno(2)) AND (Cout(1))) OR ((NOT compA1(2)) AND (uno(2)) AND (NOT Cout(1)))   OR ((compA1(2)) AND (NOT uno(2)) AND (NOT Cout(1))) OR ((compA1(2)) AND (uno(2)) AND (Cout(1)));
	Cout(2)	<=	(compA1(2) AND uno(2)) OR (compA1(2) AND (Cout(1))) OR (Cout(1) AND uno(2));
	sum(3)	<=	((NOT compA1(3)) AND (NOT uno(3)) AND (Cout(2))) OR ((NOT compA1(3)) AND (uno(3)) AND (NOT Cout(2)))   OR ((compA1(3)) AND (NOT uno(3)) AND (NOT Cout(2)))   OR ((compA1(3)) AND (uno(3)) AND (Cout(2)));
	Cout(3)	<=	(compA1(3) AND uno(3)) OR (compA1(3) AND (Cout(2))) OR (Cout(2) AND uno(3));
	sum(4)	<=	((NOT compA1(4)) AND (NOT uno(4)) AND (Cout(3))) OR ((NOT compA1(4)) AND (uno(4)) AND (NOT Cout(3)))   OR ((compA1(4)) AND (NOT uno(4)) AND (NOT Cout(3)))   OR ((compA1(4)) AND (uno(4)) AND (Cout(3)));
	Cout(4)	<=	(compA1(4) AND uno(4)) OR (compA1(4) AND (Cout(3))) OR (Cout(3) AND uno(4));
	sum(5)	<=	((NOT compA1(5)) AND (NOT uno(5)) AND (Cout(4))) OR ((NOT compA1(5)) AND (uno(5)) AND (NOT Cout(4)))  OR ((compA1(5)) AND (NOT uno(5)) AND (NOT Cout(4)))  OR ((compA1(5)) AND (uno(5)) AND (Cout(4)));
	Cout(5)	<=	(compA1(5) AND uno(5)) OR (compA1(5) AND (Cout(4))) OR (Cout(4) AND uno(5));
	sum(6)	<=	((NOT compA1(6)) AND (NOT uno(6)) AND (Cout(5))) OR ((NOT compA1(6)) AND (uno(6)) AND (NOT Cout(5)))  OR ((compA1(6)) AND (NOT uno(6)) AND (NOT Cout(5)))  OR ((compA1(6)) AND (uno(6)) AND (Cout(5)));
	Cout(6)	<=	(compA1(6) AND uno(6)) OR (compA1(6) AND (Cout(5))) OR (Cout(5) AND uno(6));
	sum(7)	<=	((NOT compA1(7)) AND (NOT uno(7)) AND (Cout(6)))  OR ((NOT compA1(7)) AND (uno(7)) AND (NOT Cout(6)))  OR ((compA1(7)) AND (NOT uno(7)) AND (NOT Cout(6)))  OR ((compA1(7)) AND (uno(7)) AND (Cout(6)));
	Cout(7)	<=	(compA1(7) AND uno(7)) OR (compA1(7) AND (Cout(6))) OR (Cout(6) AND uno(7));
	sum(8)	<=	((NOT compA1(8)) AND (NOT uno(8)) AND (Cout(7)))  OR ((NOT compA1(8)) AND (uno(8)) AND (NOT Cout(7)))   OR ((compA1(8)) AND (NOT uno(8)) AND (NOT Cout(7)))   OR ((compA1(8)) AND (uno(8)) AND (Cout(7)));
	Cout(8)	<=	(compA1(8) AND uno(8)) OR (compA1(8) AND (Cout(7))) OR (Cout(7) AND uno(8));
	sum(9)	<=	((NOT compA1(9)) AND (NOT uno(9)) AND (Cout(8))) OR ((NOT compA1(9)) AND (uno(9)) AND (NOT Cout(8)))   OR ((compA1(9)) AND (NOT uno(9)) AND (NOT Cout(8)))   OR ((compA1(9)) AND (uno(9)) AND (Cout(8)));
	Cout(9)	<=	(compA1(9) AND uno(9)) OR (compA1(9) AND (Cout(8))) OR (Cout(8) AND uno(9));
	sum(10)	<=	((NOT compA1(10)) AND (NOT uno(10)) AND (Cout(9))) OR ((NOT compA1(10)) AND (uno(10)) AND (NOT Cout(9))) OR ((compA1(10)) AND (NOT uno(10)) AND (NOT Cout(9)))  OR ((compA1(10)) AND (uno(10)) AND (Cout(9)));
	Cout(10)	<=	(compA1(10) AND uno(10)) OR (compA1(10) AND (Cout(9))) OR (Cout(9) AND uno(10));
	sum(11)	<=	((NOT compA1(11)) AND (NOT uno(11)) AND (Cout(10))) OR ((NOT compA1(11)) AND (uno(11)) AND (NOT Cout(10))) OR ((compA1(11)) AND (NOT uno(11)) AND (NOT Cout(10))) OR ((compA1(11)) AND (uno(11)) AND (Cout(10)));
	Cout(11)	<=	(compA1(11) AND uno(11)) OR (compA1(11) AND (Cout(10))) OR (Cout(10) AND uno(11));
	sum(12)	<=	((NOT compA1(12)) AND (NOT uno(12)) AND (Cout(11))) OR ((NOT compA1(12)) AND (uno(12)) AND (NOT Cout(11))) OR ((compA1(12)) AND (NOT uno(12)) AND (NOT Cout(11))) OR ((compA1(12)) AND (uno(12)) AND (Cout(11)));
	Cout(12)	<=	(compA1(12) AND uno(12)) OR (compA1(12) AND (Cout(11))) OR (Cout(11) AND uno(12));
	sum(13)	<=	((NOT compA1(13)) AND (NOT uno(13)) AND (Cout(12))) OR ((NOT compA1(13)) AND (uno(13)) AND (NOT Cout(12))) OR ((compA1(13)) AND (NOT uno(13)) AND (NOT Cout(12))) OR ((compA1(13)) AND (uno(13)) AND (Cout(12)));
	Cout(13)	<=	(compA1(13) AND uno(13)) OR (compA1(13) AND (Cout(12))) OR (Cout(12) AND uno(13));
	sum(14)	<=	((NOT compA1(14)) AND (NOT uno(14)) AND (Cout(13))) OR ((NOT compA1(14)) AND (uno(14)) AND (NOT Cout(13))) OR ((compA1(14)) AND (NOT uno(14)) AND (NOT Cout(13))) OR ((compA1(14)) AND (uno(14)) AND (Cout(13)));
	Cout(14)	<=	(compA1(14) AND uno(14)) OR (compA1(14) AND (Cout(13))) OR (Cout(13) AND uno(14));
	sum(15)	<=	((NOT compA1(15)) AND (NOT uno(15)) AND (Cout(14))) OR ((NOT compA1(15)) AND (uno(15)) AND (NOT Cout(14))) OR ((compA1(15)) AND (NOT uno(15)) AND (NOT Cout(14))) OR ((compA1(15)) AND (uno(15)) AND (Cout(14)));
	Cout(15)	<= (compA1(15) AND uno(15)) OR (compA1(15) AND (Cout(14))) OR (Cout(14) AND uno(15));

	CA_2_Sumador <= sum;	
	
END ARCHITECTURE CA_2Arch;