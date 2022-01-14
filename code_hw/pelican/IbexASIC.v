


module IbexASIC(clk,rst,
                 load_iv,
                 load_k,
                 load_m,
                 din,
                 dout,
                 done);

input            clk,rst;
input            load_iv;
output reg       load_k;
output reg       load_m;
input     [127:0] din;
output reg[127:0] dout;
output reg       done;

reg         rst_R;
reg         load_iv_R;
wire        load_k_W;
wire        load_m_W;
reg  [127:0] din_R;
wire [127:0] dout_W;
wire        done_W;

always @(posedge clk) begin
    rst_R      <= rst;
    load_iv_R  <= load_iv;
    load_k     <= load_k_W;
    load_m     <= load_m_W;
    din_R      <= din;
    dout       <= dout_W;
    done       <= done_W;
end

/*
always @(*) begin
    rst_R      = rst;
    load_iv_R  = load_iv;
    load_k     = load_k_W;
    load_m     = load_m_W;
    din_R      = din;
    dout       = dout_W;
    done       = done_W;
end
*/
PelicanMAC core  (clk,rst_R,
             load_iv_R,
             load_k_W,
             load_m_W,
             din_R,
             dout_W,
             done_W);

endmodule