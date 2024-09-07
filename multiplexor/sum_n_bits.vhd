library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_n_bits is
  generic
  (
    N_BITS : natural := 8
  );
  port
  (
    a, b : in std_logic_vector(N_BITS - 1 downto 0);
    cin  : in std_logic;
    s    : out std_logic_vector(N_BITS - 1 downto 0);
    cout : out std_logic;
  );
end entity;

architecture rtl of sum_n_bits is
  signal s_Y   : std_logic_vector(N_BITS downto 0);
  signal s_cin : std_logic_vector(N_BITS downto 0);
begin

  s_Y   <= std_logic_vector(('0' & unsigned(a)) + ('0' & unsigned(b)) + unsigned(s_cin));
  s_cin <= (N_BITS downto 1 => '0') & cin;
  S     <= s_Y(N_BITS downto 0);
  c_out <= s_Y(N_BITS);
end architecture;