----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 03:24:04 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (0 to 15);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (0 to 7);
           BTNC : in STD_LOGIC);
          

end top;

architecture Behavioral of top is




begin
digital_clock : entity work.digital_clock
      port map(
            clk => CLK100MHZ,
            rst_n => BTNC,
            H_in1 => "0",
            H_in0 => "0",
            M_in1 => "0",
            M_in0 => "0",            
            S_in1 => "0",
            S_in0 => "0"            
            );

  -- Disconnect the top four digits of the 7-segment display
  AN(7 downto 6) <= b"1111";

end architecture Behavioral;

