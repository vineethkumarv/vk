class hi;
  rand bit [3:0]a,b;
  int list[$];
  int l2[$];
  constraint c1 {!(a inside {list});
                    !(b inside {l2});}
  function disp();
    $display("a is %0d,b is %0d ",a,b);
  endfunction

  function void post_randomize();

    list.push_back(a);
    l2.push_back(b);

    if (list.size()==16) begin
      list.delete(15);
      l2.delete();
      $display(list);
    end
  endfunction
endclass
module one;
hi h;
initial begin
  h=new();
  repeat(16) begin
  h.randomize();
  h.disp();
  end
end

endmodule
