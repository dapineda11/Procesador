library verilog;
use verilog.vl_types.all;
entity SP is
    port(
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        CU_SP           : in     vl_logic_vector(2 downto 0);
        SP_AR           : out    vl_logic_vector(9 downto 0)
    );
end SP;
