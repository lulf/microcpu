library ieee;
use ieee.std_logic_1164.all;
use work.alu_pkg.all;

entity alu_tb is
end entity alu_tb;

architecture rtl of alu_tb is
  signal a_in : alu_input;
  signal a_out : alu_output;

  
begin  -- architecture rtl
  alu_0 : alu_impl port map (
    input => a_in,
    output => a_out);
  
  process
  begin
    a_in.in_a <= X"6";
    a_in.in_b <= X"4";
    wait for 1 ns;
    assert a_out.result = X"4" report "AND operation not correct" severity failure;
    assert false report "end of test" severity note;
    wait;
  end process;   
     

end architecture rtl;
