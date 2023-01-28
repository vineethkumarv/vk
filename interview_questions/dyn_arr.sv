//can changhe the memory size without losing the previous data
module one;
int a[];//dynamic array declaration
initial begin
a=new[10];
for (int i=0;i<10/* & i<21*/;i++)begin
  a[i]=i*i;
end
$display(a);
//extending the memory to 20
a=new[a.size()+10](a);
for (int i=10;i<20;i++)begin
  a[i]=i*i;
end
$display(a);
$monitor(a);
a.shuffle();
$display(a);
a.sort();
$display(a);
a.rsort();
$display(a);
a.reverse();
end
endmodule
