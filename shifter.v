module shifter(A, LA, LR, Y, C);

  // inputs
  input [7:0] A;
  input LA, LR;

  // outputs
  output [7:0] Y;
  output C;

  /* ADD YOUR CODE BELOW THIS LINE */
  reg temp_C;
  assign C = temp_C;
  reg [7:0] temp_Y;
  assign Y = temp_Y;

  
	always @(*) begin
		if (LR == 0) begin
			temp_Y[7] <= A[6];
			temp_Y[6] <= A[5];
			temp_Y[5] <= A[4];
			temp_Y[4] <= A[3];
			temp_Y[3] <= A[2];
			temp_Y[2] <= A[1];
			temp_Y[1] <= A[0];
			temp_Y[0] <= 0;
			temp_C <= A[7];
		end else begin
			temp_Y[0] <= A[1];
			temp_Y[1] <= A[2];
			temp_Y[2] <= A[3];
			temp_Y[3] <= A[4];
			temp_Y[4] <= A[5];
			temp_Y[5] <= A[6];
			temp_Y[6] <= A[7];
			if (LA == 0) temp_Y[7] <= 0;
			else temp_Y[7] <= A[7];
			temp_C <= A[0];
		end
	end
  /* ADD YOUR CODE ABOVE THIS LINE */

endmodule
