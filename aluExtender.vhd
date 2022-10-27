----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 10:04:17 PM
-- Design Name: 
-- Module Name: aluExtender - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity aluExtender is

generic(
numberOfBits: integer :=5
);

Port( 
A_i : in std_logic_vector(numberOfBits downto 0);
B_i : in std_logic_vector(numberOfBits downto 0);
sel_i : in std_logic_vector(2 downto 0);
IA_o : out std_logic_vector(numberOfBits downto 0);
IB_o : out std_logic_vector(numberOfBits downto 0);
Cin_o: out std_logic
);
 
end aluExtender;

architecture Behavioral of aluExtender is

begin


process (A_i,B_i,sel_i) begin

case sel_i is

when "000" =>  --- A + B

IA_o <= A_i;
IB_o <= B_i;
Cin_o <= '0';

when "001" => --- A - B

IA_o <= A_i;
IB_o <= B_i;
Cin_o <= '1';

when "010" => --- A + 1

IA_o <= A_i;
IB_o <= "000001";
Cin_o <= '0';

when "011" => --- A 

IA_o <= A_i;
IB_o <= (others => '0');
Cin_o <= '0';

when "100" => --- A AND B

IA_o <= A_i and B_i ;
IB_o <= (others => '0');
Cin_o <= '0';

when "101" =>  --- A OR B

IA_o <= A_i or B_i;
IB_o <=  (others => '0');
Cin_o <= '0';
    
when "110" =>  ---- A XOR B

IA_o <= A_i xor B_i;
IB_o <=  (others => '0');
Cin_o <= '0';

when "111" =>  --- not (A) 

IA_o <= not(A_i);
IB_o <=  (others => '0');
Cin_o <= '0';

when others =>
IA_o <= (others => '0');
IB_o <=  (others => '0');
Cin_o <= '0';
end case;


end process;


end Behavioral;
