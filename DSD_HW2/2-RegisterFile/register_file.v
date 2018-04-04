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
input  reg [7:0] busW;
output reg [7:0] busX, busY;
    
// write your design here
reg [7:0] r0_w, r1_w, r2_w, r3_w, r4_w, r5_w, r6_w, r7_w;
reg [7:0] r0_r, r1_r, r2_r, r3_r, r4_r, r5_r, r6_r, r7_r;
r0_w=0;
r0_r=0;    
always @(*) begin
    case (RX)
	0: busX = r0_r;
	1: busX = r1_r;
	2: busX = r2_r;
	3: busX = r3_r;
    4: busX = r4_r;
    5: busX = r5_r;
    6: busX = r6_r;
    7: busX = r7_r;
	default: busX = 16'hXXXX;
    endcase
   end

always @(*) begin
    case (RY)
	0: busY = r0_r;
	1: busY = r1_r;
	2: busY = r2_r;
	3: busY = r3_r;
    4: busY = r4_r;
    5: busY = r5_r;
    6: busY = r6_r;
    7: busY = r7_r;
	default: busY = 16'hXXXX;
    endcase
   end

always @(posedge clk) begin
    if (WEN) 
	case (RW) 
	  0: r0_w <= busW;
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
