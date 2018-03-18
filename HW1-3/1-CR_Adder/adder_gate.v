module adder_gate(x, y, carry, out);
input [7:0] x, y;
output carry;
output [7:0] out;

/*Write your code here*/
reg Cin=0;
wire c1,c2,c3,c4,c5,c6,c7;
1bit_adder A1(Sum[0],c1,A[0],B[0],Cin),
    A2(Sum[1],c2,A[1],B[1],c1),
    A3(Sum[2],c3,A[2],B[2],c2),
    A4(Sum[3],Cout,A[3],B[3],c3),
    A5(Sum[4],Cout,A[4],B[4],c4),
    A6(Sum[5],Cout,A[5],B[5],c5),
    A7(Sum[6],Cout,A[6],B[6],c6),
    A8(Sum[7],Cout,A[7],B[7],c7);


/*End of code*/

endmodule

module 1bit_adder(co1,x1,y1,ci1,sum1);
input x1,y1,ci1;
output co1,sum1;
wire w1,w2,w3;
xor xor1( w1, x1, y1 );
and and1( w2, w1, ci1 );
and and2( w3, x1, y1 );
xor xor2( sum1, w1, ci1 );
or  or1( co1, w2, w3 );

endmodule


