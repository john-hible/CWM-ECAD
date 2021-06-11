//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;
//Regitsers and wires
	reg clk_p;
	wire clk_n;
	reg rst_n;
	reg [4:0] temperature;
	reg heating_prev;
	reg cooling_prev;
	wire heating;
	wire cooling;
	reg err;
	
//Clock generation
	initial
	begin
	clk_p = 1'b0;
	forever
	#(CLK_PERIOD/2) clk_p=~clk_p;
	end
	assign clk_n = ~clk_p;

//User logic

	initial begin
	#20
	err = 0;
	rst_n = 0;

	#20
	temperature = 16;
	
	#20
	temperature = 18;

	#20
	temperature = 20;

	#20
	temperature = 22;

	#20
	temperature = 24;

	end
	
	initial begin
	#20
	forever begin
	#10
	
	if ((heating)&&(cooling)) begin
	err = 1;
	end
	
	if ((heating)&&(!(heating_prev))&&(temperature>18)) begin
	err = 1;
	end
	
	if ((cooling)&&(!(cooling_prev))&&(temperature>22)) begin
	err =1;
	end

	heating_prev = heating;
	cooling_prev = cooling;

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
	top top(clk_p,clk_n,rst_n,temperature,heating,cooling);
endmodule 
