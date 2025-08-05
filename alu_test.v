/*  alu_test.v
    ECE/ENGRD 2300, Spring 2014

    Author: Saugata Ghose
    Last modified: March 28, 2014

    Description: Skeleton test bench for ALU circuit.
*/

// sets the granularity at which we simulate
`timescale 1 ns / 1 ps


// name of the top-level module; for us it should always be <module name>_test
// this top-level module should have no inputs or outputs; only internal signals are needed
module alu_test();

  // for all of your input pins, declare them as type reg, and name them identically to the pins
  reg  [7:0]  A;
  reg  [7:0]  B;
  reg  [2:0]  FS;

  // for all of your output pins, declare them as type wire so ModelSim can display them
  wire [7:0]  Y;
  wire        C;
  wire        V;
  wire        N;
  wire        Z;


  // declare a sub-circuit instance (Unit Under Test) of the circuit that you designed
  // make sure to include all ports you want to see, and connect them to the variables above
  alu UUT(
    .A(A),
    .B(B),
    .FS(FS),
    .Y(Y),
    .C(C),
    .V(V),
    .N(N),
    .Z(Z) // remember - no comma after the last port
  );

  // ALL of the initial and always blocks below will work in parallel.
  //   Starting at time t = 0, they will all start counting the number
  //   of ticks.


  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by delays that are multiples of #100, so we can see
  //    the output for at least one cycle (since we chose a 10 MHz clock)
  initial
  begin
    // Initial values
    A  = 8'h0;
    B  = 8'h0;
    FS = 3'b000;

    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #100;


    // EXAMPLE TEST CASE: this is the beginning of the first test case

    // it includes input values...
    A  = 8'h01;
    B  = 8'hff;
    FS = 3'b011;  // SRL

    // ... it includes a wait...
    #100;  // wait for input signals to propagate through circuit

    // ... and it includes a statement that checks all of the outputs against the values we expect, and prints whether the operation was correct
    $display("MSIM>");
    if(Y == 8'h0 && C == 1'b1 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> SRL (FS = %3b) is correct for A = %2h, B = %2h: Y = %2h, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      // note that we have to fill in the expected values by hand here, so we can make sure what our outputs should have been
      $display("MSIM> ERROR: SRL (FS = %3b) is incorrect for A = %2h, B = %2h: Y = %2h (should be 0), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");

    // EXAMPLE TEST CASE: this is the end of the first test case


    A  = 8'haa;
    B  = 8'hc3;
    FS = 3'b101;  // AND

    #100;  // wait for input signals to propagate through circuit

    $display("MSIM>");
    if(Y == 8'h82 && C == 1'b0 && V == 1'b0 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> AND (FS = %3b) is correct for A = %2h, B = %2h: Y = %2h, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: AND (FS = %3b) is incorrect for A = %2h, B = %2h: Y = %2h (should be 82), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");


    /* ADD YOUR TEST CASES BELOW THIS LINE */
	
	//SRL TESTS
	//TEST 1 (8 Bit Shift 0 Out)
	A = 8'b00010000;
	B = 8'd0;
	FS = 3'b011;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b00001000 && C == 1'b0 && V == 1'b0 && N == 1'b0 && Z == 1'b0) begin
      $display("MSIM> SRL (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SRL (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00001000), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 //TEST 2 (Shift 1 Out)
	A = 8'b00000001;
	B = 8'd0;
	FS = 3'b011;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b00000000 && C == 1'b1 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> SRL (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SRL (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00000000), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 //SRA TESTS
	 //TEST 1 (C = 1, CI = 0)
	A = 8'b00000001;
	B = 8'd0;
	FS = 3'b010;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b00000000 && C == 1'b1 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> SRA (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SRA (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00000000), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 //TEST 2 (C = 0, CI = 1)
	A = 8'b10000000;
	B = 8'd0;
	FS = 3'b010;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b11000000 && C == 1'b0 && V == 1'b0 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> SRA (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SRA (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 11000000), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 //SLL TESTS
	 //TEST 1 (C = 1, Z = 1)
	A = 8'b10000000;
	B = 8'd0;
	FS = 3'b100;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b00000000 && C == 1'b1 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> SLL (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SLL (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00000000), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 //TEST 2 (C = 1, Z = 0, N = 1
	A = 8'b11010000;
	B = 8'd0;
	FS = 3'b100;
	
	#100
	
	    $display("MSIM>");
    if(Y == 8'b10100000 && C == 1'b1 && V == 1'b0 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> SLL (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end
    else begin
      $display("MSIM> ERROR: SLL (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 10100000), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 // ADD TEST CASES
	 // TEST 1 
    A  = 8'b00010000;  
    B  = 8'b00100000;  
    FS = 3'b000;       
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b00110000 && C == 1'b0 && V == 1'b0 && N == 1'b0 && Z == 1'b0) begin
      $display("MSIM> ADD (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: ADD (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00110000), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 // TEST 2 (Overflow test)
	 A  = 8'b01111111;  
    B  = 8'b00000001;  
    FS = 3'b000;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b10000000 && C == 1'b0 && V == 1'b1 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> ADD (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: ADD (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 10000000), C = %1b (should be 0), V = %1b (should be 1), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 // SUB TEST CASES
	 // TEST CASE 1
	 A  = 8'b00010000;  
    B  = 8'b00000001;  
    FS = 3'b001;       
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b00001111 && C == 1'b1 && V == 1'b0 && N == 1'b0 && Z == 1'b0) begin
      $display("MSIM> SUB (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: SUB (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00001111), C = %1b (should be 1), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 // TEST CASE 2 (result negative)
	 A  = 8'b00000001;
    B  = 8'b00000010;
    FS = 3'b001;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b11111111 && C == 1'b0 && V == 1'b0 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> SUB (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: SUB (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 11111111), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 // AND TEST CASES
	 // TEST CASE 1
	 A  = 8'b10101010;
    B  = 8'b00001111;
    FS = 3'b101;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b00001010 && C == 1'b0 && V == 1'b0 && N == 1'b0 && Z == 1'b0) begin
      $display("MSIM> AND (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: AND (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00001010), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 // TEST CASE 2 (zero result)
	 A  = 8'b11110000;
    B  = 8'b00001111;
    FS = 3'b101;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b00000000 && C == 1'b0 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> AND (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: AND (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00000000), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 
	 // OR TEST CASES
	 // TEST CASE 1
    A  = 8'b10100000;
    B  = 8'b00001111;
    FS = 3'b110;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b10101111 && C == 1'b0 && V == 1'b0 && N == 1'b1 && Z == 1'b0) begin
      $display("MSIM> OR (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: OR (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 10101111), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 1), Z = %1b (should be 0)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
	 // TEST CASE 2 (zero result)
	 A  = 8'b00000000;
    B  = 8'b00000000;
    FS = 3'b110;
	 
    #100;
	 
		$display("MSIM>");
    if(Y == 8'b00000000 && C == 1'b0 && V == 1'b0 && N == 1'b0 && Z == 1'b1) begin
      $display("MSIM> OR (FS = %3b) is correct for A = %8b, B = %8b: Y = %8b, C = %1b, V = %1b, N = %1b, Z = %1b", FS, A, B, Y, C, V, N, Z);
    end else begin
      $display("MSIM> ERROR: OR (FS = %3b) is incorrect for A = %8b, B = %8b: Y = %8b (should be 00000000), C = %1b (should be 0), V = %1b (should be 0), N = %1b (should be 0), Z = %1b (should be 1)", FS, A, B, Y, C, V, N, Z);
    end
    $display("MSIM>");
    /* ADD YOUR TEST CASES ABOVE THIS LINE */
	

    // Once our tests are done, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
