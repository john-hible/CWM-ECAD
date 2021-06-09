//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;
//Regitsers and wires
	reg clk;
	reg rst;
	reg button;
	reg err;
	reg [2:0] colour_prev;
	wire [2:0] colour;
	
//Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic
	initial begin

	rst = 1;
	button = 1;
	err = 0;
	#10
	if (colour != 0) begin
	err = 1;
	end
	end


	initial begin
	#20
	colour_prev = colour;
	rst = 0;
	button = 1;	

	forever begin
	#10
	if ((button == 0)&&(colour != colour_prev)) begin
	err = 1;
	end
	
	if (button == 1) begin
		if ((colour_prev == 6)&&(colour != 1)) begin
		err = 1;
		end
	
		else if (colour != (colour_prev +1)) begin
		err = 1;
		end
	end

	colour_prev = colour;
	if  (button) begin
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
	LED top(clk,rst,button,colour);
endmodule 
