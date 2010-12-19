library ieee;
use ieee.std_logic_1164.all;

package alu_pkg is
  
  constant WIDTH  : integer := 4;
  constant OP_WIDTH : integer := 4;
  constant STATUS_WIDTH : integer := 4;

  -- Op codes for ALU operations supported.
  constant OP_AND : std_logic_vector(OP_WIDTH - 1 downto 0) := X"1";
  constant OP_OR  : std_logic_vector(OP_WIDTH - 1 downto 0) := X"2";
  constant OP_ADD : std_logic_vector(OP_WIDTH - 1 downto 0) := X"3";
  constant OP_SUB : std_logic_vector(OP_WIDTH - 1 downto 0) := X"4";
  constant OP_SHIFT_LOGICAL_LEFT  : std_logic_vector(OP_WIDTH - 1 downto 0) := X"5";
  constant OP_SHIFT_LOGICAL_RIGHT : std_logic_vector(OP_WIDTH - 1 downto 0) := X"6";
  constant OP_SHIFT_ARITH_LEFT    : std_logic_vector(OP_WIDTH - 1 downto 0) := X"7";
  constant OP_SHIFT_ARITH_RIGHT   : std_logic_vector(OP_WIDTH - 1 downto 0) := X"8";

  -- Status flags set by ALU.
  constant STATUS_INVOP    : std_logic_vector(STATUS_WIDTH - 1 downto 0) := X"1";  -- Invalid operation
  constant STATUS_ZERO     : std_logic_vector(STATUS_WIDTH - 1 downto 0) := X"2";  -- Zero result
  constant STATUS_OVERFLOW : std_logic_vector(STATUS_WIDTH - 1 downto 0) := X"4";  -- Overflow/carry
  
  type alu_input is record
    in_a : std_logic_vector(WIDTH - 1 downto 0);
    in_b : std_logic_vector(WIDTH - 1 downto 0);
    in_op : std_logic_vector(OP_WIDTH - 1 downto 0);
  end record alu_input;

  type alu_output is record
    result : std_logic_vector(WIDTH - 1 downto 0);
    status : std_logic_vector(STATUS_WIDTH - 1 downto 0);
  end record alu_output;                   

  component alu_impl is
    port (
      input  : in  alu_input;
      output : out alu_output);
  end component alu_impl;
end package alu_pkg;
