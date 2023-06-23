library verilog;
use verilog.vl_types.all;
entity D_flip_flop is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic
    );
end D_flip_flop;
