
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
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
          

end top;

architecture Behavioral of top is
begin
digital_clock : entity work.digital_clock
      port map(
            clk => CLK100MHZ,
            rst_n => BTNC,
            H_in1 => b"00",
            H_in0 => b"0000",
            M_in1 => b"0000",
            M_in0 => b"0000",            
            S_in1 => b"0000",
            S_in0 => b"0000",           
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,
            dig_o(6 downto 0) => AN(6 downto 0)
                );
 AN(7 downto 6) <= b"11";
end architecture Behavioral;

