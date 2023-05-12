library verilog;
use verilog.vl_types.all;
entity AR_vlg_check_tst is
    port(
        AR_PC           : in     vl_logic_vector(9 downto 0);
        Direccion_RWM   : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end AR_vlg_check_tst;
