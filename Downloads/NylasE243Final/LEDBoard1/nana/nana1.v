`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:13 11/04/2017 
// Design Name: 
// Module Name:    nana1 
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
module nana1(R1in,Ain,clkin, latin, R1,A,clk,lat);
	 (*LOC = "A8" *) input latin;
	 (*LOC = "B8" *) input R1in;
	 (*LOC = "V10" *) input clkin;
	 (*LOC = "C4" *) input Ain;
	 (*LOC = "JA<3>" *) output lat;
	 (*LOC = "JA<1>" *) output A;
	 (*LOC = "JA<2>" *) output clk;
	 (*LOC = "JA<7>" *) output R1;
 	  assign A = Ain;
     assign lat =latin;
	  assign clk= clk;
	  assign R1 = R1in;

endmodule
