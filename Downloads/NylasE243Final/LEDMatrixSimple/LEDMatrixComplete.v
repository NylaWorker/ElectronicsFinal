`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:34 11/10/2017 
// Design Name: 
// Module Name:    LEDMatrixComplete 
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
module LEDMatrixComplete(R1in,R2in,B1in,B2in,G1in,G2in,Latin,Clkin,Ain,Bin,Cin,R1,R2,B1,B2,G1,G2,Lat,Clk,A,B,C , Sin,S);
	 (*LOC = "A8" *) input Latin;
	 (*LOC = "C9" *) input Clkin;
	 (*LOC = "C4" *) input Ain;
	 (*LOC = "D9" *) input Cin;
	 (*LOC = "B8" *) input Bin;
	 
	 
	 
	 
	 (*LOC = "T10" *) input R1in;
	 (*LOC = "T9" *) input R2in;
	 (*LOC = "N8" *) input G1in;
	 (*LOC = "U8" *) input G2in;
	 (*LOC = "V9" *) input B1in;
	 (*LOC = "M8" *) input B2in;
	 
	 (*LOC = "V10" *) input Sin;
	 (*LOC = "K6" *) output S;
	 
	 (*LOC = "P11" *) output B2;
	 (*LOC = "N10" *) output B1;
	 
	 (*LOC = "T12" *) output R1;
	 (*LOC = "V12" *) output R2;
	 
	 (*LOC = "K2" *) output G1;
	 (*LOC = "K1" *) output G2;
	 
	 (*LOC = "H3" *) output Lat;
	 (*LOC = "L7" *) output Clk;
	 
	 (*LOC = "G11" *) output A;
	 (*LOC = "F10" *) output B;
	 (*LOC = "F11" *) output C;
	  
	  
	  
 	  assign A = Ain;
	  assign B = Bin;
	  assign C = Cin;
	  
	  
     assign Lat =Latin;
	  assign Clk = Clkin;
	  
	  assign R1 = R1in;
	  assign R2 = R2in;
	  assign B2 = B2in;
	  assign B1 = B1in;
	  assign G1 = G1in;
	  assign G2 = G2in;	

	 assign S = Sin;

endmodule
