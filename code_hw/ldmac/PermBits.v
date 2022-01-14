
module PermBits(a0,a1,a2,a3,
                b0,b1,b2,b3);

input [15:0] a0,a1,a2,a3;
output[15:0] b0,b1,b2,b3;

assign b0[0] = a0[0];
assign b0[12] = a0[1];
assign b0[8] = a0[2];
assign b0[4] = a0[3];
assign b0[1] = a0[4];
assign b0[13] = a0[5];
assign b0[9] = a0[6];
assign b0[5] = a0[7];
assign b0[2] = a0[8];
assign b0[14] = a0[9];
assign b0[10] = a0[10];
assign b0[6] = a0[11];
assign b0[3] = a0[12];
assign b0[15] = a0[13];
assign b0[11] = a0[14];
assign b0[7] = a0[15];
assign b1[4] = a1[0];
assign b1[0] = a1[1];
assign b1[12] = a1[2];
assign b1[8] = a1[3];
assign b1[5] = a1[4];
assign b1[1] = a1[5];
assign b1[13] = a1[6];
assign b1[9] = a1[7];
assign b1[6] = a1[8];
assign b1[2] = a1[9];
assign b1[14] = a1[10];
assign b1[10] = a1[11];
assign b1[7] = a1[12];
assign b1[3] = a1[13];
assign b1[15] = a1[14];
assign b1[11] = a1[15];
assign b2[8] = a2[0];
assign b2[4] = a2[1];
assign b2[0] = a2[2];
assign b2[12] = a2[3];
assign b2[9] = a2[4];
assign b2[5] = a2[5];
assign b2[1] = a2[6];
assign b2[13] = a2[7];
assign b2[10] = a2[8];
assign b2[6] = a2[9];
assign b2[2] = a2[10];
assign b2[14] = a2[11];
assign b2[11] = a2[12];
assign b2[7] = a2[13];
assign b2[3] = a2[14];
assign b2[15] = a2[15];
assign b3[12] = a3[0];
assign b3[8] = a3[1];
assign b3[4] = a3[2];
assign b3[0] = a3[3];
assign b3[13] = a3[4];
assign b3[9] = a3[5];
assign b3[5] = a3[6];
assign b3[1] = a3[7];
assign b3[14] = a3[8];
assign b3[10] = a3[9];
assign b3[6] = a3[10];
assign b3[2] = a3[11];
assign b3[15] = a3[12];
assign b3[11] = a3[13];
assign b3[7] = a3[14];
assign b3[3] = a3[15];

endmodule