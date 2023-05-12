LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY Suma_Booth IS
PORT (

A_Sumar,Registro_NumB_sumador,Registro_CA_2_sumador	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
SELECTOR_SUMADOR: IN STD_LOGIC_vector(1 downto 0);
Sumar_A: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
resp :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

);
END Suma_Booth;

ARCHITECTURE structure OF Suma_Booth IS
SIGNAL G, P, c,R,E,m,j,v,resultado,i: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CR,cr1, Carry_sumador: STD_LOGIC;
SIGNAL q1, q2, q3, q4 : STD_LOGIC;
BEGIN

G <= A_Sumar AND Registro_NumB_sumador;
P <= A_Sumar XOR Registro_NumB_sumador;
Carry_sumador <= '0';

c(0) <= Carry_sumador;
c(1) <= G(0) OR(P(0) AND Carry_sumador);
c(2) <= G(1) OR(P(1) AND G(0)) OR(P(1) AND P(0) AND Carry_sumador);
c(3) <= G(2) OR(P(2) AND G(1)) OR(P(2) AND P(1) AND G(0)) OR(P(2) AND P(1) AND P(0) AND Carry_sumador);
c(4) <= G(3) OR(P(3) AND G(2)) OR(P(3) AND P(2) AND G(1)) OR(P(3) AND P(2) AND P(1) AND G(0)) OR(P(3) AND P(2) AND P(1) AND P(0) AND Carry_sumador);
c(5) <= G(4) OR(P(4) AND G(3)) OR(P(4) AND P(3) AND G(2)) OR(P(4) AND P(3) AND P(2) AND G(1)) OR(P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Carry_sumador);
c(6) <= G(5) OR(P(5) AND G(4)) OR(P(5) AND P(4) AND G(3)) OR(P(5) AND P(4) AND P(3) AND G(2)) OR(P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Carry_sumador);
c(7) <= G(6) OR(P(6) AND G(5)) OR(P(6) AND P(5) AND G(4)) OR(P(6) AND P(5) AND P(4) AND G(3)) OR(P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR(P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Carry_sumador);
R<= (P XOR c);

M <= A_SuMar AND Registro_CA_2_sumador;
j <= A_Sumar XOR Registro_CA_2_sumador;
v(0) <= Carry_sumador;
v(1) <= m(0) OR(j(0) AND Carry_sumador);
v(2) <= M(1) OR(j(1) AND M(0)) OR(j(1) AND j(0) AND Carry_sumador);
v(3) <= M(2) OR(j(2) AND M(1)) OR(j(2) AND j(1) AND M(0)) OR(j(2) AND j(1) AND j(0) AND Carry_sumador);
v(4) <= M(3) OR(j(3) AND M(2)) OR(j(3) AND j(2) AND M(1)) OR(j(3) AND j(2) AND j(1) AND M(0)) OR(j(3) AND j(2) AND j(1) AND j(0) AND Carry_sumador);
v(5) <= M(4) OR(j(4) AND M(3)) OR(j(4) AND j(3) AND M(2)) OR(j(4) AND j(3) AND j(2) AND M(1)) OR(j(4) AND j(3) AND j(2) AND j(1) AND M(0)) OR(j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND Carry_sumador);
v(6) <= M(5) OR(j(5) AND M(4)) OR(j(5) AND j(4) AND M(3)) OR(j(5) AND j(4) AND j(3) AND M(2)) OR(j(5) AND j(4) AND j(3) AND j(2) AND M(1)) OR(j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND M(0)) OR(j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND Carry_sumador);
v(7) <= M(6) OR(j(6) AND M(5)) OR(j(6) AND j(5) AND M(4)) OR(j(6) AND j(5) AND j(4) AND M(3)) OR(j(6) AND j(5) AND j(4) AND j(3) AND M(2)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND M(1)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND M(0)) OR(j(6) AND j(5) AND j(4) AND j(3) AND j(2) AND j(1) AND j(0) AND Carry_sumador);
i<= (j XOR v);

resultado(0)<= (i(0) and SELECTOR_SUMADOR(0)) or (r(0) and SELECTOR_SUMADOR(1));
resultado(1)<= (i(1) and SELECTOR_SUMADOR(0)) or (r(1) and SELECTOR_SUMADOR(1)); 
resultado(2)<= (i(2) and SELECTOR_SUMADOR(0)) or (r(2) and SELECTOR_SUMADOR(1)); 
resultado(3)<= (i(3) and SELECTOR_SUMADOR(0)) or (r(3) and SELECTOR_SUMADOR(1)); 
resultado(4)<= (i(4) and SELECTOR_SUMADOR(0)) or (r(4) and SELECTOR_SUMADOR(1)); 
resultado(5)<= (i(5) and SELECTOR_SUMADOR(0)) or (r(5) and SELECTOR_SUMADOR(1)); 
resultado(6)<= (i(6) and SELECTOR_SUMADOR(0)) or (r(6) and SELECTOR_SUMADOR(1)); 
resultado(7)<= (i(7) and SELECTOR_SUMADOR(0)) or (r(7) and SELECTOR_SUMADOR(1));  

Sumar_A <=Resultado;

 END structure;