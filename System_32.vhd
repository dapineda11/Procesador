library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;
--Entrega Final procesador
--Julian Oviedo
--Daniel Pineda
--2020-3

entity System_32 is
port(

		Reloj    			    			 : in std_logic;
		Reinicio 	 			   		 : in std_logic;
		Unterbrechung					    : in std_logic;
      System_OUT		             : out std_logic_vector (15 downto 0);
		Ya_Pues            				    : in std_logic 
		
);
		
	end entity System_32;     

architecture System_32Arch of System_32 is

component ProcessorFULL4KHD1linkMega is port (

		Reloj    			    			 : in std_logic;
		Reinicio 	 			   		 : in std_logic;
		Ya_Pues            				    : in std_logic;
	   DATO_RWM		             	    : in std_logic_vector (15 downto 0);
		ROM_DATO								 : in std_logic_vector (15 downto 0);
		Unterbrechung					    : in std_logic;
		DIRECCION_ROM                  : out std_logic_vector (9 downto 0);
		UnidaddeControl_ROM                         : out std_LOGIC;
		UnidaddeControl_RWM		             	    : OUT std_logic_vector (1 downto 0);
		DATO_RWM_Out		             : out std_logic_vector (15 downto 0);
		DIRECCION_RWM                  : out std_logic_vector (9 downto 0);
		AC_DR 				             : out std_logic_vector(15 downto 0)
);

end component;

component RWM  is port(
		address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
		
end component;   
component SieteSegMelo is
port(
		Reloj    			    			 : in std_logic;
		Reinicio 	 			   		 : in std_logic;
      DATO_RWM_Out		               : in std_logic_vector (15 downto 0);
		UnidaddeControl_RWM		             	      : in std_logic_vector (1 downto 0);
		System_OUT						 	: out std_logic_vector (15 downto 0)

	);
end component;
component ROM  is port (
		
		address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		rden		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)

);
end component;


   


SIGNAL		DATO_RWM		             	    : std_logic_vector (15 downto 0);
SIGNAL		DATO_RWM_Out		             : std_logic_vector (15 downto 0);
SIGNAL		ROM_DATO								 : std_logic_vector (15 downto 0);
SIGNAL		DIRECCION_ROM                  : std_logic_vector (9 downto 0);
SIGNAL		UnidaddeControl_ROM                         : std_LOGIC;
SIGNAL		UnidaddeControl_RWM		             	    : std_logic_vector (1 downto 0);
SIGNAL		DIRECCION_RWM                  : std_logic_vector (9 downto 0);
SIGNAL		data		                      : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal      AC_DR 				             : std_logic_vector(15 downto 0);
	
begin

ProcessorFULL4KHD1linkMegar: ProcessorFULL4KHD1linkMega port map(

	   Reinicio 			   => Reinicio,
		Ya_Pues 					=> Ya_Pues,
		Reloj						=> Reloj,
    	DATO_RWM		         => DATO_RWM,
		ROM_DATO					=> ROM_DATO,
		Unterbrechung			=> Unterbrechung,
		DIRECCION_ROM        => DIRECCION_ROM,
		UnidaddeControl_ROM               => UnidaddeControl_ROM,
      UnidaddeControl_RWM		         => UnidaddeControl_RWM,
      DATO_RWM_Out         => DATO_RWM_Out,  	
		DIRECCION_RWM        => DIRECCION_RWM,
		AC_DR 				   => AC_DR 				       

 );

ROMM: ROM port map(

		 address => DIRECCION_ROM ,		
		 clock   => Reloj	,
		 rden    => UnidaddeControl_ROM ,		
		 q       => ROM_DATO			
		
);

RWMM:RWM  port map(


	address  => DIRECCION_RWM,
	clock    => Reloj,
   data     => DATO_RWM_Out,
	rden     => UnidaddeControl_RWM(0),       
	wren     => UnidaddeControl_RWM(1),    	
	q        => DATO_RWM
	
		


);
SieteSegMeloa:SieteSegMelo  port map(
		Reloj    =>		Reloj,
		Reinicio 	=>	Reinicio,
   DATO_RWM_Out     => DATO_RWM_Out,
	UnidaddeControl_RWM     => UnidaddeControl_RWM,       
	System_OUT	     => System_OUT	    	


);



End System_32Arch;