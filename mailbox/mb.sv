class hi;
  int a[$];
  mailbox m=new(5);
  function new();
    $display(a);
  endfunction

endclass



module mail;
mailbox m;
hi h;
int a[10],k=0;
initial 
  fork
begin
  m=new(5);
  for (int i=0;i<20;i++)
  begin
    if (k!=0 && i%2==0) begin a[k]=i;k++;end
    else a[k]=i;
  end
  m.put(a);
end
/*begin
h.m=m;
h.a=a;
end
begin
#0
  h=new();
end
*/
begin
  int k,l[];
m.get(l);
$display(k," ",l);
end
join
endmodule


