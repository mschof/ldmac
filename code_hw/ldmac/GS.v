

// sbox_type = 1 for permutation

module GS(a3,a2,a1,a0,sbox_type,
          b3,b2,b1,b0);

input  a3,a2,a1,a0,sbox_type;
output b3,b2,b1,b0;

/*
wire t0,t1,t2,t3,s1,s2;

assign t1 = a1 ~^ ~(a0 & a2);
assign t0 = a0 ~^ ~(t1 & a3);
assign t2 = a2 ~^ ~(t0 | t1);
assign t3 = a3 ~^ t2;
assign s1 = t1 ~^ t3;
assign s2 = t2 ~^ ~(t0 & s1);

assign b3 = t0;
assign b1 = s1;
assign b2 = s2;
assign b0 = t3 ^ sbox_type;
*/

nand (a0_a2,a0,a2);
xnor (t1,a1,a0_a2);

nand (t1_a3,t1,a3);
xnor (t0,a0,t1_a3);

nor  (t0_t1,t0,t1);
xnor (t2,a2,t0_t1);

xnor (t3,a3,t2);

xnor (s1,t1,t3);

nand (t0_s1,t0,s1);
xnor (s2,t2,t0_s1);

buf  (b3,t0);
buf  (b1,s1);
buf  (b2,s2);
xor  (b0,t3,sbox_type);

endmodule