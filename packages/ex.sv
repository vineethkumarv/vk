package pack;
  int a;
  string k;
  
  class big;
    static int age;
    static string name;
    function new(string s,int a);
      this.name=s;this.age=a;
    endfunction

    function string getname();
      return this.name;
    endfunction

    function int getage();
      return this.age;
    endfunction
  endclass

  function assigning;
    a=big::age;
    k=big::name;
    $display("Package variables are accessed, name %0s,age %0d",k,a);
  endfunction

  function test;
    a=10;
    $display("In the package, variable a is %0d",a);
  endfunction
endpackage 

package two2;
int x,y;
function test;
  $display("In the package two");
endfunction
endpackage
