module decay( input [7:0] V, input [7:0] tau, output reg [7:0] V_prime);
    reg [15:0] mult;
    always @(V) begin
        if(V) begin
            mult = (V * tau);
            V_prime = mult >>> 8;
        end
        else begin
            V_prime = V;
        end
    end
endmodule