----------------------------------------------------------------------------------
-- Company: Howard University
-- Engineer: Hridweek Karki
-- 
-- Create Date:    10:45:24 06/06/2022 
-- Design Name: 
-- Module Name:    Segment_Decoder - Decoder 
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

entity Segment_Decoder is
    Port ( Digit : in  STD_LOGIC_VECTOR (3 downto 0);
           segmentA : out  STD_LOGIC;
           segmentB : out  STD_LOGIC;
           segmentC : out  STD_LOGIC;
           segmentD : out  STD_LOGIC;
           segmentE : out  STD_LOGIC;
           segmentF : out  STD_LOGIC;
           segmentG : out  STD_LOGIC);
end Segment_Decoder;

architecture Decoder of Segment_Decoder is

begin
process(Digit)
	variable Decoded_Data : std_logic_vector(6 downto 0);
	begin
	case Digit is
		when "0000" => Decoded_Data:= "1111110";--0
		when "0001" => Decoded_Data:= "0110000";--1
		when "0010" => Decoded_Data:= "1101101";--2
		when "0011" => Decoded_Data:= "1111001";--3
		when "0100" => Decoded_Data:= "0110011";--4
		when "0101" => Decoded_Data:= "1011011";--5
		when "0110" => Decoded_Data:= "1011111";--6
		when "0111" => Decoded_Data:= "1110000";--7
		when "1000" => Decoded_Data:= "1111111";--8
		when "1001" => Decoded_Data:= "1111011";--9
		when "1010" => Decoded_Data:= "1110111";--A
		when "1011" => Decoded_Data:= "0011111";--B
		when "1100" => Decoded_Data:= "1001110";--C
		when "1101" => Decoded_Data:= "0111101";--D
		when "1110" => Decoded_Data:= "1001111";--E
		when "1111" => Decoded_Data:= "1000111";--F
		when others => Decoded_Data:= "0110111";--Error 'H'
	end case;
		
	segmentA <= not Decoded_Data(6);
	segmentB <= not Decoded_Data(5);
	segmentC <= not Decoded_Data(4);
	segmentD <= not Decoded_Data(3);
	segmentE <= not Decoded_Data(2);
	segmentF <= not Decoded_Data(1);
	segmentG <= not Decoded_Data(0);
	
end process;
		
		
end Decoder;

