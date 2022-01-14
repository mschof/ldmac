
module SubCells(a0,a1,a2,a3,sbox_type,
                b0,b1,b2,b3);

input [15:0] a0,a1,a2,a3;
input        sbox_type;
output[15:0] b0,b1,b2,b3;

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