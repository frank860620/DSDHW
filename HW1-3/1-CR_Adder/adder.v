module adder(x, y, carry, out);
input [7:0] x, y;
output carry;
output [7:0] out;

/*Write your code here*/
assign {carry, out[3:0]}=x[3:0]+y[3:0];

/*End of code*/

endmodule