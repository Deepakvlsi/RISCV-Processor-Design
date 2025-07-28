module imem 
  (input [31:0]addr,                // Instruction address
   output reg [31:0]instruction);   // Fetched instruction
  always @ (*) begin
    case (addr >> 2)
            0:  instruction = 32'h00500113; // ADDI x2, x0, 5
            1:  instruction = 32'h00C00193; // ADDI x3, x0, 12
            2:  instruction = 32'hFF718393; // ADDI x7, x3, -9
            3:  instruction = 32'h0023E233; // OR x4, x7, x2
            4:  instruction = 32'h0041F2B3; // AND x5, x3, x4
            5:  instruction = 32'h004282B3; // ADD x5, x5, x4
            6:  instruction = 32'h02728863; // BEQ x5, x7, 16
            7:  instruction = 32'h0041A233; // SLT x4, x3, x4
            8:  instruction = 32'h00020463; // BEQ x4, x0, 8
            9:  instruction = 32'h00000293; // ADDI x5, x0, 0
            10: instruction = 32'h0023A233; // SLT x4, x7, x2
            11: instruction = 32'h005203B3; // ADD x7, x4, x5
            12: instruction = 32'h402383B3; // SUB x7, x7, x2
            13: instruction = 32'h0471AA23; // SW x7, 84(x3)
            14: instruction = 32'h06002103; // LW x2, 96(x0)
            15: instruction = 32'h005104B3; // ADD x9, x2, x5
            16: instruction = 32'h008001EF; // JAL x3, 8
            17: instruction = 32'h00100113; // ADDI x2, x0, 1
            18: instruction = 32'h00910133; // ADD x2, x2, x9
            19: instruction = 32'h0221A023; // SW x2, 32(x3)
            20: instruction = 32'h00210063; // BEQ x2, x2, 0
            default: instruction = 32'h00000000; // NOP for undefined addresses
        endcase
    end
endmodule
