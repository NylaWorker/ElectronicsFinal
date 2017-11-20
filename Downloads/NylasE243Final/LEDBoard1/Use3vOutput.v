`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:43 11/04/2017 
// Design Name: 
// Module Name:    Use3vOutput 
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
module Use3vOutput(R1in,Ain,clkin, latin, R1,A,clk,lat);
	 (*LOC = "A8" *) input latin;
	 (*LOC = "B8" *) input R1in;
	 (*LOC = "V10" *) input clkin;
	 (*LOC = "C4" *) input Ain;
	 (*LOC = "N10" *) output lat;
	 (*LOC = "T12" *) output A;
	 (*LOC = "V12" *) output clk;
	 (*LOC = "M10" *) output R1;
 	  assign A = Ain;
     assign lat =latin;
	  assign clk= clk;
	  assign R1 = R1in;

endmodule
