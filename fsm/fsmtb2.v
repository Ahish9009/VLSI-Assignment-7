`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:18:10 11/10/2019
// Design Name:   fsm
// Module Name:   /home/ahish/Desktop/VLSI-Assignment-7/fsm/fsmtb2.v
// Project Name:  fsm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsmtb2;

	// Inputs
	reg CLK;
	reg RESET;
	reg ONE;
	reg ZERO;

	// Outputs
	wire OUT;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.ONE(ONE), 
		.ZERO(ZERO), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		ONE = 0;
		ZERO = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		#2; 
		ONE = 1;
		#2;
		ONE = 0;
		ZERO = 1;
		#2;
		ZERO = 0;
		ONE = 1;
		#2;
		ZERO = 1;
		ONE = 0;
		#2;
		ZERO = 0;
		#2;
		RESET = 1;
		#2;
		RESET = 0;
		
		#2;
		ONE = 0;
		#2;
		ZERO = 1;
		#2;
		ZERO = 0;
		#2;
		ZERO = 1;
		#2;
		ZERO = 0;
		#2;
		ZERO = 1;
		#2;
		ZERO = 0;
		#2;
		ZERO = 1;
		
		#2;
		ONE = 0;
		#2;
		ONE = 1;
		#2;
		ONE = 0;
		#2;
		ONE = 1;
		#2;
		ONE = 0;
		#2;
		ONE = 1;
		#2;
		ONE = 0;
	
	end
	always #1 CLK=~CLK;
//	always #7 ONE=~ONE;
//	always #5 ZERO=~ZERO;
//	always #400 RESET=~RESET;
      
endmodule

