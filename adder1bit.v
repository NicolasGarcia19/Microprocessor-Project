module adder1bit (A,B,CI,Y,CO);

//inputs
input A,B;
input CI;

output Y,CO;


reg tempY;
reg tempCO;

assign CO = tempCO;
assign Y = tempY;

always @ (*) begin

  tempY <= (CI ^ (A ^ B));
  tempCO <= ((A & B) | (A & CI) | (B & CI));

end




endmodule
