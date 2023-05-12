library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity contador is
    PORT (
        control_contador    : IN  STD_LOGIC;
        cnt_control: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		   cnt: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			fin_conteo : out std_LOGIC
    );
end contador;
 
architecture Behavioral of contador is
    
    signal cnt_tmp: STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	 signal ctrl :std_LOGIC;
begin
ctrl<= control_contador;
    proceso_contador: process (ctrl) begin
        if (ctrl='1') then
            cnt_tmp <= cnt_tmp + 1;
        end if;
    end process;

    cnt_control <= cnt_tmp;
	 fin_conteo<= cnt_tmp(2) and cnt_tmp(1) and cnt_tmp(0);
end Behavioral;