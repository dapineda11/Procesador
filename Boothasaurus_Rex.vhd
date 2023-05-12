
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity Boothasaurus_Rex is
port(
		Reloj    			    			 : in std_logic;
		Reset 	 			   			 : in std_logic;
		UnidaddeControl_ALU : in std_LOGIC;
		N1_Boothasaurus_Rex			 : in std_logic_vector(7 downto 0);
		NumeroB_Registro_NumB				       : in std_logic_vector(7 downto 0);
		Respuesta_Mux           	    : OUT std_logic_vector(15 downto 0);
	   NEGativo_Boothasaurus_Rex	       : OUT std_logic;
	   CERO_MULT                      : out  std_logic;
		habilitado: out std_logic;
		UnidaddeControl_CONTROL                     : in std_LOGIC
		);
		
	end entity Boothasaurus_Rex;     

architecture Boothasaurus_RexArch of Boothasaurus_Rex is

component Control_Boothsaurus is port (

		Reset 						: in std_logic;
		Reloj							: in std_logic;
		UnidaddeControl_ALU : in std_LOGIC;
		control_contador        : OUT STD_LOGIC;
		control_Registro_CA_2          :OUT std_logic;
		control_NumeroB         :OUT std_logic;
		control_NumeroA         : OUT std_logic ;
      cnt_control             : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		controlMult	            : out std_logic_vector(2 downto 0);
      cond                    : in  std_logic_vector (1 downto 0);
      SELECTOR_SUMADOR        : OUT STD_logic_vector (1 DOWNTO 0);
      fin_conteo              : in std_LOGIC;
      CONTROL_RESP            : OUT STD_LOGIC;
		habilitado: out std_logic;
      UnidaddeControl_CONTROL              : in std_LOGIC
	
		
);

end component;

component Contador is port (

	     control_contador    : IN  STD_LOGIC;
        cnt_control         : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)	;
		  cnt                 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		  fin_conteo          : out std_LOGIC
);
end component;


component Suma_Booth is port (

		A_Sumar,Registro_NumB_sumador,Registro_CA_2_sumador	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      SELECTOR_SUMADOR                    : IN STD_LOGIC_vector(1 downto 0);
      Sumar_A                             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      resp                                : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		
);
end component;

component CA_2_Boothsaurus is port (
		
         NumeroB_Registro_NumB	                  :	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			COMPLEMENTOA2_Registro_CA_2             :	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
				
);
end component;

component Registro_CA_2 is port (
		
		reset										: in std_logic;
		reloj										: in std_logic;
		COMPLEMENTOA2_Registro_CA_2				   : in std_logic_vector(7 downto 0);
		control_Registro_CA_2                   :in std_logic;
		Registro_CA_2_sumador				         : out std_logic_vector(7 downto 0)
);				

end component;


component Registro_NumB is port (
		
		reset										: in std_logic;
		reloj										: in std_logic;
		NumeroB_Registro_NumB				         : in std_logic_vector(7 downto 0);
		control_NumeroB                  :in std_logic;
		Registro_NumB_sumador				         : out std_logic_vector(7 downto 0)
					
);
end component;
component regop is port (
		
		reset										: in std_logic;
		reloj										: in std_logic;
		N1_Boothasaurus_Rex				: in std_logic_vector(7 downto 0);
		Sumar_A			               	: in std_logic_vector(7 downto 0);
		control_NumeroA                  : in std_logic ;
		A_Sumar			               	: OUT std_logic_vector(7 downto 0);
		Boothasaurus_Rex_RESPUESTA				: out std_logic_vector(15 downto 0);
	   controlMult	                     : in std_logic_vector(2 downto 0);
	   cond                             : out  std_logic_vector (1 downto 0)
					
);
END COMponent;
COMponent REGRESP IS PORT(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		CONtrol_resp						   : in std_logic;
		Boothasaurus_Rex_RESPUESTA				: IN std_logic_vector(15 downto 0);
		Respuesta_Mux           			: OUT std_logic_vector(15 downto 0);
	   NEGativo_Boothasaurus_Rex	         : OUT std_logic;
	   CERO_MULT                        : out  std_logic
	);    

end component;
signal control_contador                 :  STD_LOGIC;
signal control_Registro_CA_2                   : std_logic;
signal control_NumeroB                  : std_logic;
signal control_NumeroA                  :  std_logic ;
signaL control_SELECTOR                 :  std_logic_VECtor(2 DOWNTO 0);
signal cnt_control                      : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal regop_desplazamiento             :  std_logic_vector(16 downto 0);
signal desplazamiento_RegOP			    :  std_logic_vector(16 downto 0);
signal A_Sumar,Registro_NumB_sumador,Registro_CA_2_sumador	:  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal SELECTOR_SUMADOR                      :  STD_LOGIC_vector(1 downto 0);
signal Sumar_A                               :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal COMPLEMENTOA2_Registro_CA_2                  :		STD_LOGIC_VECTOR(7 DOWNTO 0);
signal controlMult	                        :  std_logic_vector(2 downto 0);
signal cond                                  :  std_logic_vector ( 1 downto 0);
signal fin_conteo                            :  std_LOGIC;
SIGnal Boothasaurus_Rex_RESPUESTA               : std_logic_vector(15 downto 0);
SIGNAL CONTROL_RESP                          :  STD_LOGIC;
begin

Control_Boothsaurusm: Control_Boothsaurus port map(
	
 reset                	=> reset,
 reloj						=> reloj,
 UnidaddeControl_ALU => UnidaddeControl_ALU,
control_contador			=>control_contador,
control_Registro_CA_2			=>control_Registro_CA_2,
control_NumeroB			=> control_NumeroB,
control_NumeroA			=>control_NumeroA,
 cnt_control			=>  cnt_control,
 controlMult	=> controlMult	,
  conD	=> conD	,
 SELECTOR_SUMADOR			            =>SELECTOR_SUMADOR,
 fin_conteo =>  fin_conteo,
 CONTROL_RESP => CONTROL_RESP,
 habilitado  => habilitado,
 UnidaddeControl_CONTROL => UnidaddeControl_CONTROL 

 );

Contadorr: Contador port map(

		control_contador 						=> control_contador ,
		cnt_control						=>cnt_control,
fin_conteo=> fin_conteo	
		
);


Suma_Boothm:  Suma_Booth  port map(

		A_Sumar						=> A_Sumar,
		Registro_NumB_sumador						=> Registro_NumB_sumador,
		Registro_CA_2_sumador        => Registro_CA_2_sumador,
		SELECTOR_SUMADOR			=> SELECTOR_SUMADOR,
		Sumar_A =>Sumar_A
	
		
);


CA_2_Boothsaurusm: CA_2_Boothsaurus port map(

		 NumeroB_Registro_NumB	=>  NumeroB_Registro_NumB,
		COMPLEMENTOA2_Registro_CA_2	=> COMPLEMENTOA2_Registro_CA_2


			
);

Registro_CA_22: Registro_CA_2  port map(
		
reset				=>reset	,  
	reloj	=> 	reloj	,
COMPLEMENTOA2_Registro_CA_2				=> COMPLEMENTOA2_Registro_CA_2	,  
control_Registro_CA_2   		=> control_Registro_CA_2   ,
	Registro_CA_2_sumador		=> 	Registro_CA_2_sumador	

);

Registro_NumBm: Registro_NumB port map(
	
		reloj								=> reloj,
		reset								=> reset,
		NumeroB_Registro_NumB         => NumeroB_Registro_NumB,
		control_NumeroB  			=> control_NumeroB  ,
		Registro_NumB_sumador				   => Registro_NumB_sumador	
);
regopp: regop port map(

		
		 reset                	=> reset,
 reloj						=> reloj,
N1_Boothasaurus_Rex                 => N1_Boothasaurus_Rex,
Sumar_A				=>Sumar_A	,
control_NumeroA			=> control_NumeroA,
		A_Sumar	 => 	A_Sumar		,
		Boothasaurus_Rex_RESPUESTA			=> Boothasaurus_Rex_RESPUESTA,
	controlMult	=> controlMult	,	
 cond => cond

);
                     
REGRESPP:  REGRESP  port map(

		reset						=>reset,
		reloj							=> reloj	,
		CONtrol_resp       => CONtrol_resp,
		Boothasaurus_Rex_RESPUESTA			=> Boothasaurus_Rex_RESPUESTA,
		Respuesta_Mux =>Respuesta_Mux, 
		NEGativo_Boothasaurus_Rex => NEGativo_Boothasaurus_Rex,
		 CERO_MULT =>  CERO_MULT
);
End Boothasaurus_RexArch;