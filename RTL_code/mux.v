module mux (
    input wire  sel,
    input wire [31:0] in1,
    input wire [31:0] in2,
    output reg [31:0] out
);

    always @(*) 
        begin
            if(!sel)
                begin
                    out = in1;
                end
            else
                begin
                    out = in2;
                end
        end
    
endmodule