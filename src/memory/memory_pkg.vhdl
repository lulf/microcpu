library ieee;
use ieee.std_logic_1164.all;

-- A simple memory with a read and write port having one-cycle access :D
package memory_pkg is
  
  constant ADDR_WIDTH  : integer := 4;
  constant DATA_WIDTH  : integer := 4;

  type memory_input is record
    in_write_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    in_read_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    in_write_data : std_logic_vector(DATA_WIDTH - 1 downto 0);
    in_write_enable : std_logic;
    in_clk : std_logic;
  end record memory_input;

  type memory_output is record
    out_read_data : std_logic_vector(DATA_WIDTH - 1 downto 0);
  end record memory_output;                   

  component memory_impl is
    port (
      input  : in  memory_input;
      output : out memory_output);
  end component memory_impl;
end package memory_pkg;
