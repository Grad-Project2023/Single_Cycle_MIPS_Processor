module TOP_mips (
    input CLK, RESET,
    output [31:0] test_value
);
    
    wire mem_write;
    wire [31:0] ALU_out;
    wire [31:0] Write_Data;
    wire [31:0] Read_Data;
    wire [31:0] Pc;
    wire [31:0] Instr;
    
    Data_mem Data_mem_top_mips(
        .CLK(CLK), 
        .reset(RESET), 
        .WE(mem_write),
        .A(ALU_out),
        .WD(Write_Data),
        .RD(Read_Data),
        .test_value(test_value)
    );
    
    Instruction_mem  Instruction_mem_top_mips(
        .Pc(Pc),
        .Instr(Instr)
    );
    
    mips top_mips(
        .CLK(CLK), 
        .Reset(RESET),
        .Instr(Instr),
        .Read_Data(Read_Data),
        .Pc(Pc),
        .Write_Data(Write_Data),
        .ALU_out(ALU_out),
        .mem_write(mem_write)
    );
    
endmodule