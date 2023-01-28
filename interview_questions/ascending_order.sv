module one;
int a[],b[*],c[$];
int x=0,j=0,y=0;
initial begin
  a=new[10];
  for (int i=0;i<10;i++)begin
    if(i%2 ==0)begin
      a[x]=i;
      x++;
    end
    else begin
      b[y]=i;
      y++;
    end
  end
  $display("dynamic array is %0p",a);
  a.shuffle();
  $display(a);
  a.sort();
  $display(a);
  $display("\/n/associative array is %0p",b);
  //b.shuffle();//will not work with associative arrays
  $display(b);
  j=b.num()-1;
  while (j>=0) begin
    $display(b[j]);
    j--;
  end
  //$display(b.sort());same as line 22
end
endmodule
