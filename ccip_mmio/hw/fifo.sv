// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
	#(
		parameter DEPTH=8,
		parameter BITS=64
	)
	
	(
		input clk,rst_n,en,
		input [BITS-1:0] d,
		output [BITS-1:0] q
	);
	
	// your RTL code here
	integer i;
	logic [BITS-1:0] queue[DEPTH-1:0];
	
	always @(posedge clk,negedge rst_n) begin
	
		// reset all entries on reset
		if(!rst_n) begin
			for(i=0; i<DEPTH; i=i+1) begin
				queue[i] <= 0;
			end
		end
		
		// if enable we shift entries (implement a queue of a length given by parameter DEPTH)
		else if(en) begin
/* 			queue[0] <= d;
			queue[DEPTH-1:1] <= queue; */
			
			for(i=0; i<DEPTH-1; i=i+1) begin
				queue[i] <= queue[i+1];
			end
			
			queue[DEPTH-1] <= d;
		end
		
		// else out is held
		
	end
	
	assign q = queue[0];
  
endmodule // fifo
