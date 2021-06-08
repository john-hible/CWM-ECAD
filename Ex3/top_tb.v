//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 5;
//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg change;
	reg on_off;
	wire [7:0] counter_out;
	
//Todo: Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
	initial begin
	rst = 0;
	change = 0;
	on_off = 0;
	#10
	rst = 1;
	#5
	rst = 0;
	#15 
	change = 1; 
	on_off = 1;
	#30
	change = 1;
	on_off = 0;
	#20 
	change = 0;
    	end
//Todo: Finish test, check for success
	initial begin
	#150
	if (counter_out == 10) begin
	$display("***TEST PASSED***");
	end
	else begin
	$display("***TEST FAILED***");
	end
	$finish;
	end

//Todo: Instantiate counter module
	monitor top(clk,rst,on_off,change,counter_out);
endmodule 
