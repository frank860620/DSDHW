module pfa(a,b,p,g);  //A one PFA. I need 16 of them5
    //wire w;
    //reg a,b,c;
    //wire sum,p,g;
    input #1 a,b;
    output #1 p,g;

    //xor (w,a,b);     //repeated P. May need it may not. 
    and #1 (g,a,b);  //Gi
    xor #1 (p,a,b);   //Pi
    //xor (sum,w,c);  //sum 
endmodule
                //input    output   
module half_adder_gate(A,B,Cin,carry,out);
    input [3:0] A,B;
    input Cin;
    output [3:0] out;
    output carry;    
    wire [3:0] P,G;
    //wire p0,g0;
    //wire b1,b2,b3;
    wire w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18;
    wire w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38;
    wire c1,c2,c3,c4,c5,c6,c7;

        pfa PFA0(A[0],B[0],P[0],G[0]);
        and #1 (w3,P[0],Cin);
        or #1 (c1,G[0],w3);
        pfa PFA1(A[1],B[1],P[1],G[1]);
        and #1 (w4,P[1],G[0]);
        and #1 (w5,P[1],P[0],Cin);
        or #1 (c2,G[1],w4,w5); 
        pfa PFA2(A[2],B[2],P[2],G[2]);
        and #1 (w6,P[2],G[1]);
        and #1 (w7,P[2],P[1],G[0]);
        and #1 (w8,P[2],P[1],P[0],Cin);
        or #1 (c3,G[2],w6,w7,w8);
        pfa PFA3(A[3],B[3],P[3],G[3]);
        and #1 (w9,P[3],G[2]);
        and #1 (w10,P[3],P[2],G[1]);
        and #1 (w11,P[3],P[2],P[1],G[0]);
        and #1 (w12,P[3],P[2],P[1],P[0],Cin);
        or #1 (carry,G[3],w9,w10,w11,w12);
        
  

        xor #1 (out[0],P[0],Cin);
        xor #1 (out[1],P[1],c1);
        xor #1 (out[2],P[2],c2);
        xor #1 (out[3],P[3],c3);
     




        //propagate
        //and (p0,P[3],P[2],P[1],P[0]);

        //GENERATE
        //and (w,P[3],G[2]);
        //and (w1,P[3],P[2],G[1]);
        //and (w2,P[3],P[2],P[1],G[0]);
        //or (w,w1,w2);
//CLA 


       
     
        
       
endmodule   

module adder_gate(x,y,carry,out);
input [7:0] x, y;
output carry;
output [7:0] out;
wire c4;
reg Cin=0;
half_adder_gate h1(x[3:0],y[3:0],Cin,c4,out[3:0]);
half_adder_gate h2(x[7:4],y[7:4],c4,carry,out[7:4]);

endmodule