module our(
    input clk,
    input rst,
    output cnt2,
    output reg[3:0] cnt);
    initial begin
        $display("Hello World yy");
        cnt = 1;
        $display("cnt is %d", cnt);
    end
    
    assign cnt2 = 1;

    always @(posedge clk)
    begin
        if (rst) begin
            cnt <= 0;
        end
            $display("Hello World");
            cnt <= cnt + 1'b1;
            // $finish();
    end
endmodule : our