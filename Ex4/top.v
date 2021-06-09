//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
module LED (
    //add ports 
	input clk,
	input rst,
	input button,
	output [2:0] colour
    );
                    
    //add registers and wires
	reg [2:0] colour;

    //add user logic
	always @ (posedge clk) begin
	if (rst) begin
	colour <= 3'b0;
	end
	else if ((colour == 7) || (colour == 0)) begin
	colour <= 3'b1;
	end
	else if (button == 0) begin
	end
	else if (colour == 6) begin
	colour <= 3'b1;
	end
	else begin
	colour <= colour + 1;
	end
	end 
      
endmodule
