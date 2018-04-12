//rtl_tb
`timescale 1ns/10ps
`define CYCLE  34
`define HCYCLE  2

module alu_rtl_tb;
    reg  [3:0] ctrl;
    reg  [7:0] x;
    reg  [7:0] y;
    wire       carry;
    wire [7:0] out;
    integer err;

    alu_rtl alu1(
        ctrl     ,
        x        ,
        y        ,
        carry    ,
        out  
    );

    /*initial begin
        $fsdbDumpfile("alu.fsdb");
        $fsdbDumpvars;
    end*/

    initial begin
        ctrl = 4'b1101;
        x    = 8'b00000001;
        y    = 8'b11111111;
        err = 0;
        ctrl = 4'b0000;
        
        //start to test
        #2
        if( out == 8'b0000_0000 && carry==1 ) $display( "PASS --- 0000 boolean add" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0000 boolean add" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0010 && carry==1 ) $display( "PASS --- 0001 boolean sub" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0001 boolean sub" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0001) $display( "PASS --- 0010 boolean and" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0010 boolean and" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1111) $display( "PASS --- 0011 boolean or" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0011 boolean or" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0100 boolean not" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0100 boolean not" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0101 boolean xor" );
        else begin 
            err <= err + 1;
            $display( "FAIL --- 0101 boolean xor" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 0110 boolean nor" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0110 boolean nor" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1111_1110) $display( "PASS --- 0111 boolean Shift left logical variable" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 0111 boolean Shift left logical variable" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0111_1111) $display( "PASS --- 1000 boolean Shift right logical variable" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 1000 boolean Shift right logical variable" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 1001 boolean Shift right arithmetic" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 1001 boolean Shift right arithmetic" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0010) $display( "PASS --- 1010 boolean Rotate left" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 1010 boolean Rotate left" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b1000_0000) $display( "PASS --- 1011 boolean Rotate right" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 1011 boolean Rotate right" );
        end
        ctrl = ctrl + 1;
        #2
        if( out == 8'b0000_0000) $display( "PASS --- 1100 boolean Equal" );
        else begin
            err <= err + 1;
            $display( "FAIL --- 1100 boolean Equal" );
        end
        ctrl = ctrl + 1;
        #2
        ctrl = ctrl + 1;
        #2
        ctrl = ctrl + 1;
        #2
        ctrl = ctrl + 1;
        
        
        //count the error
        if(err == 0) begin
            $display("==========================================\n");
            $display("======  Congratulation! You Pass!  =======\n");
            $display("==========================================\n");
        end
        else begin
            $display("===============================\n");
            $display("There are %d errors.", err);
            $display("===============================\n");
        end
    $finish;
    end
    endmodule

    
    /*
    always #2 begin
    $display("ctrl=%b,x=%b,y=%b,carry=%b,out=%b",ctrl,x,y,carry,out);     
    ctrl = ctrl + 1;             
    end
    
    initial #(`CYCLE) $finish;
    */


