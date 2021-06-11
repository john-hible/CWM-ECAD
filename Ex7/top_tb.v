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
	reg enable;
	wire [2:0] colour;
	wire [23:0] rgb;
	reg [23:0] light_prev;
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
	sel = 1;
	enable = 1;

	#20
	if (light != 0) begin
	err = 1;
	end

	sel = 0;
	#20
	if (light != 16777215) begin
	err =1;
	end

	end

	initial begin
	#50
	sel = 1;
	rst = 0;
	button = 0;
	light_prev = light;	

	forever begin
	#20
	
	if ((button == 0)&&(light != light_prev)) begin
	err = 1;
	end
	
	if (rgb != light) begin
	err = 1;
	end

	light_prev = light;
	
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
	lights_selector top(clk,sel,rst,button,light);
	LED lights(clk,rst,button,colour);
	RGB RGB(clk,enable,colour,rgb);
endmodule
