module asu (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;

/*Write your code here*/
wire [7:0] output_a;
wire [7:0] output_b;
adder a(x,y,carry,output_a);
barrel_shifter b(x,y[2:0],output_b);

assign out[7:0]=mode?output_a:output_b;


/*End of code*/


endmodule