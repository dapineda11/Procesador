library verilog;
use verilog.vl_types.all;
entity Procesador is
    port(
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        reset           : in     vl_logic;
        Enter           : in     vl_logic;
        DATO_RWM        : in     vl_logic_vector(15 downto 0);
        ROM_DATO        : in     vl_logic_vector(15 downto 0);
        Interrupciones  : in     vl_logic;
        DIRECCION_ROM   : out    vl_logic_vector(9 downto 0);
        CU_ROM          : out    vl_logic;
        CU_RWM          : out    vl_logic_vector(1 downto 0);
        DATO_RWM_Out    : out    vl_logic_vector(15 downto 0);
        EstadosQ        : out    vl_logic_vector(53 downto 0);
        DIRECCION_RWM   : out    vl_logic_vector(9 downto 0);
        CU_PC           : out    vl_logic_vector(3 downto 0);
        AC_DR           : out    vl_logic_vector(15 downto 0)
    );
end Procesador;
