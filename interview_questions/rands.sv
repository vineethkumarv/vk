module one;
int a,b,c;
string k="hello";
initial begin 
//  repeat (5) begin
foreach (k[i]) begin
    std::randomize(a) with {a==i+5;};
 $display("a is %0d",a);
end
foreach (k[i]) begin
    std::randomize(a) with {a==i+10;a==a-1;};
 $display("a is %0d",a);
end
  b=$urandom();
  c=$urandom_range(5,10);
 $display("a is %0d",a);
 $display("b is %0d",b);
 $display("c is %0d",c);
end 
endmodule
