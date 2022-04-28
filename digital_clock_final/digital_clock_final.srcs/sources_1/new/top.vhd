
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

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
signal s_h_out0 : STD_LOGIC_VECTOR (6 downto 0);
signal s_h_out1 : STD_LOGIC_VECTOR (6 downto 0);
signal s_m_out0 : STD_LOGIC_VECTOR (6 downto 0);
signal s_m_out1 : STD_LOGIC_VECTOR (6 downto 0);
signal s_s_out0 : STD_LOGIC_VECTOR (6 downto 0);
signal s_s_out1 : STD_LOGIC_VECTOR (6 downto 0);
signal s_clk : std_logic;
begin
Multiplexer : entity work.Multiplexer 
    port map (
    clk => CLK100MHZ,
    rst_n => BTNC,
    H_out0 => s_h_out0,
    H_out1 => s_h_out1,

    M_out1 => s_m_out1,
    M_out0 => s_m_out0,
    S_out1 => s_s_out1,
    S_out0 => s_s_out0,
    seg_o(6) => CA,
    seg_o(5) => CB,
    seg_o(4) => CC,
    seg_o(3) => CD,
    seg_o(2) => CE,
    seg_o(1) => CF,
    seg_o(0) => CG,
    dig_o(5 downto 0) => AN(5 downto 0)
    );
digital_clock : entity work.digital_clock
      port map(
            H_out0 => s_h_out0,
            H_out1 => s_h_out1,
            M_out1 => s_m_out1,
            M_out0 => s_m_out0,
            S_out1 => s_s_out1,
            S_out0 => s_s_out0,
            clk => CLK100MHZ,
            rst_n => BTNC,
            H_in1 => b"00",
            H_in0 => b"0000",
            M_in1 => b"0000",
            M_in0 => b"0000",            
            S_in1 => b"0000",
            S_in0 => b"0000"          
                );
 AN(7 downto 6) <= b"11";
end architecture Behavioral;

