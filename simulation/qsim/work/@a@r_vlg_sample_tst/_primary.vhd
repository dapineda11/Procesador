library verilog;
use verilog.vl_types.all;
entity AR_vlg_sample_tst is
    port(
        CU_AR           : in     vl_logic_vector(4 downto 0);
        DR_AR           : in     vl_logic_vector(9 downto 0);
        IR_AR           : in     vl_logic_vector(8 downto 0);
        reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        SP_AR           : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end AR_vlg_sample_tst;
