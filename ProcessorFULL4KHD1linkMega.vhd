library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity ProcessorFULL4KHD1linkMega is
port(
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
	   AC_DR 				             : buffer std_logic_vector(15 downto 0)	
		);
		
	end entity ProcessorFULL4KHD1linkMega;     

architecture ProcessorFULL4KHD1linkMegaArch of ProcessorFULL4KHD1linkMega is

component UnidaddeControl is port (

	   Reinicio 						: in std_logic;
		Ya_Pues 						: in std_logic;
		Reloj							: in std_logic;
		
      Unterbrechung          : in std_logic;
      SR_UnidaddeControl                	: in std_logic_vector (2 downto 0);
      Disponibilidad          : in std_logic;
		UnidaddeControl_IR 	             	: out std_logic_vector(2 downto 0);
		UnidaddeControl_DR                   : out std_logic_vector(6 downto 0);
		UnidaddeControl_AC                   : out std_logic_vector(2 downto 0);
		UnidaddeControl_AR					      : OUT std_logic_vector(4 downto 0);
		UnidaddeControl_PC              		: OUT std_logic_vector(3 downto 0);
      UnidaddeControl_SP             		: OUT std_logic_vector(2 downto 0);
      UnidaddeControl_SR			            : out std_logic_vector(4 downto 0);
		UnidaddeControl_ALU                  : out std_logic;
		UnidaddeControl_ROM                  : out std_logic;
		UnidaddeControl_RWM                  : out std_logic_vector(1 downto 0);
		ROM_DATO                         : in std_logic_vector(15 downto 0);
		Reset 	 			   			 : out std_logic
);

end component;

component ALU  is port(
		Reloj    			    			 : in std_logic;
		Reset 	 			   			 : in std_logic;
		UnidaddeControl_ALU            				 : in std_logic;
		Operacion		             	 : in std_logic_vector(3 downto 0);
		N2								 : in std_logic_vector (15 downto 0);
		N1								 : in std_logic_vector (15 downto 0);
		Resultado_Respuesta            : out std_logic_vector (15 downto 0);
		Disponibilidad                 : out std_LOGIC;
		Banderas                       : out std_logic_vector (3 downto 0)
);
		
end component;   

component AC  is port (
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_AC				                  : in std_logic_vector(2 downto 0);
		DR_AC                            : in std_logic_vector(15 downto 0);
		Resultado_Respuesta              : in std_logic_vector(15 downto 0);
		AC_DR 				               : out std_logic_vector(15 downto 0);
		N2				               : out std_logic_vector(15 downto 0)

);
end component;

component IR is port (

		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_IR				                  : in std_logic_vector(2 downto 0);
		DR_IR                            : in std_logic_vector(15 downto 0);
		ROM_DATO                         : in std_logic_vector(15 downto 0);
		IR_DR 				               : out std_logic_vector(15 downto 0);
		IR_DATO_DR                       : out std_logic_vector(8 downto 0);
		Operacion 				            : out std_logic_vector(3 downto 0);
		IR_AR                            : out std_logic_vector(8 downto 0)
		
		
);
end component;

component PC is port (
		
      Reloj			      :	IN STD_LOGIC;
		Reinicio			      :	IN STD_LOGIC;
		UnidaddeControl_PC			      :	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		AR_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		DR_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      Direccion_Interrupcion_PC				   :	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	   PC_DR		         :	OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		Direccion_ROM		:	OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
				
);
end component;

component SP is port (
		
      Reloj      : IN STD_LOGIC;
      Reinicio      : IN STD_LOGIC;
      UnidaddeControl_SP      : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      SP_AR      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)

);				

end component;


component Direccion_Interrupcion is port (
		
		Reinicio										            : in std_logic;
		reloj										            : in std_logic;
		Direccion_Interrupcion_PC				         : out std_logic_vector(9 downto 0)
					
);
end component;
component SR is port (
		
		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_SR				                  : in std_logic_vector(4 downto 0);
		Banderas                         : in std_logic_vector(3 downto 0);
		DR_SR                            : in std_logic_vector(4 downto 0);
		SR_DR				                  : out std_logic_vector(4 downto 0);
		SR_UnidaddeControl				                  : out std_logic_vector(2 downto 0)
					
);
end component;
component AR is port(

		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_AR				                  : in std_logic_vector(4 downto 0);
		IR_AR                            : in std_logic_vector(8 downto 0);
		DR_AR                            : in std_logic_vector(9 downto 0);
		SP_AR                            : in std_logic_vector(9 downto 0);
		AR_PC				                  : out std_logic_vector(9 downto 0);
		Direccion_RWM				         : out std_logic_vector(9 downto 0)

);
end component;
component DR IS PORT	(

		Reinicio										: in std_logic;
		reloj										: in std_logic;
		UnidaddeControl_DR				                  : in std_logic_vector(6 downto 0);
		AC_DR                            : in std_logic_vector(15 downto 0);
		Dato_RWM                         : in std_logic_vector(15 downto 0);
		IR_DR                            : in std_logic_vector(15 downto 0);
		IR_DATO_DR                       : in std_logic_vector(8 downto 0);
		PC_DR                            : in std_logic_vector(9 downto 0);
		SR_DR                            : in std_logic_vector(4 downto 0);
		N1				               : out std_logic_vector(15 downto 0);
		DR_AC  				               : out std_logic_vector(15 downto 0);
		DR_AR  				               : out std_logic_vector(9 downto 0);
		DR_SR 				               : out std_logic_vector(4 downto 0);
		DR_IR                            : OUT std_logic_vector(15 downto 0);
		DATO_RWM_Out		               : out std_logic_vector (15 downto 0);
		DR_PC				                  : out std_logic_vector(9 downto 0)
				
);
end component;

   
SIGNAL      Reset 	 			   			 : std_logic;
SIGNAL		IR_UnidaddeControl                   : std_logic_vector (6 downto 0);
SIGNAL      SR_UnidaddeControl                	: std_logic_vector (2 downto 0);
SIGNAL      Disponibilidad          : std_logic;
SIGNAL		UnidaddeControl_IR 	             	: std_logic_vector(2 downto 0);
SIGNAL		UnidaddeControl_DR                   : std_logic_vector(6 downto 0);
SIGNAL		UnidaddeControl_AC                   : std_logic_vector(2 downto 0);
SIGNAL		UnidaddeControl_AR					      : std_logic_vector(4 downto 0);
SIGNAL		UnidaddeControl_PC              		: std_logic_vector(3 downto 0);
SIGNAL      UnidaddeControl_SP             		: std_logic_vector(2 downto 0);
SIGNAL      UnidaddeControl_SR			            : std_logic_vector(4 downto 0);
SIGNAL		UnidaddeControl_ALU                  : std_logic;
SIGNAL		Operacion		         : std_logic_vector(3 downto 0);
SIGNAL		N2					   : std_logic_vector (15 downto 0);
SIGNAL		N1						: std_logic_vector (15 downto 0);
SIGNAL		Resultado_Respuesta     : std_logic_vector (15 downto 0);
SIGNAL		Banderas                : std_logic_vector (3 downto 0);
SIGNAL 		DR_AC                   : std_logic_vector(15 downto 0);

SIGNAL		DR_IR                   : std_logic_vector(15 downto 0);
SIGNAL		IR_DR 				      : std_logic_vector(15 downto 0);
SIGNAL		IR_DATO_DR              : std_logic_vector(8 downto 0);
SIGNAL		IR_AR                   : std_logic_vector(8 downto 0);
SIGNAL 		AR_PC				         : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL		DR_PC				         : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL      Direccion_Interrupcion_PC:STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	   PC_DR		               : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL      SP_AR                   : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL 		DR_SR                   : std_logic_vector(4 downto 0);
SIGNAL 		SR_DR				         : std_logic_vector(4 downto 0);
SIGNAL 		DR_AR                   : std_logic_vector(9 downto 0);

		
begin

UnidaddeControlU: UnidaddeControl port map(

	   Reinicio 					=> Reinicio,
		Ya_Pues 					=> Ya_Pues,
		Reloj						=> Reloj,
		
      Unterbrechung       => Unterbrechung,
      SR_UnidaddeControl                => SR_UnidaddeControl,
      Disponibilidad       => Disponibilidad ,
		UnidaddeControl_IR 	            => UnidaddeControl_IR,
		UnidaddeControl_DR                => UnidaddeControl_DR,
		UnidaddeControl_AC                => UnidaddeControl_AC,
		UnidaddeControl_AR					   => UnidaddeControl_AR,
		UnidaddeControl_PC              	=> UnidaddeControl_PC,
      UnidaddeControl_SP             	=> UnidaddeControl_SP,
      UnidaddeControl_SR			         => UnidaddeControl_SR,
		UnidaddeControl_ALU               => UnidaddeControl_ALU,
		UnidaddeControl_ROM               => UnidaddeControl_ROM,
		UnidaddeControl_RWM               => UnidaddeControl_RWM,
		ROM_DATO       => ROM_DATO,
		Reset   =>    Reset 	 			   			 
	
 
 );

ALUU: ALU port map(

      Reloj						=> Reloj,
	   Reset 					=> Reset,
		UnidaddeControl_ALU 					=> UnidaddeControl_ALU,
		Operacion		      => Operacion,
		N2					=> N2,
		N1					=> N1,
		Resultado_Respuesta  => Resultado_Respuesta, 
		Disponibilidad       => Disponibilidad,
		Banderas             => Banderas        
		
		
);

ACC:AC  port map(

		Reinicio						=> Reinicio,
		reloj						=> Reloj,
		UnidaddeControl_AC				      => UnidaddeControl_AC,
		DR_AC                => DR_AC,
		Resultado_Respuesta  => Resultado_Respuesta,
		AC_DR 				   => AC_DR,
		N2				   => N2

);

IRR:  IR  port map(

		Reinicio						=> Reinicio,
		reloj						=> reloj,
		UnidaddeControl_IR				      => UnidaddeControl_IR,
		DR_IR                => DR_IR,
		ROM_DATO             => ROM_DATO,
		IR_DR 				   => IR_DR,
		IR_DATO_DR           => IR_DATO_DR,
		Operacion 				=> Operacion,
		IR_AR                => IR_AR
		--IR_UnidaddeControl				      => IR_UnidaddeControl
		
);


PCC: PC port map(

     Reloj			         => Reloj,
	  Reinicio			         => Reinicio,
	  UnidaddeControl_PC			         => UnidaddeControl_PC,
	  AR_PC				      => AR_PC,
	  DR_PC				      => DR_PC,
     Direccion_Interrupcion_PC=> Direccion_Interrupcion_PC,
	  PC_DR		            => PC_DR,
	  Direccion_ROM		   => Direccion_ROM

			
);

SPP: SP  port map(

      Reloj      => Reloj,
      Reinicio      => Reinicio,
      UnidaddeControl_SP      => UnidaddeControl_SP,
      SP_AR      => SP_AR

);

direccion_Interrupcionn: direccion_Interrupcion port map(

		Reinicio				=> Reinicio,
		reloj				=> Reloj,
		Direccion_Interrupcion_PC	=> Direccion_Interrupcion_PC
);
SRR: SR port map(

		Reinicio				=> Reinicio,
		reloj				=> reloj,
		UnidaddeControl_SR				=> UnidaddeControl_SR,
		Banderas       => Banderas,
		DR_SR          => DR_SR,
		SR_DR				=> SR_DR,
		SR_UnidaddeControl				=> SR_UnidaddeControl

);
ARR: AR port map(

		Reinicio				=> Reinicio,
		reloj				=> reloj,
		UnidaddeControl_AR				=> UnidaddeControl_AR,
		IR_AR          => IR_AR,
		DR_AR          => DR_AR,
		SP_AR          => SP_AR,
		AR_PC				=> AR_PC,
		Direccion_RWM	=> Direccion_RWM

);
DRR: DR port map(

		Reinicio			=> Reinicio,
		reloj			=> reloj,
		UnidaddeControl_DR			=> UnidaddeControl_DR,
		AC_DR       => AC_DR,
		Dato_RWM    => Dato_RWM,
		IR_DR       => IR_DR,
		IR_DATO_DR  => IR_DATO_DR,
		PC_DR       => PC_DR,
		SR_DR       => SR_DR,
		N1		=> N1,
		DR_AC  		=> DR_AC,
		DR_AR  	   =>	DR_AR,  				             
		DR_SR 		=> DR_SR,
		DR_IR       => DR_IR,
		DATO_RWM_Out=> DATO_RWM_Out,	
		DR_PC			=> DR_PC	

);

End ProcessorFULL4KHD1linkMegaArch;