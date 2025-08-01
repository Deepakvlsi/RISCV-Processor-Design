module ALU (
  input signed [31:0] operand_1,
  input signed [31:0] operand_2,
  input [4:0] ALU_control,
  output reg signed [31:0] result,
  output zero,                           // Flag: 1 if result is zero
  output neg,                           // Flag: 1 if result is negative
  output less_than);                     //  Flag: 1 if operand_1 < operand_2 (unsigned)

  // combinational logic for alu operations

  always @ (*) begin
    case (ALU_control)
      5'b00000: result = operand_1 + operand_2;             // Addition
      5'b00010: result = operand_1 - operand_2;             // Substraction
      5'b00100: result = operand_1 << operand_2[4:0];       // SLL: Shift Left Logical
      5'b01000: result = (operand_1 < operand_2) ? 1 : 0;  // SLT: Set if less than (signed)
      5'b01100: result = ($unsigned(operand_1) < $unsigned(operand_2)) ? 1 : 0;      // SLTU: Set if less than (unsigned)
      5'b10000: result = operand_1 ^ operand_2;           // XOR: Bitwise XOR
      5'b10100: result = operand_1 >> operand_2[4:0];     // SRL: Shift right logical
      5'b10110: result = operand_1 >>> operand_2[4:0];    // SRA: Shift Right Arithmetic
      5'b11000: result = operand_1 | operand_2;           // OR: Bitwise OR
      5'b11100: result = operand_1 & operand_2;           // AND: Bitwise AND
      5'b01010: result = operand_1 * operand_2;           // MUL: Multiplication
      default: result = 0;                                // Default: output 0 for undefined control
    endcase
  end
  assign zero = (result == 0);                           // set zero flag if result = 0
  assign neg = (result < 0);                             // set neg flag if result is negative
  assign less_than = ($unsigned(operand_1) < $unsigned(operand_2));     // Sets less_than to 1 if operand_1 is less than operand_2 using unsigned comparison, for instructions like SLTU/BLTU.
endmodule
  
