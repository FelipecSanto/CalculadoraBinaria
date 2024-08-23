-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
-- CREATED		"Tue Jun 25 20:24:11 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Dividy4bit IS 
	PORT
	(
		a :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		r :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Dividy4bit;

ARCHITECTURE bdf_type OF Dividy4bit IS 

COMPONENT mux_1to2
	PORT(sel : IN STD_LOGIC;
		 in0 : IN STD_LOGIC;
		 in1 : IN STD_LOGIC;
		 saida : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT sb
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Bin : IN STD_LOGIC;
		 Ctrl : IN STD_LOGIC;
		 Op : OUT STD_LOGIC;
		 Bout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Bout0 :  STD_LOGIC;
SIGNAL	Bout1 :  STD_LOGIC;
SIGNAL	Bout2 :  STD_LOGIC;
SIGNAL	Bout3 :  STD_LOGIC;
SIGNAL	Bout4 :  STD_LOGIC;
SIGNAL	Bout5 :  STD_LOGIC;
SIGNAL	Bout6 :  STD_LOGIC;
SIGNAL	Bout7 :  STD_LOGIC;
SIGNAL	Bout8 :  STD_LOGIC;
SIGNAL	mux0 :  STD_LOGIC;
SIGNAL	Q_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	R_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	S0 :  STD_LOGIC;
SIGNAL	S1 :  STD_LOGIC;
SIGNAL	S2 :  STD_LOGIC;
SIGNAL	S3 :  STD_LOGIC;
SIGNAL	S4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_6 <= '0';
SYNTHESIZED_WIRE_9 <= '0';
SYNTHESIZED_WIRE_20 <= '0';



SYNTHESIZED_WIRE_22 <= NOT(b(2) OR b(1) OR b(3));


b2v_inst1 : mux_1to2
PORT MAP(sel => SYNTHESIZED_WIRE_22,
		 in0 => a(3),
		 in1 => SYNTHESIZED_WIRE_1,
		 saida => mux0);


SYNTHESIZED_WIRE_24 <= b(1) OR b(0);


SYNTHESIZED_WIRE_4 <= NOT(SYNTHESIZED_WIRE_23);



Q_ALTERA_SYNTHESIZED(2) <= SYNTHESIZED_WIRE_24 AND SYNTHESIZED_WIRE_4;


b2v_inst13 : sb
PORT MAP(A => S1,
		 B => b(2),
		 Bin => Bout3,
		 Ctrl => SYNTHESIZED_WIRE_25,
		 Op => S4,
		 Bout => Bout4);


b2v_inst14 : sb
PORT MAP(A => a(1),
		 B => b(0),
		 Bin => SYNTHESIZED_WIRE_6,
		 Ctrl => SYNTHESIZED_WIRE_25,
		 Op => S2,
		 Bout => Bout2);


b2v_inst15 : sb
PORT MAP(A => S4,
		 B => b(3),
		 Bin => Bout7,
		 Ctrl => Bout8,
		 Op => R_ALTERA_SYNTHESIZED(3),
		 Bout => Bout8);


b2v_inst16 : sb
PORT MAP(A => S0,
		 B => b(1),
		 Bin => Bout2,
		 Ctrl => SYNTHESIZED_WIRE_25,
		 Op => S3,
		 Bout => Bout3);


b2v_inst17 : sb
PORT MAP(A => S3,
		 B => b(2),
		 Bin => Bout6,
		 Ctrl => Bout8,
		 Op => R_ALTERA_SYNTHESIZED(2),
		 Bout => Bout7);


b2v_inst18 : sb
PORT MAP(A => a(0),
		 B => b(0),
		 Bin => SYNTHESIZED_WIRE_9,
		 Ctrl => Bout8,
		 Op => R_ALTERA_SYNTHESIZED(0),
		 Bout => Bout5);


b2v_inst19 : sb
PORT MAP(A => S2,
		 B => b(1),
		 Bin => Bout5,
		 Ctrl => Bout8,
		 Op => R_ALTERA_SYNTHESIZED(1),
		 Bout => Bout6);


SYNTHESIZED_WIRE_1 <= a(3) AND SYNTHESIZED_WIRE_10;


SYNTHESIZED_WIRE_25 <= b(3) OR Bout4;



SYNTHESIZED_WIRE_14 <= NOT(SYNTHESIZED_WIRE_25);



SYNTHESIZED_WIRE_26 <= b(2) OR SYNTHESIZED_WIRE_24;


Q_ALTERA_SYNTHESIZED(1) <= SYNTHESIZED_WIRE_26 AND SYNTHESIZED_WIRE_14;


SYNTHESIZED_WIRE_16 <= b(3) OR SYNTHESIZED_WIRE_26;


SYNTHESIZED_WIRE_17 <= NOT(Bout8);



Q_ALTERA_SYNTHESIZED(0) <= SYNTHESIZED_WIRE_16 AND SYNTHESIZED_WIRE_17;


SYNTHESIZED_WIRE_10 <= NOT(b(0));




Q_ALTERA_SYNTHESIZED(3) <= SYNTHESIZED_WIRE_22 AND a(3) AND b(0);


b2v_inst5 : sb
PORT MAP(A => mux0,
		 B => b(1),
		 Bin => Bout0,
		 Ctrl => SYNTHESIZED_WIRE_23,
		 Op => S1,
		 Bout => Bout1);


b2v_inst6 : sb
PORT MAP(A => a(2),
		 B => b(0),
		 Bin => SYNTHESIZED_WIRE_20,
		 Ctrl => SYNTHESIZED_WIRE_23,
		 Op => S0,
		 Bout => Bout0);


SYNTHESIZED_WIRE_23 <= b(2) OR b(3) OR Bout1;


q <= Q_ALTERA_SYNTHESIZED;
r <= R_ALTERA_SYNTHESIZED;

END bdf_type;