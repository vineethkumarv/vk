module sed;
bit[7:0]a;
int b;
initial begin
  std::randomize(a);
  std::randomize(b);
//a=$random();
//b=$urandom();
$display(a," ",b,$time);
end
endmodule
