module barrel_shifter_gate(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

/*Write your code here*/
wire [7:0] x1;
wire [7:0] x2;
reg zero = 0;

mux m1_1(x1[0],in[0],zero,shift[0]);
mux m1_2(x1[1],in[1],in[0],shift[0]);
mux m1_3(x1[2],in[2],in[1],shift[0]);
mux m1_4(x1[3],in[3],in[2],shift[0]);
mux m1_5(x1[4],in[4],in[3],shift[0]);
mux m1_6(x1[5],in[5],in[4],shift[0]);
mux m1_7(x1[6],in[6],in[5],shift[0]);
mux m1_8(x1[7],in[7],in[6],shift[0]);

mux m2_1(x2[0],x1[0],zero,shift[1]);
mux m2_2(x2[1],x1[1],zero,shift[1]);
mux m2_3(x2[2],x1[2],x1[0],shift[1]);
mux m2_4(x2[3],x1[3],x1[1],shift[1]);
mux m2_5(x2[4],x1[4],x1[2],shift[1]);
mux m2_6(x2[5],x1[5],x1[3],shift[1]);
mux m2_7(x2[6],x1[6],x1[4],shift[1]);
mux m2_8(x2[7],x1[7],x1[5],shift[1]);

mux m4_1(out[0],x2[0],zero,shift[2]);
mux m4_2(out[1],x2[1],zero,shift[2]);
mux m4_3(out[2],x2[2],zero,shift[2]);
mux m4_4(out[3],x2[3],zero,shift[2]);
mux m4_5(out[4],x2[4],x2[0],shift[2]);
mux m4_6(out[5],x2[5],x2[1],shift[2]);
mux m4_7(out[6],x2[6],x2[2],shift[2]);
mux m4_8(out[7],x2[7],x2[3],shift[2]);


/*End of code*/
endmodule

module mux (x,a,b,sel);
input 	a,b,sel;
output 	x;
wire sel_i,w1,w2;

not n0(sel_i,sel);
and a1(w1,a,sel_i);
and a2(w2,b,sel);
or  o1(x,w1,w2);

	
endmodule
