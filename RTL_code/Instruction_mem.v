module Instruction_mem (
    input [31:0] Pc,
    output [31:0] Instr
);
    reg [31:0] mem [31:0];

    initial begin
        $readmemh("Program_3_Machine_Code.txt",mem) ;
    end
    
    
    assign Instr = mem[(Pc>>2'b10)];

endmodule