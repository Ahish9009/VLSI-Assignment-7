`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:06:14 11/10/2019
// Design Name:   shiftregister
// Module Name:   /home/ahish/Desktop/VLSI-Assignment-7/shiftregister/shifttb.v
// Project Name:  shiftregister
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftregister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifttb;

	// Inputs
	reg CLK;
	reg CLEAR;
	reg [3:0] p_input;
	reg [1:0] s_line;
	reg s_inp_l;
	reg s_inp_r;

	// Outputs
	wire [3:0] p_output;

	// Instantiate the Unit Under Test (UUT)
	shiftregister uut (
		.CLK(CLK), 
		.CLEAR(CLEAR), 
		.p_input(p_input), 
		.s_line(s_line), 
		.s_inp_l(s_inp_l), 
		.s_inp_r(s_inp_r), 
		.p_output(p_output)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLEAR = 0;
		p_input = 4'b1010;
		s_line = 2'b00;
		s_inp_l = 0;
		s_inp_r = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #1 CLK=~CLK;
	always #4 s_line[0]=~s_line[0];
	always #5 s_line[1]=~s_line[1];
	always #2 s_inp_l=~s_inp_l;
	always #2 s_inp_r=~s_inp_r;
	always #50 CLEAR=~CLEAR;
      
endmodule

