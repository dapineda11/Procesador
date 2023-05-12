library verilog;
use verilog.vl_types.all;
entity Sistema is
    port(
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        Interrupciones  : in     vl_logic;
        DATO_RWM_Out    : out    vl_logic_vector(15 downto 0);
        Enter           : in     vl_logic;
        Direccion_ROM   : out    vl_logic_vector(9 downto 0);
        AC_DR           : out    vl_logic_vector(15 downto 0);
        DIRECCION_RWM   : out    vl_logic_vector(9 downto 0);
        EstadosQ        : out    vl_logic_vector(54 downto 0);
        DATO_RWM        : out    vl_logic_vector(15 downto 0)
    );
end Sistema;
