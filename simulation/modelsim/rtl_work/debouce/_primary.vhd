library verilog;
use verilog.vl_types.all;
entity debouce is
    port(
        Sys_clk         : in     vl_logic;
        Sys_reset       : in     vl_logic;
        Pin_in          : in     vl_logic;
        Pin_out         : out    vl_logic
    );
end debouce;
