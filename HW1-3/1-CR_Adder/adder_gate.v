module adder_gate(x, y, carry, out);
    input [7:0] x, y;
    output carry;
    output [7:0] out;

    /*Write your code here*/
    reg Cin=0;
    wire c1,c2,c3,c4,c5,c6,c7;
    full_adder A1(out[0],c1,x[0],y[0],Cin);
    full_adder A2(out[1],c2,x[1],y[1],c1);
    full_adder A3(out[2],c3,x[2],y[2],c2);
    full_adder A4(out[3],c4,x[3],y[3],c3);
    full_adder A5(out[4],c5,x[4],y[4],c4);
    full_adder A6(out[5],c6,x[5],y[5],c5);
    full_adder A7(out[6],c7,x[6],y[6],c6);
    full_adder A8(out[7],carry,x[7],y[7],c7);


    /*End of code*/
endmodule

module full_adder(co1,x1,y1,ci1,sum1);
    input x1,y1,ci1;
    output co1,sum1;
    wire w1,w2,w3;
    xor xor1( w1, x1, y1 );
    and and1( w2, w1, ci1 );
    and and2( w3, x1, y1 );
    xor xor2( sum1, w1, ci1 );
    or  or1( co1, w2, w3 );

endmodule


