LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-----------------------------------------------
ENTITY SP IS
GENERIC(N : INTEGER := 10;
        valor : INTEGER := 1);
PORT( Reloj      : IN STD_LOGIC;
      Reinicio  : IN STD_LOGIC;
      UnidaddeControl_SP      : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      SP_AR      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END ENTITY; 
-----------------------------------------------

ARCHITECTURE SPArch OF SP IS

SIGNAL valor_s :UNSIGNED(9 DOWNTO 0);
SIGNAL count_s,count_next : UNSIGNED(9 DOWNTO 0);
SIGNAL counter       :	STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL load			   :  STD_LOGIC;
SIGNAL d		         :	STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL up            : STD_LOGIC;
SIGNAL ena           : STD_LOGIC;
 


BEGIN

ena <= UnidaddeControl_SP(1);
up <= UnidaddeControl_SP(0);
load <=UnidaddeControl_SP(2);
d <=	"1111111111";

valor_s <= to_unsigned(valor,N);

count_next <= 
  (OTHERS => '0') WHEN count_s = valor_s    ELSE
      unsigned(d) WHEN load = '1'           ELSE
      count_s + 1 WHEN (ena='1' AND up='1') ELSE 
      count_s - 1 WHEN (ena='1' AND up='0') ELSE
      count_s;

PROCESS(reloj,Reinicio)
VARIABLE temp : UNSIGNED(N-1 DOWNTO 0);
   BEGIN
  
IF(Reinicio='1') THEN
temp := (OTHERS =>'0');

ELSIF (rising_edge(reloj)) THEN
      IF (ena='1') THEN
        temp := count_next;
END IF;
END IF;

counter <= STD_LOGIC_VECTOR(temp);
count_s <= temp;

END PROCESS;
SP_AR <= counter;


END ARCHITECTURE;