`include "uvm_macros.svh"
import uvm_pkg::*;


class seq extends uvm_sequence_item();

  rand bit [1:0]a;
  rand bit [1:0]b;
  `uvm_object_utils_begin(seq)
  `uvm_field_int(a,UVM_DEFAULT)
  `uvm_field_int(b,UVM_DEFAULT)
  `uvm_object_utils_end
    
  //constraint mul{a != 0;b != 0;}
   constraint m{unique{a,b};
   //unique{b};
                }
  function new(string name="seq");
    super.new(name);
  endfunction

endclass

class sequen extends uvm_sequence#(seq);
  `uvm_object_utils(sequen)
  
  seq s;

  function new(string name="sequen");
    super.new(name);
  endfunction
  
  task body();
    s = seq::type_id::create("s");
    repeat (12) begin
    s.randomize();
    s.print();
    end
  endtask
endclass



class test extends uvm_test;
uvm_sequencer#(seq) seqr;
  sequen sequ;
  `uvm_component_utils(test)
  
  function new(string name="test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr=uvm_sequencer#(seq)::type_id::create("seqr",this);
    sequ=sequen::type_id::create("sequ");
  endfunction 

  task run_phase(uvm_phase phase);
    sequ.start(seqr);
  endtask

endclass


module one;
initial begin
  run_test("test");
end
endmodule
