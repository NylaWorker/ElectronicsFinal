  `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:35 11/19/2017 
// Design Name: 
// Module Name:    ledFunc 
// Project Name:// Target Devices: 
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
module ledFunc(R1in,R2in,B1in,B2in,G1in,G2in,Latin,Clkin,Ain,Bin,Cin,R1,R2,B1,B2,G1,G2,Lat,Clk,A,B,C );
	 (*LOC = "A8" *) input Latin;
	 
	 (*LOC = "C4" *) input Ain;
	 (*LOC = "D9" *) input Cin;
	 (*LOC = "B8" *) input Bin;
	 //clock declaration
	 (* CLOCK_DEDICATED_ROUTE = "FALSE", LOC = "V10" *) input  Clkin;		// 100MHz onboard clock
   (* LOC = "L7" *)output reg Clk;	// New clock output
	 
	 
	 (*LOC = "T10" *) input R1in;
	 (*LOC = "T9" *) input R2in;
	 (*LOC = "N8" *) input G1in;
	 (*LOC = "U8" *) input G2in;
	 (*LOC = "V9" *) input B1in;
	 (*LOC = "M8" *) input B2in;
	 
	// (*LOC = "V10" *) input Sin;
	// (*LOC = "K6" *) output S;
	 
	 (*LOC = "P11" *) output reg B2;
	 (*LOC = "N10" *) output reg B1;
	 
	 (*LOC = "T12" *) output reg R1;
	 (*LOC = "V12" *) output reg R2;
	 
	 (*LOC = "K2" *) output G1;
	 (*LOC = "K1" *) output  G2;
	 
	 (*LOC = "H3" *) output reg Lat;
	
	 
	 (*LOC = "G11" *) output reg A;
	 (*LOC = "F10" *) output reg B;
	 (*LOC = "F11" *) output reg C;
	  
	  
	  
 	  //assign A = Ain;
	  //assign B = Bin;
	  //assign C = Cin;
	  
	  
     //assign Lat =Latin;
	  
	  //assign R1 = R1in;
	  //assign R2 = R2in;
	  //assign B2 = B2in;
	  //assign B1 = B1in;
	  assign G1 = G1in;
	  assign G2 = G2in;	
	  reg[15:0]a;
		reg [15:0] b;	

	// assign S = Sin;
//This is the clock section.
	
	//(*LOC = "C9" *) input Clkin;
	 //(*LOC = "L7" *) output Clk;
	
	

   // Current count value
   reg [25:0] count;
	reg [35:0] ranA;
	reg [35:0] ranB;
	reg [35:0] ranC;
	



		always @(posedge Clkin)
			begin
					count <=count +1;
					if (count == 5) begin
						count <= 0;
						Clk <= !Clk;
						
												
						//A <= !A;
						//B <= !B;
						//C <= !C;
						Lat <= !Lat;
						
					end;
					ranA <= ranA +1;
					ranB <= ranB +1;
					
					if(ranB == 100) begin
						//G1 <=!G1;
						//R1 <=!R1;
						B1 <= !B2;
					end; 
					if(ranB ==19999) begin
						R2 <= !R2;
						R1 <= !R1;
						ranB <= 0;
					end;
					if(ranB ==199) begin
						B2 <= !B2;
						//G2	<= !G2;
						//R2 <= !R2;
					end;
					
					
					if(ranA == 1000) begin
						A <= !A ;
						B <= !B;
						C <= !C;
						

					end;
					if(ranA == 2000) begin
						A <= !A ;// A changes from 0 to 1 
						//B <= B;
						//C<= C;

					end;
					if(ranA == 3000) begin
						A <= !A ; // A changes from 1 to 0
						B <= !B;  // B changes from 0 to 1
						//C<= C;
						
					end;
					if(ranA == 4000) begin
						A <= !A ;// A 0->1
						//B <= B; // B remains 1 and c remains 0 
						//C<= C;

					end;
					if(ranA == 5000) begin
						A <= !A ; // A and B go to zero
						B <= !B;
						C<= !C;//C turns to 1 
	
					end;
					if(ranA == 6000) begin
						A <= !A ; // A turns to 1 
						//B <= !B;
						//C<= C;
	
					end;
					
					if(ranA == 7000) begin
						//A <= !A ; // A and C remain 1 and B turns to 1
						B <= !B;
						//C<= C;
	
					end;
					
					if(ranA == 8000) begin
						A <= !A ;
						//B <= B;
						//C<= C;
						ranA <= 0;
					end;
					
					
														
			end;

	

endmodule

