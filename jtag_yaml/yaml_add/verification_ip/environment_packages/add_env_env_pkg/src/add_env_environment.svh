//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class add_env_environment  extends uvmf_environment_base #(
    .CONFIG_T( add_env_env_configuration 
  ));
  `uvm_component_utils( add_env_environment )



  uvm_analysis_port #(in_intf_transaction) agent_in_ap;
  uvm_analysis_port #(out_intf_transaction) agent_out_ap;
  uvm_analysis_export #(out_intf_transaction) add_pred_ep;


  typedef in_intf_agent  agent_in_t;
  agent_in_t agent_in;

  typedef out_intf_agent  agent_out_t;
  agent_out_t agent_out;




  typedef add_predictor #(
                .CONFIG_T(CONFIG_T)
                ) add_pred_t;
  add_pred_t add_pred;

  typedef uvmf_in_order_race_scoreboard #(.T(out_intf_transaction))  add_sb_t;
  add_sb_t add_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(add_env_env_configuration)) add_env_vsqr_t;
  add_env_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    agent_in_ap = new("agent_in_ap",this);
    agent_out_ap = new("agent_out_ap",this);
    add_pred_ep = new("add_pred_ep",this);
    agent_in = agent_in_t::type_id::create("agent_in",this);
    agent_in.set_config(configuration.agent_in_config);
    agent_out = agent_out_t::type_id::create("agent_out",this);
    agent_out.set_config(configuration.agent_out_config);
    add_pred = add_pred_t::type_id::create("add_pred",this);
    add_pred.configuration = configuration;
    add_sb = add_sb_t::type_id::create("add_sb",this);

    vsqr = add_env_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    agent_in.monitored_ap.connect(add_pred.agent_in_ae);
    agent_out.monitored_ap.connect(add_sb.actual_analysis_export);
    add_pred.add_sbo_ap.connect(add_sb.expected_analysis_export);
    agent_in.monitored_ap.connect(agent_in_ap);
    agent_out.monitored_ap.connect(agent_out_ap);
    add_pred_ep.connect(add_pred.agent_out_ae);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.add_env_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

