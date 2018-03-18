module 1_bit_adder(co1,x1,y1,ci1,sum1);
input x1,y1,ci1;
output co1,sum1;
wire w1,w2,w3;
xor xor1( w1, x1, y1 );
and and1( w2, w1, ci1 );
and and2( w3, x1, y1 );
xor xor2( sum1, w1, ci1 );
or  or1( co1, w2, w3 );

endmodule