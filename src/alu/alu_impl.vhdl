library ieee;
use ieee.std_logic_1164.all;
use work.alu_pkg.all;

entity alu_impl
is
  
  port (
    input : in alu_input;
    output : out alu_output);
end entity alu_impl;

architecture rtl of alu_impl is

begin  -- architecture rtl

  output.status <= X"0";
  output.result <= input.in_a and input.in_b;
  
end architecture rtl;
