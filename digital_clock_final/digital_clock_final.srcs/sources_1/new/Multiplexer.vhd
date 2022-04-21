
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( clk_50 : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           H_out1 : in STD_LOGIC_VECTOR (0 to 7);
           H_out0 : in STD_LOGIC_VECTOR (0 to 7);
           M_out1 : in STD_LOGIC_VECTOR (0 to 7);
           M_out0 : in STD_LOGIC_VECTOR (0 to 7);
           S_out1 : in STD_LOGIC_VECTOR (0 to 7);
           S_out0 : in STD_LOGIC_VECTOR (0 to 7);
           seg_o : out STD_LOGIC_VECTOR (0 to 7);
           dig_o : out STD_LOGIC_VECTOR (0 to 5);
           s_cnt : inout STD_LOGIC_VECTOR (2 downto 0)
           );
end Multiplexer;

architecture Behavioral of Multiplexer is

begin

bin_cnt0 : entity work.cnt_up_down
       generic map(
            g_CNT_WIDTH => 2
        )
        port map(
            clk     => clk_50,
            reset   => rst_n,
            en_i    => '1',
            cnt_up_i => '0',
            cnt_o => s_cnt
        );

p_mux : process(clk_50, rst_n)
    begin
        if rising_edge(clk_50) then
            if (rst_n = '1') then
               seg_o <= S_out0;
               dig_o <= "111110";
            else
                case s_cnt is
                    when "110" =>
                        seg_o <= H_out1;
                        dig_o <= "0111111";
                    when "101" =>
                        seg_o <= H_out0;
                        dig_o <= "1011111";
                    when "100" =>
                        seg_o <= M_out1;
                        dig_o <= "1101111";
                    when "011" =>
                        seg_o <= M_out0;
                        dig_o <= "1110111";
                    when "010" =>
                        seg_o <= M_out0;
                        dig_o <= "1111011";
                    when "001" =>
                        seg_o <= S_out1;
                        dig_o <= "1111101";
                     when "000" =>
                        seg_o <= S_out0;
                        dig_o <= "1111110";      
                    when others =>
                        seg_o <= S_out0;
                        dig_o <= "111110";
                end case;
            end if;
        end if;
    end process p_mux;

end Behavioral;
