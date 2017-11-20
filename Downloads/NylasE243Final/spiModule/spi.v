`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:58 11/17/2017 
// Design Name: 
// Module Name:    spi 
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
module spi(rstb,clk,mlb,start,tdat,cdiv,din, ss,sck,dout,done,rdata);
   (*LOC = "C$"*)input  rstb;
	(* CLOCK_DEDICATED_ROUTE = "FALSE", LOC = "V10" *) input clk;
	input mlb;
	input start;
   (* LOC = "F12"*)input [7:0] tdat;  //transmit data
   input [1:0] cdiv;  //clock divider
	(* LOC = "F12"*) input din;
	output reg ss; 
	(* LOC = "E12" *)output reg sck; 
	output reg dout; 
   output reg done;
	(* LOC = "F12"*)output reg [7:0] rdata; //received data
 
   parameter idle=2'b00;		
   parameter send=2'b10; 
   parameter finish=2'b11; 
   reg [1:0] cur,nxt;
 
	reg [7:0] treg,rreg;
	reg [3:0] nbit;
	reg [4:0] mid,cnt;
	reg shift,clr;
	
	/*
  
	(* LOC = "F12"*) reg[7:0] input Misoin;
	
	
//	(* LOC = "G11" *) output Misout;
	
	
	(*LOC = "D12" *) output ssout;
	
	(*LOC = "C4" *) input ssin;
	(* LOC = "T11 R11 N11 M11 V15 U15 V16 U16" *) output [7:0] Misoout;
	
	
	//input reg [11:0] datain; I am not sure about this 
	parameter Tp= 1;

 */
//FSM i/o
always @(start or cur or nbit or cdiv or rreg) begin
		 nxt=cur;
		 clr=0;  
		 shift=0;//ss=0;
		 case(cur)
			idle:begin
				if(start==1)
		               begin 
							 case (cdiv)
								2'b00: mid=2;
								2'b01: mid=4;
								2'b10: mid=8;
								2'b11: mid=16;
 							 endcase
						shift=1;
						done=1'b0;
						nxt=send;	 
						end
		        end //idle
			send:begin
				ss=0;
				if(nbit!=8)
					begin shift=1; end
				else begin
						rdata=rreg;done=1'b1;
						nxt=finish;
					end
				end//send
			finish:begin
					shift=0;
					ss=1;
					clr=1;
					nxt=idle;
				 end
			default: nxt=finish;
      endcase
    end//always
 
//state transistion
always@(negedge clk or negedge rstb) begin
 if(rstb==0) 
   cur<=finish;
 else 
   cur<=nxt;
 end
 
//setup falling edge (shift dout) sample rising edge (read din)
always@(negedge clk or posedge clr) begin
  if(clr==1) 
		begin cnt=0; sck=1; end
  else begin
	if(shift==1) begin
		cnt=cnt+1; 
	  if(cnt==mid) begin
	  	sck=~sck;
		cnt=0;
		end //mid
	end //shift
 end //rst
end //always
 
//sample @ rising edge (read din)
always@(posedge sck or posedge clr ) begin // or negedge rstb
 if(clr==1)  begin
			nbit=0;  rreg=8'hFF;  end
    else begin 
		  if(mlb==0) //LSB first, din@msb -> right shift
			begin  rreg={din,rreg[7:1]};  end 
		  else  //MSB first, din@lsb -> left shift
			begin  rreg={rreg[6:0],din};  end
		  nbit=nbit+1;
 end //rst
end //always
 
always@(negedge sck or posedge clr) begin
 if(clr==1) begin
	  treg=8'hFF;  dout=1;  
  end  
 else begin
		if(nbit==0) begin //load data into TREG
			treg=tdat; dout=mlb?treg[7]:treg[0];
		end //nbit_if
		else begin
			if(mlb==0) //LSB first, shift right
				begin treg={1'b1,treg[7:1]}; dout=treg[0]; end
			else//MSB first shift LEFT
				begin treg={treg[6:0],1'b1}; dout=treg[7]; end
		end
 end //rst
end //always
 
 endmodule
