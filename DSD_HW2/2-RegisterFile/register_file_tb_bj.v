`timescale 1ns/10ps
`define CYCLE  20
`define HCYCLE  5

module register_file_tb;
    // port declaration for design-under-test
    parameter pattern_num = 100;

    reg Clk, WEN;
    reg  [2:0] RW, RX, RY;
    reg  [7:0] busW;
    wire [7:0] busX, busY;
    
    reg stop;
    reg [2:0] register_to_write;
    reg [7:0] register_content;
    integer error, i, num;

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
        for(num = 0; num < (pattern_num); num = num + 1) begin
            @(posedge Clk) begin
                register_to_write[2:0] = {$random} % 8;  //generate a random number: 0 ~ 7
                register_content[7:0] = {$random} % 256; //generate a random number: 0 ~ 255
                RX[2:0] = register_to_write;
                RY[2:0] = register_to_write;
                RW[2:0] = register_to_write;
                busW[7:0] = register_content;
            end
        end
    end

    always@(posedge Clk) begin
        i <= i + 1;
        if (i >= pattern_num)
            stop <= 1;
    end

    always@(posedge Clk ) begin
        if((busX !== register_content) || (busY !== register_content)) begin
            if (register_to_write !== 0) begin
                error <= error + 1;
                $display(busX);
                $display(busY);
                $display("An ERROR occurs at no. %d pattern: {register, register_content} =  {%b , %b}.\n", i, register_to_write, register_content);
            end
            else begin
                if((busX !== 0) || (busY !== 0)) begin
                    error <= error + 1;
                    $display("An ERROR occurs at no. %d pattern: Register[0] not equal to 0, but %b", i, register_content);
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