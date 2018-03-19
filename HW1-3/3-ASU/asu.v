module asu (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;

/*Write your code here*/
adder a(x,y,carry,out);
barrel_shifter b(x,y[2:0],out);
assign {carry,out[7:0]}=mode?a:{0,b};


/*End of code*/


endmodule