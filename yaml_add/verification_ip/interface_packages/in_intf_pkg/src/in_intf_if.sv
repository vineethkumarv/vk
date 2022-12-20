//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the in_intf interface signals.
//      It is instantiated once per in_intf bus.  Bus Functional Models, 
//      BFM's named in_intf_driver_bfm, are used to drive signals on the bus.
//      BFM's named in_intf_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(in_intf_bus.a), // Agent input 
// .dut_signal_port(in_intf_bus.b), // Agent input 

import uvmf_base_pkg_hdl::*;
import in_intf_pkg_hdl::*;

interface  in_intf_if 

  (
  input clock, 
  input reset,
  inout logic [3:0] a,
  inout logic [3:0] b
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input a,
  input b
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input a,
  input b
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output a,
  output b
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

