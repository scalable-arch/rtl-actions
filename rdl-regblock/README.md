# Register Automation

Most HW IPs have many CSRs (Control & Status Registers) for the CPU to control the IPs.
Developing a HDL (e.g., Verilog) module for the CSR is a tedious and error-prone job, and documenting the design often lead to a mismatch between the actual design and the documentation.

Register automation can replace the human efforts in CSR management.
[SystemRDL](https://www.accellera.org/downloads/standards/systemrdl) is a register description language for register automation, and [peakRDL](https://peakrdl.readthedocs.io/) is an open-source tool to generate various outputs (e.g., HDL design, UVM, documents) from systemRDL.

[A brief introduction to register automation](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/Register%20Automation.pdf)

[SystemRDL example for a DMA controller](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/dmac.rdl)

# Action

This action can receive the following inputs.

## rdl (optional)

The location of a .rdl file. The path is a relative path within the HW_IP_REPO.

If the action does not provide this input, the script will try to find one among env.source files.

## cfg (optional)

The location of a peakRDL configuration file. The configuration file is used to fine-tune output generation of peakRDL (e.g., whether the generated HDL module receives an active-high or active-low reset).

If the action does not provide this input, the script will try to find one among env.source files.

## top (optional)

The top-level addressMap in the .rdl file.

If the action does not provide this input, the script will try to find one among env.source files. Still none is found, it will use the last address map.

## cpuif (optional)

The CPU interface of the generated HDL module.
Supported options are ```apb3, apb3_flat, apb4, apb4-flat, axi4_lite, axi4_lite_flat, avalon-mm, avalon-mm-flat, passthrough``` (or any other that peakRDL supports)

## out (optional)

The file name for the generated output Verilog file.
