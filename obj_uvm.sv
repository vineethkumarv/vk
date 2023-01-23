`include "uvm_macros.svh"
import uvm_pkg::*;

class ex_test extends uvm_test;
  `uvm_component_utils(ex_test)
  function new (string name="",uvm_component p=null);
    super.new(name,p);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Build_phase",$sformatf("%0t all ok",$time),UVM_LOW)
    //phase.phase_done.set_drain_time(this,2);
    //wherever you 
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    //phase.phase_done.set_drain_time(this,2);
    `uvm_info("Run_phase",$sformatf("%0t all ok",$time),UVM_LOW)
    #5
    phase.drop_objection(this);
    #2 `uvm_info("Run_phase",$sformatf("%0t dropped obj",$time),UVM_LOW)
  endtask

endclass

module one;
  initial fork
    run_test("ex_test");
    #7
    $display("%0t dropped obj in module",$time);
  join
endmodule
