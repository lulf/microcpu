library ieee;
use ieee.std_logic_1164.all;
use work.regfile_pkg.all;

entity regfile_tb is
end entity regfile_tb;

architecture rtl of regfile_tb is
  signal r_in : regfile_input;
  signal r_out : regfile_output;
  signal clk_i : std_logic := '0';
  signal reset_i : std_logic := '1';
  signal numcycles : integer := 10;
  
begin  -- architecture rtl
  regfile_0 : regfile_impl
    port map (
      input => r_in,
      output => r_out);
  
  r_in.in_clk <= clk_i;
  r_in.in_reset <= reset_i;

  test : process
  begin
    reset_i <= '1';
    wait until rising_edge(clk_i);
    reset_i <= '0';
    r_in.in_addr_r1 <= X"0";
    r_in.in_addr_r2 <= X"0";
    r_in.in_addr_w1 <= X"0";
    r_in.in_data_w1 <= X"0";
    r_in.in_write_enable <= '0';

    -- Test basic READ
    r_in.in_addr_r1 <= X"1";
    wait until rising_edge(clk_i);
    assert r_out.out_data_r1 = X"0" report "READ register 1 gives wrong result" severity failure;

    -- Test basic WRITE
    r_in.in_write_enable <= '1';
    r_in.in_addr_w1 <= X"2";
    r_in.in_data_w1 <= X"7";
    r_in.in_addr_r1 <= X"2";
    wait until rising_edge(clk_i);
    assert r_out.out_data_r1 = X"7" report "Write register 2 does not result in value update" severity failure;

    -- Test that reg 0 is special
    r_in.in_write_enable <= '1';
    r_in.in_addr_w1 <= X"0";
    r_in.in_data_w1 <= X"3";
    r_in.in_addr_r1 <= X"0";
    wait until rising_edge(clk_i);
    assert r_out.out_data_r1 = X"0" report "Register 0 is not special, can be written to" severity failure;
    assert false report "end of test" severity note;
    wait;
  end process;   

  clksource : process
  begin
    for i in 1 to numcycles loop
      clk_i <= not clk_i;
      wait for 50 ns;
      clk_i <= not clk_i;
      wait for 50 ns;
    end loop;
    wait;
  end process;

end architecture rtl;
