module control(FS, BSEL, CISEL, CSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OA); // add other outputs here

  // inputs
  input  [2:0]  FS;

  // constants for the function select
  // good practice that helps readablity
  // and save you from typing lots of numerical constants
  localparam FS_ADD = 3'b000;
  localparam FS_SUB = 3'b001;
  localparam FS_SRA = 3'b010;
  localparam FS_SRL = 3'b011;
  localparam FS_SLL = 3'b100;
  localparam FS_AND = 3'b101;
  localparam FS_OR  = 3'b110;

  /* ADD YOUR CODE BELOW THIS LINE */

  // outputs (add others here)
  output reg BSEL;
  output reg CISEL;
  output reg [1:0] CSEL;
  output reg [1:0] OSEL;
  output reg SHIFT_LA;
  output reg SHIFT_LR;
  output reg LOGICAL_OA;

  // constants for outputs (you can add more)
  // good practice that helps readablity
  // and save you from typing lots of numerical constants
  localparam BSEL_B  = 1'b0;
  localparam BSEL_BN = 1'b1;
  
  localparam CSEL_ADD = 2'b00;
  localparam CSEL_SHIFT = 2'b10;
  localparam CSEL_LOGIC = 2'b01;
  
  localparam OSEL_ADD = 2'b00;
  localparam OSEL_SHIFT = 2'b01;
  localparam OSEL_LOGIC = 2'b10;
  

  // internal variables (you can add more)
  
  
  // implement the control logic here
  always @(*) begin
    case (FS)
      FS_ADD: begin
        BSEL = BSEL_B;
		  CISEL = 0;
		  CSEL = CSEL_ADD;
		  OSEL = OSEL_ADD;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 0;
      end
      FS_SUB: begin
        BSEL = BSEL_BN;
		  CISEL = 1;
		  CSEL = CSEL_ADD;
		  OSEL = OSEL_ADD;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 0;
      end
		FS_SRA: begin
		  BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_SHIFT;
		  OSEL = OSEL_SHIFT;
		  SHIFT_LA = 1;
		  SHIFT_LR = 1;
		  LOGICAL_OA = 0;
		end
		FS_SRL: begin
		  BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_SHIFT;
		  OSEL = OSEL_SHIFT;
		  SHIFT_LA = 0;
		  SHIFT_LR = 1;
		  LOGICAL_OA = 0;
		end
		FS_SLL: begin
		  BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_SHIFT;
		  OSEL = OSEL_SHIFT;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 0;
		end
		FS_AND: begin
		  BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_LOGIC;
		  OSEL = OSEL_LOGIC;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 1;
		end
		FS_OR: begin
		  BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_LOGIC;
		  OSEL = OSEL_LOGIC;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 0;
		end

      default: begin
        BSEL = 0;
		  CISEL = 0;
		  CSEL = CSEL_LOGIC;
		  OSEL = OSEL_LOGIC;
		  SHIFT_LA = 0;
		  SHIFT_LR = 0;
		  LOGICAL_OA = 0;
		  
      end
    endcase
  end

  /* ADD YOUR CODE ABOVE THIS LINE */

endmodule
