library ieee;
use ieee.std_logic_1164.all;

entity blink is
  port (
        i_clock : in  std_logic;
        i_reset : in  std_logic;
        o_led   : out std_logic_vector(2 downto 0)
       );
end blink;

architecture rtl of blink is
  constant c_freq  : natural := 24000000-1;
  signal   r_count : natural range 0 to c_freq;
  signal   r_led   : std_logic_vector(2 downto 0) := "110";

begin

  process (i_clock) is
  begin

    if falling_edge(i_clock) then
      if i_reset = '0' then
        r_led(2 downto 0) <= "110";
      else
        if r_count = c_freq then
          r_count  <= 0;
          r_led(2 downto 0) <= r_led(1 downto 0) & r_led(2);
        else
          r_count <= r_count + 1;
        end if;
      end if;
    end if;

  end process;

  o_led <= r_led;

end rtl;