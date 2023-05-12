library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        Reloj           : in     vl_logic;
        Reset           : in     vl_logic;
        CU_ALU          : in     vl_logic;
        Operacion       : in     vl_logic_vector(3 downto 0);
        Numero_B        : in     vl_logic_vector(15 downto 0);
        Numero_A        : in     vl_logic_vector(15 downto 0);
        Resultado_Respuesta: out    vl_logic_vector(15 downto 0);
        Disponibilidad  : out    vl_logic;
        Banderas        : out    vl_logic_vector(3 downto 0)
    );
end alu;
