## 32-bit Pipelined RISC-V Processor

This project implements a 32-bit, 5-stage pipelined processor based on the RISC-V RV32I instruction set architecture, including instruction fetch, decode, execute, memory access, and write-back stages. It also integrates control logic and forwarding mechanisms to handle data hazards efficiently.

📌 Features  

✅ RISC-V RV32I Base Instruction Set

✅ 5-stage pipeline: IF, ID, EX, MEM, WB

✅ Data forwarding for hazard mitigation (based on Figure 7.55)

✅ Hazard detection unit (for load-use hazard stalls)

✅ Pipeline registers between each stage

✅ Control unit generating control signals based on instruction decoding

✅ Written in Verilog HDL
