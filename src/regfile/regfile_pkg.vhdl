library ieee;
use ieee.std_logic_1164.all;

-- A simple register file interface.
package regfile_pkg is
  
  constant REG_WIDTH : integer := 64;
  constant ADDR_WIDTH : integer := 4; -- 16 registers
  constant OP_READ : std_logic := '0';
  constant OP_WRITE : std_logic := '1';

  type regfile_input is record
    in_clk : std_logic;
    in_reset : std_logic;
    in_addr : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    in_data : std_logic_vector(REG_WIDTH - 1 downto 0);
    in_op : std_logic;
  end record regfile_input;

  type regfile_output is record
    out_data : std_logic_vector(REG_WIDTH - 1 downto 0);
  end record regfile_output;                   

  component regfile_impl is
    port (
      input  : in  regfile_input;
      output : out regfile_output);
  end component regfile_impl;
end package regfile_pkg;
