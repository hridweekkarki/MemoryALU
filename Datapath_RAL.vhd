----------------------------------------------------------------------------------
-- Company: Howard University
-- Engineer: Hridweek Karki
-- 
-- Create Date:    11:04:42 06/28/2022 
-- Design Name: 
-- Module Name:    Datapath_RAL - Arch 
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

entity Datapath_RAL is
    Port ( INPT : in  STD_LOGIC_VECTOR (7 downto 0);
           ST2 : in  STD_LOGIC;
           AL2 : in  STD_LOGIC;
			  LD2: in STD_LOGIC;
           RST2 : in  STD_LOGIC;
			  DR2: in std_logic_vector(2 downto 0);
           OT_Q : out  STD_LOGIC_VECTOR (7 downto 0);
           CLk : in  STD_LOGIC);
end Datapath_RAL;

architecture Arch of Datapath_RAL is

component DisplayMUX is
    Port ( OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_B : in  STD_LOGIC_VECTOR (7 downto 0);
           DISP : out  STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in  STD_LOGIC;
           AALU : in  STD_LOGIC);
end component;

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           OP_Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegisterArray is
    Port ( Clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  ST : in  STD_LOGIC;
			  AL: in STD_LOGIC;
			  LD1: in STD_LOGIC;
			  DR: in STD_LOGIC_VECTOR(2 downto 0);
           OP_A : in  STD_LOGIC_VECTOR (7 downto 0);
           SR1 : in  STD_LOGIC_VECTOR (2 downto 0);
           SR2 : in  STD_LOGIC_VECTOR (2 downto 0);
           OP_Q1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  OP_Q2 : out  STD_LOGIC_VECTOR (7 downto 0);
			  OP_Q3 : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;

SIGNAL IN_A: std_logic_vector(7 downto 0);
SIGNAL IN_B: std_logic_vector(7 downto 0);
SIGNAL OP_DISP: std_logic_vector(7 downto 0);
SIGNAL OP_ALU: std_logic_vector(7 downto 0);

begin

Karki_RegArray: RegisterArray port map(Clk, RST2, ST2, AL2, LD2, DR2, INPT, INPT(2 downto 0), INPT(5 downto 3), IN_A, IN_B, OP_DISP);
Karki_ALU: ALU port map(IN_A, IN_B, INPT(7 downto 6), OP_ALU);
Karki_DispMUX: DisplayMUX port map(OP_ALU, OP_DISP, OT_Q, LD2, AL2);

end Arch;

