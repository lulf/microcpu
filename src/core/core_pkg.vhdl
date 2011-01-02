library ieee;
use ieee.std_logic_1164.all;

-- A CPU core which defines the input and output interface of each core in the system.
-- This package should define:
-- * The interface a core must implement. Start is to implement a simple core, but which can be replaced by something more advanced.
-- * A simple core as an example.
package core_pkg is
  
  -- Instruction type which defines the ISA that all cores must implement.

  type instr_t is std_logic_vector(63 downto 0);

  -- Output interface of a core
  -- XXX: WIP
  type core_output is record
  end record core_output;

  -- Input interface of a core
  -- XXX: WIP
  type core_input is record
    in_instr : instr_t;
  end record core_input;

  component core_impl_simple is
    port (
      input  : in  core_input;
      output : out core_output);
  end component core_impl;
end package core_pkg;
