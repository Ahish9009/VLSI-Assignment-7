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
	 output reg [3:0] p_output=4'b0000
    );
	 
	 always @(posedge CLK) begin
	 
			//clear
			if (CLEAR) begin
				p_output <= 0;
			end
			//parallel output
			else if (s_line == 2'b11) begin
					p_output[3:0] <= p_input;
			end
			//right shift
			else if (s_line == 2'b01) begin
					p_output <= {s_inp_r, p_output[3:1]};
			end
			//left shift
			else if (s_line == 2'b10) begin
					p_output <= {p_output[2:0], s_inp_l};
			end
	end
			
	 
	 
	 


endmodule
