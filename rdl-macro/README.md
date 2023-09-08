# Register Automation

Most HW IPs have many CSRs (Control & Status Registers) for the CPU to control the IPs.
Developing a HDL (e.g., Verilog) module for the CSR is a tedious and error-prone job, and documenting the design often lead to a mismatch between the actual design and the documentation. Making life even harder, a change in a CSR often requires corresponding modifications to UVM verification codes and firmware.

Register automation can eliminate most of the human efforts in CSR management. SystemRDL is a Register Description Language (RDL) for register automation, and peakRDL is an open-source toolchain to generate various outputs (e.g., Verilog design, UVM classes, html documents) from system RDL.

A few resources
- [SystemRDL standard](https://www.accellera.org/downloads/standards/systemrdl)
- [PeakRDL](https://peakrdl.readthedocs.io/)
- [PeakRDL-regblock](https://peakrdl-regblock.readthedocs.io/)
- [A brief introduction to register automation](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/Register%20Automation.pdf)
- [An example for a DMA controller](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/dmac.rdl)

# GitHub Action

This action can receive the following inputs.

## rdl (optional)

The location of a .rdl file. The path is a relative path within the HW_IP_REPO.

If the action does not provide this input, the script will try to find one among env.source files.

## top (optional)

The top-level addressMap in the .rdl file.

If the action does not provide this input, the script will try to find one among env.source files. Still none is found, it will use the last address map.

## out (optional)

The directory name for the generated output Verilog file. The filename will be the same as the top-level addressMap name with .sv extension.

# Local Action

You can use ```rtl-actions/bin/action.rdl-regblock``` to execute this action from a Command Line Interface (CLI).

This action can receive the following inputs.

## --rdl *systemrdl_file_location* (optional)

Same as rdl in the GitHub action

## --top *top_level_address_map_name* (optional)

Same as top in the GitHub action

## --out *output_directory_name* (optional)

Same as out in the GitHub action
