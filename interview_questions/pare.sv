class seq;
  rand bit [3:0]a[4];
  rand bit [3:0]b[4];
    constraint c1{//((a[0]-a[3])**2 +(b[0]-b[3])**2) ==((a[1]-a[2])**2 +(b[1]-b[2])**2);
                  //((a[0]-a[1])**2 +(b[0]-b[1])**2) ==((a[3]-a[2])**2 +(b[3]-b[2])**2);}
    (((b[2]-b[3])/(a[2]-a[3])) == ((b[1]-b[0])/(a[1]-a[0])));
    (((b[3]-b[0])/(a[3]-a[0])) == ((b[2]-b[1])/(a[2]-a[1]))) ;}

  function void pre_randomize();
    //            ((b[3]-b[0])/(a[3]-a[0])) == ((b[2]-b[1])/(a[2]-a[1]));}
    //constraint c4{b[2]<10;
    //a[2]<10;}
    $display("pre-rand");
  endfunction

  function void hi();
    $display(" a0,bo (%0d,%0d) and a1,b1 (%0d,%0d)and a2 ,b2 (%0d,%0d) and a3 ,b3 (%0d,%0d)",a[0],b[0],a[1],b[1],a[2],b[2],a[3],b[3]);
  endfunction
endclass

module one;
seq s;
initial begin
  s=new();
  s.randomize();// with {//((((a[0]-a[2])**2)+((b[0]-b[2])**2))**(1/2)) == ((((a[1]-a[3])**2)+((b[1]-b[3])**2))**(1/2)) && 
  s.hi();
end
endmodule

