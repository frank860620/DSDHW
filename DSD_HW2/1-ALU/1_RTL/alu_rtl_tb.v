//rtl_tb
`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module alu_rtl_tb;
    reg  [3:0] ctrl;
    reg  [7:0] x;
    reg  [7:0] y;
    wire       carry;
    wire [7:0] out;
    
    alu_rtl alu1(
        ctrl     ,
        x        ,
        y        ,
        carry    ,
        out  
    );

//    initial begin
//        $fsdbDumpfile("alu.fsdb");
//        $fsdbDumpvars;
//    end

    initial begin
        ctrl = 4'b1101;
        x    = 8'd4;
        y    = 8'd5;
        
        #(`CYCLE);
        // 0100 boolean not
        ctrl = 4'b0000;
        
        #(`HCYCLE);
        if( out == 8'b0000_1001 ) $display( "PASS --- 0100 boolean not" );
        else $display( "FAIL --- 0100 boolean not" );
        
        // finish tb
        #(`CYCLE) $finish;
    end

endmodule