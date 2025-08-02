module imm_extend 
  ( input [31:7] imm,
   input [2:0] imm_src,
   output reg [31:0]extended_imm);
  // combinational logic for immediate extension
  always @(*) begin
    case (imm_src)
      3'b000 : extended_imm = {imm[31:12], 12'b0};                                       // U-Type: Upper immediate
      3'b001: extended_imm = {{12{imm[31]}}, imm[19:12], imm[20], imm[30:21], 1'b0};      // J-type: Jump
      3'b010: extended_imm = {{20{imm[31]}}, imm[31:25], imm[11:7]};                      // S-type: Store
      3'b011: extended_imm = {{20{imm[31]}}, imm[7], imm[30:25], imm[11:8], 1'b0};          // B-type: Branch
      3'b100: extended_imm = {{20{imm[31]}}, imm[31:20]};                                 // I-type: Immediate
      3'b101: extended_imm = {{27{imm[24]}}, imm[24:20]};                                 // I-type shift
      3'b110: extended_imm = {20'b0, imm[31:20]};                                        // I-type unsigned 
            default: extended_imm = 32'b0;                                       // Default to 0
        endcase
    end
endmodule
