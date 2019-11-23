/*
###############################################################
#  Generated by:      Cadence Innovus 16.21-s078_1
#  OS:                Linux x86_64(Host ID client04)
#  Generated on:      Sun Nov 10 22:01:26 2019
#  Design:            fsm
#  Command:           saveNetlist fsm-innovus-netlist.v
###############################################################
*/
// Generated by Cadence Genus(TM) Synthesis Solution 16.21-s018_1
// Generated on: Nov 10 2019 21:41:49 IST (Nov 10 2019 16:11:49 UTC)
// Verification Directory fv/fsm 
module fsm (
	CLK, 
	RESET, 
	ONE, 
	ZERO, 
	OUT);
   input CLK;
   input RESET;
   input ONE;
   input ZERO;
   output OUT;

   // Internal wires
   wire [3:0] state;
   wire flag0;
   wire flag1;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;

   assign flag1 = 1'b1 ;
   assign flag0 = 1'b1 ;

   NAND2XL FE_RC_3_0 (.A(n_14),
	.B(n_0),
	.Y(n_18));
   NAND2BX1 FE_RC_2_0 (.AN(n_6),
	.B(n_0),
	.Y(n_12));
   NAND2XL FE_RC_1_0 (.A(ZERO),
	.B(n_5),
	.Y(n_8));
   CLKINVX1 FE_RC_0_0 (.A(ONE),
	.Y(n_1));
   AND4X1 g1107 (.A(state[2]),
	.B(state[0]),
	.C(state[3]),
	.D(state[1]),
	.Y(OUT));
   DFFQX1 flag0_reg165 (.CK(CLK),
	.D(n_18),
	.Q(flag0));
   DFFQX1 \state_reg[0]  (.CK(CLK),
	.D(n_17),
	.Q(state[0]));
   DFFQX1 \state_reg[1]  (.CK(CLK),
	.D(n_19),
	.Q(state[1]));
   NOR2XL g1332 (.A(RESET),
	.B(n_16),
	.Y(n_19));
   AOI2BB1XL g1334 (.A0N(state[0]),
	.A1N(n_14),
	.B0(RESET),
	.Y(n_17));
   DFFQX1 flag1_reg168 (.CK(CLK),
	.D(n_12),
	.Q(flag1));
   DFFQX1 \state_reg[2]  (.CK(CLK),
	.D(n_11),
	.Q(state[2]));
   AOI21XL g1337 (.A0(state[0]),
	.A1(n_9),
	.B0(state[1]),
	.Y(n_16));
   DFFQX1 \state_reg[3]  (.CK(CLK),
	.D(n_13),
	.Q(state[3]));
   NOR2XL g1340 (.A(RESET),
	.B(n_10),
	.Y(n_13));
   NOR2XL g1341 (.A(state[1]),
	.B(n_8),
	.Y(n_14));
   NOR2XL g1343 (.A(RESET),
	.B(n_7),
	.Y(n_11));
   AOI31XL g1344 (.A0(n_3),
	.A1(state[2]),
	.A2(n_2),
	.B0(state[3]),
	.Y(n_10));
   CLKINVX1 g1345 (.A(n_8),
	.Y(n_9));
   AOI21XL g1346 (.A0(n_2),
	.A1(n_4),
	.B0(state[2]),
	.Y(n_7));
   NAND2XL g1348 (.A(ONE),
	.B(n_4),
	.Y(n_6));
   MX2X1 g1349 (.A(n_1),
	.B(state[2]),
	.S0(state[3]),
	.Y(n_5));
   NOR2BXL g1350 (.AN(n_3),
	.B(state[3]),
	.Y(n_4));
   NAND2BXL g1351 (.AN(state[0]),
	.B(state[1]),
	.Y(n_3));
   CLKINVX1 g1352 (.A(n_1),
	.Y(n_2));
   CLKINVX1 g1354 (.A(RESET),
	.Y(n_0));
endmodule

