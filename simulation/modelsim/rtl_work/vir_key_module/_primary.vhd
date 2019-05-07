library verilog;
use verilog.vl_types.all;
entity vir_key_module is
    generic(
        T8ms            : vl_logic_vector(0 to 17) := (Hi1, Hi0, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        In_Sig          : in     vl_logic;
        Q_Sig           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T8ms : constant is 1;
end vir_key_module;
