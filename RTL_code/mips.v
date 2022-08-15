module mips (
    input CLK, Reset,
    input [31:0] Instr,
    input [31:0] Read_Data,
    output mem_write,
    output [31:0] Pc,
    output [31:0] Write_Data,
    output [31:0] ALU_out
);

    wire [2:0] ALU_control;
    wire Jump;
    wire MemtoReg;
    wire branch;
    wire ALU_src;
    wire Reg_Dst;
    wire Reg_write;

    CU CU_mips(
        .Opcode(Instr[31:26]),
        .Funct(Instr[5:0]),
        .MemtoReg(MemtoReg),
        .MemWrite(mem_write),
        .Branch(branch),
        .ALUSrc(ALU_src),
        .RegDSt(Reg_Dst),
        .RegWrite(Reg_write),
        .jump(Jump),
        .ALUControl(ALU_control)
    );

    DataPath DataPath_mips(
        .CLK(CLK),
        .Reset(Reset),
        .Instr(Instr),
        .Read_Data(Read_Data),
        .ALU_control(ALU_control),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .branch(branch),
        .ALU_src(ALU_src),
        .Reg_Dst(Reg_Dst),
        .Reg_write(Reg_write),
        .PC(Pc),
        .ALU_out(ALU_out),
        .Write_Data(Write_Data)
    );

endmodule