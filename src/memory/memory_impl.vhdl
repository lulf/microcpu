library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.memory_pkg.all;

entity memory_impl
is
  
  port (
    input : in memory_input;
    output : out memory_output);
end entity memory_impl;

architecture rtl of memory_impl is
begin  -- architecture rtl
  output.out_read_data <= X"2";
end architecture rtl;
