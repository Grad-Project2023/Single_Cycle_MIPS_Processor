module mux_R_F (
    input wire  sel,
    input wire [4:0] in1,
    input wire [4:0] in2,
    output reg [4:0] out
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