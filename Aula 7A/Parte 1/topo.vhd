library ieee;
use ieee.std_logic_1164.all;
entity topo is
	port(
		KEY : IN std_logic_vector(3 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end topo;
architecture topo_estru of topo is
signal QQ, q: std_logic_vector(3 downto 0);
signal F: std_logic_vector (3 downto 0);
component D_4FF
	port(
		CLK, RST: in std_logic;
		D: in std_logic_vector(3 downto 0);
		Q: out std_logic_vector(3 downto 0)
	);
end component;
component decod7
	port(
		C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(6 downto 0)
	);
end component;
begin
	-- Inicio da FSM --
	QQ(3) <= '0';
	QQ(2) <= (not(q(3)) and not(q(2)) and q(1) and q(0)) or (not(q(3)) and
	q(2) and not(q(1)) and not(q(0)));
	QQ(1) <= (not(q(3)) and not(q(2))) and (q(1) xor q(0));
	QQ(0) <= (not(q(3)) and q(2) and not(q(1))) or (not(q(3)) and not(q(2))
	and q(1) and not(q(0)));
	L0: D_4FF port map (KEY(1), KEY(0), QQ(3 downto 0), q(3 downto 0));
	F <= q;
	-- Fim da FSM –
	LEDR <= "000000" & F;
	L2: decod7 port map (F(3 downto 0), HEX0);
end topo_estru;