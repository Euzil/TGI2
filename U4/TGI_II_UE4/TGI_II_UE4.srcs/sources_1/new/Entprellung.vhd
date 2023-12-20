library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Entprellung is
  port (
    I_BUTTON	: in	std_logic;  
    O_BUTTON	: out	std_logic;
    clk			: in	std_logic;
    reset		: in	std_logic
    );
end;

architecture behaviour of Entprellung is

signal Q1, Q2, Q3 : std_logic;
signal counter          : integer range 0 to 10000;

-- Weiterschieben des Signals auf den nächsten State nach jedem 12 kHz Takt
begin 
debounce: process(clk, reset)
begin
   if (clk'event and clk = '1') then
      if (reset = '1') then
         Q1 <= '0';
         Q2 <= '0';
         Q3 <= '0'; 
      else
         if counter = 0 then
                        Q1 <= I_BUTTON;
                        Q2 <= Q1;
                        Q3 <= Q2;
                  end if;
      end if;
   end if;
end process;

-- Abfrage des Pulses
O_BUTTON <= Q1 and Q2 and Q3;

-- 12 kHz Generierung für Entpreller
count:      process (clk, reset)
      begin
            if reset = '1' then
                  counter <= 0;
            elsif clk'event and clk = '1' then
                  if counter  = 8332 then
                        counter <= 0;
                  else
                        counter <= counter +1;
                  end if;
            end if;
      end process;

end behaviour;
