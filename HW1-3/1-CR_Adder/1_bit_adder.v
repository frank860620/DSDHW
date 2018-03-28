module pfa(a,b,p,g);  //A one PFA. I need 16 of them5
    //wire w;
    //reg a,b,c;
    //wire sum,p,g;
    input a,b;
    output p,g;

    //xor (w,a,b);     //repeated P. May need it may not. 
    and (g,a,b);  //Gi
    xor (p,a,b);   //Pi
    //xor (sum,w,c);  //sum 
endmodule
                //input    output   
module adder_gate(A,B,carry,out);
    input [7:0] A,B;
    reg Cin=0;
    output [7:0] out;
    output carry;    
    wire [7:0] P,G;
    //wire p0,g0;
    //wire b1,b2,b3;
    wire w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18;
    wire w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38;
    wire c1,c2,c3,c4,c5,c6,c7;

        pfa PFA0(A[0],B[0],P[0],G[0]);
        and (w3,P[0],Cin);
        or (c1,G[0],w3);
        pfa PFA1(A[1],B[1],P[1],G[1]);
        and (w4,P[1],G[0]);
        and (w5,P[1],P[0],Cin);
        or (c2,G[1],w4,w5); 
        pfa PFA2(A[2],B[2],P[2],G[2]);
        and (w6,P[2],G[1]);
        and (w7,P[2],P[1],G[0]);
        and (w8,P[2],P[1],P[0],Cin);
        or (c3,G[2],w6,w7,w8);
        pfa PFA3(A[3],B[3],P[3],G[3]);
        and (w9,P[3],G[2]);
        and (w10,P[3],P[2],G[1]);
        and (w11,P[3],P[2],P[1],G[0]);
        and (w12,P[3],P[2],P[1],P[0],Cin);
        or(c4,w9,w10,w11,w12);
        pfa PFA4(A[4],B[4],P[4],G[4]);
        and (w13,P[4],G[3]);
        and (w14,P[4],P[3],G[2]);
        and (w15,P[4],P[3],P[2],G[1]);
        and (w16,P[4],P[3],P[2],P[1],G[0]);
        and (w17,P[4],P[3],P[2],P[1],P[0],Cin);
        or(c5,w13,w14,w15,w16,w17);
        pfa PFA5(A[5],B[5],P[5],G[5]);
        and (w18,P[5],G[4]);
        and (w19,P[5],P[4],G[3]);
        and (w20,P[5],P[4],P[3],G[2]);
        and (w21,P[5],P[4],P[3],P[2],G[1]);
        and (w22,P[5],P[4],P[3],P[2],P[1],G[0]);
        and (w23,P[5],P[4],P[3],P[2],P[1],P[0],Cin);
        or(c6,w18,w19,w20,w21,w22,w23);
        pfa PFA6(A[6],B[6],P[6],G[6]);
        and (w24,P[6],G[5]);
        and (w25,P[6],P[5],G[4]);
        and (w26,P[6],P[5],P[4],G[3]);
        and (w27,P[6],P[5],P[4],P[3],G[2]);
        and (w28,P[6],P[5],P[4],P[3],P[2],G[1]);
        and (w29,P[6],P[5],P[4],P[3],P[2],P[1],G[0]);
        and (w30,P[5],P[4],P[3],P[2],P[1],P[0],Cin);
        or(c7,w24,w25,w26,w27,w28,w29,w30);
        pfa PFA7(A[7],B[7],P[7],G[7]);
        and (w31,P[7],G[6]);
        and (w32,P[7],P[6],G[5]);
        and (w33,P[7],P[6],P[5],G[4]);
        and (w34,P[7],P[6],P[5],P[4],G[3]);
        and (w35,P[7],P[6],P[5],P[4],P[3],G[2]);
        and (w36,P[7],P[6],P[5],P[4],P[3],P[2],G[1]);
        and (w37,P[7],P[6],P[5],P[4],P[3],P[2],P[1],G[0]);
        and (w38,P[7],P[6],P[5],P[4],P[3],P[2],P[1],P[0],Cin);
        or(carry,w31,w32,w33,w34,w35,w36,w37,w38);

        xor (out[0],P[0],Cin);
        xor (out[1],P[1],c1);
        xor (out[2],P[2],c2);
        xor (out[3],P[3],c3);
        xor (out[4],P[4],c4);
        xor (out[5],P[5],c5);
        xor (out[6],P[6],c6);
        xor (out[7],P[7],c7);




        //propagate
        //and (p0,P[3],P[2],P[1],P[0]);

        //GENERATE
        //and (w,P[3],G[2]);
        //and (w1,P[3],P[2],G[1]);
        //and (w2,P[3],P[2],P[1],G[0]);
        //or (w,w1,w2);
//CLA 


       
     
        
       
endmodule   

