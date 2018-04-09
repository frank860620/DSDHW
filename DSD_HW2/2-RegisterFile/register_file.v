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
output [7:0] busX, busY;
    
// write your design here
//reg [7:0] r0_w, r1_w, r2_w, r3_w, r4_w, r5_w, r6_w, r7_w;
//reg [7:0] r0_r, r1_r, r2_r, r3_r, r4_r, r5_r, r6_r, r7_r;
reg [7:0] r_w [0:7];
reg [7:0] busY_reg, busX_reg;



    

always@(*) begin
    case (RX)
        0: busX_reg = 0;
        1: busX_reg = r_w[1];
        2: busX_reg = r_w[2];
        3: busX_reg = r_w[3];
        4: busX_reg = r_w[4];
        5: busX_reg = r_w[5];
        6: busX_reg = r_w[6];
        7: busX_reg = r_w[7];
    default: busX_reg = 16'hXXXX;
    endcase
   case (RY)
        0: busY_reg = 0;
        1: busY_reg = r_w[1];
        2: busY_reg = r_w[2];
        3: busY_reg = r_w[3];
        4: busY_reg = r_w[4];
        5: busY_reg = r_w[5];
        6: busY_reg = r_w[6];
        7: busY_reg = r_w[7];
    default: busY_reg = 16'hXXXX;
    endcase
end

always@(posedge Clk) begin
    if (WEN) 
        case (RW) 
            1: r_w[1] <= busW;
            2: r_w[2] <= busW;
            3: r_w[3] <= busW;
            4: r_w[4] <= busW;
            5: r_w[5] <= busW;
            6: r_w[6] <= busW;
            7: r_w[7] <= busW;
        endcase
end	
assign busX= busX_reg;
assign busY= busY_reg;

endmodule
