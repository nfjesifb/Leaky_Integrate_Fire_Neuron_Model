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

    always @(negedge set_vars ) begin
        tau <= tauReg;
        weight <= weightReg;
        threshold <= thresholdReg;
    end

    always @(posedge clk) begin
        if (set_vars) begin
            tauReg[appender] <= expd;
            weightReg[appender] <= w;
            thresholdReg[appender] <= t;
        end  
        else begin
            tauReg <= 0;
            weightReg <= 0;
            thresholdReg <= 0;
        end      
    end

    always @(negedge clk) begin
        if (set_vars) begin
            appender <= appender+1;
        end 
        else begin
            appender <= 0;
        end
    end
endmodule
