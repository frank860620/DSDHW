//RTL (use continuous assignment)
module alu_rtl(
    ctrl,
    x,
    y,
    carry,
    out  
);
    
    input  [3:0] ctrl;
    input  [7:0] x;
    input  [7:0] y;
    output       carry;
    output [7:0] out;
    wire [7:0] out_0,out_1,out_2,out_3,out_4,out_5;
    wire [7:0] out_6,out_7,out_8,out_9,out_10,out_11;
    wire carry_0,carry_1;
    wire zero=0;
    wire[7:0] alu_result;
    assign {carry_0,out_0}=x+y;
    assign {carry_1,out_1}=x-y;
    assign out_2=x&y;
    assign out_3=x|y;
    assign out_4=~x;
    assign out_5=x^y;
    assign out_6=~(x|y);
    assign out_7=y << x[2:0];
    assign out_8=y >> x[2:0];
    assign out_9={x[7],x[7:1]};
    assign out_10={x[0],x[7:1]};
    assign out_11=(x==y)?1:0;
    assign alu_result=(ctrl==4'b0000)?out_0:
                      (ctrl==4'b0001)?out_1:
                      (ctrl==4'b0010)?out_2:
                      (ctrl==4'b0011)?out_3:
                      (ctrl==4'b0100)?out_4:
                      (ctrl==4'b0101)?out_5:
                      (ctrl==4'b0110)?out_6:
                      (ctrl==4'b0111)?out_7:
                      (ctrl==4'b1000)?out_8:
                      (ctrl==4'b1001)?out_9:
                      (ctrl==4'b1010)?out_10:
                      (ctrl==4'b1011)?out_11:zero;
    assign carry=(ctrl==4'b0000)?carry_0:
                 (ctrl==4'b0001)?carry_1:zero;
    assign out[7:0]=alu_result[7:0];



         

endmodule
