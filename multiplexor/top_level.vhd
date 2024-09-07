library IEEE;
use ieee.std_logic_1164.all;

entity TOP_LEVEL is
  generic
  {
  N_BITS_BUS : natural := 32;
  N_BITS_SEL : natural := 2
  };
  port
  (
    a_t   : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    b_t   : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    c_t   : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    d_t   : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    s1_t  : in std_logic_vector(N_BITS_SEL - 1 downto 0);
    s2_t  : in std_logic_vector(N_BITS_SEL - 1 downto 0);
    sum_t : out std_logic_vector(N_BITS_SEL - 1 downto 0)
  );
end entity;

architecture rtl of top_level is
  signal S_Y_A : std_logic_vector(N_BITS_BUS - 1 downto 0)
  signal S_Y_b : std_logic_vector(N_BITS_BUS - 1 downto 0)
begin
  inst_mux_2a1_1 : entity work.mux_2a1 is
    generic
    {
    N_BITS_BUS => N_BIT_BUS;
  };
  port map
  (
    a => a_t,
    b => b_t,
    s => s2_t,
    y => s_y_a
  );

  inst_mux_2a1_2 : entity work.mux_2a1 is
    generic
    {
    N_BITS_BUS => N_BIT_BUS;
  };
  port
  map
  (
  a => b_t,
  b => c_t,
  s => s2_t,
  y => s_y_b
  );
  inst_sum_n_bits : entity work.sum_n_bits is
    generic
    {
    N_BITS => N_BIT_BUS;
  };
  port
  map
  (
  a    => s_y_a,
  b    => s_y_b,
  cin  => '0',
  s    => sum_t,
  cout => open
  );

end architecture;