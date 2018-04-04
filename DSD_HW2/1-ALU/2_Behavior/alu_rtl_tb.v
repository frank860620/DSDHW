//rtl_tb
`timescale 1ns/10ps
`define CYCLE  34
`define HCYCLE  2

module alu_tb;
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
        x    = 8'b00000001;
        y    = 8'b11111111;
        
       
        
        // 0100 boolean not
        

        ctrl = 4'b0000;
        #2
        if( out == 8'b0000_0000 && carry==1 ) $display( "PASS --- 0000 boolean add" );
        else $display( "FAIL --- 0000 boolean add" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0010 && carry==1 ) $display( "PASS --- 0001 boolean sub" );
        else $display( "FAIL --- 0001 boolean sub" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0001) $display( "PASS --- 0010 boolean and" );
        else $display( "FAIL --- 0010 boolean and" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1111) $display( "PASS --- 0011 boolean or" );
        else $display( "FAIL --- 0011 boolean or" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0100 boolean not" );
        else $display( "FAIL --- 0100 boolean not" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0101 boolean xor" );
        else $display( "FAIL --- 0101 boolean xor" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 0110 boolean nor" );
        else $display( "FAIL --- 0110 boolean nor" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0111 boolean Shift left logical variable" );
        else $display( "FAIL --- 0111 boolean Shift left logical variable" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0111_1111) $display( "PASS --- 1000 boolean Shift right logical variable" );
        else $display( "FAIL --- 1000 boolean Shift right logical variable" );
        //$display("ctrl=%b,x=%b,y=%b,carry=%b,out=%b",ctrl,x,y,carry,out);  
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 1001 boolean Shift right arithmetic" );
        else $display( "FAIL --- 1001 boolean Shift right arithmetic" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0010) $display( "PASS --- 1010 boolean Rotate left" );
        else $display( "FAIL --- 1010 boolean Rotate left" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1000_0000) $display( "PASS --- 1011 boolean Rotate right" );
        else $display( "FAIL --- 1011 boolean Rotate right" );
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 1100 boolean Equal" );
        else $display( "FAIL --- 1100 boolean Equal" );
        ctrl = ctrl + 1;

        // finish tb
        #(`CYCLE) $finish;
        
    end
    /*
    always #2 begin
    $display("ctrl=%b,x=%b,y=%b,carry=%b,out=%b",ctrl,x,y,carry,out);     
    ctrl = ctrl + 1;             
    end
    
    initial #(`CYCLE) $finish;
    */

endmodule
