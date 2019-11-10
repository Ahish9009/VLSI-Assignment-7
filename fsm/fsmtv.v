`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:41:55 11/10/2019
// Design Name:   fsm
// Module Name:   /home/ahish/Desktop/VLSI-Assignment-7/fsm/fsmtv.v
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

module fsmtv;

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

	end
	always #2 CLK=~CLK;
	always #5 ONE=~ONE;
	always #3 ZERO=~ZERO;
      
endmodule

