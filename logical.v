module logical(A, B, OA, Y);

  // inputs
  input [7:0] A, B;
  input OA;

  // outputs
  output [7:0] Y;
  reg [7:0] tempY;
  
  assign Y = tempY;
  
  always @ (*) begin
  
	 if (OA == 0) tempY <= A | B;
	 else tempY <= A & B;
	 
  end
  

endmodule
