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
//    - <out_intf_typedefs_hdl>
//    - <out_intf_typedefs.svh>
//    - <out_intf_transaction.svh>

//    - <out_intf_configuration.svh>
//    - <out_intf_driver.svh>
//    - <out_intf_monitor.svh>

//    - <out_intf_transaction_coverage.svh>
//    - <out_intf_sequence_base.svh>
//    - <out_intf_random_sequence.svh>

//    - <out_intf_responder_sequence.svh>
//    - <out_intf2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package out_intf_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import out_intf_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export out_intf_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/out_intf_typedefs.svh"
   `include "src/out_intf_transaction.svh"

   `include "src/out_intf_configuration.svh"
   `include "src/out_intf_driver.svh"
   `include "src/out_intf_monitor.svh"

   `include "src/out_intf_transaction_coverage.svh"
   `include "src/out_intf_sequence_base.svh"
   `include "src/out_intf_random_sequence.svh"

   `include "src/out_intf_responder_sequence.svh"
   `include "src/out_intf2reg_adapter.svh"

   `include "src/out_intf_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

