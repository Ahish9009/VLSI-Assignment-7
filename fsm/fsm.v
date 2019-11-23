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
// Revision 0.01 - 	File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fsm(
	input CLK,
	input RESET,
	input ONE,
	input ZERO,
	output OUT,
	output reg [3:0] state = 4'b0000
);

reg flag0=1, flag1=1;
//reg [3:0] state = 4'b0000;
assign OUT = state[0]&state[1]&state[2]&state[3];

wire dividedclock;
clockdivider D1(CLK, dividedclock);


always @(negedge ONE) begin
	flag1 <= 1;
end
always @(negedge ZERO) begin
	flag0 <= 1;
end

always @(posedge CLK) begin

	if (dividedclock == 1) begin
	if (RESET) begin
		state <= 4'b0000;
		flag1 <= 1;
		flag0 <= 1;
	end
	else begin
	
	if (state == 4'b0000) begin
			if (flag1 & ONE) begin
				state <= 4'b0100;
				flag1 <= 0;
			end
			else if (flag0 & ZERO) begin
				state <= 4'b0001;
				flag0 <= 0;
			end
		end
		else if (state == 0001) begin
			if (flag1 & ONE) begin
				state <= 4'b0101;
				flag1 <= 0;
			end
			else if (flag0 & ZERO) begin
				state <= 4'b0011;
				flag0 <= 0;
			end
		end
		else if (state == 4'b0011) begin
			if (flag1 & ONE) begin
				state <= 4'b0111;
				flag1 <= 0;
			end
		end
		else if (state == 4'b0111) begin
			if (flag1 & ONE) begin
				state <= 4'b1111;
				flag1 <= 0;

			end
		end
		else if (state == 4'b0101) begin
			if (flag1 & ONE) begin
				state <= 4'b1101;
				flag1 <= 0;
			end
			else if (flag0 & ZERO) begin
				state <= 4'b0111;
				flag0 <= 0;
			end
		end
		else if (state == 4'b0100) begin
			if (flag1 & ONE) begin
				state <= 4'b1100;
				flag1 <= 0;
			end
			else if (flag0 & ZERO) begin
				state <= 4'b0101;
				flag0 <= 0;

			end
		end
		else if (state == 4'b1100) begin
			if (flag0 & ZERO) begin
				state <= 4'b1101;
				flag0 <= 0;

			end
		end
		else if (state == 4'b1101) begin
			if (flag0 & ZERO) begin
				state <= 4'b1111;
				flag0 <= 0;

			end
		end
		end
		
		end


end


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

