module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;

  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;


  /* ADD YOUR CODE BELOW THIS LINE */
  reg [7:0] PC_reg;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire [7:0] IMM_EXT;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire MW;
  wire [2:0] DR;
  wire [7:0] MB_OUT;
  reg EN_PREV;
  wire EN_FALL;
  reg PCSEL;
  wire HALT;
 
  
  // Sign Extend
  assign IMM_EXT = {{2{IMM[5]}}, IMM};
  
  //Test Signal Assignment
  assign PC = PC_reg;
  assign NextPC = PCSEL? PC_reg: PC_reg + 8'd2; // PCSEL Multiplexer
  
  //PC CODE
  always @(posedge CLK) begin
   EN_PREV = EN_L;
	PCSEL = (HALT && !EN_FALL);
	if (RESET == 1) begin
		PC_reg <= 8'b0;
	end
	else if (PCSEL) PC_reg <= PC_reg;
	else PC_reg <= PC_reg + 8'd2;
	end
	
  // PCSEL CODE
  assign EN_FALL = (EN_PREV == 1 && EN_L == 0);
  
  //Multiplexers
  assign DataC = MD?Din:DataD;
  assign MB_OUT = MB?IMM_EXT:DataB;
  
 
  
  
  //MODULE INSTANTIATIONS

	
	decoder dec(
		.INST(Iin),
		.DR(DR),
		.SA(SA),
		.SB(SB),
		.IMM(IMM),
		.MB(MB),
		.FS(FS),
		.MD(MD),
		.LD(LD),
		.MW(MW),
		.HLT(HALT)
	);
	
	regfile regf(
		.CLK(CLK),
		.RESET(RESET),
		.SA(SA),
		.SB(SB),
		.LD(LD),
		.DR(DR),
		.D_in(DataC),
		.DataA(DataA),
		.DataB(DataB)
	);
	
	alu alu(
		.A(DataA),
		.B(MB_OUT),
		.FS(FS),
		.Y(DataD),
		.C(),
		.N(),
		.Z()
	);
		
		
		
  /* ADD YOUR CODE ABOVE THIS LINE */

endmodule
