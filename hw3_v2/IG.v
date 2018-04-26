module IG ( clk , reset, done, img_wr, img_rd, img_addr, img_di, img_do, 
            grad_wr, grad_rd, grad_addr, grad_do, grad_di);

input clk, reset;
input [7:0] img_di;
input [19:0] grad_di;
output done, img_wr, img_rd, grad_wr, grad_rd;
output [15:0] img_addr, grad_addr;
output [7:0] img_do;
output [19:0] grad_do;

//------------------------------------------------------------------
// reg & wire
reg [15:0] addr , addr_g;
reg [7:0] rd_M[0:65535];
reg signed [9:0] Gx;
reg signed [9:0] Gy; 
reg signed [19:0] grad_M[0:65535];
reg[7:0] counter,send;
integer i;
reg img_rd,grad_wr,done,calculate,img_rd_rd;
reg [15:0] img_addr, grad_addr,M_addr;
reg [7:0] img_di_reg;
reg [19:0] grad_do;
//wire [7:0] in;
//------------------------------------------------------------------
// combinational part
//assign in = img_di;

always@(*)begin
if(reset)begin
    $display("It's start to reset all things!!");
    counter = 1;
    send = 0;
    img_addr = 0;
    addr_g = 0;
    img_rd_rd = 1; 
    img_di_reg = img_di;
end
else if (calculate)begin
    $display("Let's start to calculate the gradient!");
    //integer i;
    for (i=0;i<=65279;i=i+1) begin
        if(counter != 256) begin
         Gx = rd_M[i+1] - rd_M[i];
         Gy = rd_M[i+256] - rd_M[i];
         grad_M[i] = {Gx,Gy};
         counter = counter + 1; 
        end
        else if (counter == 256 && i == 65279)begin
            counter = 1;
            send = 1;
        end
        else begin 
            counter = 1;
        end
    end
    
    end
end



//------------------------------------------------------------------
// sequential part
always @(negedge clk) begin
    if(img_rd_rd)begin
    //$display("start to read");
    //M_addr = img_addr -1;
    rd_M[img_addr]= img_di;
    //$display("M_addr = %d, rd_M[M_addr] = %d,img_di = %d",M_addr,rd_M[M_addr],img_di);
    $display("img_addr = %d, rd_M[img_addr] = %d,img_di = %d",img_addr,rd_M[img_addr],img_di);
    end
    end
always @(posedge clk) begin
    if(img_rd_rd && !reset)begin
    img_rd = 1;
    if(img_addr != 10) begin
        //$display("start to read");
        //img_addr<=addr;
        //rd_M[addr] <= img_di_reg;
        //$display("addr : %d, rd_M[addr] : %d",addr,rd_M[addr]);
        $display("img_addr :",img_addr);
        img_addr <= img_addr+1;
     end
    else begin
        //img_addr = addr-1;
        $display("rd_M[0] = %d",rd_M[0]);
        $display("rd_M[1] = %d",rd_M[1]);
        $display("img_addr : %d",img_addr);
        img_rd <= 0;
        img_rd_rd <= 0;
        calculate <= 1;
        $display("end");

    end
    
    end
    else begin
    img_rd = 0;
    end
    //img_rd <= 0;
end

always @(send) begin
    grad_wr <= 1;
    grad_do <= grad_M[addr_g];
end
always @(posedge clk) begin
   if(grad_wr)begin
    if(addr_g != 65536) begin
        grad_addr <= addr_g;
        addr_g <= addr_g + 1;
    end
    else begin
        grad_wr <= 0;
        done <=1;
    end
    end
end
endmodule

