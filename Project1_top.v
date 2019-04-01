/* Shaswat koirala
	Digital Logic (project1) : ECEN 2350
	arithmetic,logical, comparison and call it magic but its true */

module Project1_top(
	input [1:0]KEY, 
	input [9:0]sw,
	input clk,
	output [7:0]HEX0, 
	output [7:0]HEX1,
	output [7:0]HEX2, 
	output [7:0]HEX3, 
	output [7:0]HEX4, 
	output [7:0]HEX5, 
	output [9:0]led 
	
	);
		
	wire [3:0] X, Y; // inputs 
	wire [7:0] f1, f2, f3; // output 
	wire [1:0] select;  // to select which to implement
	wire [9:0] mg;
	
	
	assign Y[3:0] = sw[3:0]; // y value in binary 
	assign X[3:0] = sw[7:4]; // x value in binary 
	assign select[1:0] = sw[9:8]; // to select  function
		
	reg [1:0] buttons =0;
	
	always @(posedge KEY[0]) // loop from 00 to 11 and in each value a major function is chosen
		begin
			buttons = buttons + 1;
		end
		
	wire c;
	wire [7:0] choice;
	reg [9:0]LEDT;
	
	Arithmetic Arith(X, Y, select, f1, LED); // calling  Arithmetic function with inputs X and Y and select, output a result f1, printed on  HEX0 and HEX1, an led on 9 to show carry - remainder
	Logical log (X, Y, select, f2); // calling the logical function with inputs X and Y and select, output is f2, a result printed on  HEX0 and HEX1.
	Comparison cmp (X, Y, select, f3); // calling the comparison function with inputs X and Y and select, output is f2, a result printed on  HEX0 and HEX1.
	Magic mm(clk,mg);	// coldplay:- call it magic call is true I call it magic when I'm with you Ad I just got broken, broken into two, Still I call it magic when I'm next to you
	Multiplexer choose(f1, f2, f3, mg, buttons, choice); // out all the oututs of the major functions inside a multiplexer which will output on of these output depending on which major function is used  
	
	SevenSegment(choice[3:0], HEX0); // display result
	SevenSegment(choice[7:4], HEX1); // display result
	SevenSegment(X, HEX3); // display X value
	SevenSegment(Y, HEX2); // display Y value
	SevenSegment(select, HEX4); //selection display
	SevenSegment(buttons, HEX5); 
	
	
	always @(KEY)
	begin
	case(buttons)
		0: LEDT[9] <= LED;
		1: LEDT[9:0] <=0;
		2: LEDT[9:0] <=0;
		3: LEDT[9:0] <= mg;
	endcase
	end

	
	assign led= LEDT;

endmodule 


