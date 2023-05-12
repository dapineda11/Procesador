library verilog;
use verilog.vl_types.all;
entity SP_vlg_sample_tst is
    port(
        CU_SP           : in     vl_logic_vector(2 downto 0);
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SP_vlg_sample_tst;
