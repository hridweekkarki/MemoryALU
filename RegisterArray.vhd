----------------------------------------------------------------------------------
-- Company: Howard University
-- Engineer: Hridweek Karki
-- 
-- Create Date:    12:00:08 06/27/2022 
-- Design Name: 
-- Module Name:    RegisterArray - Reg_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterArray is
    Port ( Clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ST : in  STD_LOGIC;
			  LD1 : in STD_LOGIC;
			  AL: in STD_LOGIC;
			  DR: in STD_LOGIC_VECTOR(2 downto 0);
           OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           SR1 : in  STD_LOGIC_VECTOR (2 downto 0);
           SR2 : in  STD_LOGIC_VECTOR (2 downto 0);
           OP_Q1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  OP_Q2 : out  STD_LOGIC_VECTOR (7 downto 0);
           OP_Q3 : out  STD_LOGIC_VECTOR (7 downto 0));
end RegisterArray;

architecture Reg_Arch of RegisterArray is

type reg_array is array(7 downto 0) of std_logic_vector(7 downto 0);
signal sEN: std_logic_vector(7 downto 0);
signal sFF: reg_array;

component Register16bit is
    Port ( Clk : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin
p1:Process(ST,DR)
variable DR: natural range 0 to 7:= 0;
begin
	if DR = 7 then
		DR:= 0;
	else 
		DR:= DR + 1;
	end if;
	
	sEN <= (sEN'range=>'0');
	sEN(DR) <= ST;
end process;

R: for j in 0 to 7 generate
	Reg: Register16bit
	port map(Clk, sEN(j), RST, OP_A, sFF(j));
end generate;

p2:Process(AL)
begin
	if (AL = '1') then
		OP_Q1 <= sFF(to_integer(unsigned(SR1)));
		OP_Q2 <= sFF(to_integer(unsigned(SR2)));
	else 
		OP_Q1 <= "00000000";
		OP_Q2 <= "00000000";
	end if;
end process;
	
p3:Process(LD1)
begin
	if (LD1 = '1') then
		OP_Q3 <= sFF(to_integer(unsigned(SR1)));
	else
		OP_Q3 <= "00000000";
	end if;
end process;

end Reg_Arch;

