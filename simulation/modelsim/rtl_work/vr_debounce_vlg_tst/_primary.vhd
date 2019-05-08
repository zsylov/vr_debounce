library verilog;
use verilog.vl_types.all;
entity vr_debounce_vlg_tst is
    generic(
        T1MS            : vl_logic_vector(0 to 14) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T1MS : constant is 1;
end vr_debounce_vlg_tst;
