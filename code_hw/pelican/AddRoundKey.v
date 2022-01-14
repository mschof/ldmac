
module AddRoundKey(a0,a1,a2,a3,
                   key0,
                   key2,
                   rc,
                   b0,b1,b2,b3);

input [31:0] a0,a1,a2,a3;
input [31:0] key0;
input [31:0] key2;
input [5:0]  rc;
output[31:0] b0,b1,b2,b3;

assign b0 = a0;
assign b1 = a1 ^ key0;
assign b2 = a2 ^ key2;

assign b3[31]   = a3[31] ^ 1'b1;
assign b3[30:6] = a3[30:6];
assign b3[5:0]  = a3[5:0] ^ rc;

endmodule