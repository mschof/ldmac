
module XORmessage(a,m,b);

input [127:0] a;
input [127:0] m;
output[127:0] b;

assign b = a ^ m;

endmodule