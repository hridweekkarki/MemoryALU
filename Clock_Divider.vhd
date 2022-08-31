----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hridweek Karki
-- 
-- Create Date:    13:37:45 06/06/2022 
-- Design Name: 
-- Module Name:    Clock_Divider - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Divider is
    Port ( Clk : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data_Clk : out  STD_LOGIC_VECTOR (15 downto 0));
end Clock_Divider;

architecture Behavioral of Clock_Divider is

begin
	process(Clk, RST)
	variable count: STD_LOGIC_VECTOR (15 downto 0):=(others => '0');
	begin
	
	if (RST = '1') then
		count:=(OTHERS => '0');
	elsif (EN = '1' AND Clk'EVENT AND Clk = '1') then
		count:= count + 1;
	end if;
	
	Data_Clk <= count;
	
	end process;
end Behavioral;

