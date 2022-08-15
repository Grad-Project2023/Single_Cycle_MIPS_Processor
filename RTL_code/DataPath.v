module DataPath (
    input CLK,
    input Reset,
    input [31:0] Instr,
    input [31:0] Read_Data,
    input [2:0] ALU_control,
    input Jump,
    input MemtoReg,
    input branch,
    input ALU_src,
    input Reg_Dst,
    input Reg_write,
    output [31:0] PC,
    output [31:0] ALU_out,
    output [31:0] Write_Data
);

    wire Zero;
    wire [31:0] PC_input;
    wire [31:0] mux_D_M_result;
    wire [4:0] Write_reg;
    wire [31:0] RD1_DP, RD2_DP;
    wire [31:0] SrcB;
    wire [31:0] signIMM;
    wire [31:0] pc_mux2_out;
    wire [27:0] shift_pc;
    wire [31:0] PC_plus4;
    wire PCscrc;
    wire [31:0] PCbranch;
    wire [31:0] PCbranch_in;

    adder               branch_adder(.A(PCbranch_in), .B(PC_plus4), .Res(PCbranch));

    adder               PC_adder (.A(PC), .B(32'd4), .Res(PC_plus4));

    shiftleft           shiftLeft_DP(.in(signIMM), .out(PCbranch_in));

    shiftpc             shiftPC_DP(.in(Instr[25:0]), .out(shift_pc));

    PC                  PC_DP(.clk(CLK), .rst(Reset), .PCi(PC_input), .PCo(PC));

    mux                 mux_D_M(.sel(MemtoReg), .in1(ALU_out), .in2(Read_Data), .out(mux_D_M_result));

    mux                 mux_ALU(.sel(ALU_src), .in1(RD2_DP), .in2(signIMM), .out(SrcB));

    mux                 mux_PC(.sel(Jump), .in1(pc_mux2_out), .in2({PC_plus4[31:28], shift_pc}), .out(PC_input));

    mux                 mux_PC2(.sel(PCscrc), .in1(PC_plus4), .in2(PCbranch), .out(pc_mux2_out));

    mux_R_F             mux_R_F(.sel(Reg_Dst), .in1(Instr[20:16]), .in2(Instr[15:11]), .out(Write_reg));

    register_file       register_file_DP(.A1(Instr[25:21]), .A2(Instr[20:16]), .A3(Write_reg), .WE3(Reg_write), 
                                        .reset(Reset), .clk(CLK), .RD1(RD1_DP), .RD2(RD2_DP), .WD3(mux_D_M_result)); 

    ALU                 ALU_DP(.SrcA(RD1_DP), .SrcB(SrcB), .ALUControl(ALU_control), .ALUResult(ALU_out), .zero(Zero));

    sign_extend         sign_extend_DP(.inst(Instr[15:0]),  .signlmm(signIMM));

    assign PCscrc = Zero & branch;
    assign Write_Data = RD2_DP;

endmodule