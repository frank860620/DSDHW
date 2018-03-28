module adder_gate(x, y, carry, out);
    input [7:0] x, y;
    output carry;
    output [7:0] out;

    /*Write your code here*/
    reg Cin=0;
    wire c1,c2,c3,c4,c5,c6,c7;
    full_adder A1(out[0],x[0],y[0],Cin,c1);
    full_adder A2(out[1],x[1],y[1],c1,c2);
    full_adder A3(out[2],x[2],y[2],c2,c3);
    full_adder A4(out[3],x[3],y[3],c3,c4);
    full_adder A5(out[4],x[4],y[4],c4,c5);
    full_adder A6(out[5],x[5],y[5],c5,c6);
    full_adder A7(out[6],x[6],y[6],c6,c7);
    full_adder A8(out[7],x[7],y[7],c7,carry);


    /*End of code*/
endmodule

module full_adder(sum1,x1,y1,ci1,co1);
    input x1,y1,ci1;
    output co1,sum1;
    wire w1,w2,w3;
    xor #1 xor1( w1, x1, y1 );
    and #1 and1( w2, w1, ci1 );
    and #1 and2( w3, x1, y1 );
    xor #1 xor2( sum1, w1, ci1 );
    or  #1 or1( co1, w2, w3 );

endmodule


