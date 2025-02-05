//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
module lights_selector(clk,sel,rst,button,light);
    //add ports 
	input clk;
	input sel;
	input rst;
	input button;
	output [23:0] light;
	
	wire enable;
	wire [2:0] colour;
	wire [23:0] rgb;
	reg [23:0] light;
	
	
	LED lights(clk,rst,button,colour);
	converter RGBconverter(clk,!rst,colour,rgb);

	always @ (posedge clk) begin
	if (!(sel)) begin
	light <= 16777215;
	end
	else begin
	light <= rgb;
	end
	end


endmodule

