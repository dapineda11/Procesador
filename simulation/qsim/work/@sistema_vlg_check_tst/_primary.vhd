library verilog;
use verilog.vl_types.all;
entity Sistema_vlg_check_tst is
    port(
        AC_DR           : in     vl_logic_vector(15 downto 0);
        DATO_RWM        : in     vl_logic_vector(15 downto 0);
        DATO_RWM_Out    : in     vl_logic_vector(15 downto 0);
        Direccion_ROM   : in     vl_logic_vector(9 downto 0);
        DIRECCION_RWM   : in     vl_logic_vector(9 downto 0);
        EstadosQ        : in     vl_logic_vector(54 downto 0);
        sampler_rx      : in     vl_logic
    );
end Sistema_vlg_check_tst;
