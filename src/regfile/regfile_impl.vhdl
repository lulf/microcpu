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
        case input.in_addr_w1 is
          when X"0" =>
            null;
          when X"1" =>
            regfile(1) <= input.in_data_w1;
          when X"2" =>
            regfile(2) <= input.in_data_w1;
          when X"3" =>
            regfile(3) <= input.in_data_w1;
          when X"4" =>
            regfile(4) <= input.in_data_w1;
          when X"5" =>
            regfile(5) <= input.in_data_w1;
          when X"6" =>
            regfile(6) <= input.in_data_w1;
          when X"7" =>
            regfile(7) <= input.in_data_w1;
          when X"8" =>
            regfile(8) <= input.in_data_w1;
          when X"9" =>
            regfile(9) <= input.in_data_w1;
          when X"A" =>
            regfile(10) <= input.in_data_w1;
          when X"B" =>
            regfile(11) <= input.in_data_w1;
          when X"C" =>
            regfile(12) <= input.in_data_w1;
          when X"D" =>
            regfile(13) <= input.in_data_w1;
          when X"E" =>
            regfile(14) <= input.in_data_w1;
          when X"F" =>
            regfile(15) <= input.in_data_w1;
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;

  -- Read input r1
  with input.in_addr_r1 select output.out_data_r1 <=
    regfile(0) when X"0",
    regfile(1) when X"1",
    regfile(2) when X"2",
    regfile(3) when X"3",
    regfile(4) when X"4",
    regfile(5) when X"5",
    regfile(6) when X"6",
    regfile(7) when X"7",
    regfile(8) when X"8",
    regfile(9) when X"9",
    regfile(10) when X"A",
    regfile(11) when X"B",
    regfile(12) when X"C",
    regfile(13) when X"D",
    regfile(14) when X"E",
    regfile(15) when X"F",
    (others => '0') when others;

  -- Read input r2
  with input.in_addr_r2 select output.out_data_r2 <=
    regfile(0) when X"0",
    regfile(1) when X"1",
    regfile(2) when X"2",
    regfile(3) when X"3",
    regfile(4) when X"4",
    regfile(5) when X"5",
    regfile(6) when X"6",
    regfile(7) when X"7",
    regfile(8) when X"8",
    regfile(9) when X"9",
    regfile(10) when X"A",
    regfile(11) when X"B",
    regfile(12) when X"C",
    regfile(13) when X"D",
    regfile(14) when X"E",
    regfile(15) when X"F",
    (others => '0') when others;

end architecture rtl;
