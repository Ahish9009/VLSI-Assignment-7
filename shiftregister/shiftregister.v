`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:00 11/10/2019 
// Design Name: 
// Module Name:    shiftregister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shiftregister(
	 input CLK, 
	 input CLEAR,
    input [3:0] p_input,
    input [1:0] s_line,
    input s_inp_l,
    input s_inp_r,
	 output dividedclock,
	 output [3:0] p_output
    );
	 
	// wire dividedclock; 
	 clockdivider DIV1(CLK, dividedclock);
	 reg [3:0] tmp = 4'b0000;
	 
	 always @(posedge CLK) begin
	 
			if (dividedclock == 1) begin
			//clear
			if (CLEAR) begin
				tmp = 0;
			end
			//parallel output
			else if (s_line == 2'b11) begin
					tmp[3:0] = p_input;
			end
			//right shift
			else if (s_line == 2'b01) begin
					tmp[3:0] = {s_inp_r, tmp[3:1]};
			end
			//left shift
			else if (s_line == 2'b10) begin
					tmp[3:0] = {tmp[2:0], s_inp_l};
			end
			else if (s_line == 2'b00) begin
					tmp[3:0] = tmp;
			end
			
			end
	end
	
	assign p_output[3:0] = tmp;
endmodule
	
module clockdivider(
	input CLK,
	output dividedclk
	);
	
	reg [28:0] counter=28'd0;
	
	parameter DIVISOR = 28'd100000000;
	
	always @(posedge CLK)
	begin
		counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1))
			counter <= 28'd0;
		end
		
	assign dividedclk = (counter == DIVISOR-2) ? 1 : 0;
		
	
		
endmodule
	 
	 
	 
