module shiftpc (
    input   wire[25:0]  in,
    output  wire[27:0]  out
);

    assign out = {in, 2'b0};
    
endmodule