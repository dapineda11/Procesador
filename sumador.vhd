LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Sumador IS
PORT (

NumeroA_Sumador, CA_2_Sumador: IN STD_LOGIC_VECTOR(15 DOWNTO 0);

Sumador_MUX: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
Sumador_FlagSelector			: out std_logic_vector (2 downto 0);


Corretaje_sumador : in std_LOGIC;
sumador_Corretaje : out std_LOGIC;

N2								 : in std_logic_vector (15 downto 0);
control_suma :in std_LOGIC_vector(1 downto 0);
control_sumas_Corretaje :in std_LOGIC;

FlagSelector_Sumador				: IN std_logic_vector (2 downto 0)

);
END Sumador;

ARCHITECTURE structure OF Sumador IS
SIGNAL G, P, c,R,E,m ,j, i, resul: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL CR, cr2, MUX,B: STD_LOGIC;
SIGNAL q1, q2, q3, q4 : STD_LOGIC;
BEGIN
B<= Corretaje_sumador;
MUX<=  B AND CONtrol_sumas_Corretaje;
G <= NumeroA_Sumador AND CA_2_Sumador;
P <= NumeroA_Sumador XOR CA_2_Sumador;


c(0) <= MUX;
c(1) <= G(0) OR(P(0) AND MUX);
c(2) <= G(1) OR(P(1) AND G(0)) OR(P(1) AND P(0) AND MUX);
c(3) <= G(2) OR(P(2) AND G(1)) OR(P(2) AND P(1) AND G(0)) OR(P(2) AND P(1) AND P(0) AND MUX);
c(4) <= G(3) OR(P(3) AND G(2)) OR(P(3) AND P(2) AND G(1)) OR(P(3) AND P(2) AND P(1) AND G(0)) OR(P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(5) <= G(4) OR(P(4) AND G(3)) OR(P(4) AND P(3) AND G(2)) OR(P(4) AND P(3) AND P(2) AND G(1)) OR(P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(6) <= G(5) OR(P(5) AND G(4)) OR(P(5) AND P(4) AND G(3)) OR(P(5) AND P(4) AND P(3) AND G(2)) OR(P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(7) <= G(6) OR(P(6) AND G(5)) OR(P(6) AND P(5) AND G(4)) OR(P(6) AND P(5) AND P(4) AND G(3)) OR(P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(8) <= G(7) OR(P(7) AND G(6)) OR(P(7) AND P(6) AND G(5)) OR(P(7) AND P(6) AND P(5) AND G(4)) OR(P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(9) <= G(8) OR(P(8) AND G(7)) OR(P(8) AND P(7) AND G(6)) OR(P(8) AND P(7) AND P(6) AND G(5)) OR(P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(10)<= G(9) OR(P(9) AND G(8)) OR(P(9) AND P(8) AND G(7)) OR(P(9) AND P(8) AND P(7) AND G(6)) OR(P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(11)<= G(10) OR(P(10) AND G(9)) OR(P(10)AND P(9) AND G(8)) OR(P(10)AND P(9) AND P(8) AND G(7)) OR(P(10) AND P(9) AND P(8) AND P(7) AND G(6)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(12)<= G(11) OR(P(11) AND G(10))OR(P(11)AND P(10)AND G(9)) OR(P(11)AND P(10)AND P(9) AND G(8)) OR(P(11) AND P(10)AND P(9) AND P(8) AND G(7)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND G(6)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(13)<= G(12) OR(P(12) AND G(11))OR(P(12)AND P(11)AND G(10))OR(P(12)AND P(11)AND P(10)AND G(9)) OR(P(12) AND P(11)AND P(10)AND P(9) AND G(8)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND G(7)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND G(6)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(14)<= G(13) OR(P(13) AND G(12))OR(P(13)AND P(12)AND G(11))OR(P(13)AND P(12)AND P(11)AND G(10))OR(P(13) AND P(12)AND P(11)AND P(10)AND G(9)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND G(8)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND G(7)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND G(6)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
c(15)<= G(14) OR(P(14) AND G(13))OR(P(14)AND P(13)AND G(12))OR(P(14)AND P(13)AND P(12)AND G(11))OR(P(14) AND P(13)AND P(12)AND P(11)AND G(10))OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND G(9)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND G(8)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND G(7)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND G(6)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(14)AND P(13)AND P(12)AND P(11)AND P(10)AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND MUX);
CR2<= g(15) OR(p(15) AND g(14))OR(p(15)AND p(14)AND g(13))OR(p(15)AND p(14)AND p(13)AND g(12))OR(p(15) AND p(14)AND p(13)AND p(12)AND g(11))OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND g(10))OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND g(9)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND g(8)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND g(7)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND g(6)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND g(5)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND g(4)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND p(4) AND g(3)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND g(2)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR(p(15)AND p(14)AND p(13)AND p(12)AND p(11)AND p(10)AND p(9) AND p(8) AND p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND mUX);

R<= (P XOR c);

m <= NumeroA_Sumador AND N2	;
j <= NumeroA_Sumador XOR N2	;

e(0) <= MUX;
e(1) <= m(0) OR(j(0) AND MUX);
e(2) <= m(1) OR(j(1) AND m(0)) OR(j(1) AND j(0) AND MUX);
e(3) <= m(2) OR(j(2) AND m(1)) OR(j(2) AND j(1) AND m(0)) OR(j(2) AND j(1) AND j(0) AND MUX);
e(4) <= m(3) OR(j(3) AND m(2)) OR(j(3) AND j(2) AND m(1)) OR(j(3) AND j(2) AND j(1) AND m(0)) OR(j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(5) <= m(4) OR(j(4) AND m(3)) OR(j(4) AND j(3) AND m(2)) OR(j(4) AND j(3) AND j(2) AND m(1)) OR(j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(6) <= m(5) OR(j(5) AND m(4)) OR(j(5) AND j(4) AND m(3)) OR(j(5) AND j(4) AND j(3) AND m(2)) OR(j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(7) <= m(6) OR(j(6) AND m(5)) OR(j(6) AND j(5) AND m(4)) OR(j(6) AND j(5) AND j(4) AND m(3)) OR(j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(8) <= m(7) OR(j(7) AND m(6)) OR(j(7) AND j(6) AND m(5)) OR(j(7) AND j(6) AND j(5) AND m(4)) OR(j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(9) <= m(8) OR(j(8) AND m(7)) OR(j(8) AND j(7) AND m(6)) OR(j(8) AND j(7) AND j(6) AND m(5)) OR(j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(10)<= m(9) OR(j(9) AND m(8)) OR(j(9) AND j(8) AND m(7)) OR(j(9) AND j(8) AND j(7) AND m(6)) OR(j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(11)<= m(10) OR(j(10) AND m(9)) OR(j(10)AND j(9) AND m(8)) OR(j(10)AND j(9) AND j(8) AND m(7)) OR(j(10) AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(12)<= m(11) OR(j(11) AND m(10))OR(j(11)AND j(10)AND m(9)) OR(j(11)AND j(10)AND j(9) AND m(8)) OR(j(11) AND j(10)AND j(9) AND j(8) AND m(7)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(13)<= m(12) OR(j(12) AND m(11))OR(j(12)AND j(11)AND m(10))OR(j(12)AND j(11)AND j(10)AND m(9)) OR(j(12) AND j(11)AND j(10)AND j(9) AND m(8)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND m(7)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(14)<= m(13) OR(j(13) AND m(12))OR(j(13)AND j(12)AND m(11))OR(j(13)AND j(12)AND j(11)AND m(10))OR(j(13) AND j(12)AND j(11)AND j(10)AND m(9)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND m(8)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND m(7)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
e(15)<= m(14) OR(j(14) AND m(13))OR(j(14)AND j(13)AND m(12))OR(j(14)AND j(13)AND j(12)AND m(11))OR(j(14) AND j(13)AND j(12)AND j(11)AND m(10))OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND m(9)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND m(8)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND m(7)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
CR<= m(15) OR(j(15) AND m(14))OR(j(15)AND j(14)AND m(13))OR(j(15)AND j(14)AND j(13)AND m(12))OR(j(15) AND j(14)AND j(13)AND j(12)AND m(11))OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND m(10))OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND m(9)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND m(8)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND m(7)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND m(6)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND m(5)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND m(4)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND m(3)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND m(2)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND m(1)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND m(0)) OR(j(15)AND j(14)AND j(13)AND j(12)AND j(11)AND j(10)AND j(9) AND j(8) AND j(7) AND j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND MUX);
I<= (j XOR e);

resul(0) <= (i(0) and control_suma(0)) or (r(0) and control_suma(1));
resul(1) <= (i(1) and control_suma(0)) or (r(1) and control_suma(1));
resul(2) <= (i(2) and control_suma(0)) or (r(2) and control_suma(1));
resul(3) <= (i(3) and control_suma(0)) or (r(3) and control_suma(1));
resul(4) <= (i(4) and control_suma(0)) or (r(4) and control_suma(1));
resul(5) <= (i(5) and control_suma(0)) or (r(5) and control_suma(1));
resul(6) <= (i(6) and control_suma(0)) or (r(6) and control_suma(1));
resul(7) <= (i(7) and control_suma(0)) or (r(7) and control_suma(1));
resul(8) <= (i(8) and control_suma(0)) or (r(8) and control_suma(1));
resul(9) <= (i(9) and control_suma(0)) or (r(9) and control_suma(1));
resul(10) <= (i(10) and control_suma(0)) or (r(10) and control_suma(1));
resul(11) <= (i(11) and control_suma(0)) or (r(11) and control_suma(1));
resul(12) <= (i(12) and control_suma(0)) or (r(12) and control_suma(1));
resul(13) <= (i(13) and control_suma(0)) or (r(13) and control_suma(1));
resul(14) <= (i(14) and control_suma(0)) or (r(14) and control_suma(1));
resul(15) <= (i(15) and control_suma(0)) or (r(15) and control_suma(1));

Sumador_FlagSelector(1)<= CR;
Sumador_MUX <= Resul;
sumador_Corretaje<= CR or cr2;

Sumador_FlagSelector(2)<= (NOT resul(15)AND NumeroA_Sumador(15)AND N2(15)) OR ( Resul(15)AND NOT NumeroA_Sumador(15)AND NOT N2(15));      
Sumador_FlagSelector(0)<= Resul(15);


 END structure;