----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 01:22:41 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture testbench of sevenseg_decoder_tb is

    component sevenseg_decoder is
    port(
        i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
        o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
    );	
    end component;
    
    signal w_Hex: std_logic_vector(3 downto 0);
    signal w_seg_n: std_logic_vector(6 downto 0);
begin
    sevenseg_decoder_uut: sevenseg_decoder port map (
        i_Hex => w_Hex,
        o_seg_n => w_seg_n
    );

    test_process : process
    begin
        w_Hex <= "0000"; wait for 10 ns;
            assert w_seg_n = "1000000" report "error on 0" severity failure;
        w_Hex <= "1111"; wait for 10 ns;
            assert w_seg_n = "0001110" report "error on F" severity failure;
        w_Hex <= "1010"; wait for 10 ns;
            assert w_seg_n = "0001000" report "error on A" severity failure;
        
        wait;
    end process;

end testbench;