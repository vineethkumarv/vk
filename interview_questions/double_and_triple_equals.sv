module dt;
logic[3:0]a;
logic[3:0]b;
initial begin
  a=4'b10z1;
  b=4'b10z1;
  $display(a===b);
  $display(a==b);
end
endmodule
