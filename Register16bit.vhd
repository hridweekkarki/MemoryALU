----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:03:47 06/27/2022 
-- Design Name: 
-- Module Name:    Register16bit - Arch 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register16bit is
    Port ( Clk : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_Q : out  STD_LOGIC_VECTOR (7 downto 0));
end Register16bit;

architecture Arch of Register16bit is

signal sd: std_logic_vector(7 downto 0);

begin
Karki_Reg16: process(Clk)
	begin
	if rising_edge(Clk) then
		if (RST = '1') then
			sd <= (others => '0');
		elsif (EN = '1') then
			sd <= OP_A;
		else
			sd <= sd;
		end if;
	else
		sd <= sd;
	end if;
	end process Karki_Reg16;

OP_Q <= sd;

end Arch;

