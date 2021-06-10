//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;
//Regitsers and wires
	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	reg [23:0] light_prev;
	reg [2:0] colour_prev;
	reg [2:0] colour;
	reg [23:0] rgb;
	wire [23:0] light;
	
//Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic
	initial begin
	rst = 1;
	err = 0;
	button = 0;
	#20
	if (light != 0) begin
	err = 1;
	end

	sel = 0;
	#10
	if (light != 16777215) begin
	err =1;
	end

	end

	initial begin
	#30
	rst = 0;
	button = 0;
	light_prev = light;
	colour_prev = colour;

	forever begin
	#20
	
	if ((button == 0)&&(light != light_prev)) begin
	err = 1;
	end

	if ((colour == 0)&&(rgb!=0)) begin
	err = 1;
	end
	
	if ((colour == 1)&&(rgb!=255)) begin
	err = 1;
	end

	if ((colour == 2)&&(rgb!=65280)) begin
	err = 1;
	end

	if ((colour == 3)&&(rgb!=65535)) begin
	err = 1;
	end
	
	if ((colour == 4)&&(rgb!=16711680)) begin
	err = 1;
	end

	if ((colour == 5)&&(rgb!=16711935)) begin
	err = 1;
	end

	if ((colour == 6)&&(rgb!=16776960)) begin
	err = 1;
	end

	if ((colour == 7)&&(rgb!=16777215)) begin
	err = 1;
	end
	
	if (button == 1) begin
		if ((colour_prev == 6)&&(colour != 1)) begin
		err = 1;
		$display("***TEST FAILED 1***");
		end
	
		else if ((colour != (colour_prev +1))&&(colour_prev != 6)) begin
		err = 1;
		$display("***TEST FAILED 2***");
		end
	end
	
	light_prev = light;
	colour_prev = colour;
	if (button) begin
	button = 0;
	end
	else begin
	button = 1;
	end

	end
	end	
//Finish test, check for success
	initial begin
	#300
	if (err == 0) begin
	$display("***TEST PASSED***");
	end
	else begin
	$display("***TEST FAILED***");
	end
	$finish;
	end

//Instantiate counter module
	lights_selector top(clk,sel,rst,button,colour,rgb,light);
endmodule
