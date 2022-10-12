package dora;
  function int addit(int a,b);
    $display("in add function");
    return a+b;
  endfunction
virtual class bujji;
  static task teddy;
  $display("hi i am teddy");
endtask
 pure virtual function void monkey;
//$display("I am not a monkey");
//endfunction

endclass
 endpackage


 function int addit(int a,b);
   return a+b;
 endfunction
 
 import dora::*;
 module one;
 initial begin
//bujji b=new;//runtime error as b is abstract
   bujji::teddy;
   //b.monkey();cannot access as b is virtual/abstract
   $display("%0d is the sum",addit(4,5));
 end endmodule



