library verilog;
use verilog.vl_types.all;
entity Procesador_vlg_sample_tst is
    port(
        DATO_RWM        : in     vl_logic_vector(15 downto 0);
        Enter           : in     vl_logic;
        Interrupciones  : in     vl_logic;
        Reloj           : in     vl_logic;
        reset           : in     vl_logic;
        Restaurar       : in     vl_logic;
        ROM_DATO        : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end Procesador_vlg_sample_tst;
