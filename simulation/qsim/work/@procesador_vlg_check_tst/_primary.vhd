library verilog;
use verilog.vl_types.all;
entity Procesador_vlg_check_tst is
    port(
        AC_DR           : in     vl_logic_vector(15 downto 0);
        CU_PC           : in     vl_logic_vector(3 downto 0);
        CU_ROM          : in     vl_logic;
        CU_RWM          : in     vl_logic_vector(1 downto 0);
        DATO_RWM_Out    : in     vl_logic_vector(15 downto 0);
        DIRECCION_ROM   : in     vl_logic_vector(9 downto 0);
        DIRECCION_RWM   : in     vl_logic_vector(9 downto 0);
        EstadosQ        : in     vl_logic_vector(53 downto 0);
        sampler_rx      : in     vl_logic
    );
end Procesador_vlg_check_tst;
