module reg_file
  (input clk,
   input rst,
   input [4:0]read_address1,
   input [4:0]read_address2,
   input [4:0]write_address,
   input [31:0]write_data,
   input write_enable,
   output [31:0]read_data_1,
   output [31:0]read_data_2);
  reg [31:0] reg_file [0:31];              // Creates 32 registers (x0…x31), each 32 bits wide
  integer i;                               // i is a loop index for reset
   // Synchronous write and reset logic
  always @ (negedge clk) begin                   // negedge separates write timing from the rest of the pipeline (which typically uses posedge clk), avoiding a race between read and write in the same cycle.
    if (rst) begin                                // reset will make every register zero, then sets x2 to 0x500.
      for (i=0; i < 32; i=i+1) begin            // This loops through indices 0 to 31
        reg_file[i] <= 0;                        //This sets the register at index i to zero during each loop iteration ( The for loop is used inside the reset block to initialize all 32 registers to zero at once)
      end
      reg_file[2] <= 32'h00000500;          // In RISC‑V’s calling convention, x2 is the stack pointer (sp), which always points to the top of the current stack frame. On reset you need some valid “home address” for your stack so that any early pushes (e.g. on function entry or for interrupt handling) go somewhere safe.
    end
    else if (write_enable && write_address != 0) begin     // When write_enable high and write_address≠0, writes write_data into the specified register. x0 remains hardwired to zero.
      reg_file [write_address] <= write_data;
    end
  end
  //Asynchronous read logic
// If the read address is 0, the expression yields 0; otherwise it uses reg_file[read_address].
// RISC‑V’s rule that register x0 always reads as zero, even if it’s (mistakenly) written.
// As assign statements, outputs update immediately on any address or data change, giving zero‑cycle access.
  assign read_data_1 = (read_address_1 == 0) ? 0 : reg_file[read_address_1]; 
    assign read_data_2 = (read_address_2 == 0) ? 0 : reg_file[read_address_2]; 
endmodule
  
