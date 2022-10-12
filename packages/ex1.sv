import pack1::*;
import pack::*;
`include "../pack/forpack.sv"
import one1::*;
//function void test;
  //$display("i am not in package");
//endfunction

module one;
big b=new("vineeth",21);
function test;
  $display("this is in module");
endfunction
initial begin
  $display("%0s is the name ",b.getname());
  assigning();
  pack::test();
  check;
  test();
end
endmodule

//`include "ex.sv"
import two2::*;

module two;
initial begin 
  assigning;
  check;
end
endmodule
