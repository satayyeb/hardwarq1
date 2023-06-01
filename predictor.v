module predictor(input wire request, result, clk, taken, output reg prediction);

reg[1:0] state = 2'b00;

// Your code
always @(posedge clk) begin
    if (request) begin
        if (state == 2'b00 || state == 2'b01) begin
            prediction = 1'b0;    
        end else begin
            prediction = 1'b1;
        end
    end else if (result) begin
        prediction = 1'b0;
        if (taken) begin
            case (state)
                2'b00: state = 2'b01;
                2'b01: state = 2'b10;
                2'b10: state = 2'b11;
                2'b11: state = 2'b11;
            endcase
        end else begin
            case (state)
                2'b00: state = 2'b00;
                2'b01: state = 2'b00;
                2'b10: state = 2'b01;
                2'b11: state = 2'b10;
            endcase
        end
    end
end
endmodule