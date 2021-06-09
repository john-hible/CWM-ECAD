//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 5;
//Regitsers and wires
	reg clk;
	reg [4:0] temperature;
	wire heating;
	wire cooling;
	reg err;
	
//Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic

	initial begin
	#10
	err = 0;
	temperature = 16;

	
	forever begin
	#20
	if ((heating)&&(cooling)) begin
	err = 1;
	end
	
	if (temperature < 26) begin
	temperature = temperature + 2;

	end

	else begin
	forever begin
	#20
	if ((heating)&&(cooling)) begin
	err = 1;
	end
	temperature = temperature - 2;
	end
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
	AC top(clk,temperature,heating,cooling);
endmodule 
