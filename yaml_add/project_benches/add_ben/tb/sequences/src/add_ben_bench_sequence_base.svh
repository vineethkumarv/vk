//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//


typedef add_env_env_configuration  add_env_env_configuration_t;

class add_ben_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( add_ben_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef add_env_env_sequence_base #(
        .CONFIG_T(add_env_env_configuration_t)
        )
        add_env_env_sequence_base_t;
rand add_env_env_sequence_base_t add_env_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef in_intf_random_sequence  agent_in_random_seq_t;
  agent_in_random_seq_t agent_in_random_seq;
  typedef out_intf_random_sequence  agent_out_random_seq_t;
  agent_out_random_seq_t agent_out_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef in_intf_transaction  agent_in_transaction_t;
  uvm_sequencer #(agent_in_transaction_t)  agent_in_sequencer; 
  typedef out_intf_transaction  agent_out_transaction_t;
  uvm_sequencer #(agent_out_transaction_t)  agent_out_sequencer; 


  // Top level environment configuration handle
  add_env_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  in_intf_configuration  agent_in_config;
  out_intf_configuration  agent_out_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(add_env_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(add_env_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( in_intf_configuration )::get( null , UVMF_CONFIGURATIONS , agent_in_BFM , agent_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( in_intf_configuration )::get cannot find resource agent_in_BFM" )
    if( !uvm_config_db #( out_intf_configuration )::get( null , UVMF_CONFIGURATIONS , agent_out_BFM , agent_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( out_intf_configuration )::get cannot find resource agent_out_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    agent_in_sequencer = agent_in_config.get_sequencer();
    agent_out_sequencer = agent_out_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    add_env_env_seq = add_env_env_sequence_base_t::type_id::create("add_env_env_seq");

    agent_in_random_seq     = agent_in_random_seq_t::type_id::create("agent_in_random_seq");
    agent_out_random_seq     = agent_out_random_seq_t::type_id::create("agent_out_random_seq");
    fork
      agent_in_config.wait_for_reset();
      agent_out_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) agent_in_random_seq.start(agent_in_sequencer);
      repeat (25) agent_out_random_seq.start(agent_out_sequencer);
    join

add_env_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      agent_in_config.wait_for_num_clocks(400);
      agent_out_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

