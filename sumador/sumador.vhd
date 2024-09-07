library ieee;
use ieee.std_logic_1164.all;

entity sumador is
  port
  (
    a, b, c_in : in std_logic;
    s, c_out   : out std_logic;
  );
end entity;

architecture rtl of sumador is
  signal s_ab, co_ab, cor_ab : std_logic;
begin
  s_ab   <= a xor b;
  s      <= s_ab xor c_in;
  co_ab  <= a and b;
  cor_ab <= a or b;
  c_out  <= co_ab or (cor_ab and c_in);
end architecture;