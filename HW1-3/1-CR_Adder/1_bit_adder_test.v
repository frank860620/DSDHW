module fulladdt_b;

reg a;

reg b;

reg c;

wire sum;

wire carry;

fa uut (  .a(a),   .b(b),.c(c),.sum(sum),.carry(carry)  );

initial begin

#10 a=1’b0;b=1’b0;c=1’b0;

#10 a=1’b0;b=1’b0;c=1’b1;

#10 a=1’b0;b=1’b1;c=1’b0;

#10 a=1’b0;b=1’b1;c=1’b1;

#10 a=1’b1;b=1’b0;c=1’b0;

#10 a=1’b1;b=1’b0;c=1’b1;

#10 a=1’b1;b=1’b1;c=1’b0;

#10 a=1’b1;b=1’b1;c=1’b1;

#10$stop;

end

endmodule