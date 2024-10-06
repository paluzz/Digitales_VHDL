library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
entity fms is
  generic (
    fclk : natural := 125000000
  );
  port (
    pi_clk : in std_logic;
    pi_rst : in std_logic;
    po_led : out std_logic

  );
end entity;

architecture rtl of fms is

  -- definicion 
  type state is (encendido, apagado);
  signal est_act, est_fut : state;
  signal s_tc             : std_logic;
begin

  -- process secuencial
  process (pi_clk)
  begin
    if rising_edge(pi_clk) then
      if pi_rst = '1' then
        est_act <= encendido;
      else
        est_act <= est_fut;
      end if;
    end if;

  end process;

  -- process combinacional
  process (est_act, s_tc)
  begin
    case est_act is
      when encendido =>
        po_led  <= '1';
        if s_tc <= '1';
          est_fut <= apagado;
        else
          est_fut <= encendido;
        end if;
      when apagado =>
        po_led  <= '0';
        if s_tc <= '1';
          est_fut <= encendido;
        else
          est_fut <= apagado;
        end if;
      when others =>
        po_led  <= '1';
        est_fut <= apagado;
    end case;
  end process;

  counter_1s : entity work.counter
    generic map(
      modulo => fclk/2,
      n_bits => natural(ceil(log2(real(fclk/2))))
    )
    port map
    (
      pi_clk => pi_clk,
      pi_rst => pi_rst,
      po_tc  => s_tc
    );
end architecture;