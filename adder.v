module adder(A, B, CI, Y, C, V, FS);

  // inputs
  input [7:0] A, B;
  input [2:0] FS;
  input CI;

  // outputs
  output [7:0] Y;
  output C, V;

  /* ADD YOUR CODE BELOW THIS LINE */
  
  wire CO0;
  wire CO1;
  wire CO2;
  wire CO3;
  wire CO4;
  wire CO5;
  wire CO6;
  
  assign V = (FS == 3'b000 | FS == 3'b001)?(CO6 ^ C):0;
  
  
  adder1bit bit0(
    .A(A[0]),
	 .B(B[0]),
	 .CI(CI),
	 .Y(Y[0]),
	 .CO(CO0)
  );
  adder1bit bit1(
    .A(A[1]),
	 .B(B[1]),
	 .CI(CO0),
	 .Y(Y[1]),
	 .CO(CO1)
  );
  adder1bit bit2(
    .A(A[2]),
	 .B(B[2]),
	 .CI(CO1),
	 .Y(Y[2]),
	 .CO(CO2)
  );
  adder1bit bit3(
    .A(A[3]),
	 .B(B[3]),
	 .CI(CO2),
	 .Y(Y[3]),
	 .CO(CO3)
  );
  adder1bit bit4(
    .A(A[4]),
	 .B(B[4]),
	 .CI(CO3),
	 .Y(Y[4]),
	 .CO(CO4)
  );
  adder1bit bit5(
    .A(A[5]),
	 .B(B[5]),
	 .CI(CO4),
	 .Y(Y[5]),
	 .CO(CO5)
  );
  adder1bit bit6(
    .A(A[6]),
	 .B(B[6]),
	 .CI(CO5),
	 .Y(Y[6]),
	 .CO(CO6)
  );
  adder1bit bit7(
    .A(A[7]),
	 .B(B[7]),
	 .CI(CO6),
	 .Y(Y[7]),
	 .CO(C)
  );
  
  
  
  
  
  
  
  /* ADD YOUR CODE ABOVE THIS LINE */


endmodule
