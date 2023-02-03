`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction  extends uvm_sequence_item;
  rand bit[2:0]a;
  rand bit[2:0]b;
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(a,UVM_DEFAULT)
  `uvm_field_int(b,UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name ="transaction");
    super.new(name);
  endfunction

endclass
////////////////////////////////////////////

class lseq extends uvm_sequence #(transaction);
  `uvm_object_utils(lseq)
  transaction t;
  //  uvm_sequencer #(transaction) seqr;
  function new(string name ="seq");
    super.new(name);
  endfunction

  virtual task body();
  t=transaction::type_id::create("transaction");
  wait_for_grant();
  void'(t.randomize());
  send_request(t);
  wait_for_item_done();
endtask
endclass

////////////////////////////////////

class sequencer extends uvm_sequencer#(transaction);
  `uvm_component_utils(sequencer)
  function new(string name ="sequencer",uvm_component parent=null);
    super.new(name,parent);
  endfunction

endclass
class vseqr extends uvm_sequencer;
  `uvm_component_utils(vseqr)
  sequencer seqr;
  function new(string name ="vseqr",uvm_component parent=null);
    super.new(name,parent);
    seqr=sequencer::type_id::create("seqr",this);
  endfunction

endclass
class seq2 extends uvm_sequence();
`uvm_object_utils(seq2)
lseq seq;  
sequencer seqr;
  //vseqr vsqr;
function new(string name ="seq");
    super.new(name);
    seq= lseq::type_id::create("seq");
  endfunction
  task body();
   //seqr=vsqr.seqr;
   seq.start(seqr);
  endtask
endclass

class vseq1 extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(vseq1)
  seq2 se;
sequencer seqr;
  function new(string name ="vseq1");
    super.new(name);
  endfunction
  task body(); 
    se=seq2::type_id::create("se");
    `uvm_info(get_type_name(),"in the body if vseq",UVM_MEDIUM)
    se.seqr=seqr;
    se.start(null);
  endtask

  endclass

  class driver extends uvm_driver#(transaction);
    `uvm_component_utils(driver)
    transaction req;
    function new (string n="driver",uvm_component p=null);
      super.new(n,p);
    endfunction
    function void build_phase(uvm_phase phase);
      req=transaction::type_id::create("req",this); 
      req.print();
    endfunction
    task run_phase(uvm_phase phase);
      seq_item_port.get_next_item(req);
      req.print();
      `uvm_info("hi","IN DRIVER",UVM_MEDIUM)
      seq_item_port.item_done();
    endtask
  endclass

  /////////////////////////////////////////////

  class agent extends uvm_agent;

    `uvm_component_utils(agent)
    driver d;
    //sequencer seqr;
    vseqr vvseqr;
    function new(string name ="agent", uvm_component parent = null);
      super.new(name,parent);
    endfunction
    virtual function void  build_phase(uvm_phase phase);
    super.build_phase(phase);
    d=driver::type_id::create("d",this);
    //seqr=sequencer::type_id::create("seqr",this);
    vvseqr=vseqr::type_id::create("vvseqr",this);

  endfunction

  virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  d.seq_item_port.connect(vvseqr.seqr.seq_item_export);
endfunction

endclass
////////////////////////////////////////////////////////////////


class env extends uvm_env;

  `uvm_component_utils(env)
  agent a;
  function new(string name ="agent", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  a=agent::type_id::create("a",this);
endfunction
virtual task run_phase(uvm_phase phase);
 endtask

endclass
///////////////////////////////////////////////////
class test extends uvm_test;
  `uvm_component_utils(test)
  env e;
  vseq1 s;
  vseqr vsr;
  function new(string name ="test", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  e=env::type_id::create("e",this);
  s=vseq1::type_id::create("s",this);
  //vsr=vseqr::type_id::create("vsr",this);
  // uvm_config_db#(env)::set(this,"s","env_h",e);
  // uvm_config_db#(vseq1)::set(this,"e","vseq1",s);
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
vsr=e.a.vvseqr;
s.seqr=vsr.seqr;
s.start(null);
`uvm_info(get_type_name(),"run phase of test",UVM_MEDIUM)
  endtask

endclass

/////////////////////////////////////////////////// 

module tb;
initial begin
  run_test("test");
end
endmodule


