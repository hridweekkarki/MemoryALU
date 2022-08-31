----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:24:49 07/05/2022 
-- Design Name: 
-- Module Name:    TopSecondDesign - Arch 
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

entity TopSecondDesign is
    Port ( Clk : in  STD_LOGIC;
			  SW7 : in  STD_LOGIC;
           SW6 : in  STD_LOGIC;
           SW5 : in  STD_LOGIC;
	        SW4 : in  STD_LOGIC;
           SW3 : in  STD_LOGIC;
           SW2 : in  STD_LOGIC;
           SW1 : in  STD_LOGIC;
           SW0 : in  STD_LOGIC;
			  BTN1: in STD_LOGIC;
			  BTN2: in STD_LOGIC;
			  BTN3: in STD_LOGIC;
			  BTN4: in STD_LOGIC;
           tsel_displayA : out  STD_LOGIC;
           tsel_displayB : out  STD_LOGIC;
           tsel_displayC : out  STD_LOGIC;
           tsel_displayD : out  STD_LOGIC;
           tsegA : out  STD_LOGIC;
           tsegB : out  STD_LOGIC;
           tsegC : out  STD_LOGIC;
           tsegD : out  STD_LOGIC;
           tsegE : out  STD_LOGIC;
           tsegF : out  STD_LOGIC;
           tsegG : out  STD_LOGIC);
end TopSecondDesign;

architecture Arch of TopSecondDesign is

component Segment_Driver is
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
end component;

component Datapath_RAL is
    Port ( INPT : in  STD_LOGIC_VECTOR (7 downto 0);
           ST2 : in  STD_LOGIC;
           AL2 : in  STD_LOGIC;
			  LD2: in STD_LOGIC;
           RST2 : in  STD_LOGIC;
			  DR2: in std_logic_vector(2 downto 0);
           OT_Q : out  STD_LOGIC_VECTOR (7 downto 0);
           CLk : in  STD_LOGIC);
end component;

component AddressRegister is
port ( Clk: in STD_LOGIC;
			RST: in STD_LOGIC;
			EN: in STD_LOGIC;
			OP_A: in STD_LOGIC_VECTOR(2 downto 0);
			OP_Q: out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal OA: std_logic_vector(7 downto 0);
signal OQ: std_logic_vector(7 downto 0);
signal RESET: std_logic;
signal DR3: std_logic_vector(2 downto 0);
signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(3 downto 0);
signal C: std_logic_vector(3 downto 0);
signal D: std_logic_vector(3 downto 0);

begin

uut3: Segment_Driver port map ( displayA => A,
											displayB => B,
											displayC => C,
											displayD => D,
											segA => tsegA,
											segB => tsegB,
											segC => tsegC,
											segD => tsegD,
											segE => tsegE,
											segF => tsegF,
											segG => tsegG,
											Sel_displayA => tsel_displayA,
											Sel_displayB => tsel_displayB,
											Sel_displayC => tsel_displayC,
											Sel_displayD => tsel_displayD,
											Clk => Clk);
											
uut4: Datapath_RAL port map ( INPT => OA, ST2 => BTN2, AL2 => BTN3, LD2 => BTN4, RST2 => RESET, DR2 => DR3, OT_Q => OQ, Clk => Clk);

uut5: AddressRegister port map(CLk => Clk, RST => RESET, EN => BTN1, OP_A => OA(2 downto 0), OP_Q => DR3);

RESET <= BTN1 AND BTN2 AND BTN3 AND BTN4;
	
OA(0) <= SW0;
OA(1) <= SW1;
OA(2) <= SW2;
OA(3) <= SW3;
OA(4) <= SW4;
OA(5) <= SW5;
OA(6) <= SW6;
OA(7) <= SW7;


A <= OQ(3 downto 0);
B <= OQ(7 downto 4);
C <= "0000";
D <= "0000";
											
end Arch;

