module barrel_shifter(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

/*Write your code here*/
wire [7:0] x1;
wire [7:0] x2;

assign x1[7:1]=(shift[0]==1)?in[6:0]:in[7:1];
assign x1[0]=(shift[0]==1)?0:in[0];

assign x2[7:2]=(shift[1]==1)?in[5:0]:x1[7:2];
assign x2[1:0]=(shift[1]==1)?0:x1[1:0];

assign out[7:4]=(shift[2]==1)?in[3:0]:x2[7:4];
assign out[3:0]=(shift[2]==1)?0:x2[3:0];



/*End of code*/
endmodule