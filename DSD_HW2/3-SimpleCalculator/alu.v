//Behavior �Vlevel (event-driven) 
module alu(
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
    reg [7:0] alu_result;
    reg alu_carry;
    assign out=alu_result;
    assign carry=alu_carry;
    always @(x or y or ctrl) begin
    case (ctrl)
      4'b0000:
      {alu_carry,alu_result}=x+y;
      4'b0001:
      {alu_carry,alu_result}=x-y;
      4'b0010:
      alu_result=x&y;
      4'b0011:
      alu_result=x|y;
      4'b0100:
      alu_result=~x;
      4'b0101:
      alu_result=x^y;
      4'b0110:
      alu_result=~(x|y);
      4'b0111:
      alu_result=y<<x[2:0];
      4'b1000:
      alu_result=y>>x[2:0];
      4'b1001:
      alu_result={x[7],x[7:1]};
      4'b1010:
      alu_result={x[6:0],x[7]};
      4'b1011:
      alu_result={x[0],x[7:1]};
      4'b1100:
      alu_result= (x==y)?1:0;
      default: alu_result=0; 
    endcase
      
    end

endmodule
