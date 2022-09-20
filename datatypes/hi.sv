module hi;
bit [3:0] ldt;
logic [3:0]  a;
integer b;
int c;
initial
begin
  $display("default bit:%b",ldt);
  $display("default logic :%b",a);
  $display("default integer:%b",b);
  $display("default int :%b",c);
  ldt=4'b0101;
  a=4'b0111;
  b=964;
  c=34567;
  $display("changed value of logic :%b",a);
  $display("changed value of bit:%b",ldt);
  $display("changed integer :%d",b);
  $display("changed int :%d",c);
end 
endmodule: hi


