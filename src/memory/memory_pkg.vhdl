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

  function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR;

end package memory_pkg;

package body memory_pkg is

  -- convert an integer to an STD_LOGIC_VECTOR
  function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR is
	variable result: STD_LOGIC_VECTOR (SIZE-1 downto 0);
	variable temp: integer;
	-- synopsys built_in SYN_INTEGER_TO_BIT_VECTOR
	-- synopsys subpgm_id 381
    begin
	-- synopsys synthesis_off
	temp := ARG;
	for i in 0 to SIZE-1 loop
	    if (temp mod 2) = 1 then
		result(i) := '1';
	    else 
		result(i) := '0';
	    end if;
	    if temp > 0 then
		temp := temp / 2;
	    elsif (temp > integer'low) then
		temp := (temp - 1) / 2; -- simulate ASR
	    else
		temp := temp / 2; -- simulate ASR
	    end if;
	end loop;
	return result;
	-- synopsys synthesis_on
  end;

end;
