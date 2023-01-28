//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the out_intf interface signals.
//      It is instantiated once per out_intf bus.  Bus Functional Models, 
//      BFM's named out_intf_driver_bfm, are used to drive signals on the bus.
//      BFM's named out_intf_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(out_intf_bus.cout), // Agent inout 
// .dut_signal_port(out_intf_bus.sum), // Agent inout 

import uvmf_base_pkg_hdl::*;
import out_intf_pkg_hdl::*;

interface  out_intf_if 

  (
  input clock, 
  input reset,
  inout logic  cout,
  inout logic [3:0] sum
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input cout,
  input sum
  );

modport initiator_port 
  (
  input clock,
  input reset,
  inout cout,
  inout sum
  );

modport responder_port 
  (
  input clock,
  input reset,  
  inout cout,
  inout sum
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

