library verilog;
use verilog.vl_types.all;
entity SP_vlg_check_tst is
    port(
        SP_AR           : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end SP_vlg_check_tst;
