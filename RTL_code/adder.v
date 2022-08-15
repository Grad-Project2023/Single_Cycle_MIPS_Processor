module adder (
    input wire[31:0] A,
    input wire[31:0] B,
    output wire[31:0] Res
);

assign Res = A + B;

endmodule