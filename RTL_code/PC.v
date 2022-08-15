module PC(
    input wire clk,rst,
    input wire [31:0] PCi ,
    output reg [31:0] PCo
);

    always @(posedge clk, negedge rst) begin
        if(!rst)
            PCo <= 31'b0;
        else
            PCo <= PCi;
    
    end

endmodule