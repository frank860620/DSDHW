`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module register_file_tb;
    // port declaration for design-under-test
    reg Clk, WEN;
    reg  [2:0] RW, RX, RY;
    reg  [7:0] busW;
    wire [7:0] busX, busY;
    reg [7:0] regX, regY;
    
    // instantiate the design-under-test
    register_file rf(
        Clk  ,
        WEN  ,
        RW   ,
        busW ,
        RX   ,
        RY   ,
        busX ,
        busY
    );
   
    // write your test pattern here
 initial begin
    busW=8'd0;
    RX=3'd0;
    RY=3'd0;
    RW=3'd0;
    WEN=0;
    Clk=0;
  end

always begin #(`CYCLE * 0.5) Clk = ~Clk;
end
always @(posedge Clk) begin
 
 // Test Case 1: 
  //   Write '42' to register 2, verify with Read Ports 1 and 2
  //   (Passes because example register file is hardwired to return 42)
  RW = 3'd2;
  busW = 8'd42;
  WEN= 1;
  RX = 3'd2;
  RY = 3'd2;

  //#(`HCYCLE) Clk=1; #5 Clk=0;	// Generate single clock pulse

  if((regX != 42) || (regY != 42)) begin
  $display("Test Case 1 Failed");
  $display("regX=%d,regy=%d",regX,regY);
  $display("busX=%d,busY=%d",busX,busY);
  end
  else
  begin
  $display("Test Case 1 Pass");
  $display("regX=%d,regy=%d",regX,regY);
  end
#(`CYCLE) $finish;
end
endmodule
