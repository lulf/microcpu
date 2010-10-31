library ieee;
use ieee.std_logic_1164.all;

package alu_pkg is
  
  constant WIDTH : integer := 4;
  constant OP_AND : std_logic_vector(3 downto 0) := X"1";
  constant OP_OR : std_logic_vector(3 downto 0) := X"2";

  constant STATUS_INVOP : std_logic_vector(3 downto 0) := X"1";  -- Invalid operation
  constant STATUS_ZERO : std_logic_vector(3 downto 0) := X"2";   -- Zero result
  
  type alu_input is record
    in_a : std_logic_vector(WIDTH - 1 downto 0);
    in_b : std_logic_vector(WIDTH - 1 downto 0);
    in_op : std_logic_vector(3 downto 0);
  end record alu_input;

  type alu_output is record
    result : std_logic_vector(WIDTH - 1 downto 0);
    status : std_logic_vector(3 downto 0);
  end record alu_output;                   

  component alu_impl is
    port (
      input  : in  alu_input;
      output : out alu_output);
  end component alu_impl;
end package alu_pkg;
