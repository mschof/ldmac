
module KeyUpdate(a,
                 b);

input [127:0] a;
output[127:0] b;

// ---------------------------

wire [31:0] a0,a1,a2,a3;
wire [31:0] b0,b1,b2,b3;

assign a0 = a[31:0];
assign a1 = a[63:32];
assign a2 = a[95:64];
assign a3 = a[127:96];

assign b3[0] = a0[12];
assign b3[1] = a0[13];
assign b3[2] = a0[14];
assign b3[3] = a0[15];
assign b3[4] = a0[0];
assign b3[5] = a0[1];
assign b3[6] = a0[2];
assign b3[7] = a0[3];
assign b3[8] = a0[4];
assign b3[9] = a0[5];
assign b3[10] = a0[6];
assign b3[11] = a0[7];
assign b3[12] = a0[8];
assign b3[13] = a0[9];
assign b3[14] = a0[10];
assign b3[15] = a0[11];
assign b3[16] = a0[18];
assign b3[17] = a0[19];
assign b3[18] = a0[20];
assign b3[19] = a0[21];
assign b3[20] = a0[22];
assign b3[21] = a0[23];
assign b3[22] = a0[24];
assign b3[23] = a0[25];
assign b3[24] = a0[26];
assign b3[25] = a0[27];
assign b3[26] = a0[28];
assign b3[27] = a0[29];
assign b3[28] = a0[30];
assign b3[29] = a0[31];
assign b3[30] = a0[16];
assign b3[31] = a0[17];

assign b0 = a1;
assign b1 = a2;
assign b2 = a3;

// ---------------------------

assign b = {b3,b2,b1,b0};

endmodule