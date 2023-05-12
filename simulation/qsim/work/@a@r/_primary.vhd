library verilog;
use verilog.vl_types.all;
entity AR is
    port(
        Restaurar       : in     vl_logic;
        reloj           : in     vl_logic;
        CU_AR           : in     vl_logic_vector(4 downto 0);
        IR_AR           : in     vl_logic_vector(8 downto 0);
        DR_AR           : in     vl_logic_vector(9 downto 0);
        SP_AR           : in     vl_logic_vector(9 downto 0);
        AR_PC           : out    vl_logic_vector(9 downto 0);
        Direccion_RWM   : out    vl_logic_vector(9 downto 0)
    );
end AR;
