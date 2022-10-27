----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 10:27:33 PM
-- Design Name: 
-- Module Name: fullAdder - Behavioral
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



entity fullAdder is
Port (
A_i,B_i,C_i : in std_logic;
S_o: out std_logic;
C_o : out std_logic
 );
end fullAdder;

architecture Behavioral of fullAdder is

begin


S_o <= A_i XOR B_i XOR C_i ;
C_o <= (A_i AND B_i) OR (C_i AND A_i) OR (C_i AND B_i);



end Behavioral;
