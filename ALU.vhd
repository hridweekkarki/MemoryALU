----------------------------------------------------------------------------------
-- Company: Howard University
-- Engineer: Hridweek Karki
-- 
-- Create Date:    11:33:00 06/27/2022 
-- Design Name: 
-- Module Name:    ALU - Arch 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           OP_Q : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Arch of ALU is

signal sOP_Q: std_logic_vector(7 downto 0);

begin

with Sel select
sOP_Q <= A + B when "00",
			A - B when "01",
			A AND B when "10",
			NOT(A) when others;

OP_Q <= sOP_Q;

end Arch;

