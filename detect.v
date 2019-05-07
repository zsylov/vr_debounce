//`timescale 1ns/1ps
module detect(
							input Sys_clk,	//12MHz
							input Sys_reset,
							input Pin_in,
							output H2L_Sig,
							output L2H_Sig
						);
	parameter T100us = 11'd1208;//delay100us
	reg H2L_Sig_r0;
	reg H2L_Sig_r1;
	reg L2H_Sig_r0;
	reg L2H_Sig_r1;
	//*****************************************************
	reg [10:0] cnt1;
	reg isEn;
	always @(posedge Sys_clk or negedge Sys_reset)
		if(!Sys_reset)
			begin
				isEn <= 1'b0;
				cnt1 <= 11'd0;
			end
		else if(cnt1 == T100us)
			
				isEn <= 1'b1;
			
		else
			cnt1 <= cnt1 + 1'b1;
			
//********************

always @ (posedge Sys_clk or negedge Sys_reset)
	if(!Sys_reset)
		begin
			{H2L_Sig_r0,H2L_Sig_r1} <= 2'b11;
			{L2H_Sig_r0,L2H_Sig_r1} <= 2'b00;
		end 
	else 
		begin
			{H2L_Sig_r0,H2L_Sig_r1} <= {Pin_in,H2L_Sig_r0};
			{L2H_Sig_r0,L2H_Sig_r1} <= {Pin_in,L2H_Sig_r0};
		end

//********************************************************8
assign H2L_Sig =isEn ?( !H2L_Sig_r0 & H2L_Sig_r1) : 1'b0;
assign L2H_Sig =isEn ?( L2H_Sig_r0 & !L2H_Sig_r1) : 1'b0;


endmodule
