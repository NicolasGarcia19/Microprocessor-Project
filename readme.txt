# Single-Cycle Microprocessor Design on FPGA

A complete single-cycle microprocessor implementation in Verilog, designed for FPGA deployment using Quartus. This project demonstrates a working processor capable of executing multi-instruction programs with branching and halting functionality, completing the entire fetch-decode-execute-writeback cycle in one clock period.

## Architecture Overview

The processor implements a single-cycle datapath with modular components designed for clean separation and maintainability. All instructions execute in a single clock cycle without requiring hardware modification between different programs.

## Key Components

Based on the implemented design, the processor includes:

### Core Processing Units
- **Program Counter (PC)**: Manages instruction sequencing and program flow
- **Instruction Memory**: Stores program instructions 
- **Register File**: Multi-port register storage for operands
- **Arithmetic Logic Unit (ALU)**: Performs arithmetic and logical operations
- **Data Memory (Data RAM)**: Handles load and store operations with read/write capability

### Control Logic
- **Instruction Decoder**: Generates control signals from instruction opcodes
- **Control Logic**: Manages datapath operation and component coordination
- **PC Selection Logic (PCSEL)**: Handles sequential execution and branching
- **Sign Extension**: Formats immediate values for different instruction types

### Supporting Infrastructure
- **Data Path Multiplexers**: Route data between functional units
- **Halt Logic**: Provides controlled program termination capability

## Features

- ✅ **Single-cycle execution**: Complete fetch-decode-execute-writeback in one clock period
- ✅ **Modular component design**: Program counter, instruction decoder, register file, ALU, data memory, and control logic
- ✅ **Multi-instruction program support**: Capable of running complete programs
- ✅ **Branching functionality**: Support for program flow control
- ✅ **Halting capability**: Controlled program termination
- ✅ **No hardware modification required**: Programs can be changed without altering the processor design

## Development Tools

- **HDL**: Verilog
- **Synthesis & Implementation**: Quartus
- **Target Platform**: FPGA development board
- **Architecture**: Single-cycle microprocessor design

## Technical Implementation

The processor demonstrates the complete single-cycle microprocessor architecture:

1. **Fetch**: Instructions retrieved from instruction memory using program counter
2. **Decode**: Control logic interprets instructions and generates appropriate signals  
3. **Execute**: ALU performs operations while data memory handles load/store instructions
4. **Writeback**: Results written back to register file
5. **PC Update**: Program counter updated for next instruction (sequential or branch target)

All stages complete within a single clock cycle, enabling predictable timing and straightforward control logic.

## Project Structure

The implementation consists of modular Verilog components that can be easily maintained and extended:

- Program Counter logic
- Instruction decoder and control unit
- Register file implementation  
- ALU design
- Data memory interface
- Control signal generation

## Testing & Validation

The design has been validated through:
- **Multi-instruction program execution**: Verified capability to run complete programs
- **Branching verification**: Tested conditional and unconditional program flow changes
- **Halt functionality**: Confirmed proper program termination
- **FPGA deployment**: Successfully implemented and tested on FPGA hardware
- **Single-cycle operation**: Verified complete instruction execution in one clock period


---

*This project showcases practical implementation of computer architecture principles through hands-on FPGA development, demonstrating both digital logic design skills and understanding of processor fundamentals.*
