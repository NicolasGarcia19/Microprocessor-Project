module alu(A, B, FS, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  FS;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  
  wire BSEL;
  wire CISEL;
  wire [1:0] OSEL;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOGICAL_OA;
  wire [1:0] CSEL;
  
  
  wire [7:0] BOUT;
  assign BOUT = BSEL ? ~B : B;
  
  wire CARRYOUT;
  wire SHIFTOUT;
  assign C = (CSEL == 2'b00)? CARRYOUT : ((CSEL == 2'b01)? 0 : SHIFTOUT);
  
  wire [7:0] ADDOUT;
  wire [7:0] SHIFTOUTPUT;
  wire [7:0] LOGICOUT;
  
  assign Y = (OSEL == 2'b00)? ADDOUT : ((OSEL == 2'b01)? SHIFTOUTPUT : LOGICOUT);
  
  assign N = Y[7];
  assign Z = (Y == 8'b00000000);
  
  /* ADD YOUR CODE BELOW THIS LINE */

  adder ad(
    .A(A),
    .B(BOUT),
    .CI(CISEL),
    .Y(ADDOUT),
    .C(CARRYOUT),
    .V(V),
	 .FS(FS)
  );
  control co(
    .FS(FS),
	 .BSEL(BSEL),
	 .CISEL(CISEL),
	 .CSEL(CSEL),
	 .OSEL(OSEL),
	 .SHIFT_LA(SHIFT_LA),
	 .SHIFT_LR(SHIFT_LR),
	 .LOGICAL_OA(LOGICAL_OA)
  );
  shifter sh(
    .A(A),
	 .LA(SHIFT_LA),
	 .LR(SHIFT_LR),
	 .Y(SHIFTOUTPUT),
	 .C(SHIFTOUT)
  );
  logical lo(
    .A(A),
	 .B(BOUT),
	 .OA(LOGICAL_OA),
	 .Y(LOGICOUT)
  );
  

  /* ADD YOUR CODE ABOVE THIS LINE */


endmodule
