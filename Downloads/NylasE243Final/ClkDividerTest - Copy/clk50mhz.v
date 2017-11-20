`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:54 11/11/2017 
// Design Name: 
// Module Name:    clk50mhz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
// This is a modification of Josh Sackos from Digilent's work
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk50mhz(clk,clkout);

   (* CLOCK_DEDICATED_ROUTE = "FALSE", LOC = "V10" *) input  clk;		// 100MHz onboard clock
   (* LOC = "K6 " *)output  reg clkout;	// New clock output

   // Current count value
   reg [30:0] count;

		always @(posedge clk)
			begin
					count <=count +1;
					if (count == 2) begin
						count <= 0;
						clkout <= !clkout;
						
					end;
			end;
   
endmodule
