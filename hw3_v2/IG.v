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
integer i,counter,send;
assign addr=0;
assign addr_g=0;
assign counter=1;
assign send=0;
//wire [7:0] in;
//------------------------------------------------------------------
// combinational part
//assign in = img_di;
for (i=0;i<=65279;i=i+1) begin
    if(counter != 256) begin
       assign Gx = rd_M[i+1] - rd_M[i];
       assign Gy = rd_M[i+256] - rd_M[i];
       assign grad_M[i] = {Gx,Gy};
       assign counter = counter + 1; 
    end
    else if (counter == 256 && i == 65279)begin
        assign counter = 1;
        assign send = 1;
    end
    else begin 
        assign counter = 1;
    end
end




//------------------------------------------------------------------
// sequential part
always @(img_di) begin
    rd_M[img_addr]= img_di;
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
    end
end
endmodule

