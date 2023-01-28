module one;
bit[7:0] a,b,h;
bit k;
int p;

function bit[7:0] for_true(bit[7:0] a);
  bit [7:0]x;
  if(a >10) begin
    std::randomize(x) with {x inside{[a:255]};};
    return x;
  end
  else 
    return 0;
  endfunction

  initial begin
     repeat (2) begin
    a=std::randomize() with{a > 3;};
    p=std::randomize();
  end
    $display("value of a is %0d",a);
    $display("value of p is %0d",p);
    
    k=1;
    b=for_true(a);
    $display("value of x is %0d",b);
    //k=0;
  end

  always @(k)
    assert(a)
  begin  
  $info($time);
  $display("passed");
end
else $error("sorry");


endmodule
