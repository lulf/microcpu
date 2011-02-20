library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.regfile_pkg.all;

-- Simple register file.
-- TODO:
--  * Auto-generate assignment and read.

entity regfile_impl is
  port (
    input : in regfile_input;
    output : out regfile_output);
end entity regfile_impl;

architecture rtl of regfile_impl is
  signal clk : std_logic;
  signal reset : std_logic;

  type regfile_type is array(NUMREG - 1 downto 0) of std_logic_vector(REG_WIDTH - 1 downto 0);
  signal regfile : regfile_type;

begin  -- architecture rtl
  clk <= input.in_clk;
  reset <= input.in_reset;

  -- Write is synchronous
  main : process (clk, reset) is
  begin
    -- Asynchronous reset.
    if reset = '1' then
      -- Reset all registers.
      regfile <= (others => (others => '0'));
    elsif rising_edge(clk) then
      -- Set all register values;
      if input.in_write_enable = '1' then
          if input.in_addr_w1 /= X"0" then
            regfile(to_integer(unsigned(input.in_addr_w1))) <= input.in_data_w1;
          end if;
      end if;
    end if;
  end process;

  -- Gives metainstability... should perhaps have enable and/or input check.
  output.out_data_r1 <= regfile(to_integer(unsigned(input.in_addr_r1)));
  output.out_data_r2 <= regfile(to_integer(unsigned(input.in_addr_r2)));

end architecture rtl;
