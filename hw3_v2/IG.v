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
reg[8:0] counter;
integer i;
reg img_rd,grad_wr,done,calculate,img_rd_rd,init,delay,send;
reg [15:0] img_addr,grad_addr,M_addr;
reg [19:0] grad_do;
//------------------------------------------------------------------
// combinational part
always@(*)begin
if(reset)begin
    counter = 1;
    send = 0;
    img_addr = 0;
    addr_g = 0;
    img_rd_rd = 1; 
    init = 1;
    delay = 0;
    done = 0;
end
else if (calculate && !send)begin
    
    
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
    if(img_rd)begin
    M_addr = img_addr -1;
    rd_M[M_addr] = img_di;
    end
    end
always @(posedge clk) begin
    if(img_rd_rd && !reset)begin
    if(init)begin
      img_rd <= 1;
      init <= 0;
    end
    else begin
    if(!delay) begin
        img_addr <= img_addr+1;
        if(img_addr == 65535) delay <= 1;
     end
    else begin
        img_rd <= 0;
        img_rd_rd <= 0;
        calculate <= 1;

    end
    
    end
    end
    else begin
    img_rd <= 0;
    end
end

always @(posedge clk) begin
if(send && !done)begin
    grad_wr <= 1;
    if(grad_wr)begin
        if(addr_g ==0) begin
            grad_addr <= addr_g;
            addr_g <= addr_g + 1;
            grad_do <= grad_M[addr_g];
        end
        else if(addr_g != 0 && addr_g != 65535) begin
            grad_addr <= addr_g;
            addr_g <= addr_g + 1;
            grad_do <= grad_M[addr_g];
        end
        else begin
            grad_wr <= 0;
            done <=1;
        end
    end
end
  
end
   
endmodule

