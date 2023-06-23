library verilog;
use verilog.vl_types.all;
entity BBQM_counter is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        input1          : in     vl_logic;
        input2          : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0)
    );
end BBQM_counter;
