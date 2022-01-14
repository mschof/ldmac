
`define MSG_NUM 7 

module LDMAC(clk,rst,
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

// --------------------

//reg [63:0]  m;
reg [63:0]  s1;
reg [63:0]  s2;
reg [127:0] k_enc;

// --------------------

reg         sbox_type;

reg  [63:0] xmi;
wire [63:0] xmo;

reg  [63:0] rfi;
wire [63:0] rfo;

reg         rst_lfsr;
wire [5:0]  LFSR_out;

wire [127:0] kuo;

// --------------------

reg [2:0] state;
reg [4:0] cntr,cntr_limit;
reg       cntr_up;

reg [2:0] blok;
reg       blok_up;

always @(posedge clk) begin 
    if(rst) begin
        state <= 0;
    end
    else begin
        case(state)
        3'd0: state <= 4;                  // s1 xor m
        3'd1: state <= (cntr_up) ? 5 : 1;  // s1 perm 
        3'd2: state <= (cntr_up) ? 3 : 2;  // s1 key load 
        3'd3: state <= (cntr_up) ? 6 : 3;  // s1 enc
        3'd4: state <= (blok_up) ? 2 : 1;  // s2 xor m (when all blocks are consumed, go encryption stage)
        3'd5: state <= (cntr_up) ? 0 : 5;  // s2 perm 
        3'd6: state <= (cntr_up) ? 7 : 6;  // s2 key load 
        3'd7: state <= (cntr_up) ? 0 : 7;  // s2 enc
        default: state <= state;
        endcase
    end
end

always @(*) begin
    case(state)
    3'd1,3'd5: cntr_limit=13;
    3'd3,3'd7: cntr_limit=27;
    default  : cntr_limit=1;
    endcase
end

always @(*) begin
    cntr_up = (cntr==cntr_limit);
end

always @(posedge clk) begin
    case(state)
    3'd0,3'd4: cntr <=0;
    default  : cntr <= (~cntr_up) ? cntr+1 : 0;
    endcase
end

always @(*) begin
    blok_up = (blok==`MSG_NUM);
end

always @(posedge clk) begin
    blok <= (rst) ? 0 : blok + (state==3'd4);
end

always @(posedge clk) begin 
    load_m <= (state==3'd4);
end

always @(*) begin // assuming new keys will arrive 
    case(state)
    3'd2,3'd6: load_k = 1;
    default:   load_k = 0;
    endcase
end

// -------------------

always @(*) begin
    done       = ((state==3'd7) && cntr_up); 
    dout       = rfo;
    dout_valid = ((state==3'd3 || state==3'd7) && cntr_up); 
end

// --------------------

always @(posedge clk) begin
    if(load_s1) begin
        s1 <= din;
    end
    else begin
        case(state)
        3'd0     : s1 <= xmo;
        3'd1,3'd3: s1 <= rfo;
        default  : s1 <= s1;
        endcase
    end
end

always @(posedge clk) begin
    if(load_s2) begin
        s2 <= din;
    end
    else begin
        case(state)
        3'd4     : s2 <= xmo;
        3'd5,3'd7: s2 <= rfo;
        default  : s2 <= s2;
        endcase
    end
end

always @(posedge clk) begin 
    case(state)
    3'd2,3'd6: k_enc <= {k_enc[63:0],din};
    default  : k_enc <= kuo;
    endcase
end

// --------------------
reg [63:0] s1_s2;

always @(*) begin
    s1_s2 = (state[2]==1'b0) ? s1 : s2;
end

always @(*) begin
    xmi = s1_s2;
    rfi = s1_s2;
end

// sbox_type
always @(*) begin
    case(state)
    3'd3,3'd7: sbox_type = 0;
    default  : sbox_type = 1;
    endcase
end

// LFSR
always @(*) begin

    case(state)
    3'd4    : rst_lfsr = 1;
    default : rst_lfsr = (cntr_up);
    endcase  
  
    //rst_lfsr = (cntr_up || cntr==3'd4) ? 1 : 0;
end

// --------------------

XORmessage xm0(xmi,
               din,
               xmo);

RoundFunction rf0(rfi,
                  (k_enc[31:0] & {32{~sbox_type}}),
                  LFSR_out,
                  sbox_type,
                  rfo);

// --------------------

LFSR lf0(clk,rst_lfsr,
         LFSR_out);

KeyUpdate ku0(k_enc,
              kuo);

endmodule