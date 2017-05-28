library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWMGEN is
	Port(
		RST      : in STD_LOGIC;
		CLK100MHZ: in STD_LOGIC;
		THRESHOLD: in integer;
		PWM_OUT	: out STD_LOGIC
	);
end PWMGEN;

architecture RTL of PWMGEN is

signal sawtooth : integer;

begin

process (CLK100MHz) begin
  if rising_edge(CLK100MHz) then
    if RST = '1' then
	  sawtooth <= 0;
	 else 
	  if sawtooth = 49999 then
       sawtooth <= 0;
     else
	    sawtooth <= sawtooth+1;
	  end if;
	 end if;
  end if;
end process;

process (CLK100MHz) begin
  if rising_edge(CLK100MHz) then
   if sawtooth < THRESHOLD then
	  PWM_OUT <= '1';
	else 
	  PWM_OUT <= '0';
	end if;
  end if;
end process;

end RTL;