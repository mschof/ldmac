
module SubCells(a0,a1,a2,a3,sbox_type,
                b0,b1,b2,b3);

input [31:0] a0,a1,a2,a3;
input        sbox_type;
output[31:0] b0,b1,b2,b3;

GS u31(a3[31],a2[31],a1[31],a0[31],sbox_type,b3[31],b2[31],b1[31],b0[31]);
GS u30(a3[30],a2[30],a1[30],a0[30],sbox_type,b3[30],b2[30],b1[30],b0[30]);
GS u29(a3[29],a2[29],a1[29],a0[29],sbox_type,b3[29],b2[29],b1[29],b0[29]);
GS u28(a3[28],a2[28],a1[28],a0[28],sbox_type,b3[28],b2[28],b1[28],b0[28]);
GS u27(a3[27],a2[27],a1[27],a0[27],sbox_type,b3[27],b2[27],b1[27],b0[27]);
GS u26(a3[26],a2[26],a1[26],a0[26],sbox_type,b3[26],b2[26],b1[26],b0[26]);
GS u25(a3[25],a2[25],a1[25],a0[25],sbox_type,b3[25],b2[25],b1[25],b0[25]);
GS u24(a3[24],a2[24],a1[24],a0[24],sbox_type,b3[24],b2[24],b1[24],b0[24]);
GS u23(a3[23],a2[23],a1[23],a0[23],sbox_type,b3[23],b2[23],b1[23],b0[23]);
GS u22(a3[22],a2[22],a1[22],a0[22],sbox_type,b3[22],b2[22],b1[22],b0[22]);
GS u21(a3[21],a2[21],a1[21],a0[21],sbox_type,b3[21],b2[21],b1[21],b0[21]);
GS u20(a3[20],a2[20],a1[20],a0[20],sbox_type,b3[20],b2[20],b1[20],b0[20]);
GS u19(a3[19],a2[19],a1[19],a0[19],sbox_type,b3[19],b2[19],b1[19],b0[19]);
GS u18(a3[18],a2[18],a1[18],a0[18],sbox_type,b3[18],b2[18],b1[18],b0[18]);
GS u17(a3[17],a2[17],a1[17],a0[17],sbox_type,b3[17],b2[17],b1[17],b0[17]);
GS u16(a3[16],a2[16],a1[16],a0[16],sbox_type,b3[16],b2[16],b1[16],b0[16]);
GS u15(a3[15],a2[15],a1[15],a0[15],sbox_type,b3[15],b2[15],b1[15],b0[15]);
GS u14(a3[14],a2[14],a1[14],a0[14],sbox_type,b3[14],b2[14],b1[14],b0[14]);
GS u13(a3[13],a2[13],a1[13],a0[13],sbox_type,b3[13],b2[13],b1[13],b0[13]);
GS u12(a3[12],a2[12],a1[12],a0[12],sbox_type,b3[12],b2[12],b1[12],b0[12]);
GS u11(a3[11],a2[11],a1[11],a0[11],sbox_type,b3[11],b2[11],b1[11],b0[11]);
GS u10(a3[10],a2[10],a1[10],a0[10],sbox_type,b3[10],b2[10],b1[10],b0[10]);
GS u09(a3[ 9],a2[ 9],a1[ 9],a0[ 9],sbox_type,b3[ 9],b2[ 9],b1[ 9],b0[ 9]);
GS u08(a3[ 8],a2[ 8],a1[ 8],a0[ 8],sbox_type,b3[ 8],b2[ 8],b1[ 8],b0[ 8]);
GS u07(a3[ 7],a2[ 7],a1[ 7],a0[ 7],sbox_type,b3[ 7],b2[ 7],b1[ 7],b0[ 7]);
GS u06(a3[ 6],a2[ 6],a1[ 6],a0[ 6],sbox_type,b3[ 6],b2[ 6],b1[ 6],b0[ 6]);
GS u05(a3[ 5],a2[ 5],a1[ 5],a0[ 5],sbox_type,b3[ 5],b2[ 5],b1[ 5],b0[ 5]);
GS u04(a3[ 4],a2[ 4],a1[ 4],a0[ 4],sbox_type,b3[ 4],b2[ 4],b1[ 4],b0[ 4]);
GS u03(a3[ 3],a2[ 3],a1[ 3],a0[ 3],sbox_type,b3[ 3],b2[ 3],b1[ 3],b0[ 3]);
GS u02(a3[ 2],a2[ 2],a1[ 2],a0[ 2],sbox_type,b3[ 2],b2[ 2],b1[ 2],b0[ 2]);
GS u01(a3[ 1],a2[ 1],a1[ 1],a0[ 1],sbox_type,b3[ 1],b2[ 1],b1[ 1],b0[ 1]);
GS u00(a3[ 0],a2[ 0],a1[ 0],a0[ 0],sbox_type,b3[ 0],b2[ 0],b1[ 0],b0[ 0]);

endmodule


