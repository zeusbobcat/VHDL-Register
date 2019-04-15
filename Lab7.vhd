--4 bit register file with asynchronous reset and synchronous load signal
library ieee;
use ieee.std_logic_1164.all;

--define I/O interfaces for the RegFile
entity theRegister is
port (load, reset, clk:in bit;
i:in std_logic_vector(3 downto 0);
q:out std_logic_vector(3 downto 0));
end entity theRegister;

--theRegister behaves thusly
architecture behaviour of theRegister is
begin
	erst:process(clk, reset, load)
	begin
		if(reset = '1') then
			q<="0000";
		end if;
		if(load = '1') and (clk = '1') then
			q<=i;
		end if;
	end process erst;
end architecture behaviour;