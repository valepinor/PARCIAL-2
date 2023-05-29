library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity Cont is
 Port ( reset : in STD_LOGIC;
 clk : in STD_LOGIC;
 sentido : in STD_LOGIC := '0';
 
 Q : out STD_LOGIC_VECTOR (3 downto 0));
end Cont;

architecture count of Cont is
signal counter : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

process(reset,clk)
begin

if reset='1' then
counter <= "0000";
elsif clk'event and clk = '1' then
if sentido = '1' then
counter <= counter + 1;
 else
counter <= counter - 1;
end if;
Q <= counter;
end if;
end process;
end count;