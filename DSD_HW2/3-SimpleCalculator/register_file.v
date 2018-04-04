module register_file(
    Clk  ,
    WEN  ,
    RW   ,
    busW ,
    RX   ,
    RY   ,
    busX ,
    busY
);
input        Clk, WEN;
input  [2:0] RW, RX, RY;
input  [7:0] busW;
output reg [7:0] busX, busY;
    
// write your design here
reg [7:0] r0_w, r1_w, r2_w, r3_w, r4_w, r5_w, r6_w, r7_w;
reg [7:0] r0_r, r1_r, r2_r, r3_r, r4_r, r5_r, r6_r, r7_r;
initial begin
    r0_w=0;
end
   
always @(*) begin
    case (RX)
	0: busX = r0_w;
	1: busX = r1_w;
	2: busX = r2_w;
	3: busX = r3_w;
    4: busX = r4_w;
    5: busX = r5_w;
    6: busX = r6_w;
    7: busX = r7_w;
	default: busX = 16'hXXXX;
    endcase
   end

always @(*) begin
    case (RY)
	0: busY = r0_w;
	1: busY = r1_w;
	2: busY = r2_w;
	3: busY = r3_w;
    4: busY = r4_w;
    5: busY = r5_w;
    6: busY = r6_w;
    7: busY = r7_w;
	default: busY = 16'hXXXX;
    endcase
   end

always @(posedge Clk) begin
    if (WEN) 
	case (RW) 
	  //0: r0_w <= 0;
	  1: r1_w <= busW;
	  2: r2_w <= busW;
	  3: r3_w <= busW;
      4: r4_w <= busW;
      5: r5_w <= busW;
      6: r6_w <= busW;
      7: r7_w <= busW;
	endcase 
   end 

endmodule
