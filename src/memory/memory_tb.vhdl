library ieee;
use ieee.std_logic_1164.all;
use work.memory_pkg.all;

entity memory_tb is
end entity memory_tb;

architecture rtl of memory_tb is
  signal m_in : memory_input;
  signal m_out : memory_output;
  signal clk_i : std_logic := '0';
  signal numcycles : integer := 10;
  
begin  -- architecture rtl
  memory_0 : memory_impl port map (
    input => m_in,
    output => m_out);
  
  m_in.in_clk <= clk_i;

  test : process
    procedure assert_read(constant addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
                          constant expected : in std_logic_vector(DATA_WIDTH - 1 downto 0))
                          is
    begin
      m_in.in_read_address <= addr;
      wait until rising_edge(clk_i);
      assert m_out.out_read_data = expected report "Value read is not expected" severity failure;
    end procedure;

    procedure do_write(constant addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
                       constant data : in std_logic_vector(DATA_WIDTH - 1 downto 0))
                       is
    begin
      m_in.in_write_address <= addr;
      m_in.in_write_data <= data;
      m_in.in_write_enable <= '1';
      wait until rising_edge(clk_i);
      m_in.in_write_enable <= '0';
    end procedure;

  begin
    -- Test write
    for i in 0 to ADDR_WIDTH - 1 loop
      for j in 0 to DATA_WIDTH - 1 loop
        do_write(conv_std_logic_vector(i, ADDR_WIDTH),
                 conv_std_logic_vector(j, DATA_WIDTH));
        assert_read(conv_std_logic_vector(i, ADDR_WIDTH),
                    conv_std_logic_vector(j, DATA_WIDTH));
      end loop;
    end loop;
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
