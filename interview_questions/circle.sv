class circle;
  rand bit[4:0] x,y;
  rand bit[4:0] h,k;
  rand int r;
  //considering the size of the screen as 32*32,max radius is 16
  constraint c2{this.r inside{0,6};}
  //  constraint c0{((x-h)**2 + (y-k)**2)== r**2; }

  /* function new();
  // std::randomize(this.h) with {;};
  int min=0,max=9;
endfunction

/* function void pre_randomize();
int min=0,max=9;
std::randomize(this.x) with {min <= x <= max;};
std::randomize(this.y) with {min <= y <= max;};
$display(x,y);  
endfunction*/

  function void print_values();
    $display("center h,k are %0d,%0d,r is %0d,x,y are %0d,%0d",h,k,r,x,y);
  endfunction
endclass

module one;
circle c1,c2,c3;
int min=0,max=9;

initial begin 
  c1=new();
  c2=new();
  c3=new();

  assert(c1.randomize() with { (((x-h)**2 + (y-k)**2) == r**2) && (x inside{min,max}) && (y inside{min,max});}) 
  //c1.r=$urandom(0.7);
  c1.print_values();
  else begin
    $error("cannot randomize");
  end
end
initial begin
  min=10;
  max=19;

  assert(c2.randomize() with { (((x-h)**2 + (y-k)**2) == r**2) && (x inside{min,max}) && (y inside{min,max});}) 
  //c2.r=$urandom(0.7);
  c2.print_values();
  else begin
    $error("cannot randomize");
  end
end

initial begin
  min=20;
  max=29;
  assert(c3.randomize() with { (((x-h)**2 + (y-k)**2) == r**2) && (x inside{min,max}) && (y inside{min,max});}) 
  //c3.r=$urandom(0.7);
  c3.print_values();
  else begin
    $error("cannot randomize");
  end
end
  endmodule
