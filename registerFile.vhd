----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity registerFile is

Port (
reg_inp_i : in std_logic_vector(5 downto 0);
reg_en_i : in std_logic;
reset : in std_logic;
clk : in std_logic;
reg_out_o : out std_logic_vector(5 downto 0)
);

end registerFile;

architecture Behavioral of registerFile is

begin


process (clk) begin

if(rising_edge(clk)) then

    if( reg_en_i = '1') then
        reg_out_o <=reg_inp_i;
    end if; 

end if;

    if( reset = '1') then
        reg_out_o <= (others => '0');
    end if; 


end process;



end Behavioral;
