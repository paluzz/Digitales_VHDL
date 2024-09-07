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
  signal parcial1, parcial2, parcial3 : std_logic;
begin
  parcial1 <= a and b;
  parcial2 <= b and c;
  parcial3 <= a and c;
  z        <= parcial1 or parcial2 or parcial3;
end architecture;