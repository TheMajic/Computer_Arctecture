//module  of clock_divider
module clock_divider(clk, reset, CLK1Hz);

input clk, reset;

output CLK1Hz;

reg CLK1Hz;
reg [24:0] count;

always @(posedge clk or posedge reset)
	begin
		if(reset) // reset the counter circuit to initial (zero)
			begin
				count <= 0;
				CLK1Hz <= 0;
			end				 
		else					 
			begin				 
				if(count < 10_000_000)	
					count <= count + 1; // count 10 million 
				else 
					begin
						CLK1Hz = ~CLK1Hz; // toggle the clk high\low
						count <= 0;
					end		
			end
	end							 

endmodule							 

//module  of BBQM_counter
module BBQM_counter(reset,clk,input1, input2, count);
input clk,reset;		  // reset button 
input input1, input2; 	 // up and down button 
output reg [3:0] count = 0; 	// counting register 

always @(posedge reset or posedge clk)			 
	if (reset)		
	begin		
		count <=0;			 
	end				
	else if(input2)				 
	begin			 
		if(count != 0)			 
			count <= count -1;		 
	end				
	else if (input1)				 
	begin					
		if (count !=7)			
			count <= count +1;		 
	end				

endmodule    

//module  of decoder_7seg
module decoder_7seg (A, B, C, D, led_a, led_b, led_c, led_d, led_e, led_f, led_g);
input A, B, C, D;
output led_a, led_b, led_c, led_d, led_e, led_f, led_g;
assign led_a = ~(A | C | B&D | ~B&~D);
assign led_b = ~(~B | ~C&~D | C&D);
assign led_c = ~(B | ~C | D);
assign led_d = ~(~B&~D | C&~D | B&~C&D | ~B&C |A);
assign led_e = ~(~B&~D | C&~D);
assign led_f = ~(A | ~C&~D | B&~C | B&~D);
assign led_g = ~(A | B&~C | ~B&C | C&~D);
endmodule 

module Wtime_bbqm(pcount,tcount,wtime1, wtime2);
  input [3:0] pcount;
  input [1:0] tcount;
  output reg [3:0] wtime1;
  output reg [3:0] wtime2;
  always @(*)
  begin
    case(pcount)
      4'b0001 :
      begin
        if(tcount==2'b01)
	begin
          wtime1 <=4'b0011;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b10)
	begin
          wtime1 <=4'b0011;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b0110;
          wtime2 <=4'b0000;
	end
      end
      4'b0010 :
      begin
        if(tcount==2'b01)
	begin
          wtime1 <=4'b0110;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b10)
	begin
          wtime1 <=4'b0110;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b0010;
          wtime2 <=4'b0001;
	end
      end
      4'b0011 :
      begin
        if(tcount==2'b01)
	begin
          wtime1 <=4'b1001;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b10)
	begin
          wtime1 <=4'b1001;
          wtime2 <=4'b0000;
	end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b1000;
          wtime2 <=4'b0001;
	end
      end
      4'b0100 :
      begin
        if(tcount==2'b01)
        begin
          wtime1 <=4'b0010;
          wtime2 <=4'b0001;
        end
        else if(tcount==2'b10)
	begin
          wtime1 <=4'b0010;
          wtime2 <=4'b0001;
	end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b00100;
          wtime2 <=4'b0010;
	end
      end
      4'b0101 :
      begin
        if(tcount==2'b01)
        begin
          wtime1 <=4'b0101;
          wtime2 <=4'b0001;
        end
        else if(tcount==2'b10)
	begin
          wtime1 <=4'b0101;
          wtime2 <=4'b0001;
	end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b0000;
          wtime2 <=4'b0011;
	end
      end
      4'b0110 :
      begin
        if(tcount==2'b01)
        begin
          wtime1 <=4'b1000;
          wtime2 <=4'b0001;
        end
        else if(tcount==2'b10)
        begin
          wtime1 <=4'b1000;
          wtime2 <=4'b0001;
        end
        else if(tcount==2'b11)
	begin	
          wtime1 <=4'b0110;
          wtime2 <=4'b0011;
	end
      end
      4'b0111 :
      begin
        if(tcount==2'b01)
        begin
          wtime1 <=4'b0001;
          wtime2 <=4'b0010;
        end
        else if(tcount==2'b10)
        begin
          wtime1 <=4'b0001;
          wtime2 <=4'b0010;
        end
        else if(tcount==2'b11)
	begin
          wtime1 <=4'b0010;
          wtime2 <=4'b0100;
	end
      end
      default: begin
        wtime1=4'b0000; 
        wtime2=4'b0000;
      end
    endcase
  end
endmodule // Ahmed tito
 
//module of D_flip_flop			
module D_flip_flop(D,clk,Q);
input D;
	input clk;  
	output reg Q; 
	always @(posedge clk) 
		begin
		 Q <= ~D; 
		end 
endmodule 
//top level module Bbqm_pro
module Bbqm_pro(clk,input1, input2, reset, tcount, empty, full, leds_pcount, leds_wtime1, leds_wtime2);
	input clk,input1, input2, reset;	 
	output [6:0] leds_pcount;		
	output [6:0] leds_wtime1;	
	output [6:0] leds_wtime2;           		
	output empty, full; 			
	reg empty, full; 			
	wire [3:0] pcount;		
	input [1:0] tcount;			
	wire [3:0] wtime1;			
 	 wire [3:0] wtime2;			
  	wire CLK1Hz;		
  	wire Q1,Q2;		
	
	clock_divider cl(clk, reset, CLK1Hz);	
	
	D_flip_flop inpt1(input1,CLK1Hz,Q1);	
	D_flip_flop inpt2(input2,CLK1Hz,Q2);	
	
	BBQM_counter count(reset, CLK1Hz,Q1, Q2, pcount);	
	
	always @(pcount) // always statement for checking empty and full queue 
	begin
		if (pcount ==0)		//if is empty
			empty = 1;	
		else			
			empty = 0;
		if (pcount == 7)		//if is full
			full=1;		
			
		else			
			full =0;	
		
	end 				
	Wtime_bbqm rom(pcount, tcount, wtime1, wtime2);
					// displaying information on the 7 segment display
  decoder_7seg pcount_7seg (pcount[3], pcount[2], pcount[1], pcount[0], leds_pcount[6], leds_pcount[5], leds_pcount[4], leds_pcount[3], leds_pcount[2], leds_pcount[1], leds_pcount[0]);
					// displaying information on the 7 segment display
  decoder_7seg wtime1_7seg (wtime1[3], wtime1[2], wtime1[1], wtime1[0], leds_wtime1[6], leds_wtime1[5], leds_wtime1[4], leds_wtime1[3], leds_wtime1[2], leds_wtime1[1], leds_wtime1[0]);
					// displaying information on the 7 segment display
  decoder_7seg wtime2_7seg (wtime2[3], wtime2[2], wtime2[1], wtime2[0], leds_wtime2[6], leds_wtime2[5], leds_wtime2[4], leds_wtime2[3], leds_wtime2[2], leds_wtime2[1], leds_wtime2[0]);

endmodule 