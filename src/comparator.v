module comparator(input [7:0] V, input [7:0] threshold, output reg axon);
	always @* begin
      if (V<threshold) begin
        axon <= 0;
      end
      if (V >= threshold) begin
        axon <= 1;
      end
    end
endmodule
