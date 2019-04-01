module Magic(ADC_CLK_10,leds);
input ADC_CLK_10; // from data sheet (PIN_N5:10 MHz clock input for ADC (Bank 3B) )
output reg [9:0]leds;

//Initialize clock slowing toggle and counter
reg s = 0;
reg [16:0]  counter = 0;
reg [9:0] blink= 1;


//increment the counter
always @(posedge ADC_CLK_10)
begin
	counter <= counter + 1;
	if ( counter == 16'b1111111111111111)
		begin
			counter <= 0;
			s <= ~s;
		end
end

reg [4:0] count = 0;


always @ (posedge s)
begin
	
	count <= count + 1;
	leds <= blink;

	if(count < 9)
	begin
		blink <= blink*2;
	end

	else
	begin
		blink <= blink/2;
	end
	
	if(count == 19)
	begin
		count <= 0;
		
		blink <=1;
	end
		
	
end

endmodule