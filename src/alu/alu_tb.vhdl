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
    -- Test AND
    a_in.in_a <= X"6";
    a_in.in_b <= X"4";
    a_in.in_op <= OP_AND;
    wait for 1 ns;
    assert a_out.result = X"4" report "AND operation not correct" severity failure;
    assert a_out.status = X"0" report "AND operating gives wrong status" severity failure;
    -- Test OR
    a_in.in_a <= X"6";
    a_in.in_b <= X"4";
    a_in.in_op <= OP_OR;
    wait for 1 ns;
    assert a_out.result = X"6" report "OR operation gives wrong result" severity failure;
    -- Test ADD
    a_in.in_a <= X"4";
    a_in.in_b <= X"3";
    a_in.in_op <= OP_ADD;
    wait for 1 ns;
    assert a_out.result = X"7" report "ADD operation gives wrong result" severity failure;
    -- Test SUB 
    a_in.in_a <= X"4";
    a_in.in_b <= X"3";
    a_in.in_op <= OP_ADD;
    wait for 1 ns;
    assert a_out.result = X"1" report "SUB operation gives wrong result" severity failure;

    -- Test ZERO flag
    a_in.in_a <= X"8";
    a_in.in_b <= X"4";
    a_in.in_op <= OP_AND;
    wait for 1 ns;
    assert a_out.status = STATUS_ZERO report "ZERO status flag not set" severity failure;

    -- Test INVALID operation flag
    a_in.in_a <= X"8";
    a_in.in_b <= X"4";
    a_in.in_op <= X"0";
    wait for 1 ns;
    assert a_out.status = (STATUS_INVOP or STATUS_ZERO) report "INVALID operation flag not set" severity failure;
    
    assert false report "end of test" severity note;
    wait;
  end process;   
     

end architecture rtl;
