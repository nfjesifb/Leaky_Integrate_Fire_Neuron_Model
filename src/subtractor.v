module subtractor( input [7:0] V, output reg [7:0] V_prime);
    always @* begin
        if(V) begin
            V_prime = V - 1;
        end
        else begin
            V_prime = V;
        end
    end
endmodule