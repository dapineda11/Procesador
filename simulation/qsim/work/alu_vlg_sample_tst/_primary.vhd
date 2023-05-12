library verilog;
use verilog.vl_types.all;
entity alu_vlg_sample_tst is
    port(
        CU_ALU          : in     vl_logic;
        Numero_A        : in     vl_logic_vector(15 downto 0);
        Numero_B        : in     vl_logic_vector(15 downto 0);
        Operacion       : in     vl_logic_vector(3 downto 0);
        Reloj           : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end alu_vlg_sample_tst;
