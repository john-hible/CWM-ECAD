//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
module AC (
    //add ports 
	input clk,
	input [4:0] temperature,
	output heating,
	output cooling
    );
                    
    //add registers and wires
	reg heating;
	reg cooling;

    //add user logic
	initial begin
	cooling = 0;
	heating = 0;
	end

	always @ (posedge clk) begin

	if (!(heating)&&(!(cooling))) begin
		if ((temperature > 22)||(temperature == 22)) begin
		cooling <= 1;
		end
		if ((temperature < 18)||(temperature == 18)) begin
		heating <= 1;
		end
	end

	else if ((heating)&&(!(cooling))) begin
		if ((temperature > 20)||(temperature == 20)) begin
		heating <= 0;
		end
	end

	else if (!(heating)&&(cooling)) begin
		if ((temperature < 20)||(temperature == 20)) begin
		cooling <= 0;
		end
	end
	
	end
      
endmodule
