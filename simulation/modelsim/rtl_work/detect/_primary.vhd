library verilog;
use verilog.vl_types.all;
entity detect is
    generic(
        T100us          : vl_logic_vector(0 to 10) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0)
    );
    port(
        Sys_clk         : in     vl_logic;
        Sys_reset       : in     vl_logic;
        Pin_in          : in     vl_logic;
        H2L_Sig         : out    vl_logic;
        L2H_Sig         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T100us : constant is 1;
end detect;
