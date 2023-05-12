library verilog;
use verilog.vl_types.all;
entity PC_vlg_sample_tst is
    port(
        AR_PC           : in     vl_logic_vector(9 downto 0);
        CU_PC           : in     vl_logic_vector(3 downto 0);
        Direccion_Interrupcion_PC: in     vl_logic_vector(9 downto 0);
        DR_PC           : in     vl_logic_vector(9 downto 0);
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PC_vlg_sample_tst;
