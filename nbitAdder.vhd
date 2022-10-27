----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Emre ASLAN



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nbitAdder is

generic(
numberofBits : integer :=5
);

Port (
A_add_i,B_add_i: in std_logic_vector(numberofBits downto 0);
C_in : in std_logic;
sum_add_o : out std_logic_vector(numberofBits downto 0)
);

end nbitAdder;

architecture Behavioral of nbitAdder is


component fullAdder is
Port(
A_i : in std_logic;
B_i : in std_logic;
C_i : in std_logic;
S_o: out std_logic;
C_o : out std_logic
);
 
 
end component;


signal B_xor : std_logic_vector(numberofBits downto 0) := (others => '0');

signal c_1 : std_logic:= '0';
signal c_2 : std_logic:= '0';
signal c_3 : std_logic:= '0';
signal c_4 : std_logic:= '0';
signal c_5 : std_logic:= '0';
signal c_6 : std_logic:= '0';




begin

B_xor(5) <= B_add_i(5) xor C_in;
B_xor(4) <= B_add_i(4) xor C_in;
B_xor(3) <= B_add_i(3) xor C_in;
B_xor(2) <= B_add_i(2) xor C_in;
B_xor(1) <= B_add_i(1) xor C_in;
B_xor(0) <= B_add_i(0) xor C_in;


adder_0:  fullAdder 
Port map(A_i => A_add_i(0),B_i => B_xor(0), C_i => C_in, S_o => sum_add_o(0),C_o => c_1);

adder_1:  fullAdder 
Port map(A_i => A_add_i(1),B_i => B_xor(1), C_i => c_1, S_o => sum_add_o(1),C_o => c_2);

adder_2:  fullAdder 
Port map(A_i => A_add_i(2),B_i => B_xor(2), C_i => c_2, S_o => sum_add_o(2),C_o => c_3);

adder_3:  fullAdder 
Port map(A_i => A_add_i(3),B_i => B_xor(3), C_i => c_3, S_o => sum_add_o(3),C_o => c_4);

adder_4:  fullAdder 
Port map(A_i => A_add_i(4),B_i => B_xor(4), C_i => c_4, S_o => sum_add_o(4),C_o => c_5);
 
adder_5:  fullAdder 
Port map(A_i => A_add_i(5),B_i => B_xor(5), C_i => c_5, S_o => sum_add_o(5),C_o => c_6);
 



end Behavioral;
