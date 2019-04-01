module Multiplexer(
	input [7:0] a,
	input [7:0] b, 
	input [7:0] c,
	input [7:0] d,
	input [1:0] S,
	output reg [7:0]f
	
	);
	
	always@(a or b or c or d or S)
	begin
		case(S)
			2'b00 : f = a;
			2'b01 : f = b;	
			2'b10 : f = c;
			2'b11 : f = d;
		endcase
	end
	
endmodule
