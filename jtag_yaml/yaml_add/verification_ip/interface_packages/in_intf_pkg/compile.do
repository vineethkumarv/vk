# Tcl do file for compile of in_intf interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_hdl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_hvl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_xrtl.f