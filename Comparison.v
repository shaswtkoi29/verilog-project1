module Comparison(
	input [3:0] X,
	input [3:0] Y,
	input [1:0] select,
	output [3:0] f
	);
	
	wire f1, f2, f3;
	wire [7:0]f4;
	equal(X,Y,f1);
	greater(X,Y,f2);
	less(X,Y,f3);
	maxx(X,Y,f4);
	Multiplexer display (f1, f2, f3, f4, select, f);
	
	
endmodule


module equal (
	input [3:0] x,
	input [3:0] y,
	output [7:0] f1
);

reg found;

always @ (x or y)
	begin 
		if(x == y)
		begin
			found = 1;
		end
		
		else
		begin
			found = 0;
		end
		
	end
	
	assign f1[0] = found;
endmodule


module greater (
	input [3:0] x,
	input [3:0] y,
	output [7:0] f2
);

reg found;

always@ (x or y)
	begin
		if(x > y)
		begin
			found = 1;
		end
		
		else
		begin
			found = 0;
		end
		
	end
	
	
	assign f2[0] = found;
	
endmodule
	

module less (
	input [3:0] x,
	input [3:0] y,
	output [7:0] f3
);

reg found;

always@ (x or y)
	begin
		if(x < y)
		begin
			found = 1;
			
		end
		
		else
		begin
			found = 0;		
		end
		
	end
	
	assign f3[0] = found;
	
endmodule

module maxx(
	input [3:0] x,
	input [3:0] y,
	output reg [7:0] f4
	);
	reg truth;
	
	always @(*)
	begin
		if(x < y)
		begin
			truth = 1;
			
		end
		
		else
		begin
			truth = 0;
			
		end
	
	if(truth == 1)
		begin 
			f4 = y;
		end
	else if(truth == 0)
		begin
			f4 = x;
		end
	else
		begin 
			f4 = 0;
		end 
	end
	
endmodule 
	



	
	