module simple_calculator(
    Clk,
    WEN,
    RW,
    RX,
    RY,
    DataIn,
    Sel,
    Ctrl,
    busY,
    Carry
);

    input        Clk;
    input        WEN;
    input  [2:0] RW, RX, RY;
    input  [7:0] DataIn;
    input        Sel;
    input  [3:0] Ctrl;
    output [7:0] busY;
    output       Carry;

// declaration of wire/reg
// write your design here
 wire [7:0] mux_out,busX,Out;
// submodule instantiation
register_file rf( 
    Clk ,
    WEN ,
    RW  ,
    Out ,
    RX  ,
    RY  ,
    busX,
    busY
    );
mux m1(Sel,busX,DataIn,mux_out);
alu a1(
    Ctrl,
    mux_out,
    busY,
    Carry,
    Out 
);


endmodule

module mux(Sel,a,b,out);
    input [7:0] a,b;
    input Sel;
    output [7:0] out;
    reg [7:0] out_reg;
    assign out = out_reg;
    always@(a or b or Sel)begin
      case(Sel)
      1'b1:out_reg=a;
      1'b0:out_reg=b;
      endcase
    end
endmodule