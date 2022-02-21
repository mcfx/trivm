## Background

See https://en.wikipedia.org/wiki/Balanced_ternary

In this VM, everything is done in balanced ternary.

This VM is built after imitating RISC-V.

## Basic conventions

### Trit width

Trit: 3

Tryte: 6 trits, $3^6$

Trint: 3 trytes, $3^{18}$ (aka word)

Address space: $3^{18}$ trytes, from TT...T to 11...1

### Registers

Registers: $3^3$ general purpose registers, from TTT to 111 (-13 to 13). For convenience, use r14 to represent r(-13), and r26 for r(-1). One special program counter register `pc`.

Instruction size: 3 trytes.

### Memory convention

When loading/storing a word at address x, it means memory[x-1:x+2] in fact. (So loading xxx0 means the three trytes at xxxT, xxx0 and xxx1)

## Ternary operations

### or

It's like a chain following T->0->1 (see the table below)

### or.1

|      | 0    | 1    | T    |
| ---- | ---- | ---- | ---- |
| 0    | 0    | 1    | T    |
| 1    | 1    | 1    | 1    |
| T    | T    | 1    | T    |

It's like a chain following 0->T->1

### or.T

0->1->T

### and

1->0->T

### and.1

1->T->0

### and.T

T->1->0

### xor

|      | 0    | 1    | T    |
| ---- | ---- | ---- | ---- |
| 0    | 0    | 1    | T    |
| 1    | 1    | T    | 0    |
| T    | T    | 0    | 1    |

It's addition without carry

### xor.1

|      | 0    | 1    | T    |
| ---- | ---- | ---- | ---- |
| 0    | 0    | 1    | T    |
| 1    | 1    | 0    | 1    |
| T    | T    | 1    | 0    |

It's like binary xor, but 1^T=1

### xor.T

It's like binary xor, but 1^T=T

## Instruction formats

There are three types of instruction, U, I, and R.

Trit 17...0

U: imm[2:0] imm[5:3] imm[11:6] rd[3] opcode[3]

I: imm[2:0] imm[5:3] funct[3] rs1[3] rd[3] opcode[3]

R: imm[3] rs2[3] funct[3] rs1[3] rd[3] opcode[3]

Unlike RISC-V, here R-type instructions have an imm3.

## Instructions

For shift operations, if the shift amount is not in [-17,17], the result will be zero.

| Inst                     | FMT  | Opcode | funct3     | Description/Remarks                   |
| ------------------------ | ---- | ------ | ---------- | ------------------------------------- |
| add rd, rs1, rs2, imm3   | R    | 000    | 000        | rd=rs1+rs2+imm3                       |
| sub rd, rs1, rs2, imm3   | R    | 000    | 001        | rd=rd1-rs2+imm3                       |
| xor rd, rs1, rs2, imm3   | R    | 000    | 100        | only lower 3 trits operates with imm3 |
| xor.1 rd, rs1, rs2, imm3 | R    | 000    | 101        | only lower 3 trits operates with imm3 |
| xor.T rd, rs1, rs2, imm3 | R    | 000    | 10T        | only lower 3 trits operates with imm3 |
| or rd, rs1, rs2, imm3    | R    | 000    | 110        | only lower 3 trits operates with imm3 |
| or.1 rd, rs1, rs2, imm3  | R    | 000    | 111        | only lower 3 trits operates with imm3 |
| or.T rd, rs1, rs2, imm3  | R    | 000    | 11T        | only lower 3 trits operates with imm3 |
| and rd, rs1, rs2, imm3   | R    | 000    | 1T0        | only lower 3 trits operates with imm3 |
| and.1 rd, rs1, rs2, imm3 | R    | 000    | 1T1        | only lower 3 trits operates with imm3 |
| and.T rd, rs1, rs2, imm3 | R    | 000    | 1TT        | only lower 3 trits operates with imm3 |
| sll rd, rs1, rs2, imm3   | R    | 000    | 010        | rd=rs1<<(rs2+imm3)                    |
| srl rd, rs1, rs2, imm3   | R    | 000    | 01T        | rd=rs1>>(rs2+imm3)                    |
| seq rd, rs1, rs2         | R    | 000    | 0T0        | rd=(rs1==rs2)?1:0                     |
| sne rd, rs1, rs2         | R    | 000    | 0T1        | rd=(rs1!=rs2)?1:0                     |
| slt rd, rs1, rs2         | R    | 000    | 00T        | rd=(rs1<rs2)?1:0                      |
|                          |      |        |            |                                       |
| addi rd, rs1, imm6       | I    | 001    | 000        | rd=rs1+imm6                           |
| no subi instruction      | All  | the    | i-versions | below have same funct3 as above       |
| xori                     | I    | 001    |            | the upper 12 trits are xor-ed with 0  |
| xori.1                   | I    | 001    |            |                                       |
| xori.T                   | I    | 001    |            |                                       |
| ori                      | I    | 001    |            | the upper 12 trits are or-ed with 0   |
| ori.1                    | I    | 001    |            |                                       |
| ori.T                    | I    | 001    |            |                                       |
| andi                     | I    | 001    |            | the upper 12 trits are and-ed with 0  |
| andi.1                   | I    | 001    |            |                                       |
| andi.T                   | I    | 001    |            |                                       |
| slli                     | I    | 001    |            |                                       |
| srli                     | I    | 001    |            |                                       |
| seqi                     | I    | 001    |            |                                       |
| snei                     | I    | 001    |            |                                       |
| slti                     | I    | 001    |            |                                       |
|                          |      |        |            |                                       |
| lt rd, imm6(rs1)         | I    | 00T    | 000        | Load tryte, rd=M[rs1+imm6]            |
| lw rd, imm6(rs1)         | I    | 00T    | 001        | Load word, rd=M[rs1+imm6]             |
| st rd, imm6(rs1)         | I    | 00T    | 010        | M[rs1+imm6]=rd                        |
| sw rd, imm6(rs1)         | I    | 00T    | 011        | M[rs1+imm6]=rd                        |
|                          |      |        |            |                                       |
| beq rd, rs1, imm6/label  | I    | 010    | 000        | if(rd==rs1)pc+=imm6<<1                |
| bne                      | I    | 010    | 001        | if(rd!=rs1)pc+=imm6<<1                |
| blt                      | I    | 010    | 00T        | if(rd<=rs1)pc+=imm6<<1                |
|                          |      |        |            |                                       |
| jal rd, imm12            | U    | 011    | /          | rd=pc+3, pc+=imm12                    |
| jalr rd, rs1, imm9       | I    | 01T    | imm[8:6]   | rd=pc+3, pc=rs1+imm9                  |
|                          |      |        |            |                                       |
| lui rd, imm12            | U    | 0T0    | /          | rd=imm12<<6                           |
| auipc rd, imm12          | U    | 0T1    | /          | rd=PC+(imm12<<6)                      |
|                          |      |        |            |                                       |
| ecall                    | I    | 100    | ignored    | external call                         |
|                          |      |        |            |                                       |
| mul rd, rs1, rs2, imm3   | R    | 101    | 000        | rd=rs1*rs2[17:0]+imm3                 |
| mulh rd, rs1, rs2, imm3  | R    | 101    | 001        | rd=rs1*rs2[35:18]+imm3                |
|                          |      |        |            |                                       |
|                          |      |        |            |                                       |

## Registers

x0: zero

x1: ra (caller saved)

x2: sp (callee saved)

x3-x10: (a0-a7) function argument/result args (caller saved)

x11-x18: (s0-s7) saved regs (callee saved)

x19-x26: (t0-t7) temp regs (caller saved)

### syscall

a0 is syscall number, a1-a7 are args

Currently there are 5 syscalls:

0: `read(int fd, char *buf, int count)`

1: `write(int fd, char *buf, int count)`

2: `open(char *pathname, int flags, int mode)`

3: `close(int fd)`

4: `exit(int status)`

Read, write, close, exit are almost the same as Linux versions.

In open, flags is ignored, and mode can only be `O_RDONLY`(0) or `O_WRONLY`(1).
