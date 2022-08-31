----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:52 06/27/2022 
-- Design Name: 
-- Module Name:    DisplayMUX - Behavioral 
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

entity DisplayMUX is
    Port ( OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_B : in  STD_LOGIC_VECTOR (7 downto 0);
           DISP : out  STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in  STD_LOGIC;
           AALU : in  STD_LOGIC);
end DisplayMUX;

architecture Behavioral of DisplayMUX is

signal Sel: std_logic_vector(1 downto 0);

begin
Sel(0) <= AALU;
Sel(1) <= LOAD;

DISP <=  OP_A when (Sel="01") else
			OP_B when (Sel="10") else
			"00000000";
end Behavioral;

