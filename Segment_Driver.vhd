----------------------------------------------------------------------------------
-- Company: Howard University
-- Engineer: Hridweek Karki
-- 
-- Create Date:    13:49:39 06/06/2022 
-- Design Name: 
-- Module Name:    Segment_Driver - Driving_Seg 
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

entity Segment_Driver is
    Port ( displayA : in  STD_LOGIC_VECTOR (3 downto 0);
           displayB : in  STD_LOGIC_VECTOR (3 downto 0);
           displayC : in  STD_LOGIC_VECTOR (3 downto 0);
           displayD : in  STD_LOGIC_VECTOR (3 downto 0);
           segA : out  STD_LOGIC;
           segB : out  STD_LOGIC;
           segC : out  STD_LOGIC;
           segD : out  STD_LOGIC;
           segE : out  STD_LOGIC;
           segF : out  STD_LOGIC;
           segG : out  STD_LOGIC;
           Sel_displayA : out  STD_LOGIC;
           Sel_displayB : out  STD_LOGIC;
           Sel_displayC : out  STD_LOGIC;
           Sel_displayD : out  STD_LOGIC;
           Clk : in  STD_LOGIC);
end Segment_Driver;

architecture Driving_Seg of Segment_Driver is
--Component Declaration

component Segment_Decoder is
    Port ( Digit : in  STD_LOGIC_VECTOR (3 downto 0);
           segmentA : out  STD_LOGIC;
           segmentB : out  STD_LOGIC;
           segmentC : out  STD_LOGIC;
           segmentD : out  STD_LOGIC;
           segmentE : out  STD_LOGIC;
           segmentF : out  STD_LOGIC;
           segmentG : out  STD_LOGIC);
end component;

component Clock_Divider is
    Port ( Clk : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data_Clk : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

SIGNAL temp_data: std_logic_vector(3 downto 0);
SIGNAL clk_word: std_logic_vector(15 downto 0);
SIGNAL Slow_clk: std_logic;

begin

--Component Instantiation

uut0: Segment_Decoder port map(Digit => temp_data,
										segmentA => segA,
										segmentB => segB,
										segmentC => segC,
										segmentD => segD,
										segmentE => segE,
										segmentF => segF,
										segmentG => segG);
										
uut1: Clock_Divider port map(Clk => Clk,
										EN => '1',
										RST => '0',
										Data_Clk => clk_word);

Slow_clk <= clk_word(15);

process(Slow_clk)
	
	variable display_selection: std_logic_vector(1 downto 0);
	begin
	if (Slow_clk'EVENT AND Slow_clk = '1') then
	
	case display_selection is
	
	when "00" => temp_data <= displayA;
	
		Sel_displayA <= '0';
		Sel_displayB <= '1';
		Sel_displayC <= '1';
		Sel_displayD <= '1';
		
		display_selection:= display_selection + '1';
	
	when "01" => temp_data <= displayB;
	
		Sel_displayA <= '1';
		Sel_displayB <= '0';
		Sel_displayC <= '1';
		Sel_displayD <= '1';
		
		display_selection:= display_selection + '1';
		
	when "10" => temp_data <= displayC;
	
		Sel_displayA <= '1';
		Sel_displayB <= '1';
		Sel_displayC <= '0';
		Sel_displayD <= '1';
		
		display_selection:= display_selection + '1';
	
	when others => temp_data <= displayD;
	
		Sel_displayA <= '1';
		Sel_displayB <= '1';
		Sel_displayC <= '1';
		Sel_displayD <= '0';
		
		display_selection:= display_selection + '1';
	end case;
	end if;
end process;
end Driving_Seg;

