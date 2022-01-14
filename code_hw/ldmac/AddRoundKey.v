
module AddRoundKey(a0,a1,a2,a3,
                   key,
                   rc,
                   b0,b1,b2,b3);

input [15:0] a0,a1,a2,a3;
input [31:0] key;
input [5:0]  rc;
output[15:0] b0,b1,b2,b3;

assign b0 = a0 ^ key[15:0];
assign b1 = a1 ^ key[31:16];
assign b2 = a2;

assign b3[15]   = a3[15] ^ 1'b1;
assign b3[14:6] = a3[14:6];
assign b3[5:0]  = a3[5:0] ^ rc;

endmodule