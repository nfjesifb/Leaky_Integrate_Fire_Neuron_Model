module set_vars(input set_vars,
                input expd, 
                input w,
                input t, 
                input clk, 
                input rst, 
                output reg [7:0] tau, 
                output reg [7:0] weight,
                output reg [7:0] threshold);

    reg [2:0] appender;
    reg [7:0] tauReg;
    reg [7:0] weightReg;
    reg [7:0] thresholdReg;

    reg first_append;

    always @(negedge set_vars ) begin
        tau <= tauReg;
        weight <= weightReg;
        threshold <= thresholdReg;
    end

    always @(posedge clk) begin
        if (set_vars) begin
            if (first_append = 0) begin
                tauReg[appender] <= 0;
                weightReg[appender] <= 0;
                thresholdReg[appender] <= 0;
                first_append <= 1;
            end 
            else begin
                tauReg[appender] <= expd;
                weightReg[appender] <= w;
                thresholdReg[appender] <= t;
            end
        end  
        else begin
            first_append <= 0;
        end      
    end

    always @(negedge clk) begin
        if (set_vars) begin
            appender <= appender+1;
        end
    end
endmodule
