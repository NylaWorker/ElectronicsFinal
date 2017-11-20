`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:34 11/08/2017 
// Design Name: 
// Module Name:    new 
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
module new(R1in,Ain,clkin, latin, R1,A,clk,lat,Sin,S);
	 (*LOC = "A8" *) input latin;
	 (*LOC = "B8" *) input R1in;
	 (*LOC = "C9" *) input clkin;
	 (*LOC = "C4" *) input Ain;
	 (*LOC = "D9" *) input Sin;
	 (*LOC = "P11" *) output S;
	 (*LOC = "N10" *) output lat;
	 (*LOC = "T12" *) output A;
	 (*LOC = "V12" *) output clk;
	 (*LOC = "M10" *) output R1;
 	  assign A = Ain;
     assign lat =latin;
	  assign clk= clkin;
	  assign R1 = R1in;
	  assign S = Sin;

endmodule
