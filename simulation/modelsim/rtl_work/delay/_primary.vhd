library verilog;
use verilog.vl_types.all;
entity delay is
    generic(
        T1ms            : vl_logic_vector(0 to 13) := (Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        Sys_clk         : in     vl_logic;
        H2L_sig         : in     vl_logic;
        L2H_sig         : in     vl_logic;
        Sys_reset       : in     vl_logic;
        Pin_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T1ms : constant is 1;
end delay;
