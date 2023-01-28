module verilog_dut(clk, rst,a,b,c,cout,sum);

input clk;
input rst;
input a;
input b;
output cout;
output sum;


always @(posedge clk) begin
   if (!rst) begin
     cout <= 0;
     sum <= 0;
     end 
   else begin
     sum <= a+b;
     cout <= sum[4];
     end
   end


endmodule
