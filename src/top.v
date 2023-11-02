module top(input set_vars, input syn, input expd, input w, input t, input clk, input rst, output axon, output [7:0] V);
    wire [7:0] tau;
    wire [7:0] weight;
    wire [7:0] threshold;
    
    set_vars sv(set_vars, expd, w, t, clk, rst, tau, weight, threshold);
    LIF lif(syn, tau, weight, threshold, clk, rst, axon, V);
    
endmodule