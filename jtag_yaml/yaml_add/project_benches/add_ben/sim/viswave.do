 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { agent_in }
wave add uvm_test_top.environment.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group agent_in_bus
wave add -group agent_in_bus hdl_top.agent_in_bus.* -radix hexadecimal -tag F0
wave group agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { agent_out }
wave add uvm_test_top.environment.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group agent_out_bus
wave add -group agent_out_bus hdl_top.agent_out_bus.* -radix hexadecimal -tag F0
wave group agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

