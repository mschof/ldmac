
module LFSR(clk,rst,LFSR_out);

input        clk,rst;
output [5:0] LFSR_out;

reg  [5:0] LFSR_out_r;
wire [5:0] LFSR_out_w;

assign LFSR_out_w[5] = LFSR_out_r[4];
assign LFSR_out_w[4] = LFSR_out_r[3];
assign LFSR_out_w[3] = LFSR_out_r[2];
assign LFSR_out_w[2] = LFSR_out_r[1];
assign LFSR_out_w[1] = LFSR_out_r[0];
assign LFSR_out_w[0] = LFSR_out_r[5] ^ LFSR_out_r[4] ^ 1'b1;

always @(posedge clk) begin
    if(rst) begin
        LFSR_out_r[5] <= 0;
        LFSR_out_r[4] <= 0;
        LFSR_out_r[3] <= 0;
        LFSR_out_r[2] <= 0;
        LFSR_out_r[1] <= 0;
        LFSR_out_r[0] <= 0;
    end
    else begin
        LFSR_out_r[5] <= LFSR_out_w[5];
        LFSR_out_r[4] <= LFSR_out_w[4];
        LFSR_out_r[3] <= LFSR_out_w[3];
        LFSR_out_r[2] <= LFSR_out_w[2];
        LFSR_out_r[1] <= LFSR_out_w[1];
        LFSR_out_r[0] <= LFSR_out_w[0];
    end
end

assign LFSR_out = LFSR_out_w;

endmodule