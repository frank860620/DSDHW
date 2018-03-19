module barrel_shifter(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

/*Write your code here*/
wire [7:0] x1;
wire [7:0] x2;
reg zero=0;

assign x1[7:0]=shift[0]?{in[6:0],zero}:in[7:0];
assign x2[7:0]=shift[1]?{x1[5:0],zero,zero}:x1[7:0];
assign out[7:0]=shift[2]?{x2[3:0],zero,zero,zero,zero}:x2[7:0];




/*End of code*/
endmodule