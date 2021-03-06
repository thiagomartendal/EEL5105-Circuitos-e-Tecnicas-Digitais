library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity C1 is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(3 downto 0)
	);
end C1;
architecture circuito of C1 is
	begin
		F <= A + B;
end circuito;