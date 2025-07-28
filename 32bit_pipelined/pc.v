module pc 
  (input clk,
   input rst,
   input EN,
   input [31:0]in,
   input [31:0]out);
  always @ (posedge clk) begin
    if (rst) begin
      out <= 0;
    end 
    else if (!EN) begin          // update pc if not stalled
    out <= in;
  end
  end
endmodule
