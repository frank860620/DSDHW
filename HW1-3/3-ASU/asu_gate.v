module asu_gate (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;

/*Write your code here*/
wire [7:0] output_a;
wire [7:0] output_b;
adder_gate a(x,y,carry_a,output_a);
barrel_shifter_gate b(x,y[2:0],output_b);

mux1 #2.5 mux_3_1(out[0],output_b[0],output_a[0],mode)
mux1 #2.5 mux_3_2(out[1],output_b[1],output_a[1],mode)
mux1 #2.5 mux_3_3(out[2],output_b[2],output_a[2],mode)
mux1 #2.5 mux_3_4(out[3],output_b[3],output_a[3],mode)
mux1 #2.5 mux_3_5(out[4],output_b[4],output_a[4],mode)
mux1 #2.5 mux_3_6(out[5],output_b[5],output_a[5],mode)
mux1 #2.5 mux_3_7(out[6],output_b[6],output_a[6],mode)
mux1 #2.5 mux_3_8(out[7],output_b[7],output_a[7],mode)
mux1 #2.5 mux_3_c(carry,0,carry_a,mode)


/*End of code*/


endmodule


module mux1 (x,a,b,sel);
input 	a,b,sel;
output 	x;
wire sel_i,w1,w2;

not n0(sel_i,sel);
and a1(w1,a,sel_i);
and a2(w2,b,sel);
or  o1(x,w1,w2);

	
endmodule