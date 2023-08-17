# Register Automation

Most HW IPs have many CSRs (Control & Status Registers) for the CPU to control the IPs.
Developing a HDL (e.g., Verilog) module for the CSR is a tedious and error-prone job, and documenting the design often lead to a mismatch between the actual design and the documentation.

Register automation can replace the human efforts in CSR management.
[SystemRDL](https://www.accellera.org/downloads/standards/systemrdl) is a register description language for register automation, and [peakRDL](https://peakrdl.readthedocs.io/) is an open-source tool to generate various outputs (e.g., HDL design, UVM, documents) from systemRDL.

[A brief introduction to register automation](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/Register%20Automation.pdf)

[SystemRDL example for a DMA controller](https://github.com/scalable-arch/rtl-actions/blob/main/rdl-regblock/docs/dmac.rdl)
