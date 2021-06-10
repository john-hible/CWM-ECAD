//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;
//Regitsers and wires
	reg clk;
	reg enable;
	reg err;
	reg [2:0] colour;
	wire [23:0] rgb;
	
//Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic
	initial begin
	enable = 0;
	err = 0;
	colour = 1;
	#20
	if (rgb != 0) begin
	err = 1;
	end
	end

	initial begin
	#30
	enable = 1;
	colour = 0;

	forever begin
	#20

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
	
	colour = colour + 1;
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
	RGB top(clk,enable,colour,rgb);
endmodule






