library ieee;
use IEEE.STD_LOGIC_1164.all;

-- definimos entradas y salidas
entity combinacional is
  port
  (
    a, b, c : in std_logic;
    z       : out std_logic;

  );
end entity;

-- definimos cables
architecture rtl of combinacional is
  signal vector : std_logic_vector(2 downto 0);
begin
  -- similar a 
  -- vector(2) <= a;
  -- vector(1) <= b;
  -- vector(0) <= c;
  vector <= a & b & c;
  with vector select
    z <= '0' when "000",
    '0' when "001",
    '0' when "010",
    '1' when "011",
    '0' when "100",
    '1' when "101",
    '1' when "110",
    '1' when "111",
    '0' when others;

end architecture;