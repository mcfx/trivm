j _start
read:
mv a3, a2 
addi a2, a1, -1 
mv a1, a0 
mv a0, zero 
ecall 
ret 
write:
mv a3, a2 
addi a2, a1, -1 
mv a1, a0 
li a0, 1 
ecall 
ret 
open:
mv a3, a2 
mv a2, a1 
addi a1, a0, -1 
li a0, 2 
ecall 
ret 
close:
mv a1, a0 
li a0, 3 
ecall 
ret 
exit:
mv a1, a0 
li a0, 4 
ecall 
ret 
getchar:
sw ra, -3(sp)
addi sp, sp, -9
la a0, __globals+0
lw a0, 0(a0)
la a1, __globals+3
lw a1, 0(a1)
bne a0, a1, _getchar_label6
la a0, __globals+3
la a1, __globals+129140181
li a2, 0
la a3, __globals+129140181
li a4, 729
sw a0, 0(sp)
sw a1, 3(sp)
mv a0, a2
mv a1, a3
mv a2, a4
jal read
mv a2, a0
lw a0, 0(sp)
lw a1, 3(sp)
add a1, a1, a2
sw a1, 0(a0)
la a0, __globals+0
la a1, __globals+129140181
sw a1, 0(a0)
_getchar_label6:
la a0, __globals+0
lw a0, 0(a0)
lt a0, -1(a0)
la a1, __globals+0
la a2, __globals+0
lw a2, 0(a2)
addi a2, a2, 1
sw a2, 0(a1)
addi sp, sp, 9
lw ra, -3(sp)
ret 
putchar:
sw ra, -3(sp)
addi sp, sp, -3
la a1, __globals+6
lw a1, 0(a1)
st a0, -1(a1)
la a0, __globals+6
la a1, __globals+6
lw a1, 0(a1)
addi a1, a1, 1
sw a1, 0(a0)
la a0, __globals+6
lw a0, 0(a0)
la a1, __globals+129140910
li t7, 729
add a1, a1, t7
bne a0, a1, _putchar_label17
li a0, 1
la a1, __globals+129140910
li a2, 729
jal write
la a0, __globals+6
la a1, __globals+129140910
sw a1, 0(a0)
_putchar_label17:
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
_start:
sw ra, -3(sp)
addi sp, sp, -3
la a2, __globals+0
la a3, __globals+3
la a4, __globals+129140181
sw a4, 0(a3)
sw a4, 0(a2)
la a2, __globals+6
la a3, __globals+129140910
sw a3, 0(a2)
jal main
jal exit
flush:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 1
la a1, __globals+129140910
la a2, __globals+6
lw a2, 0(a2)
la a3, __globals+129140910
sub a2, a2, a3
jal write
la a0, __globals+6
la a1, __globals+129140910
sw a1, 0(a0)
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
puts:
sw ra, -3(sp)
addi sp, sp, -6
_puts_label3:
lt a1, -1(a0)
beq a1, zero, _puts_label5
sw a0, 0(sp)
mv a0, a1
jal putchar
lw a0, 0(sp)
_puts_label4:
addi a0, a0, 1
j _puts_label3
_puts_label5:
li a0, 10
jal putchar
jal flush
li a0, 0
addi sp, sp, 6
lw ra, -3(sp)
ret 
print_digit:
sw ra, -3(sp)
addi sp, sp, -6
li a2, 0
_print_digit_label5:
slt a3, a0, a1
seq a3, a3, zero
beq a3, zero, _print_digit_label6
sub a0, a0, a1
addi a2, a2, 1
j _print_digit_label5
_print_digit_label6:
addi a1, a2, 48
sw a0, 0(sp)
mv a0, a1
jal putchar
lw a0, 0(sp)
addi sp, sp, 6
lw ra, -3(sp)
ret 
print_uint:
sw ra, -3(sp)
addi sp, sp, -3
li a1, 0
li t7, 100000000
slt a2, a0, t7
seq a2, a2, zero
beq a2, zero, _print_uint_label6
li a1, 100000000
jal print_digit
li a1, 1
_print_uint_label6:
li t7, 10000000
slt a2, a0, t7
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label13
li a1, 10000000
jal print_digit
li a1, 1
_print_uint_label13:
li t7, 1000000
slt a2, a0, t7
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label20
li a1, 1000000
jal print_digit
li a1, 1
_print_uint_label20:
li t7, 100000
slt a2, a0, t7
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label27
li a1, 100000
jal print_digit
li a1, 1
_print_uint_label27:
li t7, 10000
slt a2, a0, t7
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label34
li a1, 10000
jal print_digit
li a1, 1
_print_uint_label34:
li t7, 1000
slt a2, a0, t7
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label41
li a1, 1000
jal print_digit
li a1, 1
_print_uint_label41:
slti a2, a0, 100
seq a2, a2, zero
or.1 a2, a2, a1
beq a2, zero, _print_uint_label48
li a1, 100
jal print_digit
li a1, 1
_print_uint_label48:
slti a2, a0, 10
seq a2, a2, zero
or.1 a1, a2, a1
beq a1, zero, _print_uint_label55
li a1, 10
jal print_digit
_print_uint_label55:
addi a0, a0, 48
jal putchar
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
printf:
sw ra, -3(sp)
addi sp, sp, -33
addi t0, sp, 0
addi t0, t0, 0
sw a1, 0(t0)
addi a1, sp, 0
addi a1, a1, 3
sw a2, 0(a1)
addi a1, sp, 0
addi a1, a1, 6
sw a3, 0(a1)
addi a1, sp, 0
addi a1, a1, 9
sw a4, 0(a1)
addi a1, sp, 0
addi a1, a1, 12
sw a5, 0(a1)
addi a1, sp, 0
addi a1, a1, 15
sw a6, 0(a1)
addi a1, sp, 0
addi a1, a1, 18
sw a7, 0(a1)
li a1, 0
_printf_label47:
lt a2, -1(a0)
beq a2, zero, _printf_label49
andi.1 a3, a2, 364
li t7, 37
beq a3, t7, _printf_label54
sw a0, 21(sp)
sw a1, 24(sp)
mv a0, a2
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
j _printf_label48
_printf_label54:
addi a0, a0, 1
lt a2, -1(a0)
andi.1 a3, a2, 364
li t7, 37
bne a3, t7, _printf_label62
sw a0, 21(sp)
sw a1, 24(sp)
mv a0, a2
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
j _printf_label48
_printf_label62:
andi.1 a3, a2, 364
li t7, 99
bne a3, t7, _printf_label67
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
sw a0, 21(sp)
sw a1, 24(sp)
mv a0, a2
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
addi a1, a1, 1
j _printf_label48
_printf_label67:
andi.1 a3, a2, 364
li t7, 100
bne a3, t7, _printf_label78
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
addi a1, a1, 1
seqi a3, a2, 0
beq a3, zero, _printf_label88
li a2, 48
sw a0, 21(sp)
sw a1, 24(sp)
mv a0, a2
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
j _printf_label89
_printf_label88:
slti a3, a2, 0
beq a3, zero, _printf_label94
li t6, 0
li t6, 0
sub a2, t6, a2
li a3, 45
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
mv a0, a3
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
_printf_label94:
sw a0, 21(sp)
sw a1, 24(sp)
mv a0, a2
jal print_uint
lw a0, 21(sp)
lw a1, 24(sp)
_printf_label89:
j _printf_label48
_printf_label78:
andi.1 a3, a2, 364
li t7, 115
bne a3, t7, _printf_label102
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
addi a1, a1, 1
_printf_label111:
lt a3, -1(a2)
beq a3, zero, _printf_label113
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
mv a0, a3
jal putchar
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
_printf_label112:
addi a2, a2, 1
j _printf_label111
_printf_label113:
j _printf_label48
_printf_label102:
_printf_label48:
addi a0, a0, 1
j _printf_label47
_printf_label49:
jal flush
li a0, 0
addi sp, sp, 33
lw ra, -3(sp)
ret 
scanf:
sw ra, -3(sp)
addi sp, sp, -39
addi t0, sp, 0
addi t0, t0, 0
sw a1, 0(t0)
addi a1, sp, 0
addi a1, a1, 3
sw a2, 0(a1)
addi a1, sp, 0
addi a1, a1, 6
sw a3, 0(a1)
addi a1, sp, 0
addi a1, a1, 9
sw a4, 0(a1)
addi a1, sp, 0
addi a1, a1, 12
sw a5, 0(a1)
addi a1, sp, 0
addi a1, a1, 15
sw a6, 0(a1)
addi a1, sp, 0
addi a1, a1, 18
sw a7, 0(a1)
li a1, 0
_scanf_label47:
lt a2, -1(a0)
beq a2, zero, _scanf_label49
andi.1 a2, a2, 364
li t7, 37
beq a2, t7, _scanf_label54
sw a0, 21(sp)
sw a1, 24(sp)
jal getchar
lw a0, 21(sp)
lw a1, 24(sp)
j _scanf_label48
_scanf_label54:
addi a0, a0, 1
lt a2, -1(a0)
andi.1 a3, a2, 364
li t7, 37
bne a3, t7, _scanf_label62
sw a0, 21(sp)
sw a1, 24(sp)
jal getchar
lw a0, 21(sp)
lw a1, 24(sp)
j _scanf_label48
_scanf_label62:
andi.1 a3, a2, 364
li t7, 99
bne a3, t7, _scanf_label67
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
jal getchar
mv a3, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
st a3, -1(a2)
addi a1, a1, 1
j _scanf_label48
_scanf_label67:
andi.1 a3, a2, 364
li t7, 100
bne a3, t7, _scanf_label80
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
addi a1, a1, 1
li a3, 0
li a4, 0
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
sw a3, 30(sp)
sw a4, 33(sp)
jal getchar
mv a5, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
lw a3, 30(sp)
lw a4, 33(sp)
_scanf_label94:
andi.1 a6, a5, 364
slti a6, a6, 48
andi.1 a7, a5, 364
li t6, 57
li t6, 57
slt a7, t6, a7
or.1 a6, a6, a7
andi.1 a7, a5, 364
snei a7, a7, 45
and.1 a6, a6, a7, 13
beq a6, zero, _scanf_label95
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
sw a3, 30(sp)
sw a4, 33(sp)
jal getchar
mv a5, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
lw a3, 30(sp)
lw a4, 33(sp)
j _scanf_label94
_scanf_label95:
andi.1 a6, a5, 364
li t7, 45
bne a6, t7, _scanf_label111
li a4, 1
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
sw a3, 30(sp)
sw a4, 33(sp)
jal getchar
mv a5, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
lw a3, 30(sp)
lw a4, 33(sp)
_scanf_label111:
_scanf_label114:
andi.1 a6, a5, 364
slti a6, a6, 48
seq a6, a6, zero
andi.1 a7, a5, 364
li t6, 57
li t6, 57
slt a7, t6, a7
seq a7, a7, zero
and.1 a6, a6, a7, 13
beq a6, zero, _scanf_label115
li t7, 10
mul a3, a3, t7
andi.1 a5, a5, 364
add a3, a3, a5
addi a3, a3, -48
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
sw a3, 30(sp)
sw a4, 33(sp)
jal getchar
mv a5, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
lw a3, 30(sp)
lw a4, 33(sp)
j _scanf_label114
_scanf_label115:
beq a4, zero, _scanf_label130
li t6, 0
li t6, 0
sub a3, t6, a3
_scanf_label130:
sw a3, 0(a2)
j _scanf_label48
_scanf_label80:
andi.1 a3, a2, 364
li t7, 115
bne a3, t7, _scanf_label136
addi a2, sp, 0
li t7, 3
mul a3, a1, t7
add a2, a3, a2
lw a2, 0(a2)
addi a1, a1, 1
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
jal getchar
mv a3, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
_scanf_label146:
andi.1 a4, a3, 364
seqi a4, a4, 32
andi.1 a5, a3, 364
seqi a5, a5, 10
or.1 a4, a4, a5
beq a4, zero, _scanf_label147
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
jal getchar
mv a3, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
j _scanf_label146
_scanf_label147:
_scanf_label156:
andi.1 a4, a3, 364
snei a4, a4, 32
andi.1 a5, a3, 364
snei a5, a5, 10
and.1 a4, a4, a5, 13
beq a4, zero, _scanf_label158
st a3, -1(a2)
addi a2, a2, 1
_scanf_label157:
sw a0, 21(sp)
sw a1, 24(sp)
sw a2, 27(sp)
jal getchar
mv a3, a0
lw a0, 21(sp)
lw a1, 24(sp)
lw a2, 27(sp)
j _scanf_label156
_scanf_label158:
j _scanf_label48
_scanf_label136:
_scanf_label48:
addi a0, a0, 1
j _scanf_label47
_scanf_label49:
li a0, 0
addi sp, sp, 39
lw ra, -3(sp)
ret 
rand_nxt:
li a1, 0
slli a1, a1, 1
add a1, a1, a0
lw a1, 0(a1)
li a2, 1
slli a2, a2, 1
add a2, a2, a0
lw a2, 0(a2)
li a3, 8
srl a2, a2, a3
xor a1, a1, a2
li a2, 2
slli a2, a2, 1
add a2, a2, a0
lw a2, 0(a2)
li a3, 4
sll a2, a2, a3
xor a1, a1, a2
li a2, 173960635
and.1 a2, a1, a2, 13
xor a1, a2, a1
li a2, 2
slli a2, a2, 1
add a2, a2, a0
lw a2, 0(a2)
xor a1, a1, a2
li a2, 2
slli a2, a2, 1
add a2, a2, a0
li a3, 1
slli a3, a3, 1
add a3, a3, a0
lw a3, 0(a3)
sw a3, 0(a2)
li a2, 1
slli a2, a2, 1
add a2, a2, a0
li a3, 0
slli a3, a3, 1
add a3, a3, a0
lw a3, 0(a3)
sw a3, 0(a2)
li a2, 0
slli a2, a2, 1
add a0, a2, a0
sw a1, 0(a0)
mv a0, a1
ret 
krand:
sw ra, -3(sp)
addi sp, sp, -9
bne a0, zero, _krand_label5
mv a0, a1
jal rand_nxt
mv a2, a0
mv a0, a2
addi sp, sp, 9
lw ra, -3(sp)
ret 
_krand_label5:
addi a2, a0, -1
sw a0, 0(sp)
sw a1, 3(sp)
mv a0, a2
jal krand
lw a0, 0(sp)
lw a1, 3(sp)
addi a0, a0, -1
jal krand
addi sp, sp, 9
lw ra, -3(sp)
ret 
korand:
sw ra, -3(sp)
addi sp, sp, -6
sw a1, 0(sp)
jal krand
lw a1, 0(sp)
mv a0, a1
jal rand_nxt
addi sp, sp, 6
lw ra, -3(sp)
ret 
mod256:
slti a1, a0, 0
beq a1, zero, _mod256_label4
li t6, 0
li t6, 0
sub a0, t6, a0
_mod256_label4:
li t7, 134217728
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label8
li t7, 134217728
sub a0, a0, t7
_mod256_label8:
li t7, 67108864
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label13
li t7, 67108864
sub a0, a0, t7
_mod256_label13:
li t7, 33554432
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label18
li t7, 33554432
sub a0, a0, t7
_mod256_label18:
li t7, 16777216
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label23
li t7, 16777216
sub a0, a0, t7
_mod256_label23:
li t7, 8388608
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label28
li t7, 8388608
sub a0, a0, t7
_mod256_label28:
li t7, 4194304
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label33
li t7, 4194304
sub a0, a0, t7
_mod256_label33:
li t7, 2097152
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label38
li t7, 2097152
sub a0, a0, t7
_mod256_label38:
li t7, 1048576
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label43
li t7, 1048576
sub a0, a0, t7
_mod256_label43:
li t7, 524288
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label48
li t7, 524288
sub a0, a0, t7
_mod256_label48:
li t7, 262144
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label53
li t7, 262144
sub a0, a0, t7
_mod256_label53:
li t7, 131072
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label58
li t7, 131072
sub a0, a0, t7
_mod256_label58:
li t7, 65536
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label63
li t7, 65536
sub a0, a0, t7
_mod256_label63:
li t7, 32768
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label68
li t7, 32768
sub a0, a0, t7
_mod256_label68:
li t7, 16384
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label73
li t7, 16384
sub a0, a0, t7
_mod256_label73:
li t7, 8192
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label78
li t7, 8192
sub a0, a0, t7
_mod256_label78:
li t7, 4096
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label83
li t7, 4096
sub a0, a0, t7
_mod256_label83:
li t7, 2048
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label88
li t7, 2048
sub a0, a0, t7
_mod256_label88:
li t7, 1024
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label93
li t7, 1024
sub a0, a0, t7
_mod256_label93:
li t7, 512
slt a1, a0, t7
seq a1, a1, zero
beq a1, zero, _mod256_label98
li t7, 512
sub a0, a0, t7
_mod256_label98:
slti a1, a0, 256
seq a1, a1, zero
beq a1, zero, _mod256_label103
addi a0, a0, -256
_mod256_label103:
ret 
output_char:
sw ra, -3(sp)
addi sp, sp, -60
addi a2, sp, 0
addi a2, a2, 0
li a3, -107926890
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 3
li a3, 183809428
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 6
li a3, -27185992
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 9
li a3, 110476987
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 12
li a3, -58061571
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 15
li a3, -158064555
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 18
li a3, 3427701
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 21
li a3, -137464245
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 24
li a3, -75567140
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 27
li a3, -84029180
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 30
li a3, 178190618
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 33
li a3, 95621370
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 36
li a3, -143894446
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 39
li a3, 77274578
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 42
li a3, 141495623
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 45
li a3, 99400550
sw a3, 0(a2)
addi a2, sp, 0
addi a2, a2, 48
li a3, 12764307
sw a3, 0(a2)
addi a2, sp, 0
li t7, 3
mul a1, a1, t7
add a1, a1, a2
lw a1, 0(a1)
add a0, a0, a1
la a1, __strings+65
li a2, 9
srl a2, a0, a2
sw a0, 51(sp)
sw a1, 54(sp)
mv a0, a2
jal mod256
mv a2, a0
lw a0, 51(sp)
lw a1, 54(sp)
sw a0, 51(sp)
mv a0, a1
mv a1, a2
jal printf
lw a0, 51(sp)
la a1, __strings+65
li a2, 9
sll a0, a0, a2
sw a1, 51(sp)
jal mod256
lw a1, 51(sp)
mv t6, a1
mv a1, a0
mv a0, t6
jal printf
li a0, 0
addi sp, sp, 60
lw ra, -3(sp)
ret 
main:
sw ra, -3(sp)
addi sp, sp, -66
la a0, __strings+26
jal printf
la a0, __strings+58
la a1, __globals+9
la a2, __globals+9
li a3, 1
slli a3, a3, 1
add a2, a2, a3
la a3, __globals+9
li a4, 2
slli a4, a4, 1
add a3, a3, a4
jal scanf
li a0, 0
_main_label18:
slti a1, a0, 3
beq a1, zero, _main_label20
addi a1, sp, 0
li t7, 3
mul a2, a0, t7
add a1, a2, a1
la a2, __globals+9
li t7, 3
mul a3, a0, t7
add a2, a3, a2
lw a2, 0(a2)
sw a2, 0(a1)
_main_label19:
addi a0, a0, 1
j _main_label18
_main_label20:
li a0, 0
_main_label34:
li t7, 21009
slt a1, a0, t7
beq a1, zero, _main_label36
addi a1, sp, 0
sw a0, 36(sp)
mv a0, a1
jal rand_nxt
lw a0, 36(sp)
_main_label35:
addi a0, a0, 1
j _main_label34
_main_label36:
addi a0, sp, 0
addi a0, a0, 0
lw a0, 0(a0)
li t7, -86444584
beq a0, t7, _main_label52
la a0, __strings+43
jal puts
li a0, 0
addi sp, sp, 66
lw ra, -3(sp)
ret 
_main_label52:
addi a0, sp, 0
addi a0, a0, 3
lw a0, 0(a0)
li t7, -90169833
beq a0, t7, _main_label64
la a0, __strings+43
jal puts
li a0, 0
addi sp, sp, 66
lw ra, -3(sp)
ret 
_main_label64:
addi a0, sp, 0
addi a0, a0, 6
lw a0, 0(a0)
li t7, -55155712
beq a0, t7, _main_label76
la a0, __strings+43
jal puts
li a0, 0
addi sp, sp, 66
lw ra, -3(sp)
ret 
_main_label76:
la a0, __strings+0
jal printf
li a0, 0
li a1, 0
_main_label85:
li t6, 16
li t6, 16
slt a2, t6, a1
seq a2, a2, zero
beq a2, zero, _main_label87
li a2, 0
_main_label95:
slti a3, a2, 3
beq a3, zero, _main_label97
addi a3, sp, 0
li t7, 3
mul a4, a2, t7
add a3, a4, a3
la a4, __globals+9
li t7, 3
mul a5, a2, t7
add a4, a5, a4
lw a4, 0(a4)
sw a4, 0(a3)
_main_label96:
addi a2, a2, 1
j _main_label95
_main_label97:
li t6, 0
li t6, 0
sub a2, t6, a0
_main_label111:
slt a3, a0, a2
seq a3, a3, zero
beq a3, zero, _main_label113
add a3, a2, a0
li a4, 1
srl a3, a3, a4
addi a4, sp, 0
sw a0, 36(sp)
sw a1, 39(sp)
sw a2, 42(sp)
mv a0, a3
mv a1, a4
jal korand
mv a3, a0
lw a0, 36(sp)
lw a1, 39(sp)
lw a2, 42(sp)
li a4, 0
_main_label121:
slti a5, a4, 3
beq a5, zero, _main_label123
addi a5, sp, 9
li t7, 3
mul a6, a4, t7
add a5, a6, a5
la a6, __globals+9
li t7, 3
mul a7, a4, t7
add a6, a7, a6
lw a6, 0(a6)
addi a6, a6, 1
sw a6, 0(a5)
_main_label122:
addi a4, a4, 1
j _main_label121
_main_label123:
li t6, 0
li t6, 0
sub a4, t6, a0
_main_label139:
slt a5, a0, a4
seq a5, a5, zero
beq a5, zero, _main_label141
add a5, a4, a0
li a6, 1
srl a5, a5, a6
addi a6, sp, 9
sw a0, 36(sp)
sw a1, 39(sp)
sw a2, 42(sp)
sw a3, 45(sp)
sw a4, 48(sp)
mv a0, a5
mv a1, a6
jal korand
mv a5, a0
lw a0, 36(sp)
lw a1, 39(sp)
lw a2, 42(sp)
lw a3, 45(sp)
lw a4, 48(sp)
li a6, 0
_main_label149:
slti a7, a6, 3
beq a7, zero, _main_label151
addi a7, sp, 18
li t7, 3
mul t0, a6, t7
add a7, t0, a7
la t0, __globals+9
li t7, 3
mul t1, a6, t7
add t0, t1, t0
lw t0, 0(t0)
addi t0, t0, 2
sw t0, 0(a7)
_main_label150:
addi a6, a6, 1
j _main_label149
_main_label151:
li t6, 0
li t6, 0
sub a6, t6, a0
_main_label167:
slt a7, a0, a6
seq a7, a7, zero
beq a7, zero, _main_label169
add a7, a6, a0
li t0, 1
srl a7, a7, t0
addi t0, sp, 18
sw a0, 36(sp)
sw a1, 39(sp)
sw a2, 42(sp)
sw a3, 45(sp)
sw a4, 48(sp)
sw a5, 51(sp)
sw a6, 54(sp)
mv a0, a7
mv a1, t0
jal korand
mv a7, a0
lw a0, 36(sp)
lw a1, 39(sp)
lw a2, 42(sp)
lw a3, 45(sp)
lw a4, 48(sp)
lw a5, 51(sp)
lw a6, 54(sp)
li t0, 0
_main_label177:
slti t1, t0, 3
beq t1, zero, _main_label179
addi t1, sp, 27
li t7, 3
mul t2, t0, t7
add t1, t2, t1
la t2, __globals+9
li t7, 3
mul t3, t0, t7
add t2, t3, t2
lw t2, 0(t2)
addi t2, t2, 3
sw t2, 0(t1)
_main_label178:
addi t0, t0, 1
j _main_label177
_main_label179:
li t6, 0
li t6, 0
sub t0, t6, a0
_main_label195:
slt t1, a0, t0
seq t1, t1, zero
beq t1, zero, _main_label197
add t1, t0, a0
li t2, 3
srl t1, t1, t2
addi t2, sp, 27
sw a0, 36(sp)
sw a1, 39(sp)
sw a2, 42(sp)
sw a3, 45(sp)
sw a4, 48(sp)
sw a5, 51(sp)
sw a6, 54(sp)
sw a7, 57(sp)
sw t0, 60(sp)
mv a0, t1
mv a1, t2
jal korand
mv t1, a0
lw a0, 36(sp)
lw a1, 39(sp)
lw a2, 42(sp)
lw a3, 45(sp)
lw a4, 48(sp)
lw a5, 51(sp)
lw a6, 54(sp)
lw a7, 57(sp)
lw t0, 60(sp)
la t2, __globals+18
and.T t3, a2, a4, -13
xor t4, a6, t0
xor.1 t3, t3, t4
add t3, t3, a0
li t7, 3
mul t3, t3, t7
add t2, t3, t2
lw t3, 0(t2)
mul t4, a3, a5
mul t4, t4, a7
mul t1, t4, t1
add t1, t3, t1
sw t1, 0(t2)
_main_label196:
addi t0, t0, 1
j _main_label195
_main_label197:
_main_label168:
addi a6, a6, 1
j _main_label167
_main_label169:
_main_label140:
addi a4, a4, 1
j _main_label139
_main_label141:
_main_label112:
addi a2, a2, 1
j _main_label111
_main_label113:
li a3, 0
li t6, 0
li t6, 0
sub a2, t6, a0
_main_label230:
slt a4, a0, a2
seq a4, a4, zero
beq a4, zero, _main_label232
li t7, 1337
mul a3, a3, t7
la a4, __globals+18
add a5, a2, a0
li t7, 3
mul a5, a5, t7
add a4, a5, a4
lw a4, 0(a4)
add a3, a3, a4
_main_label231:
addi a2, a2, 1
j _main_label230
_main_label232:
sw a0, 36(sp)
sw a1, 39(sp)
mv a0, a3
jal output_char
lw a0, 36(sp)
lw a1, 39(sp)
li a2, 1
sll a0, a0, a2
addi a0, a0, 1
_main_label86:
addi a1, a1, 1
j _main_label85
_main_label87:
la a0, __strings+68
jal puts
li a0, 0
addi sp, sp, 66
lw ra, -3(sp)
ret 
__strings:
.tryte 72
.tryte 101
.tryte 114
.tryte 101
.tryte 39
.tryte 115
.tryte 32
.tryte 121
.tryte 111
.tryte 117
.tryte 114
.tryte 32
.tryte 102
.tryte 108
.tryte 97
.tryte 103
.tryte 58
.tryte 32
.tryte 84
.tryte 72
.tryte 85
.tryte 67
.tryte 84
.tryte 70
.tryte 123
.tryte 0
.tryte 73
.tryte 110
.tryte 112
.tryte 117
.tryte 116
.tryte 32
.tryte 112
.tryte 97
.tryte 115
.tryte 115
.tryte 119
.tryte 111
.tryte 114
.tryte 100
.tryte 58
.tryte 32
.tryte 0
.tryte 119
.tryte 114
.tryte 111
.tryte 110
.tryte 103
.tryte 32
.tryte 112
.tryte 97
.tryte 115
.tryte 115
.tryte 119
.tryte 111
.tryte 114
.tryte 100
.tryte 0
.tryte 37
.tryte 100
.tryte 37
.tryte 100
.tryte 37
.tryte 100
.tryte 0
.tryte 37
.tryte 99
.tryte 0
.tryte 125
.tryte 0
.tryte 0
.tryte 0
__globals: