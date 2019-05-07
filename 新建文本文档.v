// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "05/25/2014 16:48:22"
                                                                                
// Verilog Test Bench template for design : vir_key_top
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 ps/ 1 ps
module vir_key_top_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg Pin_In;
reg clk;
reg rst_n;
// wires                                               
wire Pin_Out;

// assign statements (if any)                          
vir_key_top i1 (
// port map - connection between master ports and signals/registers   
	.Pin_In(Pin_In),
	.Pin_Out(Pin_Out),
	.clk(clk),
	.rst_n(rst_n)
);
initial                                                
	begin                                                  
	    rst_n = 0; #1000; rst_n = 1;
       clk = 0; forever #25 clk = ~clk;		 
	end   

   /**************************/
   
   parameter T1MS = 15'd20000;
	
   /**************************/	
   
	reg [14:0]Count1;
	reg [9:0]Count_MS;
   reg [9:0]rTimes;	
	reg isCount;
	
	always @ ( posedge clk or negedge rst_n )
       if( !rst_n ) 
		     begin
		         Count1 <= 15'd0;
					Count_MS <= 10'd0;
			  end
		 else if( isCount && Count_MS == rTimes )
		     begin
			      Count1 <= 15'd0;
			      Count_MS <= 10'd0;
			  end
		 else if( isCount && Count1 == T1MS )
		     begin
			      Count1 <= 15'd0;
					Count_MS <= Count_MS + 1'b1; 
			  end
	    else if( isCount )
		     begin
			      Count1 <= Count1 + 1'b1;
			  end
		 else if( !isCount )
		     begin
			      Count1 <= 15'd0;
			      Count_MS <= 10'd0;
			  end
			  
    /**************************/	
	 
	 reg [3:0]i;
	 
	 always @ ( posedge clk or negedge rst_n )
	     if( !rst_n )
		      begin
					 Pin_In <= 1'b1;
					 isCount <= 1'b0;
					 rTimes <= 10'd0;
					 i <= 4'd0;
				end
		  else 
		      case( i )
				
				    0:
					 if( isCount && Count_MS == rTimes ) begin isCount <= 1'b0; i <= i + 1'b1; end
					 else begin isCount <= 1'b1; rTimes <= 10'd1; end
				
				    1:
					 begin Pin_In <= 1'b0; i <= i + 1'b1; end
					 
					 2:
					 if( isCount && Count_MS == rTimes ) begin isCount <= 1'b0; i <= i + 1'b1; end
					 else begin isCount <= 1'b1; rTimes <= 10'd12; end
					 
					 3:
					 begin Pin_In <= 1'b1; i <= 4'd3; end
				
				endcase
endmodule

