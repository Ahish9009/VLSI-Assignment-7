`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:45 11/10/2019 
// Design Name: 
// Module Name:    fsm 
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
module fsm(
	input CLK,
	input RESET,
	input ONE,
	input ZERO,
	output reg [3:0] state=4'b0000,
	output OUT
);


reg one=0;
reg zero=0;
reg prev1=0;
reg prev0=0;
assign OUT = state[0]&state[1]&state[2]&state[3];
wire flag0 = ~prev0 & zero; 
wire flag1 = ~prev1 & one; 
always @(posedge CLK) begin

	if (RESET) begin	
		state <= 4'b0000;
		prev0 <= 0;
		prev1 <= 0;
	end
	else begin

		one <= ONE;
		zero <= ZERO;

		prev0<=zero;
		prev1<=one;

		if (state == 4'b0000) begin
			if (flag1) begin
				state <= 4'b0100;
			end
			else if (flag0) begin
				state <= 4'b0001;
			end
		end
		else if (state == 0001) begin
			if (flag1) begin
				state <= 4'b0101;

			end
			else if (flag0) begin
				state <= 4'b0011;

			end
		end
		else if (state == 4'b0011) begin
			if (flag1) begin
				state <= 4'b0111;
			end
		end
		else if (state == 4'b0111) begin
			if (flag1) begin
				state <= 4'b1111;

			end
		end
		else if (state == 4'b0101) begin
			if (flag1) begin
				state <= 4'b1101;
			end
			else if (flag0) begin
				state <= 4'b0111;
			end
		end
		else if (state == 4'b0100) begin
			if (flag1) begin
				state <= 4'b1100;

			end
			else if (flag0) begin
				state <= 4'b0101;

			end
		end
		else if (state == 4'b1100) begin
			if (flag0) begin
				state <= 4'b1101;

			end
		end
		else if (state == 4'b1101) begin
			if (flag0) begin
				state <= 4'b1111;

			end
		end

	end
end



endmodule

