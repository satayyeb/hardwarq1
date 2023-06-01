module predictor(input wire request, result, clk, taken, output reg prediction);

// Your code
always @(posedge clk) begin
    prediction = 1; 
end

endmodule