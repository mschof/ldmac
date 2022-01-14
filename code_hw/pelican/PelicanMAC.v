
// each message is 128-bit
// we process (MSG_NUM+1)*128-bit messages in total
`define MSG_NUM 3 

module PelicanMAC(clk,rst,
             load_iv,
             load_k,
             load_m,
             din,
             dout,
             done);

input             clk,rst;
input             load_iv;
output reg        load_k;
output reg        load_m;
input     [127:0] din;
output reg[127:0] dout;
output reg        done;

// --------------------

reg [127:0] s;
reg [127:0] k_enc;

// --------------------

reg         sbox_type;

reg  [127:0] xmi;
wire [127:0] xmo;

reg  [127:0] rfi;
wire [127:0] rfo;

reg         rst_lfsr;
wire [5:0]  LFSR_out;

wire [127:0] kuo;

// --------------------

reg [2:0] state;
reg [5:0] cntr,cntr_limit;
reg       cntr_up;

reg [2:0] blok;
reg       blok_up;

/*
4 --> IDLE
5 --> STOP

0 --> load key
1 --> enc
2 --> perm
3 --> xor
*/

always @(posedge clk) begin 
    if(rst) begin
        state <= 3'd4; // IDLE
    end
    else begin
        case(state)
        3'd0: state <= (cntr_up) ? 1 : 0;                         // load key
        3'd1: state <= (cntr_up) ? ((blok>`MSG_NUM) ? 5 : 3) : 1; // enc (go to STOP state if last) 
        3'd2: state <= (cntr_up) ? 3 : 2;                         // perm 
        3'd3: state <= (blok_up) ? 0 : 2;                         // s xor m (go to 0 if last) 
        3'd4: state <= 3'd0;                                      // IDLE
        default: state <= state;                                  // STOP
        endcase
    end
end

always @(*) begin
    case(state)
    3'd1   : cntr_limit=39; // for enc
    3'd2   : cntr_limit=25; // for perm
    default: cntr_limit=1;  // key
    endcase
end

always @(*) begin
    cntr_up = (cntr==cntr_limit);
end

always @(posedge clk) begin
    case(state)
    3'd0,3'd1,3'd2: cntr <= (~cntr_up) ? cntr+1 : 0;
    default       : cntr <= 0; 
    endcase
end

always @(*) begin
    blok_up = (blok==`MSG_NUM);
end

always @(posedge clk) begin
    blok <= (rst) ? 0 : blok + (state==3'd3);
end

always @(*) begin 
    load_m = (cntr_up && ~(blok>`MSG_NUM) && (state==3'd1 || state==3'd2));
end

always @(*) begin 
    case(state)
    3'd0   : load_k = 1;
    default: load_k = 0;
    endcase
end

// ------------------- 

always@(*) begin
    done = (state==3'd5);
end

always @(*) begin
    dout <= s;
end

// --------------------

always @(posedge clk) begin
    if(load_iv) begin
        s <= din;
    end
    else begin
        case(state)
        3'd3     : s <= xmo;
        3'd1,3'd2: s <= rfo;
        default  : s <= s;
        endcase
    end
end

always @(posedge clk) begin 
    case(state)
    3'd0   : k_enc <= din;
    default: k_enc <= kuo;
    endcase
end

// --------------------

always @(*) begin
    xmi = s;
    rfi = s;
end

// sbox_type
always @(*) begin
    case(state)
    3'd1   : sbox_type = 0;
    default: sbox_type = 1;
    endcase
end

// LFSR
always @(*) begin

    case(state)
    3'd0,3'd3: rst_lfsr = 1;
    default  : rst_lfsr = 0;
    endcase  
  
end

// --------------------

XORmessage xm0(xmi,
               din,
               xmo);

RoundFunction rf0(rfi,
                  (k_enc[31:0]  & {32{~sbox_type}}),
                  (k_enc[95:64] & {32{~sbox_type}}),
                  LFSR_out,
                  sbox_type,
                  rfo);

// --------------------

LFSR lf0(clk,rst_lfsr,
         LFSR_out);

KeyUpdate ku0(k_enc,
              kuo);

endmodule