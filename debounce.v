module debouce(	
						input Sys_clk,
						input Sys_reset,
						input Pin_in,
						output Pin_out
					);
wire H2L_Sig;
wire L2H_Sig;

detect	detect_inst(
							.Sys_clk(Sys_clk),	//12MHz
							.Sys_reset(Sys_reset),
							.Pin_in(Pin_in),
							.H2L_Sig(H2L_Sig),
							.L2H_Sig(L2H_Sig)
						);
						
delay		delay_inst(
						.Sys_clk(Sys_clk),//12Mhz
						.H2L_sig(H2L_Sig),
						.L2H_sig(L2H_Sig),
						.Sys_reset(Sys_reset),
						.Pin_out(Pin_out)
					);
					
endmodule
