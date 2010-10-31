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

  -- purpose: ALU operation
  -- type   : combinational
  -- inputs : input
  -- outputs: output
  main: process (input) is
    variable status : std_logic_vector(3 downto 0);
    variable result : std_logic_vector(WIDTH - 1 downto 0);
  begin  -- process main
    -- Default values
    status := X"0";
    result := X"0";
    
    case input.in_op is
      when OP_AND =>
        result := input.in_a and input.in_b;
      when OP_OR =>
        result := input.in_a or input.in_b;
      when others =>
        result := X"0";
        status := status or STATUS_INVOP;
    end case;
    
    if result = X"0" then
      status := status or STATUS_ZERO;
    end if;

    -- Assign output
    output.status <= status;
    output.result <= result;
  end process main;
end architecture rtl;
