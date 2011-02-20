library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_simple_pkg.all;

entity regfile_impl is
  generic(NUMREG : integer =: 4;
          REGWIDTH : integer =: 64);

  port (
    input : in regfile_input;
    output : out regfile_output);
end entity regfile_impl;

architecture rtl of regfile_impl is
  signal clk : std_logic;
  signal reset : std_logic;

  regfile : for n in 0 to NUMREG - 1 generate
    r : std_logic_vector(REGWIDTH - 1 downto 0);
  end generate regfile;


begin  -- architecture rtl
  clk <= input.in_clk;
  reset <= input.in_reset;

  main: process (clk, reset) is
  begin
    -- Asynchronous reset.
    if reset = '1' then
      -- Reset all registers.
    elsif rising_edge(clk) then
      -- Set all register values;
      for i in 0 to NUMREG - 1 loop
        reg
      end loop;
    end

  end process main;
end architecture rtl;
