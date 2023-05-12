library verilog;
use verilog.vl_types.all;
entity Sistema_vlg_sample_tst is
    port(
        Enter           : in     vl_logic;
        Interrupciones  : in     vl_logic;
        Reloj           : in     vl_logic;
        Restaurar       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Sistema_vlg_sample_tst;
