----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:10 07/06/2022 
-- Design Name: 
-- Module Name:    AddressRegister - AddressArch 
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

entity AddressRegister is
port ( Clk: in STD_LOGIC;
			RST: in STD_LOGIC;
			EN: in STD_LOGIC;
			OP_A: in STD_LOGIC_VECTOR(2 downto 0);
			OP_Q: out STD_LOGIC_VECTOR(2 downto 0));
end AddressRegister;

architecture AddressArch of AddressRegister is
signal sq: std_logic_vector(2 downto 0);

begin

process(Clk)
begin
if rising_edge(Clk) then
	if (RST = '1') then
		sq <= "000";
	elsif (EN = '1') then
		sq <= OP_A;
	else
		sq <= sq;
	end if;
else
	sq <= sq;
end if;
end process;

OP_Q <= sq;
end AddressArch;

