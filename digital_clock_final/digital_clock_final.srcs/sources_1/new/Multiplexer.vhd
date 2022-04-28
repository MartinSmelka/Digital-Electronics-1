library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           H_out1 : in STD_LOGIC_VECTOR (6 downto 0);
           H_out0 : in STD_LOGIC_VECTOR (6 downto 0);
           M_out1 : in STD_LOGIC_VECTOR (6 downto 0);
           M_out0 : in STD_LOGIC_VECTOR (6 downto 0);
           S_out1 : in STD_LOGIC_VECTOR (6 downto 0);
           S_out0 : in STD_LOGIC_VECTOR (6 downto 0);
           seg_o : out STD_LOGIC_VECTOR (6 downto 0);
           dig_o : out STD_LOGIC_VECTOR (5 downto 0)
           );
end Multiplexer;

architecture Behavioral of Multiplexer is
signal s_en : std_logic ;
signal s_cnt : std_logic_vector( 2 downto 0);
begin
clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 20000000
        )
        port map(
            clk   => clk,
            reset => rst_n,
            ce_o  => s_en
        );

bin_cnt0 : entity work.cnt_up_down
       generic map(
            g_CNT_WIDTH => 3
        )
        port map(
            clk     => clk,
            reset   => rst_n,
            en_i    => s_en,
            cnt_up_i => '0',
            cnt_o => s_cnt
        );

p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (rst_n = '1') then
               seg_o <= S_out0;
               dig_o <= "111110";
            else
                case s_cnt is
                    when "111" => 
                        seg_o <= S_out0;
                        dig_o <= "111111";
                    when "110" =>
                        seg_o <= H_out1;
                        dig_o <= "011111";
                    when "101" =>
                        seg_o <= H_out0;
                        dig_o <= "101111";
                    when "100" =>
                        seg_o <= M_out1;
                        dig_o <= "110111";
                    when "011" =>
                        seg_o <= M_out0;
                        dig_o <= "111011";
                    when "010" =>
                        seg_o <= S_out1;
                        dig_o <= "111101";
                    when "001" =>
                        seg_o <= S_out0;
                        dig_o <= "111110";
                    when others =>
                        seg_o <= S_out0;
                        dig_o <= "111111";    
                end case;
            end if;
        end if;
    end process p_mux;
end Behavioral;