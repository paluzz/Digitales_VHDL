library IEEE;
use ieee.std_logic_1164.all;

entity mux_Na1 is
  generic
  {
  N_BITS_BUS : natural := 8;
  N_BITS_SEL : natural := 4
  };
  port
  (
    a : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    b : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    s : in std_logic_vector(N_BITS_BUS - 1 downto 0);
    y : out std_logic_vector(N_BITS_SEL - 1 downto 0)
  );
end mux_Na1;

architecture Behavoiral of mux_Na1 is
begin
  with S select
    y <= a when "0",
    b when "1",
    d when others;
end Behavoiral;