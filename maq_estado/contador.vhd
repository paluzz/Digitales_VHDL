library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (
    -- aqui debo poner valores por defecto
    modulo : natural := 50000000;
    n_bits : natural := 26
  );
  port (
    pi_clk : in std_logic;
    pi_rst : in std_logic;
    po_tc  : out std_logic

  );
end entity;

architecture rtl of counter is
  signal s_count : std_logic_vector(n_bits - 1 downto 0) := (others => '0');
begin
  process (pi_clk)
  begin
    if rising_edge(pi_clk) then
      if pi_rst = '1' then
        po_tc   <= '0';
        s_count <= others('0');
      else
        s_count <= std_logic_vector(unsigned(s_count) + 1);
        po_tc   <= '0'; -- siempre 0 excepto cuando llega al valor del modulo
        if s_count = modulo then
          s_count <= others('0');
          po_tc   <= '1';
        end if;
      end if;
    end if;
  end process;
end architecture;