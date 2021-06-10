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
	parameter CLK_PERIOD = 10;
//Regitsers and wires
	reg clk;
	reg [4:0] temperature;
	reg heating_prev;
	reg cooling_prev;
	wire heating;
	wire cooling;
	reg err;
	reg [4:0] temperature_prev;
	
//Clock generation
initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic

	initial begin
	#20
	err = 0;
	temperature = 16;
	temperature_prev = temperature;

	
	forever begin
	#20
	if (temperature < 26) begin
	temperature = temperature + 2;
	end

	else begin
	forever begin
	#20
	temperature = temperature - 2;
	end
	end
	end
	end
	
	initial begin
	#10
	forever begin
	#10
	
	temperature_prev = temperature;
	heating_prev = heating;
	cooling_prev = cooling;
	#50
	
	if ((heating)&&(cooling)) begin
	err = 1;
	end

	if (!(heating_prev)&&(!(cooling_prev))) begin
		if (((temperature_prev > 22)||(temperature_prev == 22))&&(!(cooling))) begin
		err = 1;
		$display("***TEST FAILED 1***");
		end
		if (((temperature_prev < 18)||(temperature_prev == 18))&&((heating))) begin
		err = 1;
		$display("***TEST FAILED 2***");
		end
	end

	else if ((heating_prev)&&(!(cooling_prev))) begin
		if (((temperature_prev > 20)||(temperature_prev == 20))&&(heating)) begin
		err = 1;
		$display("***TEST FAILED 3***");
		end
	end

	else if (!(heating_prev)&&(cooling_prev)) begin
		if (((temperature_prev < 20)||(temperature_prev == 20))&&(cooling)) begin
		err = 1;
		$display("***TEST FAILED 4***");
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
