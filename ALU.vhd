library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


entity alu is
port(
		Reloj    			    			 : in std_logic;
		Reset 	 			   			 : in std_logic;
		UnidaddeControl_ALU            				    : in std_logic;
		Operacion		             	       : in std_logic_vector(3 downto 0);
		N2								 : in std_logic_vector (15 downto 0);
		N1								 : in std_logic_vector (15 downto 0);
		Resultado_Respuesta            : out std_logic_vector (15 downto 0);
		Disponibilidad : out std_LOGIC;
		Banderas                       : out std_logic_vector (3 downto 0)

		
		);
		
	end entity alu;     

architecture aluArch of alu is

component Control is port (

	   Reset 						: in std_logic;
		UnidaddeControl_ALU 						: in std_logic;
		Reloj							: in std_logic;
		Control_NumeroA         : out std_logic;
      Control_NumeroB         : out std_logic;
      Control_Resultado     	: out std_logic;
      Control_Contador        : out std_logic;
		OP_UnidaddeControl		             	: in std_logic_vector(3 downto 0);
		Control_Desplazamiento_Rotacion                    : out std_logic_vector(1 downto 0);
		
		control_operaciones					: OUT std_logic;
		Control_FlagSelector			: out std_logic;
		Disponibilidad : out std_LOGIC;
		control_Corretaje :out std_logic;
		control_suma :out std_LOGIC_vector(1 downto 0);
		control_sumas_Corretaje :OUT std_LOGIC;
		habilitado: in std_logic;
		UnidaddeControl_CONTROL                     : out std_LOGIC
);

end component;

component Boothasaurus_Rex  is port(
		Reloj    			    			 : in std_logic;
		Reset 	 			   			 : in std_logic;
		UnidaddeControl_ALU                          : in std_LOGIC;
		N1_Boothasaurus_Rex			 : in std_logic_vector(7 downto 0);
		NumeroB_Registro_NumB				       : in std_logic_vector(7 downto 0);
		Respuesta_Mux           	    : OUT std_logic_vector(15 downto 0);
	   NEGativo_Boothasaurus_Rex	       : OUT std_logic;
	   CERO_MULT                      : out  std_logic;
		habilitado: out std_logic;
		UnidaddeControl_CONTROL                     : in std_LOGIC
		);
		
	end component Boothasaurus_Rex;   

component NumeroB  is port (
		
		reset										: in std_logic;
		reloj										: in std_logic;
		Control_NumeroB				      : in std_logic;
		NumeroB_CA_2				: out std_logic_vector(15 downto 0);
		N2									: in std_logic_vector (15 downto 0);
				NumeroB_Operacioneslogicas				: out std_logic_vector(15 downto 0);
				NumeroB_Registro_NumB				       : out std_logic_vector(7 downto 0);
				overflow_multiplicacion: out std_logic
);
end component;

component NumeroA is port (

		reset										: in std_logic;
		reloj										: in std_logic;
		Control_NumeroA				      : in std_logic;
		NumeroA_Sumador				  	   : out std_logic_vector(15 downto 0);
		N1									: in std_logic_vector (15 downto 0);
		NumeroA_Desplazamiento_Rotacion				  	   : out std_logic_vector(15 downto 0);
		NumeroA_Operacioneslogicas				  	   : out std_logic_vector(15 downto 0);
		N1_Boothasaurus_Rex			 : out std_logic_vector(7 downto 0);
		overflow_multiplicacion_A: out std_logic
		
);
end component;

component CA_2 is port (
		
            NumeroB_CA_2	: in std_logic_vector(15 downto 0);
				CA_2_Sumador   :	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
				
);
end component;

component Sumador is port (
		
		NumeroA_Sumador, CA_2_Sumador: IN STD_LOGIC_VECTOR(15 DOWNTO 0);

Sumador_MUX: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
Sumador_FlagSelector			: out std_logic_vector (2 downto 0);
Corretaje_Sumador : in std_LOGIC;
sumador_Corretaje : out std_LOGIC;
N2								 : in std_logic_vector (15 downto 0);
control_suma :in std_LOGIC_vector(1 downto 0);
control_sumas_Corretaje :in std_LOGIC;
FlagSelector_Sumador			: IN std_logic_vector (2 downto 0)

);				

end component;


component Resultado is port (
		
		reset										: in std_logic;
		reloj										: in std_logic;
		Control_Resultado				      : in std_logic;
		Resultado_Respuesta				  	: out std_logic_vector(15 downto 0);
		MUX_Resultado						   : in std_logic_vector (15 downto 0);
		Resultado_ResultadoCero			       	: out std_logic_vector(15 downto 0)
					
);
end component;
component ResultadoCero is port (
		
	MUX_ResultadoCero		: in std_logic_vector (15 downto 0);
	ResultadoCero_FlagSelector		  	: out std_logic
					
);
end component;
component Desplazamiento_Rotacion is port(
		NumeroA_Desplazamiento_Rotacion		               : in std_logic_vector (15 downto 0);
		Control_Desplazamiento_Rotacion                    : in std_logic_vector(1 downto 0);
		Desplazamiento_Rotacion_MUX		            : out std_logic_vector (15 downto 0);
		Desplazamiento_Rotacion_FlagSelector		  	   : out std_logic
		
		);
end component;
component Operacioneslogicas IS PORT	(

	Operaciones_Operacioneslogicas:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
				NumeroA_Operacioneslogicas	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				NumeroB_Operacioneslogicas	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				Operacioneslogicas_MUX:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
				
				
);
end component;
component FlagSelector is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		ResultadoCero_FlagSelector				: in std_logic;
		Banderas						    		: out std_logic_vector(3 downto 0);
		Operaciones_FlagSelector			: in std_logic_vector(3 downto 0);
		Desplazamiento_Rotacion_FlagSelector	: in std_logic;
		
		Sumador_FlagSelector			: in std_logic_vector (2 downto 0);
		Control_FlagSelector			: in std_logic;
		FlagSelector_Sumador			: OUT std_logic_vector (2 downto 0);
		NEGativo_Boothasaurus_Rex	       : in std_logic;
		CERO_MULT                      : in  std_logic;
		overflow_multiplicacion: IN std_logic;
		overflow_multiplicacion_A: IN std_logic
	
				
	);
	end component;
	component Operaciones is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		control_operaciones					: in std_logic;
		Operacion				            : in std_logic_vector(3 downto 0);
		OP_UnidaddeControl           				  	   : out std_logic_vector(3 downto 0);
		Operaciones_FlagSelector				            : out std_logic_vector(3 downto 0);
		Operaciones_operacioneslogicas				            : out std_logic_vector(3 downto 0);
		operaciones_sumador : out std_LOGIC_VECTOR (15 downto 0)
	
				
	);
	end component;   
	component mux IS
        PORT(Sumador_mux 						: in std_logic_vector (15 downto 0); 
             Desplazamiento_Rotacion_mux 						: in std_logic_vector (15 downto 0);
             operacioneslogicas_mux 						: in std_logic_vector (15 downto 0);
            
             mux_Resultado 						: out std_logic_vector (15 downto 0);
				
				 Operacion		             	       : in std_logic_vector(3 downto 0);
				 	mux_ResultadoCero		:  OUT std_logic_vector (15 downto 0);
					Respuesta_Mux           	    : in std_logic_vector(15 downto 0)
				  );
     END component;
	  
component Corretaje is
port(
		
		reset										: in std_logic;
		reloj										: in std_logic;
		control_Corretaje :in std_logic;
		Corretaje_Sumador : out std_LOGIC;
      sumador_Corretaje : in std_LOGIC
		
				
	);
	end component;   


signal Control_NumeroA         :  std_logic;
signal control_Corretaje : std_logic;
signal operacioneslogicas_Registro_Logicas:	STD_LOGIC_VECTOR(15 DOWNTO 0);
signal Control_NumeroB         :  std_logic;
signal Control_Resultado     	 :  std_logic;
signal Control_Contador        :  std_logic;
signal Control_operaciones        :  std_logic;

signal Control_Desplazamiento_Rotacion         :  std_logic_vector (1 downto 0);
signal Operaciones_Operacioneslogicas:	STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Operaciones_FlagSelector			: std_logic_vector(3 downto 0);
signal NumeroB_CA_2	 :  std_logic_vector(15 downto 0);
signal NumeroB_Operacioneslogicas				: std_logic_vector(15 downto 0);
signal NumeroA_sumador     	 :  std_logic_vector(15 downto 0);
signal NumeroA_Desplazamiento_Rotacion				  	   : std_logic_vector(15 downto 0);
signal NumeroA_Operacioneslogicas				  	   :  std_logic_vector(15 downto 0);
signal CA_2_sumador   :  std_logic_vector(15 downto 0);
signal Sumador_MUX     	 :  std_logic_vector(15 downto 0);
signal Sumador_FlagSelector : std_LOGIC_VECTOR (2 downto 0);
signal Operacioneslogicas_MUX     	 :  std_logic_vector(15 downto 0);
signal MUX_Resultado   :  std_logic_vector(15 downto 0);

signal Desplazamiento_Rotacion_FlagSelector		  	   :  std_logic;
signal Resultado_ResultadoCero     	 :  std_logic_vector(15 downto 0);
signal Corretaje_Sumador:  STD_LOGIC;
signal sumador_Corretaje :std_LOGIC;
signal ResultadoCero_FlagSelector		  	: std_logic;
signal Desplazamiento_Rotacion_MUX		            :  std_logic_vector (15 downto 0);
signal OP_UnidaddeControl		            :  std_logic_vector (3 downto 0);
signal Control_FlagSelector			: std_logic;

SIGNAL mux_ResultadoCero : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal control_suma :std_LOGIC_vector(1 downto 0);
SIGNAL control_sumas_Corretaje : std_LOGIC;
SIGNAL FlagSelector_Sumador			: std_logic_vector (2 downto 0);
signal	N1_Boothasaurus_Rex			 :  std_logic_vector(7 downto 0);
sigNAL		NumeroB_Registro_NumB				       :  std_logic_vector(7 downto 0);
signal		Respuesta_Mux           	    :  std_logic_vector(15 downto 0);
signal 	   NEGativo_Boothasaurus_Rex	       :std_logic;
signal	   CERO_MULT                      :   std_logic;
signal		UnidaddeControl_CONTROL                     :  std_LOGIC;
signal overflow_multiplicacion:  std_logic;
signal habilitado: std_logic;
SIGNAL overflow_multiplicacion_A:  std_logic;

begin

Controll: Control port map(

 reset                	=> reset,
 reloj						=> reloj,
 UnidaddeControl_ALU                  => UnidaddeControl_ALU,
Control_NumeroA			=>Control_NumeroA,
Control_NumeroB			=>Control_NumeroB,
Control_Resultado			=> Control_Resultado,
Control_Contador			=>Control_Contador,
OP_UnidaddeControl			            =>OP_UnidaddeControl,
Control_Desplazamiento_Rotacion 			=> Control_Desplazamiento_Rotacion,
Disponibilidad			=>Disponibilidad,
control_operaciones			            =>control_operaciones,

Control_FlagSelector		=>Control_FlagSelector	,
control_Corretaje => control_Corretaje,
control_suma => control_suma,
control_sumas_Corretaje => control_sumas_Corretaje ,
habilitado=>habilitado,
UnidaddeControl_CONTROL        =>UnidaddeControl_CONTROL                  
		
 
 );

Boothasaurus_Rexr: Boothasaurus_Rex port map(

	Reloj   => Reloj,
		Reset 	 			   		=> Reset, 	 	
		UnidaddeControl_ALU => UnidaddeControl_ALU,
		N1_Boothasaurus_Rex		=> N1_Boothasaurus_Rex,	
		NumeroB_Registro_NumB				      => NumeroB_Registro_NumB,
		Respuesta_Mux           	   => Respuesta_Mux,
	   NEGativo_Boothasaurus_Rex	      => NEGativo_Boothasaurus_Rex,
	   CERO_MULT                     => CERO_MULT,
		habilitado=>habilitado,
		UnidaddeControl_CONTROL                    => UnidaddeControl_CONTROL

		
		
);

NumeroBB:NumeroB  port map(

		reloj							=> reloj,
		reset							=> reset,
		Control_NumeroB         => Control_NumeroB,
		NumeroB_CA_2	=> NumeroB_CA_2,
		N2 => N2,
		NumeroB_Operacioneslogicas	 => NumeroB_Operacioneslogicas,
		NumeroB_Registro_NumB	=> NumeroB_Registro_NumB		,
overflow_multiplicacion => overflow_multiplicacion
);

NumeroAA:  NumeroA  port map(

		reloj							=> reloj,
		reset							=> reset,
		Control_NumeroA         => Control_NumeroA,
		NumeroA_Sumador			=> NumeroA_Sumador,
		N1 => N1,
		NumeroA_Desplazamiento_Rotacion => NumeroA_Desplazamiento_Rotacion,
		NumeroA_Operacioneslogicas => NumeroA_Operacioneslogicas,
		N1_Boothasaurus_Rex	=> N1_Boothasaurus_Rex,
		overflow_multiplicacion_A => overflow_multiplicacion_A
		
);


CA_22: CA_2 port map(

		NumeroB_CA_2	=> NumeroB_CA_2,
		CA_2_Sumador	=> CA_2_Sumador


			
);

Sumadorr: Sumador  port map(

NumeroA_Sumador			=> NumeroA_Sumador,  
CA_2_Sumador	=> CA_2_Sumador,

Sumador_MUX			=> Sumador_MUX,
Sumador_FlagSelector	=> Sumador_FlagSelector,
sumador_Corretaje => sumador_Corretaje,
Corretaje_Sumador => Corretaje_Sumador,
N2 => N2,
control_suma => control_suma,
control_sumas_Corretaje => control_sumas_Corretaje ,
FlagSelector_Sumador	=> FlagSelector_SumadoR


);

resultadoo: Resultado port map(

		reloj								=> reloj,
		reset								=> reset,
		Control_Resultado          => Control_Resultado,
		Resultado_Respuesta			=> Resultado_Respuesta,
		MUX_Resultado			   => MUX_Resultado,
		Resultado_ResultadoCero			   => Resultado_ResultadoCero
);
ResultadoCeroo: ResultadoCero port map(

		mux_ResultadoCero => mux_ResultadoCero	,
		ResultadoCero_FlagSelector		=> ResultadoCero_FlagSelector

);
Operacioneslogicass: Operacioneslogicas port map(

		Operaciones_Operacioneslogicas								=> Operaciones_Operacioneslogicas,
		NumeroA_Operacioneslogicas							=> NumeroA_Operacioneslogicas,
		NumeroB_Operacioneslogicas          => NumeroB_Operacioneslogicas,
	Operacioneslogicas_MUX			=> Operacioneslogicas_MUX
		

);
FlagSelectors: FlagSelector port map(

		reset								=> reset,
		reloj							=> reloj,
		ResultadoCero_FlagSelector          => ResultadoCero_FlagSelector,
		Banderas				=> Banderas	,
		Operaciones_FlagSelector								=> Operaciones_FlagSelector,
		Desplazamiento_Rotacion_FlagSelector							=> Desplazamiento_Rotacion_FlagSelector,
		
		Sumador_FlagSelector			=> Sumador_FlagSelector,
		Control_FlagSelector			=> Control_FlagSelector,
		FlagSelector_Sumador	=> FlagSelector_SumadoR,
		NEGativo_Boothasaurus_Rex	 => negativo_Boothasaurus_Rex,
		CERO_MULT        => cerO_MULT,
		overflow_multiplicacion => overflow_multiplicacion,
		overflow_multiplicacion_A=> overflow_multiplicacion_A
);
Desplazamiento_Rotacionn: Desplazamiento_Rotacion port map(
	

		NumeroA_Desplazamiento_Rotacion								=> NumeroA_Desplazamiento_Rotacion	,
		Control_Desplazamiento_Rotacion							=> Control_Desplazamiento_Rotacion,
		Desplazamiento_Rotacion_MUX          => Desplazamiento_Rotacion_MUX,
		Desplazamiento_Rotacion_FlagSelector				=>Desplazamiento_Rotacion_FlagSelector
		

);
Operacioness: Operaciones port map(
	

		reset									=> reset		,
		reloj							=> reloj,
		operacion => operacion,
		control_operaciones         => control_operaciones,
		OP_UnidaddeControl 			=>OP_UnidaddeControl ,
			Operaciones_FlagSelector         => Operaciones_FlagSelector,
		Operaciones_operacioneslogicas			=>Operaciones_operacioneslogicas
		

);
MUXX: MUX port map(
	
    	
		Sumador_mux  => Sumador_mux ,
		Desplazamiento_Rotacion_mux          => Desplazamiento_Rotacion_mux ,
		operacioneslogicas_mux 			=> operacioneslogicas_mux   ,
mux_Resultado  				=>mux_Resultado ,
	
	Operacion=>Operacion,
	mux_ResultadoCero => mux_ResultadoCero,
	Respuesta_Mux    => Respuesta_Mux           	 
);

Corretajey: Corretaje port map(
	
    	reset	 => reset	,
		reloj	=> reloj	 ,
		control_Corretaje         => control_Corretaje ,
		Corretaje_Sumador		=> Corretaje_Sumador,  
  sumador_Corretaje		=>	  sumador_Corretaje 

);

End aluArch;