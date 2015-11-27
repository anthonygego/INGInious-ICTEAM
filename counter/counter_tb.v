module test;
    /* Setting some resets */
    reg reset = 0;
    initial begin
        #40 reset = 1;
        #2 reset = 0;
        #100 reset = 1;
        #2 reset = 0;
    end
    
    /* Make clock */
    reg clk = 0;
    always
        #1 clk = !clk;
    
    wire [7:0] out1;
    counter #(8) c1 (.out(out1), .clk(clk), .reset(reset));
    
    wire [2:0] out2;
    counter #(3) c2 (.out(out2), .clk(clk), .reset(reset));

    integer i;
    initial
        begin
            for (i=0; i<50; i=i+1) begin
                $display("1 %t %0d", $time, out1);
                $display("2 %t %0d", $time, out2);
                #20;
            end
            $finish;
        end
endmodule
