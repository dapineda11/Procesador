library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        CU_PC           : in     vl_logic_vector(3 downto 0);
        AR_PC           : in     vl_logic_vector(9 downto 0);
        DR_PC           : in     vl_logic_vector(9 downto 0);
        Direccion_Interrupcion_PC: in     vl_logic_vector(9 downto 0);
        PC_DR           : out    vl_logic_vector(9 downto 0);
        Direccion_ROM   : out    vl_logic_vector(9 downto 0)
    );
end PC;
