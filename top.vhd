----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Emre ASLAN
-- 



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is

Port (

A_top_i : in std_logic_vector(5 downto 0);
B_top_i : in std_logic_vector(5 downto 0);
clk: in std_logic;
reg_en_i : in std_logic;
reset: in std_logic;
sel_i : in std_logic_vector(2 downto 0);
C_top_o : out std_logic_vector(5 downto 0)

);
end top;

architecture Behavioral of top is


----- Component ALU Extender -------
component aluExtender is

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
 
end component;




----- Component nbitAdder -------

component nbitAdder is

generic(
numberofBits : integer :=5
);

Port (
A_add_i,B_add_i: in std_logic_vector(numberofBits downto 0);
C_in : in std_logic;
sum_add_o : out std_logic_vector(numberofBits downto 0)
);

end component;


-------- Component Register File
component registerFile is

Port (
reg_inp_i : in std_logic_vector(5 downto 0);
reg_en_i : in std_logic;
reset : in std_logic;
clk : in std_logic;
reg_out_o : out std_logic_vector(5 downto 0)
);

end component;


------- Signal Declerations---------

---------- Extender Signals----------
signal IA_o : std_logic_vector(5 downto 0) := (others => '0');
signal IB_o : std_logic_vector(5 downto 0) := (others => '0');
signal Cin_o : std_logic := ('0');

------- Adder Signals-------
signal A_add_i : std_logic_vector(5 downto 0):= (others => '0');
signal B_add_i : std_logic_vector(5 downto 0):= (others => '0');
signal sum_add_o : std_logic_vector(5 downto 0) := (others => '0');


-------- Register File Signals--------
signal reg_inp_i : std_logic_vector(5 downto 0):= (others => '0');
signal reg_out_o : std_logic_vector(5 downto 0):= (others => '0');


begin

--- Map Extender-------

map_Extender: aluExtender 

generic map(
numberOfBits => 5
)
Port map( 
A_i =>   A_top_i,
B_i =>   B_top_i,
sel_i => sel_i,
IA_o =>  IA_o,
IB_o =>  IB_o,
Cin_o => Cin_o
);
 
 --------- Map N_bitAdder
map_Nbitadder: nbitAdder

generic map(
numberofBits => 5
)

Port map(
A_add_i =>IA_o,
B_add_i =>IB_o,
C_in  => Cin_o,
sum_add_o => sum_add_o
);


------ Map register file------

-------- Component Register File
reg_file_map: registerFile 

Port map(
reg_inp_i => sum_add_o,
reg_en_i  => reg_en_i,
reset  => reset,
clk  => clk,
reg_out_o => C_top_o
);



end Behavioral;
