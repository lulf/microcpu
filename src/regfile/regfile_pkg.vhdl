library ieee;
use ieee.std_logic_1164.all;

-- A simple register file interface.
package regfile_pkg is
  
  constant REG_WIDTH : integer := 4;
  constant NUMREG : integer := 16;  -- XXX: Should be derived from below
  constant ADDR_WIDTH : integer := 4; -- 16 registers

  type regfile_input is record
    in_clk : std_logic;
    in_reset : std_logic;

    -- Read ports
    in_addr_r1 : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    in_addr_r2 : std_logic_vector(ADDR_WIDTH - 1 downto 0);

    -- Write ports
    in_addr_w1 : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    in_data_w1 : std_logic_vector(REG_WIDTH - 1 downto 0);
    in_write_enable : std_logic;
  end record regfile_input;

  type regfile_output is record
    out_data_r1 : std_logic_vector(REG_WIDTH - 1 downto 0);
    out_data_r2 : std_logic_vector(REG_WIDTH - 1 downto 0);
  end record regfile_output;                   

  component regfile_impl is
    port (
      input  : in  regfile_input;
      output : out regfile_output);
  end component regfile_impl;
end package regfile_pkg;
