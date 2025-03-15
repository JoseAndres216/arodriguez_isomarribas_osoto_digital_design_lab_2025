-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/12/2025 01:41:42"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	implementacion_sumador IS
    PORT (
	Switches : IN std_logic_vector(8 DOWNTO 0);
	Segments : OUT std_logic_vector(6 DOWNTO 0)
	);
END implementacion_sumador;

-- Design Ports Information
-- Segments[0]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[3]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[4]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Segments[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[3]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[7]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[6]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[1]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[5]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[0]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switches[8]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF implementacion_sumador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Switches : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_Segments : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Switches[6]~input_o\ : std_logic;
SIGNAL \Switches[7]~input_o\ : std_logic;
SIGNAL \Switches[5]~input_o\ : std_logic;
SIGNAL \Switches[8]~input_o\ : std_logic;
SIGNAL \Switches[4]~input_o\ : std_logic;
SIGNAL \Switches[0]~input_o\ : std_logic;
SIGNAL \Switches[1]~input_o\ : std_logic;
SIGNAL \Sumador|adder2|Cout~combout\ : std_logic;
SIGNAL \Switches[2]~input_o\ : std_logic;
SIGNAL \Switches[3]~input_o\ : std_logic;
SIGNAL \Sumador|adder4|S~combout\ : std_logic;
SIGNAL \Sumador|adder1|S~combout\ : std_logic;
SIGNAL \Sumador|adderr3|S~combout\ : std_logic;
SIGNAL \Sumador|adder2|S~combout\ : std_logic;
SIGNAL \Decodificador|Mux6~0_combout\ : std_logic;
SIGNAL \Sumador|adder4|Cout~combout\ : std_logic;
SIGNAL \Decodificador|Mux6~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux5~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux5~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux4~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux4~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux3~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux3~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux2~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux2~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux1~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux1~1_combout\ : std_logic;
SIGNAL \Decodificador|Mux0~0_combout\ : std_logic;
SIGNAL \Decodificador|Mux0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Switches[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Switches[3]~input_o\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \Decodificador|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \Sumador|adder4|ALT_INV_S~combout\ : std_logic;
SIGNAL \Sumador|adderr3|ALT_INV_S~combout\ : std_logic;
SIGNAL \Sumador|adder2|ALT_INV_S~combout\ : std_logic;
SIGNAL \Sumador|adder1|ALT_INV_S~combout\ : std_logic;
SIGNAL \Sumador|adder4|ALT_INV_Cout~combout\ : std_logic;
SIGNAL \Sumador|adder2|ALT_INV_Cout~combout\ : std_logic;

BEGIN

ww_Switches <= Switches;
Segments <= ww_Segments;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Switches[8]~input_o\ <= NOT \Switches[8]~input_o\;
\ALT_INV_Switches[4]~input_o\ <= NOT \Switches[4]~input_o\;
\ALT_INV_Switches[0]~input_o\ <= NOT \Switches[0]~input_o\;
\ALT_INV_Switches[5]~input_o\ <= NOT \Switches[5]~input_o\;
\ALT_INV_Switches[1]~input_o\ <= NOT \Switches[1]~input_o\;
\ALT_INV_Switches[6]~input_o\ <= NOT \Switches[6]~input_o\;
\ALT_INV_Switches[2]~input_o\ <= NOT \Switches[2]~input_o\;
\ALT_INV_Switches[7]~input_o\ <= NOT \Switches[7]~input_o\;
\ALT_INV_Switches[3]~input_o\ <= NOT \Switches[3]~input_o\;
\Decodificador|ALT_INV_Mux0~0_combout\ <= NOT \Decodificador|Mux0~0_combout\;
\Decodificador|ALT_INV_Mux1~0_combout\ <= NOT \Decodificador|Mux1~0_combout\;
\Decodificador|ALT_INV_Mux2~0_combout\ <= NOT \Decodificador|Mux2~0_combout\;
\Decodificador|ALT_INV_Mux3~0_combout\ <= NOT \Decodificador|Mux3~0_combout\;
\Decodificador|ALT_INV_Mux4~0_combout\ <= NOT \Decodificador|Mux4~0_combout\;
\Decodificador|ALT_INV_Mux5~0_combout\ <= NOT \Decodificador|Mux5~0_combout\;
\Decodificador|ALT_INV_Mux6~0_combout\ <= NOT \Decodificador|Mux6~0_combout\;
\Sumador|adder4|ALT_INV_S~combout\ <= NOT \Sumador|adder4|S~combout\;
\Sumador|adderr3|ALT_INV_S~combout\ <= NOT \Sumador|adderr3|S~combout\;
\Sumador|adder2|ALT_INV_S~combout\ <= NOT \Sumador|adder2|S~combout\;
\Sumador|adder1|ALT_INV_S~combout\ <= NOT \Sumador|adder1|S~combout\;
\Sumador|adder4|ALT_INV_Cout~combout\ <= NOT \Sumador|adder4|Cout~combout\;
\Sumador|adder2|ALT_INV_Cout~combout\ <= NOT \Sumador|adder2|Cout~combout\;

-- Location: IOOBUF_X60_Y0_N19
\Segments[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux6~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(0));

-- Location: IOOBUF_X80_Y0_N2
\Segments[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux5~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(1));

-- Location: IOOBUF_X50_Y0_N93
\Segments[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux4~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(2));

-- Location: IOOBUF_X50_Y0_N76
\Segments[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux3~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(3));

-- Location: IOOBUF_X56_Y0_N36
\Segments[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux2~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(4));

-- Location: IOOBUF_X58_Y0_N76
\Segments[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux1~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(5));

-- Location: IOOBUF_X56_Y0_N53
\Segments[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Decodificador|Mux0~1_combout\,
	devoe => ww_devoe,
	o => ww_Segments(6));

-- Location: IOIBUF_X89_Y20_N78
\Switches[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(6),
	o => \Switches[6]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\Switches[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(7),
	o => \Switches[7]~input_o\);

-- Location: IOIBUF_X89_Y20_N61
\Switches[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(5),
	o => \Switches[5]~input_o\);

-- Location: IOIBUF_X89_Y21_N21
\Switches[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(8),
	o => \Switches[8]~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\Switches[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(4),
	o => \Switches[4]~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\Switches[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(0),
	o => \Switches[0]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\Switches[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(1),
	o => \Switches[1]~input_o\);

-- Location: LABCELL_X83_Y16_N30
\Sumador|adder2|Cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adder2|Cout~combout\ = ( \Switches[1]~input_o\ & ( ((!\Switches[8]~input_o\ & (\Switches[4]~input_o\ & \Switches[0]~input_o\)) # (\Switches[8]~input_o\ & ((\Switches[0]~input_o\) # (\Switches[4]~input_o\)))) # (\Switches[5]~input_o\) ) ) # ( 
-- !\Switches[1]~input_o\ & ( (\Switches[5]~input_o\ & ((!\Switches[8]~input_o\ & (\Switches[4]~input_o\ & \Switches[0]~input_o\)) # (\Switches[8]~input_o\ & ((\Switches[0]~input_o\) # (\Switches[4]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010101000000010001010101010111011111110101011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Switches[5]~input_o\,
	datab => \ALT_INV_Switches[8]~input_o\,
	datac => \ALT_INV_Switches[4]~input_o\,
	datad => \ALT_INV_Switches[0]~input_o\,
	dataf => \ALT_INV_Switches[1]~input_o\,
	combout => \Sumador|adder2|Cout~combout\);

-- Location: IOIBUF_X89_Y21_N38
\Switches[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(2),
	o => \Switches[2]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\Switches[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switches(3),
	o => \Switches[3]~input_o\);

-- Location: LABCELL_X83_Y16_N6
\Sumador|adder4|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adder4|S~combout\ = ( \Switches[3]~input_o\ & ( !\Switches[7]~input_o\ $ (((!\Switches[6]~input_o\ & (\Sumador|adder2|Cout~combout\ & \Switches[2]~input_o\)) # (\Switches[6]~input_o\ & ((\Switches[2]~input_o\) # 
-- (\Sumador|adder2|Cout~combout\))))) ) ) # ( !\Switches[3]~input_o\ & ( !\Switches[7]~input_o\ $ (((!\Switches[6]~input_o\ & ((!\Sumador|adder2|Cout~combout\) # (!\Switches[2]~input_o\))) # (\Switches[6]~input_o\ & (!\Sumador|adder2|Cout~combout\ & 
-- !\Switches[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011001101100001101100110110011001001100100111100100110010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Switches[6]~input_o\,
	datab => \ALT_INV_Switches[7]~input_o\,
	datac => \Sumador|adder2|ALT_INV_Cout~combout\,
	datad => \ALT_INV_Switches[2]~input_o\,
	dataf => \ALT_INV_Switches[3]~input_o\,
	combout => \Sumador|adder4|S~combout\);

-- Location: LABCELL_X83_Y16_N12
\Sumador|adder1|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adder1|S~combout\ = !\Switches[0]~input_o\ $ (!\Switches[4]~input_o\ $ (\Switches[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011001111001100001100111100110000110011110011000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Switches[0]~input_o\,
	datac => \ALT_INV_Switches[4]~input_o\,
	datad => \ALT_INV_Switches[8]~input_o\,
	combout => \Sumador|adder1|S~combout\);

-- Location: LABCELL_X83_Y16_N15
\Sumador|adderr3|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adderr3|S~combout\ = ( \Sumador|adder2|Cout~combout\ & ( !\Switches[6]~input_o\ $ (\Switches[2]~input_o\) ) ) # ( !\Sumador|adder2|Cout~combout\ & ( !\Switches[6]~input_o\ $ (!\Switches[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000011110000000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Switches[6]~input_o\,
	datad => \ALT_INV_Switches[2]~input_o\,
	dataf => \Sumador|adder2|ALT_INV_Cout~combout\,
	combout => \Sumador|adderr3|S~combout\);

-- Location: LABCELL_X83_Y16_N33
\Sumador|adder2|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adder2|S~combout\ = ( \Switches[4]~input_o\ & ( !\Switches[5]~input_o\ $ (!\Switches[1]~input_o\ $ (((\Switches[0]~input_o\) # (\Switches[8]~input_o\)))) ) ) # ( !\Switches[4]~input_o\ & ( !\Switches[5]~input_o\ $ (!\Switches[1]~input_o\ $ 
-- (((\Switches[8]~input_o\ & \Switches[0]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001010110100110100101101001101001010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Switches[5]~input_o\,
	datab => \ALT_INV_Switches[8]~input_o\,
	datac => \ALT_INV_Switches[1]~input_o\,
	datad => \ALT_INV_Switches[0]~input_o\,
	dataf => \ALT_INV_Switches[4]~input_o\,
	combout => \Sumador|adder2|S~combout\);

-- Location: LABCELL_X83_Y16_N21
\Decodificador|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux6~0_combout\ = ( \Sumador|adder2|S~combout\ & ( (\Sumador|adder4|S~combout\ & (\Sumador|adder1|S~combout\ & !\Sumador|adderr3|S~combout\)) ) ) # ( !\Sumador|adder2|S~combout\ & ( (!\Sumador|adder4|S~combout\ & 
-- (!\Sumador|adder1|S~combout\ $ (!\Sumador|adderr3|S~combout\))) # (\Sumador|adder4|S~combout\ & (\Sumador|adder1|S~combout\ & \Sumador|adderr3|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100100101001001010010010100100010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder4|ALT_INV_S~combout\,
	datab => \Sumador|adder1|ALT_INV_S~combout\,
	datac => \Sumador|adderr3|ALT_INV_S~combout\,
	dataf => \Sumador|adder2|ALT_INV_S~combout\,
	combout => \Decodificador|Mux6~0_combout\);

-- Location: LABCELL_X83_Y16_N9
\Sumador|adder4|Cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sumador|adder4|Cout~combout\ = ( \Switches[3]~input_o\ & ( ((!\Switches[6]~input_o\ & (\Switches[2]~input_o\ & \Sumador|adder2|Cout~combout\)) # (\Switches[6]~input_o\ & ((\Sumador|adder2|Cout~combout\) # (\Switches[2]~input_o\)))) # 
-- (\Switches[7]~input_o\) ) ) # ( !\Switches[3]~input_o\ & ( (\Switches[7]~input_o\ & ((!\Switches[6]~input_o\ & (\Switches[2]~input_o\ & \Sumador|adder2|Cout~combout\)) # (\Switches[6]~input_o\ & ((\Sumador|adder2|Cout~combout\) # 
-- (\Switches[2]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010011000000010001001100110111011111110011011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Switches[6]~input_o\,
	datab => \ALT_INV_Switches[7]~input_o\,
	datac => \ALT_INV_Switches[2]~input_o\,
	datad => \Sumador|adder2|ALT_INV_Cout~combout\,
	dataf => \ALT_INV_Switches[3]~input_o\,
	combout => \Sumador|adder4|Cout~combout\);

-- Location: LABCELL_X83_Y16_N18
\Decodificador|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux6~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux6~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Decodificador|ALT_INV_Mux6~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux6~1_combout\);

-- Location: LABCELL_X83_Y16_N27
\Decodificador|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux5~0_combout\ = ( \Sumador|adder4|S~combout\ & ( \Sumador|adder1|S~combout\ & ( \Sumador|adder2|S~combout\ ) ) ) # ( !\Sumador|adder4|S~combout\ & ( \Sumador|adder1|S~combout\ & ( (!\Sumador|adder2|S~combout\ & 
-- \Sumador|adderr3|S~combout\) ) ) ) # ( \Sumador|adder4|S~combout\ & ( !\Sumador|adder1|S~combout\ & ( \Sumador|adderr3|S~combout\ ) ) ) # ( !\Sumador|adder4|S~combout\ & ( !\Sumador|adder1|S~combout\ & ( (\Sumador|adder2|S~combout\ & 
-- \Sumador|adderr3|S~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000011110000111100001010000010100101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder2|ALT_INV_S~combout\,
	datac => \Sumador|adderr3|ALT_INV_S~combout\,
	datae => \Sumador|adder4|ALT_INV_S~combout\,
	dataf => \Sumador|adder1|ALT_INV_S~combout\,
	combout => \Decodificador|Mux5~0_combout\);

-- Location: LABCELL_X83_Y14_N33
\Decodificador|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux5~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux5~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Decodificador|ALT_INV_Mux5~0_combout\,
	datae => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux5~1_combout\);

-- Location: LABCELL_X83_Y16_N0
\Decodificador|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux4~0_combout\ = ( \Sumador|adder1|S~combout\ & ( (\Sumador|adder2|S~combout\ & (\Sumador|adderr3|S~combout\ & \Sumador|adder4|S~combout\)) ) ) # ( !\Sumador|adder1|S~combout\ & ( (!\Sumador|adderr3|S~combout\ & (\Sumador|adder2|S~combout\ 
-- & !\Sumador|adder4|S~combout\)) # (\Sumador|adderr3|S~combout\ & ((\Sumador|adder4|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001101000011010000110100001100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder2|ALT_INV_S~combout\,
	datab => \Sumador|adderr3|ALT_INV_S~combout\,
	datac => \Sumador|adder4|ALT_INV_S~combout\,
	dataf => \Sumador|adder1|ALT_INV_S~combout\,
	combout => \Decodificador|Mux4~0_combout\);

-- Location: LABCELL_X83_Y16_N3
\Decodificador|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux4~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux4~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Decodificador|ALT_INV_Mux4~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux4~1_combout\);

-- Location: LABCELL_X83_Y16_N39
\Decodificador|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux3~0_combout\ = ( \Sumador|adder2|S~combout\ & ( (!\Sumador|adder1|S~combout\ & (\Sumador|adder4|S~combout\ & !\Sumador|adderr3|S~combout\)) # (\Sumador|adder1|S~combout\ & ((\Sumador|adderr3|S~combout\))) ) ) # ( 
-- !\Sumador|adder2|S~combout\ & ( (!\Sumador|adder4|S~combout\ & (!\Sumador|adder1|S~combout\ $ (!\Sumador|adderr3|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010100000000010101010000001010000000011110101000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder4|ALT_INV_S~combout\,
	datac => \Sumador|adder1|ALT_INV_S~combout\,
	datad => \Sumador|adderr3|ALT_INV_S~combout\,
	dataf => \Sumador|adder2|ALT_INV_S~combout\,
	combout => \Decodificador|Mux3~0_combout\);

-- Location: LABCELL_X83_Y16_N36
\Decodificador|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux3~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Decodificador|ALT_INV_Mux3~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux3~1_combout\);

-- Location: LABCELL_X83_Y16_N42
\Decodificador|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux2~0_combout\ = ( \Sumador|adder1|S~combout\ & ( (!\Sumador|adder4|S~combout\) # ((!\Sumador|adder2|S~combout\ & !\Sumador|adderr3|S~combout\)) ) ) # ( !\Sumador|adder1|S~combout\ & ( (!\Sumador|adder2|S~combout\ & 
-- (\Sumador|adderr3|S~combout\ & !\Sumador|adder4|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000011111000111110001111100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder2|ALT_INV_S~combout\,
	datab => \Sumador|adderr3|ALT_INV_S~combout\,
	datac => \Sumador|adder4|ALT_INV_S~combout\,
	dataf => \Sumador|adder1|ALT_INV_S~combout\,
	combout => \Decodificador|Mux2~0_combout\);

-- Location: LABCELL_X83_Y16_N45
\Decodificador|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux2~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Decodificador|ALT_INV_Mux2~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux2~1_combout\);

-- Location: LABCELL_X83_Y16_N51
\Decodificador|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux1~0_combout\ = ( \Sumador|adder2|S~combout\ & ( (!\Sumador|adder4|S~combout\ & ((!\Sumador|adderr3|S~combout\) # (\Sumador|adder1|S~combout\))) ) ) # ( !\Sumador|adder2|S~combout\ & ( (\Sumador|adder1|S~combout\ & 
-- (!\Sumador|adder4|S~combout\ $ (\Sumador|adderr3|S~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000100100001001000010010000110100010101000101010001010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Sumador|adder4|ALT_INV_S~combout\,
	datab => \Sumador|adder1|ALT_INV_S~combout\,
	datac => \Sumador|adderr3|ALT_INV_S~combout\,
	dataf => \Sumador|adder2|ALT_INV_S~combout\,
	combout => \Decodificador|Mux1~0_combout\);

-- Location: LABCELL_X83_Y16_N48
\Decodificador|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux1~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux1~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Decodificador|ALT_INV_Mux1~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux1~1_combout\);

-- Location: LABCELL_X83_Y16_N54
\Decodificador|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux0~0_combout\ = ( \Sumador|adder2|S~combout\ & ( (\Sumador|adder1|S~combout\ & (!\Sumador|adder4|S~combout\ & \Sumador|adderr3|S~combout\)) ) ) # ( !\Sumador|adder2|S~combout\ & ( (!\Sumador|adder4|S~combout\ & 
-- ((!\Sumador|adderr3|S~combout\))) # (\Sumador|adder4|S~combout\ & (!\Sumador|adder1|S~combout\ & \Sumador|adderr3|S~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001100111100000000110000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Sumador|adder1|ALT_INV_S~combout\,
	datac => \Sumador|adder4|ALT_INV_S~combout\,
	datad => \Sumador|adderr3|ALT_INV_S~combout\,
	dataf => \Sumador|adder2|ALT_INV_S~combout\,
	combout => \Decodificador|Mux0~0_combout\);

-- Location: LABCELL_X83_Y16_N57
\Decodificador|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Decodificador|Mux0~1_combout\ = ( \Sumador|adder4|Cout~combout\ ) # ( !\Sumador|adder4|Cout~combout\ & ( \Decodificador|Mux0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Decodificador|ALT_INV_Mux0~0_combout\,
	dataf => \Sumador|adder4|ALT_INV_Cout~combout\,
	combout => \Decodificador|Mux0~1_combout\);

-- Location: LABCELL_X36_Y75_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


