library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Steuerwerk_Moore is
Port (
    clock  : IN  STD_LOGIC;
    reset  : IN  STD_LOGIC;
    c0     : OUT STD_LOGIC;
    c1     : OUT STD_LOGIC;
    c2     : OUT STD_LOGIC;
    c3     : OUT STD_LOGIC;
    c4     : OUT STD_LOGIC;
    c5     : OUT STD_LOGIC;
    c6     : OUT STD_LOGIC;
    c7     : OUT STD_LOGIC;
    c8     : OUT STD_LOGIC;
    c9     : OUT STD_LOGIC;
    c10    : OUT STD_LOGIC;
    c11    : OUT STD_LOGIC;
    c12    : OUT STD_LOGIC;
    k1     : IN  STD_LOGIC;
    k2     : IN  STD_LOGIC;
    k3     : IN  STD_LOGIC;
    DONE   : OUT STD_LOGIC
 );
end Steuerwerk_Moore;

architecture Behavioral of Steuerwerk_Moore is

--geben Sie in den Klammern ihre Zustaende an
type state_typ is ( start, loadAclrCNT, loadQBUS, loadM, lshiftINC, sub, loadQ, add, selA, fin);
signal state,next_state : state_typ := start;


begin

    Zustandsregister : process (clock, reset)
    begin
	if reset = '1' then
		state <= start;

        elsif rising_edge(clock) then

		state <= next_state;

        end if;

    end process;

    Zustandsuebergangslogik : process (state, k1, k2, k3)
    begin
        case state is

			when start =>
				if k1 = '1' then
					next_state <= loadAclrCNT;
				else
					next_state <= start;
				end if;

			when loadAclrCNT => next_state <= loadQBUS;

			when loadQBUS => next_state <= loadM;

			when loadM  => next_state <= lshiftINC;

			when lshiftINC  => next_state <= sub;

			when sub =>
				if k2 = '1' then
					next_state <= add;
				else
					next_state <= loadQ;
				end if;

			when loadQ  =>
				if k3 = '1' then
					next_state <= selA;
				else
					next_state <= lshiftINC;
				end if;

			when add =>
				if k3 = '1' then
					next_state <= selA;
				else
					next_state <= lshiftINC;
				end if;

			when selA => next_state <= fin;

			when fin => next_state <= start;


        end case;
    end process;


    Ausgabelogik : process (state)
    begin
        c0   <= '0';
        c1   <= '0';
        c2   <= '0';
        c3   <= '0';
        c4   <= '0';
        c5   <= '0';
        c6   <= '0';
        c7   <= '0';
        c8   <= '0';
        c9   <= '0';
        c10  <= '0';
        c11  <= '0';
        c12  <= '0';
        DONE <= '0';

        case state is

			--null bedeutet das fuer diesen Fall alle oben angegebene Standardwerte fuer die Ausgabe uebernommen werden
            when start =>
                null;

		when loadAclrCNT =>
			c1 <= '1';
			c5 <= '1';
			c7 <= '1';

		when loadQBUS =>
			c11 <= '1';
			c4 <= '1';

		when loadM =>
			c3 <= '1';

		when lshiftINC =>
		    c2 <= '1';
			c5 <= '1';
			c6 <= '1';
			c8 <= '1';
			c11 <= '1';
			c12 <= '1';

		when sub =>
			c0 <= '1';
			c2 <= '1';
			c5 <= '1';

			c9 <= '1';

		when loadQ =>

			c11 <= '1';

		when add =>
			c2 <= '1';
			c5 <= '1';

			c9 <= '1';

		when selA =>
			c10 <= '1';

		when fin =>
			DONE <= '1';


        end case;

    end process;


end Behavioral;
