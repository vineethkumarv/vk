 package hi;
  int a;
  class captain;
    int a1;
    function void comment;
        $display("Avengers Assemble");
    endfunction:comment
  endclass:captain

   function void ironman;
    a=5;
    $display("I am iron man,2+3=%0d",a);
  endfunction:ironman

  virtual class sparrow;
  endclass:sparrow
endpackage:hi


import hi::*;

function ironman;
  $display("I am ironman of the module");
endfunction:ironman


module one;

initial begin
  hi::ironman();
  void'(pack::test());
  //assigning();throws runtime error as not a syntax fault assigning is a funcion of package 'pack' and  
  // without scope resolution operator it is an error as package is not imported.
end
endmodule:one


