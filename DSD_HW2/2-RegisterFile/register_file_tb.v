`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module register_file_tb;
    // port declaration for design-under-test
    parameter pattern_num = 100;
    reg Clk, WEN;
    reg  [2:0] RW, RX, RY;
    reg  [7:0] busW;
    wire [7:0] busX, busY;
    
    reg stop;
    reg [2:0] register_number;
    reg [7:0] register_value;
    integer i,num,error;
    
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
        Clk = 1'b1;
        error = 0;
        stop = 0;
        i = 0;
        num = 0;
        WEN = 1;
    end

    always begin #(`CYCLE * 0.5) Clk = ~Clk;
    end

    initial begin
        for( num = 0 ; num < (pattern_num) ; num = num + 1 )begin
            @(posedge Clk)begin
            register_number[2:0] = {$random}%8;
            register_value[7:0] = {$random}%256;
            RX = register_number;
            RY = register_number;
            RW = register_number;
            busW = register_value; 
            end
        end
    end 

    always@(posedge Clk) begin
        i <= i + 1;
        if (i >= pattern_num)
            stop <= 1;
        end
    
    always@(posedge Clk) begin
        if((busX !== register_value) || (busY !== register_value)) begin
            if (register_number !== 0) begin
                error <= error + 1;
                $display(busX);
                $display(busY);
                $display("An ERROR occurs at case %d : {register, register_value} =  {%b , %b}.\n", i, register_number, register_value);
            end
            else begin
                if((busX !== 0) || (busY !== 0)) begin
                    error <= error + 1;
                    $display("An ERROR occurs at case %d: Register[0] = %b", i, register_value);
                end
            end
        end
    end

    initial begin
        @(posedge stop) begin
            if(error == 0) begin
                $display("==========================================\n");
                $display("======  Congratulation! You Pass!  =======\n");
                $display("==========================================\n");
            end
            else begin
                $display("===============================\n");
                $display("There are %d errors.", error);
                $display("===============================\n");
            end
            $finish;
        end
    end

endmodule
