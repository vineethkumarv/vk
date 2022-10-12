 package hi;
  int a;
  class captain;
    int a1;
    function void comment;
      $display("Avengers Assemble");
    endfunction
  endclass

   function void ironman;
    a=5;
    $display("I am iron man,2+3=%0d",a);
  endfunction
  virtual class sparrow;
    /*interface j;
      logic [2:0]a;
      logic [2:0]b;
    endinterface*/
  endclass
endpackage


import hi::*;
function ironman;
  $display("I am ironman of the module");
endfunction
module one;

initial begin
  hi::ironman();
  pack::test();
  //assigning();throws runtime error as not a syntax fault 
end
endmodule


