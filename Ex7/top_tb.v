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
	parameter CLK_PERIOD = 5;
//Regitsers and wires
	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	reg enable;
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
	enable = 0;

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
	#10
	
	if ((light_prev == 0)&&(button)&&(light != 255)) begin
	err = 1;
	$display("***TEST FAILED 1***");
	end
	
	if ((light_prev == 16776960)&&(button)&&(light !=16777215)) begin
	err=1;
	$display("***TEST FAILED 2***");
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
endmodule
