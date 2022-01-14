


module IbexASIC(clk,rst,
                 load_s1,load_s2,
                 load_k,
                 load_m,
                 din,
                 dout,
                 dout_valid,
                 done);

input            clk,rst;
input            load_s1,load_s2;
output reg       load_k;
output reg       load_m;
input     [63:0] din;
output reg[63:0] dout;
output reg       dout_valid;
output reg       done;

reg         rst_R;
reg         load_s1_R,load_s2_R;
wire        load_k_W;
wire        load_m_W;
reg  [63:0] din_R;
wire [63:0] dout_W;
wire        dout_valid_W;
wire        done_W;

always @(posedge clk) begin
    rst_R      <= rst;
    {load_s1_R,load_s2_R} <= {load_s1,load_s2};
    load_k     <= load_k_W;
    load_m     <= load_m_W;
    din_R      <= din;
    dout       <= dout_W;
    dout_valid <= dout_valid_W;
    done       <= done_W;
end

/*
always @(*) begin
    rst_R      = rst;
    {load_s1_R,load_s2_R} = {load_s1,load_s2};
    load_k     = load_k_W;
    load_m     = load_m_W;
    din_R      = din;
    dout       = dout_W;
    dout_valid = dout_valid_W;
    done       = done_W;
end
*/
LDMAC core  (clk,rst_R,
             load_s1_R,load_s2_R,
             load_k_W,
             load_m_W,
             din_R,
             dout_W,
             dout_valid_W,
             done_W);

endmodule