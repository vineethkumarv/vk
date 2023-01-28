
class para;
  rand bit [3:0]  a[3],b[3];
  rand bit [3:0] x,y;

  constraint c1 {(((x-a[0])**2+(y-b[0])**2)**1/2) == (((a[1]-a[2])**2+(b[1]-b[2])**2)**1/2) && 
                  (((x-a[2])**2+(y-b[2])**2)**1/2) == (((a[0]-a[1])**2+(b[0]+b[1])**2)**1/2);}
 //                 ((b[0]-y)/(a[0]-x)) == ((b[1]-b[2])/(a[1]-a[2]));}

  function void disp();
    $display("(a[0]=%0d,b[0]=%0d)  (a[1]=%0d,b[1]=%0d)   (a[2]=%0d,b[2]=%0d) (x=%0d,y=%0d)",a[0],b[0],a[1],b[1],a[2],b[2],x,y);
  endfunction

endclass

module tb;
para p;
initial begin
  p=new();
  p.randomize();
  p.disp();
end
endmodule
                      
