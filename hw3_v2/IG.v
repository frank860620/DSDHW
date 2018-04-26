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
reg img_rd,grad_wr;
reg [15:0] img_addr, grad_addr;
reg [7:0] img_di_reg;
reg [19:0] grad_do;
//wire [7:0] in;
//------------------------------------------------------------------
// combinational part
//assign in = img_di;
assign img_di_reg = img_di;
always@(*)begin
if(reset)begin
    counter = 1;
    send = 0;
    addr = 0;
    addr_g = 0;
end
else begin
    
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
always @(img_di) begin
    rd_M[img_addr]= img_di_reg;
    end
always @(posedge clk) begin
    if(addr != 65536) begin
        img_rd <= 1;
        img_addr<=addr;
        addr <= addr+1;
     end
    else begin
        img_rd <= 0;
    end
end
always @(send) begin
    grad_wr <= 1;
    grad_do <= grad_M[addr_g];
end
always @(posedge clk) begin
    if(addr_g != 65536) begin
        grad_addr <= addr_g;
        addr_g <= addr_g + 1;
    end
    else begin
        grad_wr <= 0;
        done <=1;
    end
end
endmodule

