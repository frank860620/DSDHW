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
    always@(a or b or sel)begin
      case(sel)
      1b'1:out=a;
      1b'0:out=b;
      endcase
    end
endmodule