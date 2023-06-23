library verilog;
use verilog.vl_types.all;
entity Bbqm_pro is
    port(
        clk             : in     vl_logic;
        input1          : in     vl_logic;
        input2          : in     vl_logic;
        reset           : in     vl_logic;
        tcount          : in     vl_logic_vector(1 downto 0);
        empty           : out    vl_logic;
        full            : out    vl_logic;
        leds_pcount     : out    vl_logic_vector(6 downto 0);
        leds_wtime1     : out    vl_logic_vector(6 downto 0);
        leds_wtime2     : out    vl_logic_vector(6 downto 0)
    );
end Bbqm_pro;
