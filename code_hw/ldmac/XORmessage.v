
module XORmessage(a,m,b);

input [63:0] a;
input [63:0] m;
output[63:0] b;

assign b = a ^ m;

endmodule