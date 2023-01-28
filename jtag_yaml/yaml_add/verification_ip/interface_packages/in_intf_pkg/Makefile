# in_intf interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

in_intf_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_hvl.f 

in_intf_PKG_HDL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_hdl.f 

in_intf_PKG_XRTL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/in_intf_filelist_xrtl.f 

COMP_in_intf_PKG_TGT_0 = q_comp_in_intf_pkg
COMP_in_intf_PKG_TGT_1 = v_comp_in_intf_pkg
COMP_in_intf_PKG_TGT = $(COMP_in_intf_PKG_TGT_$(USE_VELOCE))

comp_in_intf_pkg: $(COMP_in_intf_PKG_TGT) 

q_comp_in_intf_pkg:
	$(HDL_COMP_CMD) $(in_intf_PKG_HDL)
	$(HVL_COMP_CMD) $(in_intf_PKG)
	$(HDL_COMP_CMD) $(in_intf_PKG_XRTL) 

v_comp_in_intf_pkg:
	$(HVL_COMP_CMD) $(in_intf_PKG_HDL)
	$(HVL_COMP_CMD) $(in_intf_PKG)
	$(VELANALYZE_CMD) $(in_intf_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(in_intf_PKG) 
	$(HDL_COMP_CMD) $(in_intf_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export in_intf_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/in_intf_pkg/dpi

C_FILE_COMPILE_LIST_in_intf_pkg	= \

O_FILE_COMPILE_LIST_in_intf_pkg = $(notdir $(C_FILE_COMPILE_LIST_in_intf_pkg:.c=.o))

GCC_COMP_ARGS_in_intf_pkg	+= -I$(in_intf_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_in_intf_pkg	+= $(in_intf_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_in_intf_pkg	+= \
	 \
 	-o .so

comp_in_intf_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_in_intf_pkg) $(C_FILE_COMPILE_LIST_in_intf_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_in_intf_pkg) $(O_FILE_COMPILE_LIST_in_intf_pkg)
	@echo "--------------------------------"

