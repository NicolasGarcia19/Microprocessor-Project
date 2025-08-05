module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, HLT, BS, OFF); // add outputs

input [15:0] INST;

/* ADD YOUR CODE BELOW THIS LINE */

output reg [2:0] DR;
output reg [2:0] SA;
output reg [2:0] SB;
output reg [5:0] IMM;
output reg MB;
output reg [2:0] FS;
output reg MD;
output reg LD;
output reg MW;
output reg HLT;
output reg [2:0] BS;
output reg [5:0] OFF;


/* ADD YOUR CODE ABOVE THIS LINE */

// parse the instruction feilds
wire [3:0] OP;
wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [2:0] FUNCT;
wire [5:0] IMM_INST;

assign OP = INST[15:12];
assign RS = INST[11:9];
assign RT = INST[8:6];
assign RD = INST[5:3];
assign FUNCT = INST[2:0];
assign IMM_INST = INST[5:0];

/* ADD YOUR CODE BELOW THIS LINE */

always @(*) begin
	case (OP)
	// implement decoder logic here
		4'b0000: begin // NOP & HLT
			DR = 3'b000;
			SA = 3'b000;
			SB = 3'b000;
			IMM = 6'b000000;
			MB = 0;
			FS = FUNCT;
			MD = 0;
			LD = 0;
			MW = 0;
			HLT = (FUNCT == 3'b001)?1:0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		4'b0010: begin // load byte 
			DR = RT;
			SA = RS;
			SB = 3'b000;
			IMM = IMM_INST;
			MB = 1;
			FS = 3'b000;
			MD = 1;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		4'b0100: begin // store byte 	
			DR = RT;
			SA = RS;
			SB = RT;
			IMM = IMM_INST;
			MB = 1;
			FS = 3'b000;
			MD = 0;
			LD = 0;
			MW = 1;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		4'b0101: begin // add IMM
			DR = RT;
			SA = RS;
			SB = 3'b000;
			IMM = IMM_INST;
			MB = 1;
			FS = 3'b000;
			MD = 0;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		4'b0110: begin // and IMM
			DR = RT;
			SA = RS;
			SB = 3'b000;
			IMM = IMM_INST;
			MB = 1;
			FS = 3'b101;
			MD = 0;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		4'b0111: begin // or IMM
			DR = RT;
			SA = RS;
			SB = 3'b000;
			IMM = IMM_INST;
			MB = 1;
			FS = 3'b110;
			MD = 0;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		// BRANCH FUNCTIONS (NOT IMPLEMENTED YET)
		4'b1000: begin //BEQ
			DR = 3'b000;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 0;
			FS = 3'b001;
			MD = 0;
			LD = 0;
			MW = 0;
			HLT = 0;
			BS = 3'b000;
			OFF = IMM_INST;
		end
		4'b1001: begin //BNE
			DR = 3'b000;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 0;
			FS = 3'b001;
			MD = 0;
			LD = 0;
			MW = 0;
			HLT = 0;
			BS = 3'b001;
			OFF = IMM_INST;
		end
		4'b1010: begin //BGEZ
			DR = 3'b000;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 1;
			FS = 3'b001;
			MD = 0;
			LD = 0;
			MW = 0;
			HLT = 0;
			BS = 3'b010;
			OFF = IMM_INST;
		end
		4'b1011: begin //BLTZ
			DR = 3'b000;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 1;
			FS = 3'b001;
			MD = 0;
			LD = 0;
			MW = 0;
			HLT = 0;
			BS = 3'b011;
			OFF = IMM_INST;
		end
		4'b1111: begin // reg to reg functions
			DR = RD;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 0;
			FS = FUNCT;
			MD = 0;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
		
		
		default: begin // default set to reg to reg functions
			DR = RD;
			SA = RS;
			SB = RT;
			IMM = 6'b000000;
			MB = 0;
			FS = FUNCT;
			MD = 0;
			LD = 1;
			MW = 0;
			HLT = 0;
			BS = 3'b111;
			OFF = 6'b000000;
		end
	endcase

end

/* ADD YOUR CODE ABOVE THIS LINE */

endmodule
