module vir_key_module (
							input sclk,
							input rst_n,
							input In_Sig,
							output Q_Sig
						);
	reg F1;
	reg F2;
	
	always @ ( posedge sclk or negedge rst_n )
		if(!rst_n)
			begin
				{F1,F2} <= 2'b11;
			end
		else
			{F1,F2} <= {In_Sig,F1};
//************************************************
	parameter T8ms = 18'd160000;
	reg [17:0] Count_8ms;
	
	reg isCount;
	
	always @ ( posedge sclk or negedge rst_n )
		if(!rst_n)
			begin
				Count_8ms <= 18'd0;
			end
		else if( Count_8ms == T8ms && isCount )
			Count_8ms <= 18'd0;
		else if(isCount)
			Count_8ms <= Count_8ms +1'b1;
		else if( !isCount )
			Count_8ms <= 18'd0;
//****************************************************
reg [3:0] i;
reg isBounce;
always @ ( posedge sclk or negedge rst_n )
	if(!rst_n)
		begin
			i <= 4'd0;
			isBounce <= 1'b1;
			isCount <= 1'b0;
		end
	else 
		case(i)
			0:
				if( F1!= F2 )
					i <= i +1'b1;
			1,2,3:
				if(Count_8ms == T8ms )
					begin
						isCount <= 1'b0;
						isBounce <= 1'b0;
						i <= 4'd8;
					end
				else
					begin
						isCount <= 1'b1;
						isBounce <= 1'b0;
						i <= i + 1'b1 ;
					end
			4,5,6:
				if(Count_8ms == T8ms )
					begin
						isCount <= 1'b0;
						isBounce <= 1'b0;
						i <= 4'd8;
					end
				else
					begin
						isCount <= 1'b1;
						isBounce <= 1'b1;
						i <= i + 1'b1 ;
					end	
			7:
				if(Count_8ms == T8ms )
						begin
							i <= i +1'b1;
							isCount <= 1'b0;
							isBounce <= 1'b0;
						end
				else i <=4'b1;
			8:
				if( F1!= F2 )
					i <= i +1'b1;
			9,10,11:
				if(Count_8ms == T8ms )
					begin
						isCount <= 1'b0;
						isBounce <= 1'b1;
						i <= 4'd0;
					end
				else
					begin
						isCount <= 1'b1;
						isBounce <= 1'b1;
						i <= i + 1'b1 ;
					end	
			12,13,14:
				if(Count_8ms == T8ms )
					begin
						isCount <= 1'b0;
						isBounce <= 1'b1;
						i <= 4'd0;
					end
				else
					begin
						isCount <= 1'b1;
						isBounce <= 1'b0;
						i <= i + 1'b1 ;
					end	
			15:
				if(Count_8ms == T8ms )
					begin
						isCount <= 1'b0;
						isBounce <= 1'b0;
						i <= 4'd0;
					end
				else
					i <= 4'd9;
		endcase
	//****************************************	
	assign Q_Sig = isBounce;
	//*****************************
	endmodule
	
	