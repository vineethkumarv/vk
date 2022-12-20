//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that will run on the host simulator.
//
// CONTAINS:
//    - <in_intf_typedefs_hdl>
//    - <in_intf_typedefs.svh>
//    - <in_intf_transaction.svh>

//    - <in_intf_configuration.svh>
//    - <in_intf_driver.svh>
//    - <in_intf_monitor.svh>

//    - <in_intf_transaction_coverage.svh>
//    - <in_intf_sequence_base.svh>
//    - <in_intf_random_sequence.svh>

//    - <in_intf_responder_sequence.svh>
//    - <in_intf2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package in_intf_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import in_intf_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export in_intf_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/in_intf_typedefs.svh"
   `include "src/in_intf_transaction.svh"

   `include "src/in_intf_configuration.svh"
   `include "src/in_intf_driver.svh"
   `include "src/in_intf_monitor.svh"

   `include "src/in_intf_transaction_coverage.svh"
   `include "src/in_intf_sequence_base.svh"
   `include "src/in_intf_random_sequence.svh"

   `include "src/in_intf_responder_sequence.svh"
   `include "src/in_intf2reg_adapter.svh"

   `include "src/in_intf_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

