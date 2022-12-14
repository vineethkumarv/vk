//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the out_intf transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a out_intf_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class out_intf_random_sequence 
  extends out_intf_sequence_base ;

  `uvm_object_utils( out_intf_random_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=out_intf_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "out_intf_random_sequence::body()-out_intf_transaction randomization failed")
      // Send the transaction to the out_intf_driver_bfm via the sequencer and out_intf_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: out_intf_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

