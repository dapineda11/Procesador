library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;
 
entity System_32_tb is
end entity System_32_tb ;

 
architecture testbench of System_32_tb is

signal Reloj_tb    			    			 : std_logic;
signal Reinicio_tb 	 			   		 : std_logic;
signal Unterbrechung_tb					    : std_logic;
signal System_OUT_tb		                : std_logic_vector (15 downto 0);
signal Ya_Pues_tb            				 : std_logic;




begin

CLKP : PROCESS
BEGIN
reloj_tb <= '0';
WAIT FOR 10 ns;
reloj_tb <= '1';
WAIT FOR 10 ns;
END PROCESS; 

Reinicio_tb      <= '1',
                     '0' after 20ns;
Ya_Pues_tb          <= '1',
                     '0' after 80ns;
Unterbrechung_tb <= '0',
'1' after 250ns,
'0' after 400ns,
'1' after 5000ns,
'0' after 5100ns,
'1' after 10000ns,
'0' after 10100ns,
'1' after 18000ns,
'0' after 18100ns,
'1' after 24000ns,
'0' after 24100ns;

dut : ENTITY WORK.system_32
port map(
		Reloj              =>	reloj_tb,		
		Reinicio 	 		 =>	Reinicio_tb,
		Unterbrechung		 =>	Unterbrechung_tb,
		      System_OUT		             =>       System_OUT_tb,
		Ya_Pues            	 =>	Ya_Pues_tb	
	

);
end architecture testbench; 