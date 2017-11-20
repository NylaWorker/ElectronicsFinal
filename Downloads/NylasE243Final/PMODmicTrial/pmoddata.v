`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:45 11/13/2017 
// Design Name: 
// Module Name:    pmoddata 
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


///FAILED ATTEMPT 

module pmoddata(clk,clkout, Misoin, Misoout, ssout, ssin);

   (* CLOCK_DEDICATED_ROUTE = "FALSE", LOC = "V10" *) input  clk;		// 100MHz onboard clock
	
	
   (* LOC = "E12" *)output  reg clkout;	// New clock output - sck 
	
	
	(* LOC = "F12"*) reg[7:0] input Misoin;
	
	
//	(* LOC = "G11" *) output Misout;
	
	
	(*LOC = "D12" *) output ssout;
	
	(*LOC = "C4" *) input ssin;
	(* LOC = "T11 R11 N11 M11 V15 U15 V16 U16" *) output [7:0] Misoout;
	
	
	//input reg [11:0] datain; I am not sure about this 
	parameter Tp= 1;
	
	
   // Current count value
   reg [8:0] count;

		always @(posedge clk)
			begin
					count <=count +1;
					if (count == 8) begin //the clok of the michrophone is 12.5mhz
						count <= 0;
						clkout <= !clkout;
						
					end;
			end;
		 Misoout <= #Tp Misoin[7];

		assign ssout = ssin;

endmodule
