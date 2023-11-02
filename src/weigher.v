module weigher(input syn, input [7:0] weight, output [7:0] V);
	wire and_o;
	assign and_o = weight & syn;

	genvar i;
    generate
        for (i = 0; i < 8; i=i+1) begin : and_gate_gen
            assign V[i] = weight[i] & and_o;
        end
    endgenerate
endmodule