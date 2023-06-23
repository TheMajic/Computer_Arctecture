library verilog;
use verilog.vl_types.all;
entity Wtime_bbqm is
    port(
        pcount          : in     vl_logic_vector(3 downto 0);
        tcount          : in     vl_logic_vector(1 downto 0);
        wtime1          : out    vl_logic_vector(3 downto 0);
        wtime2          : out    vl_logic_vector(3 downto 0)
    );
end Wtime_bbqm;
