module LIF(input syn, 
           input [7:0] tau, 
           input [7:0] weight, 
           input [7:0] threshold, 
           input clk, 
           input rst, 
           output axon, 
           output reg [7:0] V);

    reg [7:0] voltageReg;

    wire [7:0] syn_scaled;
    wire [7:0] voltage_prime;

    weigher scalar(syn, weight, syn_scaled);
    comparator compare(voltageReg, threshold, axon);
    subtractor subtractor(voltageReg, voltage_prime);

    always @(posedge clk) begin
        if (rst) begin
            voltageReg = 0;
        end 
        else begin
        voltageReg = voltageReg + syn_scaled;
        V = voltageReg;
        end
    end

    always @(negedge clk) begin
        voltageReg = voltage_prime;
    end

endmodule
