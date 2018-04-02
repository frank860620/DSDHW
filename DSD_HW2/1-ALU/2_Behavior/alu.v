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
    always @(x or y or ctrl) begin
    case (ctrl)
      4'b0000:
      4'b0001:
      4'b0010:
      4'b0011:
      4'b0100:
      4'b0101:
      4'b0110:
      4'b0111:
      4'b1000:
      4'b1001:
      4'b1010:
      4'b1011:
      default: 
    endcase
      
    end

endmodule
