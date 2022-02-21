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
la a1, __globals+9
li a2, 0
la a3, __globals+9
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
la a1, __globals+9
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
la a1, __globals+738
li t7, 729
add a1, a1, t7
bne a0, a1, _putchar_label17
li a0, 1
la a1, __globals+738
li a2, 729
jal write
la a0, __globals+6
la a1, __globals+738
sw a1, 0(a0)
_putchar_label17:
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
_start:
sw ra, -3(sp)
addi sp, sp, -3
la a0, __globals+0
la a1, __globals+3
la a2, __globals+9
sw a2, 0(a1)
sw a2, 0(a0)
la a0, __globals+6
la a1, __globals+738
sw a1, 0(a0)
jal main
jal exit
flush:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 1
la a1, __globals+738
la a2, __globals+6
lw a2, 0(a2)
la a3, __globals+738
sub a2, a2, a3
jal write
la a0, __globals+6
la a1, __globals+738
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
slli a3, a1, 1
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
slli a3, a1, 1
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
slli a3, a1, 1
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
slli a3, a1, 1
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
slli a3, a1, 1
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
sub a3, t6, a3
_scanf_label130:
sw a3, 0(a2)
j _scanf_label48
_scanf_label80:
andi.1 a3, a2, 364
li t7, 115
bne a3, t7, _scanf_label136
addi a2, sp, 0
slli a3, a1, 1
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
main:
sw ra, -3(sp)
addi sp, sp, -45
la a0, __strings+0
jal printf
la a0, __strings+31
addi a1, sp, 0
jal scanf
li a0, 0
_main_label8:
slti a1, a0, 12
beq a1, zero, _main_label10
addi a1, sp, 0
slli a2, a0, 1
add a1, a1, a2
addi a2, sp, 0
slli a3, a0, 1
add a2, a2, a3
addi a2, a2, 3
addi a3, sp, 0
slli a4, a0, 1
add a3, a3, a4
addi a3, a3, 6
sw a0, 39(sp)
mv a0, a1
mv a1, a2
mv a2, a3
jal encrypt
lw a0, 39(sp)
_main_label9:
addi a0, a0, 3
j _main_label8
_main_label10:
addi a0, sp, 0
addi a0, a0, 3
lw a0, 0(a0)
li t7, 135461653
bne a0, t7, _main_label39
addi a0, sp, 0
addi a0, a0, 6
lw a0, 0(a0)
li t7, 137064784
bne a0, t7, _main_label47
addi a0, sp, 0
addi a0, a0, 9
lw a0, 0(a0)
li t7, 85530621
bne a0, t7, _main_label55
addi a0, sp, 0
addi a0, a0, 12
lw a0, 0(a0)
li t7, -174382741
bne a0, t7, _main_label64
addi a0, sp, 0
addi a0, a0, 15
lw a0, 0(a0)
li t7, 7581309
bne a0, t7, _main_label72
addi a0, sp, 0
addi a0, a0, 18
lw a0, 0(a0)
li t7, 17193688
bne a0, t7, _main_label80
addi a0, sp, 0
addi a0, a0, 21
lw a0, 0(a0)
li t7, -24086902
bne a0, t7, _main_label89
addi a0, sp, 0
addi a0, a0, 24
lw a0, 0(a0)
li t7, 164919797
bne a0, t7, _main_label97
addi a0, sp, 0
addi a0, a0, 27
lw a0, 0(a0)
li t7, -118079291
bne a0, t7, _main_label106
addi a0, sp, 0
addi a0, a0, 30
lw a0, 0(a0)
li t7, 189168511
bne a0, t7, _main_label114
addi a0, sp, 0
addi a0, a0, 33
lw a0, 0(a0)
li t7, -171475695
bne a0, t7, _main_label123
la a0, __strings+23
jal puts
li a0, 0
addi sp, sp, 45
lw ra, -3(sp)
ret 
_main_label123:
_main_label114:
_main_label106:
_main_label97:
_main_label89:
_main_label80:
_main_label72:
_main_label64:
_main_label55:
_main_label47:
_main_label39:
la a0, __strings+13
jal puts
li a0, 0
addi sp, sp, 45
lw ra, -3(sp)
ret 
encrypt:
li t7, 387
sub sp, sp, t7
sw s0, 363(sp)
sw s1, 366(sp)
sw s2, 369(sp)
sw s3, 372(sp)
sw s4, 375(sp)
sw s5, 378(sp)
sw s6, 381(sp)
sw s7, 384(sp)
lw a5, 0(a0)
lw a3, 0(a1)
lw a4, 0(a2)
xor.1 t6, a3, a3
sw t6, 231(sp)
li t7, -168190025
or.1 t6, a5, t7
sw t6, 84(sp)
or.T t6, a5, a3
sw t6, 42(sp)
li t7, -168190025
or t6, a3, t7, -13
sw t6, 81(sp)
xor t6, a3, a3
sw t6, 204(sp)
lw t6, 42(sp)
or a7, t6, a3, -13
li t7, -168190025
xor t6, a3, t7
sw t6, 117(sp)
lw t7, 84(sp)
or.1 t0, a3, t7
li t7, -168190025
xor.1 t6, a5, t7
sw t6, 123(sp)
lw t6, 117(sp)
li t7, 140302237
mul a6, t6, t7
xor.1 t6, a3, a5
sw t6, 60(sp)
xor.T t6, a5, a3
sw t6, 12(sp)
li t7, -168190025
xor.1 t6, a3, t7
sw t6, 93(sp)
and.T t6, a5, a3, -13
sw t6, 27(sp)
li t7, 107154443
mul a7, a7, t7
lw t7, 93(sp)
xor.1 t0, t0, t7
li t7, -37913144
mul t0, t0, t7
add t0, a7, t0
lw t6, 93(sp)
li t7, 168190025
or.1 t1, t6, t7
li t7, -168190025
and.1 t6, a5, t7, 13
sw t6, 15(sp)
lw t6, 12(sp)
li t7, 111555270
mul t2, t6, t7
lw t6, 60(sp)
li t7, -144930753
mul a7, t6, t7
li t7, -161059978
mul t1, t1, t7
li t7, -168190025
or.1 t6, a3, t7
sw t6, 24(sp)
add t1, t2, t1
lw t6, 204(sp)
lw t7, 24(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
add t6, t0, t1
sw t6, 3(sp)
lw t6, 81(sp)
lw t7, 42(sp)
or.T t3, t6, t7
li t7, 168190025
and t1, a5, t7, 13
lw t6, 123(sp)
lw t7, 12(sp)
xor t6, t6, t7
sw t6, 0(sp)
li t7, -168190025
and.T t6, a5, t7, -13
sw t6, 30(sp)
lw t6, 30(sp)
li t7, -25545887
mul t0, t6, t7
add a6, a6, t0
li t7, -168190025
and t6, a5, t7, 13
sw t6, 105(sp)
slli t6, a3, 8
sw t6, 45(sp)
lw t6, 81(sp)
xor.1 t0, t6, a3
li t7, -135561302
mul t6, t0, t7
sw t6, 33(sp)
lw t6, 24(sp)
lw t7, 84(sp)
and.T s0, t6, t7, -13
lw t6, 117(sp)
li t7, -168190025
xor.1 t0, t6, t7
lw t6, 18(sp)
li t7, 35784823
mul t2, t6, t7
xor t6, a3, a5
sw t6, 9(sp)
add t4, a7, t2
lw t6, 123(sp)
or s1, t6, a5, -13
li t7, -168190025
xor.T t6, a3, t7
sw t6, 69(sp)
lw t6, 42(sp)
lw t7, 69(sp)
xor.1 t2, t6, t7
lw t7, 105(sp)
xor.1 s3, a3, t7
lw t7, 93(sp)
and.1 t5, t3, t7, 13
lw t7, 69(sp)
or a7, a3, t7, -13
li t7, -17825336
mul t3, s0, t7
lw t6, 123(sp)
lw t7, 24(sp)
and.T s0, t6, t7, -13
li t7, 97544773
mul t6, a3, t7
sw t6, 66(sp)
li t7, -136144022
add s4, t3, t7
lw t7, 231(sp)
and s2, a3, t7, 13
lw t6, 15(sp)
lw t7, 27(sp)
xor.1 t3, t6, t7
li t7, -33897748
mul t6, t1, t7
sw t6, 39(sp)
or t6, a5, a3, -13
sw t6, 102(sp)
li t7, 67576167
mul s5, t3, t7
or.T t3, s3, s1
li t7, -168190025
and.T t6, a3, t7, -13
sw t6, 96(sp)
add t1, a6, s4
lw t7, 45(sp)
add a6, s5, t7
lw t6, 60(sp)
lw t7, 117(sp)
and.T t6, t6, t7, -13
sw t6, 72(sp)
or.1 t6, a5, a3
sw t6, 108(sp)
lw t6, 231(sp)
lw t7, 108(sp)
or s1, t6, t7, -13
add s3, t1, t4
li t7, -26019603
mul t1, t5, t7
lw t7, 42(sp)
xor.1 t4, s2, t7
lw t6, 3(sp)
add t6, t6, s3
sw t6, 21(sp)
lw t6, 69(sp)
xor t5, t6, s0
or.1 t0, t2, t0
li t7, -168190025
or.T t6, a3, t7
sw t6, 36(sp)
lw t6, 36(sp)
li t7, -71421651
mul t6, t6, t7
sw t6, 57(sp)
lw t6, 81(sp)
and t2, t6, a5, 13
lw t6, 12(sp)
li t7, -168190025
xor.1 s0, t6, t7
lw t6, 12(sp)
and.1 s1, t6, s1, 13
li t7, 95911370
mul t6, s1, t7
sw t6, 48(sp)
lw t7, 9(sp)
or t6, a3, t7, -13
sw t6, 3(sp)
lw t6, 42(sp)
lw t7, 36(sp)
and.1 s2, t6, t7, 13
lw t6, 96(sp)
li t7, -168190025
xor.T s1, t6, t7
lw t6, 36(sp)
lw t7, 69(sp)
xor.1 s3, t6, t7
or.T t4, t4, s2
and.T a7, t5, a7, -13
li t7, -124354022
mul t6, s3, t7
sw t6, 87(sp)
li t7, 150534601
mul t0, t0, t7
lw t6, 0(sp)
and t3, t6, t3, 13
lw t7, 102(sp)
xor.T s1, s1, t7
xor.1 t4, t4, s0
lw t6, 204(sp)
lw t7, 27(sp)
and.T t6, t6, t7, -13
sw t6, 6(sp)
li t7, 168190025
or.T s2, a5, t7
xor.T s0, a7, t4
lw t6, 96(sp)
or.T t5, t6, a5
lw t6, 12(sp)
lw t7, 81(sp)
or t4, t6, t7, -13
lw t6, 108(sp)
or.T a7, t6, s2
li t7, -57537272
mul t6, s1, t7
sw t6, 0(sp)
li t7, -124114424
mul s2, t3, t7
li t7, -168190025
xor.T t6, a5, t7
sw t6, 120(sp)
li t7, -91227423
mul t3, s0, t7
lw t6, 24(sp)
lw t7, 120(sp)
or s1, t6, t7, -13
add a6, s2, a6
li t7, -165505764
mul t6, t5, t7
sw t6, 99(sp)
lw t6, 84(sp)
lw t7, 69(sp)
xor t5, t6, t7
add t1, a6, t1
and a6, t5, a3, 13
lw t7, 120(sp)
or.T t6, t2, t7
sw t6, 63(sp)
li t7, -110077701
mul s0, a6, t7
lw t6, 63(sp)
li t7, -15088306
mul t5, t6, t7
li t7, -180397406
mul t6, s1, t7
sw t6, 51(sp)
lw t6, 60(sp)
li t7, -32923660
mul a6, t6, t7
and t6, a5, a3, 13
sw t6, 111(sp)
lw t6, 33(sp)
add s1, t6, t1
and.1 t6, a3, a5, 13
sw t6, 33(sp)
lw t6, 102(sp)
lw t7, 117(sp)
xor.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 24(sp)
li t7, 67180339
mul t1, t6, t7
lw t6, 120(sp)
xor s2, t6, a3
lw t6, 36(sp)
or.T t2, t6, t4
li t7, -173675456
mul t2, t2, t7
lw t6, 21(sp)
add s4, t6, s1
lw t7, 57(sp)
add t4, s0, t7
lw t6, 24(sp)
lw t7, 102(sp)
or.1 s0, t6, t7
lw t6, 72(sp)
lw t7, 204(sp)
xor.T s3, t6, t7
add s1, t0, t5
lw t6, 123(sp)
and.T s0, t6, s0, -13
lw t6, 102(sp)
xor.1 t5, t6, a3
lw t7, 111(sp)
xor.1 s5, a3, t7
lw t6, 48(sp)
add t0, t6, t3
li t7, -168190025
and t6, a3, t7, 13
sw t6, 114(sp)
add t6, s4, t0
sw t6, 72(sp)
lw t7, 204(sp)
xor.1 t3, s2, t7
lw t7, 84(sp)
and t0, a3, t7, 13
li t7, -168190025
and.1 t6, a3, t7, 13
sw t6, 75(sp)
or a7, t3, a7, -13
or s2, s3, s5, -13
add a6, a6, t2
add a6, t1, a6
lw t6, 33(sp)
lw t7, 63(sp)
and.T t3, t6, t7, -13
lw t6, 0(sp)
add t6, t6, s1
sw t6, 78(sp)
lw t6, 81(sp)
lw t7, 63(sp)
or.1 t1, t6, t7
and.1 t2, s0, s2, 13
lw t6, 114(sp)
lw t7, 12(sp)
or s0, t6, t7, -13
lw t6, 93(sp)
lw t7, 117(sp)
and.T t6, t6, t7, -13
sw t6, 57(sp)
lw t7, 3(sp)
and a7, a7, t7, 13
add t6, a6, t4
sw t6, 3(sp)
lw t6, 75(sp)
and a6, t6, a5, 13
xor.1 t5, t5, a6
lw t6, 60(sp)
lw t7, 6(sp)
or.1 t6, t6, t7
sw t6, 90(sp)
lw t6, 36(sp)
and.1 t6, t6, a3, 13
sw t6, 0(sp)
lw t6, 90(sp)
li t7, 31585577
mul a6, t6, t7
lw t6, 105(sp)
lw t7, 75(sp)
or.1 t4, t6, t7
lw t6, 60(sp)
or s2, t6, a3, -13
lw t6, 114(sp)
lw t7, 93(sp)
and s1, t6, t7, 13
li t7, 193233009
mul a7, a7, t7
lw t6, 54(sp)
or t5, t6, t5, -13
li t7, 143026025
mul t5, t5, t7
li t7, -33192882
mul t0, t0, t7
lw t7, 99(sp)
add a7, a7, t7
lw t6, 81(sp)
or s3, t6, a5, -13
lw t7, 45(sp)
add s4, a7, t7
lw t6, 111(sp)
lw t7, 15(sp)
or.T a7, t6, t7
lw t7, 102(sp)
xor.T s0, s0, t7
lw t7, 87(sp)
add s5, s4, t7
li t7, -78946000
mul t6, t3, t7
sw t6, 21(sp)
lw t6, 75(sp)
li t7, -170015278
mul t6, t6, t7
sw t6, 54(sp)
li t7, -81814083
mul s4, s2, t7
xor.T s3, s3, t1
and.T t1, a3, s1, -13
li t7, 124021743
mul s1, t2, t7
lw t6, 39(sp)
add t2, t6, s5
lw t6, 66(sp)
add s2, t6, t2
lw t6, 27(sp)
lw t7, 33(sp)
xor t2, t6, t7
li t7, -27337644
mul s5, t2, t7
xor t6, a5, a5
sw t6, 48(sp)
lw t6, 84(sp)
li t7, -168190025
and t2, t6, t7, 13
li t7, 181440121
mul t3, t2, t7
add t6, t5, s4
sw t6, 6(sp)
and.1 t2, t4, s0, 13
lw t6, 120(sp)
lw t7, 9(sp)
xor.T s4, t6, t7
li t7, -129933724
mul t4, t2, t7
li t7, 159794819
mul s3, s3, t7
lw t6, 204(sp)
li t7, 38860457
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 33(sp)
lw t7, 105(sp)
or t2, t6, t7, -13
lw t7, 51(sp)
add s1, s1, t7
add s0, t4, s5
lw t6, 78(sp)
add t6, t6, s2
sw t6, 45(sp)
lw t6, 96(sp)
lw t7, 33(sp)
and.T t5, t6, t7, -13
lw t6, 3(sp)
add t4, t6, s1
add a6, a6, s3
lw t6, 105(sp)
lw t7, 48(sp)
and s1, t6, t7, 13
lw t6, 108(sp)
xor.1 s3, t6, a3
add s2, t0, a6
or.T s1, s1, s4
lw t6, 123(sp)
xor.T a6, t6, s3
li t7, 575284
mul t0, a6, t7
lw t6, 33(sp)
li t7, -168190025
or t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 0(sp)
li t7, -21436062
mul a6, t6, t7
li t7, 178817635
mul s3, s1, t7
li t7, -53171695
mul s1, a7, t7
lw t6, 96(sp)
lw t7, 111(sp)
and.T a7, t6, t7, -13
lw t7, 27(sp)
or.T t1, t1, t7
add s4, s3, t0
lw t6, 33(sp)
lw t7, 84(sp)
xor.T s3, t6, t7
lw t6, 9(sp)
li t7, -189720627
mul t0, t6, t7
add s1, s1, a6
add a6, t3, s4
li t7, 188092805
mul t1, t1, t7
add a6, s0, a6
lw t6, 21(sp)
add s4, t6, a6
lw t6, 12(sp)
lw t7, 117(sp)
xor.1 s0, t6, t7
lw t6, 63(sp)
lw t7, 69(sp)
xor t3, t6, t7
li t7, -148010510
mul a6, t5, t7
add s2, s2, s4
lw t6, 102(sp)
lw t7, 57(sp)
xor t5, t6, t7
li t7, -26029203
mul t2, t2, t7
xor.T s0, a3, s0
lw t6, 6(sp)
add s2, t6, s2
add t6, t4, s2
sw t6, 0(sp)
li t7, -63518568
mul a7, a7, t7
li t7, 146820843
mul s4, t5, t7
lw t6, 24(sp)
lw t7, 111(sp)
and.1 s2, t6, t7, 13
or t4, s3, s0, -13
lw t6, 102(sp)
xor t5, t6, a3
add s3, s4, a7
lw t6, 15(sp)
li t7, -18468868
mul a7, t6, t7
lw t6, 12(sp)
xor s0, t6, s2
add s1, s1, s3
lw t7, 108(sp)
and s2, t3, t7, 13
add s1, t0, s1
lw t6, 93(sp)
lw t7, 15(sp)
and.T t0, t6, t7, -13
li t7, 95446098
mul t3, t4, t7
li t7, 147032518
mul t4, s2, t7
li t7, -158167816
mul s0, s0, t7
add s1, t1, s1
lw t6, 75(sp)
li t7, 15145449
mul t6, t6, t7
sw t6, 21(sp)
add t1, s0, t2
lw t6, 24(sp)
li t7, 62686332
mul s0, t6, t7
or.T t5, a3, t5
lw t6, 54(sp)
add t1, t6, t1
add t2, t3, t1
li t7, 126144142
mul t1, t5, t7
add a6, a6, s1
li t7, -150215688
mul s1, a5, t7
add s3, a6, t2
lw t6, 3(sp)
li t7, 84987261
mul t2, t6, t7
li t7, -138032458
mul s4, a3, t7
lw t6, 12(sp)
lw t7, 36(sp)
xor s2, t6, t7
li t7, -168190025
xor t6, a5, t7
sw t6, 54(sp)
li t7, -168190025
or t6, a5, t7, -13
sw t6, 51(sp)
lw t6, 117(sp)
lw t7, 69(sp)
xor a6, t6, t7
lw t6, 93(sp)
lw t7, 60(sp)
or.T t3, t6, t7
lw t7, 117(sp)
or t5, a3, t7, -13
li t7, -9844529
mul s2, s2, t7
add s2, t4, s2
add t6, s4, s0
sw t6, 6(sp)
lw t6, 54(sp)
li t7, 58543914
mul t6, t6, t7
sw t6, 57(sp)
add s1, a7, s1
lw t6, 12(sp)
lw t7, 51(sp)
or.T s0, t6, t7
lw t7, 27(sp)
and.1 t4, a3, t7, 13
lw t6, 96(sp)
lw t7, 54(sp)
or a7, t6, t7, -13
li t7, -168190025
or s4, t0, t7, -13
lw t6, 0(sp)
add t0, t6, s3
li t7, 21231527
mul s4, s4, t7
lw t6, 81(sp)
li t7, -33504015
mul t6, t6, t7
sw t6, 12(sp)
lw t6, 114(sp)
lw t7, 42(sp)
xor s3, t6, t7
lw t6, 24(sp)
or s5, t6, s0, -13
lw t6, 108(sp)
li t7, -53017816
mul t6, t6, t7
sw t6, 3(sp)
lw t7, 120(sp)
or.T s0, s3, t7
li t7, 56741655
mul s5, s5, t7
lw t6, 45(sp)
add s3, t6, t0
lw t6, 114(sp)
lw t7, 9(sp)
or.1 t0, t6, t7
add s3, s3, t1
lw t7, 39(sp)
add t1, s4, t7
lw t6, 120(sp)
slli t6, t6, 5
sw t6, 0(sp)
add t1, s2, t1
add t2, t2, s5
lw t7, 30(sp)
or.T s4, a3, t7
lw t7, 27(sp)
and s5, a5, t7, 13
lw t7, 117(sp)
or.T s2, a3, t7
xor.1 s7, t5, t3
lw t6, 51(sp)
lw t7, 114(sp)
and.1 s6, t6, t7, 13
lw t6, 120(sp)
li t7, 171296024
mul t3, t6, t7
add t5, s1, t1
xor s1, a6, s7
lw t6, 81(sp)
and.1 a6, t6, s5, 13
li t7, 102662481
mul t1, s6, t7
li t7, -139328712
mul a6, a6, t7
li t7, 135209933
mul s5, t4, t7
lw t6, 81(sp)
or.T t4, t6, s4
lw t7, 21(sp)
add t5, t5, t7
li t7, 47510486
mul s1, s1, t7
add t5, s3, t5
add s3, s1, s5
lw t6, 48(sp)
or.T a7, t6, a7
lw t6, 231(sp)
or s1, t6, s2, -13
li t7, 102400005
mul s0, s0, t7
lw t7, 90(sp)
or.1 a7, a7, t7
li t7, -37908164
mul s2, a7, t7
add a7, s3, s0
add a6, a6, s2
lw t6, 72(sp)
add t6, t6, t5
sw t6, 21(sp)
add t2, t2, a6
lw t7, 57(sp)
add a7, a7, t7
lw t6, 96(sp)
xor a6, t6, s1
and t0, a5, t0, 13
li t7, -68454953
mul s0, a6, t7
li t7, 60672508
mul a6, t0, t7
lw t6, 12(sp)
add t5, t6, t3
lw t6, 60(sp)
lw t7, 231(sp)
or t0, t6, t7, -13
lw t6, 117(sp)
lw t7, 231(sp)
or s1, t6, t7, -13
li t7, -68935359
mul t3, t4, t7
lw t6, 3(sp)
add t4, t6, s0
lw t6, 54(sp)
li t7, -168190025
xor s0, t6, t7
add t1, t4, t1
lw t6, 75(sp)
xor s3, t6, a3
lw t6, 0(sp)
add t3, t6, t3
li t7, 139912757
mul t4, a3, t7
li t7, 155708076
mul s0, s0, t7
lw t6, 96(sp)
li t7, -148746702
mul s2, t6, t7
lw t6, 117(sp)
lw t7, 108(sp)
or s5, t6, t7, -13
lw t7, 6(sp)
add t2, t2, t7
lw t6, 81(sp)
and.1 s4, t6, s3, 13
xor s3, s5, s1
lw t6, 18(sp)
li t7, 43074922
mul t6, t6, t7
sw t6, 12(sp)
add t2, t2, a7
add s1, t1, t5
li t7, -189748022
mul s3, s3, t7
lw t6, 69(sp)
li t7, 117757999
mul t5, t6, t7
slli s4, s4, 6
lw t6, 108(sp)
lw t7, 81(sp)
or a7, t6, t7, -13
li t7, 87763178
add t1, s2, t7
lw t6, 69(sp)
xor.1 s2, t6, a3
add s0, s4, s0
li t7, 141868497
mul t6, s2, t7
sw t6, 6(sp)
li t7, -44037050
mul a7, a7, t7
add s0, s1, s0
add s0, s0, s3
add s0, t3, s0
add t3, t4, t5
lw t6, 9(sp)
li t7, -164753167
mul t4, t6, t7
lw t6, 51(sp)
and t5, t6, t0, 13
lw t6, 75(sp)
lw t7, 9(sp)
xor.T t0, t6, t7
or.T t5, t5, a3
li t7, -39892014
mul t5, t5, t7
add t5, s0, t5
add a6, a6, t5
lw t6, 75(sp)
and.T t5, t6, a3, -13
add a6, t2, a6
li t7, 61922904
mul t5, t5, t7
li t7, 160567432
mul t0, t0, t7
or.T t6, a4, a5
sw t6, 60(sp)
lw t6, 102(sp)
lw t7, 24(sp)
and.1 t2, t6, t7, 13
add t4, t4, t5
add t6, a6, t3
sw t6, 3(sp)
lw t6, 15(sp)
li t7, -131249169
mul t3, t6, t7
add a6, t1, t4
lw t6, 24(sp)
lw t7, 123(sp)
and.1 t1, t6, t7, 13
lw t6, 33(sp)
or.T t1, t6, t1
li t7, 4526172
mul t4, a3, t7
lw t6, 54(sp)
lw t7, 36(sp)
xor.T t5, t6, t7
li t7, -186086692
mul t1, t1, t7
lw t6, 120(sp)
lw t7, 24(sp)
and.T s0, t6, t7, -13
add t3, t3, t1
lw t6, 117(sp)
li t7, 79640283
mul t1, t6, t7
lw t6, 69(sp)
and.T s1, t6, a3, -13
and t6, a5, a4, 13
sw t6, 84(sp)
li t7, 48420241
mul s2, t5, t7
li t7, -109745145
mul t2, t2, t7
lw t6, 102(sp)
xor.1 t5, t6, s0
add a7, a7, s2
lw t7, 108(sp)
xor.T s0, s1, t7
add a7, t0, a7
lw t6, 24(sp)
li t7, 69710419
mul t0, t6, t7
add t4, a7, t4
lw t7, 96(sp)
xor.T a7, a3, t7
or.1 t5, s0, t5
li t7, -182407817
mul t5, t5, t7
add t2, t5, t2
add t2, t3, t2
add t2, t4, t2
add t0, t2, t0
and.1 t6, a5, a4, 13
sw t6, 192(sp)
or t6, a5, a4, -13
sw t6, 129(sp)
li t7, 123220988
or t6, a5, t7, -13
sw t6, 0(sp)
add t0, t0, t1
xor t6, a5, a4
sw t6, 54(sp)
lw t6, 42(sp)
xor.T a7, t6, a7
and.T t6, a5, a4, -13
sw t6, 24(sp)
lw t6, 12(sp)
add t0, t6, t0
xor.T t6, a5, a4
sw t6, 171(sp)
li t7, -46102714
mul a7, a7, t7
xor.1 t6, a4, a5
sw t6, 120(sp)
add a6, a6, t0
li t7, 123220988
xor t6, a5, t7
sw t6, 90(sp)
add a6, a6, a7
lw t6, 6(sp)
add a7, t6, a6
lw t6, 24(sp)
li t7, 123220988
and.T a6, t6, t7, -13
li t7, 123220988
xor.T t6, a5, t7
sw t6, 63(sp)
lw t6, 63(sp)
li t7, 123220988
xor.1 t0, t6, t7
or.1 t6, a5, a4
sw t6, 111(sp)
li t7, 123220988
and.1 t6, a4, t7, 13
sw t6, 81(sp)
lw t6, 3(sp)
add t1, t6, a7
li t7, 123220988
and.T t6, a4, t7, -13
sw t6, 138(sp)
li t7, -147717563
mul a7, t0, t7
li t7, 123220988
or.T t6, a5, t7
sw t6, 114(sp)
li t7, 123220988
xor.1 t6, a4, t7
sw t6, 42(sp)
lw t6, 21(sp)
add t6, t6, t1
sw t6, 123(sp)
li t7, 75653976
mul t6, a6, t7
sw t6, 9(sp)
lw t6, 123(sp)
lw t7, 123(sp)
xor t6, t6, t7
sw t6, 93(sp)
li t7, 123220988
or.T t6, a4, t7
sw t6, 57(sp)
lw t6, 90(sp)
lw t7, 138(sp)
and.1 t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 123(sp)
li t7, 168945590
xor a6, t6, t7
lw t6, 42(sp)
lw t7, 57(sp)
and.1 t6, t6, t7, 13
sw t6, 87(sp)
li t7, 123220988
xor.1 t6, a5, t7
sw t6, 66(sp)
lw t6, 63(sp)
li t7, 93935518
mul t0, t6, t7
li t7, 123220988
or.1 t6, a4, t7
sw t6, 33(sp)
and.1 t6, a6, a5, 13
sw t6, 75(sp)
add t6, a7, t0
sw t6, 12(sp)
li t7, 123220988
or t6, a6, t7, -13
sw t6, 15(sp)
li t7, 123220988
or.T t6, a6, t7
sw t6, 39(sp)
li t7, 123220988
xor.1 t6, a6, t7
sw t6, 108(sp)
li t7, 123220988
xor t6, a6, t7
sw t6, 27(sp)
lw t6, 66(sp)
li t7, 123220988
or.1 t6, t6, t7
sw t6, 141(sp)
lw t6, 75(sp)
lw t7, 120(sp)
or a7, t6, t7, -13
xor t6, a6, a5
sw t6, 21(sp)
lw t6, 54(sp)
xor.T t0, t6, a6
or t1, a6, a7, -13
li t7, -2545309
mul a7, t0, t7
lw t6, 90(sp)
lw t7, 15(sp)
and.1 t3, t6, t7, 13
lw t6, 87(sp)
li t7, -183658303
mul t2, t6, t7
lw t6, 231(sp)
lw t7, 141(sp)
and t0, t6, t7, 13
and.1 t6, a6, a4, 13
sw t6, 72(sp)
li t7, -182890408
mul t1, t1, t7
add t6, t3, t1
sw t6, 30(sp)
lw t6, 54(sp)
lw t7, 66(sp)
or.T t3, t6, t7
lw t6, 39(sp)
lw t7, 0(sp)
or t1, t6, t7, -13
li t7, 123220988
and.T t6, a6, t7, -13
sw t6, 126(sp)
add a7, a7, t2
or.1 t6, a4, a6
sw t6, 36(sp)
xor t2, a6, a4
lw t6, 108(sp)
lw t7, 66(sp)
xor.T t6, t6, t7
sw t6, 117(sp)
xor.1 t6, a6, a4
sw t6, 18(sp)
lw t7, 72(sp)
xor.T t6, t3, t7
sw t6, 45(sp)
or.T t6, a6, a4
sw t6, 51(sp)
lw t6, 27(sp)
or t4, t6, t1, -13
lw t6, 33(sp)
lw t7, 108(sp)
and.T s0, t6, t7, -13
or t6, a5, a6, -13
sw t6, 78(sp)
lw t6, 81(sp)
lw t7, 51(sp)
and.T t5, t6, t7, -13
lw t6, 51(sp)
li t7, 93886374
mul t3, t6, t7
li t7, 123220988
xor t6, a4, t7
sw t6, 96(sp)
lw t6, 126(sp)
lw t7, 78(sp)
xor.1 s1, t6, t7
lw t6, 21(sp)
lw t7, 126(sp)
xor.1 s2, t6, t7
lw t6, 33(sp)
li t7, -83553346
mul t1, t6, t7
or.T s1, s1, a4
lw t6, 90(sp)
lw t7, 36(sp)
and.1 t6, t6, t7, 13
sw t6, 6(sp)
or s1, t0, s1, -13
lw t6, 0(sp)
xor s0, t6, s0
li t7, 5147863
mul t0, s2, t7
lw t7, 54(sp)
and.T s2, t2, t7, -13
li t7, -53663859
mul t4, t4, t7
li t7, 80880944
mul t2, s0, t7
lw t7, 18(sp)
xor s2, s2, t7
li t7, 114420067
mul s0, s1, t7
li t7, 115553906
mul s1, t5, t7
or.1 t6, a5, a6
sw t6, 144(sp)
lw t6, 96(sp)
li t7, 101432705
mul t5, t6, t7
lw t6, 114(sp)
xor s2, t6, s2
add t2, t2, t3
lw t7, 12(sp)
add t2, t2, t7
add t2, a7, t2
add t0, s1, t0
li t7, 123220988
and.T a7, a5, t7, -13
li t7, -27493859
mul t3, s2, t7
xor t6, a6, a6
sw t6, 150(sp)
lw t6, 30(sp)
add s1, t6, t2
lw t6, 150(sp)
lw t7, 63(sp)
or.1 t2, t6, t7
add t4, s1, t4
add t4, t4, s0
lw t6, 72(sp)
lw t7, 150(sp)
and.1 s0, t6, t7, 13
lw t6, 9(sp)
add t6, t6, t4
sw t6, 9(sp)
add t1, t3, t1
add t1, t5, t1
lw t6, 42(sp)
lw t7, 108(sp)
and.T t3, t6, t7, -13
lw t7, 45(sp)
and.1 t3, t3, t7, 13
and t6, a6, a5, 13
sw t6, 153(sp)
lw t6, 3(sp)
li t7, 21177163
mul t6, t6, t7
sw t6, 42(sp)
lw t6, 138(sp)
lw t7, 192(sp)
or.1 t4, t6, t7
lw t6, 138(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 75(sp)
lw t7, 21(sp)
or t6, t6, t7, -13
sw t6, 69(sp)
and s1, t4, a7, 13
lw t7, 138(sp)
and.1 t4, a4, t7, 13
and.T t6, a6, a5, -13
sw t6, 45(sp)
lw t6, 57(sp)
lw t7, 144(sp)
xor t5, t6, t7
lw t6, 39(sp)
xor s0, t6, s0
lw t6, 51(sp)
lw t7, 45(sp)
or s2, t6, t7, -13
li t7, 123220988
and t6, a6, t7, 13
sw t6, 99(sp)
xor.T t6, a6, a5
sw t6, 105(sp)
lw t6, 99(sp)
xor.1 s3, t6, t2
lw t6, 6(sp)
xor s0, t6, s0
lw t6, 27(sp)
li t7, 123220988
xor t6, t6, t7
sw t6, 12(sp)
li t7, 56374402
mul t2, t3, t7
li t7, 157031765
mul t6, s3, t7
sw t6, 102(sp)
lw t7, 54(sp)
or.T s3, s1, t7
lw t7, 21(sp)
and.T s1, s2, t7, -13
slli t3, a6, 4
add t2, t0, t2
li t7, 140154926
mul t0, t4, t7
and.1 t4, t5, a6, 13
add t2, t2, t1
lw t6, 117(sp)
or.T t1, t6, t4
li t7, -149242613
mul s2, t1, t7
li t7, -191129235
mul t1, s3, t7
lw t6, 27(sp)
xor.1 s0, t6, s0
lw t7, 66(sp)
or.1 t4, a4, t7
li t7, -139001084
mul s1, s1, t7
lw t6, 18(sp)
or.T t5, t6, a5
add t0, t0, s2
li t7, 123220988
or t6, a4, t7, -13
sw t6, 117(sp)
add s1, s1, t3
add t0, t0, t1
li t7, -132884752
mul t3, s0, t7
add t0, t0, s1
lw t7, 45(sp)
xor s0, a7, t7
lw t6, 108(sp)
li t7, 123220988
xor.1 t6, t6, t7
sw t6, 18(sp)
lw t6, 33(sp)
lw t7, 84(sp)
or t1, t6, t7, -13
add t2, t2, t3
lw t6, 153(sp)
lw t7, 87(sp)
or.T s1, t6, t7
lw t6, 15(sp)
lw t7, 192(sp)
xor s2, t6, t7
lw t6, 45(sp)
li t7, -123220988
and.1 s3, t6, t7, 13
xor.1 t3, a7, a4
xor.T s0, s0, t4
lw t7, 21(sp)
xor a7, a4, t7
li t7, -23308694
mul t6, s3, t7
sw t6, 30(sp)
lw t6, 231(sp)
lw t7, 108(sp)
and t6, t6, t7, 13
sw t6, 147(sp)
lw t6, 90(sp)
li t7, 183341636
mul t4, t6, t7
xor.T t6, a4, a6
sw t6, 132(sp)
lw t7, 21(sp)
xor s4, t5, t7
lw t6, 84(sp)
lw t7, 3(sp)
xor.T t5, t6, t7
lw t6, 24(sp)
and s1, t6, s1, 13
xor.1 s1, s1, s2
li t7, 189384309
mul s1, s1, t7
li t7, 123220988
and t6, a4, t7, 13
sw t6, 6(sp)
li t7, 123220988
and.1 t6, a6, t7, 13
sw t6, 135(sp)
lw t6, 102(sp)
add s1, t6, s1
lw t6, 42(sp)
add s3, t6, s1
xor.T s1, a6, s4
lw t6, 54(sp)
lw t7, 117(sp)
or.T s2, t6, t7
lw t6, 0(sp)
and s1, t6, s1, 13
li t7, -56584242
mul s1, s1, t7
lw t6, 69(sp)
lw t7, 132(sp)
or.1 s5, t6, t7
lw t6, 6(sp)
lw t7, 87(sp)
xor t6, t6, t7
sw t6, 102(sp)
and s4, s0, s2, 13
lw t6, 12(sp)
or s2, t6, s5, -13
lw t6, 21(sp)
xor.1 s0, t6, a6
add t0, t0, s3
lw t6, 231(sp)
or s3, t6, t3, -13
or.T t1, t1, s4
add t0, t2, t0
li t7, -98147943
mul t2, t5, t7
add t6, t4, t2
sw t6, 42(sp)
lw t6, 33(sp)
li t7, -147910976
mul t3, t6, t7
li t7, -65984676
mul t6, t1, t7
sw t6, 12(sp)
li t7, 164816077
mul t2, s3, t7
lw t6, 75(sp)
li t7, -99294873
mul t4, t6, t7
or.1 a7, a7, a5
li t7, -22708248
mul s3, a7, t7
li t7, -179909260
mul t5, s2, t7
lw t6, 84(sp)
lw t7, 81(sp)
xor s2, t6, t7
lw t6, 108(sp)
lw t7, 96(sp)
and.T t1, t6, t7, -13
add t2, s1, t2
lw t6, 6(sp)
lw t7, 15(sp)
xor.T a7, t6, t7
add t4, s3, t4
lw t6, 6(sp)
lw t7, 21(sp)
or.1 s1, t6, t7
lw t6, 9(sp)
add t6, t6, t0
sw t6, 3(sp)
li t7, 153058143
mul t0, s0, t7
lw t6, 111(sp)
and s0, t6, s2, 13
lw t6, 135(sp)
lw t7, 111(sp)
and s2, t6, t7, 13
lw t6, 57(sp)
xor s1, t6, s1
add t5, t5, t0
lw t6, 90(sp)
lw t7, 231(sp)
or s3, t6, t7, -13
and t0, a4, a6, 13
xor s4, s2, s3
lw t6, 51(sp)
xor t6, t6, a6
sw t6, 69(sp)
lw t6, 24(sp)
or s3, t6, t0, -13
lw t7, 24(sp)
xor.T s2, t0, t7
li t7, 35188926
mul s0, s0, t7
li t7, 130094098
mul s4, s4, t7
li t7, -113562340
mul s5, s1, t7
li t7, -47117810
mul s1, a7, t7
add s4, s4, s5
li t7, 123220988
or.1 a7, a6, t7
add s1, s0, s1
lw t6, 102(sp)
xor s0, t6, s3
add s4, s4, t3
lw t6, 147(sp)
li t7, -24620971
mul s3, t6, t7
li t7, -104089601
mul s0, s0, t7
lw t6, 87(sp)
lw t7, 114(sp)
and.1 t3, t6, t7, 13
lw t7, 30(sp)
add t5, t5, t7
add s1, s4, s1
lw t6, 126(sp)
and.1 s6, t6, a4, 13
lw t6, 42(sp)
add s5, t6, t5
lw t6, 108(sp)
lw t7, 78(sp)
xor s4, t6, t7
li t7, -86489197
mul t5, s6, t7
li t7, -61055400
mul s2, s2, t7
lw t6, 33(sp)
xor.T t6, t6, a7
sw t6, 30(sp)
lw t6, 12(sp)
add s6, t6, s5
li t7, 123220988
or.T s5, a7, t7
add t4, s6, t4
li t7, -143357467
mul t6, t1, t7
sw t6, 9(sp)
add t4, t2, t4
lw t7, 18(sp)
xor.1 t1, s5, t7
and.T t1, t1, a6, -13
lw t6, 120(sp)
or.T t2, t6, s4
li t7, -137257232
mul s4, t2, t7
li t7, 141445269
mul t2, t1, t7
add s4, s4, s3
lw t6, 117(sp)
lw t7, 39(sp)
or.T t1, t6, t7
lw t6, 141(sp)
lw t7, 72(sp)
and.T s3, t6, t7, -13
lw t6, 33(sp)
xor s3, t6, s3
xor.1 t6, a5, a6
sw t6, 72(sp)
lw t6, 72(sp)
li t7, -139266801
mul s5, t6, t7
add s0, s0, s4
add s4, s1, s0
li t7, 62564782
mul t6, t1, t7
sw t6, 18(sp)
or.T t1, a6, a5
add t6, s2, s5
sw t6, 12(sp)
lw t6, 126(sp)
lw t7, 72(sp)
or.T t6, t6, t7
sw t6, 42(sp)
lw t6, 15(sp)
li t7, -85479949
mul s0, t6, t7
lw t6, 108(sp)
li t7, 123220988
or s1, t6, t7, -13
add t5, t5, t2
lw t7, 51(sp)
xor s2, s3, t7
lw t6, 69(sp)
and.T t2, t6, t1, -13
add s4, t4, s4
lw t7, 120(sp)
and.1 t3, t3, t7, 13
lw t6, 51(sp)
li t7, 76824124
mul t4, t6, t7
xor t6, a4, a4
sw t6, 165(sp)
lw t6, 120(sp)
xor.T s3, t6, t3
add s4, s4, t5
lw t6, 117(sp)
slli t5, t6, 2
li t7, -189541529
mul t3, s2, t7
lw t6, 3(sp)
add t6, t6, s4
sw t6, 147(sp)
li t7, 168175735
mul s1, s1, t7
add t6, s0, s1
sw t6, 102(sp)
li t7, 56777592
mul s1, s3, t7
lw t6, 15(sp)
lw t7, 60(sp)
or s3, t6, t7, -13
lw t6, 114(sp)
and s0, t6, t0, 13
lw t6, 30(sp)
lw t7, 45(sp)
xor.1 s2, t6, t7
lw t6, 171(sp)
li t7, 62052453
mul t6, t6, t7
sw t6, 69(sp)
li t7, -191153740
mul s3, s3, t7
add t3, t3, s1
add t4, t4, t5
or s1, t1, t0, -13
li t7, 59259469
mul s4, s0, t7
lw t6, 0(sp)
or.1 s0, t6, a6
lw t7, 135(sp)
xor.1 t5, t1, t7
lw t6, 57(sp)
lw t7, 78(sp)
or.T s5, t6, t7
add t1, s3, s4
lw t6, 129(sp)
xor.1 s3, t6, a7
lw t6, 171(sp)
or.T t0, t6, t0
or.T t0, s5, t0
lw t6, 78(sp)
and.1 s3, t6, s3, 13
xor.T s2, s2, a7
and t2, s2, t2, 13
lw t7, 60(sp)
or.1 s2, a5, t7
lw t7, 0(sp)
and t6, a6, t7, 13
sw t6, 30(sp)
lw t6, 165(sp)
lw t7, 0(sp)
and s5, t6, t7, 13
li t7, 120517885
mul t2, t2, t7
lw t7, 36(sp)
xor s4, s1, t7
add s7, t2, t4
lw t7, 42(sp)
and s5, s5, t7, 13
li t7, -112385856
mul s1, s3, t7
li t7, -92232879
mul t2, s0, t7
xor.T s2, s2, a5
li t7, -5651841
mul s3, t0, t7
lw t6, 27(sp)
lw t7, 0(sp)
and t4, t6, t7, 13
lw t6, 27(sp)
and.1 s6, t6, a5, 13
xor t0, a6, t5
add t3, t3, s7
li t7, -80356422
mul t6, t0, t7
sw t6, 3(sp)
lw t6, 12(sp)
add s0, t6, t3
li t7, 123220988
xor.T t5, a6, t7
lw t6, 135(sp)
li t7, 95241628
mul t6, t6, t7
sw t6, 12(sp)
lw t7, 66(sp)
or t3, a7, t7, -13
lw t6, 126(sp)
lw t7, 54(sp)
or.1 t0, t6, t7
lw t6, 45(sp)
and.1 a7, t6, s4, 13
lw t6, 9(sp)
add s0, t6, s0
li t7, 47617879
mul s4, s5, t7
lw t6, 147(sp)
add t6, t6, s0
sw t6, 42(sp)
lw t6, 102(sp)
add s4, t6, s4
and.1 s0, a4, t5, 13
lw t6, 18(sp)
add t6, t6, s4
sw t6, 0(sp)
lw t6, 69(sp)
add s1, t6, s1
xor.1 t5, s2, s6
add s2, s1, s3
lw t6, 63(sp)
xor.1 s1, t6, a6
lw t6, 21(sp)
xor.T t6, t6, a6
sw t6, 69(sp)
add t6, t1, s2
sw t6, 45(sp)
li t7, 161651889
mul a7, a7, t7
add a7, a7, t2
lw t6, 27(sp)
lw t7, 120(sp)
or.1 s2, t6, t7
lw t7, 99(sp)
xor t1, t3, t7
lw t7, 132(sp)
xor t4, t4, t7
lw t6, 135(sp)
xor.T s1, t6, s1
lw t6, 192(sp)
li t7, 21025324
mul t3, t6, t7
lw t7, 150(sp)
or t2, a4, t7, -13
or.1 s3, t5, s1
li t7, -180105937
mul s4, t1, t7
lw t6, 30(sp)
li t7, -29448324
mul t1, t6, t7
lw t6, 231(sp)
lw t7, 111(sp)
and s1, t6, t7, 13
lw t6, 33(sp)
li t7, 123220988
and.T t5, t6, t7, -13
lw t6, 66(sp)
li t7, 123220988
xor.T s5, t6, t7
lw t6, 60(sp)
or.1 s2, t6, s2
li t7, 39595152
mul s2, s2, t7
xor.T t0, s0, t0
li t7, 117991761
mul t0, t0, t7
add s0, s4, t0
lw t7, 99(sp)
and.T t0, s5, t7, -13
li t7, -187594190
mul s3, s3, t7
lw t6, 120(sp)
lw t7, 81(sp)
xor.1 s5, t6, t7
lw t6, 117(sp)
li t7, -109348018
mul s4, t6, t7
lw t7, 96(sp)
xor.1 t2, t2, t7
or.T s7, t0, t2
lw t6, 57(sp)
lw t7, 6(sp)
xor.T t2, t6, t7
lw t6, 135(sp)
li t7, 123220988
or t0, t6, t7, -13
lw t6, 99(sp)
and.1 s6, t6, t4, 13
li t7, 40582503
mul t4, s7, t7
lw t6, 12(sp)
add s7, t6, t4
li t7, 130043226
mul t6, s5, t7
sw t6, 9(sp)
lw t6, 51(sp)
slli t4, t6, 7
li t7, -42835396
mul s1, s1, t7
add t3, t3, s1
add s1, s4, s2
li t7, 130261582
mul s2, s6, t7
add s1, s7, s1
li t7, 124676506
mul t5, t5, t7
lw t7, 3(sp)
add s2, s2, t7
add s2, s2, s3
add s2, a7, s2
lw t6, 99(sp)
lw t7, 21(sp)
and.T s3, t6, t7, -13
add a7, s1, t1
add t6, s2, s0
sw t6, 12(sp)
and.T s2, a4, a6, -13
lw t6, 141(sp)
and.1 s0, t6, s3, 13
or t1, a4, a6, -13
li t7, 74384998
mul s3, s0, t7
lw t6, 36(sp)
lw t7, 72(sp)
or.1 s0, t6, t7
lw t6, 48(sp)
xor.T s1, t6, t1
add t5, t5, s3
add t5, t3, t5
lw t7, 138(sp)
and.1 t3, s2, t7, 13
add t6, a7, t5
sw t6, 3(sp)
and.T a7, a4, t2, -13
li t7, -134326784
mul a7, a7, t7
lw t7, 63(sp)
and.T s2, t1, t7, -13
li t7, 123220988
and t5, a5, t7, 13
add t2, a7, t4
li t7, 40684329
mul s3, s1, t7
lw t6, 105(sp)
lw t7, 66(sp)
or t1, t6, t7, -13
lw t7, 15(sp)
xor.T t4, t5, t7
and.T s4, t3, t0, -13
lw t6, 165(sp)
li t7, -19970928
mul a7, t6, t7
lw t7, 27(sp)
xor.1 t0, s2, t7
lw t6, 135(sp)
and s1, t6, a6, 13
xor.T t4, t4, s0
li t7, -180031371
mul t0, t0, t7
lw t6, 111(sp)
lw t7, 96(sp)
and s2, t6, t7, 13
add t2, s3, t2
lw t6, 105(sp)
lw t7, 39(sp)
and.T s3, t6, t7, -13
lw t6, 108(sp)
lw t7, 171(sp)
or.1 t3, t6, t7
li t7, 119784992
mul s4, s4, t7
lw t6, 153(sp)
xor s5, t6, t5
lw t6, 138(sp)
lw t7, 126(sp)
or s0, t6, t7, -13
lw t6, 9(sp)
add t2, t6, t2
add t6, t2, s4
sw t6, 18(sp)
lw t6, 90(sp)
lw t7, 87(sp)
and.1 t2, t6, t7, 13
lw t6, 144(sp)
xor.T t2, t6, t2
lw t7, 75(sp)
or.1 s6, t5, t7
lw t6, 135(sp)
lw t7, 66(sp)
and.T s7, t6, t7, -13
lw t6, 6(sp)
and.1 s4, t6, s1, 13
and s1, s3, s5, 13
lw t6, 87(sp)
li t7, 96082749
mul t5, t6, t7
and.T s3, s2, s7, -13
li t7, -149438808
mul s2, s1, t7
lw t6, 69(sp)
or s5, t6, s6, -13
li t7, 188805503
mul t1, t1, t7
li t7, 156082952
mul t4, t4, t7
lw t6, 54(sp)
lw t7, 129(sp)
and.1 s1, t6, t7, 13
li t7, 5779660
mul s6, s3, t7
li t7, -127841315
mul s3, s5, t7
add s5, s6, t4
li t7, 190486680
mul t4, s4, t7
li t7, -190041786
mul s0, s0, t7
li t7, -150186993
mul s4, t3, t7
or t6, a3, a4, -13
sw t6, 30(sp)
lw t6, 36(sp)
li t7, 123220988
or.T s6, t6, t7
and.1 t6, a4, a3, 13
sw t6, 63(sp)
add t3, s5, a7
add s2, s4, s2
li t7, -169996105
mul a7, s6, t7
add t0, s3, t0
add t1, t1, s2
add s2, t1, t5
xor.1 t5, s1, t2
lw t7, 192(sp)
xor.T t1, a4, t7
add s0, s0, s2
and.T t6, a4, a3, -13
sw t6, 51(sp)
lw t6, 117(sp)
li t7, 166851663
mul t6, t6, t7
sw t6, 6(sp)
and t6, a4, a3, 13
sw t6, 99(sp)
add t3, t3, t4
lw t7, 27(sp)
and t2, a5, t7, 13
add t3, t3, s0
and.1 a6, t5, a6, 13
lw t6, 3(sp)
add t4, t6, t0
li t7, -44576611
mul a6, a6, t7
xor t6, a3, a4
sw t6, 114(sp)
add t3, t3, a6
li t7, -177249178
xor a6, a3, t7
xor.1 t6, a4, a3
sw t6, 75(sp)
lw t6, 111(sp)
xor t0, t6, a5
li t7, 166735954
and t6, a4, t7, 13
sw t6, 15(sp)
lw t6, 12(sp)
add t4, t6, t4
or.1 t6, a4, a3
sw t6, 126(sp)
xor.T t6, a3, a4
sw t6, 177(sp)
or.T t6, a3, a4
sw t6, 9(sp)
li t7, 166735954
and.1 t6, a6, t7, 13
sw t6, 81(sp)
lw t7, 60(sp)
or s0, t2, t7, -13
lw t7, 18(sp)
add t2, t4, t7
lw t7, 75(sp)
or.T t6, a4, t7
sw t6, 21(sp)
lw t6, 192(sp)
li t7, 166735954
and.T t5, t6, t7, -13
lw t6, 45(sp)
add t2, t6, t2
add t2, t2, t3
xor t1, t1, s0
li t7, 80881012
mul t1, t1, t7
xor t6, a6, a6
sw t6, 69(sp)
add t4, a7, t1
lw t6, 60(sp)
lw t7, 129(sp)
xor.1 a7, t6, t7
and.T t6, a6, a5, -13
sw t6, 72(sp)
li t7, 166735954
and.T t6, a5, t7, -13
sw t6, 96(sp)
li t7, 166735954
or.1 t6, a4, t7
sw t6, 183(sp)
xor t1, a5, t5
li t7, 12105473
mul a7, a7, t7
lw t6, 183(sp)
li t7, -148092605
mul t6, t6, t7
sw t6, 12(sp)
and.1 t6, a5, a6, 13
sw t6, 138(sp)
li t7, 166735954
xor.1 t6, a4, t7
sw t6, 162(sp)
lw t6, 111(sp)
lw t7, 69(sp)
xor t5, t6, t7
xor.1 t6, a5, a6
sw t6, 207(sp)
xor.1 t3, a4, a6
lw t6, 96(sp)
or.T t0, t6, t0
li t7, 166735954
or t6, a4, t7, -13
sw t6, 39(sp)
lw t7, 6(sp)
add s0, t4, t7
lw t7, 81(sp)
or.T t4, t0, t7
and t6, a5, a6, 13
sw t6, 18(sp)
lw t7, 15(sp)
xor.1 t5, t5, t7
li t7, 166735954
and.T t6, a4, t7, -13
sw t6, 159(sp)
li t7, 149814577
mul t0, a6, t7
add t2, t2, s0
lw t6, 0(sp)
add s0, t6, t2
li t7, 166735954
xor.T t6, a6, t7
sw t6, 156(sp)
lw t6, 162(sp)
lw t7, 159(sp)
and t2, t6, t7, 13
lw t6, 42(sp)
add t6, t6, s0
sw t6, 213(sp)
li t7, -151594328
mul s0, t5, t7
xor.T t6, a6, a4
sw t6, 174(sp)
li t7, 166735954
xor.T t6, a5, t7
sw t6, 87(sp)
lw t7, 72(sp)
or s2, t3, t7, -13
xor t1, t1, t4
lw t6, 87(sp)
and s1, t6, a4, 13
li t7, -127154709
mul t1, t1, t7
li t7, 166735954
xor.T t6, a4, t7
sw t6, 6(sp)
lw t6, 207(sp)
lw t7, 15(sp)
xor t3, t6, t7
lw t6, 138(sp)
lw t7, 162(sp)
xor t5, t6, t7
lw t6, 72(sp)
lw t7, 156(sp)
and.T t4, t6, t7, -13
lw t6, 72(sp)
or.T s2, t6, s2
li t7, -146376889
mul s3, t4, t7
add a7, t1, a7
lw t6, 183(sp)
lw t7, 207(sp)
and.T t1, t6, t7, -13
lw t6, 18(sp)
and t1, t6, t1, 13
lw t6, 96(sp)
li t7, 166735954
xor.T t4, t6, t7
add s3, s0, s3
lw t7, 165(sp)
or.1 s0, s2, t7
li t7, -123250913
mul s1, s1, t7
lw t6, 18(sp)
li t7, 166735954
and s2, t6, t7, 13
li t7, 166735954
and t6, a5, t7, 13
sw t6, 147(sp)
li t7, 127347432
mul s0, s0, t7
lw t6, 156(sp)
or s4, t6, a4, -13
add t6, a7, s3
sw t6, 27(sp)
li t7, 150622554
mul a7, t2, t7
add a7, t0, a7
xor.T t0, t5, s4
or t6, a5, a6, -13
sw t6, 120(sp)
lw t6, 183(sp)
li t7, 115987984
mul t2, t6, t7
lw t6, 120(sp)
lw t7, 6(sp)
xor t5, t6, t7
li t7, 185454008
mul t5, t5, t7
li t7, 119593431
mul t0, t0, t7
xor s2, s2, t3
add t5, s1, t5
or.1 t6, a6, a4
sw t6, 153(sp)
lw t6, 60(sp)
lw t7, 231(sp)
and s1, t6, t7, 13
or t6, a6, a4, -13
sw t6, 186(sp)
add t3, s0, t0
li t7, 166735954
xor t6, a6, t7
sw t6, 3(sp)
li t7, 106289088
mul t6, t4, t7
sw t6, 42(sp)
li t7, 166735954
or.1 t6, a5, t7
sw t6, 57(sp)
xor t0, a4, a6
xor.T t1, s2, t1
li t7, 166735954
xor.1 t6, a5, t7
sw t6, 195(sp)
li t7, 50303662
mul t1, t1, t7
li t7, 166735954
or.T t6, a4, t7
sw t6, 45(sp)
add t2, t5, t2
li t7, 132021952
mul t4, s1, t7
li t7, 166735954
or t6, a5, t7, -13
sw t6, 78(sp)
li t7, 166735954
xor t6, a5, t7
sw t6, 141(sp)
li t7, 166735954
xor t6, a4, t7
sw t6, 210(sp)
add t4, t2, t4
add t3, t3, t1
lw t6, 141(sp)
lw t7, 174(sp)
and.T t2, t6, t7, -13
xor t6, a6, a5
sw t6, 33(sp)
li t7, 177855189
mul t6, a4, t7
sw t6, 0(sp)
lw t6, 210(sp)
lw t7, 165(sp)
xor t1, t6, t7
add t4, a7, t4
lw t6, 33(sp)
lw t7, 18(sp)
xor.1 s0, t6, t7
lw t6, 78(sp)
or.1 a7, t6, a4
add t5, t3, t4
lw t6, 48(sp)
lw t7, 186(sp)
or.T t4, t6, t7
lw t6, 153(sp)
or.1 s2, t6, t0
li t7, -153191537
mul t3, s0, t7
lw t6, 87(sp)
li t7, -7551782
mul t6, t6, t7
sw t6, 105(sp)
li t7, 166735954
and.1 t6, a4, t7, 13
sw t6, 102(sp)
lw t6, 27(sp)
add t6, t6, t5
sw t6, 90(sp)
lw t7, 3(sp)
or.1 t0, t2, t7
lw t7, 231(sp)
or t2, t4, t7, -13
li t7, 57633035
mul s0, t2, t7
li t7, -151485415
mul t5, t0, t7
li t7, 78447930
mul s1, t1, t7
lw t7, 195(sp)
or.T t4, a6, t7
li t7, 179723778
mul t0, a7, t7
lw t6, 78(sp)
lw t7, 186(sp)
or.1 t1, t6, t7
li t7, 190220627
mul s4, s2, t7
lw t6, 45(sp)
lw t7, 24(sp)
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 138(sp)
lw t7, 141(sp)
xor t2, t6, t7
lw t6, 57(sp)
li t7, -112079760
mul s2, t6, t7
lw t7, 81(sp)
and.T a7, a6, t7, -13
lw t7, 192(sp)
xor.T s3, a5, t7
lw t7, 42(sp)
add s4, s4, t7
li t7, 166735954
or.T t6, a6, t7
sw t6, 42(sp)
or.1 t6, a5, a6
sw t6, 132(sp)
add s5, t3, s4
li t7, 166735954
or t6, a6, t7, -13
sw t6, 48(sp)
lw t6, 18(sp)
li t7, 97547744
mul s4, t6, t7
lw t6, 111(sp)
lw t7, 15(sp)
xor.1 t6, t6, t7
sw t6, 27(sp)
add s0, s1, s0
lw t6, 69(sp)
lw t7, 153(sp)
xor t3, t6, t7
add s5, s5, t5
lw t6, 132(sp)
li t7, 79112491
mul s1, t6, t7
and.T t6, a6, a4, -13
sw t6, 219(sp)
li t7, -67645775
mul t5, t4, t7
and t6, a6, a4, 13
sw t6, 111(sp)
add s1, s1, s2
add s0, s5, s0
slli t6, s3, 2
sw t6, 66(sp)
and.1 t6, a4, a6, 13
sw t6, 150(sp)
lw t6, 48(sp)
and t4, t6, a4, 13
or.T t2, t1, t2
lw t6, 12(sp)
add t1, t6, s0
add s0, s1, s4
add t0, t0, s0
li t7, -155758960
mul t2, t2, t7
lw t6, 102(sp)
lw t7, 219(sp)
or.T s0, t6, t7
lw t6, 72(sp)
or.T s1, t6, s0
lw t7, 105(sp)
add s2, t5, t7
li t7, 166735954
and.T s0, a6, t7, -13
lw t6, 0(sp)
add t0, t6, t0
lw t6, 186(sp)
or.T t5, t6, t3
li t7, -117273221
mul t3, s1, t7
add s1, t0, s2
lw t6, 120(sp)
li t7, 18981321
mul t6, t6, t7
sw t6, 0(sp)
lw t7, 210(sp)
xor t0, t4, t7
li t7, 166735954
and.1 t0, t0, t7, 13
add t2, t2, t3
lw t7, 60(sp)
xor.T t4, s0, t7
lw t6, 15(sp)
and t3, t6, a7, 13
add a7, s1, t2
lw t7, 36(sp)
or.1 t5, t5, t7
lw t6, 42(sp)
lw t7, 111(sp)
or.T t2, t6, t7
add a7, t1, a7
lw t6, 90(sp)
add t6, t6, a7
sw t6, 201(sp)
li t7, -167227650
mul t2, t2, t7
lw t6, 48(sp)
lw t7, 171(sp)
and.T a7, t6, t7, -13
lw t6, 3(sp)
li t7, -57609083
mul t6, t6, t7
sw t6, 90(sp)
li t7, 134702968
mul t5, t5, t7
lw t6, 3(sp)
lw t7, 141(sp)
and s0, t6, t7, 13
or.T t1, a6, a5
li t7, 166735954
or.1 t6, a6, t7
sw t6, 180(sp)
xor.1 s1, s0, t4
lw t6, 72(sp)
lw t7, 153(sp)
and t4, t6, t7, 13
lw t7, 192(sp)
and t4, t4, t7, 13
li t7, -15769172
mul s0, t4, t7
xor t4, t0, t3
lw t7, 27(sp)
and t0, s1, t7, 13
li t7, 58844385
mul t3, t0, t7
lw t7, 66(sp)
add t5, t5, t7
lw t7, 153(sp)
or t0, a5, t7, -13
li t7, 57645421
mul s1, t4, t7
lw t6, 183(sp)
lw t7, 186(sp)
xor.1 t4, t6, t7
lw t6, 150(sp)
li t7, 174447923
mul s2, t6, t7
add t3, s1, t3
add t6, t5, t3
sw t6, 60(sp)
add t3, s0, s2
add t6, t2, t3
sw t6, 36(sp)
lw t6, 147(sp)
lw t7, 102(sp)
and t3, t6, t7, 13
lw t7, 186(sp)
or t6, a5, t7, -13
sw t6, 135(sp)
lw t6, 132(sp)
lw t7, 42(sp)
xor.T t2, t6, t7
lw t6, 6(sp)
li t7, 166735954
and.1 t5, t6, t7, 13
lw t6, 15(sp)
lw t7, 3(sp)
or t6, t6, t7, -13
sw t6, 198(sp)
lw t7, 150(sp)
xor s1, t5, t7
lw t6, 159(sp)
or.1 s3, t6, t1
lw t6, 192(sp)
lw t7, 135(sp)
or.1 t1, t6, t7
lw t6, 147(sp)
li t7, 130592773
mul t5, t6, t7
li t7, 151546036
mul s0, t3, t7
lw t6, 153(sp)
xor.1 s2, t6, t1
lw t6, 102(sp)
li t7, -59701792
mul t1, t6, t7
li t7, -42060750
mul s1, s1, t7
lw t7, 207(sp)
and.T s3, s3, t7, -13
lw t6, 42(sp)
lw t7, 102(sp)
and.T s4, t6, t7, -13
lw t6, 87(sp)
and.1 t3, t6, a5, 13
lw t7, 33(sp)
xor.T a7, a7, t7
lw t6, 153(sp)
and.T s5, t6, a6, -13
li t7, 66924782
mul t6, a7, t7
sw t6, 216(sp)
li t7, -20258174
mul a7, s5, t7
li t7, 167366819
mul s2, s2, t7
li t7, -89427517
mul s5, t4, t7
li t7, -105370417
mul s4, s4, t7
lw t6, 18(sp)
xor t4, t6, s3
li t7, -104521262
mul s3, t4, t7
lw t6, 180(sp)
xor.1 t4, t6, t0
lw t6, 84(sp)
li t7, 150259521
mul s6, t6, t7
add s2, s2, s3
add t6, s4, s5
sw t6, 66(sp)
lw t6, 24(sp)
li t7, 5816394
mul t0, t6, t7
lw t6, 0(sp)
add s3, t6, s2
li t7, -119181000
mul s2, t2, t7
add t2, t5, s6
add t5, s1, s0
or.T t6, a6, a4
sw t6, 117(sp)
lw t6, 162(sp)
lw t7, 156(sp)
xor s1, t6, t7
xor.T t6, a5, a6
sw t6, 105(sp)
lw t7, 117(sp)
xor.T t6, a5, t7
sw t6, 12(sp)
lw t7, 90(sp)
add t6, t5, t7
sw t6, 27(sp)
lw t6, 36(sp)
add t5, t6, s3
li t7, -164448272
mul t6, a6, t7
sw t6, 108(sp)
add s0, s2, t1
lw t7, 150(sp)
or.1 t1, t4, t7
xor.T t3, t3, s1
li t7, -131270037
mul t3, t3, t7
lw t6, 207(sp)
lw t7, 57(sp)
or.T t6, t6, t7
sw t6, 36(sp)
slli t1, t1, 1
add t1, a7, t1
lw t6, 60(sp)
add t6, t6, t5
sw t6, 222(sp)
lw t6, 69(sp)
lw t7, 117(sp)
and t6, t6, t7, 13
sw t6, 90(sp)
add t6, t2, s0
sw t6, 189(sp)
lw t6, 129(sp)
li t7, -166735954
or.T a7, t6, t7
lw t6, 105(sp)
lw t7, 3(sp)
and.T t6, t6, t7, -13
sw t6, 69(sp)
lw t6, 219(sp)
li t7, -166735954
or.T t6, t6, t7
sw t6, 144(sp)
lw t6, 48(sp)
lw t7, 57(sp)
or t2, t6, t7, -13
lw t7, 195(sp)
xor t4, a5, t7
or.1 t6, t4, a7
sw t6, 60(sp)
add t6, t0, t3
sw t6, 168(sp)
lw t6, 87(sp)
lw t7, 156(sp)
or.T t6, t6, t7
sw t6, 87(sp)
li t7, 166735954
xor.1 a7, a6, t7
li t7, -166735954
or.T t6, a7, t7
sw t6, 0(sp)
lw t6, 33(sp)
lw t7, 153(sp)
or.1 t6, t6, t7
sw t6, 33(sp)
li t7, 166735954
or.1 t0, t2, t7
lw t6, 216(sp)
add t1, t6, t1
lw t6, 27(sp)
add t1, t6, t1
lw t6, 117(sp)
lw t7, 0(sp)
and.T t2, t6, t7, -13
lw t6, 12(sp)
lw t7, 36(sp)
and.1 t3, t6, t7, 13
lw t6, 90(sp)
lw t7, 57(sp)
and.T s0, t6, t7, -13
lw t7, 66(sp)
add t4, t1, t7
lw t6, 15(sp)
lw t7, 33(sp)
and.T t6, t6, t7, -13
sw t6, 0(sp)
li t7, 51202585
mul t1, t0, t7
lw t6, 210(sp)
lw t7, 138(sp)
or.T s1, t6, t7
lw t6, 150(sp)
li t7, 45705052
mul t0, t6, t7
lw t7, 189(sp)
add s2, t4, t7
li t7, 72895234
mul t4, t2, t7
lw t6, 87(sp)
lw t7, 198(sp)
xor.1 t2, t6, t7
lw t6, 159(sp)
xor.1 t5, t6, a7
li t7, -191054585
mul s0, s0, t7
lw t6, 69(sp)
or.T s1, t6, s1
lw t7, 60(sp)
and t3, t3, t7, 13
lw t6, 222(sp)
add t6, t6, s2
sw t6, 27(sp)
lw t7, 54(sp)
xor.T s1, s1, t7
li t7, -141051739
mul t3, t3, t7
lw t6, 168(sp)
add t3, t6, t3
li t7, 38832453
mul s1, s1, t7
add t1, t1, s1
add t1, t1, s0
add t1, t4, t1
lw t6, 96(sp)
xor.1 t4, t6, t5
lw t6, 150(sp)
li t7, -165590242
mul t5, t6, t7
li t7, 115714979
mul s2, t2, t7
lw t6, 39(sp)
lw t7, 24(sp)
xor.1 t2, t6, t7
lw t6, 231(sp)
li t7, 166735954
and s0, t6, t7, 13
add s1, t1, t5
lw t7, 18(sp)
or.T t1, t4, t7
lw t6, 138(sp)
lw t7, 96(sp)
and.1 t4, t6, t7, 13
slli t5, t4, 3
lw t6, 129(sp)
lw t7, 162(sp)
and t4, t6, t7, 13
li t7, 166735954
and.1 t6, a5, t7, 13
sw t6, 24(sp)
lw t6, 105(sp)
lw t7, 42(sp)
or s3, t6, t7, -13
lw t6, 144(sp)
and s3, t6, s3, 13
li t7, -38460282
mul t1, t1, t7
lw t6, 186(sp)
lw t7, 54(sp)
or t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 108(sp)
add s2, t6, s2
lw t6, 24(sp)
xor s4, t6, a6
li t7, -102173772
mul s5, s3, t7
lw t6, 48(sp)
xor.T s3, t6, s0
add t0, s5, t0
xor.T s4, s4, a4
lw t6, 6(sp)
lw t7, 84(sp)
or.T s0, t6, t7
add s1, s1, s2
add s1, t3, s1
lw t6, 120(sp)
lw t7, 138(sp)
xor s2, t6, t7
lw t6, 0(sp)
xor.1 t3, t6, s3
li t7, -158127911
mul s2, s2, t7
li t7, -69045843
mul s3, s4, t7
li t7, 70238783
mul t3, t3, t7
add t3, t5, t3
add t3, s3, t3
lw t6, 6(sp)
and.T t4, t6, t4, -13
add t5, t0, t3
lw t6, 72(sp)
li t7, -18513194
mul t3, t6, t7
li t7, 5396689
mul t0, t2, t7
add s1, s1, t5
lw t6, 117(sp)
lw t7, 171(sp)
xor.1 s3, t6, t7
lw t6, 141(sp)
lw t7, 111(sp)
xor.1 t5, t6, t7
add s2, s2, t0
li t7, 166735954
and t0, a6, t7, 13
lw t7, 207(sp)
xor.1 s5, t0, t7
lw t6, 186(sp)
lw t7, 6(sp)
xor.1 s4, t6, t7
li t7, -93603526
mul t2, s0, t7
li t7, -26097772
mul t5, t5, t7
lw t6, 105(sp)
or s0, t6, a6, -13
li t7, -3228352
mul t4, t4, t7
lw t7, 129(sp)
or s3, s3, t7, -13
add t1, s1, t1
li t7, 152448311
mul s5, s5, t7
lw t7, 129(sp)
and s1, t0, t7, 13
lw t6, 111(sp)
and s4, t6, s4, 13
add t4, t4, s5
lw t6, 147(sp)
and.T s0, t6, s0, -13
add t6, t1, s2
sw t6, 33(sp)
lw t6, 195(sp)
lw t7, 174(sp)
and.1 t1, t6, t7, 13
li t7, 176269793
mul s0, s0, t7
lw t6, 12(sp)
li t7, 150001091
mul s2, t6, t7
lw t6, 210(sp)
and.T t6, t6, a7, -13
sw t6, 54(sp)
li t7, 82452259
mul s3, s3, t7
xor s4, s4, a4
lw t6, 180(sp)
li t7, -39421324
mul t6, t6, t7
sw t6, 0(sp)
add t2, t2, s2
li t7, -158885691
mul s4, s4, t7
lw t6, 81(sp)
lw t7, 45(sp)
and.T s2, t6, t7, -13
add t3, t5, t3
lw t7, 84(sp)
or t5, s1, t7, -13
add s3, s4, s3
lw t6, 78(sp)
lw t7, 48(sp)
and.T s4, t6, t7, -13
li t7, 166735954
and.T a7, a7, t7, -13
li t7, 166735954
or.1 s1, t5, t7
lw t6, 186(sp)
li t7, -108893157
mul t5, t6, t7
lw t6, 18(sp)
lw t7, 96(sp)
xor.T s5, t6, t7
or.1 a7, s5, a7
lw t7, 24(sp)
or.T s4, s4, t7
add t3, t4, t3
add t4, s0, s3
add t4, t3, t4
lw t7, 102(sp)
and.T t3, s4, t7, -13
lw t6, 153(sp)
or t1, t6, t1, -13
or.1 s0, t0, s2
lw t6, 135(sp)
li t7, 182546811
mul t6, t6, t7
sw t6, 24(sp)
li t7, -90301779
mul s0, s0, t7
li t7, 147765009
mul s2, t3, t7
lw t6, 195(sp)
lw t7, 111(sp)
or t3, t6, t7, -13
li t7, 80576043
mul s1, s1, t7
li t7, -88996323
mul s3, t1, t7
lw t6, 183(sp)
li t7, -48370929
mul t1, t6, t7
add t2, t2, s1
add t6, t5, s3
sw t6, 12(sp)
li t7, 58772310
add t2, t2, t7
add t6, t4, t2
sw t6, 18(sp)
lw t6, 156(sp)
or t4, t6, a5, -13
lw t6, 6(sp)
li t7, -26746908
mul t6, t6, t7
sw t6, 39(sp)
li t7, 183873719
mul t6, a7, t7
sw t6, 36(sp)
lw t6, 219(sp)
xor.1 t2, t6, a4
add t5, s2, s0
lw t6, 117(sp)
lw t7, 42(sp)
xor.1 a7, t6, t7
lw t6, 138(sp)
lw t7, 165(sp)
or.1 s0, t6, t7
lw t7, 186(sp)
xor.T t2, t2, t7
lw t7, 54(sp)
add t6, t5, t7
sw t6, 42(sp)
lw t6, 150(sp)
lw t7, 15(sp)
and.1 s1, t6, t7, 13
lw t6, 150(sp)
lw t7, 147(sp)
or.T t5, t6, t7
xor s2, t2, t5
li t7, 159112740
mul t5, a7, t7
li t7, 98248856
mul a7, t3, t7
lw t6, 192(sp)
xor.1 t2, t6, a6
lw t7, 156(sp)
and.T a6, s1, t7, -13
lw t6, 45(sp)
lw t7, 195(sp)
xor.1 t3, t6, t7
lw t7, 81(sp)
xor s1, s2, t7
and.1 s0, s0, t3, 13
li t7, -129515480
mul t3, s1, t7
lw t6, 156(sp)
lw t7, 138(sp)
and s1, t6, t7, 13
lw t6, 162(sp)
or.T t4, t6, t4
lw t7, 84(sp)
and s2, t4, t7, 13
lw t7, 147(sp)
or.1 t4, s0, t7
lw t7, 129(sp)
xor.1 s0, s1, t7
li t7, 149234752
mul t4, t4, t7
li t7, 68230574
mul s2, s2, t7
lw t6, 48(sp)
lw t7, 132(sp)
xor s1, t6, t7
add t1, t1, t3
add t3, s2, t5
li t7, 145548563
mul a6, a6, t7
li t7, -90556451
and t6, a4, t7, 13
sw t6, 72(sp)
li t7, -90556451
or.T t6, a4, t7
sw t6, 84(sp)
lw t6, 0(sp)
add t1, t6, t1
li t7, -32557968
add t1, t1, t7
lw t7, 45(sp)
or.1 t5, s1, t7
li t7, 61739227
mul s1, s0, t7
ori t5, t5, 0
lw t7, 24(sp)
add s0, t1, t7
lw t7, 84(sp)
or t1, a4, t7, -13
add t6, t4, s1
sw t6, 0(sp)
lw t6, 81(sp)
li t7, -166735954
or s1, t6, t7, -13
lw t6, 3(sp)
lw t7, 78(sp)
or.T t4, t6, t7
li t7, -20721617
mul t6, t5, t7
sw t6, 15(sp)
lw t6, 156(sp)
xor.1 t5, t6, a5
xor.T t0, t0, t2
lw t6, 231(sp)
and a5, t6, s1, 13
li t7, 63985877
mul t2, a5, t7
lw t6, 63(sp)
li t7, 9734291
mul a5, t6, t7
li t7, 154108164
mul t0, t0, t7
add a7, s0, a7
li t7, -90556451
or t6, a4, t7, -13
sw t6, 6(sp)
lw t7, 39(sp)
add t0, t0, t7
li t7, -90556451
and.T t6, a3, t7, -13
sw t6, 24(sp)
add t0, t3, t0
add a7, a7, t0
lw t6, 36(sp)
add a7, t6, a7
lw t6, 231(sp)
or t0, t6, t5, -13
lw t6, 12(sp)
add a7, t6, a7
li t7, -90556451
or.T t6, a3, t7
sw t6, 36(sp)
li t7, 144470650
mul t5, t0, t7
li t7, -148154511
mul t3, t4, t7
lw t6, 42(sp)
add a7, t6, a7
lw t6, 18(sp)
add a7, t6, a7
lw t6, 6(sp)
li t7, 152813263
mul t0, t6, t7
lw t6, 114(sp)
lw t7, 204(sp)
or t4, t6, t7, -13
lw t6, 33(sp)
add a7, t6, a7
lw t7, 36(sp)
xor s0, t1, t7
add a6, a6, t5
li t7, -90556451
and.1 t6, a4, t7, 13
sw t6, 3(sp)
add t1, t2, a6
lw t6, 114(sp)
and.T a6, t6, a4, -13
li t7, 145473868
mul t2, a6, t7
lw t7, 24(sp)
or.T a6, a4, t7
li t7, -83380962
mul s0, s0, t7
lw t6, 231(sp)
lw t7, 9(sp)
or t5, t6, t7, -13
add t2, s0, t2
li t7, -90556451
xor t6, a4, t7
sw t6, 12(sp)
li t7, -89437161
mul t5, t5, t7
li t7, -90556451
and.T t6, a4, t7, -13
sw t6, 39(sp)
lw t6, 126(sp)
and.T t4, t6, t4, -13
add t5, t5, a5
add t3, t1, t3
lw t6, 39(sp)
lw t7, 177(sp)
or.T t1, t6, t7
lw t6, 12(sp)
lw t7, 75(sp)
xor a5, t6, t7
lw t6, 0(sp)
add s0, t6, t3
li t7, -183712128
mul t3, t4, t7
lw t7, 39(sp)
xor.1 a6, a6, t7
lw t6, 15(sp)
add s0, t6, s0
lw t6, 165(sp)
xor.T t4, t6, a4
add t0, t0, t5
lw t6, 114(sp)
li t7, -90556451
xor t5, t6, t7
add t0, t2, t0
add a7, a7, s0
lw t6, 27(sp)
add t2, t6, a7
li t7, -81825352
mul a7, a5, t7
li t7, -90556451
xor.T t6, a3, t7
sw t6, 33(sp)
lw t6, 126(sp)
li t7, -90556451
and.T a5, t6, t7, -13
lw t6, 201(sp)
add t6, t6, t2
sw t6, 180(sp)
lw t7, 6(sp)
or.1 s0, a3, t7
li t7, -44537803
mul t4, t4, t7
lw t6, 33(sp)
lw t7, 99(sp)
and.T t2, t6, t7, -13
li t7, -90556451
or.1 t6, a3, t7
sw t6, 87(sp)
li t7, -90556451
or t6, a3, t7, -13
sw t6, 78(sp)
lw t6, 30(sp)
or.T a5, t6, a5
li t7, -47342197
mul s1, t1, t7
lw t6, 39(sp)
lw t7, 78(sp)
or t1, t6, t7, -13
and.T t1, t5, t1, -13
add t3, t3, s1
lw t6, 87(sp)
lw t7, 12(sp)
and t5, t6, t7, 13
add t6, t0, t3
sw t6, 57(sp)
lw t7, 177(sp)
or.T s1, t5, t7
lw t6, 3(sp)
li t7, 31693331
mul t5, t6, t7
slli t3, s0, 7
lw t6, 3(sp)
lw t7, 39(sp)
xor s0, t6, t7
lw t6, 63(sp)
and.T t0, t6, a4, -13
lw t7, 126(sp)
and.T s0, s0, t7, -13
li t7, -94867930
mul s0, s0, t7
li t7, -90556451
and t6, a3, t7, 13
sw t6, 60(sp)
xor.1 a6, a6, s1
li t7, 126217238
mul s1, a6, t7
li t7, -151682265
mul a6, t1, t7
add t4, a6, t4
lw t6, 84(sp)
lw t7, 63(sp)
xor.1 t1, t6, t7
lw t7, 87(sp)
and a6, t2, t7, 13
lw t6, 78(sp)
lw t7, 3(sp)
and.T t2, t6, t7, -13
li t7, -45729477
mul a6, a6, t7
add a7, s1, a7
add t6, a7, t4
sw t6, 18(sp)
lw t6, 84(sp)
or.1 t6, t6, a4
sw t6, 27(sp)
add t4, s0, t5
lw t6, 36(sp)
lw t7, 3(sp)
or.T a7, t6, t7
lw t6, 12(sp)
lw t7, 9(sp)
xor.T t5, t6, t7
or.1 t5, t5, a4
or.1 t2, t5, t2
add t6, t3, t4
sw t6, 15(sp)
lw t7, 72(sp)
xor.1 t3, a4, t7
or.T a5, a5, t3
li t7, -90556451
xor.T t6, a4, t7
sw t6, 81(sp)
li t7, -150540731
mul t3, a5, t7
li t7, -178023014
mul a5, t2, t7
lw t6, 81(sp)
lw t7, 78(sp)
xor.1 t2, t6, t7
lw t6, 51(sp)
or t6, t6, a4, -13
sw t6, 48(sp)
add t3, a6, t3
or.T a6, a7, t0
li t7, 87430594
mul a6, a6, t7
add a7, t3, a5
lw t6, 33(sp)
or a5, t6, a4, -13
and t1, a4, t1, 13
lw t6, 30(sp)
xor.1 t0, t6, a4
xor t1, t2, t1
li t7, -118972221
mul t1, t1, t7
lw t6, 99(sp)
lw t7, 165(sp)
or.1 t3, t6, t7
lw t6, 33(sp)
li t7, -175603573
mul t2, t6, t7
lw t6, 48(sp)
li t7, -42288653
mul t6, t6, t7
sw t6, 66(sp)
lw t6, 6(sp)
lw t7, 36(sp)
or.1 t4, t6, t7
li t7, -90556451
xor.1 t6, a3, t7
sw t6, 45(sp)
lw t6, 9(sp)
lw t7, 45(sp)
or t5, t6, t7, -13
li t7, -90556451
and.1 t6, a3, t7, 13
sw t6, 0(sp)
xor.T t3, a4, t3
xor.1 t0, t0, t4
xor t0, a4, t0
or.T a5, t5, a5
li t7, 179923521
mul t4, t0, t7
li t7, -90556451
xor.1 t6, a4, t7
sw t6, 42(sp)
lw t6, 27(sp)
li t7, -147333057
mul t0, t6, t7
li t7, 109063865
mul a5, a5, t7
add a5, t2, a5
lw t6, 42(sp)
lw t7, 114(sp)
and.T t2, t6, t7, -13
xor t2, t3, t2
li t7, -166996984
mul t2, t2, t7
lw t6, 6(sp)
slli t3, t6, 4
add t1, t1, t4
add a7, a7, t1
add a6, a7, a6
li t7, 90556451
xor a7, a4, t7
lw t7, 99(sp)
or.T t1, a4, t7
li t7, -90556451
xor t6, a3, t7
sw t6, 54(sp)
lw t6, 15(sp)
add a6, t6, a6
li t7, -59879677
mul a7, a7, t7
lw t6, 18(sp)
add a6, t6, a6
lw t6, 177(sp)
lw t7, 54(sp)
xor.T t4, t6, t7
lw t6, 0(sp)
xor.T t5, t6, t4
lw t6, 57(sp)
add a6, t6, a6
lw t7, 42(sp)
and t4, a4, t7, 13
li t7, -185241432
mul t5, t5, t7
li t7, -21839975
mul s0, a4, t7
li t7, -44059559
mul t1, t1, t7
add t5, t5, t3
li t7, 1537356
mul t3, a4, t7
add t6, t3, s0
sw t6, 57(sp)
add a7, t0, a7
add t2, t2, a7
lw t6, 177(sp)
li t7, -90556451
xor.T t0, t6, t7
lw t6, 0(sp)
li t7, 90556451
and.1 t3, t6, t7, 13
lw t6, 99(sp)
lw t7, 3(sp)
and.1 a7, t6, t7, 13
add t5, t2, t5
lw t7, 51(sp)
or.1 t4, t4, t7
li t7, -90556451
or.1 t6, a4, t7
sw t6, 69(sp)
lw t6, 39(sp)
lw t7, 9(sp)
and t2, t6, t7, 13
lw t6, 66(sp)
add t5, t6, t5
lw t6, 231(sp)
lw t7, 0(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
add a5, a5, t5
xor.T t3, t3, t4
add t6, a6, a5
sw t6, 15(sp)
li t7, -152721491
mul t4, t3, t7
lw t6, 51(sp)
li t7, -53484084
mul t3, t6, t7
lw t6, 66(sp)
li t7, -131624452
mul a6, t6, t7
lw t6, 69(sp)
lw t7, 165(sp)
or.T a5, t6, t7
li t7, -134349710
mul t2, t2, t7
add s0, t3, t1
lw t7, 9(sp)
and t0, t0, t7, 13
lw t6, 72(sp)
lw t7, 231(sp)
and t3, t6, t7, 13
li t7, 89827802
mul t5, a5, t7
li t7, -24644348
mul t1, t0, t7
lw t6, 177(sp)
li t7, 81925664
mul t0, t6, t7
lw t7, 42(sp)
and.1 s3, a4, t7, 13
lw t6, 63(sp)
li t7, 104237825
mul a5, t6, t7
add t4, t4, s0
lw t6, 87(sp)
lw t7, 3(sp)
xor.T s0, t6, t7
lw t7, 126(sp)
xor.T s0, s0, t7
lw t6, 9(sp)
lw t7, 114(sp)
and.T s1, t6, t7, -13
lw t6, 78(sp)
lw t7, 114(sp)
and.T s2, t6, t7, -13
xor a7, a7, s3
lw t7, 0(sp)
xor.1 s3, a3, t7
li t7, 78841959
mul a7, a7, t7
lw t6, 36(sp)
lw t7, 42(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
add s5, t2, t5
lw t7, 69(sp)
and s4, a4, t7, 13
lw t7, 69(sp)
xor.1 t2, a4, t7
or.1 t5, t3, s0
li t7, -90556451
xor s0, s1, t7
or.1 t3, s3, s2
add t4, t4, s5
lw t6, 57(sp)
add s1, t6, t4
and t4, a3, s4, 13
li t7, 147031464
mul t3, t3, t7
add s1, s1, a6
add a6, a7, t1
lw t7, 231(sp)
and a7, s0, t7, 13
li t7, 130508618
mul t1, t5, t7
add t0, t1, t0
li t7, 125762162
mul a7, a7, t7
add t0, a7, t0
lw t6, 15(sp)
add t6, t6, s1
sw t6, 57(sp)
lw t6, 231(sp)
li t7, -90556451
or.T t6, t6, t7
sw t6, 15(sp)
lw t6, 15(sp)
li t7, 157548793
mul t5, t6, t7
li t7, -190611545
mul a7, t4, t7
lw t6, 3(sp)
lw t7, 114(sp)
or.1 t4, t6, t7
lw t6, 12(sp)
li t7, -90556451
and t1, t6, t7, 13
or.T s0, t4, t2
lw t7, 30(sp)
and.1 t2, a4, t7, 13
lw t6, 45(sp)
lw t7, 9(sp)
or.T t4, t6, t7
add a5, a5, s0
add a5, a5, t3
lw t6, 204(sp)
li t7, -6685680
mul t3, t6, t7
li t7, -79860785
mul t1, t1, t7
add t3, t5, t3
add a5, t0, a5
li t7, -91749320
mul t5, t2, t7
add a6, a6, a5
lw t6, 12(sp)
or.T a5, t6, a4
lw t6, 114(sp)
lw t7, 33(sp)
and.T t2, t6, t7, -13
lw t6, 6(sp)
lw t7, 231(sp)
and t0, t6, t7, 13
lw t7, 0(sp)
or s0, a4, t7, -13
lw t6, 42(sp)
lw t7, 72(sp)
or s2, t6, t7, -13
li t7, 90556451
or.1 s5, t4, t7
add t4, t3, t5
lw t7, 81(sp)
xor.1 t5, a4, t7
slli t3, s0, 1
and.1 s0, a4, t5, 13
lw t6, 63(sp)
li t7, -90556451
or.1 t5, t6, t7
add s1, a7, t4
li t7, 103957543
mul s3, s0, t7
lw t6, 21(sp)
li t7, 56740815
mul a7, t6, t7
li t7, -40031895
mul t4, t0, t7
li t7, -48118753
mul t5, t5, t7
lw t6, 87(sp)
lw t7, 42(sp)
or.T s0, t6, t7
lw t6, 48(sp)
li t7, 112463508
mul t0, t6, t7
lw t6, 39(sp)
lw t7, 75(sp)
xor.T s4, t6, t7
or.1 s6, a5, s5
lw t7, 51(sp)
or.1 a5, a4, t7
lw t6, 81(sp)
lw t7, 30(sp)
or.T s5, t6, t7
lw t6, 24(sp)
or.1 s7, t6, s2
li t7, 110562599
mul s2, s6, t7
add s2, s2, t1
or.1 s6, s7, t2
lw t6, 3(sp)
xor t1, t6, s5
lw t6, 18(sp)
li t7, -83408710
mul t2, t6, t7
li t7, -26071741
mul s5, s6, t7
add s2, t3, s2
add t3, s3, s5
add s1, s1, s2
add a6, a6, s1
lw t6, 57(sp)
add t6, t6, a6
sw t6, 33(sp)
lw t6, 84(sp)
or a6, t6, s4, -13
add t3, t4, t3
add t4, t2, t5
and t2, s0, a6, 13
lw t6, 165(sp)
li t7, 55206329
mul a6, t6, t7
add t3, t3, t4
lw t7, 126(sp)
xor t1, t1, t7
li t7, 24369257
mul t1, t1, t7
li t7, 47391374
mul t2, t2, t7
add t6, t3, a7
sw t6, 3(sp)
add a7, t2, a6
lw t6, 84(sp)
li t7, -90556451
xor.T a6, t6, t7
add a7, t1, a7
add t0, t0, a7
lw t6, 9(sp)
lw t7, 69(sp)
and.1 a7, t6, t7, 13
lw t6, 72(sp)
lw t7, 177(sp)
or.T t1, t6, t7
li t7, -157883804
mul t2, t1, t7
lw t6, 42(sp)
li t7, 52770551
mul t1, t6, t7
lw t6, 12(sp)
li t7, -59872349
mul t4, t6, t7
lw t6, 165(sp)
lw t7, 75(sp)
and t3, t6, t7, 13
xor.T t3, a4, t3
add t2, t2, t4
li t7, -130475941
mul t4, a5, t7
add t6, t0, t2
sw t6, 18(sp)
lw t6, 84(sp)
lw t7, 165(sp)
or.T t0, t6, t7
lw t6, 165(sp)
xor.1 t2, t6, a4
lw t6, 6(sp)
lw t7, 81(sp)
and.1 t5, t6, t7, 13
li t7, -149305695
mul s0, t3, t7
lw t7, 60(sp)
or.1 t3, a6, t7
add a6, t4, s0
lw t7, 15(sp)
or.T t4, t5, t7
add a6, t1, a6
li t7, -24976663
mul t5, t3, t7
lw t7, 69(sp)
xor.1 t3, a5, t7
lw t7, 0(sp)
or.1 t1, a4, t7
lw t6, 75(sp)
and a5, t6, a7, 13
li t7, -135734455
mul t4, t4, t7
li t7, -182064795
mul a5, a5, t7
add t5, t5, a5
li t7, -189201943
mul t2, t2, t7
li t7, 163441776
mul a7, t0, t7
li t7, 96728652
mul a5, a3, t7
lw t6, 63(sp)
and.T s0, t6, a3, -13
add t0, t4, t2
li t7, -90556451
or.T t2, t3, t7
add t0, t5, t0
li t7, 82647014
mul t3, t2, t7
lw t6, 114(sp)
lw t7, 66(sp)
or.T t2, t6, t7
add a7, a7, t3
xor.T t3, s0, a4
xor t1, t1, t3
li t7, 179310048
mul t1, t1, t7
add a7, a7, t1
add a7, t0, a7
ori t1, a4, 0
li t7, 112059725
mul t0, t2, t7
add t6, a6, a7
sw t6, 15(sp)
xor.1 t1, t1, a4
li t7, 15891515
mul a6, a4, t7
lw t6, 9(sp)
lw t7, 30(sp)
and.1 t2, t6, t7, 13
lw t6, 45(sp)
lw t7, 114(sp)
and a7, t6, t7, 13
lw t6, 177(sp)
lw t7, 6(sp)
and.T t3, t6, t7, -13
lw t7, 84(sp)
xor.1 t4, t3, t7
lw t6, 126(sp)
lw t7, 12(sp)
xor.T t3, t6, t7
li t7, -185669017
mul t2, t2, t7
li t7, -22973813
mul t1, t1, t7
lw t7, 114(sp)
xor.1 t4, t4, t7
add a5, a5, t0
li t7, -28949561
mul t0, t4, t7
add a6, a6, t0
add t1, t2, t1
lw t6, 30(sp)
li t7, 81580004
mul t4, t6, t7
lw t6, 126(sp)
lw t7, 9(sp)
xor t0, t6, t7
li t7, 6300816
mul a7, a7, t7
lw t7, 30(sp)
xor.T t2, a4, t7
lw t6, 81(sp)
lw t7, 51(sp)
and.T t5, t6, t7, -13
lw t6, 78(sp)
or.1 t3, t6, t3
li t7, 183260683
mul t3, t3, t7
add t3, t3, t4
lw t6, 42(sp)
lw t7, 75(sp)
and.1 t4, t6, t7, 13
li t7, -173852696
mul t5, t5, t7
add t5, a7, t5
lw t6, 6(sp)
lw t7, 78(sp)
or a7, t6, t7, -13
add t3, t3, t5
add t1, t1, t3
lw t6, 231(sp)
lw t7, 36(sp)
or t3, t6, t7, -13
lw t6, 54(sp)
lw t7, 9(sp)
xor.1 t5, t6, t7
and.1 t4, t4, t0, 13
and t0, t2, t5, 13
lw t7, 204(sp)
and t2, t4, t7, 13
li t7, -82276235
mul t5, t2, t7
lw t7, 42(sp)
and.T t4, a4, t7, -13
li t7, -116447253
mul t2, t0, t7
add t0, t1, t5
lw t6, 69(sp)
xor.T t1, t6, t3
add a5, a5, t0
add t0, a6, a5
lw t6, 63(sp)
and.T a6, t6, t4, -13
lw t6, 0(sp)
and a5, t6, t1, 13
li t7, 46800655
mul a5, a5, t7
add a5, t2, a5
lw t7, 30(sp)
and.1 t1, a6, t7, 13
li t7, 138688565
mul a6, a4, t7
li t7, 47076079
mul t2, t1, t7
lw t7, 12(sp)
xor t1, a4, t7
li t7, -116133862
mul t1, t1, t7
add a6, a6, t2
add t2, a5, a6
li t7, -153383328
mul a5, a7, t7
lw t7, 63(sp)
or a7, a3, t7, -13
li t7, 168168291
mul a6, a4, t7
li t7, -167744632
mul a4, a7, t7
lw t6, 72(sp)
lw t7, 78(sp)
or.1 a7, t6, t7
add a4, t1, a4
add a4, t2, a4
add a4, t0, a4
lw t6, 72(sp)
li t7, -90556451
or.1 t0, t6, t7
lw t6, 15(sp)
add a4, t6, a4
lw t6, 18(sp)
add a4, t6, a4
xor a7, a7, t0
li t7, -24212727
mul a7, a7, t7
lw t6, 177(sp)
xor.T t0, t6, a3
lw t6, 9(sp)
lw t7, 30(sp)
xor t1, t6, t7
lw t6, 42(sp)
li t7, 90556451
or.1 t2, t6, t7
xor.1 t0, t2, t0
and t0, t1, t0, 13
li t7, 56650555
mul t1, t0, t7
lw t6, 39(sp)
lw t7, 45(sp)
and.1 t0, t6, t7, 13
lw t7, 27(sp)
xor.1 t0, t0, t7
li t7, 173410144
mul t2, t0, t7
lw t6, 81(sp)
or t3, t6, a3, -13
lw t6, 54(sp)
lw t7, 12(sp)
and t0, t6, t7, 13
add a7, a7, t1
lw t7, 81(sp)
xor.1 t1, t3, t7
li t7, -14480857
xor.T t6, a3, t7
sw t6, 60(sp)
add a7, a7, t2
li t7, -122211454
mul t6, a3, t7
sw t6, 6(sp)
add a7, a6, a7
and.1 a6, t0, t1, 13
li t7, -14480857
and t6, a3, t7, 13
sw t6, 63(sp)
li t7, -14480857
or.T t6, a3, t7
sw t6, 42(sp)
li t7, 135579405
mul t0, a6, t7
lw t6, 63(sp)
li t7, -97644403
mul a6, t6, t7
li t7, -14480857
or t6, a3, t7, -13
sw t6, 69(sp)
lw t6, 69(sp)
lw t7, 204(sp)
and t1, t6, t7, 13
li t7, -14480857
or.1 t6, a3, t7
sw t6, 84(sp)
lw t7, 84(sp)
and t1, t1, t7, 13
li t7, -141052288
mul t6, t1, t7
sw t6, 24(sp)
li t7, -14480857
xor.1 t6, a3, t7
sw t6, 75(sp)
li t7, -14480857
and.T t6, a3, t7, -13
sw t6, 21(sp)
add a7, a7, t0
add a5, a5, a7
add a4, a4, a5
lw t6, 3(sp)
add a4, t6, a4
lw t6, 21(sp)
li t7, -14480857
xor.1 a5, t6, t7
lw t6, 33(sp)
add t6, t6, a4
sw t6, 72(sp)
lw t6, 75(sp)
lw t7, 63(sp)
and.T t0, t6, t7, -13
lw t6, 72(sp)
lw t7, 180(sp)
xor t6, t6, t7
sw t6, 243(sp)
lw t6, 213(sp)
lw t7, 243(sp)
xor a4, t6, t7
lw t6, 72(sp)
lw t7, 72(sp)
xor t6, t6, t7
sw t6, 156(sp)
and t6, a3, a4, 13
sw t6, 57(sp)
xor t6, a4, a4
sw t6, 33(sp)
lw t6, 243(sp)
lw t7, 243(sp)
xor t6, t6, t7
sw t6, 15(sp)
or.1 t6, a4, a3
sw t6, 36(sp)
li t7, 62577807
xor t6, a4, t7
sw t6, 177(sp)
xor.T t6, a4, a3
sw t6, 48(sp)
or.T t6, a4, a3
sw t6, 9(sp)
lw t7, 36(sp)
xor t2, a3, t7
li t7, -14480857
xor.T a7, a4, t7
lw t7, 204(sp)
xor.1 t0, t0, t7
and.1 t6, a3, a4, 13
sw t6, 30(sp)
lw t6, 42(sp)
lw t7, 9(sp)
xor.1 t3, t6, t7
lw t6, 63(sp)
lw t7, 21(sp)
xor t6, t6, t7
sw t6, 0(sp)
li t7, -14480857
and.1 t6, a4, t7, 13
sw t6, 51(sp)
lw t6, 51(sp)
li t7, -7813405
mul t1, t6, t7
and.T t6, a4, a3, -13
sw t6, 87(sp)
li t7, -181785081
mul t2, t2, t7
li t7, -49683487
mul t3, t3, t7
li t7, -14480857
xor.1 t6, a4, t7
sw t6, 45(sp)
xor.1 t6, a3, a4
sw t6, 27(sp)
lw t6, 51(sp)
li t7, 14480857
xor.T t4, t6, t7
lw t6, 87(sp)
or.1 t0, t6, t0
add a6, a6, t3
lw t6, 60(sp)
xor t3, t6, a4
lw t7, 48(sp)
or.T t4, t4, t7
li t7, -143398838
mul t4, t4, t7
add t4, a6, t4
add a6, t1, t2
lw t6, 42(sp)
lw t7, 45(sp)
and.1 t1, t6, t7, 13
lw t6, 6(sp)
add t6, t6, t4
sw t6, 6(sp)
lw t7, 27(sp)
and.T t2, a3, t7, -13
or.1 t3, t3, a5
lw t7, 27(sp)
xor a5, a3, t7
li t7, -14480857
and t6, a4, t7, 13
sw t6, 81(sp)
li t7, 57930441
mul t4, t3, t7
li t7, -181352265
mul t6, a7, t7
sw t6, 18(sp)
li t7, -86780868
mul t1, t1, t7
li t7, 189879006
mul t5, t0, t7
lw t6, 75(sp)
lw t7, 42(sp)
xor t3, t6, t7
li t7, -14480857
xor t6, a4, t7
sw t6, 78(sp)
lw t6, 36(sp)
xor.1 s0, t6, a3
lw t6, 231(sp)
or t0, t6, a3, -13
lw t6, 78(sp)
or.T a7, t6, a7
lw t7, 87(sp)
and s1, a3, t7, 13
xor.T s1, s1, t2
add t2, t4, t5
lw t6, 87(sp)
or.1 t5, t6, s0
li t7, 42493447
add t2, t2, t7
li t7, -185319856
mul t4, s1, t7
lw t6, 87(sp)
slli t6, t6, 5
sw t6, 3(sp)
li t7, -149419819
mul t6, t5, t7
sw t6, 12(sp)
xor t6, a3, a4
sw t6, 99(sp)
lw t6, 204(sp)
and.T t5, t6, t3, -13
add t2, t4, t2
add a6, a6, t2
add t1, t1, a6
li t7, -14480857
or.T t6, a4, t7
sw t6, 66(sp)
lw t6, 204(sp)
lw t7, 81(sp)
and s0, t6, t7, 13
li t7, -14480857
and.T t6, a4, t7, -13
sw t6, 39(sp)
lw t6, 78(sp)
li t7, 32073676
mul t2, t6, t7
lw t6, 21(sp)
lw t7, 39(sp)
or.T t3, t6, t7
lw t7, 57(sp)
xor a7, a7, t7
lw t6, 204(sp)
li t7, -65579815
mul a6, t6, t7
li t7, 50742923
mul t4, a7, t7
lw t6, 39(sp)
lw t7, 99(sp)
or.1 a7, t6, t7
or.1 a5, a5, t3
lw t6, 204(sp)
lw t7, 66(sp)
xor.T t3, t6, t7
lw t6, 0(sp)
or.T t0, t6, t0
xor.1 s1, t0, t5
li t7, -47511925
mul t0, a7, t7
lw t7, 60(sp)
and.T a7, s0, t7, -13
li t7, 184702536
mul t5, a5, t7
lw t6, 24(sp)
add a5, t6, t1
lw t6, 36(sp)
lw t7, 81(sp)
and.T t1, t6, t7, -13
li t7, 118460741
mul a7, a7, t7
lw t6, 84(sp)
xor.T s0, t6, a3
li t7, -38541630
mul t1, t1, t7
lw t6, 99(sp)
lw t7, 21(sp)
xor s3, t6, t7
li t7, -136980291
mul s1, s1, t7
lw t7, 42(sp)
or.1 s2, a3, t7
add s1, t0, s1
or.T t0, a3, s3
lw t6, 66(sp)
lw t7, 42(sp)
or.T t6, t6, t7
sw t6, 0(sp)
add t4, t4, s1
add t2, t4, t2
lw t6, 78(sp)
lw t7, 84(sp)
xor s1, t6, t7
xor t0, t0, s2
li t7, -157165836
mul t4, t0, t7
lw t7, 27(sp)
or t0, a4, t7, -13
lw t6, 57(sp)
li t7, -14480857
xor s3, t6, t7
li t7, -123138673
add t5, t5, t7
lw t6, 48(sp)
xor s2, t6, t3
lw t6, 30(sp)
li t7, 146111704
mul t3, t6, t7
lw t7, 69(sp)
and.1 s0, s0, t7, 13
lw t6, 0(sp)
and s4, t6, s3, 13
lw t7, 12(sp)
add s3, t5, t7
and.T t5, s1, s0, -13
li t7, -51046587
mul t5, t5, t7
lw t6, 3(sp)
add s0, t6, a6
or.T s1, s2, a3
li t7, -47017209
mul a6, s4, t7
li t7, -169828407
mul s1, s1, t7
add s1, s1, t1
lw t6, 18(sp)
add s2, t6, s3
lw t6, 9(sp)
lw t7, 84(sp)
and.T t1, t6, t7, -13
li t7, -14480857
or t6, a4, t7, -13
sw t6, 54(sp)
add s1, s1, a7
add s2, t2, s2
add a7, t3, s0
add t2, t4, t5
add a5, a5, s2
li t7, -14480857
xor t6, a3, t7
sw t6, 96(sp)
li t7, -14480857
or.1 t6, a4, t7
sw t6, 12(sp)
lw t6, 6(sp)
add a5, t6, a5
add t6, a5, s1
sw t6, 18(sp)
lw t6, 12(sp)
lw t7, 99(sp)
xor t3, t6, t7
lw t7, 69(sp)
xor t0, t0, t7
lw t6, 48(sp)
xor.1 t4, t6, a3
li t7, 189839732
mul t1, t1, t7
lw t7, 9(sp)
xor.1 a5, a4, t7
add a6, a6, a7
add t6, t2, a6
sw t6, 24(sp)
lw t6, 54(sp)
xor a7, t6, t3
lw t6, 48(sp)
slli a6, t6, 4
and.T t2, a7, t4, -13
li t7, -14480857
and.1 t6, a3, t7, 13
sw t6, 3(sp)
lw t6, 75(sp)
lw t7, 96(sp)
and.1 a7, t6, t7, 13
add t1, t1, a6
li t7, -137360206
mul a6, t0, t7
lw t6, 57(sp)
lw t7, 69(sp)
xor.1 t0, t6, t7
li t7, 7943130
mul t2, t2, t7
lw t6, 3(sp)
xor.1 t3, t6, a4
add t4, t1, t2
li t7, -34882210
mul t2, a7, t7
lw t6, 231(sp)
lw t7, 204(sp)
and t1, t6, t7, 13
lw t6, 21(sp)
lw t7, 36(sp)
and.T a7, t6, t7, -13
li t7, 167063261
mul t3, t3, t7
add t4, t4, t3
lw t6, 27(sp)
and t3, t6, t0, 13
add a6, a6, t4
or t6, a4, a3, -13
sw t6, 6(sp)
add a6, a6, t2
lw t6, 6(sp)
li t7, 188956436
mul t0, t6, t7
li t7, 113873243
mul t1, t1, t7
lw t7, 9(sp)
and.1 t6, a5, t7, 13
sw t6, 9(sp)
lw t6, 0(sp)
and.1 t2, t6, t3, 13
li t7, 174028108
mul a5, a3, t7
add a5, t1, a5
lw t6, 69(sp)
lw t7, 99(sp)
xor t4, t6, t7
li t7, -112816428
mul t3, a7, t7
lw t6, 30(sp)
li t7, -14480857
and.T t1, t6, t7, -13
li t7, 60355212
mul t5, t2, t7
lw t6, 99(sp)
lw t7, 66(sp)
or.1 a7, t6, t7
li t7, 109457351
mul t2, t4, t7
add t0, t5, t0
lw t6, 9(sp)
li t7, 173469010
mul t4, t6, t7
lw t6, 96(sp)
slli t5, t6, 2
add t0, a6, t0
add a6, t4, t5
lw t6, 75(sp)
lw t7, 30(sp)
or.T t5, t6, t7
add a5, a5, t3
lw t6, 21(sp)
li t7, -14480857
or t4, t6, t7, -13
lw t7, 21(sp)
and t3, a4, t7, 13
add t0, t0, a5
lw t6, 87(sp)
lw t7, 69(sp)
and.T s0, t6, t7, -13
lw t7, 45(sp)
or a5, a4, t7, -13
add a6, t0, a6
li t7, -103169340
mul t4, t4, t7
lw t6, 24(sp)
add t0, t6, a6
lw t6, 6(sp)
lw t7, 63(sp)
xor.1 a6, t6, t7
and.T s1, a6, a4, -13
lw t6, 69(sp)
or s0, t6, s0, -13
lw t6, 63(sp)
xor.1 a6, t6, a4
lw t6, 39(sp)
lw t7, 36(sp)
or.1 s2, t6, t7
xor.1 t5, t1, t5
li t7, 183678456
mul t1, s1, t7
add t2, t2, t1
lw t6, 84(sp)
and t1, t6, a3, 13
li t7, 113413754
mul s1, s0, t7
li t7, 182731299
mul s0, t5, t7
lw t6, 36(sp)
lw t7, 21(sp)
or.1 t5, t6, t7
add t2, t2, s0
lw t7, 21(sp)
or.1 s0, a4, t7
li t7, 160456656
mul s2, s2, t7
lw t6, 3(sp)
li t7, -39098239
mul s3, t6, t7
li t7, -176246479
mul t3, t3, t7
lw t7, 231(sp)
or s4, a7, t7, -13
add a7, s3, t3
li t7, -176479162
mul t3, s4, t7
add t3, t4, t3
add t3, s1, t3
lw t6, 87(sp)
lw t7, 54(sp)
xor.1 s1, t6, t7
add s2, t3, s2
li t7, -67647650
mul t4, t1, t7
xor.1 t3, a3, t5
li t7, -140977729
mul t5, s0, t7
add t1, t2, s2
add t2, t0, t1
lw t7, 99(sp)
or.T t1, a3, t7
li t7, 65005781
mul s0, t3, t7
lw t6, 96(sp)
lw t7, 48(sp)
xor t3, t6, t7
lw t6, 84(sp)
lw t7, 39(sp)
xor t0, t6, t7
add t5, s0, t5
or s0, s1, a5, -13
add a5, a7, t5
li t7, -70047595
mul s0, s0, t7
lw t6, 12(sp)
lw t7, 36(sp)
or t5, t6, t7, -13
add s1, t4, a5
li t7, -18740589
mul a7, a3, t7
lw t7, 63(sp)
xor.T t4, t5, t7
li t7, 7170843
mul a5, a6, t7
lw t6, 87(sp)
li t7, -34739771
mul t5, t6, t7
add s0, s0, s1
lw t7, 33(sp)
or.1 a6, a3, t7
add t6, t2, s0
sw t6, 90(sp)
lw t6, 99(sp)
lw t7, 21(sp)
xor.1 t2, t6, t7
xor t1, t3, t1
li t7, -175883909
mul t3, t2, t7
li t7, -104763319
mul t2, t4, t7
add t4, t3, t5
li t7, -103827319
mul t3, t1, t7
slli t0, t0, 4
add t1, a5, t4
lw t6, 36(sp)
lw t7, 42(sp)
and.1 s0, t6, t7, 13
add t6, t2, t3
sw t6, 24(sp)
lw t6, 36(sp)
li t7, -171469565
mul t4, t6, t7
lw t6, 3(sp)
lw t7, 78(sp)
or.1 a5, t6, t7
lw t6, 42(sp)
li t7, 152028528
mul t2, t6, t7
lw t6, 45(sp)
li t7, -43107437
mul t5, t6, t7
li t7, -171847739
mul a5, a5, t7
lw t6, 48(sp)
lw t7, 87(sp)
and.T s2, t6, t7, -13
lw t6, 51(sp)
lw t7, 63(sp)
xor.T t3, t6, t7
li t7, -19306861
mul t3, t3, t7
lw t6, 96(sp)
lw t7, 99(sp)
or.1 s4, t6, t7
add s1, t0, a7
li t7, -30633190
mul t0, a6, t7
lw t6, 27(sp)
xor s3, t6, s0
lw t7, 9(sp)
and.1 s2, s2, t7, 13
lw t6, 54(sp)
xor.1 a7, t6, s4
lw t6, 96(sp)
li t7, -193583988
mul a6, t6, t7
lw t6, 30(sp)
li t7, -14480857
xor.T s4, t6, t7
lw t6, 54(sp)
lw t7, 27(sp)
xor.1 s0, t6, t7
lw t6, 42(sp)
lw t7, 30(sp)
or.T s5, t6, t7
li t7, -127320205
mul s3, s3, t7
xor.T s2, s2, s5
add s5, t4, s1
li t7, -68606423
mul t4, s4, t7
add s1, s3, t5
add t6, t1, s5
sw t6, 0(sp)
li t7, 61538152
mul t1, s2, t7
li t7, -91150548
mul s2, a7, t7
lw t6, 99(sp)
lw t7, 21(sp)
or.1 t5, t6, t7
lw t6, 69(sp)
li t7, -158911819
mul a7, t6, t7
add t1, t2, t1
add t2, s2, t3
lw t6, 75(sp)
lw t7, 57(sp)
and.1 s2, t6, t7, 13
add t1, a5, t1
lw t6, 51(sp)
lw t7, 204(sp)
or.1 a5, t6, t7
and.T a5, t5, a5, -13
li t7, -61269154
mul t5, s0, t7
add t3, s1, t4
xor t4, a5, a3
li t7, -121123705
mul a5, s2, t7
add s0, t2, t0
lw t6, 69(sp)
lw t7, 75(sp)
xor.T t0, t6, t7
lw t7, 204(sp)
xor.T t2, a3, t7
lw t6, 27(sp)
and.1 t4, t6, t4, 13
li t7, 3793097
mul t4, t4, t7
add a6, s0, a6
lw t6, 99(sp)
lw t7, 81(sp)
xor.T s1, t6, t7
lw t6, 48(sp)
lw t7, 69(sp)
xor s0, t6, t7
li t7, 16937772
mul s3, t2, t7
li t7, 189875218
mul t2, t0, t7
lw t6, 81(sp)
li t7, 69053280
mul s2, t6, t7
add s3, s3, t5
lw t7, 96(sp)
or.1 t5, a4, t7
add t0, a6, t3
lw t6, 6(sp)
xor.T a6, t6, a3
add t0, t1, t0
or.1 t1, a6, a3
li t7, -5110404
mul t3, s1, t7
add a7, a7, t3
lw t7, 81(sp)
and s0, s0, t7, 13
add t3, s3, t4
add t3, t3, s2
lw t6, 69(sp)
lw t7, 12(sp)
and.1 t4, t6, t7, 13
add t3, a7, t3
li t7, -17021238
mul a7, t4, t7
li t7, -14480857
xor.1 t4, t5, t7
li t7, -180560150
mul t5, s0, t7
add t2, t5, t2
lw t6, 21(sp)
lw t7, 27(sp)
or.1 t5, t6, t7
lw t7, 231(sp)
and s0, t4, t7, 13
lw t6, 57(sp)
lw t7, 99(sp)
or.1 t4, t6, t7
add a5, a5, t2
lw t6, 51(sp)
li t7, 140581046
mul t2, t6, t7
li t7, 24640190
mul s0, s0, t7
add t6, a7, s0
sw t6, 12(sp)
lw t6, 96(sp)
lw t7, 204(sp)
or s0, t6, t7, -13
li t7, -63887893
mul a7, t1, t7
and.1 t1, s0, t5, 13
add t3, t3, a5
lw t6, 39(sp)
li t7, -41085764
mul a5, t6, t7
add t0, t0, t3
lw t7, 66(sp)
or.1 t3, t1, t7
lw t6, 177(sp)
lw t7, 177(sp)
xor t6, t6, t7
sw t6, 237(sp)
li t7, 167565676
mul a6, a6, t7
li t7, -29452553
mul t1, t4, t7
lw t6, 15(sp)
li t7, 85564078
mul t6, t6, t7
sw t6, 69(sp)
li t7, -125909043
mul t3, t3, t7
add a6, t3, a6
lw t6, 123(sp)
lw t7, 243(sp)
and.1 t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 0(sp)
add t6, t6, t0
sw t6, 0(sp)
add t0, a6, t2
li t7, 191022287
mul a6, a3, t7
add t1, t1, t0
lw t6, 60(sp)
and.T t0, t6, a3, -13
and.T t0, a4, t0, -13
lw t6, 6(sp)
li t7, 30913301
mul t6, t6, t7
sw t6, 42(sp)
lw t7, 27(sp)
xor.T t2, a3, t7
add a4, a7, t1
lw t6, 123(sp)
lw t7, 243(sp)
xor.T t6, t6, t7
sw t6, 162(sp)
or a7, a3, t2, -13
lw t6, 243(sp)
li t7, 29181055
or.1 t6, t6, t7
sw t6, 129(sp)
lw t6, 123(sp)
lw t7, 243(sp)
and.T t6, t6, t7, -13
sw t6, 138(sp)
li t7, 74583271
mul a3, t0, t7
lw t6, 243(sp)
li t7, 29181055
xor.T t6, t6, t7
sw t6, 120(sp)
add a3, a5, a3
lw t6, 123(sp)
li t7, 29181055
xor.T t6, t6, t7
sw t6, 159(sp)
lw t6, 123(sp)
li t7, 29181055
and.1 t6, t6, t7, 13
sw t6, 114(sp)
lw t6, 243(sp)
li t7, 29181055
or.T t6, t6, t7
sw t6, 135(sp)
lw t6, 114(sp)
li t7, -29181055
or.T t0, t6, t7
lw t6, 243(sp)
li t7, 29181055
and.1 t6, t6, t7, 13
sw t6, 150(sp)
lw t6, 204(sp)
and.T a5, t6, a7, -13
li t7, 118614664
mul a5, a5, t7
lw t6, 123(sp)
lw t7, 243(sp)
or.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 135(sp)
li t7, -60799702
mul t6, t6, t7
sw t6, 21(sp)
add a6, a5, a6
lw t6, 123(sp)
lw t7, 144(sp)
or a5, t6, t7, -13
lw t6, 159(sp)
xor.T t6, t6, t0
sw t6, 48(sp)
lw t6, 123(sp)
li t7, 29181055
and t6, t6, t7, 13
sw t6, 99(sp)
add a3, a6, a3
lw t6, 123(sp)
li t7, 29181055
or t6, t6, t7, -13
sw t6, 57(sp)
lw t6, 243(sp)
li t7, 29181055
xor t6, t6, t7
sw t6, 141(sp)
lw t6, 123(sp)
lw t7, 243(sp)
xor t6, t6, t7
sw t6, 3(sp)
lw t6, 243(sp)
li t7, 29181055
xor.1 t6, t6, t7
sw t6, 15(sp)
lw t6, 159(sp)
lw t7, 123(sp)
xor.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 123(sp)
li t7, 29181055
or.T t6, t6, t7
sw t6, 105(sp)
lw t7, 78(sp)
or.1 a5, a5, t7
li t7, -143533338
mul t6, a5, t7
sw t6, 87(sp)
lw t6, 105(sp)
lw t7, 114(sp)
xor.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 243(sp)
li t7, 29181055
and.T t6, t6, t7, -13
sw t6, 84(sp)
lw t6, 123(sp)
li t7, 29181055
xor.1 t6, t6, t7
sw t6, 9(sp)
add a3, a4, a3
lw t6, 243(sp)
lw t7, 123(sp)
or.T t6, t6, t7
sw t6, 60(sp)
lw t6, 12(sp)
add a3, t6, a3
lw t6, 0(sp)
add a3, t6, a3
lw t6, 24(sp)
add a3, t6, a3
lw t6, 162(sp)
lw t7, 9(sp)
xor.1 t6, t6, t7
sw t6, 33(sp)
lw t6, 90(sp)
add a3, t6, a3
lw t6, 15(sp)
lw t7, 9(sp)
xor.T t6, t6, t7
sw t6, 165(sp)
lw t6, 84(sp)
li t7, 65274934
mul t6, t6, t7
sw t6, 12(sp)
lw t6, 18(sp)
add t6, t6, a3
sw t6, 147(sp)
lw t6, 123(sp)
li t7, 29181055
and.T t6, t6, t7, -13
sw t6, 96(sp)
lw t6, 147(sp)
lw t7, 177(sp)
and.1 t6, t6, t7, 13
sw t6, 75(sp)
lw t6, 75(sp)
lw t7, 123(sp)
and.T t6, t6, t7, -13
sw t6, 51(sp)
lw t6, 147(sp)
lw t7, 177(sp)
xor.T t6, t6, t7
sw t6, 153(sp)
lw t6, 243(sp)
lw t7, 75(sp)
or.T t6, t6, t7
sw t6, 90(sp)
lw t6, 51(sp)
lw t7, 162(sp)
or.T a3, t6, t7
lw t6, 75(sp)
lw t7, 123(sp)
or.1 t6, t6, t7
sw t6, 168(sp)
lw t6, 243(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 27(sp)
lw t6, 243(sp)
lw t7, 90(sp)
or.1 a5, t6, t7
lw t6, 243(sp)
lw t7, 75(sp)
and.T t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 123(sp)
lw t7, 75(sp)
or t6, t6, t7, -13
sw t6, 36(sp)
lw t6, 66(sp)
li t7, 29181055
or.1 a4, t6, t7
lw t6, 75(sp)
li t7, 29181055
and.T t6, t6, t7, -13
sw t6, 30(sp)
li t7, 87775068
mul t6, a5, t7
sw t6, 171(sp)
lw t6, 75(sp)
li t7, 29181055
and.1 t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 123(sp)
lw t7, 75(sp)
xor.1 t6, t6, t7
sw t6, 117(sp)
lw t6, 51(sp)
lw t7, 129(sp)
and.T a5, t6, t7, -13
lw t6, 75(sp)
lw t7, 117(sp)
and a6, t6, t7, 13
lw t6, 168(sp)
li t7, 92977905
mul a7, t6, t7
lw t6, 75(sp)
lw t7, 123(sp)
and t6, t6, t7, 13
sw t6, 174(sp)
lw t6, 75(sp)
li t7, 29181055
or.T t6, t6, t7
sw t6, 126(sp)
lw t6, 93(sp)
lw t7, 63(sp)
and.T t0, t6, t7, -13
lw t6, 75(sp)
li t7, 29181055
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 138(sp)
and a4, t6, a4, 13
lw t6, 243(sp)
lw t7, 75(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 75(sp)
lw t7, 243(sp)
and t6, t6, t7, 13
sw t6, 102(sp)
lw t6, 159(sp)
lw t7, 30(sp)
xor t6, t6, t7
sw t6, 18(sp)
and.T a3, a3, a4, -13
li t7, 177264715
mul a3, a3, t7
lw t6, 123(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 93(sp)
add a4, a3, a7
lw t6, 93(sp)
and.1 a3, t6, a6, 13
xor.T a6, a3, a5
li t7, -93573988
mul a3, t0, t7
lw t6, 27(sp)
lw t7, 0(sp)
or.T a5, t6, t7
li t7, -169656270
mul a6, a6, t7
lw t6, 75(sp)
li t7, 29181055
and t6, t6, t7, 13
sw t6, 24(sp)
lw t6, 24(sp)
li t7, 160669996
mul t6, t6, t7
sw t6, 132(sp)
li t7, 37156138
mul a5, a5, t7
lw t6, 126(sp)
li t7, -177925453
mul t6, t6, t7
sw t6, 111(sp)
lw t6, 42(sp)
add a6, t6, a6
lw t6, 0(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 81(sp)
lw t6, 0(sp)
lw t7, 51(sp)
xor.1 a7, t6, t7
li t7, 29181055
or a7, a7, t7, -13
lw t6, 75(sp)
li t7, 29181055
xor.T t6, t6, t7
sw t6, 108(sp)
add a6, a6, a3
li t7, 90339287
mul a3, a7, t7
lw t6, 51(sp)
lw t7, 123(sp)
or.1 a7, t6, t7
lw t6, 108(sp)
lw t7, 66(sp)
xor.1 t6, t6, t7
sw t6, 45(sp)
lw t6, 243(sp)
lw t7, 75(sp)
and.1 t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 51(sp)
lw t7, 141(sp)
or.1 t1, t6, t7
lw t6, 69(sp)
add a6, t6, a6
lw t6, 126(sp)
lw t7, 57(sp)
and t0, t6, t7, 13
lw t6, 135(sp)
lw t7, 24(sp)
xor.1 t2, t6, t7
lw t6, 120(sp)
and.T t0, t6, t0, -13
add a5, a5, a6
lw t7, 48(sp)
xor.1 a6, t2, t7
lw t6, 42(sp)
lw t7, 117(sp)
or.1 t2, t6, t7
add a4, a4, a5
li t7, -170357031
mul a5, t2, t7
li t7, 68434964
mul t1, t1, t7
lw t6, 171(sp)
add a4, t6, a4
lw t6, 243(sp)
lw t7, 75(sp)
xor.T t6, t6, t7
sw t6, 183(sp)
lw t6, 183(sp)
li t7, 159061746
mul t4, t6, t7
li t7, -77950030
mul t6, a7, t7
sw t6, 48(sp)
lw t6, 75(sp)
lw t7, 123(sp)
or.T t6, t6, t7
sw t6, 171(sp)
lw t6, 243(sp)
lw t7, 75(sp)
or t6, t6, t7, -13
sw t6, 69(sp)
lw t6, 171(sp)
lw t7, 15(sp)
xor a7, t6, t7
lw t6, 18(sp)
xor t3, t6, t0
lw t6, 126(sp)
lw t7, 39(sp)
xor t2, t6, t7
lw t6, 21(sp)
add a5, t6, a5
lw t7, 54(sp)
or t0, a7, t7, -13
li t7, 29181055
xor.1 t5, t2, t7
lw t6, 75(sp)
lw t7, 123(sp)
xor.T t6, t6, t7
sw t6, 54(sp)
lw t6, 84(sp)
lw t7, 66(sp)
xor t2, t6, t7
add a7, t1, t4
lw t6, 3(sp)
lw t7, 171(sp)
or.T t4, t6, t7
lw t6, 42(sp)
or.1 t5, t6, t5
lw t6, 54(sp)
li t7, -29181055
or.T t1, t6, t7
li t7, -155087109
mul a6, a6, t7
li t7, 36805280
mul t1, t1, t7
add a3, a6, a3
li t7, -31084720
mul a6, t3, t7
lw t6, 111(sp)
add a3, t6, a3
li t7, 69792531
mul t3, t5, t7
lw t7, 165(sp)
or.T t5, t4, t7
lw t7, 132(sp)
add t4, a3, t7
or a3, t5, t0, -13
li t7, 33721794
mul a3, a3, t7
lw t6, 33(sp)
xor t0, t6, t2
add t6, a4, t4
sw t6, 3(sp)
lw t6, 81(sp)
lw t7, 45(sp)
or.1 t2, t6, t7
add a6, a7, a6
add a4, t1, t3
lw t7, 87(sp)
add a5, a5, t7
lw t6, 162(sp)
or.T t1, t6, t2
lw t6, 96(sp)
li t7, 178793404
mul a7, t6, t7
li t7, -188343222
mul t2, t1, t7
lw t6, 123(sp)
li t7, 29181055
or.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 87(sp)
li t7, 29181055
or t1, t6, t7, -13
lw t6, 69(sp)
and.T t0, t6, t0, -13
lw t6, 51(sp)
lw t7, 75(sp)
and.1 t3, t6, t7, 13
lw t6, 159(sp)
or.1 t4, t6, t3
lw t7, 12(sp)
add a7, a7, t7
add t3, a3, t2
lw t6, 126(sp)
li t7, 29181055
xor.T t2, t6, t7
add a6, a5, a6
li t7, 33772533
mul t5, t0, t7
li t7, 136865193
mul t6, t4, t7
sw t6, 12(sp)
lw t6, 141(sp)
lw t7, 114(sp)
xor a5, t6, t7
lw t6, 243(sp)
lw t7, 60(sp)
and a3, t6, t7, 13
lw t6, 150(sp)
lw t7, 105(sp)
and.1 t0, t6, t7, 13
lw t6, 42(sp)
and.T t4, t6, t2, -13
add a4, t5, a4
lw t6, 96(sp)
lw t7, 99(sp)
xor.T t5, t6, t7
lw t7, 243(sp)
or t2, t1, t7, -13
lw t6, 27(sp)
lw t7, 0(sp)
or.1 t1, t6, t7
lw t6, 48(sp)
add a4, t6, a4
add a4, t3, a4
li t7, -20468089
mul t3, t5, t7
add a7, t3, a7
lw t6, 75(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 201(sp)
lw t6, 243(sp)
li t7, 29181055
or t3, t6, t7, -13
lw t6, 243(sp)
lw t7, 123(sp)
or t6, t6, t7, -13
sw t6, 132(sp)
add a4, a6, a4
lw t6, 132(sp)
lw t7, 108(sp)
or.1 a6, t6, t7
and.T t4, t4, a6, -13
lw t6, 75(sp)
li t7, 29181055
xor.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 123(sp)
and a6, t6, t0, 13
lw t6, 114(sp)
lw t7, 183(sp)
xor t5, t6, t7
lw t6, 243(sp)
lw t7, 135(sp)
or t0, t6, t7, -13
li t7, 177059810
mul t2, t2, t7
add a7, a7, t2
or.1 t1, a6, t1
li t7, 156076756
mul t2, t3, t7
lw t6, 54(sp)
li t7, 185815167
mul t3, t6, t7
lw t6, 144(sp)
lw t7, 120(sp)
xor a6, t6, t7
xor.T t5, t5, a5
li t7, -126792522
mul a5, t4, t7
li t7, -14485787
mul t4, t5, t7
li t7, 163691331
mul t5, t0, t7
add t4, t2, t4
lw t6, 162(sp)
lw t7, 171(sp)
or t0, t6, t7, -13
lw t6, 96(sp)
lw t7, 174(sp)
or t2, t6, t7, -13
li t7, 22487821
mul s0, t1, t7
add t1, t5, t3
lw t6, 90(sp)
or.T a3, t6, a3
add a5, s0, a5
lw t6, 123(sp)
lw t7, 243(sp)
xor.1 t6, t6, t7
sw t6, 48(sp)
add t3, a7, a5
add a7, t1, t4
lw t6, 135(sp)
lw t7, 36(sp)
and.T a5, t6, t7, -13
li t7, 8518432
mul a5, a5, t7
lw t6, 51(sp)
lw t7, 81(sp)
xor.T t4, t6, t7
lw t6, 12(sp)
add t1, t6, t3
li t7, 48912863
mul a3, a3, t7
lw t6, 84(sp)
or t3, t6, t4, -13
li t7, 186796845
mul t3, t3, t7
add a7, a7, a3
add a3, a4, t1
lw t6, 75(sp)
li t7, 29181055
xor t6, t6, t7
sw t6, 18(sp)
lw t6, 96(sp)
lw t7, 51(sp)
and.T t1, t6, t7, -13
lw t6, 36(sp)
lw t7, 48(sp)
xor.1 a4, t6, t7
li t7, 52625237
mul t4, t2, t7
lw t6, 123(sp)
li t7, 29181055
xor t6, t6, t7
sw t6, 165(sp)
lw t6, 3(sp)
add t6, t6, a3
sw t6, 45(sp)
lw t7, 201(sp)
or.1 a3, a6, t7
xor t0, t0, a3
lw t6, 36(sp)
lw t7, 84(sp)
and.1 a3, t6, t7, 13
li t7, 155169475
mul t5, a3, t7
lw t6, 123(sp)
lw t7, 75(sp)
and.1 a3, t6, t7, 13
lw t7, 138(sp)
and a3, a3, t7, 13
lw t6, 51(sp)
lw t7, 60(sp)
or.1 a6, t6, t7
lw t6, 201(sp)
li t7, -122774787
mul t2, t6, t7
lw t6, 84(sp)
li t7, 78735537
mul t6, t6, t7
sw t6, 111(sp)
li t7, -99031905
mul t0, t0, t7
add t0, t4, t0
add t4, t3, t5
lw t6, 243(sp)
lw t7, 75(sp)
or.1 t6, t6, t7
sw t6, 84(sp)
lw t6, 96(sp)
lw t7, 84(sp)
xor.T t3, t6, t7
add t4, t0, t4
lw t6, 165(sp)
lw t7, 183(sp)
and t0, t6, t7, 13
or.1 s0, a6, t0
li t7, -95452294
mul t5, t1, t7
lw t6, 51(sp)
lw t7, 129(sp)
or.T a6, t6, t7
lw t6, 243(sp)
li t7, 29181055
and t0, t6, t7, 13
and.1 t1, t3, s0, 13
add a5, a5, t4
add t6, a7, a5
sw t6, 12(sp)
lw t6, 18(sp)
lw t7, 51(sp)
xor.1 t3, t6, t7
add a7, t2, t5
li t7, 122035720
mul t2, a4, t7
lw t6, 129(sp)
lw t7, 75(sp)
or a4, t6, t7, -13
lw t6, 6(sp)
lw t7, 159(sp)
xor a5, t6, t7
li t7, -184589575
mul t1, t1, t7
lw t7, 162(sp)
and.1 a4, a4, t7, 13
add t1, t2, t1
add t6, a7, t1
sw t6, 108(sp)
lw t6, 75(sp)
li t7, 29181055
or.1 t6, t6, t7
sw t6, 33(sp)
lw t6, 18(sp)
and t4, t6, t0, 13
lw t6, 33(sp)
lw t7, 132(sp)
xor.1 t2, t6, t7
lw t6, 99(sp)
lw t7, 117(sp)
xor.T t1, t6, t7
lw t6, 123(sp)
lw t7, 33(sp)
xor.1 t5, t6, t7
lw t7, 141(sp)
and.T t0, t0, t7, -13
lw t6, 99(sp)
lw t7, 120(sp)
xor.1 a7, t6, t7
or t2, t2, a6, -13
and.1 a6, t5, t3, 13
lw t6, 135(sp)
or t2, t6, t2, -13
and.1 a3, a3, t4, 13
li t7, -116703155
mul a3, a3, t7
lw t6, 150(sp)
li t7, 29181055
or t3, t6, t7, -13
lw t7, 126(sp)
xor t3, t3, t7
li t7, -70896173
mul t4, a6, t7
lw t6, 24(sp)
li t7, -161238535
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 243(sp)
lw t7, 165(sp)
or.1 a6, t6, t7
add a3, t4, a3
lw t6, 27(sp)
or.T t5, t6, t3
lw t6, 243(sp)
lw t7, 123(sp)
and t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 183(sp)
lw t7, 87(sp)
and.1 t3, t6, t7, 13
li t7, -7961675
mul t3, t3, t7
lw t6, 90(sp)
or s0, t6, t1, -13
lw t6, 132(sp)
li t7, -71501599
mul t4, t6, t7
lw t6, 66(sp)
lw t7, 27(sp)
and t1, t6, t7, 13
li t7, 186730061
mul s1, t0, t7
or.1 t5, t5, a5
and t0, a7, t2, 13
lw t6, 243(sp)
lw t7, 21(sp)
and.1 a5, t6, t7, 13
li t7, 166646640
mul a7, t5, t7
lw t7, 99(sp)
or t5, s0, t7, -13
or.1 t0, t0, a4
lw t6, 123(sp)
slli a4, t6, 6
add t2, a4, s1
add a7, t4, a7
li t7, 125578392
mul t4, t5, t7
lw t6, 36(sp)
li t7, -43623498
mul a4, t6, t7
lw t7, 87(sp)
or t5, t1, t7, -13
lw t7, 105(sp)
xor.T a6, a6, t7
add a7, a7, t3
li t7, 143488205
mul a6, a6, t7
lw t6, 141(sp)
lw t7, 162(sp)
xor t3, t6, t7
li t7, -10016862
mul t1, t0, t7
li t7, 6221849
mul t5, t5, t7
add t0, a6, t2
lw t6, 54(sp)
lw t7, 105(sp)
xor.T a6, t6, t7
add t6, t0, t4
sw t6, 27(sp)
li t7, -170290378
mul a5, a5, t7
lw t6, 105(sp)
slli t0, t6, 4
add a5, t5, a5
lw t6, 129(sp)
and t2, t6, t3, 13
lw t6, 63(sp)
li t7, 29181055
and.T t3, t6, t7, -13
li t7, -56187114
mul t3, t3, t7
lw t7, 111(sp)
add t5, t1, t7
lw t6, 99(sp)
lw t7, 102(sp)
or.T t4, t6, t7
lw t6, 39(sp)
lw t7, 81(sp)
xor s0, t6, t7
li t7, -1051245
mul t1, t2, t7
add a3, a3, t5
lw t6, 33(sp)
and.1 t5, t6, s0, 13
lw t6, 108(sp)
add a3, t6, a3
lw t6, 6(sp)
li t7, -156181630
mul s0, t6, t7
lw t6, 159(sp)
li t7, 29181055
xor t2, t6, t7
lw t6, 30(sp)
or.1 t4, t6, t4
add t3, s0, t3
add a3, a3, a7
li t7, 165579460
mul t5, t5, t7
lw t6, 51(sp)
lw t7, 24(sp)
xor a7, t6, t7
lw t6, 162(sp)
lw t7, 243(sp)
and.T t6, t6, t7, -13
sw t6, 30(sp)
add t5, t0, t5
lw t6, 135(sp)
lw t7, 30(sp)
xor.T t0, t6, t7
lw t7, 165(sp)
and.1 t4, t4, t7, 13
li t7, 9561630
mul s0, a6, t7
lw t6, 36(sp)
lw t7, 60(sp)
and.T a6, t6, t7, -13
add a4, a4, t5
li t7, -20530273
mul t5, t4, t7
li t7, 1946318
mul t4, t0, t7
add t0, s0, t1
add a5, a5, t0
add a4, a5, a4
add a4, a4, t3
or.1 a5, a7, t2
lw t6, 18(sp)
lw t7, 60(sp)
or.T t0, t6, t7
lw t6, 3(sp)
add a7, t6, t5
lw t6, 162(sp)
lw t7, 69(sp)
and.T t2, t6, t7, -13
add t1, t4, a7
lw t6, 42(sp)
lw t7, 132(sp)
and.T t3, t6, t7, -13
li t7, -133504338
mul t4, a5, t7
lw t6, 135(sp)
lw t7, 129(sp)
xor a5, t6, t7
lw t6, 144(sp)
lw t7, 126(sp)
xor.1 t5, t6, t7
lw t6, 39(sp)
li t7, -16950341
mul a7, t6, t7
li t7, -124129640
mul t2, t2, t7
xor t5, t3, t5
add t3, t1, t4
li t7, 28891719
mul t4, t0, t7
lw t7, 15(sp)
or t0, a6, t7, -13
li t7, 187737983
mul t1, t5, t7
add a6, t4, t2
add a4, a4, t3
lw t6, 27(sp)
add t2, t6, a4
lw t6, 54(sp)
li t7, -127543969
mul a4, t6, t7
add a3, a3, t2
lw t6, 12(sp)
add t6, t6, a3
sw t6, 12(sp)
add a7, t1, a7
li t7, 134306815
mul a3, t0, t7
add a4, a4, a3
li t7, 182794664
mul a3, a5, t7
lw t6, 60(sp)
lw t7, 105(sp)
and.T a5, t6, t7, -13
lw t6, 114(sp)
lw t7, 36(sp)
or.1 t0, t6, t7
add a7, a6, a7
lw t6, 159(sp)
lw t7, 243(sp)
xor.T a6, t6, t7
lw t7, 48(sp)
or.T t1, a5, t7
li t7, 179677204
mul a5, t0, t7
lw t6, 0(sp)
lw t7, 117(sp)
xor t0, t6, t7
lw t6, 21(sp)
or.1 t2, t6, t0
li t7, 134562367
mul t0, t1, t7
li t7, 131328776
mul a6, a6, t7
li t7, 165058127
mul t1, t2, t7
add t6, a7, a4
sw t6, 0(sp)
lw t6, 57(sp)
lw t7, 54(sp)
xor a7, t6, t7
lw t6, 117(sp)
lw t7, 93(sp)
xor.1 t3, t6, t7
add t2, t0, t1
lw t6, 84(sp)
li t7, -102387046
mul t0, t6, t7
lw t6, 78(sp)
li t7, -58685179
mul t4, t6, t7
lw t6, 141(sp)
lw t7, 75(sp)
or a4, t6, t7, -13
lw t6, 123(sp)
li t7, -65875131
mul s0, t6, t7
lw t6, 174(sp)
lw t7, 75(sp)
or.T t5, t6, t7
lw t6, 162(sp)
lw t7, 75(sp)
or t1, t6, t7, -13
lw t7, 36(sp)
and.1 s1, a7, t7, 13
lw t6, 33(sp)
li t7, -13045947
mul a7, t6, t7
lw t6, 24(sp)
and.1 t3, t6, t3, 13
li t7, -28847542
mul s2, s1, t7
add s1, a3, t2
add a3, s2, t4
add t2, t0, s0
add a3, a6, a3
or.1 t3, t3, t5
add t0, a5, s1
lw t6, 9(sp)
li t7, 5756885
mul a6, t6, t7
lw t7, 123(sp)
or a5, t1, t7, -13
lw t6, 96(sp)
or t3, t6, t3, -13
li t7, -137751724
mul a5, a5, t7
add t1, t2, a5
lw t6, 123(sp)
lw t7, 165(sp)
and a5, t6, t7, 13
lw t6, 231(sp)
lw t7, 150(sp)
and t2, t6, t7, 13
lw t6, 57(sp)
li t7, -29181055
and.1 t4, t6, t7, 13
lw t6, 168(sp)
lw t7, 90(sp)
and.T t5, t6, t7, -13
li t7, 51224094
mul t3, t3, t7
add t3, t3, a7
li t7, 128009120
mul a7, t5, t7
or.T a4, t2, a4
or.1 a4, t4, a4
add t1, t1, t3
add a3, a3, t1
li t7, 134508054
mul a4, a4, t7
add a3, t0, a3
add a4, a4, a7
lw t6, 84(sp)
lw t7, 171(sp)
xor t1, t6, t7
lw t6, 6(sp)
li t7, -146996125
mul t0, t6, t7
add a7, a6, a4
li t7, 126467603
mul a6, t1, t7
lw t6, 114(sp)
lw t7, 90(sp)
xor.T t1, t6, t7
lw t6, 30(sp)
li t7, -186250098
mul a4, t6, t7
add t0, a6, t0
lw t6, 75(sp)
slli a6, t6, 3
lw t6, 75(sp)
lw t7, 21(sp)
and.T t2, t6, t7, -13
or a5, t1, a5, -13
li t7, -39680628
mul a5, a5, t7
lw t6, 177(sp)
li t7, 15116241
mul t6, t6, t7
sw t6, 3(sp)
add a5, t0, a5
lw t7, 54(sp)
xor t0, t2, t7
lw t6, 48(sp)
or.1 t0, t6, t0
lw t6, 177(sp)
li t7, 143977673
mul t6, t6, t7
sw t6, 36(sp)
lw t6, 39(sp)
lw t7, 174(sp)
xor.1 t1, t6, t7
add a7, a7, a5
slli a5, t1, 2
lw t6, 243(sp)
li t7, -7643828
mul t1, t6, t7
add t1, a5, t1
lw t6, 177(sp)
slli t6, t6, 1
sw t6, 117(sp)
lw t6, 153(sp)
li t7, 140487159
xor a5, t6, t7
lw t6, 177(sp)
li t7, 174305697
mul t6, t6, t7
sw t6, 81(sp)
li t7, -22682451
mul t0, t0, t7
add a4, t0, a4
lw t6, 243(sp)
li t7, 3664032
and t6, t6, t7, 13
sw t6, 129(sp)
add a4, a4, a6
lw t6, 177(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 24(sp)
add a4, a7, a4
add a4, a4, t1
add a3, a3, a4
lw t6, 0(sp)
add a3, t6, a3
lw t6, 12(sp)
add a3, t6, a3
lw t6, 243(sp)
li t7, 3664032
and.T t6, t6, t7, -13
sw t6, 159(sp)
lw t6, 45(sp)
add a3, t6, a3
or t6, a3, a5, -13
sw t6, 192(sp)
lw t6, 147(sp)
xor t6, t6, a3
sw t6, 114(sp)
lw t6, 177(sp)
lw t7, 114(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
lw t6, 177(sp)
lw t7, 192(sp)
and t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 177(sp)
lw t7, 114(sp)
or t6, t6, t7, -13
sw t6, 27(sp)
lw t6, 192(sp)
lw t7, 192(sp)
xor t6, t6, t7
sw t6, 60(sp)
lw t6, 45(sp)
lw t7, 177(sp)
or.1 a4, t6, t7
lw t6, 192(sp)
lw t7, 177(sp)
xor.T t6, t6, t7
sw t6, 93(sp)
lw t6, 60(sp)
lw t7, 27(sp)
and.1 t6, t6, t7, 13
sw t6, 18(sp)
lw t6, 93(sp)
lw t7, 192(sp)
xor.1 a3, t6, t7
lw t6, 177(sp)
lw t7, 192(sp)
and.1 t6, t6, t7, 13
sw t6, 105(sp)
lw t6, 192(sp)
li t7, 173290650
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 18(sp)
and a4, t6, a4, 13
li t7, -54463555
mul t6, a4, t7
sw t6, 0(sp)
lw t6, 114(sp)
lw t7, 192(sp)
xor.1 t6, t6, t7
sw t6, 51(sp)
lw t6, 177(sp)
lw t7, 105(sp)
or.T a4, t6, t7
lw t6, 114(sp)
lw t7, 177(sp)
xor t6, t6, t7
sw t6, 57(sp)
lw t6, 12(sp)
lw t7, 114(sp)
and.1 a5, t6, t7, 13
lw t6, 114(sp)
lw t7, 192(sp)
and.1 t6, t6, t7, 13
sw t6, 111(sp)
lw t6, 192(sp)
lw t7, 177(sp)
or t6, t6, t7, -13
sw t6, 90(sp)
xor.1 a4, a4, a5
lw t6, 27(sp)
lw t7, 51(sp)
xor.1 a5, t6, t7
lw t6, 177(sp)
lw t7, 192(sp)
xor t6, t6, t7
sw t6, 54(sp)
lw t6, 105(sp)
lw t7, 231(sp)
or a6, t6, t7, -13
or.1 a5, a3, a5
lw t6, 114(sp)
lw t7, 192(sp)
xor t6, t6, t7
sw t6, 30(sp)
lw t6, 177(sp)
lw t7, 192(sp)
or.1 t6, t6, t7
sw t6, 63(sp)
lw t6, 57(sp)
lw t7, 177(sp)
or.T a3, t6, t7
lw t6, 192(sp)
lw t7, 30(sp)
xor t0, t6, t7
lw t6, 192(sp)
lw t7, 177(sp)
or.T t6, t6, t7
sw t6, 21(sp)
lw t6, 90(sp)
li t7, 106483420
mul t6, t6, t7
sw t6, 33(sp)
li t7, 106202559
mul a4, a4, t7
lw t7, 111(sp)
and a7, a6, t7, 13
lw t7, 45(sp)
xor.1 a6, t0, t7
lw t6, 114(sp)
lw t7, 177(sp)
or.T t6, t6, t7
sw t6, 69(sp)
xor.1 a5, a5, a6
lw t6, 114(sp)
lw t7, 177(sp)
xor.T t6, t6, t7
sw t6, 9(sp)
li t7, 142107296
mul a5, a5, t7
lw t6, 21(sp)
li t7, -38613043
mul a6, t6, t7
lw t6, 177(sp)
lw t7, 114(sp)
and.T t6, t6, t7, -13
sw t6, 15(sp)
lw t7, 63(sp)
or a7, a7, t7, -13
lw t6, 15(sp)
lw t7, 54(sp)
xor.T t0, t6, t7
lw t6, 231(sp)
lw t7, 15(sp)
and t2, t6, t7, 13
add t1, a4, a5
lw t6, 105(sp)
lw t7, 69(sp)
xor.T a4, t6, t7
lw t6, 111(sp)
li t7, 36304199
mul a5, t6, t7
lw t6, 177(sp)
or.1 t3, t6, t0
lw t7, 3(sp)
add t0, a6, t7
li t7, -30763274
mul a6, t3, t7
xor a3, a3, t2
lw t7, 54(sp)
and.1 t3, a3, t7, 13
li t7, 124050690
mul a3, a7, t7
add a7, t1, a3
lw t6, 69(sp)
lw t7, 177(sp)
and.1 a3, t6, t7, 13
lw t6, 0(sp)
add t2, t6, a7
lw t7, 177(sp)
and.T a4, a4, t7, -13
li t7, -66569018
mul t5, t3, t7
lw t7, 12(sp)
and t1, a4, t7, 13
lw t6, 177(sp)
lw t7, 114(sp)
xor.1 t6, t6, t7
sw t6, 3(sp)
lw t6, 27(sp)
li t7, -12203920
mul a4, t6, t7
lw t6, 114(sp)
lw t7, 3(sp)
xor t3, t6, t7
lw t6, 9(sp)
li t7, 72752327
mul a7, t6, t7
li t7, -187161932
mul a3, a3, t7
lw t6, 177(sp)
lw t7, 192(sp)
xor.1 t6, t6, t7
sw t6, 0(sp)
add a5, t0, a5
li t7, 165322958
mul s0, t1, t7
lw t6, 6(sp)
add a6, t6, a6
lw t6, 12(sp)
lw t7, 0(sp)
and t0, t6, t7, 13
lw t6, 90(sp)
lw t7, 231(sp)
and t1, t6, t7, 13
lw t6, 57(sp)
lw t7, 114(sp)
or t4, t6, t7, -13
add a6, a6, t5
add s0, a6, s0
lw t6, 192(sp)
lw t7, 114(sp)
xor.T t6, t6, t7
sw t6, 108(sp)
lw t6, 105(sp)
li t7, 91333668
mul a6, t6, t7
lw t6, 108(sp)
lw t7, 3(sp)
xor.T t5, t6, t7
lw t6, 27(sp)
and.T t5, t6, t5, -13
add t6, t2, s0
sw t6, 102(sp)
lw t6, 3(sp)
lw t7, 63(sp)
and t2, t6, t7, 13
li t7, -110399463
mul s0, t3, t7
lw t6, 114(sp)
lw t7, 177(sp)
and.1 t6, t6, t7, 13
sw t6, 48(sp)
lw t6, 114(sp)
li t7, 114732833
mul t6, t6, t7
sw t6, 66(sp)
li t7, -75224622
mul s1, t2, t7
lw t6, 9(sp)
lw t7, 63(sp)
or t2, t6, t7, -13
lw t6, 48(sp)
lw t7, 192(sp)
or.T s2, t6, t7
lw t6, 27(sp)
and.T t2, t6, t2, -13
li t7, 157822183
mul t5, t5, t7
li t7, -43916794
mul t2, t2, t7
lw t7, 63(sp)
or.1 t3, t4, t7
lw t7, 33(sp)
add t4, t2, t7
lw t6, 105(sp)
li t7, -69393209
mul t2, t6, t7
li t7, 175822450
mul t6, s2, t7
sw t6, 87(sp)
add a7, a7, s1
add t6, t4, s0
sw t6, 39(sp)
add a7, a4, a7
or a4, t0, t1, -13
add a5, a7, a5
lw t6, 21(sp)
lw t7, 30(sp)
xor.1 t0, t6, t7
lw t6, 9(sp)
or.T a4, t6, a4
lw t6, 192(sp)
lw t7, 114(sp)
or t6, t6, t7, -13
sw t6, 33(sp)
lw t6, 33(sp)
lw t7, 69(sp)
or a7, t6, t7, -13
li t7, -125497120
mul t4, a4, t7
lw t6, 105(sp)
li t7, 109318017
mul t6, t6, t7
sw t6, 6(sp)
add t5, a3, t5
lw t6, 15(sp)
li t7, -67030159
mul a3, t6, t7
lw t6, 45(sp)
li t7, 72660933
mul a4, t6, t7
li t7, 189025949
mul t1, a7, t7
add a7, t4, t5
li t7, 132535238
mul t3, t3, t7
add t3, t3, a6
lw t6, 177(sp)
and a6, t6, t0, 13
add t0, t2, t3
lw t6, 36(sp)
add a3, t6, a3
add t2, a3, t1
lw t6, 192(sp)
lw t7, 114(sp)
and.T t6, t6, t7, -13
sw t6, 84(sp)
lw t6, 90(sp)
lw t7, 69(sp)
xor.T a3, t6, t7
lw t6, 177(sp)
lw t7, 63(sp)
xor t1, t6, t7
lw t6, 177(sp)
lw t7, 192(sp)
and.T t6, t6, t7, -13
sw t6, 99(sp)
lw t6, 48(sp)
lw t7, 69(sp)
xor.1 t3, t6, t7
lw t6, 177(sp)
lw t7, 15(sp)
and t5, t6, t7, 13
lw t6, 48(sp)
lw t7, 21(sp)
or t4, t6, t7, -13
lw t6, 114(sp)
lw t7, 177(sp)
or.1 t6, t6, t7
sw t6, 96(sp)
lw t7, 9(sp)
and.1 s0, t5, t7, 13
add t5, a7, t2
lw t6, 237(sp)
or t2, t6, s0, -13
lw t6, 27(sp)
xor.1 t3, t6, t3
lw t6, 192(sp)
lw t7, 114(sp)
or.T t6, t6, t7
sw t6, 42(sp)
li t7, 27173326
mul a7, a6, t7
lw t6, 99(sp)
lw t7, 3(sp)
or.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 93(sp)
lw t7, 45(sp)
and a6, t6, t7, 13
and.1 s1, a6, t4, 13
lw t6, 96(sp)
lw t7, 0(sp)
xor.T a6, t6, t7
lw t6, 177(sp)
lw t7, 54(sp)
xor.1 t6, t6, t7
sw t6, 36(sp)
add t0, t5, t0
add t5, a5, t0
lw t6, 48(sp)
li t7, -51927146
mul t4, t6, t7
li t7, -16442792
mul s0, t1, t7
li t7, 125348155
mul t0, t3, t7
li t7, -7823723
mul t3, s1, t7
lw t7, 96(sp)
and.1 t1, a3, t7, 13
lw t6, 90(sp)
lw t7, 99(sp)
xor a3, t6, t7
lw t7, 45(sp)
and.1 a5, a3, t7, 13
li t7, 157565900
mul s1, t2, t7
lw t6, 114(sp)
lw t7, 51(sp)
or.1 a3, t6, t7
lw t7, 66(sp)
add t2, t5, t7
add t5, a4, s0
lw t6, 87(sp)
add s0, t6, t4
lw t6, 60(sp)
lw t7, 9(sp)
or.1 t4, t6, t7
add a4, s1, t3
lw t6, 42(sp)
lw t7, 9(sp)
xor t6, t6, t7
sw t6, 87(sp)
lw t6, 177(sp)
lw t7, 84(sp)
xor.T t3, t6, t7
add a7, s0, a7
add a7, t2, a7
add t2, t0, t5
or t0, t3, a3, -13
li t7, 94955637
mul t3, t4, t7
lw t6, 177(sp)
lw t7, 57(sp)
and t5, t6, t7, 13
lw t6, 6(sp)
add t2, t6, t2
lw t6, 177(sp)
lw t7, 18(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
li t7, 179213440
mul s0, t0, t7
lw t6, 54(sp)
li t7, 88462244
mul t0, t6, t7
lw t6, 90(sp)
lw t7, 114(sp)
xor.T t4, t6, t7
lw t6, 114(sp)
lw t7, 114(sp)
xor t6, t6, t7
sw t6, 66(sp)
lw t7, 24(sp)
xor.T t5, t5, t7
add s0, t3, s0
lw t6, 114(sp)
xor t1, t6, t1
and.T t3, t5, t1, -13
add a4, a4, s0
add a4, t2, a4
xor.1 t1, a6, t4
lw t6, 69(sp)
li t7, -56627995
mul t2, t6, t7
xor.T a6, a5, a3
add t5, a4, t2
lw t6, 63(sp)
li t7, 25112052
mul a4, t6, t7
li t7, -19022749
mul s0, t1, t7
lw t6, 192(sp)
lw t7, 36(sp)
and.1 a5, t6, t7, 13
lw t6, 27(sp)
lw t7, 111(sp)
or.T t4, t6, t7
lw t6, 192(sp)
lw t7, 99(sp)
xor.T t1, t6, t7
lw t6, 237(sp)
lw t7, 90(sp)
or.T t2, t6, t7
lw t6, 66(sp)
and.T t4, t6, t4, -13
li t7, -147547327
mul t6, t3, t7
sw t6, 6(sp)
li t7, -167777921
mul a6, a6, t7
add a7, a7, t5
add t6, s0, a6
sw t6, 36(sp)
lw t6, 39(sp)
add t6, t6, a7
sw t6, 39(sp)
lw t6, 114(sp)
lw t7, 192(sp)
and a6, t6, t7, 13
lw t7, 177(sp)
or a7, a6, t7, -13
li t7, 85286830
mul a5, a5, t7
add a5, t0, a5
lw t6, 78(sp)
li t7, 12506066
mul t0, t6, t7
lw t6, 87(sp)
or.1 t3, t6, a7
lw t6, 231(sp)
and t4, t6, t4, 13
lw t6, 48(sp)
lw t7, 9(sp)
or a7, t6, t7, -13
lw t6, 237(sp)
and t3, t6, t3, 13
li t7, -177307136
mul t3, t3, t7
add t3, t3, t0
li t7, -145927939
mul t5, t4, t7
lw t6, 3(sp)
li t7, 84057637
mul s0, t6, t7
lw t6, 90(sp)
lw t7, 48(sp)
or.T t4, t6, t7
slli t0, t2, 2
add t2, t5, s0
lw t7, 18(sp)
or.1 a7, a7, t7
li t7, 81038491
mul t1, t1, t7
add t3, t3, t2
li t7, -12379772
mul s0, a7, t7
lw t6, 33(sp)
lw t7, 30(sp)
xor.1 a7, t6, t7
lw t7, 57(sp)
or.1 t5, a6, t7
li t7, 15924414
mul t2, t4, t7
lw t7, 3(sp)
and.T t4, t5, t7, -13
li t7, 177690961
mul t4, t4, t7
add t0, t2, t0
lw t6, 45(sp)
lw t7, 15(sp)
or.T t5, t6, t7
add t2, t4, t1
add a4, a4, s0
lw t6, 51(sp)
lw t7, 66(sp)
xor t1, t6, t7
lw t6, 30(sp)
lw t7, 12(sp)
or.1 t4, t6, t7
or.1 t4, a6, t4
lw t7, 54(sp)
and.T a6, a3, t7, -13
add t3, t3, a4
li t7, -31606040
mul a4, a6, t7
lw t6, 48(sp)
li t7, -142757907
mul s0, t6, t7
lw t7, 27(sp)
xor.T a6, t5, t7
li t7, -156344499
mul a6, a6, t7
lw t6, 6(sp)
add t3, t6, t3
add t6, a5, t3
sw t6, 24(sp)
add t6, s0, a4
sw t6, 78(sp)
lw t6, 114(sp)
li t7, -126086831
mul a4, t6, t7
li t7, 67803510
mul a5, t4, t7
lw t6, 45(sp)
or.T t4, t6, a3
add t2, t2, a5
lw t6, 63(sp)
lw t7, 54(sp)
or.1 t3, t6, t7
lw t7, 99(sp)
or a7, a7, t7, -13
lw t6, 0(sp)
lw t7, 108(sp)
and.T a5, t6, t7, -13
lw t6, 15(sp)
lw t7, 177(sp)
or.1 t5, t6, t7
add a6, t2, a6
lw t7, 177(sp)
or.1 t2, t4, t7
add t6, t0, a6
sw t6, 18(sp)
li t7, 48653051
mul t0, t2, t7
and.T a6, t1, t5, -13
lw t6, 108(sp)
lw t7, 63(sp)
or.T t1, t6, t7
li t7, -84163245
mul t4, a6, t7
li t7, -91262879
mul a6, a7, t7
lw t6, 51(sp)
xor t2, t6, t1
add t1, t0, t4
lw t7, 105(sp)
xor a7, t3, t7
lw t6, 177(sp)
lw t7, 12(sp)
and.1 t3, t6, t7, 13
lw t6, 99(sp)
lw t7, 93(sp)
xor t0, t6, t7
lw t6, 27(sp)
li t7, 55960010
mul t4, t6, t7
lw t7, 45(sp)
xor.T s0, t3, t7
lw t6, 177(sp)
lw t7, 3(sp)
xor.1 t6, t6, t7
sw t6, 30(sp)
li t7, -83462218
mul t5, a7, t7
lw t6, 54(sp)
lw t7, 69(sp)
xor.1 s1, t6, t7
lw t7, 192(sp)
and.1 t3, a5, t7, 13
lw t6, 51(sp)
lw t7, 63(sp)
xor.T a7, t6, t7
lw t7, 54(sp)
and t0, t0, t7, 13
li t7, -88106734
mul a5, s0, t7
slli s0, t0, 4
slli t0, s1, 4
lw t6, 237(sp)
lw t7, 33(sp)
and.1 t6, t6, t7, 13
sw t6, 27(sp)
li t7, 145229128
mul t2, t2, t7
add t6, t4, a5
sw t6, 6(sp)
add a5, t5, s0
lw t6, 57(sp)
lw t7, 45(sp)
or.1 t4, t6, t7
li t7, -153665799
mul t4, t4, t7
add a4, a4, t2
add t2, t1, t4
lw t6, 45(sp)
lw t7, 192(sp)
or.1 t1, t6, t7
lw t6, 81(sp)
add t4, t6, t2
li t7, 4165951
mul t2, t3, t7
lw t6, 114(sp)
and t1, t6, t1, 13
lw t6, 63(sp)
xor t3, t6, t1
lw t6, 69(sp)
lw t7, 99(sp)
and.1 t5, t6, t7, 13
lw t6, 0(sp)
li t7, 102370193
mul t1, t6, t7
add a4, a6, a4
lw t6, 78(sp)
add a4, t6, a4
add a4, t4, a4
lw t6, 12(sp)
or a6, t6, a3, -13
li t7, 127647995
mul t4, t3, t7
li t7, -187196061
mul t3, t5, t7
lw t7, 21(sp)
or.T a3, a3, t7
add t0, t0, t4
lw t6, 18(sp)
add a4, t6, a4
li t7, -164268389
mul t4, a7, t7
lw t6, 69(sp)
li t7, 68683723
mul a7, t6, t7
add t5, a7, t3
lw t6, 51(sp)
lw t7, 177(sp)
or.T a7, t6, t7
lw t6, 3(sp)
lw t7, 42(sp)
xor.1 t6, t6, t7
sw t6, 18(sp)
li t7, -50231480
mul s0, a6, t7
lw t7, 117(sp)
add t3, t4, t7
add t4, t0, t5
lw t6, 177(sp)
lw t7, 0(sp)
xor a6, t6, t7
add t2, t2, s0
li t7, 160452237
mul t0, a7, t7
lw t6, 177(sp)
lw t7, 12(sp)
xor.T a7, t6, t7
add t4, t2, t4
lw t6, 51(sp)
or.1 t2, t6, a3
lw t6, 93(sp)
lw t7, 96(sp)
or a3, t6, t7, -13
add a5, a5, t4
add t4, t3, t1
lw t6, 27(sp)
lw t7, 30(sp)
xor.1 t3, t6, t7
li t7, 16289728
mul t2, t2, t7
lw t6, 177(sp)
lw t7, 111(sp)
and t1, t6, t7, 13
add t4, t2, t4
lw t6, 6(sp)
add t2, t6, a5
lw t6, 57(sp)
li t7, -188200168
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 45(sp)
lw t7, 57(sp)
xor.T a5, t6, t7
lw t6, 90(sp)
lw t7, 15(sp)
and.1 s0, t6, t7, 13
lw t7, 114(sp)
or.1 a7, a7, t7
xor.T a3, a3, a7
li t7, 144024695
mul t5, a5, t7
lw t6, 63(sp)
li t7, -5079209
mul a5, t6, t7
or a7, t3, s0, -13
li t7, -143417561
mul a7, a7, t7
add s0, t4, a7
li t7, 134523064
mul t4, a3, t7
lw t6, 84(sp)
lw t7, 48(sp)
xor a7, t6, t7
lw t6, 231(sp)
lw t7, 3(sp)
and a3, t6, t7, 13
lw t6, 60(sp)
lw t7, 93(sp)
or.1 t3, t6, t7
add t2, t2, s0
add t2, a4, t2
add a4, t4, t5
lw t6, 93(sp)
lw t7, 63(sp)
xor t5, t6, t7
add a4, a4, t0
lw t6, 237(sp)
lw t7, 192(sp)
xor t0, t6, t7
lw t6, 192(sp)
xor.T t4, t6, t0
lw t6, 177(sp)
lw t7, 105(sp)
or t0, t6, t7, -13
xor.T t4, t4, a6
lw t6, 51(sp)
lw t7, 48(sp)
or a6, t6, t7, -13
lw t6, 24(sp)
add s2, t6, t2
li t7, -186557430
mul t5, t5, t7
lw t6, 18(sp)
or t1, t6, t1, -13
li t7, -124567159
mul t1, t1, t7
lw t7, 51(sp)
xor.1 t2, t3, t7
lw t6, 21(sp)
li t7, 129696259
mul s0, t6, t7
lw t6, 9(sp)
li t7, -48413724
mul s1, t6, t7
add a4, s2, a4
li t7, -24614631
mul t4, t4, t7
lw t6, 60(sp)
lw t7, 99(sp)
xor.T t3, t6, t7
add t4, t4, t5
lw t6, 36(sp)
add a4, t6, a4
lw t6, 177(sp)
lw t7, 12(sp)
xor s2, t6, t7
add a4, a4, t4
add t4, s0, s1
lw t7, 114(sp)
and.1 t5, t0, t7, 13
lw t6, 48(sp)
li t7, -58484317
mul t0, t6, t7
lw t7, 63(sp)
and s0, s2, t7, 13
li t7, -67469427
mul t2, t2, t7
xor.T a7, a7, s0
add a5, a5, t2
add t1, t1, a5
li t7, -129257252
mul a5, a7, t7
and.1 a7, a6, t3, 13
add a6, t1, t4
li t7, -17719175
mul t2, t5, t7
lw t6, 90(sp)
lw t7, 105(sp)
xor.T t1, t6, t7
lw t6, 15(sp)
xor.T t1, t6, t1
and.T a3, a3, t1, -13
li t7, -149912102
mul a3, a3, t7
lw t7, 12(sp)
xor t1, a7, t7
add a3, t0, a3
add a7, a3, t2
lw t6, 243(sp)
li t7, 3664032
xor.1 t6, t6, t7
sw t6, 174(sp)
lw t6, 174(sp)
li t7, 3664032
xor.1 t0, t6, t7
lw t6, 129(sp)
lw t7, 231(sp)
and a3, t6, t7, 13
li t7, 182888945
mul t6, t0, t7
sw t6, 171(sp)
lw t6, 243(sp)
li t7, 3664032
or.T t6, t6, t7
sw t6, 84(sp)
lw t6, 243(sp)
li t7, 3664032
or.1 t6, t6, t7
sw t6, 48(sp)
lw t6, 243(sp)
li t7, 3664032
and.1 t6, t6, t7, 13
sw t6, 162(sp)
li t7, 133488264
mul t0, t1, t7
lw t6, 243(sp)
li t7, 3664032
xor t6, t6, t7
sw t6, 132(sp)
lw t6, 162(sp)
li t7, -161860366
mul t6, t6, t7
sw t6, 144(sp)
add a7, a7, t0
add a5, a5, a7
add a5, a6, a5
lw t6, 0(sp)
add a5, t6, a5
li t7, -152957949
mul t6, a3, t7
sw t6, 0(sp)
lw t6, 159(sp)
li t7, -3664032
and.T t6, t6, t7, -13
sw t6, 168(sp)
lw t6, 243(sp)
li t7, -3664032
and.1 t6, t6, t7, 13
sw t6, 189(sp)
lw t6, 243(sp)
li t7, 3664032
xor.T t6, t6, t7
sw t6, 165(sp)
add a3, a4, a5
lw t6, 39(sp)
add a3, t6, a3
lw t6, 177(sp)
li t7, 111936839
and t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 102(sp)
add t6, t6, a3
sw t6, 123(sp)
lw t6, 123(sp)
lw t7, 123(sp)
xor t6, t6, t7
sw t6, 135(sp)
lw t6, 123(sp)
lw t7, 72(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
lw t6, 123(sp)
lw t7, 180(sp)
xor t6, t6, t7
sw t6, 198(sp)
lw t6, 213(sp)
lw t7, 123(sp)
xor a3, t6, t7
lw t6, 72(sp)
lw t7, 123(sp)
xor t6, t6, t7
sw t6, 108(sp)
lw t6, 123(sp)
lw t7, 72(sp)
or.T t6, t6, t7
sw t6, 9(sp)
lw t6, 72(sp)
lw t7, 123(sp)
or t6, t6, t7, -13
sw t6, 150(sp)
lw t6, 123(sp)
lw t7, 72(sp)
and.1 t6, t6, t7, 13
sw t6, 60(sp)
lw t6, 243(sp)
and.T t6, t6, a3, -13
sw t6, 36(sp)
lw t6, 36(sp)
lw t7, 198(sp)
and.1 a6, t6, t7, 13
lw t6, 123(sp)
lw t7, 72(sp)
or.1 t6, t6, t7
sw t6, 222(sp)
li t7, 3664032
and.1 t6, a3, t7, 13
sw t6, 204(sp)
lw t6, 243(sp)
and a4, t6, a3, 13
lw t6, 72(sp)
lw t7, 123(sp)
and t6, t6, t7, 13
sw t6, 183(sp)
lw t6, 198(sp)
li t7, 3664032
xor.1 t1, t6, t7
or.T a5, a3, a4
lw t6, 123(sp)
lw t7, 72(sp)
and.T t6, t6, t7, -13
sw t6, 96(sp)
lw t6, 123(sp)
lw t7, 72(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t7, 198(sp)
xor.1 t6, a3, t7
sw t6, 126(sp)
lw t6, 132(sp)
or.1 a7, t6, a4
lw t6, 198(sp)
li t7, 3664032
xor t6, t6, t7
sw t6, 225(sp)
lw t6, 135(sp)
lw t7, 96(sp)
and.T t6, t6, t7, -13
sw t6, 105(sp)
lw t6, 159(sp)
lw t7, 225(sp)
and.T t0, t6, t7, -13
lw t6, 198(sp)
and t6, t6, a3, 13
sw t6, 246(sp)
lw t7, 243(sp)
or t6, a3, t7, -13
sw t6, 93(sp)
lw t6, 243(sp)
lw t7, 198(sp)
or.1 t6, t6, t7
sw t6, 219(sp)
lw t6, 198(sp)
and.T t6, t6, a3, -13
sw t6, 42(sp)
lw t6, 246(sp)
or.T t2, t6, a3
lw t6, 198(sp)
li t7, 3664032
or.1 t6, t6, t7
sw t6, 228(sp)
lw t6, 198(sp)
li t7, 3664032
or t6, t6, t7, -13
sw t6, 147(sp)
lw t6, 204(sp)
lw t7, 42(sp)
xor.T t3, t6, t7
lw t7, 174(sp)
and.T t4, t1, t7, -13
lw t6, 129(sp)
and t2, t6, t2, 13
lw t6, 228(sp)
lw t7, 36(sp)
or.T t1, t6, t7
xor t3, a6, t3
li t7, 3664032
or t6, a3, t7, -13
sw t6, 6(sp)
lw t7, 198(sp)
or t6, a3, t7, -13
sw t6, 207(sp)
lw t6, 6(sp)
li t7, 87360712
mul a6, t6, t7
lw t6, 243(sp)
lw t7, 198(sp)
and t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 147(sp)
li t7, 3664032
xor.1 t6, t6, t7
sw t6, 51(sp)
lw t6, 84(sp)
lw t7, 126(sp)
and.T t5, t6, t7, -13
lw t6, 243(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 90(sp)
li t7, 3664032
xor.T t6, a3, t7
sw t6, 186(sp)
li t7, 3664032
and.T t6, a3, t7, -13
sw t6, 87(sp)
and.1 t4, t4, t5, 13
li t7, -181914638
mul t6, a3, t7
sw t6, 30(sp)
lw t6, 243(sp)
xor t6, t6, a3
sw t6, 216(sp)
lw t6, 243(sp)
or.T t6, t6, a3
sw t6, 33(sp)
and.1 t0, t3, t0, 13
li t7, 12441113
mul t3, t0, t7
li t7, 160845907
mul t2, t2, t7
xor.T a7, a7, t4
li t7, -111139840
mul t4, a7, t7
li t7, -190840502
mul a7, t1, t7
lw t6, 87(sp)
li t7, 30983686
mul t6, t6, t7
sw t6, 78(sp)
lw t6, 63(sp)
xor.1 a5, t6, a5
lw t6, 90(sp)
lw t7, 216(sp)
and.1 t0, t6, t7, 13
lw t6, 198(sp)
lw t7, 243(sp)
and.T t6, t6, t7, -13
sw t6, 234(sp)
add t1, t3, t4
lw t6, 234(sp)
lw t7, 243(sp)
xor.1 t4, t6, t7
add t3, t2, t1
lw t6, 198(sp)
li t7, 3664032
or.T t6, t6, t7
sw t6, 12(sp)
li t7, 3664032
or.T t6, a3, t7
sw t6, 27(sp)
lw t6, 243(sp)
lw t7, 198(sp)
and.1 t1, t6, t7, 13
li t7, -82599240
mul t2, t4, t7
lw t6, 234(sp)
or t6, t6, a3, -13
sw t6, 21(sp)
li t7, 3664032
and t6, a3, t7, 13
sw t6, 57(sp)
lw t6, 129(sp)
lw t7, 27(sp)
and.T t4, t6, t7, -13
xor.1 t4, t0, t4
lw t6, 198(sp)
or.1 t0, t6, a3
lw t7, 0(sp)
add t6, t2, t7
sw t6, 15(sp)
lw t6, 57(sp)
lw t7, 174(sp)
or.1 t2, t6, t7
add a6, t3, a6
lw t6, 198(sp)
li t7, 3664032
xor.T t6, t6, t7
sw t6, 240(sp)
li t7, 3664032
xor.1 t6, a3, t7
sw t6, 141(sp)
lw t7, 93(sp)
xor.1 t3, t4, t7
lw t6, 198(sp)
lw t7, 243(sp)
or.T t6, t6, t7
sw t6, 0(sp)
lw t6, 234(sp)
li t7, 55652337
mul t6, t6, t7
sw t6, 111(sp)
lw t6, 84(sp)
xor.1 t0, t6, t0
li t7, 38175975
mul t6, t0, t7
sw t6, 81(sp)
xor t0, a5, t3
lw t6, 198(sp)
li t7, 3664032
and t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 228(sp)
ori t4, t6, 0
lw t6, 204(sp)
lw t7, 207(sp)
xor.1 t5, t6, t7
lw t6, 36(sp)
or t3, t6, t1, -13
add a5, a6, a7
lw t6, 36(sp)
lw t7, 3(sp)
and.1 a7, t6, t7, 13
lw t7, 186(sp)
xor.T a6, a4, t7
lw t6, 36(sp)
or.1 t1, t6, t5
lw t6, 3(sp)
and.T t5, t6, t4, -13
lw t6, 0(sp)
lw t7, 204(sp)
or.T t4, t6, t7
lw t7, 216(sp)
or t4, t4, t7, -13
li t7, -19258089
mul s0, t1, t7
lw t6, 12(sp)
li t7, 107488155
mul t1, t6, t7
lw t7, 0(sp)
and.T t2, t2, t7, -13
li t7, -155218399
mul a6, a6, t7
add t6, a5, s0
sw t6, 120(sp)
lw t6, 27(sp)
lw t7, 84(sp)
and t6, t6, t7, 13
sw t6, 45(sp)
li t7, 34924838
mul a5, t4, t7
lw t6, 3(sp)
lw t7, 36(sp)
or.1 t4, t6, t7
lw t6, 198(sp)
li t7, 3664032
and.T t6, t6, t7, -13
sw t6, 24(sp)
lw t7, 243(sp)
xor.T t6, a3, t7
sw t6, 102(sp)
lw t6, 198(sp)
and.1 t6, t6, a3, 13
sw t6, 54(sp)
lw t6, 51(sp)
and.T s0, t6, t3, -13
li t7, 72007014
mul t2, t2, t7
lw t6, 219(sp)
and.T t3, t6, a3, -13
and.T s0, s0, t0, -13
li t7, -186933020
mul t5, t5, t7
lw t6, 243(sp)
or.1 t6, t6, a3
sw t6, 69(sp)
lw t6, 12(sp)
lw t7, 198(sp)
or.1 t0, t6, t7
li t7, -6353182
mul s2, s0, t7
and.1 a7, a3, a7, 13
lw t7, 141(sp)
or s1, a7, t7, -13
lw t6, 243(sp)
xor.1 t6, t6, a3
sw t6, 99(sp)
lw t6, 21(sp)
li t7, 3664032
xor.1 s0, t6, t7
lw t6, 69(sp)
lw t7, 132(sp)
xor s3, t6, t7
lw t6, 24(sp)
li t7, 3664032
and.1 a7, t6, t7, 13
lw t7, 78(sp)
add s4, s2, t7
li t7, -146681756
mul s2, t4, t7
add t4, t1, t5
lw t7, 81(sp)
add t5, s2, t7
lw t6, 102(sp)
li t7, 133842761
mul s2, t6, t7
xor.T t1, a3, s3
lw t6, 99(sp)
li t7, -3664032
or.T s5, t6, t7
lw t6, 30(sp)
add s3, t6, s4
li t7, -3664032
and s7, s5, t7, 13
li t7, 156848709
mul s1, s1, t7
add s4, a6, t2
li t7, -61154598
mul s5, t3, t7
li t7, 3664032
xor t6, a3, t7
sw t6, 153(sp)
lw t6, 240(sp)
or s0, t6, s0, -13
lw t7, 111(sp)
add s6, s1, t7
lw t6, 153(sp)
and a6, t6, a4, 13
lw t6, 129(sp)
lw t7, 153(sp)
and t3, t6, t7, 13
li t7, -23034271
mul t2, s7, t7
li t7, -173797361
mul s1, a4, t7
li t7, 142252979
mul t1, t1, t7
add t2, s2, t2
add t5, a5, t5
add t4, s4, t4
add a5, s3, s5
lw t6, 54(sp)
li t7, -46461090
mul s3, t6, t7
add t5, s6, t5
lw t7, 246(sp)
and.1 s2, a3, t7, 13
xor s6, s2, t0
li t7, -175254701
mul t6, a4, t7
sw t6, 30(sp)
lw t6, 246(sp)
lw t7, 243(sp)
xor t0, t6, t7
lw t6, 54(sp)
lw t7, 27(sp)
or.1 s2, t6, t7
lw t6, 87(sp)
lw t7, 42(sp)
and s5, t6, t7, 13
lw t6, 198(sp)
xor.T t6, t6, a3
sw t6, 51(sp)
li t7, -66476590
mul s4, s0, t7
lw t7, 15(sp)
add a5, a5, t7
lw t6, 198(sp)
li t7, 3664032
and.1 t6, t6, t7, 13
sw t6, 87(sp)
or.T a4, s6, a7
li t7, -177415376
mul a4, a4, t7
add a4, s1, a4
add a7, a4, s3
lw t6, 12(sp)
li t7, 174639501
mul a4, t6, t7
xor s0, t3, s5
lw t6, 198(sp)
lw t7, 243(sp)
xor.T t6, t6, t7
sw t6, 81(sp)
lw t6, 69(sp)
li t7, 20681083
mul t6, t6, t7
sw t6, 180(sp)
lw t6, 0(sp)
li t7, 124861509
mul t6, t6, t7
sw t6, 210(sp)
lw t6, 186(sp)
lw t7, 51(sp)
xor.1 s1, t6, t7
add t3, t2, a7
lw t6, 126(sp)
li t7, 3664032
and.1 a7, t6, t7, 13
add t4, t4, s4
li t7, -97950404
mul t2, s2, t7
add t1, t4, t1
add t4, t5, t1
lw t7, 126(sp)
or.T t1, s1, t7
lw t6, 93(sp)
and.T a6, t6, a6, -13
li t7, 48825833
mul a6, a6, t7
lw t7, 198(sp)
or.T t6, a3, t7
sw t6, 213(sp)
lw t6, 81(sp)
lw t7, 24(sp)
and.1 t5, t6, t7, 13
li t7, -164556598
mul s0, s0, t7
lw t6, 213(sp)
lw t7, 84(sp)
xor.1 s1, t6, t7
li t7, 152694100
mul t6, s1, t7
sw t6, 78(sp)
lw t6, 228(sp)
lw t7, 81(sp)
xor t6, t6, t7
sw t6, 0(sp)
lw t6, 129(sp)
lw t7, 141(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
li t7, -116160004
mul t1, t1, t7
slli t5, t5, 5
add t5, s0, t5
li t7, 1597213
mul t6, t0, t7
sw t6, 15(sp)
lw t6, 6(sp)
li t7, 3664032
and.T t6, t6, t7, -13
sw t6, 138(sp)
add t0, t1, t5
add t0, a6, t0
lw t6, 36(sp)
li t7, -96009299
mul t1, t6, t7
lw t6, 126(sp)
lw t7, 234(sp)
xor.1 t6, t6, t7
sw t6, 111(sp)
add s0, a5, t4
lw t7, 81(sp)
or.T a5, a3, t7
lw t6, 93(sp)
lw t7, 63(sp)
and.1 a6, t6, t7, 13
lw t6, 153(sp)
li t7, -193427651
mul t6, t6, t7
sw t6, 12(sp)
li t7, -87410666
mul a5, a5, t7
add t0, t3, t0
lw t6, 33(sp)
lw t7, 186(sp)
or.T t6, t6, t7
sw t6, 195(sp)
add a4, a4, a5
lw t6, 243(sp)
lw t7, 198(sp)
or t3, t6, t7, -13
add a5, t2, a4
lw t6, 144(sp)
lw t7, 30(sp)
add a4, t6, t7
lw t6, 51(sp)
li t7, 173438119
mul t5, t6, t7
slli t4, a7, 3
lw t6, 243(sp)
and.1 t6, t6, a3, 13
sw t6, 144(sp)
lw t6, 120(sp)
add t6, t6, s0
sw t6, 30(sp)
lw t6, 90(sp)
li t7, -149400015
mul a7, t6, t7
lw t6, 81(sp)
lw t7, 216(sp)
and.T t2, t6, t7, -13
lw t6, 45(sp)
lw t7, 234(sp)
and.T s0, t6, t7, -13
lw t7, 87(sp)
xor.1 s0, s0, t7
li t7, 9457902
mul s0, s0, t7
add a4, a4, t1
lw t6, 51(sp)
li t7, 3664032
and.T t1, t6, t7, -13
lw t7, 198(sp)
xor t6, a3, t7
sw t6, 45(sp)
lw t6, 180(sp)
add s1, t6, s0
lw t6, 3(sp)
li t7, 161729715
mul t6, t6, t7
sw t6, 180(sp)
lw t6, 198(sp)
and.1 s0, t6, t3, 13
lw t7, 210(sp)
add t3, s1, t7
lw t6, 216(sp)
lw t7, 144(sp)
xor.1 s1, t6, t7
add a7, a7, t5
li t7, -137149470
mul t5, s1, t7
lw t6, 0(sp)
li t7, -159594875
mul t6, t6, t7
sw t6, 120(sp)
lw t6, 24(sp)
lw t7, 93(sp)
xor.1 s1, t6, t7
li t7, 90069143
mul t1, t1, t7
or s2, s1, a6, -13
lw t6, 78(sp)
add s1, t6, t3
lw t6, 48(sp)
lw t7, 204(sp)
or.T a6, t6, t7
li t7, -99795269
mul t3, s2, t7
lw t7, 15(sp)
add s2, t4, t7
lw t6, 51(sp)
li t7, 3664032
xor.1 t4, t6, t7
add t0, t0, s1
lw t6, 90(sp)
li t7, 3664032
or.1 s1, t6, t7
add s2, s2, t5
and.1 t2, s0, t2, 13
lw t6, 90(sp)
lw t7, 33(sp)
or t5, t6, t7, -13
xor s0, a3, a3
lw t6, 138(sp)
or t5, t6, t5, -13
add t6, t0, a5
sw t6, 0(sp)
lw t7, 54(sp)
and t0, s0, t7, 13
lw t6, 204(sp)
lw t7, 243(sp)
and.T t6, t6, t7, -13
sw t6, 93(sp)
lw t7, 171(sp)
add a5, s2, t7
lw t6, 45(sp)
lw t7, 174(sp)
and s0, t6, t7, 13
and s1, s0, s1, 13
li t7, 17190599
mul s0, t2, t7
li t7, -57483364
mul t2, t4, t7
lw t6, 21(sp)
or t4, t6, t5, -13
lw t6, 51(sp)
lw t7, 243(sp)
xor.1 t5, t6, t7
lw t6, 3(sp)
lw t7, 198(sp)
and.T t6, t6, t7, -13
sw t6, 21(sp)
li t7, -49969721
mul s1, s1, t7
li t7, 151631545
mul t4, t4, t7
add a4, a4, t4
add t2, s1, t2
add t4, s0, a7
add a5, a5, t3
lw t6, 195(sp)
li t7, -72155864
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 132(sp)
lw t7, 186(sp)
or a7, t6, t7, -13
add t1, t1, a5
lw t6, 198(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 78(sp)
lw t6, 207(sp)
lw t7, 144(sp)
xor s1, t6, t7
lw t6, 204(sp)
lw t7, 162(sp)
and.T a5, t6, t7, -13
lw t6, 111(sp)
xor.1 t3, t6, a7
lw t6, 42(sp)
xor.T a7, t6, t0
add t6, t1, a4
sw t6, 138(sp)
li t7, -159595566
mul s0, a6, t7
lw t7, 198(sp)
or.T a4, s1, t7
li t7, 103339459
mul a6, t5, t7
lw t6, 78(sp)
lw t7, 147(sp)
or.1 t1, t6, t7
slli t0, a4, 4
lw t6, 87(sp)
lw t7, 246(sp)
xor.T a4, t6, t7
lw t7, 102(sp)
or.1 t5, t3, t7
lw t6, 120(sp)
add s0, t6, s0
lw t6, 6(sp)
or t3, t6, a7, -13
lw t6, 63(sp)
lw t7, 207(sp)
and.T a7, t6, t7, -13
add t4, t4, s0
add t6, t4, t2
sw t6, 171(sp)
add t2, a6, t0
li t7, -183432946
mul a6, t5, t7
lw t7, 165(sp)
and.1 t0, a3, t7, 13
lw t6, 81(sp)
lw t7, 126(sp)
xor.1 t5, t6, t7
lw t6, 198(sp)
lw t7, 243(sp)
xor.1 t4, t6, t7
li t7, 135190542
mul t3, t3, t7
lw t6, 141(sp)
li t7, 178070126
mul t6, t6, t7
sw t6, 111(sp)
or.T t5, t1, t5
lw t6, 45(sp)
and.1 t1, t6, a5, 13
li t7, -152369618
mul t5, t5, t7
lw t6, 87(sp)
lw t7, 42(sp)
and t6, t6, t7, 13
sw t6, 48(sp)
lw t6, 225(sp)
li t7, 63970933
mul a5, t6, t7
lw t6, 12(sp)
add t5, t6, t5
lw t6, 204(sp)
xor t4, t6, t4
lw t6, 21(sp)
lw t7, 162(sp)
or.1 t6, t6, t7
sw t6, 21(sp)
lw t6, 180(sp)
add t6, t6, t2
sw t6, 141(sp)
li t7, 180254015
mul t6, t4, t7
sw t6, 12(sp)
add t2, t3, t5
lw t6, 189(sp)
lw t7, 93(sp)
or t3, t6, t7, -13
and.1 a7, a7, t1, 13
li t7, -1364578
mul t3, t3, t7
lw t7, 231(sp)
and t0, t0, t7, 13
li t7, 87315371
mul t0, t0, t7
lw t6, 165(sp)
li t7, -183569520
mul t1, t6, t7
add a6, t2, a6
add t6, a6, t3
sw t6, 63(sp)
li t7, -64338288
mul a7, a7, t7
add a5, t0, a5
lw t6, 102(sp)
li t7, -130427477
mul t6, t6, t7
sw t6, 120(sp)
lw t7, 246(sp)
and.T a4, a4, t7, -13
li t7, -54580299
mul t2, a4, t7
lw t7, 15(sp)
add a4, a5, t7
lw t6, 243(sp)
lw t7, 219(sp)
xor.T t0, t6, t7
lw t6, 69(sp)
li t7, 3664032
or.1 a5, t6, t7
lw t7, 129(sp)
xor.1 a6, a3, t7
lw t6, 234(sp)
or t5, t6, a6, -13
lw t6, 240(sp)
li t7, -191811956
mul t3, t6, t7
lw t6, 153(sp)
lw t7, 3(sp)
and.T a6, t6, t7, -13
lw t6, 42(sp)
or.1 s0, t6, a5
lw t6, 168(sp)
lw t7, 33(sp)
xor a5, t6, t7
lw t6, 216(sp)
lw t7, 57(sp)
xor t4, t6, t7
lw t6, 87(sp)
lw t7, 234(sp)
xor.1 s1, t6, t7
li t7, 20294378
mul a5, a5, t7
li t7, -139386544
mul a6, a6, t7
and t4, t0, t4, 13
li t7, -77868072
mul s2, t5, t7
lw t6, 228(sp)
lw t7, 213(sp)
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 159(sp)
lw t7, 36(sp)
or.T t0, t6, t7
li t7, 178769542
mul t6, s1, t7
sw t6, 93(sp)
add s3, a4, a7
lw t6, 243(sp)
li t7, -159203040
mul a4, t6, t7
lw t6, 48(sp)
li t7, 148862856
mul s1, t6, t7
lw t6, 42(sp)
lw t7, 102(sp)
and.1 s4, t6, t7, 13
lw t6, 243(sp)
li t7, 3664032
or t5, t6, t7, -13
lw t6, 246(sp)
lw t7, 87(sp)
and.1 a7, t6, t7, 13
li t7, -130108725
mul s0, s0, t7
add t1, t1, s2
lw t7, 57(sp)
or s2, s4, t7, -13
lw t6, 141(sp)
add s3, t6, s3
lw t6, 21(sp)
add s4, t6, t1
lw t7, 12(sp)
add t1, s3, t7
lw t6, 153(sp)
li t7, 3664032
or.T s3, t6, t7
add s4, s4, t2
add t2, s1, t3
lw t6, 111(sp)
add t3, t6, s4
li t7, -101675389
mul t6, s2, t7
sw t6, 21(sp)
lw t7, 198(sp)
xor s1, s3, t7
add t3, t3, s0
lw t7, 33(sp)
and.1 t4, t4, t7, 13
lw t6, 63(sp)
add t6, t6, t1
sw t6, 12(sp)
lw t6, 126(sp)
lw t7, 90(sp)
and.T t1, t6, t7, -13
lw t6, 3(sp)
lw t7, 69(sp)
xor.T s0, t6, t7
lw t7, 87(sp)
xor s2, t5, t7
lw t6, 216(sp)
lw t7, 147(sp)
xor.T t5, t6, t7
lw t7, 120(sp)
add t6, t3, t7
sw t6, 15(sp)
lw t6, 132(sp)
lw t7, 198(sp)
and.1 t3, t6, t7, 13
li t7, 86069937
mul s3, s1, t7
lw t7, 36(sp)
or.1 s1, s2, t7
li t7, -129136040
mul t4, t4, t7
add a5, s3, a5
add t6, a6, t4
sw t6, 36(sp)
li t7, 163845431
mul a6, s0, t7
li t7, -105963402
mul t6, s1, t7
sw t6, 42(sp)
or.T t0, t5, t0
lw t6, 234(sp)
and t0, t6, t0, 13
add t6, a6, t2
sw t6, 33(sp)
lw t6, 162(sp)
lw t7, 27(sp)
and.1 t4, t6, t7, 13
lw t7, 243(sp)
xor.T t5, t3, t7
li t7, 3664032
or.1 a3, a3, t7
add a6, a4, a5
lw t6, 51(sp)
and.T a5, t6, a3, -13
li t7, 20368974
mul a3, a7, t7
lw t6, 129(sp)
lw t7, 99(sp)
or.T a4, t6, t7
li t7, 87394563
mul t3, t0, t7
lw t6, 51(sp)
lw t7, 165(sp)
or.T t2, t6, t7
lw t7, 6(sp)
xor.1 t0, t1, t7
lw t6, 27(sp)
lw t7, 162(sp)
xor a7, t6, t7
lw t6, 69(sp)
lw t7, 174(sp)
xor s2, t6, t7
li t7, 67038162
mul t0, t0, t7
li t7, 3664032
or.T s1, a4, t7
lw t7, 54(sp)
and.1 t1, t4, t7, 13
lw t6, 132(sp)
li t7, 3664032
and.T s0, t6, t7, -13
lw t6, 57(sp)
and.1 a4, t6, s2, 13
li t7, 52409514
mul t4, a4, t7
lw t6, 198(sp)
li t7, 111936839
xor.1 t6, t6, t7
sw t6, 141(sp)
li t7, -75118710
mul a4, t5, t7
lw t6, 51(sp)
lw t7, 132(sp)
xor.1 t5, t6, t7
li t7, 174754294
mul t6, t1, t7
sw t6, 6(sp)
lw t6, 45(sp)
li t7, -36795276
mul t1, t6, t7
li t7, 157495766
mul s1, s1, t7
lw t6, 177(sp)
li t7, 111936839
xor.1 t6, t6, t7
sw t6, 153(sp)
lw t6, 177(sp)
li t7, 111936839
or.T t6, t6, t7
sw t6, 51(sp)
lw t6, 198(sp)
li t7, 111936839
or.1 t6, t6, t7
sw t6, 207(sp)
add s2, t3, s1
lw t6, 81(sp)
xor.1 s0, t6, s0
li t7, -62718215
mul t3, t2, t7
lw t6, 24(sp)
lw t7, 81(sp)
or.1 t2, t6, t7
lw t6, 162(sp)
and s1, t6, t2, 13
lw t6, 93(sp)
add t2, t6, s2
lw t6, 21(sp)
add s2, t6, t2
lw t6, 177(sp)
li t7, 111936839
xor.T t6, t6, t7
sw t6, 99(sp)
lw t6, 144(sp)
li t7, -12267780
mul t2, t6, t7
add t3, t3, t4
add t4, s2, t0
lw t7, 69(sp)
and.T t0, t5, t7, -13
add t5, a6, t4
lw t6, 51(sp)
li t7, -177010923
mul t6, t6, t7
sw t6, 21(sp)
xor a6, a5, s0
lw t6, 159(sp)
li t7, 138729723
mul t4, t6, t7
add a3, t5, a3
li t7, -53283534
mul a5, s1, t7
lw t6, 198(sp)
lw t7, 177(sp)
xor.T t6, t6, t7
sw t6, 174(sp)
xor.1 a6, a6, a7
add a7, t4, t1
lw t6, 198(sp)
lw t7, 177(sp)
and t6, t6, t7, 13
sw t6, 234(sp)
lw t7, 84(sp)
or.T t1, a6, t7
li t7, 3664032
xor.1 a6, t0, t7
li t7, -126548587
mul t0, t1, t7
lw t6, 177(sp)
lw t7, 198(sp)
or.T t6, t6, t7
sw t6, 3(sp)
add t0, t0, t3
lw t6, 3(sp)
li t7, 111936839
xor t6, t6, t7
sw t6, 63(sp)
li t7, -190241475
mul a6, a6, t7
lw t6, 42(sp)
add t0, t6, t0
add a7, a7, a4
add a5, a5, t2
add a4, a3, t0
lw t6, 141(sp)
lw t7, 174(sp)
or.T t6, t6, t7
sw t6, 102(sp)
lw t6, 207(sp)
lw t7, 153(sp)
or a3, t6, t7, -13
lw t6, 33(sp)
add a4, t6, a4
lw t6, 198(sp)
lw t7, 177(sp)
or.1 t6, t6, t7
sw t6, 210(sp)
lw t6, 6(sp)
add a7, t6, a7
li t7, -42588663
mul t6, a3, t7
sw t6, 84(sp)
add a3, a5, a6
add a3, a7, a3
lw t6, 177(sp)
li t7, 111936839
or t6, t6, t7, -13
sw t6, 42(sp)
lw t6, 99(sp)
lw t7, 210(sp)
and.T t6, t6, t7, -13
sw t6, 6(sp)
lw t6, 198(sp)
lw t7, 177(sp)
or t6, t6, t7, -13
sw t6, 33(sp)
lw t6, 36(sp)
add a5, t6, a4
lw t6, 231(sp)
lw t7, 141(sp)
or t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 3(sp)
li t7, -111936839
xor.T t6, t6, t7
sw t6, 87(sp)
lw t6, 33(sp)
lw t7, 99(sp)
xor.1 a4, t6, t7
lw t6, 198(sp)
li t7, 111936839
or.T t6, t6, t7
sw t6, 168(sp)
lw t6, 15(sp)
add a5, t6, a5
lw t6, 177(sp)
lw t7, 198(sp)
and.T t6, t6, t7, -13
sw t6, 36(sp)
lw t6, 177(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 204(sp)
lw t6, 177(sp)
li t7, 111936839
or.1 t6, t6, t7
sw t6, 15(sp)
add a3, a5, a3
lw t6, 12(sp)
add a3, t6, a3
lw t6, 33(sp)
li t7, 111936839
xor.1 t6, t6, t7
sw t6, 129(sp)
lw t6, 204(sp)
lw t7, 198(sp)
or a5, t6, t7, -13
lw t6, 177(sp)
lw t7, 198(sp)
xor.1 t6, t6, t7
sw t6, 93(sp)
lw t6, 153(sp)
li t7, 59048355
mul t6, t6, t7
sw t6, 126(sp)
lw t6, 174(sp)
li t7, 135820749
mul t6, t6, t7
sw t6, 12(sp)
lw t6, 204(sp)
lw t7, 93(sp)
or a6, t6, t7, -13
lw t6, 15(sp)
lw t7, 234(sp)
or a7, t6, t7, -13
li t7, 54242529
mul t6, a7, t7
sw t6, 159(sp)
lw t6, 210(sp)
li t7, 111936839
and.1 t6, t6, t7, 13
sw t6, 69(sp)
lw t6, 171(sp)
add a3, t6, a3
li t7, -86884656
mul t6, a6, t7
sw t6, 27(sp)
slli t6, a5, 8
sw t6, 57(sp)
lw t6, 138(sp)
add a3, t6, a3
lw t6, 0(sp)
add a3, t6, a3
lw t6, 30(sp)
add t6, t6, a3
sw t6, 111(sp)
lw t6, 111(sp)
li t7, -93195046
xor a3, t6, t7
lw t6, 198(sp)
and.1 t6, t6, a3, 13
sw t6, 216(sp)
lw t7, 177(sp)
and t6, a3, t7, 13
sw t6, 171(sp)
lw t6, 198(sp)
xor.T t6, t6, a3
sw t6, 225(sp)
li t7, 111936839
or.1 t6, a3, t7
sw t6, 240(sp)
lw t7, 177(sp)
xor.1 t6, a3, t7
sw t6, 24(sp)
lw t6, 153(sp)
lw t7, 240(sp)
xor.1 a5, t6, t7
lw t6, 177(sp)
and.T t6, t6, a3, -13
sw t6, 48(sp)
lw t7, 198(sp)
xor.1 t6, a3, t7
sw t6, 132(sp)
lw t6, 225(sp)
li t7, 111936839
and.T a6, t6, t7, -13
lw t6, 153(sp)
lw t7, 24(sp)
and.1 a7, t6, t7, 13
or.T t0, a4, a7
lw t6, 216(sp)
lw t7, 42(sp)
or.1 a4, t6, t7
li t7, 111936839
and.1 t6, a3, t7, 13
sw t6, 54(sp)
lw t6, 54(sp)
li t7, 111936839
and.T t2, t6, t7, -13
lw t6, 234(sp)
lw t7, 54(sp)
or.1 t1, t6, t7
lw t6, 171(sp)
lw t7, 198(sp)
xor a7, t6, t7
lw t6, 132(sp)
lw t7, 6(sp)
xor.T t6, t6, t7
sw t6, 30(sp)
lw t7, 177(sp)
xor.T t6, a3, t7
sw t6, 165(sp)
li t7, 111936839
xor t6, a3, t7
sw t6, 81(sp)
lw t6, 63(sp)
and.1 t4, t6, a7, 13
lw t6, 54(sp)
lw t7, 177(sp)
and.1 t3, t6, t7, 13
lw t6, 99(sp)
lw t7, 24(sp)
and a7, t6, t7, 13
li t7, 111936839
and t6, a3, t7, 13
sw t6, 138(sp)
lw t6, 117(sp)
and s0, t6, t2, 13
li t7, -134479037
mul t0, t0, t7
lw t6, 165(sp)
lw t7, 177(sp)
xor.1 t2, t6, t7
lw t6, 87(sp)
and.T t6, t6, a3, -13
sw t6, 0(sp)
li t7, 80360246
mul t6, t2, t7
sw t6, 6(sp)
lw t6, 138(sp)
lw t7, 3(sp)
or.1 t2, t6, t7
lw t6, 48(sp)
or.T t5, t6, t4
lw t6, 168(sp)
lw t7, 225(sp)
xor t4, t6, t7
lw t6, 12(sp)
add t6, t6, t0
sw t6, 12(sp)
li t7, 105665921
mul t5, t5, t7
lw t6, 171(sp)
lw t7, 153(sp)
and.T t0, t6, t7, -13
li t7, -18353022
mul s0, s0, t7
li t7, 111936839
xor.T t6, a3, t7
sw t6, 243(sp)
or.1 t1, a5, t1
lw t6, 81(sp)
lw t7, 198(sp)
and s1, t6, t7, 13
or a5, t3, a6, -13
lw t6, 234(sp)
lw t7, 132(sp)
and.T t6, t6, t7, -13
sw t6, 90(sp)
li t7, 84993892
mul a6, s1, t7
lw t7, 102(sp)
and.1 t3, a4, t7, 13
li t7, 111936839
or.T t6, a3, t7
sw t6, 189(sp)
li t7, 50250226
mul a4, a5, t7
lw t7, 216(sp)
or.1 a5, t4, t7
add a4, a4, s0
add a4, t5, a4
add a4, a4, a6
lw t7, 45(sp)
and.T a7, a7, t7, -13
li t7, 111059200
mul t2, t2, t7
lw t7, 198(sp)
or.T a6, a3, t7
lw t6, 117(sp)
and.T t4, t6, a6, -13
li t7, 111936839
or t6, a3, t7, -13
sw t6, 102(sp)
xor.1 t1, t1, t4
lw t6, 171(sp)
xor.1 a6, t6, a6
lw t6, 51(sp)
or a7, t6, a7, -13
li t7, 121209180
mul t1, t1, t7
lw t7, 99(sp)
or t4, t0, t7, -13
li t7, 179513089
mul t3, t3, t7
lw t6, 36(sp)
lw t7, 138(sp)
or.T t0, t6, t7
lw t6, 243(sp)
xor t4, t6, t4
li t7, -14443890
mul t5, t4, t7
lw t7, 177(sp)
or t6, a3, t7, -13
sw t6, 144(sp)
lw t6, 177(sp)
xor t6, t6, a3
sw t6, 51(sp)
lw t6, 30(sp)
or.1 t4, t6, a7
lw t6, 198(sp)
lw t7, 69(sp)
xor.1 a7, t6, t7
add t2, t1, t2
add t1, t5, t3
lw t6, 0(sp)
li t7, -184556442
mul t3, t6, t7
lw t7, 21(sp)
add t6, t3, t7
sw t6, 246(sp)
and t0, t0, a5, 13
li t7, 67841006
mul t4, t4, t7
li t7, -106983559
mul a5, a6, t7
lw t6, 84(sp)
add t3, t6, t1
lw t6, 27(sp)
add a5, t6, a5
lw t6, 177(sp)
li t7, 111936839
and.T t6, t6, t7, -13
sw t6, 21(sp)
lw t6, 198(sp)
li t7, 111936839
and.T t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 21(sp)
or.T t1, t6, a3
lw t7, 6(sp)
add a6, t4, t7
lw t6, 198(sp)
lw t7, 102(sp)
xor t4, t6, t7
lw t7, 12(sp)
add a6, a6, t7
add t2, t2, a6
lw t6, 54(sp)
lw t7, 177(sp)
and a6, t6, t7, 13
li t7, -153776074
mul t6, a7, t7
sw t6, 147(sp)
add a7, t2, t3
lw t6, 198(sp)
or.1 t6, t6, a3
sw t6, 228(sp)
add t6, a4, a7
sw t6, 63(sp)
or a7, t4, t0, -13
lw t6, 30(sp)
lw t7, 69(sp)
xor.1 a4, t6, t7
li t7, 101618411
mul t6, a4, t7
sw t6, 0(sp)
lw t6, 93(sp)
li t7, 25262741
mul t6, t6, t7
sw t6, 180(sp)
lw t6, 228(sp)
lw t7, 207(sp)
or.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 36(sp)
lw t7, 189(sp)
or t2, t6, t7, -13
lw t6, 198(sp)
li t7, 111936839
or t6, t6, t7, -13
sw t6, 120(sp)
lw t6, 177(sp)
xor.T a4, t6, t1
lw t6, 225(sp)
lw t7, 237(sp)
or.T t0, t6, t7
lw t6, 93(sp)
li t7, 193622204
mul t6, t6, t7
sw t6, 219(sp)
li t7, 144259816
mul t6, t2, t7
sw t6, 237(sp)
lw t7, 51(sp)
xor t6, a3, t7
sw t6, 87(sp)
lw t6, 129(sp)
lw t7, 144(sp)
and.T t1, t6, t7, -13
lw t6, 198(sp)
li t7, 111936839
xor t6, t6, t7
sw t6, 27(sp)
li t7, -34146571
mul t3, a7, t7
lw t6, 102(sp)
lw t7, 120(sp)
or.T t4, t6, t7
lw t6, 21(sp)
li t7, 70668938
mul t6, t6, t7
sw t6, 195(sp)
lw t6, 177(sp)
or.T t2, t6, a3
li t7, -139901345
mul t0, t0, t7
lw t6, 177(sp)
or.1 a7, t6, t2
xor t6, a3, a3
sw t6, 69(sp)
li t7, 159340988
mul t6, t4, t7
sw t6, 249(sp)
add a5, a5, t3
lw t6, 168(sp)
lw t7, 165(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
li t7, 36327852
mul t6, a6, t7
sw t6, 129(sp)
lw t6, 189(sp)
lw t7, 204(sp)
and.T t3, t6, t7, -13
li t7, -70314210
mul t6, t1, t7
sw t6, 84(sp)
lw t7, 228(sp)
or.1 t5, t2, t7
li t7, 58377295
mul a6, a4, t7
lw t6, 102(sp)
lw t7, 69(sp)
and.T t1, t6, t7, -13
lw t7, 90(sp)
and.T a4, t3, t7, -13
lw t6, 198(sp)
li t7, 111936839
and t6, t6, t7, 13
sw t6, 213(sp)
lw t7, 204(sp)
xor t1, t1, t7
lw t7, 57(sp)
add s0, t0, t7
lw t6, 198(sp)
xor t6, t6, a3
sw t6, 162(sp)
lw t6, 126(sp)
add t6, t6, a5
sw t6, 90(sp)
lw t6, 213(sp)
lw t7, 102(sp)
xor a5, t6, t7
lw t6, 213(sp)
lw t7, 165(sp)
and t4, t6, t7, 13
lw t6, 162(sp)
xor.T t0, t6, a3
lw t7, 117(sp)
xor.1 t2, a3, t7
lw t6, 3(sp)
andi s2, t6, 0
lw t6, 144(sp)
xor.1 s1, t6, a5
li t7, 25205
mul t3, t1, t7
lw t6, 117(sp)
lw t7, 162(sp)
and t1, t6, t7, 13
li t7, 186648158
mul s2, s2, t7
lw t7, 180(sp)
add a5, s0, t7
lw t6, 198(sp)
li t7, 4398910
mul t6, t6, t7
sw t6, 57(sp)
and.1 t5, a7, t5, 13
lw t7, 6(sp)
or s0, s1, t7, -13
lw t7, 198(sp)
or t6, a3, t7, -13
sw t6, 165(sp)
add a6, s2, a6
lw t6, 51(sp)
lw t7, 165(sp)
xor.1 a7, t6, t7
lw t7, 177(sp)
or.1 t6, a3, t7
sw t6, 180(sp)
slli s2, s0, 4
li t7, 111936839
or s0, t5, t7, -13
lw t6, 228(sp)
lw t7, 180(sp)
and.1 s1, t6, t7, 13
lw t6, 189(sp)
lw t7, 42(sp)
or t6, t6, t7, -13
sw t6, 186(sp)
lw t6, 198(sp)
li t7, 47013862
mul t5, t6, t7
lw t6, 87(sp)
xor s0, t6, s0
and s1, s1, t4, 13
lw t7, 195(sp)
add s2, s2, t7
li t7, -185153675
mul t4, a4, t7
lw t7, 33(sp)
xor.T a4, t2, t7
lw t6, 177(sp)
lw t7, 27(sp)
xor.T s3, t6, t7
li t7, 151511219
mul t2, a4, t7
add a4, s2, t3
li t7, -177564489
mul s2, s3, t7
li t7, 98489260
mul t3, s0, t7
add s0, s2, t5
li t7, 59440563
mul t5, t0, t7
li t7, 128403071
mul s1, s1, t7
li t7, 11586952
mul t6, t1, t7
sw t6, 195(sp)
lw t7, 129(sp)
add t0, a4, t7
lw t6, 198(sp)
li t7, 111936839
and.1 a4, t6, t7, 13
add t1, s1, t5
lw t6, 162(sp)
lw t7, 243(sp)
or t5, t6, t7, -13
lw t6, 48(sp)
li t7, -57722419
mul t6, t6, t7
sw t6, 87(sp)
add a5, t3, a5
lw t6, 147(sp)
add s1, t6, a5
add a5, t2, t4
lw t6, 249(sp)
add t1, t6, t1
lw t6, 177(sp)
li t7, 25990703
mul t3, t6, t7
add s0, a5, s0
lw t6, 177(sp)
li t7, 111936839
xor t6, t6, t7
sw t6, 126(sp)
li t7, 111936839
xor.1 a5, a3, t7
lw t6, 0(sp)
add t2, t6, s1
lw t7, 237(sp)
add t4, t2, t7
lw t6, 204(sp)
lw t7, 144(sp)
or.1 t6, t6, t7
sw t6, 6(sp)
li t7, -150253472
mul t2, a7, t7
add a6, t4, a6
lw t6, 90(sp)
add a7, t6, a6
or a6, a4, a5, -13
lw t6, 207(sp)
lw t7, 33(sp)
xor t4, t6, t7
and.T s2, t5, a6, -13
lw t6, 57(sp)
add a6, t6, s0
lw t6, 243(sp)
lw t7, 207(sp)
xor.1 s1, t6, t7
lw t6, 159(sp)
add a7, t6, a7
lw t6, 81(sp)
lw t7, 165(sp)
or.T s3, t6, t7
lw t6, 12(sp)
li t7, -145976588
mul t5, t6, t7
lw t6, 84(sp)
add t5, t6, t5
add s0, a7, t0
lw t6, 174(sp)
lw t7, 204(sp)
and.1 a7, t6, t7, 13
add t0, t3, t5
li t7, 175534048
mul t6, a7, t7
sw t6, 57(sp)
lw t6, 219(sp)
add a7, t6, t0
lw t6, 240(sp)
lw t7, 126(sp)
or.T t0, t6, t7
add t5, t1, a6
li t7, -105683262
mul a6, s3, t7
lw t6, 141(sp)
lw t7, 93(sp)
or.T t3, t6, t7
xor.T t0, s2, t0
lw t6, 93(sp)
lw t7, 189(sp)
xor.1 s2, t6, t7
lw t7, 186(sp)
xor t0, t0, t7
xor.1 t4, s1, t4
li t7, -180016024
mul t0, t0, t7
lw t7, 21(sp)
or.1 t1, a4, t7
lw t6, 15(sp)
li t7, -142861651
mul a4, t6, t7
lw t7, 234(sp)
and.T s1, a5, t7, -13
li t7, 51596254
mul s3, s1, t7
li t7, -14500651
mul t1, t1, t7
lw t6, 246(sp)
add s1, t6, s0
add t2, t2, s3
lw t6, 180(sp)
li t7, 111936839
and.1 s0, t6, t7, 13
li t7, -38017899
mul t4, t4, t7
lw t6, 63(sp)
add s1, t6, s1
li t7, -111936839
xor.1 t6, a5, t7
sw t6, 12(sp)
xor a5, s2, a3
add t6, s1, t5
sw t6, 0(sp)
lw t6, 27(sp)
and s3, t6, s0, 13
li t7, -43882155
add s0, t2, t7
lw t6, 144(sp)
lw t7, 24(sp)
or t5, t6, t7, -13
lw t6, 141(sp)
lw t7, 36(sp)
and.T s2, t6, t7, -13
li t7, -37485526
mul s1, a5, t7
li t7, 111936839
and.T t6, a3, t7, -13
sw t6, 15(sp)
lw t6, 144(sp)
xor a5, t6, s3
lw t6, 15(sp)
lw t7, 81(sp)
and.T t2, t6, t7, -13
li t7, -111936839
xor.T s4, t3, t7
lw t6, 240(sp)
lw t7, 216(sp)
xor.1 s3, t6, t7
li t7, -143300728
mul s5, a5, t7
lw t6, 6(sp)
lw t7, 144(sp)
or t3, t6, t7, -13
add t4, t4, a4
lw t6, 177(sp)
lw t7, 198(sp)
and.1 a5, t6, t7, 13
add a4, a7, s0
add t4, t4, s5
lw t6, 138(sp)
li t7, -127528371
mul s0, t6, t7
li t7, -55328422
mul a7, s2, t7
lw t6, 195(sp)
add a4, t6, a4
add s1, s1, a6
li t7, -159539768
mul a6, s4, t7
lw t6, 240(sp)
li t7, -94833648
mul s4, t6, t7
add t0, t0, s1
and.1 s1, t5, s3, 13
lw t6, 15(sp)
lw t7, 198(sp)
and.1 t5, t6, t7, 13
add t0, t1, t0
lw t6, 234(sp)
lw t7, 102(sp)
xor t1, t6, t7
li t7, -117622597
mul t6, t5, t7
sw t6, 6(sp)
lw t6, 228(sp)
lw t7, 3(sp)
xor.1 t5, t6, t7
lw t6, 189(sp)
li t7, 60065530
mul s2, t6, t7
lw t6, 189(sp)
lw t7, 132(sp)
xor s3, t6, t7
lw t6, 207(sp)
lw t7, 27(sp)
or.1 s5, t6, t7
li t7, 31727984
mul t1, t1, t7
li t7, -106977020
mul s6, s3, t7
add s3, t1, s0
add t6, s4, s6
sw t6, 3(sp)
lw t6, 27(sp)
lw t7, 33(sp)
and t1, t6, t7, 13
lw t6, 144(sp)
lw t7, 42(sp)
or.T s0, t6, t7
lw t7, 216(sp)
xor s6, t1, t7
lw t6, 177(sp)
lw t7, 24(sp)
xor.T t1, t6, t7
slli s4, t2, 4
lw t6, 12(sp)
and.1 t2, t6, s1, 13
xor.1 t2, t3, t2
li t7, 19256688
mul t2, t2, t7
lw t6, 198(sp)
and s1, t6, s6, 13
lw t6, 198(sp)
xor t3, t6, s5
add t4, t4, t2
lw t7, 87(sp)
add t2, s2, t7
lw t6, 216(sp)
or s2, t6, a5, -13
add a6, s4, a6
add a5, s3, a7
li t7, 144120697
mul a7, t5, t7
lw t6, 57(sp)
add t4, t6, t4
add t0, t0, t4
li t7, -48421957
mul t5, s2, t7
add s2, a4, t0
li t7, 47127584
mul t0, s1, t7
lw t7, 78(sp)
or a4, s0, t7, -13
lw t6, 102(sp)
li t7, -161267708
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 162(sp)
lw t7, 168(sp)
xor s1, t6, t7
lw t7, 45(sp)
xor.T s0, t3, t7
lw t6, 153(sp)
xor.T t4, t6, a3
add t5, t5, a7
add a7, s2, a6
lw t7, 171(sp)
and t3, s1, t7, 13
add t6, t0, t5
sw t6, 12(sp)
lw t7, 120(sp)
xor a6, t1, t7
li t7, 137741290
mul t1, s0, t7
or a4, a6, a4, -13
li t7, 68130567
mul a4, a4, t7
lw t6, 165(sp)
li t7, -29056698
mul t0, t6, t7
lw t6, 126(sp)
li t7, -180729588
mul t6, t6, t7
sw t6, 27(sp)
li t7, -181043547
mul a6, t4, t7
lw t7, 30(sp)
xor t4, a3, t7
add t5, t1, t2
lw t6, 36(sp)
lw t7, 69(sp)
and.1 t1, t6, t7, 13
lw t6, 30(sp)
xor.1 t2, t6, t3
lw t6, 99(sp)
xor t3, t6, t4
li t7, -145662780
mul t4, t3, t7
add t5, a5, t5
lw t6, 51(sp)
lw t7, 153(sp)
or.T a5, t6, t7
lw t6, 240(sp)
lw t7, 24(sp)
xor.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 54(sp)
and.1 t2, t6, t2, 13
li t7, 88103307
mul t3, t2, t7
lw t7, 3(sp)
add t5, t5, t7
lw t6, 33(sp)
lw t7, 225(sp)
and t2, t6, t7, 13
lw t7, 228(sp)
xor.1 a5, a5, t7
lw t6, 6(sp)
add t5, t6, t5
add s0, a7, t5
li t7, -41766360
mul t2, t2, t7
lw t6, 204(sp)
li t7, -120324515
mul t5, t6, t7
lw t6, 48(sp)
li t7, 177629592
mul a7, t6, t7
lw t6, 216(sp)
or.T a5, t6, a5
add t0, t0, t4
lw t6, 0(sp)
add t4, t6, s0
li t7, -180851661
mul s0, a5, t7
lw t6, 240(sp)
or.T a5, t6, t1
li t7, -151776046
mul a5, a5, t7
add t5, t5, a6
lw t7, 198(sp)
and.T t1, a3, t7, -13
lw t6, 15(sp)
lw t7, 228(sp)
and a6, t6, t7, 13
lw t7, 180(sp)
and.T t6, t1, t7, -13
sw t6, 6(sp)
lw t6, 198(sp)
andi t1, t6, 0
add t3, t3, t5
add a4, a4, t3
lw t6, 117(sp)
li t7, 14408599
mul t5, t6, t7
lw t7, 12(sp)
add t6, t4, t7
sw t6, 3(sp)
add t0, s0, t0
lw t6, 198(sp)
li t7, 111936839
xor.T t3, t6, t7
lw t6, 54(sp)
lw t7, 33(sp)
and.T s0, t6, t7, -13
lw t6, 81(sp)
li t7, 130214468
mul t4, t6, t7
add t2, a4, t2
lw t6, 177(sp)
and a4, t6, t3, 13
lw t6, 21(sp)
add t2, t6, t2
lw t6, 51(sp)
lw t7, 153(sp)
and.T s2, t6, t7, -13
add t6, t2, t0
sw t6, 15(sp)
lw t6, 177(sp)
li t7, 111936839
and.1 s3, t6, t7, 13
lw t7, 132(sp)
or.T t0, a3, t7
lw t6, 228(sp)
li t7, -111936839
xor t3, t6, t7
lw t6, 213(sp)
lw t7, 198(sp)
xor s1, t6, t7
li t7, 33134796
mul t0, t0, t7
lw t6, 27(sp)
add t2, t6, t0
lw t6, 177(sp)
lw t7, 210(sp)
or.T t0, t6, t7
add t5, a7, t5
lw t6, 234(sp)
li t7, -189510680
mul a7, t6, t7
lw t6, 33(sp)
or.1 s3, t6, s3
and.T s0, s2, s0, -13
lw t6, 228(sp)
li t7, 86353292
mul t6, t6, t7
sw t6, 12(sp)
li t7, -6490722
mul s0, s0, t7
lw t7, 24(sp)
xor.T s4, s3, t7
add t5, a5, t5
lw t7, 93(sp)
xor.1 s3, t1, t7
lw t6, 177(sp)
and.1 s2, t6, a3, 13
li t7, -70305164
mul t1, a6, t7
add s0, t4, s0
li t7, 190566646
mul a6, s1, t7
li t7, 13221485
mul s1, s4, t7
lw t6, 198(sp)
li t7, 79642241
xor a3, t6, t7
lw t6, 177(sp)
lw t7, 126(sp)
or.T a5, t6, t7
li t7, 166230053
mul s3, s3, t7
lw t6, 240(sp)
li t7, 76972543
mul t4, t6, t7
xor t6, a3, a3
sw t6, 129(sp)
lw t6, 33(sp)
li t7, -89832691
mul t6, t6, t7
sw t6, 0(sp)
li t7, -155679082
mul s2, s2, t7
or.1 a4, a4, t3
lw t6, 6(sp)
or.1 t3, t6, a4
add a4, s3, s2
lw t7, 192(sp)
and.1 t6, a3, t7, 13
sw t6, 33(sp)
add t5, t2, t5
lw t6, 192(sp)
li t7, 167939760
and.T t6, t6, t7, -13
sw t6, 21(sp)
li t7, -65950722
mul t2, t3, t7
add t6, t2, s0
sw t6, 27(sp)
lw t6, 171(sp)
lw t7, 99(sp)
and t2, t6, t7, 13
add t3, t5, s1
lw t6, 198(sp)
and t0, t6, t0, 13
add a4, a7, a4
li t7, -81747171
mul a7, t0, t7
lw t6, 168(sp)
li t7, -152870452
mul t0, t6, t7
lw t6, 15(sp)
add t6, t6, t3
sw t6, 15(sp)
add a7, a7, t1
add a7, t4, a7
lw t6, 192(sp)
or.T t6, t6, a3
sw t6, 48(sp)
lw t7, 132(sp)
xor t1, t2, t7
lw t6, 21(sp)
lw t7, 33(sp)
and.T t2, t6, t7, -13
li t7, 167939760
and.1 t6, a3, t7, 13
sw t6, 141(sp)
li t7, 126438043
mul t1, t1, t7
add a6, a7, a6
lw t6, 231(sp)
or t3, t6, a3, -13
add a7, a4, a6
li t7, 34326948
mul a4, t3, t7
lw t6, 129(sp)
li t7, 167939760
and.1 a6, t6, t7, 13
lw t6, 102(sp)
or.1 a5, t6, a5
lw t6, 192(sp)
li t7, 167939760
xor.1 t6, t6, t7
sw t6, 42(sp)
li t7, 167939760
or.T t6, a3, t7
sw t6, 51(sp)
li t7, 167939760
or t6, a3, t7, -13
sw t6, 57(sp)
lw t6, 192(sp)
xor.T t6, t6, a3
sw t6, 147(sp)
lw t7, 48(sp)
xor.1 t2, t2, t7
lw t6, 192(sp)
and.T t6, t6, a3, -13
sw t6, 93(sp)
slli t6, t2, 2
sw t6, 84(sp)
add t1, t0, t1
li t7, -92461074
mul a5, a5, t7
lw t6, 42(sp)
xor.T t6, t6, a3
sw t6, 45(sp)
lw t6, 12(sp)
add t0, t6, a5
li t7, 48526810
add t1, t1, t7
lw t6, 141(sp)
lw t7, 93(sp)
or a5, t6, t7, -13
lw t7, 42(sp)
and.T t6, a3, t7, -13
sw t6, 171(sp)
or.T a5, a6, a5
lw t7, 192(sp)
xor t6, a3, t7
sw t6, 165(sp)
li t7, 167939760
xor.T t6, a3, t7
sw t6, 102(sp)
lw t6, 192(sp)
li t7, 167939760
or.T t6, t6, t7
sw t6, 168(sp)
lw t7, 147(sp)
xor a6, a3, t7
lw t6, 192(sp)
xor.1 t6, t6, a3
sw t6, 99(sp)
add t0, t0, t1
lw t6, 51(sp)
lw t7, 141(sp)
and t6, t6, t7, 13
sw t6, 87(sp)
lw t7, 0(sp)
add t0, t0, t7
add t1, a7, t0
lw t6, 57(sp)
lw t7, 93(sp)
and.1 t0, t6, t7, 13
lw t6, 21(sp)
lw t7, 57(sp)
and.T t6, t6, t7, -13
sw t6, 162(sp)
lw t6, 192(sp)
lw t7, 99(sp)
and.1 a7, t6, t7, 13
lw t6, 192(sp)
and t6, t6, a3, 13
sw t6, 90(sp)
li t7, 86280375
mul a5, a5, t7
lw t6, 42(sp)
lw t7, 141(sp)
or t6, t6, t7, -13
sw t6, 36(sp)
lw t6, 192(sp)
li t7, 167939760
and t6, t6, t7, 13
sw t6, 6(sp)
add t6, a4, a5
sw t6, 24(sp)
lw t6, 102(sp)
and.T t3, t6, a3, -13
lw t6, 27(sp)
add t2, t6, t1
lw t6, 168(sp)
and.1 a4, t6, a3, 13
lw t6, 57(sp)
li t7, 75308160
mul a5, t6, t7
lw t6, 33(sp)
xor t1, t6, a3
lw t6, 192(sp)
lw t7, 90(sp)
and.T t4, t6, t7, -13
xor.1 t3, t3, a3
li t7, 167939760
or.1 t6, a3, t7
sw t6, 12(sp)
li t7, -127135154
mul t6, t4, t7
sw t6, 0(sp)
lw t6, 15(sp)
add t2, t6, t2
lw t6, 3(sp)
add t6, t6, t2
sw t6, 69(sp)
lw t6, 165(sp)
lw t7, 12(sp)
or.1 t2, t6, t7
lw t7, 51(sp)
and t2, t2, t7, 13
li t7, 167939760
and.T t6, a3, t7, -13
sw t6, 54(sp)
li t7, 178455940
mul t6, t3, t7
sw t6, 63(sp)
lw t6, 99(sp)
li t7, 48042525
mul t6, t6, t7
sw t6, 159(sp)
li t7, 36410452
mul a6, a6, t7
lw t6, 171(sp)
xor.T t0, t6, t0
lw t6, 54(sp)
lw t7, 165(sp)
xor.1 t6, t6, t7
sw t6, 30(sp)
lw t7, 192(sp)
or t6, a3, t7, -13
sw t6, 15(sp)
lw t6, 231(sp)
or t4, t6, t1, -13
lw t7, 147(sp)
xor.T a7, a7, t7
li t7, -136600926
mul t1, a7, t7
lw t6, 45(sp)
li t7, 106130948
mul t6, t6, t7
sw t6, 153(sp)
lw t6, 54(sp)
lw t7, 12(sp)
xor.T t3, t6, t7
lw t6, 192(sp)
li t7, 167939760
or t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 87(sp)
li t7, 19200773
mul t5, t6, t7
li t7, 1867033
mul t6, t4, t7
sw t6, 126(sp)
lw t6, 33(sp)
li t7, 167939760
xor.1 t4, t6, t7
li t7, 151064284
mul a7, a4, t7
lw t6, 54(sp)
and t2, t6, t2, 13
lw t6, 6(sp)
li t7, -133449664
mul s0, t6, t7
li t7, 167939760
or.T t6, t3, t7
sw t6, 120(sp)
lw t6, 99(sp)
lw t7, 21(sp)
or a4, t6, t7, -13
add t6, t5, s0
sw t6, 81(sp)
li t7, 160276173
mul t3, t2, t7
lw t6, 90(sp)
lw t7, 231(sp)
or t2, t6, t7, -13
lw t6, 192(sp)
lw t7, 168(sp)
and.1 s2, t6, t7, 13
slli t0, t0, 1
add s3, a6, t0
add s1, t3, a5
lw t6, 165(sp)
lw t7, 129(sp)
or.T a5, t6, t7
lw t7, 192(sp)
or.1 t6, a3, t7
sw t6, 138(sp)
or.T a6, a3, a5
lw t6, 192(sp)
li t7, 167939760
xor.T a5, t6, t7
lw t6, 54(sp)
lw t7, 42(sp)
or t3, t6, t7, -13
lw t6, 138(sp)
li t7, -56535113
mul t5, t6, t7
lw t6, 33(sp)
li t7, -136974386
mul t0, t6, t7
li t7, 181055854
mul s0, a6, t7
li t7, 62607902
mul a6, s2, t7
add t1, t1, s3
lw t7, 15(sp)
or.T s2, a3, t7
lw t6, 192(sp)
li t7, -57796718
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 45(sp)
and t6, t6, t4, 13
sw t6, 3(sp)
add s1, t1, s1
and.T t4, a5, s2, -13
lw t6, 12(sp)
lw t7, 57(sp)
xor.1 t1, t6, t7
lw t6, 51(sp)
or t1, t6, t1, -13
add a7, s1, a7
lw t6, 63(sp)
add a7, t6, a7
lw t6, 24(sp)
add a7, t6, a7
lw t6, 84(sp)
add t6, t6, a7
sw t6, 84(sp)
li t7, -167847382
mul t6, t2, t7
sw t6, 63(sp)
lw t7, 36(sp)
xor.1 a7, t4, t7
lw t6, 102(sp)
li t7, 51677660
mul t2, t6, t7
lw t6, 102(sp)
lw t7, 33(sp)
xor.1 t6, t6, t7
sw t6, 144(sp)
li t7, 65231179
mul a7, a7, t7
lw t6, 192(sp)
li t7, 167939760
xor t6, t6, t7
sw t6, 132(sp)
lw t6, 87(sp)
li t7, -50311214
mul t6, t6, t7
sw t6, 36(sp)
add a7, t5, a7
add t4, t2, s0
xor t3, t3, t1
lw t6, 30(sp)
li t7, -95501189
mul t1, t6, t7
or t2, a4, a5, -13
lw t6, 48(sp)
xor.1 a4, t6, a3
slli t6, a3, 1
sw t6, 117(sp)
li t7, 75059194
mul t3, t3, t7
add t0, t0, t4
lw t6, 120(sp)
lw t7, 93(sp)
or t4, t6, t7, -13
li t7, -26957792
mul s0, t4, t7
lw t7, 129(sp)
or a5, a5, t7, -13
lw t6, 138(sp)
lw t7, 132(sp)
and.1 t4, t6, t7, 13
and.1 t5, t4, a5, 13
lw t7, 0(sp)
add t4, t1, t7
lw t6, 192(sp)
li t7, -10422194
mul t1, t6, t7
add s0, s0, a6
lw t6, 33(sp)
lw t7, 141(sp)
and.1 a5, t6, t7, 13
lw t6, 15(sp)
lw t7, 162(sp)
and.1 a6, t6, t7, 13
li t7, 167939760
xor t6, a3, t7
sw t6, 120(sp)
li t7, 68262019
mul s1, t2, t7
lw t6, 120(sp)
xor t2, t6, a3
add t3, s1, t3
add t0, t0, t3
lw t6, 21(sp)
lw t7, 120(sp)
or.T t3, t6, t7
li t7, 106718467
mul t6, a6, t7
sw t6, 162(sp)
li t7, 63629637
mul t6, a4, t7
sw t6, 30(sp)
li t7, -38820215
mul a6, t5, t7
li t7, -97787016
mul s1, t3, t7
lw t7, 81(sp)
add t3, t4, t7
lw t6, 153(sp)
add t4, t6, s0
lw t6, 138(sp)
lw t7, 141(sp)
xor.1 a4, t6, t7
li t7, -75718180
mul t5, t2, t7
add t2, t1, s1
add a7, t4, a7
lw t6, 126(sp)
add t1, t6, a7
lw t6, 48(sp)
lw t7, 102(sp)
and.T a7, t6, t7, -13
lw t6, 165(sp)
lw t7, 171(sp)
and t6, t6, t7, 13
sw t6, 126(sp)
lw t6, 165(sp)
or.T t4, t6, a7
li t7, -128957095
mul a7, a5, t7
li t7, -54966897
add t5, t5, t7
lw t6, 129(sp)
li t7, 161919851
mul t6, t6, t7
sw t6, 24(sp)
add a5, t1, t0
add t3, t3, a5
lw t6, 3(sp)
li t7, -193542097
mul a5, t6, t7
lw t7, 27(sp)
add t0, a5, t7
lw t6, 138(sp)
lw t7, 132(sp)
or.T t1, t6, t7
li t7, 46187278
mul t4, t4, t7
lw t6, 90(sp)
li t7, -183603512
mul a5, t6, t7
lw t6, 117(sp)
add t5, t6, t5
lw t6, 192(sp)
li t7, 167939760
and.1 t6, t6, t7, 13
sw t6, 81(sp)
add t6, t2, a7
sw t6, 27(sp)
add t6, t0, t5
sw t6, 117(sp)
lw t6, 120(sp)
li t7, -104519722
mul t0, t6, t7
lw t6, 84(sp)
add t6, t6, t3
sw t6, 0(sp)
lw t6, 147(sp)
lw t7, 81(sp)
or a7, t6, t7, -13
add a6, a6, t4
lw t6, 63(sp)
add t3, t6, a6
lw t6, 12(sp)
lw t7, 21(sp)
or.T t5, t6, t7
li t7, 184136122
mul t2, a3, t7
lw t6, 93(sp)
lw t7, 6(sp)
and.1 s0, t6, t7, 13
li t7, 15839631
mul a4, a4, t7
li t7, 167179098
mul a6, a7, t7
lw t6, 90(sp)
lw t7, 12(sp)
and.1 t4, t6, t7, 13
lw t7, 36(sp)
add t6, t3, t7
sw t6, 12(sp)
lw t7, 138(sp)
and.1 a7, t5, t7, 13
li t7, 71116587
mul t3, a7, t7
li t7, 141419019
mul a7, s0, t7
lw t6, 168(sp)
li t7, -173198686
mul t6, t6, t7
sw t6, 6(sp)
li t7, 21981231
mul t5, a3, t7
add t3, t3, a6
lw t6, 15(sp)
or.1 s1, t6, t1
lw t6, 102(sp)
lw t7, 147(sp)
and.T a6, t6, t7, -13
lw t6, 87(sp)
li t7, 59896250
mul t1, t6, t7
lw t7, 159(sp)
add s0, a4, t7
li t7, 111823805
mul t4, t4, t7
lw t6, 54(sp)
li t7, 33826011
mul s4, t6, t7
lw t6, 192(sp)
li t7, -119148491
mul s2, t6, t7
lw t6, 15(sp)
lw t7, 120(sp)
or.1 a4, t6, t7
add s2, s2, t0
add s3, a5, s0
lw t7, 90(sp)
xor.1 a5, a3, t7
lw t7, 33(sp)
and.T s0, a3, t7, -13
add t0, t2, s4
add t0, t0, t5
li t7, -178895323
mul s4, s1, t7
lw t6, 168(sp)
or s1, t6, a3, -13
lw t7, 132(sp)
and.1 t2, a3, t7, 13
lw t6, 144(sp)
or.1 a5, t6, a5
add s3, t3, s3
lw t6, 192(sp)
lw t7, 99(sp)
xor.T t3, t6, t7
lw t6, 138(sp)
li t7, 105614627
mul t6, t6, t7
sw t6, 3(sp)
add t5, t1, s2
add t4, s4, t4
lw t6, 93(sp)
lw t7, 102(sp)
or.T t1, t6, t7
add a7, a7, t4
lw t6, 90(sp)
and.T t2, t6, t2, -13
lw t7, 24(sp)
add t4, s3, t7
lw t6, 132(sp)
and.T s2, t6, s0, -13
lw t6, 30(sp)
add s0, t6, t4
xor t4, s1, t1
xor a6, s2, a6
li t7, -32107309
mul t1, a6, t7
lw t6, 27(sp)
add a6, t6, s0
li t7, 167939760
xor.1 t6, a3, t7
sw t6, 27(sp)
li t7, -22372654
mul s0, t4, t7
lw t6, 12(sp)
add a6, t6, a6
lw t7, 51(sp)
xor t3, t3, t7
lw t6, 117(sp)
add t4, t6, a6
add a6, t5, a7
lw t6, 162(sp)
add a7, t6, t4
lw t6, 0(sp)
add a7, t6, a7
lw t7, 192(sp)
and t5, t3, t7, 13
lw t6, 33(sp)
li t7, -140317322
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 99(sp)
li t7, -167939760
xor.1 t4, t6, t7
add t3, t0, s0
lw t6, 27(sp)
lw t7, 15(sp)
xor.T t0, t6, t7
li t7, 154094904
mul t2, t2, t7
lw t6, 126(sp)
and a4, t6, a4, 13
add t2, t3, t2
lw t6, 90(sp)
li t7, -160744238
mul t3, t6, t7
lw t7, 57(sp)
xor.1 s1, a3, t7
li t7, -34802270
mul s2, t5, t7
li t7, -31421694
mul s0, a3, t7
xor.1 t5, a4, s1
add a4, s2, t1
li t7, -69517107
mul t6, t4, t7
sw t6, 12(sp)
add a4, a4, s0
li t7, 27074972
mul t1, a5, t7
lw t6, 57(sp)
lw t7, 33(sp)
and t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 99(sp)
lw t7, 87(sp)
or.1 a5, t6, t7
lw t6, 90(sp)
lw t7, 147(sp)
and s0, t6, t7, 13
li t7, 142570828
mul s1, a5, t7
li t7, 21867591
mul t4, t5, t7
lw t6, 51(sp)
and.1 a5, t6, a3, 13
add t5, t1, t2
add t1, s1, t3
li t7, 114516334
mul t2, s0, t7
lw t6, 138(sp)
lw t7, 102(sp)
or t3, t6, t7, -13
li t7, -37011038
mul t3, t3, t7
lw t7, 6(sp)
add t4, t4, t7
add a6, a6, t5
lw t7, 3(sp)
add t5, t4, t7
add t6, a7, a6
sw t6, 0(sp)
lw t6, 129(sp)
lw t7, 42(sp)
xor.T a6, t6, t7
lw t6, 93(sp)
lw t7, 132(sp)
and.T t4, t6, t7, -13
xor a7, a5, t0
lw t6, 54(sp)
lw t7, 48(sp)
or.1 a5, t6, t7
add a7, t2, a7
add a7, t5, a7
add t2, a7, t3
lw t6, 102(sp)
li t7, 123715648
mul a7, t6, t7
li t7, 97323627
mul t0, a6, t7
li t7, 167939760
xor.1 t3, t4, t7
lw t6, 138(sp)
lw t7, 141(sp)
and s0, t6, t7, 13
lw t6, 168(sp)
lw t7, 99(sp)
and t4, t6, t7, 13
lw t6, 90(sp)
li t7, 121400480
mul t5, t6, t7
lw t6, 192(sp)
lw t7, 102(sp)
or a6, t6, t7, -13
lw t7, 33(sp)
xor.T s0, s0, t7
add s1, t0, t1
lw t7, 57(sp)
and.T t0, a3, t7, -13
li t7, 105798881
mul t3, t3, t7
li t7, 106190465
mul s0, s0, t7
lw t6, 192(sp)
li t7, 167939760
or.1 t1, t6, t7
add t5, s1, t5
add t2, t2, t5
add t6, a4, t2
sw t6, 24(sp)
lw t7, 45(sp)
xor t2, t4, t7
add a7, s0, a7
lw t6, 129(sp)
li t7, 167939760
and.T a4, t6, t7, -13
li t7, 150352614
mul t6, t2, t7
sw t6, 3(sp)
lw t7, 129(sp)
and t2, t1, t7, 13
lw t6, 12(sp)
add t4, t6, a7
or t5, a3, t1, -13
lw t6, 132(sp)
li t7, -46680518
mul a7, t6, t7
add t6, t4, t3
sw t6, 6(sp)
lw t6, 15(sp)
or.T t3, t6, t5
li t7, 167939760
and.1 a6, a6, t7, 13
xor.1 a6, t0, a6
and.T a6, a6, t3, -13
xor a5, a3, a5
li t7, -167939760
xor.1 t1, t1, t7
lw t6, 57(sp)
andi t0, t6, 0
lw t6, 99(sp)
xor t1, t6, t1
xor.T t1, t1, t2
and.1 a6, t1, a6, 13
lw t6, 129(sp)
lw t7, 132(sp)
xor.1 t1, t6, t7
xor.1 t2, a5, a4
lw t6, 141(sp)
and a5, t6, t0, 13
lw t7, 54(sp)
and.1 t0, a3, t7, 13
li t7, -152983638
mul a6, a6, t7
lw t6, 231(sp)
lw t7, 51(sp)
and t3, t6, t7, 13
lw t6, 138(sp)
lw t7, 81(sp)
xor a4, t6, t7
add a6, a6, a7
lw t7, 33(sp)
xor.T t4, t3, t7
lw t7, 192(sp)
and.1 t3, t1, t7, 13
li t7, -8906808
mul a7, a3, t7
lw t7, 141(sp)
or t5, a3, t7, -13
lw t7, 102(sp)
xor.1 s0, t4, t7
li t7, 128083686
mul t0, t0, t7
lw t6, 93(sp)
lw t7, 165(sp)
and.1 t1, t6, t7, 13
li t7, 171414214
mul s1, a5, t7
lw t6, 48(sp)
li t7, -117397782
mul a5, t6, t7
lw t6, 138(sp)
or.1 t4, t6, t2
li t7, -110515423
mul t2, s0, t7
lw t6, 21(sp)
add t2, t6, t2
li t7, -58846676
mul t5, t5, t7
add t2, s1, t2
lw t6, 192(sp)
or t3, t6, t3, -13
li t7, -152893828
mul s0, t3, t7
add t2, t2, a7
lw t6, 27(sp)
li t7, 63383631
mul t3, t6, t7
li t7, 94284840
mul a4, a4, t7
lw t6, 54(sp)
li t7, -108080179
mul a7, t6, t7
li t7, 16345000
mul t4, t4, t7
add t5, s0, t5
add t0, t0, t5
li t7, 176561559
mul t1, t1, t7
lw t7, 3(sp)
add t4, t4, t7
add a6, t4, a6
lw t7, 102(sp)
xor t4, a3, t7
add t3, t3, t1
lw t6, 6(sp)
add t1, t6, a6
lw t6, 33(sp)
li t7, -149419676
mul a6, t6, t7
add t0, t2, t0
add t0, t1, t0
lw t6, 108(sp)
lw t7, 123(sp)
and.T t6, t6, t7, -13
sw t6, 186(sp)
lw t6, 147(sp)
xor.1 a3, t6, a3
lw t6, 72(sp)
li t7, -120023839
xor.T t6, t6, t7
sw t6, 48(sp)
lw t6, 165(sp)
lw t7, 120(sp)
or t1, t6, t7, -13
lw t6, 102(sp)
or t2, t6, t4, -13
add a7, t3, a7
add a7, a5, a7
lw t6, 72(sp)
li t7, -120023839
and t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 123(sp)
li t7, -120023839
or.1 t6, t6, t7
sw t6, 171(sp)
lw t6, 156(sp)
lw t7, 186(sp)
and.1 a5, t6, t7, 13
li t7, -186750032
mul t2, t2, t7
lw t7, 51(sp)
or t3, a3, t7, -13
li t7, 121808228
mul a5, a5, t7
lw t6, 72(sp)
lw t7, 108(sp)
or.1 a3, t6, t7
add a7, t0, a7
xor.1 t0, t1, t3
lw t6, 24(sp)
add a7, t6, a7
lw t6, 0(sp)
add a7, t6, a7
lw t6, 72(sp)
lw t7, 108(sp)
xor t6, t6, t7
sw t6, 90(sp)
add t1, a4, t2
lw t6, 123(sp)
li t7, -120023839
and t6, t6, t7, 13
sw t6, 120(sp)
lw t6, 171(sp)
lw t7, 63(sp)
or.1 a4, t6, t7
add a6, t1, a6
li t7, 6075861
mul t0, t0, t7
lw t6, 72(sp)
li t7, -120023839
xor.1 t6, t6, t7
sw t6, 126(sp)
lw t7, 90(sp)
or.1 a4, a4, t7
li t7, 71307201
mul a4, a4, t7
add a4, a5, a4
add a5, a6, t0
lw t6, 150(sp)
xor a3, t6, a3
lw t6, 90(sp)
lw t7, 48(sp)
or t0, t6, t7, -13
lw t6, 72(sp)
xor a6, t6, a3
add t6, a7, a5
sw t6, 24(sp)
lw t6, 120(sp)
li t7, 110713111
mul a3, t6, t7
lw t6, 72(sp)
li t7, -120023839
and.1 t6, t6, t7, 13
sw t6, 129(sp)
lw t6, 126(sp)
li t7, -28767574
mul a5, t6, t7
add a5, a3, a5
lw t6, 183(sp)
lw t7, 129(sp)
xor.T a3, t6, t7
li t7, 97234201
mul t0, t0, t7
lw t6, 123(sp)
lw t7, 108(sp)
xor.T t6, t6, t7
sw t6, 162(sp)
lw t6, 108(sp)
li t7, -120023839
and t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 72(sp)
li t7, -120023839
and.T t6, t6, t7, -13
sw t6, 174(sp)
lw t6, 108(sp)
li t7, -120023839
or.T t6, t6, t7
sw t6, 27(sp)
lw t6, 123(sp)
li t7, -120023839
xor.T t6, t6, t7
sw t6, 132(sp)
lw t6, 123(sp)
li t7, -120023839
or.T t6, t6, t7
sw t6, 3(sp)
lw t6, 72(sp)
lw t7, 108(sp)
xor.T t6, t6, t7
sw t6, 15(sp)
lw t6, 108(sp)
li t7, -120023839
or t6, t6, t7, -13
sw t6, 144(sp)
lw t6, 126(sp)
lw t7, 3(sp)
or.1 t1, t6, t7
lw t6, 162(sp)
lw t7, 42(sp)
xor.T t2, t6, t7
lw t6, 132(sp)
li t7, -4273400
mul a7, t6, t7
li t7, -111648726
mul a6, a6, t7
add a6, a6, t0
lw t6, 123(sp)
li t7, -120023839
or t6, t6, t7, -13
sw t6, 138(sp)
lw t6, 174(sp)
lw t7, 138(sp)
xor.1 t0, t6, t7
lw t7, 27(sp)
xor t4, t2, t7
li t7, -134768419
mul t2, t1, t7
add a4, a4, a6
lw t6, 162(sp)
li t7, 164320356
mul t3, t6, t7
li t7, 101352281
mul t1, t4, t7
lw t6, 183(sp)
lw t7, 18(sp)
xor.T t4, t6, t7
lw t6, 27(sp)
lw t7, 15(sp)
xor.1 a6, t6, t7
lw t6, 42(sp)
li t7, -120023839
and.T t6, t6, t7, -13
sw t6, 0(sp)
li t7, -39669396
mul t4, t4, t7
add a5, a5, t2
lw t6, 108(sp)
lw t7, 123(sp)
xor t6, t6, t7
sw t6, 177(sp)
lw t6, 72(sp)
li t7, -120023839
or.T t6, t6, t7
sw t6, 57(sp)
lw t6, 177(sp)
slli t5, t6, 8
lw t7, 144(sp)
xor a3, a3, t7
li t7, -81838676
mul t2, a3, t7
add t4, a7, t4
add a3, t3, t5
lw t6, 18(sp)
or.1 t3, t6, t0
lw t6, 9(sp)
lw t7, 108(sp)
and a7, t6, t7, 13
add t0, t4, t1
lw t6, 108(sp)
li t7, -120023839
xor.1 t6, t6, t7
sw t6, 21(sp)
lw t6, 57(sp)
lw t7, 108(sp)
or.1 t1, t6, t7
lw t7, 222(sp)
and.T t3, t3, t7, -13
lw t6, 108(sp)
lw t7, 123(sp)
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 21(sp)
lw t7, 108(sp)
or t4, t6, t7, -13
lw t6, 108(sp)
li t7, -120023839
and.T t6, t6, t7, -13
sw t6, 54(sp)
li t7, 20841988
mul t5, t3, t7
li t7, -93166745
mul t3, t4, t7
add t2, t5, t2
add a5, a5, t2
li t7, -122374194
mul a6, a6, t7
add t3, a6, t3
add t2, a4, a5
lw t6, 9(sp)
li t7, 84890380
mul a4, t6, t7
lw t6, 54(sp)
li t7, -113445560
mul a5, t6, t7
li t7, 71604820
mul a7, a7, t7
lw t6, 72(sp)
lw t7, 108(sp)
and.1 t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 72(sp)
lw t7, 108(sp)
or.T t6, t6, t7
sw t6, 141(sp)
lw t6, 108(sp)
and t1, t6, t1, 13
lw t6, 108(sp)
lw t7, 123(sp)
or t6, t6, t7, -13
sw t6, 168(sp)
lw t6, 108(sp)
lw t7, 39(sp)
xor t6, t6, t7
sw t6, 84(sp)
lw t6, 123(sp)
li t7, -120023839
and.1 t6, t6, t7, 13
sw t6, 45(sp)
add a3, t0, a3
lw t6, 120(sp)
lw t7, 123(sp)
xor.T a6, t6, t7
add t6, t2, a3
sw t6, 153(sp)
li t7, 154168628
mul a3, t1, t7
lw t6, 141(sp)
lw t7, 177(sp)
xor.1 t1, t6, t7
lw t6, 42(sp)
lw t7, 222(sp)
and t2, t6, t7, 13
lw t6, 108(sp)
lw t7, 123(sp)
or.1 t6, t6, t7
sw t6, 99(sp)
add t6, t3, a3
sw t6, 165(sp)
lw t6, 48(sp)
lw t7, 63(sp)
and a3, t6, t7, 13
lw t6, 132(sp)
li t7, 120023839
xor t3, t6, t7
lw t6, 108(sp)
li t7, -120023839
xor.T t5, t6, t7
lw t6, 90(sp)
li t7, -84161335
mul t6, t6, t7
sw t6, 102(sp)
lw t6, 0(sp)
lw t7, 168(sp)
xor t0, t6, t7
lw t6, 60(sp)
or.1 t4, t6, t5
lw t6, 18(sp)
li t7, -120023839
and s1, t6, t7, 13
lw t6, 99(sp)
lw t7, 222(sp)
or.T s2, t6, t7
add s0, a5, a4
xor.T t3, s2, t3
li t7, 193063801
mul a4, s1, t7
lw t7, 150(sp)
or.T a5, t5, t7
lw t6, 72(sp)
li t7, -120023839
or.1 t6, t6, t7
sw t6, 36(sp)
add t6, a7, s0
sw t6, 12(sp)
lw t6, 132(sp)
lw t7, 63(sp)
or.T a7, t6, t7
lw t6, 42(sp)
lw t7, 3(sp)
xor t5, t6, t7
or.1 t2, t2, t4
li t7, -4827069
mul t1, t1, t7
li t7, -120023839
and.1 a7, a7, t7, 13
li t7, -166619308
mul t6, t5, t7
sw t6, 87(sp)
lw t6, 108(sp)
li t7, -120023839
and.1 t6, t6, t7, 13
sw t6, 147(sp)
lw t6, 72(sp)
li t7, -120023839
xor t6, t6, t7
sw t6, 51(sp)
or.T a6, t2, a6
li t7, 143665765
mul t2, t3, t7
add t2, t2, t1
lw t6, 168(sp)
li t7, -1060469
mul t6, t6, t7
sw t6, 81(sp)
lw t6, 27(sp)
lw t7, 51(sp)
xor.T t1, t6, t7
lw t6, 45(sp)
lw t7, 129(sp)
xor.1 t3, t6, t7
xor a6, a6, t0
lw t6, 108(sp)
lw t7, 108(sp)
xor t6, t6, t7
sw t6, 0(sp)
slli t0, a6, 4
lw t6, 3(sp)
lw t7, 48(sp)
xor.T a6, t6, t7
lw t6, 108(sp)
lw t7, 123(sp)
and t4, t6, t7, 13
add t0, t0, t2
lw t6, 72(sp)
lw t7, 108(sp)
and t6, t6, t7, 13
sw t6, 93(sp)
and.1 t2, a3, t4, 13
lw t6, 144(sp)
and.T a3, t6, t3, -13
lw t6, 108(sp)
li t7, -120023839
or.1 t6, t6, t7
sw t6, 30(sp)
lw t6, 108(sp)
lw t7, 72(sp)
xor.1 t6, t6, t7
sw t6, 159(sp)
lw t6, 159(sp)
lw t7, 129(sp)
and t6, t6, t7, 13
sw t6, 33(sp)
lw t6, 3(sp)
lw t7, 108(sp)
xor.1 t3, t6, t7
lw t7, 30(sp)
or.T t3, t3, t7
xor.1 a3, a7, a3
xor.1 a3, a3, a5
and.T a5, a3, t1, -13
lw t6, 123(sp)
lw t7, 108(sp)
or.T a3, t6, t7
li t7, -65299328
mul a5, a5, t7
lw t6, 93(sp)
lw t7, 123(sp)
and.T t1, t6, t7, -13
lw t6, 0(sp)
or.T a7, t6, t3
add a4, a4, a5
lw t6, 108(sp)
li t7, -120023839
xor t6, t6, t7
sw t6, 6(sp)
lw t6, 84(sp)
and.T a5, t6, t2, -13
li t7, -8395563
mul t2, a5, t7
lw t7, 45(sp)
or.1 a5, a3, t7
lw t6, 108(sp)
lw t7, 123(sp)
and.1 t6, t6, t7, 13
sw t6, 189(sp)
and a6, t1, a6, 13
lw t7, 102(sp)
add a4, a4, t7
add a4, t0, a4
add t3, a4, t2
li t7, -133472441
mul t2, a6, t7
lw t6, 171(sp)
li t7, 170857351
mul a6, t6, t7
lw t6, 147(sp)
li t7, -120023839
and.T a4, t6, t7, -13
lw t6, 123(sp)
li t7, -120023839
and.T t6, t6, t7, -13
sw t6, 84(sp)
li t7, -58873960
mul t0, a7, t7
lw t6, 96(sp)
lw t7, 21(sp)
or t1, t6, t7, -13
lw t6, 12(sp)
add a7, t6, t3
lw t6, 165(sp)
add t6, t6, a7
sw t6, 102(sp)
lw t6, 87(sp)
add a7, t6, t2
lw t6, 123(sp)
li t7, -120023839
xor.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 174(sp)
lw t7, 84(sp)
or t2, t6, t7, -13
lw t6, 120(sp)
andi t3, t6, 0
lw t6, 3(sp)
or.1 t5, t6, a5
lw t6, 6(sp)
lw t7, 108(sp)
xor a5, t6, t7
lw t7, 9(sp)
xor t4, t2, t7
li t7, -192042839
mul t2, t3, t7
lw t6, 36(sp)
lw t7, 156(sp)
xor.T t3, t6, t7
lw t7, 30(sp)
and s0, a5, t7, 13
li t7, -120023839
and.1 t4, t4, t7, 13
lw t6, 30(sp)
li t7, -120023839
and.T s1, t6, t7, -13
lw t6, 231(sp)
and a5, t6, a3, 13
xor.1 t1, t5, t1
lw t6, 33(sp)
or t5, t6, s1, -13
lw t7, 105(sp)
or t5, t5, t7, -13
li t7, 131630068
mul s2, t5, t7
lw t6, 81(sp)
add s1, t6, t0
or t3, t3, s0, -13
lw t6, 186(sp)
lw t7, 120(sp)
xor.T t5, t6, t7
li t7, -139093056
mul t0, t4, t7
add t4, t2, t0
lw t6, 177(sp)
lw t7, 108(sp)
xor.1 t0, t6, t7
add t2, s2, a6
lw t6, 123(sp)
li t7, -120023839
xor t6, t6, t7
sw t6, 33(sp)
add a6, s1, t4
add a7, a7, a6
lw t7, 33(sp)
xor a6, a4, t7
lw t7, 6(sp)
or.1 a4, t5, t7
and.1 t3, t3, t1, 13
lw t6, 180(sp)
li t7, -120023839
xor.T t1, t6, t7
add t6, a7, t2
sw t6, 21(sp)
li t7, -73358685
mul t2, t3, t7
lw t6, 15(sp)
li t7, -182867388
mul a7, t6, t7
or.1 a3, a3, a4
li t7, -141146391
mul a4, a3, t7
lw t6, 117(sp)
or.T a3, t6, t1
add t1, a4, t2
lw t6, 57(sp)
lw t7, 87(sp)
and.1 t2, t6, t7, 13
lw t6, 156(sp)
lw t7, 171(sp)
xor.1 t3, t6, t7
lw t6, 39(sp)
slli a4, t6, 5
lw t6, 72(sp)
lw t7, 177(sp)
xor.T t4, t6, t7
lw t7, 54(sp)
xor.T t2, t2, t7
lw t6, 99(sp)
and t0, t6, t0, 13
or t3, t4, t3, -13
xor.T t4, t3, a5
lw t6, 54(sp)
lw t7, 171(sp)
xor t3, t6, t7
lw t6, 33(sp)
lw t7, 108(sp)
and.T a5, t6, t7, -13
or a5, a5, t0, -13
li t7, 100399934
mul t0, t4, t7
add t6, t1, t0
sw t6, 105(sp)
and.T t3, t2, t3, -13
lw t6, 108(sp)
lw t7, 144(sp)
xor.T t0, t6, t7
lw t7, 171(sp)
or.T t0, t0, t7
li t7, -35133791
mul t2, a3, t7
li t7, 145804361
mul a6, a6, t7
lw t6, 189(sp)
lw t7, 93(sp)
and.1 t1, t6, t7, 13
xor t3, t3, a5
lw t6, 123(sp)
li t7, 4503171
mul a3, t6, t7
lw t6, 159(sp)
lw t7, 42(sp)
xor.T a5, t6, t7
li t7, 140846326
mul t0, t0, t7
add t2, a7, t2
lw t6, 72(sp)
lw t7, 54(sp)
xor.1 a7, t6, t7
lw t6, 132(sp)
lw t7, 6(sp)
xor t4, t6, t7
li t7, 137042972
mul t3, t3, t7
or.1 t1, t4, t1
add t3, t3, t2
lw t6, 72(sp)
and.1 t1, t6, t1, 13
lw t6, 90(sp)
lw t7, 39(sp)
xor.1 t4, t6, t7
lw t6, 108(sp)
lw t7, 159(sp)
xor.1 t2, t6, t7
add t3, t3, a6
lw t6, 150(sp)
li t7, 13153330
mul a6, t6, t7
lw t6, 72(sp)
lw t7, 108(sp)
or t6, t6, t7, -13
sw t6, 12(sp)
add a4, a4, t0
li t7, -120023839
or.1 t4, t4, t7
li t7, -79479685
mul t0, t1, t7
or.1 a7, a7, t2
add t1, t3, t0
li t7, 170852598
mul a7, a7, t7
lw t6, 3(sp)
lw t7, 177(sp)
or t0, t6, t7, -13
li t7, 63008688
mul t2, t4, t7
lw t6, 72(sp)
li t7, 11793284
mul t3, t6, t7
add t4, a4, t2
lw t6, 150(sp)
lw t7, 57(sp)
xor.T t5, t6, t7
add t2, a7, a6
lw t6, 84(sp)
li t7, -125228127
mul a4, t6, t7
li t7, 127974820
mul a7, t5, t7
lw t6, 3(sp)
xor.1 a6, t6, t0
li t7, -49211077
mul t0, a6, t7
lw t6, 45(sp)
lw t7, 27(sp)
xor.T a6, t6, t7
lw t6, 45(sp)
li t7, -120023839
or t5, t6, t7, -13
and a5, t5, a5, 13
add a3, a3, t3
add a3, t4, a3
add t1, t1, a3
lw t6, 72(sp)
lw t7, 108(sp)
and.T a3, t6, t7, -13
add t2, t1, t2
li t7, 67147058
mul a5, a5, t7
lw t6, 18(sp)
li t7, 86644827
mul s0, t6, t7
lw t6, 72(sp)
li t7, -120023839
or t6, t6, t7, -13
sw t6, 81(sp)
lw t6, 9(sp)
lw t7, 51(sp)
xor.T t5, t6, t7
lw t6, 168(sp)
slli t1, t6, 5
lw t6, 105(sp)
add s1, t6, t2
lw t6, 189(sp)
lw t7, 144(sp)
or t3, t6, t7, -13
lw t6, 129(sp)
li t7, -67932259
mul t2, t6, t7
lw t6, 81(sp)
lw t7, 180(sp)
and t4, t6, t7, 13
lw t6, 168(sp)
lw t7, 6(sp)
or s2, t6, t7, -13
lw t6, 189(sp)
lw t7, 132(sp)
xor.T s3, t6, t7
add s0, a7, s0
lw t6, 99(sp)
lw t7, 30(sp)
or.1 a7, t6, t7
add t0, t0, s0
li t7, 72498908
mul t5, t5, t7
add t6, s1, t0
sw t6, 6(sp)
add a4, t5, a4
lw t7, 87(sp)
and t0, s2, t7, 13
or a6, s3, a6, -13
add a5, a5, a4
li t7, -150778197
mul a6, a6, t7
lw t6, 72(sp)
or a3, t6, a3, -13
lw t7, 162(sp)
or a4, t3, t7, -13
add t1, t1, a6
li t7, 102881406
mul a6, t4, t7
add a6, t2, a6
li t7, -68061611
mul t2, a4, t7
lw t6, 42(sp)
lw t7, 96(sp)
xor.1 a4, t6, t7
lw t6, 45(sp)
lw t7, 18(sp)
or.T t3, t6, t7
and.1 a4, a7, a4, 13
lw t6, 180(sp)
lw t7, 138(sp)
or.T a7, t6, t7
and.1 t3, t3, a3, 13
add a3, t2, t1
and.T t0, t0, t3, -13
li t7, 189252513
mul t0, t0, t7
add a6, a6, t0
add a3, a5, a3
lw t6, 108(sp)
lw t7, 84(sp)
xor.T t0, t6, t7
lw t6, 150(sp)
lw t7, 27(sp)
and.T t1, t6, t7, -13
lw t6, 147(sp)
lw t7, 132(sp)
xor t2, t6, t7
lw t6, 99(sp)
li t7, -186401675
mul a5, t6, t7
li t7, -120023839
and.1 t2, t2, t7, 13
li t7, -120023839
and t1, t1, t7, 13
lw t7, 141(sp)
or.T t3, t0, t7
li t7, 58252171
mul t0, t2, t7
or.T t2, a7, t3
lw t6, 180(sp)
lw t7, 135(sp)
or a7, t6, t7, -13
lw t6, 174(sp)
li t7, 121961006
mul t6, t6, t7
sw t6, 9(sp)
and a4, t1, a4, 13
lw t6, 159(sp)
lw t7, 45(sp)
xor.1 t3, t6, t7
li t7, 45180216
mul t1, t2, t7
li t7, 53364
mul a4, a4, t7
add a4, a6, a4
li t7, -28653611
mul a6, t3, t7
lw t6, 18(sp)
lw t7, 33(sp)
or.1 t3, t6, t7
lw t7, 87(sp)
or.1 a7, a7, t7
li t7, 114397600
mul t2, a7, t7
add a5, t1, a5
lw t6, 36(sp)
xor.T a7, t6, t3
add a5, t0, a5
add a6, a6, a5
lw t6, 123(sp)
lw t7, 0(sp)
and a5, t6, t7, 13
add a6, a6, t2
add a3, a3, a4
add a4, a3, a6
lw t6, 108(sp)
xor.1 a3, t6, a7
li t7, 174413577
mul a6, a3, t7
lw t6, 93(sp)
lw t7, 45(sp)
or.T a3, t6, t7
lw t6, 6(sp)
add t6, t6, a4
sw t6, 6(sp)
li t7, -160125475
mul a4, a5, t7
add t6, a6, a4
sw t6, 18(sp)
lw t6, 72(sp)
lw t7, 39(sp)
or.T a4, t6, t7
lw t6, 180(sp)
lw t7, 57(sp)
and.T a5, t6, t7, -13
lw t7, 27(sp)
or a4, a4, t7, -13
or a6, a4, a5, -13
lw t6, 168(sp)
lw t7, 147(sp)
xor.T a4, t6, t7
lw t6, 123(sp)
lw t7, 57(sp)
xor.T a5, t6, t7
or.T a3, a3, a6
li t7, 9429331
mul a6, a3, t7
lw t6, 72(sp)
lw t7, 189(sp)
xor.T a7, t6, t7
lw t6, 87(sp)
xor.1 t0, t6, a4
lw t6, 60(sp)
li t7, -115871080
mul a4, t6, t7
lw t6, 150(sp)
li t7, 34828043
mul a3, t6, t7
lw t6, 84(sp)
and t2, t6, a7, 13
li t7, -16904926
mul a7, a5, t7
lw t6, 123(sp)
lw t7, 27(sp)
and.1 t1, t6, t7, 13
lw t6, 0(sp)
lw t7, 15(sp)
or.1 a5, t6, t7
xor.T t0, t0, t2
li t7, 61776874
mul t0, t0, t7
add a6, a6, t0
li t7, 116404073
mul t1, t1, t7
lw t6, 9(sp)
add a6, t6, a6
lw t6, 36(sp)
lw t7, 180(sp)
and.T t0, t6, t7, -13
lw t6, 12(sp)
lw t7, 162(sp)
xor.T t2, t6, t7
lw t7, 84(sp)
xor.T t0, t0, t7
lw t6, 108(sp)
and.1 t2, t6, t2, 13
li t7, -45891515
mul t2, t2, t7
li t7, 25525656
add t2, t2, t7
add a7, a7, t1
add a4, a4, a7
add a7, a4, t2
lw t6, 186(sp)
lw t7, 126(sp)
or.T a4, t6, t7
lw t6, 3(sp)
lw t7, 138(sp)
and.1 t2, t6, t7, 13
lw t6, 3(sp)
or t1, t6, t0, -13
and t0, t2, a5, 13
add a7, a7, a3
li t7, -24532137
mul a3, t1, t7
lw t6, 33(sp)
li t7, -162421575
mul a5, t6, t7
add a7, a6, a7
li t7, 105941037
mul t1, t0, t7
lw t6, 186(sp)
li t7, -158081853
mul a6, t6, t7
lw t6, 162(sp)
lw t7, 42(sp)
xor.1 t0, t6, t7
add a3, a3, t1
lw t6, 60(sp)
lw t7, 51(sp)
and.T t1, t6, t7, -13
add a3, a7, a3
lw t6, 18(sp)
add a3, t6, a3
lw t6, 108(sp)
lw t7, 138(sp)
xor.T a7, t6, t7
or.T a4, a4, a7
lw t6, 222(sp)
li t7, 101385891
mul a7, t6, t7
li t7, -76266173
mul a4, a4, t7
and.1 t0, t0, t1, 13
add a4, a4, a5
lw t6, 36(sp)
lw t7, 63(sp)
xor.T a5, t6, t7
add a4, a6, a4
lw t6, 48(sp)
lw t7, 177(sp)
or t2, t6, t7, -13
li t7, -149070013
mul t1, t0, t7
lw t6, 147(sp)
li t7, 70617634
mul a6, t6, t7
lw t6, 39(sp)
lw t7, 177(sp)
and.1 t0, t6, t7, 13
lw t6, 108(sp)
andi t3, t6, 0
or t2, t3, t2, -13
or.T t0, a5, t0
add a5, t1, a7
lw t6, 156(sp)
lw t7, 84(sp)
xor.1 t3, t6, t7
lw t6, 42(sp)
lw t7, 186(sp)
xor t1, t6, t7
lw t6, 57(sp)
lw t7, 177(sp)
or a7, t6, t7, -13
lw t7, 186(sp)
or.T t2, t2, t7
lw t6, 147(sp)
xor t2, t6, t2
li t7, -96035034
mul t2, t2, t7
xor.T t3, t0, t3
add t0, t2, a6
li t7, 150840653
mul t2, t3, t7
lw t7, 222(sp)
xor.1 a6, t1, t7
lw t6, 54(sp)
li t7, -76392801
mul t1, t6, t7
li t7, 174814463
mul a7, a7, t7
li t7, -105418358
mul a6, a6, t7
add a6, a6, t1
add a7, t2, a7
add t0, t0, a7
lw t6, 15(sp)
li t7, 71384745
mul a7, t6, t7
add a5, a5, t0
add a4, a4, a5
add a3, a3, a4
lw t6, 6(sp)
add a3, t6, a3
lw t6, 138(sp)
lw t7, 81(sp)
and.T t0, t6, t7, -13
lw t6, 36(sp)
lw t7, 159(sp)
xor.T t1, t6, t7
add a4, a6, a7
lw t6, 72(sp)
lw t7, 3(sp)
or a5, t6, t7, -13
lw t6, 45(sp)
lw t7, 81(sp)
xor.T a6, t6, t7
or a7, t1, t0, -13
lw t6, 138(sp)
lw t7, 12(sp)
xor.1 t0, t6, t7
li t7, -120023839
or.1 t0, t0, t7
or.T a7, t0, a7
lw t6, 129(sp)
lw t7, 132(sp)
or.T t0, t6, t7
li t7, 60055776
mul a7, a7, t7
lw t6, 141(sp)
xor.1 t1, t6, a5
li t7, 67165046
mul a6, a6, t7
lw t6, 177(sp)
lw t7, 81(sp)
xor a5, t6, t7
lw t6, 30(sp)
and.T t0, t6, t0, -13
li t7, -177410814
mul t1, t1, t7
lw t6, 75(sp)
li t7, -177988762
xor t6, t6, t7
sw t6, 45(sp)
add a6, t1, a6
add a6, a7, a6
lw t6, 177(sp)
lw t7, 174(sp)
and.T a7, t6, t7, -13
lw t7, 33(sp)
xor.T a7, a7, t7
or.T a7, t0, a7
li t7, 125493087
mul a7, a7, t7
lw t6, 75(sp)
li t7, -177988762
xor.T t6, t6, t7
sw t6, 108(sp)
lw t6, 57(sp)
lw t7, 156(sp)
xor.1 t0, t6, t7
li t7, 180481295
mul t0, t0, t7
lw t6, 75(sp)
li t7, -177988762
and t6, t6, t7, 13
sw t6, 18(sp)
add a7, a7, t0
lw t6, 75(sp)
li t7, -177988762
and.1 t6, t6, t7, 13
sw t6, 51(sp)
lw t6, 75(sp)
li t7, -177988762
or.T t6, t6, t7
sw t6, 117(sp)
lw t6, 183(sp)
and a5, t6, a5, 13
lw t6, 75(sp)
li t7, -177988762
or t6, t6, t7, -13
sw t6, 144(sp)
li t7, 164279929
mul a5, a5, t7
add a5, a6, a5
add a5, a5, a7
lw t6, 108(sp)
li t7, -180645259
mul t6, t6, t7
sw t6, 12(sp)
add a4, a4, a5
add a3, a3, a4
lw t6, 75(sp)
li t7, 183570692
mul t6, t6, t7
sw t6, 81(sp)
lw t6, 21(sp)
add a3, t6, a3
lw t6, 102(sp)
add a3, t6, a3
lw t6, 75(sp)
li t7, -177988762
and.T t6, t6, t7, -13
sw t6, 147(sp)
lw t6, 144(sp)
lw t7, 45(sp)
xor t6, t6, t7
sw t6, 6(sp)
lw t6, 153(sp)
add t6, t6, a3
sw t6, 30(sp)
lw t6, 114(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 162(sp)
lw t6, 114(sp)
lw t7, 30(sp)
and.T t6, t6, t7, -13
sw t6, 72(sp)
lw t6, 30(sp)
lw t7, 114(sp)
xor.T t6, t6, t7
sw t6, 159(sp)
lw t6, 24(sp)
lw t7, 30(sp)
xor a3, t6, t7
lw t6, 114(sp)
lw t7, 30(sp)
xor.1 t6, t6, t7
sw t6, 105(sp)
lw t6, 114(sp)
lw t7, 30(sp)
xor t6, t6, t7
sw t6, 132(sp)
lw t6, 75(sp)
li t7, -177988762
or.1 t6, t6, t7
sw t6, 15(sp)
lw t6, 114(sp)
lw t7, 30(sp)
or.T t6, t6, t7
sw t6, 150(sp)
lw t6, 30(sp)
lw t7, 30(sp)
xor t6, t6, t7
sw t6, 126(sp)
lw t6, 114(sp)
lw t7, 30(sp)
or.1 t6, t6, t7
sw t6, 27(sp)
lw t6, 75(sp)
li t7, 177988762
xor t6, t6, t7
sw t6, 87(sp)
lw t6, 231(sp)
li t7, -177988762
xor.1 t6, t6, t7
sw t6, 42(sp)
lw t6, 69(sp)
xor a3, t6, a3
xor t6, a3, a3
sw t6, 60(sp)
li t7, -177988762
and.T t6, a3, t7, -13
sw t6, 54(sp)
li t7, -99491393
or.T a4, a3, t7
lw t6, 30(sp)
lw t7, 114(sp)
and.1 t6, t6, t7, 13
sw t6, 120(sp)
li t7, -99491393
xor t6, a3, t7
sw t6, 165(sp)
lw t7, 60(sp)
and.1 t6, a4, t7, 13
sw t6, 0(sp)
lw t7, 75(sp)
xor.T t6, a3, t7
sw t6, 153(sp)
lw t7, 75(sp)
and.1 t6, a3, t7, 13
sw t6, 90(sp)
lw t6, 90(sp)
lw t7, 45(sp)
or.T a4, t6, t7
li t7, -177988762
or.T t6, a3, t7
sw t6, 3(sp)
li t7, -177988762
xor.T t6, a3, t7
sw t6, 156(sp)
lw t7, 156(sp)
and.1 a6, a3, t7, 13
lw t6, 108(sp)
or.T a4, t6, a4
li t7, -48434250
mul a5, a4, t7
lw t6, 75(sp)
lw t7, 54(sp)
xor.1 a4, t6, t7
li t7, -103382365
mul a6, a6, t7
lw t7, 231(sp)
or a4, a4, t7, -13
li t7, -27881710
mul a4, a4, t7
lw t7, 75(sp)
and.T t6, a3, t7, -13
sw t6, 21(sp)
add a6, a6, a5
lw t6, 54(sp)
lw t7, 153(sp)
or.T a5, t6, t7
li t7, -177988762
and t6, a3, t7, 13
sw t6, 36(sp)
li t7, -177988762
or.1 t6, a3, t7
sw t6, 129(sp)
lw t6, 18(sp)
lw t7, 36(sp)
and.1 t0, t6, t7, 13
lw t6, 75(sp)
lw t7, 129(sp)
or a7, t6, t7, -13
add t6, a6, a4
sw t6, 39(sp)
lw t6, 90(sp)
or a4, t6, t0, -13
lw t7, 51(sp)
and.1 a5, a5, t7, 13
li t7, 24316845
mul t6, a7, t7
sw t6, 93(sp)
lw t6, 21(sp)
li t7, 130965555
mul t0, t6, t7
li t7, -115711785
mul a7, a5, t7
lw t6, 3(sp)
slli t6, t6, 8
sw t6, 9(sp)
lw t6, 36(sp)
xor.1 t1, t6, a3
lw t7, 75(sp)
xor.1 t6, a3, t7
sw t6, 84(sp)
lw t6, 21(sp)
xor.1 t6, t6, a3
sw t6, 57(sp)
lw t6, 6(sp)
lw t7, 57(sp)
or.T t3, t6, t7
lw t6, 3(sp)
and.T a4, t6, a4, -13
lw t6, 51(sp)
xor.1 a6, t6, a3
li t7, 188286897
mul a4, a4, t7
lw t6, 84(sp)
li t7, 177988762
xor.T t2, t6, t7
li t7, -177988762
and.1 a5, a3, t7, 13
li t7, -75662096
mul a6, a6, t7
lw t6, 75(sp)
lw t7, 60(sp)
xor t4, t6, t7
li t7, 104250554
mul t3, t3, t7
add t5, t0, t3
lw t6, 21(sp)
or.1 t6, t6, a3
sw t6, 33(sp)
lw t7, 231(sp)
or t0, a3, t7, -13
lw t6, 51(sp)
xor s0, t6, a5
li t7, 76948524
mul t3, t1, t7
add t5, a7, t5
li t7, -22295165
mul t1, t2, t7
lw t7, 75(sp)
or.1 t6, a3, t7
sw t6, 6(sp)
xor.1 t2, t4, s0
lw t7, 75(sp)
or.T t6, a3, t7
sw t6, 99(sp)
li t7, -177988762
xor.1 t6, a3, t7
sw t6, 141(sp)
lw t6, 84(sp)
li t7, -158531732
mul t4, t6, t7
lw t6, 33(sp)
li t7, -73030727
mul a7, t6, t7
lw t6, 21(sp)
lw t7, 153(sp)
or s4, t6, t7, -13
lw t6, 141(sp)
and.1 s1, t6, a3, 13
li t7, -74403652
add t3, t3, t7
lw t7, 12(sp)
add s0, t5, t7
lw t6, 75(sp)
or t6, t6, a3, -13
sw t6, 48(sp)
add s2, t1, t3
li t7, -94362141
mul s3, t0, t7
lw t7, 108(sp)
xor t5, s4, t7
lw t6, 48(sp)
or.T t3, t6, a5
lw t6, 90(sp)
lw t7, 231(sp)
or t1, t6, t7, -13
li t7, 131661139
mul s4, t2, t7
li t7, 84000116
mul t2, s1, t7
lw t6, 99(sp)
lw t7, 45(sp)
or.T t0, t6, t7
xor.1 t3, t3, a3
add s0, s0, s2
add t4, s3, t4
add s0, a4, s0
lw t6, 84(sp)
li t7, -177988762
xor t6, t6, t7
sw t6, 96(sp)
lw t6, 9(sp)
add a4, t6, s4
add a6, a6, a4
lw t6, 99(sp)
lw t7, 144(sp)
xor a4, t6, t7
li t7, -177988762
or t6, a3, t7, -13
sw t6, 63(sp)
lw t7, 108(sp)
and.T s1, t5, t7, -13
lw t6, 36(sp)
lw t7, 141(sp)
xor.T t6, t6, t7
sw t6, 135(sp)
lw t6, 135(sp)
li t7, -177988762
or.1 t6, t6, t7
sw t6, 9(sp)
lw t6, 0(sp)
li t7, 60741299
mul t6, t6, t7
sw t6, 102(sp)
lw t6, 93(sp)
add t5, t6, s0
lw t6, 39(sp)
add s0, t6, t5
add a6, a6, t4
lw t6, 108(sp)
and t5, t6, a3, 13
add a6, s0, a6
li t7, 7242347
mul s0, s1, t7
lw t6, 117(sp)
xor t4, t6, a4
add t6, a6, t2
sw t6, 138(sp)
add a7, a7, s0
li t7, 51210227
mul t2, t3, t7
li t7, 21799980
mul a4, t1, t7
lw t6, 84(sp)
li t7, 82302103
mul a6, t6, t7
add t2, a7, t2
lw t7, 129(sp)
or t3, t5, t7, -13
lw t6, 60(sp)
lw t7, 144(sp)
and t1, t6, t7, 13
lw t6, 75(sp)
lw t7, 96(sp)
and.T a7, t6, t7, -13
lw t6, 57(sp)
li t7, -161455408
mul t6, t6, t7
sw t6, 39(sp)
and t4, t0, t4, 13
li t7, -149247556
mul t0, a7, t7
li t7, -121597954
mul t4, t4, t7
lw t6, 141(sp)
lw t7, 60(sp)
and.1 a7, t6, t7, 13
add t0, t4, t0
add a4, t0, a4
add t6, t2, a4
sw t6, 12(sp)
li t7, -103080637
mul t0, t3, t7
li t7, -177988762
xor a4, a3, t7
li t7, 26218022
mul t4, a4, t7
add a6, a6, t0
li t7, -130524244
mul t2, a5, t7
lw t6, 75(sp)
and t6, t6, a3, 13
sw t6, 57(sp)
lw t6, 129(sp)
lw t7, 90(sp)
or.T t3, t6, t7
lw t6, 129(sp)
and t6, t6, a4, 13
sw t6, 0(sp)
lw t7, 75(sp)
and t0, t1, t7, 13
lw t6, 84(sp)
li t7, -177988762
and.T t1, t6, t7, -13
li t7, -26771183
mul s1, a5, t7
li t7, -187289996
mul s0, t0, t7
li t7, 176103412
mul t0, a3, t7
lw t6, 3(sp)
or t5, t6, a3, -13
lw t7, 6(sp)
or s2, t1, t7, -13
add t1, t2, s1
or.1 t2, s2, t3
li t7, -17689460
mul t6, a3, t7
sw t6, 123(sp)
lw t6, 84(sp)
li t7, -177988762
or.1 s1, t6, t7
lw t7, 231(sp)
and t3, a3, t7, 13
li t7, -8718830
mul t2, t2, t7
add t4, s0, t4
lw t7, 3(sp)
or.T s3, a4, t7
lw t6, 42(sp)
li t7, -51947260
mul s0, t6, t7
lw t6, 9(sp)
lw t7, 75(sp)
xor s2, t6, t7
xor.T s4, t5, a7
li t7, -10996619
mul a7, s1, t7
lw t6, 147(sp)
lw t7, 84(sp)
or.T t5, t6, t7
lw t6, 153(sp)
or s1, t6, a3, -13
lw t7, 81(sp)
add a7, a7, t7
li t7, 75551978
mul s5, s2, t7
li t7, -177120079
mul s2, s4, t7
li t7, -78863749
mul t6, s3, t7
sw t6, 9(sp)
lw t6, 63(sp)
li t7, -95905301
mul t6, t6, t7
sw t6, 93(sp)
lw t6, 102(sp)
add s3, t6, s5
add s0, s0, t0
add t0, a6, t4
add t4, t1, s3
lw t6, 36(sp)
lw t7, 156(sp)
xor.T a6, t6, t7
or.1 t3, t3, t5
lw t6, 129(sp)
or t1, t6, s1, -13
add t5, t2, s0
li t7, -140179920
mul t2, t3, t7
add s0, t5, s2
lw t6, 153(sp)
lw t7, 231(sp)
or t3, t6, t7, -13
lw t6, 39(sp)
add t5, t6, t2
add t2, t4, s0
li t7, 169390092
mul t4, a3, t7
lw t6, 12(sp)
add s0, t6, t0
add t6, t5, t4
sw t6, 102(sp)
lw t6, 36(sp)
lw t7, 18(sp)
xor t0, t6, t7
lw t6, 141(sp)
and t5, t6, a4, 13
xor.1 t4, t3, t1
li t7, 165732307
mul t1, t0, t7
lw t6, 153(sp)
li t7, -179958236
mul t0, t6, t7
lw t6, 0(sp)
li t7, 183120828
mul t3, t6, t7
add a7, s0, a7
li t7, -155779080
mul t6, a6, t7
sw t6, 81(sp)
add t6, a7, t2
sw t6, 42(sp)
lw t6, 123(sp)
add t6, t6, t1
sw t6, 12(sp)
li t7, -51756456
mul t1, t5, t7
lw t6, 99(sp)
lw t7, 75(sp)
or a7, t6, t7, -13
li t7, 41587575
mul a6, t4, t7
li t7, -140262563
mul a7, a7, t7
lw t6, 6(sp)
li t7, 87898058
mul t4, t6, t7
lw t6, 75(sp)
xor t6, t6, a3
sw t6, 39(sp)
lw t6, 75(sp)
li t7, -51154167
mul t2, t6, t7
lw t6, 6(sp)
or.T s0, t6, a3
lw t6, 39(sp)
li t7, -177988762
xor.T t5, t6, t7
add t4, t3, t4
lw t7, 99(sp)
xor.T t5, t5, t7
lw t6, 84(sp)
lw t7, 135(sp)
or.T t3, t6, t7
li t7, 31210334
mul t5, t5, t7
xor.1 s2, a3, a5
lw t7, 6(sp)
xor s1, a5, t7
li t7, -118223082
mul s2, s2, t7
lw t7, 75(sp)
xor s3, a5, t7
lw t6, 6(sp)
xor s3, t6, s3
lw t7, 108(sp)
or.T s4, s0, t7
lw t6, 54(sp)
lw t7, 15(sp)
xor.T s0, t6, t7
li t7, 139998293
mul t3, t3, t7
li t7, 73432813
mul s3, s3, t7
li t7, -86470477
mul s4, s4, t7
add t0, t0, s4
add t0, t0, t1
li t7, -150052445
mul t1, s1, t7
add t4, s2, t4
add t1, t2, t1
add t2, t5, s3
add t2, t0, t2
or.T t0, a4, a3
lw t6, 39(sp)
and t6, t6, a3, 13
sw t6, 0(sp)
lw t6, 117(sp)
lw t7, 0(sp)
and.1 t5, t6, t7, 13
add t1, a7, t1
lw t7, 153(sp)
or.T a7, s0, t7
li t7, -53815688
mul t5, t5, t7
add a6, a6, t4
lw t7, 90(sp)
xor t4, a3, t7
lw t6, 9(sp)
add a6, t6, a6
add t3, t3, t5
lw t7, 99(sp)
or t4, t4, t7, -13
xor.1 t4, a7, t4
add t2, t2, t3
and.T t3, a4, a3, -13
lw t6, 144(sp)
lw t7, 141(sp)
xor a7, t6, t7
lw t6, 93(sp)
add t6, t6, t2
sw t6, 9(sp)
lw t7, 81(sp)
add t2, a6, t7
li t7, -63861064
mul a6, t4, t7
lw t6, 12(sp)
add t2, t6, t2
lw t6, 102(sp)
add t4, t6, t2
lw t6, 60(sp)
lw t7, 3(sp)
xor t5, t6, t7
li t7, -116532390
mul t2, t0, t7
add a6, t1, a6
lw t6, 42(sp)
add t1, t6, t4
xor t0, a5, a3
lw t6, 138(sp)
add t6, t6, t1
sw t6, 81(sp)
lw t6, 6(sp)
li t7, 9464261
mul t4, t6, t7
li t7, -49487307
mul t1, t5, t7
lw t6, 3(sp)
slli t6, t6, 3
sw t6, 42(sp)
lw t6, 90(sp)
lw t7, 144(sp)
or.1 s0, t6, t7
lw t6, 129(sp)
lw t7, 48(sp)
xor t5, t6, t7
andi s1, a5, 0
li t7, 8034588
mul a5, t3, t7
lw t6, 45(sp)
xor s2, t6, a3
lw t6, 153(sp)
lw t7, 48(sp)
xor.1 t6, t6, t7
sw t6, 12(sp)
add t3, a5, t1
lw t6, 6(sp)
lw t7, 117(sp)
or.T a5, t6, t7
li t7, -115150590
mul t1, s2, t7
or.1 s1, s1, a4
and s1, s0, s1, 13
li t7, -140629096
mul s0, a7, t7
li t7, 192415180
mul a7, s1, t7
add s1, t2, a7
li t7, 44347193
mul t2, t5, t7
lw t7, 129(sp)
xor a7, a3, t7
add t3, t4, t3
lw t6, 90(sp)
lw t7, 51(sp)
or t4, t6, t7, -13
and t4, t0, t4, 13
add t0, s1, t3
lw t6, 99(sp)
lw t7, 87(sp)
and.T t3, t6, t7, -13
add t2, t2, s0
or t4, t4, a4, -13
li t7, 140798185
mul t4, t4, t7
add a6, a6, t0
li t7, 162469265
mul t3, t3, t7
add t4, t2, t4
lw t6, 99(sp)
lw t7, 36(sp)
or.1 t0, t6, t7
lw t6, 51(sp)
li t7, -177988762
xor.T t2, t6, t7
add t3, t4, t3
add t3, t1, t3
lw t6, 36(sp)
lw t7, 48(sp)
xor.1 t4, t6, t7
lw t6, 57(sp)
xor.T t1, t6, t0
add t0, a6, t3
lw t7, 129(sp)
or.T t3, t4, t7
lw t6, 57(sp)
li t7, -177988762
xor a6, t6, t7
xor t2, t2, t3
or t1, t2, t1, -13
li t7, 104209942
mul t2, t1, t7
li t7, 154870813
mul a7, a7, t7
lw t6, 84(sp)
lw t7, 15(sp)
and.T t1, t6, t7, -13
or.T t3, t1, a3
li t7, -177988762
and t1, a5, t7, 13
lw t6, 144(sp)
and t4, t6, a3, 13
lw t6, 129(sp)
and.T a5, t6, a6, -13
lw t6, 153(sp)
lw t7, 117(sp)
or a6, t6, t7, -13
slli t5, t3, 3
lw t6, 54(sp)
or t3, t6, t4, -13
lw t6, 144(sp)
lw t7, 12(sp)
xor t4, t6, t7
li t7, -31005669
mul t4, t4, t7
add t4, t5, t4
li t7, 7099930
mul t1, t1, t7
add a7, a7, t4
lw t6, 141(sp)
lw t7, 99(sp)
or.T t5, t6, t7
add a7, t2, a7
lw t6, 6(sp)
li t7, 149455055
mul t2, t6, t7
add t4, t0, a7
li t7, -11712352
mul t0, t3, t7
lw t6, 96(sp)
slli a7, t6, 5
lw t6, 0(sp)
and.T t3, t6, t5, -13
li t7, -154514732
mul t3, t3, t7
add t2, t3, t2
lw t7, 42(sp)
add t2, t2, t7
li t7, -104945627
mul a5, a5, t7
lw t6, 9(sp)
add t6, t6, t4
sw t6, 6(sp)
lw t6, 18(sp)
lw t7, 90(sp)
xor t4, t6, t7
add t3, t0, a5
lw t6, 63(sp)
xor a5, t6, t4
li t7, 170851769
mul t0, a3, t7
add t3, t1, t3
lw t6, 3(sp)
lw t7, 60(sp)
xor.1 t1, t6, t7
li t7, 114443498
mul t4, t1, t7
and.1 t5, a4, a3, 13
lw t6, 135(sp)
li t7, 123797679
mul t1, t6, t7
add t6, t3, t2
sw t6, 0(sp)
li t7, 177929469
mul a5, a5, t7
add a5, t4, a5
or.1 t3, a6, t5
lw t6, 144(sp)
li t7, -177988762
and.1 t4, t6, t7, 13
lw t6, 48(sp)
lw t7, 54(sp)
or t2, t6, t7, -13
lw t6, 15(sp)
lw t7, 48(sp)
and.1 a6, t6, t7, 13
add t0, t0, t1
and.1 t5, t4, a3, 13
li t7, 23067729
mul t1, t3, t7
lw t6, 48(sp)
li t7, -63909661
mul t4, t6, t7
add a7, t1, a7
and.T a4, t2, a4, -13
lw t6, 45(sp)
and.T t1, t6, a3, -13
li t7, -11707904
mul t5, t5, t7
li t7, -59920690
mul t3, a4, t7
lw t6, 63(sp)
lw t7, 21(sp)
xor.T t2, t6, t7
lw t6, 33(sp)
lw t7, 108(sp)
and.1 a4, t6, t7, 13
add t4, t4, t5
add t0, t0, t4
or.T a6, a3, a6
li t7, -77030979
mul a6, a6, t7
add a7, a7, t0
lw t6, 18(sp)
lw t7, 201(sp)
xor t0, t6, t7
add a6, t3, a6
lw t6, 60(sp)
and.1 t3, t6, t1, 13
lw t6, 99(sp)
lw t7, 15(sp)
or t1, t6, t7, -13
and.T t0, t1, t0, -13
lw t7, 39(sp)
xor t1, t2, t7
xor.1 t0, t3, t0
li t7, -71275552
mul t0, t0, t7
li t7, 182758299
mul a4, a4, t7
add t2, a6, t0
li t7, 177988762
and.1 a6, a3, t7, 13
li t7, 110898164
mul t0, a6, t7
li t7, 88593083
mul a6, t1, t7
lw t6, 144(sp)
or a3, t6, a3, -13
li t7, 143545001
mul a3, a3, t7
add a7, a7, t2
lw t6, 30(sp)
li t7, -99665793
or.T t6, t6, t7
sw t6, 87(sp)
add a5, a5, a7
lw t6, 0(sp)
add a7, t6, a5
add a5, a3, t0
lw t6, 84(sp)
lw t7, 75(sp)
and.1 a3, t6, t7, 13
lw t6, 129(sp)
or.T a3, t6, a3
lw t6, 6(sp)
add a7, t6, a7
lw t6, 114(sp)
li t7, -99665793
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 30(sp)
li t7, -99665793
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 30(sp)
li t7, -99665793
or.1 t6, t6, t7
sw t6, 117(sp)
lw t6, 117(sp)
lw t7, 6(sp)
xor t0, t6, t7
lw t6, 39(sp)
li t7, -3345608
mul t6, t6, t7
sw t6, 42(sp)
lw t6, 27(sp)
li t7, -99292135
mul t6, t6, t7
sw t6, 12(sp)
li t7, 135189873
mul t1, a3, t7
lw t6, 39(sp)
lw t7, 87(sp)
or a3, t6, t7, -13
lw t6, 114(sp)
lw t7, 105(sp)
xor.1 t6, t6, t7
sw t6, 36(sp)
lw t6, 114(sp)
li t7, -99665793
or.1 t6, t6, t7
sw t6, 45(sp)
add a6, t1, a6
add a4, a6, a4
add a5, a5, a4
li t7, -100902200
mul a4, t0, t7
add a5, a7, a5
lw t6, 81(sp)
add t6, t6, a5
sw t6, 144(sp)
lw t6, 144(sp)
lw t7, 165(sp)
xor.T t6, t6, t7
sw t6, 99(sp)
lw t6, 144(sp)
lw t7, 144(sp)
xor t6, t6, t7
sw t6, 51(sp)
lw t6, 30(sp)
li t7, -99665793
xor.T t6, t6, t7
sw t6, 129(sp)
lw t6, 114(sp)
lw t7, 87(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 144(sp)
lw t7, 165(sp)
and.1 t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 63(sp)
li t7, -99665793
and t6, t6, t7, 13
sw t6, 33(sp)
lw t6, 63(sp)
lw t7, 162(sp)
and.T a6, t6, t7, -13
lw t6, 30(sp)
lw t7, 33(sp)
or.T a7, t6, t7
lw t6, 63(sp)
li t7, -99665793
or.1 t6, t6, t7
sw t6, 135(sp)
lw t6, 63(sp)
lw t7, 114(sp)
or t6, t6, t7, -13
sw t6, 48(sp)
lw t6, 48(sp)
li t7, 79557777
mul a5, t6, t7
lw t6, 30(sp)
lw t7, 63(sp)
xor.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 63(sp)
li t7, -99665793
and.1 t6, t6, t7, 13
sw t6, 108(sp)
lw t6, 135(sp)
li t7, -62393919
mul t6, t6, t7
sw t6, 75(sp)
lw t6, 123(sp)
li t7, -192721777
mul t1, t6, t7
lw t6, 63(sp)
lw t7, 30(sp)
and.T t0, t6, t7, -13
lw t6, 48(sp)
lw t7, 117(sp)
and t2, t6, t7, 13
lw t6, 30(sp)
li t7, -99665793
and.T t6, t6, t7, -13
sw t6, 81(sp)
lw t7, 108(sp)
xor.1 t2, t2, t7
lw t7, 63(sp)
xor t6, t0, t7
sw t6, 0(sp)
li t7, -93117567
mul t2, t2, t7
add t1, t2, t1
lw t6, 114(sp)
lw t7, 63(sp)
xor.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 63(sp)
lw t7, 114(sp)
xor t6, t6, t7
sw t6, 93(sp)
lw t6, 63(sp)
lw t7, 30(sp)
and t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 33(sp)
lw t7, 81(sp)
and.T t2, t6, t7, -13
or.1 a6, a6, a7
lw t7, 21(sp)
and.1 a3, a3, t7, 13
li t7, 56652477
mul a6, a6, t7
add t6, a6, a4
sw t6, 54(sp)
lw t6, 93(sp)
lw t7, 21(sp)
and a4, t6, t7, 13
lw t6, 63(sp)
lw t7, 114(sp)
or.T t6, t6, t7
sw t6, 15(sp)
or.T a7, a4, a3
add a3, a5, t1
lw t6, 150(sp)
or a5, t6, t0, -13
lw t6, 63(sp)
lw t7, 30(sp)
xor.T t6, t6, t7
sw t6, 3(sp)
lw t6, 45(sp)
lw t7, 3(sp)
and a4, t6, t7, 13
xor.1 a4, t2, a4
lw t6, 15(sp)
lw t7, 30(sp)
and a6, t6, t7, 13
li t7, 44385065
mul a4, a4, t7
lw t6, 114(sp)
li t7, -99665793
or t6, t6, t7, -13
sw t6, 9(sp)
li t7, 94168071
mul t3, a7, t7
lw t6, 123(sp)
li t7, -99665793
or.1 a7, t6, t7
lw t6, 21(sp)
lw t7, 129(sp)
or t4, t6, t7, -13
lw t6, 156(sp)
lw t7, 27(sp)
and t0, t6, t7, 13
lw t6, 9(sp)
or.1 t2, t6, t0
lw t6, 9(sp)
li t7, -173923981
mul t0, t6, t7
lw t6, 156(sp)
li t7, 20544226
mul t1, t6, t7
lw t6, 18(sp)
li t7, 114159683
mul t6, t6, t7
sw t6, 18(sp)
add a3, a3, t3
lw t6, 93(sp)
li t7, -99665793
and t3, t6, t7, 13
lw t6, 30(sp)
lw t7, 63(sp)
xor t6, t6, t7
sw t6, 57(sp)
lw t6, 117(sp)
or.1 t5, t6, t3
lw t6, 12(sp)
add t3, t6, a3
li t7, -99665793
and t4, t4, t7, 13
li t7, -133351447
mul a3, a7, t7
lw t6, 117(sp)
li t7, 2079902
mul a7, t6, t7
or.T t4, t4, t2
lw t7, 36(sp)
and.T t5, t5, t7, -13
li t7, 125398520
mul t6, a6, t7
sw t6, 27(sp)
lw t7, 135(sp)
xor.1 t2, a5, t7
lw t6, 0(sp)
xor.1 a5, t6, t5
slli t5, a5, 6
add a5, t0, t1
li t7, -116214846
mul t1, t4, t7
lw t6, 42(sp)
add a6, t6, t3
lw t6, 114(sp)
li t7, -99665793
or.T t6, t6, t7
sw t6, 12(sp)
lw t6, 15(sp)
lw t7, 159(sp)
and t0, t6, t7, 13
lw t6, 30(sp)
li t7, -99665793
or t6, t6, t7, -13
sw t6, 168(sp)
add t1, t5, t1
lw t6, 114(sp)
lw t7, 63(sp)
and t6, t6, t7, 13
sw t6, 165(sp)
lw t6, 63(sp)
lw t7, 57(sp)
and.T t3, t6, t7, -13
add t1, a4, t1
lw t7, 33(sp)
xor.1 a4, t2, t7
lw t6, 114(sp)
li t7, -99665793
xor t6, t6, t7
sw t6, 42(sp)
li t7, -135412068
mul a4, a4, t7
lw t6, 114(sp)
lw t7, 63(sp)
and.T t6, t6, t7, -13
sw t6, 147(sp)
lw t7, 57(sp)
or t2, t0, t7, -13
lw t7, 39(sp)
or.T t0, t3, t7
lw t6, 114(sp)
li t7, -99665793
xor.T t6, t6, t7
sw t6, 153(sp)
li t7, 130391194
mul t6, t2, t7
sw t6, 60(sp)
lw t6, 63(sp)
li t7, -99665793
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 117(sp)
lw t7, 42(sp)
and.1 t3, t6, t7, 13
add a7, a7, a4
lw t6, 0(sp)
lw t7, 162(sp)
or t2, t6, t7, -13
lw t6, 147(sp)
lw t7, 3(sp)
or.1 a4, t6, t7
lw t6, 168(sp)
and.1 t0, t6, t0, 13
li t7, 163944456
mul t5, t3, t7
lw t6, 108(sp)
lw t7, 114(sp)
and.1 t4, t6, t7, 13
lw t6, 75(sp)
add t3, t6, t1
add a3, a3, a7
add a3, a3, t5
lw t6, 30(sp)
slli t6, t6, 5
sw t6, 90(sp)
li t7, -190934127
mul a7, t4, t7
lw t6, 3(sp)
lw t7, 114(sp)
xor.T t1, t6, t7
add t6, a5, a3
sw t6, 138(sp)
add a3, a6, t3
lw t6, 54(sp)
add t6, t6, a3
sw t6, 141(sp)
li t7, -56387301
mul a3, t2, t7
lw t6, 18(sp)
add a3, t6, a3
lw t6, 63(sp)
li t7, -99665793
xor.T t6, t6, t7
sw t6, 96(sp)
lw t6, 63(sp)
lw t7, 114(sp)
and.1 t6, t6, t7, 13
sw t6, 36(sp)
li t7, -108633156
mul a5, t1, t7
li t7, -99665793
or a6, a4, t7, -13
li t7, 92903827
mul a4, t0, t7
lw t6, 96(sp)
lw t7, 63(sp)
and.T t1, t6, t7, -13
li t7, -19097359
mul t0, a6, t7
lw t6, 63(sp)
lw t7, 30(sp)
and.1 t6, t6, t7, 13
sw t6, 75(sp)
lw t6, 36(sp)
lw t7, 45(sp)
xor.1 a6, t6, t7
lw t6, 75(sp)
lw t7, 147(sp)
xor.T t2, t6, t7
lw t6, 168(sp)
li t7, 134446254
mul t3, t6, t7
lw t6, 27(sp)
add t4, t6, t3
lw t6, 30(sp)
li t7, -99665793
xor t6, t6, t7
sw t6, 18(sp)
lw t6, 63(sp)
li t7, -99665793
and.T t6, t6, t7, -13
sw t6, 171(sp)
li t7, 79051766
mul t2, t2, t7
lw t7, 120(sp)
or.1 t1, t1, t7
li t7, 82980808
mul t3, t1, t7
lw t6, 48(sp)
lw t7, 132(sp)
xor t1, t6, t7
lw t6, 135(sp)
lw t7, 39(sp)
xor.1 s0, t6, t7
add a7, t4, a7
lw t6, 63(sp)
lw t7, 114(sp)
xor.T t6, t6, t7
sw t6, 27(sp)
add t5, a7, a5
li t7, -162538247
mul a5, s0, t7
lw t6, 63(sp)
li t7, -99665793
xor t6, t6, t7
sw t6, 54(sp)
lw t6, 30(sp)
lw t7, 42(sp)
xor a7, t6, t7
lw t6, 12(sp)
lw t7, 21(sp)
and t4, t6, t7, 13
lw t6, 54(sp)
lw t7, 93(sp)
or s0, t6, t7, -13
lw t6, 171(sp)
and.1 a7, t6, a7, 13
li t7, 127509287
mul s0, s0, t7
add a3, a3, t5
lw t6, 114(sp)
lw t7, 63(sp)
or.1 t6, t6, t7
sw t6, 102(sp)
add t0, t0, s0
add t2, t2, t0
add t0, a3, a4
add a3, t2, t3
lw t6, 18(sp)
xor.1 a4, t6, a6
lw t6, 60(sp)
add t0, t6, t0
lw t6, 147(sp)
lw t7, 135(sp)
and.T t2, t6, t7, -13
lw t6, 30(sp)
lw t7, 63(sp)
or.1 t6, t6, t7
sw t6, 84(sp)
lw t6, 66(sp)
lw t7, 84(sp)
xor.T a6, t6, t7
lw t6, 102(sp)
lw t7, 126(sp)
xor t3, t6, t7
or t3, t4, t3, -13
or.1 t1, t1, t3
li t7, 5066441
mul t3, t1, t7
lw t7, 90(sp)
add t0, t0, t7
lw t6, 138(sp)
add t0, t6, t0
lw t6, 117(sp)
lw t7, 33(sp)
and t1, t6, t7, 13
lw t6, 141(sp)
add t0, t6, t0
li t7, 122161330
mul a6, a6, t7
li t7, -39427008
mul a7, a7, t7
add t3, a5, t3
li t7, -46534578
mul a5, t2, t7
li t7, -104716523
mul t2, a4, t7
lw t6, 36(sp)
lw t7, 63(sp)
and a4, t6, t7, 13
lw t7, 165(sp)
xor.T t5, a4, t7
lw t6, 132(sp)
lw t7, 159(sp)
or.1 a4, t6, t7
lw t6, 114(sp)
li t7, -99665793
and.1 t6, t6, t7, 13
sw t6, 174(sp)
add t6, t3, a7
sw t6, 141(sp)
lw t6, 27(sp)
lw t7, 108(sp)
xor t4, t6, t7
li t7, 113856318
mul t3, t5, t7
li t7, 48163256
mul a7, t1, t7
add t1, t2, a5
lw t6, 162(sp)
lw t7, 96(sp)
and.1 a5, t6, t7, 13
li t7, 115766076
mul a5, a5, t7
add a3, a3, t1
add t6, t0, a3
sw t6, 90(sp)
li t7, 3678184
mul t0, t4, t7
lw t6, 174(sp)
lw t7, 165(sp)
or.1 a3, t6, t7
add a5, a5, t3
add a6, a6, a5
lw t6, 63(sp)
li t7, -99665793
or.T a5, t6, t7
lw t6, 63(sp)
li t7, -99665793
xor.1 t6, t6, t7
sw t6, 138(sp)
lw t7, 30(sp)
and t1, a5, t7, 13
lw t6, 63(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 60(sp)
lw t6, 60(sp)
lw t7, 3(sp)
or a5, t6, t7, -13
add a6, t0, a6
add t6, a6, a7
sw t6, 39(sp)
lw t6, 231(sp)
lw t7, 15(sp)
or a6, t6, t7, -13
lw t7, 138(sp)
and.T t2, a4, t7, -13
and.1 a3, a3, t1, 13
slli t0, a3, 3
lw t6, 0(sp)
li t7, -72970600
mul a7, t6, t7
lw t6, 150(sp)
li t7, -99665793
xor.1 a3, t6, t7
lw t6, 30(sp)
li t7, -99665793
and.1 t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 12(sp)
lw t7, 0(sp)
and a4, t6, t7, 13
li t7, 34307966
mul t1, t2, t7
lw t6, 153(sp)
lw t7, 168(sp)
xor t2, t6, t7
lw t6, 165(sp)
andi t4, t6, 0
lw t6, 30(sp)
and t2, t6, t2, 13
lw t6, 105(sp)
li t7, -99665793
or t3, t6, t7, -13
add t1, t1, t0
and.1 t5, t2, a5, 13
lw t6, 123(sp)
lw t7, 162(sp)
or.1 a5, t6, t7
li t7, 71526285
mul t2, a6, t7
lw t6, 171(sp)
li t7, 164288573
mul t0, t6, t7
li t7, -133631914
mul t5, t5, t7
lw t6, 36(sp)
li t7, 71846091
mul a6, t6, t7
lw t6, 81(sp)
lw t7, 57(sp)
xor.1 s0, t6, t7
lw t6, 0(sp)
and s1, t6, t4, 13
lw t6, 156(sp)
li t7, 164667143
mul t4, t6, t7
lw t6, 105(sp)
lw t7, 9(sp)
or.1 s2, t6, t7
xor.1 s3, a5, t3
li t7, -119532470
mul t3, s2, t7
li t7, 184544984
mul s2, s1, t7
lw t6, 63(sp)
lw t7, 30(sp)
or.T a5, t6, t7
lw t7, 153(sp)
and.1 s3, s3, t7, 13
lw t6, 168(sp)
lw t7, 45(sp)
xor.1 s1, t6, t7
lw t7, 117(sp)
and.1 s3, s3, t7, 13
lw t6, 81(sp)
lw t7, 120(sp)
and.T s4, t6, t7, -13
add s2, t5, s2
li t7, 38146073
mul t5, s3, t7
xor s0, s4, s0
add s2, a7, s2
lw t6, 132(sp)
li t7, 104253090
mul a7, t6, t7
add t4, t5, t4
lw t6, 12(sp)
lw t7, 63(sp)
and t5, t6, t7, 13
lw t7, 150(sp)
xor.T s1, s1, t7
add t1, t1, s2
add t1, t1, t2
lw t6, 39(sp)
add s2, t6, t1
li t7, -46684398
mul t2, s1, t7
li t7, -141818920
mul s1, a4, t7
and.T t1, a3, s0, -13
lw t6, 141(sp)
add a3, t6, s2
lw t6, 30(sp)
li t7, -99665793
and t6, t6, t7, 13
sw t6, 105(sp)
add t2, t0, t2
add a7, a7, t3
lw t6, 63(sp)
lw t7, 66(sp)
or.T a4, t6, t7
lw t6, 57(sp)
lw t7, 132(sp)
xor.T s0, t6, t7
add t3, s1, a6
lw t6, 150(sp)
lw t7, 42(sp)
xor a6, t6, t7
li t7, 161970976
mul t1, t1, t7
li t7, -157817006
mul t0, t5, t7
add t4, t4, t3
lw t6, 174(sp)
lw t7, 108(sp)
or.1 t6, t6, t7
sw t6, 57(sp)
lw t6, 105(sp)
lw t7, 108(sp)
or.T t3, t6, t7
add t5, t4, t2
li t7, -90534055
mul t4, s0, t7
lw t7, 54(sp)
and.T t2, a5, t7, -13
add t6, a3, t5
sw t6, 39(sp)
lw t6, 9(sp)
li t7, 175999282
mul a3, t6, t7
lw t6, 93(sp)
li t7, -164137292
mul a5, t6, t7
li t7, -154093721
mul t2, t2, t7
add t1, t1, t2
lw t6, 63(sp)
lw t7, 84(sp)
xor.1 t5, t6, t7
lw t6, 135(sp)
lw t7, 15(sp)
xor.T t2, t6, t7
li t7, 38871310
mul t3, t3, t7
add t4, a7, t4
lw t6, 81(sp)
lw t7, 30(sp)
xor a7, t6, t7
add t0, t4, t0
li t7, 60449841
mul s0, t5, t7
add t0, t1, t0
lw t6, 105(sp)
li t7, 103428777
mul t4, t6, t7
add t1, t0, t3
lw t6, 48(sp)
li t7, -99665793
and.1 t5, t6, t7, 13
lw t6, 75(sp)
lw t7, 63(sp)
or.T t0, t6, t7
lw t7, 123(sp)
or.1 a7, a7, t7
lw t7, 96(sp)
xor t3, t2, t7
li t7, 178891680
mul a7, a7, t7
lw t6, 33(sp)
lw t7, 156(sp)
xor s1, t6, t7
lw t6, 123(sp)
li t7, -99665793
or t2, t6, t7, -13
lw t7, 75(sp)
or.1 t5, t5, t7
lw t6, 9(sp)
lw t7, 147(sp)
and.T s2, t6, t7, -13
li t7, -99665793
or.1 a4, a4, t7
or.1 a4, a6, a4
lw t6, 156(sp)
lw t7, 48(sp)
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 63(sp)
lw t7, 72(sp)
and.T a6, t6, t7, -13
lw t7, 129(sp)
xor a4, a4, t7
lw t6, 63(sp)
xor.1 s2, t6, s2
li t7, 177231830
mul s2, s2, t7
add t6, s0, s2
sw t6, 48(sp)
li t7, -105156001
mul s2, a4, t7
lw t6, 87(sp)
li t7, 182938055
mul s0, t6, t7
lw t6, 114(sp)
li t7, -99665793
and a4, t6, t7, 13
add t4, s2, t4
add a5, a5, t4
lw t6, 231(sp)
lw t7, 120(sp)
and t4, t6, t7, 13
lw t6, 57(sp)
or s1, t6, s1, -13
li t7, -102107156
mul s1, s1, t7
add s1, a3, s1
add t6, t1, a5
sw t6, 57(sp)
li t7, -98599782
mul t1, t3, t7
li t7, -159161676
mul a3, a4, t7
li t7, -20878012
mul t5, t5, t7
li t7, 107391076
mul t3, t0, t7
lw t6, 63(sp)
xor t0, t6, a4
lw t6, 114(sp)
or t2, t6, t2, -13
lw t6, 0(sp)
lw t7, 72(sp)
or.T a5, t6, t7
li t7, 88800176
mul t4, t4, t7
li t7, -19394996
mul s2, t0, t7
add t0, s1, a7
add a7, s0, s2
add t5, t5, a7
li t7, -111528254
mul a7, a6, t7
add t3, t5, t3
lw t6, 42(sp)
lw t7, 87(sp)
and a6, t6, t7, 13
li t7, 70290921
mul t5, t2, t7
lw t6, 33(sp)
xor.T a6, t6, a6
add t2, t3, t4
add t3, a3, t5
lw t6, 27(sp)
lw t7, 174(sp)
xor.T a3, t6, t7
lw t6, 114(sp)
and t5, t6, a3, 13
lw t6, 12(sp)
lw t7, 18(sp)
or a3, t6, t7, -13
lw t7, 81(sp)
xor.T a4, a4, t7
add t0, t0, t1
li t7, 139478953
mul t4, a6, t7
lw t6, 105(sp)
lw t7, 66(sp)
and.T a6, t6, t7, -13
add t6, t0, t2
sw t6, 12(sp)
li t7, 107908920
mul t1, a4, t7
lw t6, 36(sp)
and.1 a4, t6, t5, 13
li t7, -64182079
mul t0, a4, t7
lw t6, 150(sp)
li t7, -181442435
mul a4, t6, t7
lw t6, 72(sp)
lw t7, 0(sp)
and.1 t2, t6, t7, 13
add t3, t3, t0
lw t6, 114(sp)
or.1 t5, t6, a5
lw t6, 150(sp)
lw t7, 63(sp)
or.T t0, t6, t7
add a5, t4, a7
add a7, t3, a5
lw t6, 81(sp)
lw t7, 3(sp)
xor.1 t3, t6, t7
lw t6, 153(sp)
lw t7, 81(sp)
or a5, t6, t7, -13
lw t6, 114(sp)
li t7, -99665793
and.T t4, t6, t7, -13
lw t7, 159(sp)
xor.1 t4, t4, t7
xor t4, t5, t4
slli t4, t4, 4
add t1, t4, t1
add t6, a7, t1
sw t6, 0(sp)
lw t6, 42(sp)
li t7, -99665793
and.1 a7, t6, t7, 13
lw t6, 162(sp)
xor t1, t6, t3
lw t7, 153(sp)
and t2, t2, t7, 13
lw t6, 120(sp)
lw t7, 45(sp)
and t3, t6, t7, 13
li t7, 48800128
mul t1, t1, t7
lw t7, 15(sp)
and.T t3, t3, t7, -13
lw t6, 21(sp)
xor t4, t6, a5
li t7, 34495788
mul a5, t3, t7
or.T a6, t0, a6
li t7, 132949085
mul t3, a6, t7
lw t6, 138(sp)
lw t7, 102(sp)
or.T t0, t6, t7
li t7, 4185357
mul a6, t2, t7
li t7, 191423140
mul t0, t0, t7
or.T a3, t4, a3
li t7, -82920348
mul t2, a3, t7
add a3, a6, a4
lw t6, 114(sp)
li t7, -161530258
mul a6, t6, t7
lw t6, 132(sp)
lw t7, 3(sp)
and a4, t6, t7, 13
add t2, t2, t3
add t2, t1, t2
li t7, 170515131
mul t1, a4, t7
add a3, t2, a3
li t7, -165216172
mul a4, a7, t7
add t0, t0, a4
lw t6, 63(sp)
lw t7, 9(sp)
and.1 a4, t6, t7, 13
lw t6, 81(sp)
lw t7, 54(sp)
and.1 a7, t6, t7, 13
li t7, -37039894
mul t2, a4, t7
lw t6, 54(sp)
lw t7, 174(sp)
xor a4, t6, t7
lw t6, 63(sp)
and t3, t6, a4, 13
lw t6, 153(sp)
li t7, -99665793
or.1 t4, t6, t7
lw t6, 132(sp)
li t7, -28392142
mul a4, t6, t7
add a6, a6, t1
li t7, 28429730
mul t1, t3, t7
lw t7, 105(sp)
and.T t3, t4, t7, -13
add t1, t2, t1
add t0, t0, a6
lw t6, 30(sp)
lw t7, 105(sp)
and.1 a6, t6, t7, 13
add t0, a5, t0
lw t6, 6(sp)
li t7, -29669408
mul a5, t6, t7
and.1 a7, a7, t3, 13
add a3, a3, t0
li t7, -80681970
mul a7, a7, t7
add a7, t1, a7
add a3, a3, a7
lw t6, 0(sp)
add a3, t6, a3
lw t6, 63(sp)
lw t7, 60(sp)
and.T a7, t6, t7, -13
lw t6, 6(sp)
lw t7, 171(sp)
and.1 t0, t6, t7, 13
add a4, a4, a5
li t7, -84811666
mul a5, a6, t7
lw t7, 153(sp)
xor.T a6, a7, t7
lw t7, 147(sp)
xor.1 a7, t0, t7
lw t6, 78(sp)
li t7, -133524201
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 99(sp)
lw t7, 99(sp)
xor t6, t6, t7
sw t6, 141(sp)
li t7, 81441095
mul a7, a7, t7
add a5, a5, a7
li t7, -65962116
mul a6, a6, t7
add a5, a5, a6
lw t6, 198(sp)
lw t7, 99(sp)
and.1 t6, t6, t7, 13
sw t6, 15(sp)
add a4, a4, a5
add a4, a3, a4
lw t6, 99(sp)
li t7, -60411111
xor a3, t6, t7
lw t6, 99(sp)
lw t7, 198(sp)
or t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 12(sp)
add a4, t6, a4
lw t6, 99(sp)
lw t7, 198(sp)
and t6, t6, t7, 13
sw t6, 114(sp)
lw t6, 99(sp)
lw t7, 198(sp)
xor.T t6, t6, t7
sw t6, 105(sp)
lw t6, 99(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 108(sp)
lw t6, 198(sp)
slli t6, t6, 6
sw t6, 33(sp)
lw t6, 198(sp)
lw t7, 99(sp)
or.T t6, t6, t7
sw t6, 150(sp)
lw t6, 198(sp)
lw t7, 99(sp)
xor.1 t6, t6, t7
sw t6, 27(sp)
lw t6, 15(sp)
li t7, -167469312
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 48(sp)
add a4, t6, a4
lw t6, 114(sp)
li t7, -171599944
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 57(sp)
add a4, t6, a4
lw t6, 39(sp)
add a4, t6, a4
lw t6, 198(sp)
li t7, -178169200
mul t6, t6, t7
sw t6, 165(sp)
lw t6, 90(sp)
add a5, t6, a4
or a4, a3, a5, -13
lw t6, 99(sp)
xor t6, t6, a4
sw t6, 177(sp)
lw t6, 99(sp)
and.1 t6, t6, a4, 13
sw t6, 120(sp)
lw t6, 144(sp)
xor a3, t6, a5
or t6, a4, a3, -13
sw t6, 96(sp)
lw t6, 177(sp)
lw t7, 96(sp)
or a5, t6, t7, -13
xor t6, a3, a4
sw t6, 75(sp)
xor t6, a3, a3
sw t6, 180(sp)
lw t6, 120(sp)
lw t7, 75(sp)
or.T a7, t6, t7
lw t7, 198(sp)
xor.1 t6, a3, t7
sw t6, 102(sp)
lw t6, 99(sp)
and.1 t6, t6, a3, 13
sw t6, 12(sp)
lw t7, 180(sp)
or a6, a5, t7, -13
lw t6, 96(sp)
li t7, 15948377
mul a5, t6, t7
lw t7, 12(sp)
or a7, a7, t7, -13
lw t6, 99(sp)
and.T t6, t6, a3, -13
sw t6, 183(sp)
li t7, 157810185
mul a7, a7, t7
and t6, a4, a3, 13
sw t6, 45(sp)
lw t6, 9(sp)
add a5, t6, a5
lw t6, 45(sp)
lw t7, 183(sp)
or t0, t6, t7, -13
lw t6, 102(sp)
lw t7, 75(sp)
xor t1, t6, t7
lw t7, 198(sp)
and.1 t6, a3, t7, 13
sw t6, 90(sp)
li t7, 86245587
mul a6, a6, t7
and.T t1, a3, t1, -13
add a6, a6, a7
lw t6, 99(sp)
or t6, t6, a3, -13
sw t6, 42(sp)
li t7, 152954221
mul a7, t0, t7
lw t7, 198(sp)
xor t6, a4, t7
sw t6, 54(sp)
add a6, a6, a7
lw t6, 90(sp)
lw t7, 54(sp)
and.T a7, t6, t7, -13
lw t6, 42(sp)
xor.T t0, t6, t1
lw t7, 99(sp)
xor.1 t6, a3, t7
sw t6, 9(sp)
lw t6, 198(sp)
and.T t6, t6, a4, -13
sw t6, 93(sp)
li t7, -62993114
mul t1, a7, t7
li t7, 182220701
mul a7, t0, t7
lw t7, 6(sp)
add t1, t1, t7
lw t7, 99(sp)
xor.1 t6, a4, t7
sw t6, 132(sp)
lw t7, 99(sp)
and t6, a3, t7, 13
sw t6, 36(sp)
slli t2, a4, 6
lw t7, 198(sp)
and t6, a4, t7, 13
sw t6, 174(sp)
lw t6, 93(sp)
lw t7, 198(sp)
xor t0, t6, t7
add t1, a6, t1
add a6, a7, t2
lw t6, 99(sp)
xor.T t6, t6, a4
sw t6, 57(sp)
lw t7, 198(sp)
or.T t6, a3, t7
sw t6, 135(sp)
lw t6, 174(sp)
lw t7, 198(sp)
xor a7, t6, t7
lw t6, 198(sp)
and.1 t6, t6, a4, 13
sw t6, 171(sp)
add t6, a5, t1
sw t6, 159(sp)
lw t6, 198(sp)
xor t6, t6, a3
sw t6, 186(sp)
lw t6, 114(sp)
xor a7, t6, a7
lw t6, 135(sp)
lw t7, 198(sp)
xor.T a5, t6, t7
lw t7, 132(sp)
xor.T a7, a7, t7
lw t7, 99(sp)
xor t6, a3, t7
sw t6, 129(sp)
lw t7, 99(sp)
or.1 t6, a3, t7
sw t6, 48(sp)
and.1 t6, a3, a4, 13
sw t6, 72(sp)
lw t6, 72(sp)
lw t7, 9(sp)
and.T t1, t6, t7, -13
li t7, -5328744
mul a7, a7, t7
lw t6, 72(sp)
lw t7, 3(sp)
xor.T t2, t6, t7
lw t6, 186(sp)
and.T t5, t6, t2, -13
lw t6, 12(sp)
lw t7, 171(sp)
and t3, t6, t7, 13
and t0, t1, t0, 13
lw t7, 198(sp)
xor.1 t6, a4, t7
sw t6, 117(sp)
lw t6, 57(sp)
lw t7, 117(sp)
and.1 t1, t6, t7, 13
lw t6, 198(sp)
xor.T t6, t6, a3
sw t6, 87(sp)
lw t6, 99(sp)
xor s0, t6, t0
lw t7, 174(sp)
or t2, t1, t7, -13
lw t6, 171(sp)
lw t7, 54(sp)
or.1 t0, t6, t7
lw t6, 9(sp)
and.1 a5, t6, a5, 13
lw t6, 48(sp)
li t7, -947738
mul t1, t6, t7
lw t6, 99(sp)
or.T t6, t6, a4
sw t6, 66(sp)
or.T t6, a4, a3
sw t6, 153(sp)
li t7, 11653414
mul t4, a5, t7
lw t6, 198(sp)
or.1 t6, t6, a3
sw t6, 162(sp)
lw t6, 183(sp)
and s1, t6, t5, 13
lw t7, 198(sp)
or t6, a4, t7, -13
sw t6, 3(sp)
lw t6, 54(sp)
and.T a5, t6, t3, -13
lw t6, 177(sp)
lw t7, 171(sp)
and.1 t5, t6, t7, 13
lw t6, 105(sp)
xor.1 t6, t6, a3
sw t6, 123(sp)
li t7, 68592288
mul s0, s0, t7
li t7, -59598437
mul s2, a5, t7
lw t6, 99(sp)
and.T a5, t6, a4, -13
li t7, -11668502
mul t3, s1, t7
add s1, a6, t3
lw t6, 99(sp)
lw t7, 162(sp)
and t3, t6, t7, 13
lw t6, 153(sp)
li t7, -164936462
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 123(sp)
xor.T a6, t6, a3
or a6, t2, a6, -13
li t7, 188102651
mul a6, a6, t7
add t2, t4, s2
add t2, s0, t2
add a6, t2, a6
add t1, a6, t1
lw t6, 93(sp)
xor.1 a6, t6, t5
add a7, s1, a7
lw t7, 99(sp)
or.1 t6, a4, t7
sw t6, 138(sp)
xor.T t6, a4, a3
sw t6, 168(sp)
lw t6, 108(sp)
xor.1 t0, t6, t0
lw t6, 132(sp)
li t7, -9405098
mul t6, t6, t7
sw t6, 21(sp)
add t6, a7, t1
sw t6, 18(sp)
lw t6, 138(sp)
lw t7, 129(sp)
and t1, t6, t7, 13
lw t6, 66(sp)
lw t7, 75(sp)
and.T a7, t6, t7, -13
xor.T t0, t0, t1
li t7, -38833907
mul t1, t3, t7
lw t6, 3(sp)
li t7, 42966986
mul t2, t6, t7
add t1, t2, t1
lw t7, 168(sp)
xor.T t2, a5, t7
lw t6, 138(sp)
lw t7, 54(sp)
xor t4, t6, t7
lw t6, 87(sp)
xor t3, t6, a4
xor t5, a4, t2
lw t6, 93(sp)
lw t7, 45(sp)
and.T t2, t6, t7, -13
lw t6, 99(sp)
or t6, t6, a4, -13
sw t6, 84(sp)
and.1 t5, t5, t0, 13
lw t7, 117(sp)
or.1 a7, a7, t7
li t7, -16033251
mul t0, a7, t7
lw t6, 132(sp)
lw t7, 138(sp)
xor.1 s1, t6, t7
lw t6, 84(sp)
lw t7, 42(sp)
and.1 s2, t6, t7, 13
lw t6, 9(sp)
lw t7, 12(sp)
xor s0, t6, t7
li t7, 81013509
mul a7, t4, t7
lw t6, 198(sp)
or.1 t4, t6, s1
lw t6, 177(sp)
lw t7, 150(sp)
or s1, t6, t7, -13
li t7, 54856764
mul t5, t5, t7
or t2, t2, s2, -13
lw t6, 33(sp)
add s2, t6, t5
lw t7, 96(sp)
and.T s3, t3, t7, -13
lw t6, 96(sp)
lw t7, 99(sp)
and.T t6, t6, t7, -13
sw t6, 81(sp)
xor.1 a6, a6, a3
li t7, -64551587
mul t5, t4, t7
add t3, s2, t1
lw t7, 102(sp)
xor.T s2, s3, t7
lw t6, 87(sp)
xor.1 t4, t6, a5
lw t7, 198(sp)
xor.T t6, a4, t7
sw t6, 33(sp)
li t7, 125018195
mul t6, s1, t7
sw t6, 147(sp)
li t7, -80900940
mul t1, s0, t7
lw t6, 33(sp)
lw t7, 54(sp)
or s0, t6, t7, -13
li t7, -67921152
mul s0, s0, t7
li t7, -82904962
mul s1, s2, t7
lw t6, 99(sp)
and t6, t6, a4, 13
sw t6, 60(sp)
add s2, t3, s1
add t3, t0, s0
lw t6, 135(sp)
li t7, 126259088
mul s3, t6, t7
lw t6, 15(sp)
lw t7, 57(sp)
xor.1 t0, t6, t7
li t7, -112323835
mul t6, a5, t7
sw t6, 39(sp)
lw t6, 93(sp)
xor s4, t6, a4
li t7, 130392089
mul t2, t2, t7
add s1, t2, t5
lw t6, 9(sp)
lw t7, 60(sp)
and.1 s0, t6, t7, 13
lw t6, 96(sp)
lw t7, 138(sp)
xor t5, t6, t7
lw t6, 6(sp)
add t2, t6, s2
add s2, a7, s3
or.1 a6, a6, t4
lw t7, 102(sp)
and.1 a6, a6, t7, 13
li t7, -94334603
mul s3, a6, t7
li t7, -77132239
mul t4, s4, t7
lw t7, 162(sp)
and.T s5, a4, t7, -13
lw t7, 27(sp)
and.1 t5, t5, t7, 13
lw t7, 186(sp)
and.1 s4, a3, t7, 13
li t7, -28391676
mul a7, t0, t7
lw t6, 186(sp)
lw t7, 162(sp)
or.T a6, t6, t7
li t7, -85915783
mul t0, t5, t7
lw t7, 0(sp)
add t5, t1, t7
lw t6, 123(sp)
xor s5, t6, s5
lw t7, 198(sp)
or t6, a3, t7, -13
sw t6, 123(sp)
lw t6, 99(sp)
lw t7, 36(sp)
xor.1 t6, t6, t7
sw t6, 156(sp)
add t1, s1, s2
add s2, t3, s3
lw t6, 75(sp)
or t3, t6, s4, -13
lw t6, 138(sp)
lw t7, 129(sp)
or.T s1, t6, t7
li t7, -119456850
mul s0, s0, t7
lw t6, 108(sp)
lw t7, 48(sp)
or.1 s3, t6, t7
lw t7, 21(sp)
add s6, s2, t7
li t7, 75434488
mul s4, s5, t7
and a5, a5, a3, 13
lw t6, 9(sp)
li t7, -46494218
mul s2, t6, t7
lw t7, 81(sp)
xor.1 s5, a5, t7
add a5, t2, s6
lw t6, 18(sp)
add a5, t6, a5
add a5, a5, t1
li t7, -106298854
mul s3, s3, t7
add t1, t4, s4
lw t6, 60(sp)
li t7, 168414347
mul t6, t6, t7
sw t6, 6(sp)
li t7, -35533205
mul s4, s5, t7
lw t6, 60(sp)
lw t7, 123(sp)
xor.1 t2, t6, t7
lw t6, 147(sp)
add t4, t6, s3
lw t7, 198(sp)
and s1, s1, t7, 13
add s3, t5, s4
lw t6, 39(sp)
add t5, t6, s0
add t5, t5, s2
and.T t3, t3, s1, -13
add a7, s3, a7
add s0, t0, a7
lw t6, 72(sp)
lw t7, 102(sp)
and a7, t6, t7, 13
lw t6, 123(sp)
or.1 t0, t6, a4
li t7, 85834467
mul t3, t3, t7
lw t6, 198(sp)
and.T t6, t6, a3, -13
sw t6, 39(sp)
add t3, s0, t3
lw t6, 138(sp)
lw t7, 150(sp)
and.1 s0, t6, t7, 13
li t7, 174115217
mul a6, a6, t7
add t6, t5, a6
sw t6, 0(sp)
lw t6, 84(sp)
or.1 a6, t6, t0
li t7, -83436788
mul a6, a6, t7
li t7, 2442166
mul t6, t2, t7
sw t6, 48(sp)
add t2, t4, t3
and a7, a7, s0, 13
li t7, 184228849
mul t0, a7, t7
xor a7, a4, a4
add t0, t0, a6
lw t7, 198(sp)
or.T a6, a4, t7
add t2, t2, t1
lw t6, 39(sp)
lw t7, 198(sp)
and.1 t1, t6, t7, 13
lw t6, 15(sp)
lw t7, 60(sp)
or.1 t4, t6, t7
lw t6, 156(sp)
and.1 t3, t6, a6, 13
lw t6, 99(sp)
or.T t6, t6, a3
sw t6, 81(sp)
li t7, 91285834
mul t3, t3, t7
lw t6, 108(sp)
and t5, t6, a7, 13
add a5, a5, t2
li t7, -184171207
mul t2, t4, t7
lw t6, 15(sp)
li t7, 20135876
mul a7, t6, t7
xor.T t4, t1, t5
lw t6, 129(sp)
lw t7, 132(sp)
or.1 t1, t6, t7
li t7, -146785751
mul t4, t4, t7
add t3, t3, t4
lw t6, 198(sp)
lw t7, 54(sp)
or.T t4, t6, t7
xor.1 t1, t1, t4
lw t6, 198(sp)
and t6, t6, a3, 13
sw t6, 18(sp)
lw t6, 81(sp)
xor t1, t6, t1
add t0, t0, t3
add t0, t0, t2
lw t6, 18(sp)
li t7, -172083159
mul t3, t6, t7
lw t6, 54(sp)
lw t7, 36(sp)
or t4, t6, t7, -13
lw t6, 99(sp)
li t7, 132519544
mul t2, t6, t7
lw t6, 102(sp)
lw t7, 93(sp)
xor t5, t6, t7
lw t7, 6(sp)
add t0, t0, t7
li t7, 13475941
mul t5, t5, t7
lw t6, 84(sp)
li t7, 192566161
mul t6, t6, t7
sw t6, 6(sp)
li t7, 106437647
mul t4, t4, t7
lw t6, 165(sp)
add t6, t6, t3
sw t6, 21(sp)
li t7, 54120113
mul t1, t1, t7
lw t7, 168(sp)
xor.T a6, a6, t7
add a7, a7, t5
li t7, -89519521
mul t3, a6, t7
lw t6, 33(sp)
lw t7, 99(sp)
or.T a6, t6, t7
add t2, t4, t2
add a7, a7, t3
lw t6, 198(sp)
or.1 t6, t6, a4
sw t6, 72(sp)
lw t6, 0(sp)
add t0, t6, t0
lw t6, 87(sp)
lw t7, 198(sp)
xor.T t3, t6, t7
lw t6, 48(sp)
add t4, t6, t0
lw t6, 72(sp)
xor t0, t6, a4
lw t6, 75(sp)
lw t7, 138(sp)
and.T t6, t6, t7, -13
sw t6, 48(sp)
add t1, t1, t2
add a5, a5, t4
lw t6, 81(sp)
lw t7, 78(sp)
and.T t2, t6, t7, -13
li t7, -69964554
mul a6, a6, t7
lw t7, 15(sp)
or.T t3, t3, t7
lw t6, 159(sp)
add t6, t6, a5
sw t6, 0(sp)
li t7, -138638572
mul a5, t2, t7
lw t6, 129(sp)
lw t7, 138(sp)
xor t2, t6, t7
li t7, -54533439
mul t3, t3, t7
xor.T t2, t0, t2
add a5, t3, a5
lw t6, 150(sp)
slli t0, t6, 3
add t0, a5, t0
lw t6, 186(sp)
li t7, 53899783
mul t6, t6, t7
sw t6, 54(sp)
add t6, t1, a7
sw t6, 33(sp)
lw t6, 60(sp)
lw t7, 186(sp)
xor.T t1, t6, t7
lw t6, 66(sp)
lw t7, 132(sp)
and a5, t6, t7, 13
lw t6, 99(sp)
lw t7, 42(sp)
or.1 t3, t6, t7
lw t6, 129(sp)
or t4, t6, a3, -13
lw t6, 135(sp)
xor a7, t6, a3
lw t6, 72(sp)
or.T t3, t6, t3
lw t6, 96(sp)
xor t5, t6, a4
li t7, 53658749
mul s0, t2, t7
lw t6, 18(sp)
or t2, t6, t3, -13
li t7, -61199402
mul t2, t2, t7
add a6, a6, s0
lw t6, 186(sp)
lw t7, 57(sp)
and.T t3, t6, t7, -13
lw t6, 21(sp)
add a6, t6, a6
lw t6, 45(sp)
xor t4, t6, t4
add a6, a6, t0
lw t6, 123(sp)
xor.T t6, t6, a3
sw t6, 21(sp)
lw t6, 120(sp)
lw t7, 66(sp)
or s0, t6, t7, -13
li t7, 25183932
mul t0, t4, t7
lw t6, 27(sp)
lw t7, 12(sp)
and.1 t4, t6, t7, 13
add t2, t2, t0
lw t6, 135(sp)
xor.T t0, t6, a4
and.T s1, t0, a3, -13
lw t6, 6(sp)
add t0, t6, a6
lw t6, 93(sp)
and s3, t6, a4, 13
or.1 a6, a4, a3
xor.1 s2, s0, t1
lw t6, 135(sp)
or t1, t6, t5, -13
lw t7, 75(sp)
and.T s3, s3, t7, -13
lw t6, 117(sp)
xor.T s0, t6, a6
li t7, 137731379
mul t5, t1, t7
lw t7, 99(sp)
xor.T t1, a3, t7
li t7, 170317946
mul s0, s0, t7
lw t6, 48(sp)
or.1 s4, t6, s1
lw t6, 99(sp)
li t7, 170840154
mul t6, t6, t7
sw t6, 6(sp)
slli s2, s2, 4
lw t6, 15(sp)
lw t7, 117(sp)
and.1 s1, t6, t7, 13
and.T a7, a7, s4, -13
and.1 t3, t3, s3, 13
li t7, 123256493
mul s3, t3, t7
li t7, -126466174
mul t3, a5, t7
li t7, 51366627
mul s4, a7, t7
lw t6, 21(sp)
li t7, -26442309
mul a7, t6, t7
li t7, -56721362
mul s1, s1, t7
lw t7, 9(sp)
xor.1 t4, t4, t7
lw t6, 177(sp)
lw t7, 174(sp)
and.T a5, t6, t7, -13
add s2, s2, s3
lw t7, 9(sp)
xor.1 t6, a3, t7
sw t6, 42(sp)
add s2, s4, s2
add t5, t5, s0
add t3, t5, t3
add t2, t2, s2
lw t6, 54(sp)
add s0, t6, t2
lw t6, 72(sp)
lw t7, 66(sp)
and.1 t5, t6, t7, 13
lw t6, 153(sp)
li t7, 183971482
mul t2, t6, t7
add t2, t2, s1
lw t6, 27(sp)
xor t5, t6, t5
add t0, t0, s0
lw t6, 33(sp)
add t6, t6, t0
sw t6, 15(sp)
li t7, -17547966
mul t0, a3, t7
lw t7, 90(sp)
or s0, a5, t7, -13
lw t6, 198(sp)
lw t7, 99(sp)
and.T a5, t6, t7, -13
lw t6, 177(sp)
lw t7, 81(sp)
or.T s1, t6, t7
lw t7, 39(sp)
or.1 s1, s1, t7
lw t7, 198(sp)
or.1 t1, t1, t7
or.T t1, t1, a6
lw t7, 183(sp)
or a6, a5, t7, -13
li t7, 55604438
mul s2, t4, t7
li t7, -191503245
mul t4, s0, t7
or s0, a6, t5, -13
li t7, -2426816
mul a6, s1, t7
add t5, t2, s2
lw t6, 231(sp)
lw t7, 135(sp)
and t2, t6, t7, 13
li t7, -192189971
mul s1, t1, t7
li t7, -31951863
mul s0, s0, t7
xor.1 t1, a4, a3
lw t6, 6(sp)
add t4, t6, t4
add t3, t3, t5
add t3, s1, t3
lw t6, 114(sp)
lw t7, 72(sp)
or.1 t5, t6, t7
add a7, a7, s0
add a6, a6, t4
add a6, a7, a6
lw t7, 87(sp)
xor.T a7, t2, t7
and.T a7, t5, a7, -13
add t6, t3, a6
sw t6, 6(sp)
li t7, 6204210
mul a6, a7, t7
add a6, t0, a6
lw t6, 96(sp)
li t7, -88818089
mul a7, t6, t7
li t7, 165100154
mul t1, t1, t7
lw t6, 138(sp)
lw t7, 129(sp)
and.1 t5, t6, t7, 13
lw t6, 183(sp)
and.1 t4, t6, a4, 13
lw t6, 231(sp)
lw t7, 186(sp)
or t3, t6, t7, -13
lw t6, 99(sp)
li t7, -37285775
mul t2, t6, t7
lw t6, 12(sp)
li t7, 104343441
mul t0, t6, t7
lw t6, 171(sp)
lw t7, 186(sp)
xor s0, t6, t7
lw t6, 78(sp)
or.1 t5, t6, t5
lw t6, 42(sp)
and s1, t6, t5, 13
lw t6, 21(sp)
or t4, t6, t4, -13
lw t6, 183(sp)
lw t7, 3(sp)
or t5, t6, t7, -13
li t7, -164609893
mul s1, s1, t7
add t2, s1, t2
add t2, t1, t2
lw t6, 120(sp)
lw t7, 141(sp)
or.T t1, t6, t7
or s1, a5, t1, -13
lw t7, 123(sp)
or.T s3, a3, t7
lw t7, 18(sp)
and.T s2, t5, t7, -13
lw t6, 162(sp)
lw t7, 9(sp)
and.1 a5, t6, t7, 13
li t7, -167738504
mul t1, a5, t7
lw t6, 93(sp)
li t7, 70471965
mul t5, t6, t7
lw t6, 78(sp)
lw t7, 81(sp)
and a5, t6, t7, 13
lw t6, 105(sp)
or t3, t6, t3, -13
lw t6, 231(sp)
and a4, t6, a4, 13
lw t6, 105(sp)
xor.1 s4, t6, s0
and.T s3, t3, s3, -13
lw t6, 75(sp)
lw t7, 12(sp)
or s0, t6, t7, -13
li t7, -181537602
mul t3, s4, t7
and.T t4, t4, s3, -13
li t7, 121790460
mul t4, t4, t7
lw t6, 111(sp)
li t7, -190051651
xor.T t6, t6, t7
sw t6, 42(sp)
lw t7, 153(sp)
xor s2, s2, t7
li t7, -76728362
mul a4, a4, t7
xor.T s1, s2, s1
li t7, -153715643
mul s1, s1, t7
add t4, t2, t4
li t7, 80477636
mul t2, s0, t7
add a6, a6, t4
add a7, a7, a6
add a6, t5, t2
add t0, s1, t0
lw t6, 111(sp)
li t7, -190051651
and.T t6, t6, t7, -13
sw t6, 183(sp)
add a6, t3, a6
add a6, t1, a6
add t0, a7, t0
lw t6, 186(sp)
lw t7, 90(sp)
and a7, t6, t7, 13
lw t7, 99(sp)
or.1 t1, a5, t7
lw t6, 6(sp)
add a5, t6, t0
lw t6, 72(sp)
li t7, -39679715
mul t0, t6, t7
lw t6, 15(sp)
add a5, t6, a5
li t7, -91203094
mul t1, t1, t7
add a4, a4, t1
add a4, a6, a4
lw t6, 111(sp)
li t7, -190051651
and.1 t6, t6, t7, 13
sw t6, 39(sp)
li t7, 16008035
mul a6, a7, t7
add a6, a6, t0
lw t6, 198(sp)
lw t7, 36(sp)
or a7, t6, t7, -13
add a4, a5, a4
lw t6, 183(sp)
li t7, 153950763
mul t6, t6, t7
sw t6, 9(sp)
li t7, 62440901
mul a5, a7, t7
lw t6, 111(sp)
li t7, -190051651
or.1 t6, t6, t7
sw t6, 90(sp)
add a6, a6, a5
lw t6, 111(sp)
li t7, -190051651
or.T t6, t6, t7
sw t6, 93(sp)
lw t6, 93(sp)
li t7, -190051651
and.1 a5, t6, t7, 13
lw t6, 111(sp)
li t7, -190051651
xor.1 t6, t6, t7
sw t6, 96(sp)
add a4, a4, a6
lw t6, 0(sp)
add a7, t6, a4
lw t6, 111(sp)
lw t7, 183(sp)
and.1 t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 69(sp)
xor a4, t6, a7
lw t6, 30(sp)
xor t6, t6, a7
sw t6, 171(sp)
lw t7, 24(sp)
and a6, a7, t7, 13
lw t7, 111(sp)
or.T t6, a4, t7
sw t6, 102(sp)
lw t6, 24(sp)
or a7, t6, a7, -13
li t7, -190051651
and.1 t6, a4, t7, 13
sw t6, 18(sp)
lw t6, 111(sp)
xor.1 t6, t6, a4
sw t6, 192(sp)
li t7, -190051651
or t6, a4, t7, -13
sw t6, 162(sp)
lw t6, 192(sp)
lw t7, 42(sp)
and.T t0, t6, t7, -13
xor t6, a7, a6
sw t6, 189(sp)
lw t6, 111(sp)
lw t7, 189(sp)
and.1 t6, t6, t7, 13
sw t6, 153(sp)
lw t6, 111(sp)
and.1 t6, t6, a4, 13
sw t6, 81(sp)
or.T a7, t0, a5
lw t6, 81(sp)
li t7, -6885898
mul a5, t6, t7
lw t6, 189(sp)
li t7, -190051651
or.1 t6, t6, t7
sw t6, 138(sp)
lw t6, 111(sp)
lw t7, 189(sp)
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 6(sp)
lw t7, 111(sp)
and t0, t6, t7, 13
lw t6, 189(sp)
li t7, -190051651
and t6, t6, t7, 13
sw t6, 135(sp)
lw t6, 138(sp)
lw t7, 135(sp)
or.T t6, t6, t7
sw t6, 123(sp)
lw t6, 189(sp)
li t7, -190051651
and.1 t6, t6, t7, 13
sw t6, 114(sp)
lw t7, 189(sp)
xor t6, a4, t7
sw t6, 120(sp)
lw t7, 111(sp)
and.T t6, a4, t7, -13
sw t6, 21(sp)
lw t7, 189(sp)
or.T a6, a4, t7
lw t7, 189(sp)
xor.1 t1, a6, t7
lw t7, 90(sp)
and.T t0, t0, t7, -13
lw t6, 114(sp)
lw t7, 39(sp)
xor.1 t3, t6, t7
lw t6, 189(sp)
and t6, t6, a4, 13
sw t6, 69(sp)
li t7, 99771628
mul t2, a7, t7
and.1 a7, t1, t3, 13
lw t6, 189(sp)
li t7, -190051651
and.T t6, t6, t7, -13
sw t6, 48(sp)
li t7, 88537864
mul t1, a7, t7
lw t6, 21(sp)
li t7, 22472982
mul a7, t6, t7
li t7, 88681937
mul t0, t0, t7
add t0, t0, t2
lw t6, 123(sp)
lw t7, 111(sp)
and.T t2, t6, t7, -13
lw t6, 189(sp)
lw t7, 111(sp)
or t6, t6, t7, -13
sw t6, 27(sp)
lw t6, 120(sp)
li t7, 56416823
mul t3, t6, t7
lw t7, 189(sp)
and.T t6, a4, t7, -13
sw t6, 168(sp)
li t7, -140824215
mul t2, t2, t7
add t3, t3, t2
lw t6, 189(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 33(sp)
lw t6, 33(sp)
lw t7, 69(sp)
and.1 t2, t6, t7, 13
li t7, -190051651
and t6, a4, t7, 13
sw t6, 141(sp)
add t1, t1, t3
li t7, -190051651
or.T t6, a4, t7
sw t6, 108(sp)
lw t6, 27(sp)
lw t7, 135(sp)
and.1 t4, t6, t7, 13
add a5, a5, t1
add a5, a5, a7
add a5, t0, a5
lw t6, 135(sp)
li t7, -154512225
mul t3, t6, t7
lw t6, 111(sp)
lw t7, 141(sp)
or t1, t6, t7, -13
li t7, -184736606
mul a7, t4, t7
lw t6, 168(sp)
xor.T t0, t6, a4
li t7, -57739060
mul t2, t2, t7
lw t7, 102(sp)
xor.1 t4, a6, t7
lw t6, 189(sp)
lw t7, 111(sp)
or.1 t6, t6, t7
sw t6, 72(sp)
xor.T a6, a4, t4
add t2, t3, t2
lw t6, 189(sp)
lw t7, 111(sp)
and.T t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 189(sp)
or.1 t6, t6, a4
sw t6, 129(sp)
li t7, -190051651
or t3, t4, t7, -13
lw t6, 18(sp)
lw t7, 111(sp)
or.1 t4, t6, t7
lw t7, 162(sp)
and.1 t5, t1, t7, 13
lw t6, 189(sp)
li t7, -190051651
xor.1 t6, t6, t7
sw t6, 165(sp)
lw t7, 114(sp)
and.T t1, t4, t7, -13
li t7, 140840580
mul t4, t5, t7
lw t6, 108(sp)
lw t7, 189(sp)
and.1 s0, t6, t7, 13
lw t7, 48(sp)
or.1 t5, t0, t7
li t7, -126936556
mul s1, a6, t7
add t6, a5, t2
sw t6, 24(sp)
lw t6, 165(sp)
li t7, -190051651
xor.T t0, t6, t7
lw t7, 66(sp)
or.T s2, t5, t7
lw t6, 93(sp)
and t2, t6, t3, 13
lw t6, 189(sp)
li t7, -190051651
or t6, t6, t7, -13
sw t6, 12(sp)
lw t7, 18(sp)
or a6, a4, t7, -13
lw t6, 72(sp)
li t7, 62472972
mul t5, t6, t7
li t7, 191143616
mul a5, s0, t7
add t3, s1, t4
lw t6, 153(sp)
lw t7, 90(sp)
xor t6, t6, t7
sw t6, 36(sp)
li t7, -164581951
mul t4, s2, t7
add t6, a7, t3
sw t6, 45(sp)
lw t6, 108(sp)
lw t7, 168(sp)
and.1 a7, t6, t7, 13
lw t7, 111(sp)
or t6, a4, t7, -13
sw t6, 177(sp)
or.1 t1, t2, t1
li t7, -5524395
mul t1, t1, t7
lw t6, 120(sp)
li t7, -53404491
mul t3, t6, t7
add t2, t4, t5
li t7, -190051651
xor.1 t6, a4, t7
sw t6, 132(sp)
lw t6, 90(sp)
lw t7, 162(sp)
or.T s0, t6, t7
lw t6, 231(sp)
lw t7, 108(sp)
and t6, t6, t7, 13
sw t6, 84(sp)
add t1, t1, t2
lw t6, 111(sp)
lw t7, 189(sp)
and t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 84(sp)
lw t7, 102(sp)
or.T t2, t6, t7
li t7, -190051651
or.1 t6, a4, t7
sw t6, 159(sp)
lw t7, 111(sp)
xor t6, a4, t7
sw t6, 60(sp)
lw t6, 129(sp)
li t7, -155932264
mul t4, t6, t7
lw t6, 111(sp)
or.1 t6, t6, a4
sw t6, 3(sp)
lw t6, 123(sp)
lw t7, 159(sp)
xor.1 t5, t6, t7
li t7, 41262042
mul s0, s0, t7
lw t6, 117(sp)
and t0, t6, t0, 13
lw t6, 111(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 57(sp)
li t7, 44470715
mul s1, a7, t7
lw t6, 189(sp)
lw t7, 60(sp)
or.T a7, t6, t7
lw t6, 132(sp)
or.T s2, t6, a4
li t7, -105911707
mul s2, s2, t7
xor a7, t0, a7
add s2, s2, s1
li t7, -96561509
mul t0, a6, t7
lw t6, 27(sp)
li t7, -190051651
xor.1 a6, t6, t7
lw t7, 111(sp)
and t6, a4, t7, 13
sw t6, 186(sp)
add t0, t0, t3
lw t6, 21(sp)
lw t7, 192(sp)
and.T s1, t6, t7, -13
add t3, s2, s0
li t7, -96232800
mul t5, t5, t7
add a5, t5, a5
add a5, a5, t4
lw t6, 189(sp)
lw t7, 111(sp)
or.T t6, t6, t7
sw t6, 15(sp)
add t1, t1, t0
lw t6, 3(sp)
lw t7, 186(sp)
and.T s2, t6, t7, -13
li t7, 51303340
mul t6, t2, t7
sw t6, 156(sp)
lw t6, 15(sp)
lw t7, 189(sp)
or.1 s0, t6, t7
lw t6, 177(sp)
lw t7, 81(sp)
xor t0, t6, t7
lw t6, 45(sp)
add t1, t6, t1
lw t6, 24(sp)
add t6, t6, t1
sw t6, 75(sp)
li t7, -13777465
mul t1, s1, t7
lw t6, 57(sp)
lw t7, 42(sp)
and.1 s1, t6, t7, 13
lw t7, 39(sp)
xor.1 t4, a4, t7
lw t6, 60(sp)
lw t7, 192(sp)
or.1 t5, t6, t7
li t7, -190051651
xor.T t6, a4, t7
sw t6, 87(sp)
lw t6, 183(sp)
or s2, t6, s2, -13
lw t6, 3(sp)
lw t7, 117(sp)
xor t2, t6, t7
li t7, 69714886
mul s2, s2, t7
lw t7, 189(sp)
xor.1 t6, a4, t7
sw t6, 174(sp)
and a7, a7, s0, 13
lw t7, 189(sp)
or t6, a4, t7, -13
sw t6, 45(sp)
li t7, 170060880
mul a7, a7, t7
lw t7, 189(sp)
xor.T s0, s1, t7
add a7, t3, a7
lw t6, 177(sp)
li t7, 185530060
mul t6, t6, t7
sw t6, 195(sp)
add t3, s2, t1
li t7, -165536926
mul t1, a4, t7
xor t4, t4, t5
li t7, 2521094
mul t6, s0, t7
sw t6, 54(sp)
li t7, -94122014
mul t6, a6, t7
sw t6, 24(sp)
add t6, a5, a7
sw t6, 105(sp)
lw t6, 87(sp)
lw t7, 93(sp)
or t5, t6, t7, -13
lw t6, 177(sp)
lw t7, 36(sp)
or.T a7, t6, t7
lw t6, 66(sp)
and a6, t6, t2, 13
lw t6, 15(sp)
and.1 a5, t6, t0, 13
lw t6, 111(sp)
li t7, -190051651
and t6, t6, t7, 13
sw t6, 42(sp)
li t7, -17445288
mul a7, a7, t7
li t7, -160389946
mul t0, t4, t7
lw t7, 96(sp)
xor.1 t2, t5, t7
lw t7, 9(sp)
add t0, t0, t7
xor t6, a4, a4
sw t6, 78(sp)
add t0, t3, t0
li t7, 46928958
mul a5, a5, t7
lw t6, 174(sp)
lw t7, 123(sp)
xor.1 t3, t6, t7
lw t6, 183(sp)
lw t7, 12(sp)
or.1 t4, t6, t7
lw t6, 45(sp)
or.T t2, t6, t2
add a5, t1, a5
li t7, -190051651
xor t6, a4, t7
sw t6, 147(sp)
li t7, 85775162
mul t6, a6, t7
sw t6, 36(sp)
lw t6, 120(sp)
lw t7, 6(sp)
xor a6, t6, t7
li t7, -178994951
mul a6, a6, t7
lw t6, 108(sp)
lw t7, 177(sp)
xor.T s0, t6, t7
lw t6, 42(sp)
xor.1 t5, t6, a4
lw t6, 147(sp)
lw t7, 159(sp)
and.T t1, t6, t7, -13
xor.T t4, t4, t5
lw t6, 96(sp)
li t7, -84817663
mul t6, t6, t7
sw t6, 150(sp)
li t7, 130720764
mul s1, t2, t7
lw t6, 177(sp)
li t7, -190051651
and.T t2, t6, t7, -13
lw t6, 159(sp)
li t7, -190051651
xor t6, t6, t7
sw t6, 96(sp)
li t7, 27112085
mul t5, t4, t7
lw t6, 120(sp)
lw t7, 78(sp)
and.1 s2, t6, t7, 13
lw t6, 231(sp)
or t3, t6, t3, -13
lw t6, 174(sp)
lw t7, 111(sp)
or t4, t6, t7, -13
or s0, s2, s0, -13
lw t6, 111(sp)
li t7, -190051651
or t6, t6, t7, -13
sw t6, 198(sp)
li t7, 4647660
mul t3, t3, t7
li t7, 32871881
mul t6, s0, t7
sw t6, 9(sp)
lw t6, 156(sp)
add s0, t6, t3
add t3, s1, a7
lw t6, 12(sp)
lw t7, 132(sp)
and.T a7, t6, t7, -13
lw t7, 54(sp)
add s0, s0, t7
add s1, t0, s0
li t7, 164936098
add t3, t3, t7
lw t7, 24(sp)
add t5, t5, t7
lw t6, 45(sp)
lw t7, 72(sp)
and.T s2, t6, t7, -13
lw t6, 138(sp)
lw t7, 60(sp)
or t0, t6, t7, -13
lw t7, 111(sp)
xor.T t6, a4, t7
sw t6, 54(sp)
lw t6, 192(sp)
and.T s3, t6, t0, -13
lw t6, 135(sp)
li t7, 190051651
and s0, t6, t7, 13
lw t6, 81(sp)
or t0, t6, t4, -13
and t0, t2, t0, 13
and.1 t2, t1, t0, 13
lw t6, 192(sp)
lw t7, 54(sp)
xor t0, t6, t7
lw t6, 60(sp)
li t7, 173704207
mul t4, t6, t7
lw t6, 195(sp)
add t1, t6, s1
add a5, t1, a5
xor.1 t1, s2, s3
li t7, -16838492
mul t2, t2, t7
lw t6, 162(sp)
li t7, 152568164
mul t6, t6, t7
sw t6, 24(sp)
add a6, a6, t5
li t7, 49130210
mul t5, a4, t7
add t6, t5, t4
sw t6, 60(sp)
lw t7, 12(sp)
and.1 t4, s0, t7, 13
lw t7, 189(sp)
xor.T s0, a4, t7
lw t6, 36(sp)
add a6, t6, a6
add t5, t3, a6
lw t7, 54(sp)
or a6, s0, t7, -13
lw t7, 111(sp)
or s2, a6, t7, -13
li t7, -144817883
mul s0, t1, t7
lw t6, 189(sp)
lw t7, 12(sp)
xor.T t1, t6, t7
lw t6, 54(sp)
li t7, -190051651
or a6, t6, t7, -13
lw t6, 138(sp)
lw t7, 135(sp)
and.T t3, t6, t7, -13
li t7, -21518677
mul s1, t4, t7
lw t6, 150(sp)
add s3, t6, t2
li t7, -66978210
mul t2, s2, t7
lw t6, 72(sp)
lw t7, 111(sp)
and t4, t6, t7, 13
lw t6, 153(sp)
li t7, -185104459
mul t6, t6, t7
sw t6, 138(sp)
li t7, -171002043
mul a7, a7, t7
lw t6, 9(sp)
add s2, t6, s3
add t5, t5, s2
add s2, s0, t2
lw t6, 123(sp)
lw t7, 132(sp)
or.T t2, t6, t7
lw t7, 114(sp)
xor.1 s0, t0, t7
add t6, s2, s1
sw t6, 9(sp)
add a5, a5, t5
lw t6, 108(sp)
xor a6, t6, a6
lw t6, 105(sp)
add s1, t6, a5
li t7, 29292163
mul a6, a6, t7
lw t6, 0(sp)
lw t7, 186(sp)
xor t0, t6, t7
lw t6, 57(sp)
or.T t3, t6, t3
lw t7, 96(sp)
xor.1 t4, t4, t7
lw t6, 90(sp)
lw t7, 21(sp)
and.1 a5, t6, t7, 13
lw t6, 162(sp)
lw t7, 6(sp)
or.T t5, t6, t7
li t7, 175821226
mul s2, t3, t7
lw t6, 198(sp)
or s3, t6, t1, -13
lw t7, 165(sp)
xor.T t3, s0, t7
lw t6, 75(sp)
add t6, t6, s1
sw t6, 36(sp)
lw t6, 192(sp)
li t7, -143956484
mul t1, t6, t7
li t7, 51984860
mul s1, s3, t7
li t7, -121231446
mul s0, t4, t7
add t4, a7, s2
lw t6, 45(sp)
lw t7, 72(sp)
xor.T t6, t6, t7
sw t6, 0(sp)
li t7, -170200730
mul a5, a5, t7
add t1, s1, t1
lw t6, 168(sp)
or.1 a7, t6, t2
li t7, -10003578
mul s1, t0, t7
li t7, 190476935
mul s2, t3, t7
lw t7, 189(sp)
and.1 t6, a4, t7, 13
sw t6, 75(sp)
lw t6, 84(sp)
lw t7, 81(sp)
xor t0, t6, t7
li t7, -40656214
mul t3, t0, t7
lw t6, 21(sp)
lw t7, 15(sp)
xor.1 t0, t6, t7
lw t6, 147(sp)
or.1 t2, t6, t5
li t7, -126884863
mul t2, t2, t7
add s2, s0, s2
lw t6, 189(sp)
li t7, -190051651
xor.T t5, t6, t7
add a6, a6, s1
lw t7, 24(sp)
add a6, a6, t7
lw t6, 192(sp)
li t7, -48406111
mul s0, t6, t7
lw t6, 111(sp)
slli s1, t6, 8
add a6, a6, s2
add a6, t4, a6
lw t6, 18(sp)
lw t7, 33(sp)
xor.T t4, t6, t7
lw t7, 117(sp)
and.1 t5, t5, t7, 13
lw t6, 3(sp)
lw t7, 141(sp)
xor s2, t6, t7
add s0, s1, s0
li t7, 159302942
mul s1, t5, t7
li t7, -15267049
mul t5, s2, t7
add t5, t2, t5
lw t6, 189(sp)
li t7, 36697003
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 9(sp)
add a6, t6, a6
lw t6, 93(sp)
lw t7, 141(sp)
and t2, t6, t7, 13
lw t6, 60(sp)
add s2, t6, a6
lw t6, 81(sp)
slli a6, t6, 2
add s3, s2, t1
lw t6, 117(sp)
lw t7, 141(sp)
xor.1 t1, t6, t7
li t7, 19820259
mul s2, a7, t7
add t3, s3, t3
lw t6, 33(sp)
li t7, 112145439
mul t6, t6, t7
sw t6, 9(sp)
add s1, s1, a5
lw t6, 42(sp)
lw t7, 12(sp)
or.T a7, t6, t7
add t6, s2, s0
sw t6, 24(sp)
lw t6, 39(sp)
xor a5, t6, t0
lw t6, 48(sp)
lw t7, 102(sp)
xor s0, t6, t7
lw t6, 108(sp)
lw t7, 75(sp)
xor.T t0, t6, t7
lw t6, 42(sp)
and.T t4, t6, t4, -13
add t3, t3, s1
add t5, t3, t5
li t7, -190051651
and.T t6, a4, t7, -13
sw t6, 42(sp)
lw t6, 90(sp)
lw t7, 12(sp)
or.T t3, t6, t7
lw t6, 36(sp)
add t6, t6, t5
sw t6, 21(sp)
lw t6, 66(sp)
lw t7, 42(sp)
or t5, t6, t7, -13
slli s2, t5, 4
li t7, 159445172
mul t4, t4, t7
li t7, 190916245
mul t3, t3, t7
lw t6, 15(sp)
li t7, -190051651
and.T s1, t6, t7, -13
or.1 t5, a5, t1
add t1, s2, t4
lw t6, 57(sp)
li t7, 129573287
mul a5, t6, t7
li t7, 1345565
mul s2, a7, t7
lw t6, 0(sp)
li t7, 34152379
mul t4, t6, t7
and.T s0, s0, t2, -13
li t7, 59818738
mul a7, s1, t7
lw t6, 132(sp)
and.1 t0, t6, t0, 13
li t7, 32924432
mul t5, t5, t7
li t7, -52468424
mul t0, t0, t7
add t2, a6, s2
li t7, -110708745
mul a6, s0, t7
add s0, t5, t1
add t1, t4, a6
lw t6, 72(sp)
lw t7, 111(sp)
xor.1 t5, t6, t7
lw t6, 153(sp)
lw t7, 87(sp)
or.T a6, t6, t7
lw t6, 84(sp)
add t4, t6, s0
add t4, t4, t3
lw t6, 114(sp)
lw t7, 147(sp)
and.1 s0, t6, t7, 13
lw t6, 129(sp)
lw t7, 108(sp)
and.T s1, t6, t7, -13
lw t6, 231(sp)
and t5, t6, t5, 13
add t1, t2, t1
lw t6, 165(sp)
lw t7, 132(sp)
and t3, t6, t7, 13
add s2, a7, t0
lw t7, 9(sp)
add t0, t1, t7
lw t7, 111(sp)
or.T t1, s1, t7
lw t6, 198(sp)
lw t7, 69(sp)
and.T t2, t6, t7, -13
lw t7, 117(sp)
and a7, s0, t7, 13
lw t6, 138(sp)
add s0, t6, s2
add s0, t4, s0
li t7, -144208662
mul t4, t5, t7
lw t6, 162(sp)
lw t7, 27(sp)
or.T s1, t6, t7
lw t6, 24(sp)
add t5, t6, s0
lw t7, 159(sp)
and.1 s0, s1, t7, 13
add a5, t4, a5
li t7, -152029044
mul t4, a7, t7
li t7, -143827892
mul a7, t3, t7
add t6, t5, t0
sw t6, 15(sp)
li t7, -120092400
mul t0, s0, t7
lw t6, 33(sp)
li t7, -190051651
and.T t5, t6, t7, -13
lw t6, 69(sp)
lw t7, 120(sp)
xor t3, t6, t7
lw t7, 42(sp)
or s0, t5, t7, -13
add t0, t0, a5
li t7, 126183037
mul a6, a6, t7
lw t6, 117(sp)
lw t7, 177(sp)
and.T t5, t6, t7, -13
lw t6, 45(sp)
li t7, -2124474
mul a5, t6, t7
li t7, -36971811
mul s0, s0, t7
lw t6, 183(sp)
xor s1, t6, t3
lw t6, 198(sp)
or t2, t6, t2, -13
lw t6, 39(sp)
lw t7, 18(sp)
or t3, t6, t7, -13
add t4, t4, s0
lw t7, 57(sp)
xor.T s0, s1, t7
and.1 s1, t1, t2, 13
lw t6, 186(sp)
li t7, -190051651
xor.1 t1, t6, t7
lw t6, 45(sp)
lw t7, 57(sp)
and.1 t2, t6, t7, 13
lw t6, 27(sp)
lw t7, 6(sp)
xor.T s2, t6, t7
and.1 t5, t5, s2, 13
and.1 s0, t5, s0, 13
slli s1, s1, 5
lw t6, 123(sp)
lw t7, 183(sp)
xor.T t5, t6, t7
lw t7, 159(sp)
xor s0, s0, t7
li t7, -123029253
mul s0, s0, t7
add a6, s1, a6
add t4, t4, a6
lw t6, 174(sp)
li t7, 188804265
mul a6, t6, t7
li t7, 96564636
mul t1, t1, t7
lw t6, 111(sp)
li t7, -190051651
xor s1, t6, t7
add s0, a7, s0
and.1 a7, t3, t5, 13
lw t7, 66(sp)
xor t3, s1, t7
add t4, t4, s0
lw t6, 123(sp)
lw t7, 174(sp)
and.1 t5, t6, t7, 13
lw t7, 75(sp)
and.1 t3, t3, t7, 13
add t6, t0, t4
sw t6, 0(sp)
li t7, -169180811
mul t4, a7, t7
lw t6, 54(sp)
lw t7, 147(sp)
or a7, t6, t7, -13
or.1 t0, t2, t5
li t7, -62887642
mul t0, t0, t7
li t7, 15858360
mul t2, t3, t7
add t0, t0, t2
lw t6, 135(sp)
lw t7, 192(sp)
xor t2, t6, t7
lw t6, 171(sp)
lw t7, 171(sp)
xor t6, t6, t7
sw t6, 60(sp)
lw t6, 42(sp)
li t7, 92477502
mul t3, t6, t7
add a5, a5, t4
lw t6, 129(sp)
lw t7, 12(sp)
or.T t4, t6, t7
li t7, 171490256
mul t2, t2, t7
lw t6, 153(sp)
lw t7, 177(sp)
or t5, t6, t7, -13
lw t6, 120(sp)
and.1 a4, t6, a4, 13
lw t6, 3(sp)
and t4, t6, t4, 13
li t7, -22540821
mul t4, t4, t7
and.1 a4, t5, a4, 13
lw t6, 63(sp)
xor.1 t6, t6, a3
sw t6, 75(sp)
lw t6, 78(sp)
and.1 a4, t6, a4, 13
add a5, a5, t1
add t3, t3, t4
li t7, -80229196
mul t1, a7, t7
add a5, a5, a6
lw t6, 57(sp)
li t7, 87777981
mul a6, t6, t7
add a7, t0, t3
add a7, a7, t2
lw t6, 6(sp)
li t7, 134850847
mul t0, t6, t7
li t7, -101257681
mul a4, a4, t7
add t1, a4, t1
lw t7, 63(sp)
or.1 t6, a3, t7
sw t6, 96(sp)
li t7, -157651392
and t6, a3, t7, 13
sw t6, 6(sp)
lw t6, 63(sp)
li t7, -157651392
or.T t6, t6, t7
sw t6, 24(sp)
lw t6, 96(sp)
lw t7, 24(sp)
xor a4, t6, t7
lw t6, 63(sp)
li t7, -157651392
or t6, t6, t7, -13
sw t6, 42(sp)
add a6, a6, t0
add a6, t1, a6
add a6, a7, a6
lw t6, 63(sp)
or t6, t6, a3, -13
sw t6, 150(sp)
lw t7, 63(sp)
and t6, a3, t7, 13
sw t6, 120(sp)
lw t6, 150(sp)
lw t7, 75(sp)
or t6, t6, t7, -13
sw t6, 9(sp)
li t7, -157651392
or t6, a3, t7, -13
sw t6, 45(sp)
lw t7, 96(sp)
and.T t6, a3, t7, -13
sw t6, 3(sp)
lw t6, 75(sp)
lw t7, 120(sp)
or a7, t6, t7, -13
lw t6, 6(sp)
li t7, 161933893
mul t0, t6, t7
li t7, -157651392
xor.T t6, a3, t7
sw t6, 117(sp)
add a5, a5, a6
lw t6, 0(sp)
add a5, t6, a5
lw t7, 63(sp)
and.1 t6, a3, t7, 13
sw t6, 138(sp)
lw t6, 15(sp)
add a5, t6, a5
lw t7, 63(sp)
and.T t6, a3, t7, -13
sw t6, 15(sp)
li t7, 101614813
mul a6, a7, t7
add t6, t0, a6
sw t6, 27(sp)
lw t7, 63(sp)
or.T t6, a3, t7
sw t6, 159(sp)
lw t6, 63(sp)
lw t7, 63(sp)
xor t6, t6, t7
sw t6, 39(sp)
lw t6, 21(sp)
add a5, t6, a5
li t7, 134636075
xor t6, a5, t7
sw t6, 165(sp)
lw t6, 165(sp)
lw t7, 63(sp)
and.1 t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 63(sp)
lw t7, 165(sp)
xor t6, t6, t7
sw t6, 48(sp)
lw t6, 165(sp)
li t7, -157651392
or.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 165(sp)
lw t7, 63(sp)
or t6, t6, t7, -13
sw t6, 21(sp)
lw t6, 165(sp)
lw t7, 63(sp)
xor.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 165(sp)
li t7, -157651392
or.T t6, t6, t7
sw t6, 102(sp)
lw t6, 102(sp)
li t7, -35089886
mul a5, t6, t7
lw t6, 165(sp)
lw t7, 63(sp)
and.T t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 0(sp)
andi a6, t6, 0
lw t6, 48(sp)
li t7, -157651392
xor.1 t1, t6, t7
lw t6, 165(sp)
and.T t6, t6, a3, -13
sw t6, 12(sp)
lw t6, 165(sp)
xor t6, t6, a3
sw t6, 132(sp)
lw t6, 12(sp)
lw t7, 132(sp)
or.T t2, t6, t7
lw t7, 48(sp)
and.T t0, a3, t7, -13
lw t6, 0(sp)
li t7, -157651392
xor.1 a7, t6, t7
lw t6, 165(sp)
li t7, -157651392
and.1 t6, t6, t7, 13
sw t6, 147(sp)
and.T t1, a4, t1, -13
lw t6, 147(sp)
lw t7, 42(sp)
or.1 a4, t6, t7
slli a4, a4, 6
li t7, 98863486
mul t2, t2, t7
add a4, a4, t2
lw t6, 63(sp)
lw t7, 165(sp)
or.T t6, t6, t7
sw t6, 18(sp)
li t7, -120034936
mul t2, a6, t7
lw t6, 165(sp)
li t7, -157651392
xor.1 a6, t6, t7
and.1 a6, a6, t0, 13
add t2, t2, a5
lw t6, 45(sp)
lw t7, 147(sp)
xor.T t0, t6, t7
lw t6, 165(sp)
lw t7, 63(sp)
and t6, t6, t7, 13
sw t6, 153(sp)
lw t6, 165(sp)
xor.1 a5, t6, t1
lw t6, 165(sp)
or.1 t6, t6, a3
sw t6, 129(sp)
li t7, -127726292
mul t4, a5, t7
lw t6, 18(sp)
lw t7, 165(sp)
and a5, t6, t7, 13
lw t7, 156(sp)
or.1 a7, a7, t7
lw t6, 153(sp)
lw t7, 54(sp)
xor t1, t6, t7
li t7, -109138259
mul t1, t1, t7
lw t7, 6(sp)
or.T t3, a5, t7
lw t6, 24(sp)
li t7, 189356874
mul a5, t6, t7
lw t6, 159(sp)
lw t7, 138(sp)
xor.1 s0, t6, t7
lw t6, 156(sp)
lw t7, 129(sp)
or.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 0(sp)
lw t7, 156(sp)
or t5, t6, t7, -13
lw t7, 9(sp)
xor.T s1, a7, t7
add t4, t2, t4
lw t7, 3(sp)
and.1 a7, s0, t7, 13
li t7, -68271262
mul t2, s1, t7
add a4, t4, a4
and.T t0, t0, t5, -13
lw t7, 156(sp)
xor.1 a6, a6, t7
li t7, 5791279
mul t0, t0, t7
lw t7, 27(sp)
add t6, t2, t7
sw t6, 66(sp)
lw t6, 165(sp)
lw t7, 63(sp)
or.1 t6, t6, t7
sw t6, 36(sp)
xor.T a6, t3, a6
add t6, t1, t0
sw t6, 3(sp)
li t7, 21024352
mul a6, a6, t7
add t6, a4, a6
sw t6, 78(sp)
lw t6, 63(sp)
li t7, -157651392
and.T t6, t6, t7, -13
sw t6, 114(sp)
lw t7, 165(sp)
and.1 t6, a3, t7, 13
sw t6, 90(sp)
lw t6, 63(sp)
li t7, -157651392
and.1 t6, t6, t7, 13
sw t6, 141(sp)
li t7, -157651392
or.T t6, a3, t7
sw t6, 135(sp)
lw t6, 36(sp)
or.T a6, t6, a3
lw t6, 165(sp)
xor.1 a4, t6, a3
lw t7, 123(sp)
xor.1 t0, a6, t7
lw t6, 138(sp)
lw t7, 132(sp)
and.1 a6, t6, t7, 13
li t7, 11310488
mul a7, a7, t7
li t7, -134355713
mul t0, t0, t7
add a5, a5, a7
add t6, t0, a5
sw t6, 69(sp)
lw t6, 15(sp)
lw t7, 141(sp)
or.T t2, t6, t7
lw t6, 138(sp)
li t7, 64487739
mul a5, t6, t7
lw t6, 138(sp)
li t7, 105575376
mul t1, t6, t7
lw t6, 24(sp)
or.T a7, t6, a4
lw t6, 150(sp)
lw t7, 114(sp)
xor t0, t6, t7
lw t6, 39(sp)
or t5, t6, a4, -13
lw t6, 117(sp)
xor.T t4, t6, t2
lw t6, 63(sp)
xor.T t3, t6, a3
lw t6, 63(sp)
xor.1 t5, t6, t5
lw t6, 117(sp)
xor s0, t6, t3
lw t6, 180(sp)
lw t7, 135(sp)
xor.T t2, t6, t7
lw t6, 165(sp)
or.T t6, t6, a3
sw t6, 72(sp)
lw t6, 21(sp)
xor.T t3, t6, t3
lw t7, 102(sp)
or s0, s0, t7, -13
lw t6, 90(sp)
or t3, t6, t3, -13
lw t6, 15(sp)
li t7, -120328829
mul s1, t6, t7
add t1, s1, t1
lw t7, 96(sp)
or.T t3, t3, t7
or t4, t5, t4, -13
or.1 a6, a6, s0
li t7, -27522042
mul s0, t4, t7
li t7, -64188557
mul t4, a6, t7
lw t6, 63(sp)
xor.1 s1, t6, t0
li t7, 54431763
mul t6, t2, t7
sw t6, 9(sp)
lw t6, 165(sp)
lw t7, 114(sp)
or.T t0, t6, t7
lw t6, 21(sp)
lw t7, 75(sp)
xor.T t2, t6, t7
lw t6, 117(sp)
li t7, 15942608
mul a6, t6, t7
lw t6, 63(sp)
xor t6, t6, a3
sw t6, 57(sp)
li t7, -157651392
or.1 t6, a3, t7
sw t6, 111(sp)
add t5, t4, a5
and a7, a7, s1, 13
li t7, -157651392
xor.1 t6, a3, t7
sw t6, 108(sp)
li t7, 6207002
mul a5, t3, t7
lw t7, 147(sp)
xor t3, a7, t7
lw t6, 57(sp)
lw t7, 39(sp)
and.1 a7, t6, t7, 13
li t7, -56331955
mul t3, t3, t7
add t4, t3, t1
lw t7, 108(sp)
or a7, a7, t7, -13
li t7, -10715201
mul t3, a7, t7
add s2, s0, a5
li t7, -157651392
and.1 t6, a3, t7, 13
sw t6, 105(sp)
lw t6, 111(sp)
lw t7, 24(sp)
and a7, t6, t7, 13
lw t7, 39(sp)
xor.T a5, a4, t7
lw t6, 63(sp)
li t7, -157651392
xor t1, t6, t7
lw t6, 75(sp)
lw t7, 72(sp)
xor.T s5, t6, t7
or s6, a7, a4, -13
lw t7, 105(sp)
or.1 s3, t2, t7
lw t6, 165(sp)
li t7, -157651392
xor.T t6, t6, t7
sw t6, 27(sp)
lw t7, 57(sp)
xor.1 s0, a3, t7
lw t6, 165(sp)
lw t7, 153(sp)
xor.1 s1, t6, t7
lw t6, 63(sp)
li t7, -157651392
and t2, t6, t7, 13
lw t6, 54(sp)
lw t7, 111(sp)
or.1 a7, t6, t7
add t5, s2, t5
lw t6, 69(sp)
add s4, t6, t5
lw t6, 165(sp)
xor.1 t5, t6, s6
li t7, -48914677
mul s6, t5, t7
lw t6, 135(sp)
lw t7, 6(sp)
xor.1 s2, t6, t7
lw t6, 42(sp)
xor t5, t6, a3
or.1 t0, t0, s5
li t7, 138636753
mul s5, t0, t7
add t0, t4, s6
add t6, s5, a6
sw t6, 93(sp)
li t7, 173524250
mul a6, s3, t7
add t6, t3, a6
sw t6, 21(sp)
lw t6, 9(sp)
add a6, t6, t0
lw t6, 165(sp)
li t7, -157651392
and.T t6, t6, t7, -13
sw t6, 87(sp)
lw t6, 87(sp)
lw t7, 18(sp)
xor t0, t6, t7
li t7, 127039757
mul t6, t0, t7
sw t6, 9(sp)
add a6, s4, a6
lw t7, 165(sp)
and.T t4, s0, t7, -13
li t7, -157651392
or t3, s1, t7, -13
lw t6, 3(sp)
add a6, t6, a6
lw t6, 63(sp)
li t7, -157651392
or.1 t6, t6, t7
sw t6, 69(sp)
li t7, 95782549
mul t0, t1, t7
lw t6, 69(sp)
lw t7, 27(sp)
or s0, t6, t7, -13
and.T t1, a4, s2, -13
lw t6, 129(sp)
lw t7, 135(sp)
and s2, t6, t7, 13
lw t6, 63(sp)
or.1 t2, t6, t2
li t7, -157651392
xor t6, a3, t7
sw t6, 84(sp)
lw t6, 153(sp)
xor.T a4, t6, s0
lw t6, 66(sp)
add s0, t6, a6
li t7, 130126533
mul a6, a5, t7
xor a5, t1, t5
li t7, -8326409
mul t1, a5, t7
lw t6, 78(sp)
add t6, t6, s0
sw t6, 3(sp)
lw t6, 6(sp)
lw t7, 54(sp)
xor.1 s1, t6, t7
lw t6, 84(sp)
lw t7, 114(sp)
or a5, t6, t7, -13
li t7, -178487097
mul s0, a7, t7
and.T a7, s2, t3, -13
li t7, 54396872
mul t2, t2, t7
li t7, -21792602
mul t3, a5, t7
lw t6, 36(sp)
li t7, 171399838
mul a5, t6, t7
li t7, 135239442
mul a7, a7, t7
lw t6, 132(sp)
li t7, -157651392
or t5, t6, t7, -13
lw t6, 165(sp)
and.T s3, t6, t5, -13
and.1 a4, t4, a4, 13
add s2, a7, t1
slli t5, a4, 6
li t7, -26791033
mul a4, s3, t7
lw t6, 231(sp)
lw t7, 165(sp)
or t1, t6, t7, -13
lw t7, 24(sp)
xor a7, s1, t7
li t7, 156928286
mul a7, a7, t7
lw t7, 48(sp)
xor t4, a3, t7
add s1, s0, s2
lw t6, 63(sp)
li t7, -157651392
xor.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 69(sp)
lw t7, 156(sp)
and.T s0, t6, t7, -13
lw t7, 135(sp)
xor.T s2, s0, t7
lw t6, 165(sp)
li t7, -157651392
xor t6, t6, t7
sw t6, 66(sp)
add s0, t0, a4
lw t6, 114(sp)
lw t7, 57(sp)
and.1 t0, t6, t7, 13
lw t7, 39(sp)
and.1 s2, s2, t7, 13
lw t6, 21(sp)
add a4, t6, s1
lw t6, 63(sp)
or.T t4, t6, t4
li t7, 20821497
mul t4, t4, t7
lw t7, 9(sp)
add s1, a4, t7
lw t6, 75(sp)
lw t7, 231(sp)
and a4, t6, t7, 13
li t7, 59411013
mul s2, s2, t7
lw t6, 159(sp)
li t7, 62403739
mul t6, t6, t7
sw t6, 114(sp)
add t3, t3, s2
add a6, a6, t2
add t2, t3, s0
add s1, s1, t5
lw t7, 153(sp)
or.T t3, a3, t7
lw t6, 102(sp)
lw t7, 75(sp)
xor.1 s0, t6, t7
li t7, 153430287
mul t5, t0, t7
lw t6, 93(sp)
add t0, t6, s1
lw t7, 165(sp)
and.T s1, a4, t7, -13
lw t6, 102(sp)
lw t7, 66(sp)
or.T s2, t6, t7
xor.T s2, s2, t3
add t3, a6, t2
lw t6, 72(sp)
li t7, 158962852
mul t2, t6, t7
add t5, a5, t5
lw t6, 108(sp)
lw t7, 165(sp)
or.T a6, t6, t7
lw t6, 165(sp)
lw t7, 165(sp)
xor t6, t6, t7
sw t6, 162(sp)
xor.1 a5, t1, s0
or.1 t1, s1, s2
li t7, 11656750
mul t1, t1, t7
lw t6, 96(sp)
lw t7, 165(sp)
xor.1 s0, t6, t7
add t1, t4, t1
add t6, a7, t1
sw t6, 102(sp)
lw t6, 108(sp)
xor.T a5, t6, a5
li t7, -73572778
mul t1, a5, t7
lw t7, 132(sp)
or a7, s0, t7, -13
lw t6, 54(sp)
li t7, -158862964
mul t6, t6, t7
sw t6, 57(sp)
lw t6, 162(sp)
lw t7, 36(sp)
and.1 t4, t6, t7, 13
lw t6, 39(sp)
lw t7, 63(sp)
and.1 a5, t6, t7, 13
li t7, 83485379
mul a5, a5, t7
li t7, -38755726
mul s0, t4, t7
add t5, t5, t1
lw t6, 135(sp)
lw t7, 24(sp)
or t4, t6, t7, -13
lw t6, 165(sp)
and t6, t6, a3, 13
sw t6, 93(sp)
lw t6, 96(sp)
lw t7, 78(sp)
and t1, t6, t7, 13
add t5, t3, t5
lw t6, 63(sp)
lw t7, 111(sp)
or.T t3, t6, t7
lw t7, 159(sp)
or.1 t3, t3, t7
li t7, -3722420
mul t3, t3, t7
add t0, t0, t5
li t7, 120809123
mul a7, a7, t7
lw t6, 93(sp)
and.T t5, t6, a3, -13
add a7, s0, a7
add a7, t2, a7
li t7, -157651392
and.T t6, a3, t7, -13
sw t6, 9(sp)
lw t7, 54(sp)
or.T t5, t5, t7
li t7, 189935481
mul t2, t4, t7
or a6, t5, a6, -13
lw t7, 39(sp)
xor t6, a4, t7
sw t6, 21(sp)
lw t6, 105(sp)
li t7, 167369975
mul a4, t6, t7
add t3, t3, t2
li t7, 51660902
mul t4, a6, t7
lw t6, 3(sp)
add t6, t6, t0
sw t6, 3(sp)
lw t6, 165(sp)
lw t7, 9(sp)
xor.T t0, t6, t7
lw t7, 165(sp)
xor.T a6, a3, t7
lw t6, 66(sp)
and.1 t2, t6, a3, 13
and.T t0, t1, t0, -13
li t7, -31384409
mul t1, t0, t7
lw t7, 132(sp)
xor s0, a6, t7
lw t6, 123(sp)
li t7, -111943198
mul t0, t6, t7
add t5, t3, t1
li t7, 93231692
mul t3, s0, t7
add a5, t4, a5
lw t6, 48(sp)
lw t7, 129(sp)
and t1, t6, t7, 13
lw t7, 138(sp)
and.T s0, a6, t7, -13
add t4, a5, t5
lw t7, 132(sp)
or.T a5, s0, t7
lw t6, 75(sp)
lw t7, 42(sp)
or t5, t6, t7, -13
lw t6, 57(sp)
add t4, t6, t4
li t7, -110367493
mul t5, t5, t7
add a7, a7, t4
lw t6, 141(sp)
lw t7, 6(sp)
and t4, t6, t7, 13
lw t6, 165(sp)
lw t7, 63(sp)
xor.T t6, t6, t7
sw t6, 48(sp)
add a4, t5, a4
lw t6, 36(sp)
xor t2, t6, t2
add t5, t3, a4
lw t6, 24(sp)
xor.T a4, t6, a6
lw t6, 45(sp)
lw t7, 48(sp)
and s0, t6, t7, 13
lw t6, 18(sp)
and.1 t3, t6, a6, 13
add a6, t0, t5
or.1 t0, t4, s0
li t7, 96587300
mul t5, t0, t7
li t7, 28371394
mul t1, t1, t7
lw t6, 48(sp)
lw t7, 9(sp)
or.1 t0, t6, t7
or a4, a4, t0, -13
li t7, -188494641
mul t0, t2, t7
add a6, a7, a6
lw t6, 27(sp)
lw t7, 78(sp)
xor.1 t4, t6, t7
lw t6, 165(sp)
li t7, -157651392
and t6, t6, t7, 13
sw t6, 57(sp)
lw t7, 117(sp)
and.1 a7, t3, t7, 13
li t7, -161629706
mul a5, a5, t7
li t7, -28009251
mul t2, a7, t7
add t5, t1, t5
lw t6, 156(sp)
li t7, 176543019
mul t1, t6, t7
lw t6, 165(sp)
or t6, t6, a3, -13
sw t6, 117(sp)
lw t6, 141(sp)
lw t7, 66(sp)
or.1 s1, t6, t7
lw t6, 57(sp)
lw t7, 111(sp)
or.T t3, t6, t7
lw t6, 9(sp)
lw t7, 42(sp)
xor.1 s2, t6, t7
lw t6, 6(sp)
li t7, -27087702
mul a7, t6, t7
lw t6, 21(sp)
li t7, 64589464
mul s0, t6, t7
add s3, t0, t5
lw t6, 87(sp)
lw t7, 12(sp)
or t0, t6, t7, -13
lw t6, 117(sp)
li t7, -157651392
or.T t5, t6, t7
lw t6, 93(sp)
xor.T s1, t6, s1
and.T t4, s1, t4, -13
add a6, a6, s3
li t7, -31848953
mul s3, t4, t7
lw t6, 114(sp)
add a6, t6, a6
lw t6, 6(sp)
xor s1, t6, a3
xor.1 a4, s2, a4
lw t6, 102(sp)
add t4, t6, a6
li t7, 164728850
mul s2, a4, t7
li t7, 31398942
mul a6, a3, t7
add s3, s0, s3
lw t6, 165(sp)
li t7, -157651392
or a4, t6, t7, -13
add s0, a5, s2
add t2, t2, s3
lw t7, 90(sp)
or t5, t5, t7, -13
lw t6, 96(sp)
li t7, -60482367
mul a5, t6, t7
li t7, -157651392
xor t3, t3, t7
add s0, t1, s0
lw t6, 81(sp)
or s1, t6, s1, -13
lw t6, 18(sp)
lw t7, 147(sp)
and.1 t1, t6, t7, 13
add t2, s0, t2
xor.1 t5, t5, s1
add t6, t4, t2
sw t6, 21(sp)
and t2, t3, a4, 13
li t7, -181723264
mul t2, t2, t7
li t7, 177148426
mul t3, t5, t7
lw t6, 66(sp)
lw t7, 15(sp)
and.1 t5, t6, t7, 13
lw t6, 18(sp)
lw t7, 78(sp)
xor.T s0, t6, t7
add a7, t3, a7
lw t6, 24(sp)
li t7, -157651392
and.1 t4, t6, t7, 13
and t3, t0, s0, 13
lw t6, 81(sp)
lw t7, 153(sp)
or.T t0, t6, t7
li t7, -54325758
mul s0, t3, t7
lw t6, 87(sp)
lw t7, 159(sp)
and.1 t3, t6, t7, 13
li t7, 32266714
mul t5, t5, t7
li t7, 14826425
mul s1, t1, t7
lw t6, 27(sp)
or t1, t6, t0, -13
add t0, s0, s1
add s0, t2, t0
lw t7, 108(sp)
and.T t0, t4, t7, -13
li t7, -138728616
mul t0, t0, t7
lw t6, 24(sp)
lw t7, 0(sp)
xor.T t2, t6, t7
li t7, 156142966
mul t1, t1, t7
add a7, a7, s0
add s0, t5, t1
add a6, a6, a7
lw t6, 84(sp)
lw t7, 108(sp)
or.1 t4, t6, t7
lw t6, 36(sp)
xor a7, t6, t3
li t7, 94906956
mul a7, a7, t7
lw t6, 120(sp)
lw t7, 90(sp)
and.1 t1, t6, t7, 13
lw t7, 12(sp)
xor.1 t5, a4, t7
add a6, a6, s0
lw t6, 81(sp)
lw t7, 42(sp)
or t3, t6, t7, -13
lw t6, 0(sp)
lw t7, 150(sp)
xor s0, t6, t7
li t7, -22044142
mul s0, s0, t7
add s0, s0, a5
lw t6, 54(sp)
lw t7, 63(sp)
and.1 a5, t6, t7, 13
lw t6, 27(sp)
and.1 s1, t6, t2, 13
lw t6, 72(sp)
lw t7, 135(sp)
and.1 t2, t6, t7, 13
li t7, -26902726
mul s1, s1, t7
add s0, s1, s0
lw t6, 57(sp)
or.1 t4, t6, t4
lw t6, 150(sp)
or.1 s1, t6, a5
lw t6, 117(sp)
lw t7, 111(sp)
xor.1 a5, t6, t7
li t7, 36815047
mul t4, t4, t7
or.1 t5, s1, t5
add t4, s0, t4
add t4, t0, t4
xor t1, t1, t3
li t7, 96944460
mul t0, a4, t7
li t7, 77573115
mul s0, t1, t7
lw t6, 180(sp)
lw t7, 75(sp)
or s1, t6, t7, -13
lw t6, 105(sp)
xor.T a4, t6, a4
lw t6, 78(sp)
lw t7, 24(sp)
xor t3, t6, t7
li t7, 98862065
mul t5, t5, t7
lw t6, 153(sp)
li t7, -139655153
mul t1, t6, t7
and t2, t2, s1, 13
add t5, s0, t5
add a7, a7, t5
li t7, 11069044
mul t2, t2, t7
add t2, a7, t2
lw t7, 153(sp)
or.T a7, t3, t7
add t2, t4, t2
lw t6, 39(sp)
xor.1 t3, t6, a4
or.T a4, a5, a7
li t7, 188412559
mul a7, t3, t7
add t6, a6, t2
sw t6, 0(sp)
li t7, 55530855
mul a4, a4, t7
add a6, t0, a4
lw t6, 36(sp)
lw t7, 42(sp)
xor a4, t6, t7
slli a4, a4, 7
lw t6, 42(sp)
lw t7, 54(sp)
xor.T t0, t6, t7
lw t6, 111(sp)
li t7, 161556590
mul a5, t6, t7
add a6, t1, a6
lw t6, 75(sp)
lw t7, 45(sp)
xor t1, t6, t7
add a6, a6, a7
li t7, -157651392
and a7, t0, t7, 13
li t7, 134627131
mul a7, a7, t7
lw t6, 69(sp)
lw t7, 45(sp)
xor t2, t6, t7
lw t7, 9(sp)
or.1 t0, t1, t7
andi t1, t2, 0
li t7, -182718162
mul t2, t1, t7
lw t6, 6(sp)
lw t7, 36(sp)
and.T t1, t6, t7, -13
lw t7, 111(sp)
and.1 t3, t0, t7, 13
lw t6, 57(sp)
lw t7, 63(sp)
and.1 t0, t6, t7, 13
li t7, 166223198
mul t0, t0, t7
li t7, 112414363
mul t3, t3, t7
add t2, t3, t2
lw t6, 69(sp)
xor.T t3, t6, a3
lw t6, 111(sp)
lw t7, 48(sp)
or.T t4, t6, t7
lw t6, 159(sp)
li t7, -31933754
mul a3, t6, t7
li t7, -2501962
mul t4, t4, t7
lw t7, 162(sp)
or.T t1, t1, t7
add t2, t2, t4
xor.1 t3, t3, t1
lw t6, 30(sp)
li t7, 175637890
and.1 t6, t6, t7, 13
sw t6, 84(sp)
lw t6, 84(sp)
lw t7, 30(sp)
xor.1 t1, t6, t7
li t7, -102438286
mul t3, t3, t7
add a7, a7, t2
add a3, t3, a3
add a7, a7, t0
lw t6, 231(sp)
li t7, 175637890
xor t6, t6, t7
sw t6, 159(sp)
li t7, -71259106
mul t6, t1, t7
sw t6, 12(sp)
add a3, a7, a3
lw t6, 30(sp)
li t7, 175637890
and.T t6, t6, t7, -13
sw t6, 102(sp)
add a3, a5, a3
add a4, a4, a3
lw t6, 189(sp)
li t7, -40117086
xor a3, t6, t7
add a5, a6, a4
lw t7, 30(sp)
xor t6, a3, t7
sw t6, 108(sp)
lw t7, 30(sp)
and t6, a3, t7, 13
sw t6, 87(sp)
lw t6, 159(sp)
lw t7, 108(sp)
and a4, t6, t7, 13
lw t6, 30(sp)
xor.1 t6, t6, a3
sw t6, 135(sp)
lw t7, 30(sp)
and.1 t6, a3, t7, 13
sw t6, 66(sp)
lw t6, 0(sp)
add a5, t6, a5
lw t6, 21(sp)
add a5, t6, a5
li t7, 175637890
or t6, a3, t7, -13
sw t6, 111(sp)
lw t6, 3(sp)
add t6, t6, a5
sw t6, 24(sp)
lw t6, 135(sp)
li t7, 23296112
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 24(sp)
lw t7, 30(sp)
and t6, t6, t7, 13
sw t6, 48(sp)
lw t6, 24(sp)
lw t7, 30(sp)
or.1 t6, t6, t7
sw t6, 21(sp)
lw t7, 30(sp)
or t6, a3, t7, -13
sw t6, 177(sp)
li t7, 175637890
or.T t6, a3, t7
sw t6, 45(sp)
lw t6, 24(sp)
li t7, 175637890
or.T t6, t6, t7
sw t6, 123(sp)
lw t6, 177(sp)
lw t7, 21(sp)
or a5, t6, t7, -13
lw t6, 48(sp)
li t7, 175637890
xor t0, t6, t7
lw t6, 24(sp)
or.1 t6, t6, a3
sw t6, 27(sp)
lw t6, 24(sp)
li t7, 31522855
mul a7, t6, t7
lw t6, 24(sp)
li t7, 175637890
and.1 t6, t6, t7, 13
sw t6, 141(sp)
lw t6, 141(sp)
lw t7, 102(sp)
xor.1 a6, t6, t7
or.1 a4, t0, a4
lw t6, 30(sp)
lw t7, 24(sp)
or t6, t6, t7, -13
sw t6, 9(sp)
li t7, 58740830
mul a4, a4, t7
lw t6, 24(sp)
li t7, 175637890
and t6, t6, t7, 13
sw t6, 168(sp)
lw t6, 9(sp)
lw t7, 111(sp)
and.1 t1, t6, t7, 13
lw t6, 123(sp)
lw t7, 30(sp)
xor t0, t6, t7
add a4, a4, a7
lw t6, 27(sp)
and.1 t0, t6, t0, 13
lw t6, 87(sp)
li t7, -16943872
mul a7, t6, t7
li t7, 147069109
mul t6, a3, t7
sw t6, 6(sp)
xor.1 t1, a5, t1
lw t6, 87(sp)
lw t7, 24(sp)
xor.T a5, t6, t7
li t7, 175637890
or.1 t6, a3, t7
sw t6, 18(sp)
lw t7, 30(sp)
and.T t6, a3, t7, -13
sw t6, 147(sp)
li t7, 175637890
and.T t2, a3, t7, -13
lw t6, 66(sp)
lw t7, 45(sp)
or.T t3, t6, t7
lw t6, 30(sp)
li t7, 175637890
or.T t6, t6, t7
sw t6, 174(sp)
li t7, -141271922
mul t0, t0, t7
add t0, a4, t0
and.T a4, t1, t3, -13
li t7, 35009184
mul t1, a4, t7
lw t6, 177(sp)
lw t7, 24(sp)
or.T a4, t6, t7
lw t6, 168(sp)
li t7, 175637890
or.1 t5, t6, t7
lw t7, 24(sp)
xor.T s0, t2, t7
lw t7, 12(sp)
add t2, t1, t7
li t7, -78197552
mul t1, a6, t7
lw t6, 30(sp)
li t7, 175637890
and t6, t6, t7, 13
sw t6, 153(sp)
lw t6, 18(sp)
lw t7, 48(sp)
and.1 a6, t6, t7, 13
lw t6, 24(sp)
lw t7, 174(sp)
or t4, t6, t7, -13
lw t6, 174(sp)
li t7, -183596638
mul t3, t6, t7
add t3, t3, a7
or s0, s0, a6, -13
xor a6, a3, t5
li t7, -68968663
mul a6, a6, t7
lw t6, 0(sp)
add a6, t6, a6
lw t7, 168(sp)
xor.T a7, a3, t7
li t7, -83795167
mul a7, a7, t7
add a6, t0, a6
add a6, a6, t2
xor t0, t4, s0
lw t6, 84(sp)
lw t7, 24(sp)
or t4, t6, t7, -13
li t7, -6399690
mul t2, t0, t7
lw t6, 9(sp)
slli t6, t6, 4
sw t6, 0(sp)
add t3, t1, t3
lw t6, 24(sp)
lw t7, 30(sp)
or.T t6, t6, t7
sw t6, 12(sp)
lw t6, 24(sp)
li t7, 175637890
xor.T t6, t6, t7
sw t6, 96(sp)
lw t6, 108(sp)
and t5, t6, a5, 13
lw t6, 24(sp)
or.T t6, t6, a3
sw t6, 105(sp)
lw t6, 24(sp)
lw t7, 30(sp)
and.1 t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 24(sp)
lw t7, 30(sp)
xor t6, t6, t7
sw t6, 138(sp)
lw t6, 12(sp)
lw t7, 147(sp)
or s1, t6, t7, -13
lw t6, 138(sp)
li t7, 175637890
or.1 t0, t6, t7
lw t6, 12(sp)
lw t7, 84(sp)
or.1 t1, t6, t7
lw t7, 24(sp)
xor t6, a3, t7
sw t6, 3(sp)
li t7, 175637890
xor.T t6, a3, t7
sw t6, 42(sp)
lw t6, 24(sp)
lw t7, 153(sp)
or.T s0, t6, t7
lw t6, 24(sp)
li t7, 175637890
or.1 t6, t6, t7
sw t6, 72(sp)
lw t7, 105(sp)
and.T a5, a4, t7, -13
lw t6, 12(sp)
xor.1 a4, t6, s1
xor t6, a3, a3
sw t6, 156(sp)
lw t6, 30(sp)
or.1 t6, t6, a3
sw t6, 36(sp)
lw t7, 6(sp)
add s1, a7, t7
li t7, 135592029
mul t5, t5, t7
lw t6, 24(sp)
lw t7, 96(sp)
or.1 a7, t6, t7
and.1 t4, a4, t4, 13
lw t6, 30(sp)
li t7, 175637890
xor t6, t6, t7
sw t6, 69(sp)
add a4, t2, s1
lw t7, 48(sp)
or t2, s0, t7, -13
add a4, t3, a4
li t7, 29362559
mul t3, a7, t7
add a7, a6, a4
lw t6, 156(sp)
lw t7, 69(sp)
and.T a4, t6, t7, -13
lw t7, 3(sp)
xor a6, a3, t7
lw t6, 63(sp)
lw t7, 30(sp)
and.T s0, t6, t7, -13
lw t6, 72(sp)
lw t7, 63(sp)
or.T s2, t6, t7
li t7, -66597825
mul s1, t2, t7
li t7, -168729099
mul t2, t4, t7
lw t7, 24(sp)
xor.T t6, a3, t7
sw t6, 15(sp)
or.T t0, t1, t0
lw t6, 12(sp)
or.1 t0, t6, t0
li t7, 113601158
mul t1, t0, t7
lw t6, 42(sp)
and.1 t0, t6, s2, 13
add t1, t5, t1
lw t6, 0(sp)
add t6, t6, s1
sw t6, 114(sp)
add t5, t1, t3
and.T t1, t0, s0, -13
li t7, 193412012
mul s0, a5, t7
li t7, -167011474
mul t0, a6, t7
li t7, 175637890
xor t6, a3, t7
sw t6, 81(sp)
lw t7, 24(sp)
xor.1 t6, a3, t7
sw t6, 93(sp)
li t7, -108218634
mul a5, t1, t7
lw t6, 36(sp)
lw t7, 15(sp)
xor a6, t6, t7
lw t6, 93(sp)
lw t7, 24(sp)
and t1, t6, t7, 13
lw t6, 15(sp)
lw t7, 87(sp)
or s1, t6, t7, -13
lw t6, 21(sp)
and t4, t6, a3, 13
lw t7, 9(sp)
and t3, a6, t7, 13
li t7, -164500826
add s0, s0, t7
lw t6, 21(sp)
and a6, t6, s1, 13
add t5, t5, s0
lw t6, 30(sp)
li t7, 175637890
or t6, t6, t7, -13
sw t6, 78(sp)
li t7, 85989606
mul a6, a6, t7
add s0, t2, t5
lw t6, 21(sp)
lw t7, 81(sp)
xor.T t2, t6, t7
lw t6, 24(sp)
lw t7, 30(sp)
xor.T t5, t6, t7
add t6, a7, s0
sw t6, 117(sp)
lw t6, 18(sp)
lw t7, 93(sp)
and a7, t6, t7, 13
and.T a7, a3, a7, -13
xor s0, a4, a7
lw t6, 66(sp)
li t7, -109697654
mul a4, t6, t7
xor t2, t4, t2
lw t6, 24(sp)
li t7, 175637890
xor.1 t6, t6, t7
sw t6, 150(sp)
lw t6, 78(sp)
slli a7, t6, 8
li t7, 95642777
mul t4, s0, t7
or.T t3, t1, t3
lw t6, 150(sp)
xor.1 t1, t6, a3
lw t6, 24(sp)
lw t7, 30(sp)
and.T s0, t6, t7, -13
and t5, s0, t5, 13
add t0, t0, a7
li t7, 175637890
and t5, t5, t7, 13
li t7, -117512672
mul a7, t1, t7
add t0, t0, t4
lw t6, 30(sp)
li t7, -175637890
xor.T t1, t6, t7
li t7, -31901696
mul t4, t3, t7
lw t6, 96(sp)
lw t7, 141(sp)
xor.T t3, t6, t7
and.T t2, t5, t2, -13
add t4, a5, t4
li t7, -185780939
mul t2, t2, t7
lw t6, 150(sp)
lw t7, 24(sp)
and.T a5, t6, t7, -13
li t7, 175637890
and.1 t6, a3, t7, 13
sw t6, 90(sp)
add t0, t0, t2
li t7, -147864535
mul t2, t3, t7
add a4, a4, t2
lw t6, 96(sp)
lw t7, 90(sp)
and.1 t2, t6, t7, 13
lw t6, 48(sp)
lw t7, 66(sp)
or.T s1, t6, t7
or t1, t1, a5, -13
add t3, a7, a4
lw t7, 24(sp)
and.T a5, a3, t7, -13
lw t6, 27(sp)
lw t7, 66(sp)
and t6, t6, t7, 13
sw t6, 129(sp)
li t7, 175637890
and a4, a3, t7, 13
add a6, t4, a6
lw t6, 81(sp)
li t7, 183210316
mul t6, t6, t7
sw t6, 75(sp)
and.1 s0, a5, a4, 13
lw t6, 150(sp)
lw t7, 48(sp)
or t4, t6, t7, -13
lw t6, 24(sp)
lw t7, 36(sp)
and.1 a7, t6, t7, 13
li t7, 143825595
mul t5, a7, t7
li t7, -155178187
mul a7, s1, t7
lw t6, 30(sp)
lw t7, 24(sp)
xor.1 s1, t6, t7
lw t6, 24(sp)
li t7, 175637890
or t6, t6, t7, -13
sw t6, 39(sp)
xor.T s1, t4, s1
xor.T t4, a3, a4
add a6, a6, t0
add t6, a6, t3
sw t6, 9(sp)
lw t6, 39(sp)
li t7, -89546934
mul a6, t6, t7
li t7, 173064325
mul t3, t4, t7
lw t6, 111(sp)
li t7, -74970753
mul t4, t6, t7
lw t6, 30(sp)
li t7, -24835365
mul s2, t6, t7
li t7, 44832423
mul t0, s1, t7
lw t6, 30(sp)
li t7, 175637890
xor.T t6, t6, t7
sw t6, 180(sp)
lw t6, 96(sp)
lw t7, 177(sp)
or s1, t6, t7, -13
or.1 s0, t2, s0
lw t6, 141(sp)
lw t7, 39(sp)
or.T t2, t6, t7
lw t6, 3(sp)
lw t7, 27(sp)
or.1 t6, t6, t7
sw t6, 57(sp)
lw t6, 69(sp)
xor.T s1, t6, s1
lw t6, 180(sp)
lw t7, 174(sp)
or s4, t6, t7, -13
lw t6, 30(sp)
and.1 s3, t6, t2, 13
add t2, t5, s2
lw t6, 30(sp)
xor.T t6, t6, a3
sw t6, 120(sp)
lw t6, 24(sp)
li t7, 175637890
and.T t6, t6, t7, -13
sw t6, 132(sp)
lw t7, 132(sp)
or.T t1, t1, t7
or.T s2, s4, a3
lw t6, 27(sp)
li t7, -64133606
mul t6, t6, t7
sw t6, 0(sp)
li t7, -177993357
mul s5, t1, t7
lw t6, 126(sp)
lw t7, 69(sp)
or.T t6, t6, t7
sw t6, 54(sp)
lw t6, 81(sp)
lw t7, 63(sp)
or.T t1, t6, t7
li t7, 53492204
mul s6, s0, t7
lw t6, 78(sp)
xor.T s4, t6, a5
lw t6, 120(sp)
lw t7, 147(sp)
xor.T t6, t6, t7
sw t6, 6(sp)
li t7, -147736352
mul t5, s3, t7
add t3, t3, t5
add s0, t3, t4
lw t6, 108(sp)
lw t7, 72(sp)
and.T t5, t6, t7, -13
lw t6, 6(sp)
lw t7, 129(sp)
xor.T t4, t6, t7
add t3, s6, s5
add a7, t3, a7
lw t6, 132(sp)
li t7, -85261670
mul t3, t6, t7
xor.1 s2, s2, s1
li t7, -67069678
mul t4, t4, t7
li t7, 175637890
xor.1 s5, a5, t7
lw t7, 24(sp)
xor.1 s3, s4, t7
lw t7, 87(sp)
xor.T s1, a3, t7
li t7, -31919284
mul s2, s2, t7
and.1 s3, a5, s3, 13
add a6, t3, a6
add a6, a6, t0
lw t7, 75(sp)
add s4, a6, t7
li t7, -184279950
mul t0, s5, t7
li t7, -175637890
and t3, a5, t7, 13
lw t6, 9(sp)
add a7, t6, a7
li t7, -175637890
xor.1 a6, a4, t7
add t2, s4, t2
lw t6, 156(sp)
and.1 s4, t6, s3, 13
lw t6, 24(sp)
and s3, t6, a3, 13
lw t7, 3(sp)
or.1 t6, s3, t7
sw t6, 75(sp)
lw t6, 114(sp)
add a7, t6, a7
add t2, t2, s0
add t2, t2, s2
lw t6, 48(sp)
li t7, -16065371
mul t6, t6, t7
sw t6, 9(sp)
or t5, s1, t5, -13
xor.T s0, t5, t1
lw t6, 18(sp)
lw t7, 39(sp)
and t5, t6, t7, 13
li t7, -58957629
mul t1, s4, t7
lw t6, 57(sp)
and.T s0, t6, s0, -13
li t7, -86744027
mul s1, s0, t7
lw t6, 177(sp)
lw t7, 72(sp)
or.T s0, t6, t7
li t7, 57281415
mul s2, s3, t7
add t4, t4, s2
lw t7, 0(sp)
add s2, t4, t7
add s1, s1, t1
lw t6, 102(sp)
lw t7, 30(sp)
or.1 t4, t6, t7
lw t6, 174(sp)
lw t7, 21(sp)
or.1 t1, t6, t7
lw t6, 36(sp)
lw t7, 123(sp)
xor.1 s6, t6, t7
add s5, s2, s1
xor.T s4, a4, a6
lw t6, 18(sp)
lw t7, 87(sp)
and.T s3, t6, t7, -13
lw t7, 78(sp)
xor.1 s1, s6, t7
li t7, 120904828
mul a6, t4, t7
li t7, -177772021
mul s2, s1, t7
lw t6, 135(sp)
lw t7, 78(sp)
and.T s1, t6, t7, -13
lw t6, 54(sp)
xor.1 t3, t6, t3
li t7, 164505744
mul t4, s3, t7
lw t6, 123(sp)
xor t3, t6, t3
lw t6, 42(sp)
lw t7, 105(sp)
xor s6, t6, t7
add t0, t4, t0
li t7, -34473257
mul t4, t5, t7
lw t6, 135(sp)
lw t7, 132(sp)
and.1 s3, t6, t7, 13
add t5, s5, t0
xor.1 t0, a5, s0
add t5, t2, t5
and.1 t3, t3, s4, 13
li t7, 149496486
mul t2, s6, t7
li t7, 98919488
mul t3, t3, t7
add a7, a7, t5
lw t6, 48(sp)
li t7, -154438075
mul t6, t6, t7
sw t6, 0(sp)
li t7, 139493181
add t3, t3, t7
lw t6, 75(sp)
li t7, -164626959
mul s4, t6, t7
li t7, -56775304
mul s5, t0, t7
add t3, t3, s2
lw t6, 69(sp)
lw t7, 231(sp)
or s2, t6, t7, -13
li t7, -151189809
mul t5, s1, t7
and.T t0, a4, a3, -13
lw t7, 177(sp)
and.T s0, a5, t7, -13
lw t6, 168(sp)
or.T s6, t6, t1
lw t6, 45(sp)
lw t7, 108(sp)
or.T s1, t6, t7
or.1 t1, a4, s3
li t7, 175637890
xor.1 a4, a3, t7
lw t6, 141(sp)
li t7, 175637890
and.T a5, t6, t7, -13
li t7, 52764492
mul s7, t1, t7
add t1, t4, s4
add s3, s5, t1
li t7, -167742624
mul s2, s2, t7
lw t6, 36(sp)
lw t7, 138(sp)
xor.1 t1, t6, t7
lw t6, 135(sp)
li t7, 68696778
mul t6, t6, t7
sw t6, 48(sp)
lw t7, 21(sp)
or.1 s4, s6, t7
lw t6, 9(sp)
add s5, t6, s7
lw t7, 168(sp)
xor.T t4, s1, t7
add s1, a6, s5
li t7, 169827499
mul a6, s4, t7
add t2, a6, t2
li t7, 90325720
mul a6, s0, t7
add t2, t2, s2
add t2, s3, t2
add a6, t5, a6
add t5, t3, s1
lw t6, 90(sp)
li t7, -137073940
mul t3, t6, t7
add a7, a7, t5
add a7, a7, t2
lw t6, 6(sp)
li t7, -51108285
mul t2, t6, t7
lw t6, 117(sp)
add t6, t6, a7
sw t6, 9(sp)
and.1 a7, t0, t4, 13
lw t6, 123(sp)
xor t0, t6, a7
lw t7, 24(sp)
and.1 a7, a3, t7, 13
lw t6, 111(sp)
or.T s1, t6, a3
li t7, 179563120
mul t4, t0, t7
lw t6, 108(sp)
li t7, -17725154
mul t0, t6, t7
lw t6, 111(sp)
lw t7, 24(sp)
xor s3, t6, t7
lw t6, 177(sp)
lw t7, 63(sp)
or.T t5, t6, t7
lw t6, 180(sp)
lw t7, 24(sp)
and.1 s2, t6, t7, 13
lw t6, 27(sp)
lw t7, 87(sp)
or s0, t6, t7, -13
or s2, t1, s2, -13
xor t1, s3, s1
xor.1 a4, a5, a4
li t7, -111584985
mul a5, a4, t7
lw t6, 24(sp)
lw t7, 24(sp)
xor a4, t6, t7
li t7, -293829
mul t1, t1, t7
li t7, -44923664
mul s1, s2, t7
add a5, t4, a5
lw t7, 0(sp)
add a5, a5, t7
and.1 t5, a7, t5, 13
add s2, t3, a5
li t7, 24767138
mul t4, s0, t7
lw t6, 87(sp)
lw t7, 147(sp)
xor.1 a5, t6, t7
lw t6, 24(sp)
lw t7, 81(sp)
or.T t6, t6, t7
sw t6, 54(sp)
lw t6, 24(sp)
lw t7, 12(sp)
and t3, t6, t7, 13
add a6, a6, s2
add a6, a6, t2
add t0, t0, s1
li t7, 151205120
mul t2, t5, t7
li t7, 175637890
or a4, a4, t7, -13
add t0, t1, t0
add t2, t2, t4
and.T t4, a3, a4, -13
lw t6, 96(sp)
or.T t1, t6, a7
lw t6, 24(sp)
or a4, t6, a3, -13
xor.T t3, t3, a4
lw t6, 21(sp)
lw t7, 96(sp)
and s0, t6, t7, 13
lw t6, 45(sp)
li t7, -175637890
xor a7, t6, t7
li t7, -55520208
mul s1, t4, t7
lw t7, 45(sp)
or.1 t4, a4, t7
li t7, -8843412
mul t5, t4, t7
lw t6, 168(sp)
li t7, -109977848
mul t4, t6, t7
lw t7, 150(sp)
xor s0, s0, t7
li t7, -90623071
mul t3, t3, t7
add t3, t3, s1
li t7, -83419929
mul s1, s0, t7
lw t6, 102(sp)
lw t7, 18(sp)
or.1 s0, t6, t7
lw t6, 159(sp)
xor.1 s3, t6, s0
lw t6, 27(sp)
li t7, 175637890
or.1 s2, t6, t7
li t7, -114029404
mul s0, a3, t7
lw t6, 12(sp)
xor s4, t6, s3
add s3, t2, t3
lw t6, 111(sp)
and.T t2, t6, a7, -13
lw t6, 12(sp)
lw t7, 177(sp)
and.1 a7, t6, t7, 13
li t7, 9292045
mul t3, s2, t7
li t7, -116346323
mul s2, s4, t7
add s2, s1, s2
add t0, t0, s3
lw t6, 48(sp)
add s1, t6, t0
add t5, s2, t5
xor.T t0, a5, t1
lw t6, 30(sp)
li t7, 175637890
or.1 t1, t6, t7
add a6, a6, s1
add a5, t4, s0
add t6, a6, t5
sw t6, 12(sp)
lw t7, 30(sp)
xor.1 t1, t1, t7
lw t6, 102(sp)
lw t7, 21(sp)
xor.T t5, t6, t7
lw t6, 39(sp)
li t7, 148182958
mul s0, t6, t7
lw t6, 180(sp)
lw t7, 87(sp)
or.1 a6, t6, t7
lw t6, 90(sp)
lw t7, 24(sp)
or.1 s2, t6, t7
lw t6, 36(sp)
lw t7, 120(sp)
and t4, t6, t7, 13
li t7, -38425868
mul s1, t5, t7
lw t7, 45(sp)
and.1 t5, s2, t7, 13
lw t6, 153(sp)
xor.T s2, t6, t5
lw t6, 42(sp)
lw t7, 6(sp)
or t5, t6, t7, -13
lw t7, 66(sp)
and.1 t1, t1, t7, 13
and.T t2, t2, t0, -13
add t0, s1, s0
add t0, t0, t3
li t7, -160069230
mul t3, t2, t7
li t7, 83364324
mul s1, t1, t7
or a6, a7, a6, -13
li t7, -97205574
mul s0, a6, t7
li t7, 99836478
mul t2, s2, t7
lw t6, 102(sp)
li t7, -175637890
xor.T t1, t6, t7
lw t6, 39(sp)
lw t7, 81(sp)
xor.1 a7, t6, t7
li t7, 147325551
mul a6, a3, t7
lw t7, 231(sp)
and a7, a7, t7, 13
add s3, a5, t2
lw t6, 21(sp)
and s2, t6, t4, 13
li t7, 34912102
mul a5, t5, t7
lw t6, 84(sp)
lw t7, 132(sp)
or.1 t4, t6, t7
lw t6, 30(sp)
lw t7, 102(sp)
and t2, t6, t7, 13
add t5, s1, s3
lw t6, 24(sp)
li t7, 175637890
xor s1, t6, t7
lw t7, 15(sp)
and.T t4, t4, t7, -13
add t3, t3, t5
add t5, t3, s0
lw t6, 93(sp)
lw t7, 30(sp)
and t3, t6, t7, 13
lw t7, 135(sp)
xor s0, s2, t7
li t7, 134850624
mul s0, s0, t7
add s0, s0, a5
li t7, -78727297
mul s1, s1, t7
li t7, -163154569
mul a5, a7, t7
add a7, s0, s1
add a7, t0, a7
li t7, 125291109
xor.1 t6, a3, t7
sw t6, 0(sp)
add a7, t5, a7
lw t6, 12(sp)
add a7, t6, a7
lw t6, 9(sp)
add a7, t6, a7
or.1 t0, t4, t1
li t7, -58173715
mul t0, t0, t7
lw t7, 24(sp)
or t1, t3, t7, -13
lw t6, 138(sp)
xor.1 a4, t6, a4
li t7, 125291109
xor.T t6, a3, t7
sw t6, 57(sp)
lw t6, 102(sp)
xor.1 t2, t6, t2
lw t6, 54(sp)
xor t1, t6, t1
li t7, -71787940
mul t2, t2, t7
li t7, -37546279
mul t1, t1, t7
add t0, t0, t1
lw t7, 3(sp)
and.1 t1, a3, t7, 13
add t2, t2, a6
li t7, 125291109
or.T t6, a3, t7
sw t6, 42(sp)
lw t6, 105(sp)
li t7, 72684078
mul a6, t6, t7
li t7, 125291109
xor t6, a3, t7
sw t6, 66(sp)
add t0, t0, t2
lw t6, 108(sp)
or.T t2, t6, a3
lw t6, 168(sp)
or.1 t3, t6, t1
li t7, 75419298
mul t1, t2, t7
xor a4, a4, t3
lw t6, 171(sp)
li t7, 125291109
and.T t6, t6, t7, -13
sw t6, 9(sp)
slli t2, a4, 8
lw t6, 57(sp)
lw t7, 66(sp)
xor.T a4, t6, t7
lw t6, 0(sp)
lw t7, 42(sp)
xor.T t6, t6, t7
sw t6, 75(sp)
li t7, 125291109
or.1 t6, a3, t7
sw t6, 81(sp)
add t1, t2, t1
add a6, a6, t1
add t0, t0, a6
lw t6, 75(sp)
and.T a4, t6, a4, -13
lw t6, 81(sp)
xor.1 a6, t6, a3
add t0, a5, t0
li t7, 22737811
mul a5, a4, t7
lw t6, 42(sp)
xor.1 a4, t6, a3
lw t6, 171(sp)
xor t6, t6, a3
sw t6, 78(sp)
add t6, a7, t0
sw t6, 36(sp)
and.T t0, a3, a6, -13
lw t6, 171(sp)
li t7, 125291109
or t6, t6, t7, -13
sw t6, 63(sp)
lw t6, 75(sp)
or a7, t6, a3, -13
li t7, 4053053
mul t6, a3, t7
sw t6, 3(sp)
lw t6, 63(sp)
lw t7, 57(sp)
and a6, t6, t7, 13
lw t6, 78(sp)
li t7, 125291109
or t1, t6, t7, -13
li t7, 125291109
or t6, a3, t7, -13
sw t6, 93(sp)
li t7, 119284531
mul t0, t0, t7
lw t6, 81(sp)
lw t7, 75(sp)
and.T t6, t6, t7, -13
sw t6, 39(sp)
lw t6, 93(sp)
lw t7, 66(sp)
and t2, t6, t7, 13
lw t7, 39(sp)
or.T a4, a4, t7
lw t6, 9(sp)
or t3, t6, a3, -13
li t7, 91413385
mul t4, a4, t7
li t7, -104764076
mul a4, t1, t7
add t1, a5, t4
lw t7, 93(sp)
xor.1 a5, a7, t7
add t6, t1, t0
sw t6, 15(sp)
xor a7, t3, t2
lw t7, 60(sp)
or.1 a6, a6, t7
li t7, -167209254
mul t0, a5, t7
li t7, 53393102
mul a5, a7, t7
li t7, 31690090
mul a6, a6, t7
add t0, t0, a6
lw t6, 231(sp)
li t7, 125291109
or a7, t6, t7, -13
lw t7, 171(sp)
or.T t6, a3, t7
sw t6, 54(sp)
lw t7, 171(sp)
or.1 t6, a3, t7
sw t6, 12(sp)
lw t6, 93(sp)
or.1 t6, t6, a3
sw t6, 48(sp)
lw t6, 81(sp)
li t7, 52020013
mul a6, t6, t7
add a5, a5, t0
lw t6, 12(sp)
li t7, 125291109
or.T t0, t6, t7
lw t6, 171(sp)
and.1 t6, t6, a3, 13
sw t6, 69(sp)
lw t6, 69(sp)
lw t7, 171(sp)
or.T t1, t6, t7
or.T a7, a7, t1
li t7, -10670687
mul t6, a3, t7
sw t6, 30(sp)
li t7, 22281087
mul t1, a7, t7
lw t7, 57(sp)
xor.T t2, a3, t7
lw t6, 69(sp)
lw t7, 48(sp)
xor.1 a7, t6, t7
lw t7, 54(sp)
or.T t0, t0, t7
li t7, -185871243
mul a7, a7, t7
li t7, -140766038
mul t0, t0, t7
lw t7, 171(sp)
xor.T t6, a3, t7
sw t6, 6(sp)
li t7, -91084716
mul t6, a3, t7
sw t6, 84(sp)
lw t6, 6(sp)
lw t7, 81(sp)
and.T t3, t6, t7, -13
xor.T t3, t3, a3
li t7, 8780235
mul t3, t3, t7
li t7, 18379741
mul t4, t2, t7
lw t6, 93(sp)
xor.T t2, t6, a3
lw t7, 3(sp)
add t3, t3, t7
add t1, t1, t4
add a6, a6, t1
li t7, 125291109
and t6, a3, t7, 13
sw t6, 21(sp)
lw t7, 12(sp)
and t6, a3, t7, 13
sw t6, 3(sp)
add a5, a5, a6
add a6, a4, a5
add a4, t0, a7
add a5, a4, t3
lw t7, 171(sp)
xor.1 a4, a3, t7
li t7, -138865615
mul t0, t2, t7
lw t6, 15(sp)
add t6, t6, a6
sw t6, 45(sp)
lw t6, 171(sp)
and a6, t6, a4, 13
lw t7, 21(sp)
and.T t6, a3, t7, -13
sw t6, 87(sp)
lw t6, 6(sp)
li t7, 14861324
mul t1, t6, t7
lw t6, 171(sp)
li t7, 125291109
xor.T t6, t6, t7
sw t6, 15(sp)
lw t7, 0(sp)
or.1 a6, a6, t7
lw t6, 66(sp)
slli a7, t6, 6
lw t7, 231(sp)
or a6, a6, t7, -13
li t7, 31580079
mul t2, a6, t7
lw t6, 171(sp)
and.T t6, t6, a3, -13
sw t6, 96(sp)
li t7, -67832782
mul a6, a4, t7
add t0, t0, t2
lw t6, 171(sp)
li t7, 125291109
or.T t6, t6, t7
sw t6, 27(sp)
lw t6, 87(sp)
lw t7, 15(sp)
or.1 t2, t6, t7
lw t6, 171(sp)
li t7, 125291109
xor.1 t6, t6, t7
sw t6, 18(sp)
lw t6, 171(sp)
and t6, t6, a3, 13
sw t6, 90(sp)
li t7, 50082525
mul t2, t2, t7
lw t7, 69(sp)
xor t4, a3, t7
add t2, t2, t1
lw t6, 231(sp)
lw t7, 39(sp)
or t5, t6, t7, -13
lw t6, 27(sp)
lw t7, 75(sp)
or.1 t1, t6, t7
lw t6, 171(sp)
li t7, 125291109
and.1 t6, t6, t7, 13
sw t6, 72(sp)
lw t6, 93(sp)
lw t7, 15(sp)
and.T s1, t6, t7, -13
lw t6, 156(sp)
lw t7, 18(sp)
xor.1 t3, t6, t7
li t7, 93524170
mul s0, t1, t7
lw t6, 6(sp)
lw t7, 27(sp)
xor.T t1, t6, t7
and.T t5, t5, s1, -13
lw t6, 9(sp)
lw t7, 54(sp)
and s1, t6, t7, 13
lw t6, 75(sp)
or t4, t6, t4, -13
li t7, -6249436
mul s1, s1, t7
li t7, 78605128
mul t4, t4, t7
lw t6, 30(sp)
add s0, t6, s0
add a7, a7, s1
add t0, s0, t0
lw t6, 84(sp)
add t0, t6, t0
add t6, a5, t0
sw t6, 9(sp)
li t7, 76216095
mul t0, t5, t7
lw t6, 0(sp)
lw t7, 72(sp)
or.T a5, t6, t7
lw t7, 171(sp)
or t6, a3, t7, -13
sw t6, 30(sp)
add t4, t0, t4
lw t6, 57(sp)
li t7, 188048110
mul t0, t6, t7
lw t6, 93(sp)
and t3, t6, t3, 13
li t7, 49309689
mul a5, a5, t7
lw t6, 90(sp)
xor.T t5, t6, a3
add t4, t2, t4
li t7, 96416057
mul t2, t3, t7
lw t7, 30(sp)
or.1 t5, t5, t7
lw t6, 156(sp)
lw t7, 30(sp)
xor t3, t6, t7
add a6, a6, t4
lw t6, 12(sp)
lw t7, 171(sp)
and t4, t6, t7, 13
li t7, -51102296
mul s0, t5, t7
lw t6, 69(sp)
lw t7, 156(sp)
xor.1 t5, t6, t7
li t7, 154737949
mul s1, t4, t7
xor.T t1, t1, t3
xor.1 t1, t1, t5
li t7, 80318904
mul t1, t1, t7
lw t6, 21(sp)
li t7, 192239536
mul t5, t6, t7
lw t6, 39(sp)
lw t7, 93(sp)
xor t4, t6, t7
lw t6, 3(sp)
lw t7, 78(sp)
xor t3, t6, t7
or.1 t4, t4, a4
li t7, 118758832
mul t4, t4, t7
add a5, a5, s1
add a5, s0, a5
add a5, t2, a5
lw t7, 42(sp)
and s0, a3, t7, 13
add t2, a7, a5
lw t7, 69(sp)
and.T a5, a3, t7, -13
lw t6, 231(sp)
lw t7, 42(sp)
or a7, t6, t7, -13
lw t6, 6(sp)
or s0, t6, s0, -13
add t0, t0, t5
add t6, a6, t2
sw t6, 54(sp)
lw t6, 27(sp)
lw t7, 93(sp)
and.T a6, t6, t7, -13
li t7, -122092491
mul t5, s0, t7
lw t6, 48(sp)
li t7, -7818471
mul t2, t6, t7
li t7, -88767136
mul t3, t3, t7
add s0, t3, t4
li t7, -132754228
mul t3, a6, t7
li t7, -128101563
mul t4, a7, t7
add a7, s0, t0
lw t6, 30(sp)
li t7, 92922437
mul a6, t6, t7
add t6, t1, a7
sw t6, 3(sp)
li t7, 154693152
add t0, t5, t7
lw t6, 39(sp)
lw t7, 156(sp)
and.1 t1, t6, t7, 13
lw t6, 171(sp)
li t7, 125291109
or.1 t6, t6, t7
sw t6, 48(sp)
lw t6, 96(sp)
li t7, 170149465
mul a7, t6, t7
li t7, 4336022
mul t5, t1, t7
li t7, 50406490
mul t1, a3, t7
add t3, t3, t5
add t3, t3, t4
li t7, -147565793
mul t4, a5, t7
add t1, t3, t1
add t3, t4, t1
lw t6, 0(sp)
li t7, 81584335
mul t1, t6, t7
add t0, t0, t3
lw t6, 171(sp)
li t7, 125291109
xor t3, t6, t7
add t1, t1, t2
lw t6, 90(sp)
lw t7, 60(sp)
and.T t2, t6, t7, -13
xor.1 t4, t3, a3
lw t6, 39(sp)
lw t7, 6(sp)
or t3, t6, t7, -13
li t7, -189744675
mul t2, t2, t7
lw t6, 48(sp)
li t7, 125291109
and t5, t6, t7, 13
li t7, -167938330
mul s1, t5, t7
lw t6, 90(sp)
lw t7, 171(sp)
xor t5, t6, t7
lw t7, 57(sp)
and.T s2, t4, t7, -13
lw t6, 171(sp)
li t7, 125291109
and t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 66(sp)
lw t7, 90(sp)
xor.T t4, t6, t7
li t7, 88692825
mul s0, t4, t7
xor.T s3, a3, t3
lw t6, 0(sp)
lw t7, 12(sp)
and t3, t6, t7, 13
lw t6, 156(sp)
li t7, 125291109
and t4, t6, t7, 13
xor.T s4, a4, s2
lw t7, 231(sp)
and s2, a4, t7, 13
li t7, 7107234
mul s4, s4, t7
lw t6, 39(sp)
li t7, 117587683
mul s5, t6, t7
li t7, -33591930
mul a4, s3, t7
li t7, -87656584
mul t5, t5, t7
add s1, s1, s5
add t2, s4, t2
add a6, a6, s1
add a7, a6, a7
lw t6, 57(sp)
and a6, t6, s2, 13
li t7, -80728914
mul a6, a6, t7
add s0, a7, s0
lw t6, 42(sp)
xor a7, t6, a5
add a5, s0, t1
add t0, t0, a5
li t7, -48016626
mul t3, t3, t7
lw t7, 12(sp)
and t4, t4, t7, 13
lw t6, 12(sp)
slli a5, t6, 8
lw t6, 96(sp)
li t7, 72147746
mul t1, t6, t7
lw t6, 3(sp)
add s0, t6, t0
lw t6, 60(sp)
lw t7, 69(sp)
or.T t0, t6, t7
lw t6, 54(sp)
add s0, t6, s0
add t6, t3, t5
sw t6, 54(sp)
li t7, 71938287
mul t4, t4, t7
lw t6, 6(sp)
lw t7, 42(sp)
and.T t3, t6, t7, -13
li t7, -190797273
mul t3, t3, t7
li t7, 51863217
mul t5, a7, t7
lw t6, 9(sp)
add a7, t6, s0
lw t6, 45(sp)
add a7, t6, a7
add t6, a7, t2
sw t6, 3(sp)
add a7, t4, t1
add a6, a6, t5
lw t6, 87(sp)
li t7, -192106527
mul t6, t6, t7
sw t6, 45(sp)
add t1, a4, a6
li t7, 104942589
mul a6, t0, t7
lw t6, 0(sp)
li t7, -125291109
xor a4, t6, t7
li t7, -108510384
mul t6, a4, t7
sw t6, 60(sp)
lw t6, 18(sp)
li t7, 9352692
mul a4, t6, t7
add a7, a7, t3
add a5, a5, a7
lw t6, 75(sp)
lw t7, 30(sp)
or.T a7, t6, t7
add a5, a5, a6
lw t7, 6(sp)
and.T a6, a7, t7, -13
li t7, 39733621
mul t0, a6, t7
lw t6, 12(sp)
lw t7, 39(sp)
or.T a7, t6, t7
lw t6, 12(sp)
li t7, -61315867
mul t2, t6, t7
lw t6, 63(sp)
lw t7, 90(sp)
or.T a6, t6, t7
lw t6, 75(sp)
xor t3, t6, a3
add a5, t1, a5
lw t6, 75(sp)
lw t7, 96(sp)
and t1, t6, t7, 13
and.1 t3, a3, t3, 13
li t7, -18325589
mul t4, t1, t7
lw t6, 81(sp)
li t7, 89262537
mul t1, t6, t7
lw t7, 66(sp)
and.1 t5, a3, t7, 13
lw t7, 93(sp)
xor.T t3, t3, t7
add t2, t2, t4
li t7, 1796261
mul t6, t5, t7
sw t6, 9(sp)
lw t6, 0(sp)
lw t7, 171(sp)
xor.1 t5, t6, t7
li t7, -130894792
mul t3, t3, t7
add t4, t2, t3
lw t6, 18(sp)
lw t7, 0(sp)
xor t2, t6, t7
lw t6, 75(sp)
lw t7, 156(sp)
or.T t3, t6, t7
li t7, 146824600
mul t5, t5, t7
add t1, t5, t1
lw t6, 12(sp)
li t7, -132365545
mul t5, t6, t7
add t4, t4, t5
add t5, t0, t4
lw t6, 6(sp)
slli t4, t6, 8
li t7, -123788834
mul a7, a7, t7
lw t6, 30(sp)
li t7, 125291109
xor s0, t6, t7
li t7, -77699811
mul t3, t3, t7
lw t6, 78(sp)
lw t7, 66(sp)
xor.1 t0, t6, t7
lw t6, 66(sp)
and t2, t6, t2, 13
add a4, a4, t5
and.1 t5, a6, s0, 13
add a6, t3, t4
add a6, t1, a6
lw t6, 60(sp)
add a4, t6, a4
li t7, -134697023
mul t1, t5, t7
lw t6, 45(sp)
add t3, t6, a4
lw t7, 81(sp)
or.1 t0, t0, t7
li t7, -137990382
mul a4, t2, t7
li t7, 94738629
mul t0, t0, t7
add t6, a5, t3
sw t6, 0(sp)
add t0, t0, a7
lw t7, 48(sp)
xor.1 a7, a3, t7
lw t6, 75(sp)
lw t7, 156(sp)
or.1 a5, t6, t7
add t0, t1, t0
add a6, a6, t0
li t7, 86743278
mul t0, a3, t7
li t7, 96190415
mul a5, a5, t7
add a6, a6, t0
lw t6, 90(sp)
xor.1 t0, t6, a7
lw t6, 81(sp)
lw t7, 93(sp)
xor a7, t6, t7
slli t0, t0, 5
lw t6, 72(sp)
or t1, t6, a3, -13
li t7, -154849249
mul t2, a7, t7
lw t6, 78(sp)
xor.T a7, t6, t1
add t0, t0, t2
add a5, a5, t0
add a5, a6, a5
add a4, a4, a5
lw t6, 9(sp)
add a4, t6, a4
lw t7, 15(sp)
and.T t1, a3, t7, -13
lw t6, 63(sp)
lw t7, 12(sp)
or a6, t6, t7, -13
li t7, 180250381
mul a7, a7, t7
lw t7, 66(sp)
xor.T t0, a3, t7
lw t6, 6(sp)
li t7, 66294901
mul a5, t6, t7
lw t6, 72(sp)
lw t7, 39(sp)
and.1 t2, t6, t7, 13
lw t6, 66(sp)
or.T t1, t6, t1
li t7, -46444993
mul t4, t1, t7
lw t6, 156(sp)
and t3, t6, a3, 13
lw t6, 63(sp)
li t7, 125291109
xor t1, t6, t7
add a3, a7, t4
and.1 t0, t0, t2, 13
and.T a6, a6, t3, -13
lw t7, 57(sp)
xor.T a7, a6, t7
li t7, 71475345
mul a6, t0, t7
add a6, a3, a6
lw t6, 81(sp)
lw t7, 39(sp)
xor.1 a3, t6, t7
lw t6, 69(sp)
and.T t0, t6, t1, -13
lw t7, 171(sp)
and.1 t0, t0, t7, 13
and t0, a7, t0, 13
lw t6, 27(sp)
lw t7, 75(sp)
and.T t2, t6, t7, -13
lw t6, 78(sp)
li t7, 81990552
mul a7, t6, t7
lw t6, 90(sp)
lw t7, 42(sp)
xor.T t1, t6, t7
li t7, -40768611
mul t3, t0, t7
li t7, -131783405
mul t1, t1, t7
li t7, 26598967
mul t0, a3, t7
add t3, a5, t3
li t7, 39183673
mul a5, t2, t7
lw t6, 90(sp)
li t7, 17048713
mul a3, t6, t7
add a6, a6, t3
add a6, a4, a6
lw t6, 96(sp)
li t7, -160599812
mul a4, t6, t7
lw t6, 144(sp)
li t7, -20609491
xor t6, t6, t7
sw t6, 72(sp)
add a7, a7, t1
lw t6, 0(sp)
add a6, t6, a6
lw t6, 21(sp)
lw t7, 171(sp)
and.T t1, t6, t7, -13
add a7, a7, t0
lw t6, 36(sp)
lw t7, 36(sp)
xor t6, t6, t7
sw t6, 18(sp)
li t7, 84626854
mul t0, t1, t7
add a5, a5, t0
lw t6, 144(sp)
li t7, -20609491
xor.T t6, t6, t7
sw t6, 108(sp)
add a5, a7, a5
lw t6, 144(sp)
li t7, -20609491
or t6, t6, t7, -13
sw t6, 12(sp)
add a5, a6, a5
add a3, a5, a3
lw t6, 54(sp)
add a3, t6, a3
add a3, a3, a4
lw t6, 3(sp)
add t6, t6, a3
sw t6, 90(sp)
lw t6, 144(sp)
li t7, -20609491
xor.1 t6, t6, t7
sw t6, 57(sp)
lw t6, 144(sp)
li t7, -20609491
or.1 t6, t6, t7
sw t6, 48(sp)
lw t6, 90(sp)
lw t7, 90(sp)
xor t6, t6, t7
sw t6, 210(sp)
lw t6, 72(sp)
li t7, 36296560
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 144(sp)
li t7, -20609491
and t6, t6, t7, 13
sw t6, 78(sp)
lw t6, 144(sp)
li t7, 85712234
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 90(sp)
lw t7, 36(sp)
xor t6, t6, t7
sw t6, 129(sp)
lw t6, 129(sp)
lw t7, 24(sp)
xor a4, t6, t7
lw t6, 129(sp)
lw t7, 129(sp)
xor t6, t6, t7
sw t6, 84(sp)
li t7, -188518346
xor t6, a4, t7
sw t6, 243(sp)
lw t6, 144(sp)
or.1 t6, t6, a4
sw t6, 120(sp)
xor t6, a4, a4
sw t6, 87(sp)
lw t6, 144(sp)
xor.T t6, t6, a4
sw t6, 66(sp)
lw t7, 144(sp)
and t6, a4, t7, 13
sw t6, 15(sp)
lw t6, 144(sp)
and.1 t6, t6, a4, 13
sw t6, 81(sp)
li t7, -20609491
and.T t6, a4, t7, -13
sw t6, 93(sp)
lw t6, 72(sp)
lw t7, 120(sp)
and.1 a3, t6, t7, 13
lw t7, 144(sp)
xor t6, a4, t7
sw t6, 117(sp)
lw t6, 81(sp)
lw t7, 66(sp)
or.1 t6, t6, t7
sw t6, 63(sp)
li t7, -188518346
or.T a5, a4, t7
lw t6, 63(sp)
and.T a3, t6, a3, -13
lw t7, 144(sp)
xor.1 t6, a4, t7
sw t6, 54(sp)
lw t7, 87(sp)
and.1 t6, a5, t7, 13
sw t6, 111(sp)
li t7, -20609491
or.T t6, a4, t7
sw t6, 75(sp)
lw t6, 144(sp)
and.T t6, t6, a4, -13
sw t6, 114(sp)
lw t6, 93(sp)
lw t7, 117(sp)
or t6, t6, t7, -13
sw t6, 21(sp)
lw t7, 15(sp)
xor.T a6, a3, t7
li t7, -20609491
and.1 a3, a4, t7, 13
lw t6, 87(sp)
lw t7, 108(sp)
xor.T a5, t6, t7
li t7, 48891536
mul t0, a6, t7
lw t6, 108(sp)
lw t7, 81(sp)
xor.1 a6, t6, t7
lw t6, 78(sp)
li t7, 73163931
mul t6, t6, t7
sw t6, 123(sp)
lw t6, 144(sp)
and.1 t2, t6, a5, 13
lw t6, 54(sp)
lw t7, 12(sp)
xor a5, t6, t7
li t7, -20609491
xor t6, a4, t7
sw t6, 105(sp)
lw t7, 63(sp)
xor.T a5, a5, t7
li t7, 32269083
mul a5, a5, t7
lw t6, 87(sp)
and.T t1, t6, a3, -13
lw t7, 144(sp)
or t6, a4, t7, -13
sw t6, 60(sp)
li t7, -20609491
xor.1 t6, a4, t7
sw t6, 96(sp)
lw t7, 63(sp)
or.1 t6, a4, t7
sw t6, 45(sp)
lw t6, 60(sp)
lw t7, 231(sp)
or t5, t6, t7, -13
li t7, -20609491
or.1 a7, a3, t7
lw t7, 96(sp)
or t4, a4, t7, -13
li t7, 72359734
mul t3, t1, t7
li t7, -20609491
and t6, a4, t7, 13
sw t6, 132(sp)
lw t7, 132(sp)
xor t6, a4, t7
sw t6, 27(sp)
li t7, -92306414
mul s0, a6, t7
lw t6, 117(sp)
lw t7, 57(sp)
or a6, t6, t7, -13
lw t6, 75(sp)
lw t7, 45(sp)
and s1, t6, t7, 13
lw t6, 81(sp)
lw t7, 15(sp)
xor.T t6, t6, t7
sw t6, 69(sp)
li t7, -95460895
mul t1, a4, t7
li t7, -10791531
mul s2, t4, t7
or.T a6, a3, a6
lw t7, 54(sp)
xor.T t4, a3, t7
lw t7, 63(sp)
xor.1 t5, t5, t7
li t7, 103607222
mul t2, t2, t7
add t0, t0, s0
lw t7, 108(sp)
xor t6, a3, t7
sw t6, 39(sp)
li t7, 173313769
mul s1, s1, t7
lw t6, 3(sp)
add s2, t6, s2
lw t6, 96(sp)
lw t7, 108(sp)
or.1 s0, t6, t7
li t7, -20609491
xor.T t6, a4, t7
sw t6, 30(sp)
add t0, t0, t3
add t6, s1, s2
sw t6, 6(sp)
lw t6, 105(sp)
lw t7, 105(sp)
xor t3, t6, t7
add a5, t0, a5
lw t7, 15(sp)
or t0, t3, t7, -13
add t6, a5, t2
sw t6, 126(sp)
li t7, -148166509
mul t2, t5, t7
lw t7, 81(sp)
or.1 t3, a3, t7
lw t6, 120(sp)
and t6, t6, a4, 13
sw t6, 102(sp)
or.T t5, s0, a7
li t7, 28052710
mul a5, t4, t7
lw t6, 117(sp)
lw t7, 132(sp)
and.1 t4, t6, t7, 13
lw t6, 72(sp)
lw t7, 48(sp)
and.T a7, t6, t7, -13
lw t7, 144(sp)
or.1 s1, t3, t7
add t3, t1, t2
lw t6, 105(sp)
lw t7, 78(sp)
and.T t6, t6, t7, -13
sw t6, 9(sp)
lw t6, 144(sp)
li t7, -20609491
and.T t6, t6, t7, -13
sw t6, 3(sp)
li t7, -104990941
mul t1, t5, t7
lw t7, 57(sp)
or.T s0, t4, t7
li t7, 99628270
mul t2, s1, t7
lw t6, 114(sp)
lw t7, 12(sp)
xor.1 t5, t6, t7
li t7, 77668035
mul s1, a6, t7
li t7, 55061205
mul a6, a4, t7
li t7, -20609491
or t6, a4, t7, -13
sw t6, 42(sp)
lw t6, 21(sp)
lw t7, 27(sp)
and.T t4, t6, t7, -13
li t7, -65542008
mul t4, t4, t7
lw t7, 42(sp)
and.T t6, a4, t7, -13
sw t6, 27(sp)
li t7, -71765513
mul t6, a4, t7
sw t6, 21(sp)
lw t6, 123(sp)
add s3, t6, s1
li t7, -29288961
mul s1, t0, t7
li t7, -74016623
mul t0, t5, t7
lw t6, 42(sp)
lw t7, 114(sp)
xor.1 s2, t6, t7
lw t6, 69(sp)
li t7, -94953072
mul t5, t6, t7
li t7, -37028734
mul s0, s0, t7
add t3, t3, s3
li t7, -20609491
or.1 t6, a4, t7
sw t6, 123(sp)
lw t6, 39(sp)
lw t7, 231(sp)
and s3, t6, t7, 13
add t6, t3, s1
sw t6, 69(sp)
lw t7, 75(sp)
xor.T t3, s2, t7
li t7, 71085868
mul s1, s3, t7
add s1, t2, s1
lw t6, 45(sp)
xor.T t2, t6, a7
add t1, t1, s0
lw t6, 30(sp)
lw t7, 54(sp)
xor.T a7, t6, t7
add a5, a5, s1
add t6, a5, t4
sw t6, 39(sp)
lw t6, 66(sp)
lw t7, 105(sp)
xor.1 t4, t6, t7
lw t6, 120(sp)
lw t7, 93(sp)
xor.T a5, t6, t7
li t7, -41343110
mul t4, t4, t7
add t5, t5, t4
li t7, 179754932
mul s1, t2, t7
lw t6, 27(sp)
li t7, 136011018
mul t2, t6, t7
lw t6, 66(sp)
lw t7, 123(sp)
xor.T s2, t6, t7
lw t6, 75(sp)
lw t7, 60(sp)
and.1 t4, t6, t7, 13
lw t6, 102(sp)
and a7, t6, a7, 13
or.1 s0, t3, a7
add t3, a6, s1
lw t7, 144(sp)
xor.1 s1, s2, t7
add a6, t0, t5
li t7, -126194144
mul t5, a5, t7
li t7, -102248437
mul t6, a4, t7
sw t6, 45(sp)
lw t6, 114(sp)
lw t7, 117(sp)
and t0, t6, t7, 13
lw t6, 57(sp)
or.1 a7, t6, a3
lw t7, 3(sp)
and s0, s0, t7, 13
lw t6, 9(sp)
and a5, t6, s1, 13
xor.T s1, t4, a4
lw t6, 42(sp)
lw t7, 96(sp)
and t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 132(sp)
and.1 t4, t6, t0, 13
slli s0, s0, 7
lw t6, 6(sp)
add t0, t6, t1
li t7, -72431472
mul t1, s1, t7
lw t6, 126(sp)
add t0, t6, t0
li t7, -953267
mul a5, a5, t7
lw t6, 21(sp)
add t5, t6, t5
add t3, t5, t3
add t3, s0, t3
lw t6, 132(sp)
lw t7, 87(sp)
xor t5, t6, t7
lw t6, 108(sp)
lw t7, 105(sp)
xor.1 s0, t6, t7
add t2, t2, t3
lw t6, 108(sp)
or.T t3, t6, s0
lw t6, 63(sp)
li t7, -20609491
and.1 s0, t6, t7, 13
li t7, -76010450
mul t3, t3, t7
li t7, 77494766
mul s0, s0, t7
add t1, t1, s0
lw t7, 0(sp)
add s0, t1, t7
lw t7, 78(sp)
or.1 t1, a4, t7
li t7, -81831959
mul t6, t4, t7
sw t6, 102(sp)
add t2, a6, t2
lw t6, 96(sp)
lw t7, 87(sp)
or.T t4, t6, t7
lw t6, 144(sp)
li t7, -20609491
and.1 t6, t6, t7, 13
sw t6, 126(sp)
or a7, a7, t5, -13
li t7, -97693539
mul a6, a4, t7
lw t6, 39(sp)
add t2, t6, t2
lw t7, 63(sp)
and.T t5, t4, t7, -13
lw t6, 126(sp)
li t7, -20609491
xor.T s3, t6, t7
lw t6, 114(sp)
li t7, 54874291
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 69(sp)
add t4, t6, t2
lw t6, 93(sp)
li t7, 41763266
mul s2, t6, t7
lw t6, 132(sp)
and.T t2, t6, a4, -13
add s1, t0, t4
xor t4, a3, a4
add s0, t3, s0
xor.1 t0, a7, s3
lw t6, 87(sp)
lw t7, 66(sp)
xor.1 t3, t6, t7
lw t7, 105(sp)
and.T a7, a3, t7, -13
li t7, -92165957
mul t0, t0, t7
lw t6, 45(sp)
add s2, t6, s2
lw t6, 93(sp)
lw t7, 57(sp)
xor t6, t6, t7
sw t6, 0(sp)
add s3, s2, s0
lw t7, 75(sp)
and t6, a4, t7, 13
sw t6, 21(sp)
lw t6, 3(sp)
and.T s0, t6, t1, -13
lw t7, 96(sp)
or s2, t5, t7, -13
add t1, a5, s3
lw t6, 30(sp)
lw t7, 63(sp)
or.1 a5, t6, t7
lw t6, 114(sp)
lw t7, 54(sp)
xor.1 t5, t6, t7
add t6, s1, t1
sw t6, 45(sp)
lw t6, 123(sp)
and.T t1, t6, t3, -13
lw t7, 111(sp)
or.T t3, s0, t7
lw t6, 144(sp)
li t7, -92109004
mul s0, t6, t7
lw t6, 75(sp)
or.1 t4, t6, t4
lw t6, 231(sp)
lw t7, 66(sp)
and s3, t6, t7, 13
and s1, t2, s2, 13
lw t7, 120(sp)
xor t2, a4, t7
li t7, -184465184
mul t3, t3, t7
lw t7, 78(sp)
or s2, t2, t7, -13
lw t6, 144(sp)
li t7, -20609491
or.T t6, t6, t7
sw t6, 6(sp)
li t7, -140563200
mul s4, t5, t7
lw t6, 6(sp)
lw t7, 30(sp)
or.T t5, t6, t7
lw t7, 21(sp)
and.1 t2, s3, t7, 13
add t6, a6, s0
sw t6, 3(sp)
li t7, -51345273
mul s0, s1, t7
li t7, -181174541
mul a6, t4, t7
lw t7, 66(sp)
or t4, a3, t7, -13
li t7, -148992249
mul s1, s2, t7
add s0, s0, s4
lw t7, 144(sp)
or s2, a3, t7, -13
lw t6, 102(sp)
add t3, t6, t3
add t3, t3, t0
lw t7, 60(sp)
or.T t0, s2, t7
lw t6, 9(sp)
add s2, t6, s1
xor.1 s1, a7, t5
li t7, 54364094
mul t5, t0, t7
add t0, s2, a6
li t7, -170308519
mul a7, t1, t7
lw t6, 126(sp)
li t7, -20609491
and t1, t6, t7, 13
add t3, t3, s0
lw t7, 96(sp)
xor.T s0, a4, t7
li t7, -60542279
mul a6, a4, t7
lw t7, 0(sp)
or s2, s0, t7, -13
li t7, 133211321
mul s3, s1, t7
and.T t1, t4, t1, -13
lw t6, 132(sp)
lw t7, 6(sp)
and.1 t4, t6, t7, 13
lw t6, 108(sp)
xor.T a5, t6, a5
li t7, 56899536
mul s1, t2, t7
li t7, 177816500
mul t6, a5, t7
sw t6, 0(sp)
xor.T a5, t4, a4
li t7, 140453046
mul s0, t1, t7
lw t6, 126(sp)
lw t7, 15(sp)
xor t1, t6, t7
add t5, s3, t5
lw t6, 132(sp)
xor.1 t4, t6, a4
and.1 s2, s2, a5, 13
lw t6, 144(sp)
li t7, -139849058
mul a5, t6, t7
lw t7, 63(sp)
and.1 s3, a4, t7, 13
lw t6, 81(sp)
li t7, -20609491
xor.T t2, t6, t7
slli s4, s2, 7
lw t7, 96(sp)
xor s2, s3, t7
add a6, a6, s4
add t5, s1, t5
add t0, t0, t5
lw t6, 144(sp)
lw t7, 93(sp)
or t5, t6, t7, -13
add t0, t3, t0
add t3, a7, s0
lw t6, 96(sp)
lw t7, 144(sp)
or.T a7, t6, t7
lw t6, 75(sp)
lw t7, 126(sp)
xor.1 s0, t6, t7
and t5, s2, t5, 13
lw t6, 96(sp)
li t7, -81390921
mul t6, t6, t7
sw t6, 9(sp)
li t7, -28760995
mul t4, t4, t7
lw t7, 3(sp)
add t3, t3, t7
li t7, -117624151
mul s0, s0, t7
lw t6, 60(sp)
or s2, t6, a3, -13
add t3, t0, t3
lw t6, 87(sp)
lw t7, 48(sp)
and s1, t6, t7, 13
li t7, -57278303
mul t6, s2, t7
sw t6, 3(sp)
lw t7, 75(sp)
and.T t1, t1, t7, -13
add t0, s0, t4
and.T t4, t1, t2, -13
li t7, -97594135
mul t1, a4, t7
li t7, -3452076
mul s0, s1, t7
lw t6, 81(sp)
xor t2, t6, a4
or t4, t4, t5, -13
li t7, -94130729
mul t5, t4, t7
li t7, 101482267
mul a7, a7, t7
lw t6, 60(sp)
li t7, 33540901
mul t6, t6, t7
sw t6, 66(sp)
lw t6, 96(sp)
lw t7, 123(sp)
xor t4, t6, t7
add a7, s0, a7
lw t6, 0(sp)
add t5, t6, t5
lw t7, 21(sp)
xor t2, t2, t7
add a5, a5, t5
add a5, a6, a5
add t6, t3, a5
sw t6, 0(sp)
lw t6, 105(sp)
lw t7, 60(sp)
xor.T a6, t6, t7
li t7, -181972509
mul t2, t2, t7
li t7, -57824951
mul t4, t4, t7
lw t6, 96(sp)
lw t7, 63(sp)
xor.T a5, t6, t7
add t3, t1, t0
lw t6, 105(sp)
lw t7, 60(sp)
or.1 t0, t6, t7
lw t7, 96(sp)
and.T t1, a4, t7, -13
lw t7, 57(sp)
or.T s0, a4, t7
lw t6, 144(sp)
slli t5, t6, 2
xor.1 s2, t1, a3
li t7, 57997633
mul s1, s0, t7
lw t6, 54(sp)
or t1, t6, a4, -13
li t7, -92812540
mul s2, s2, t7
lw t6, 132(sp)
lw t7, 231(sp)
or s0, t6, t7, -13
add t4, s2, t4
add t4, t4, s1
add s1, t2, t4
lw t6, 114(sp)
lw t7, 93(sp)
xor.1 t4, t6, t7
add t2, a7, t3
or a7, a5, s0, -13
add a5, t5, s1
lw t6, 231(sp)
lw t7, 120(sp)
and t5, t6, t7, 13
li t7, 135859450
mul a7, a7, t7
lw t6, 3(sp)
add t6, t6, t2
sw t6, 39(sp)
lw t6, 60(sp)
lw t7, 48(sp)
or t3, t6, t7, -13
lw t6, 144(sp)
lw t7, 108(sp)
and t2, t6, t7, 13
and t2, t2, t5, 13
xor.T t2, t1, t2
lw t6, 15(sp)
lw t7, 30(sp)
and.1 t1, t6, t7, 13
xor.1 t4, t4, a3
lw t7, 114(sp)
xor.1 t5, a4, t7
xor.T t0, t3, t0
lw t7, 231(sp)
and t1, t1, t7, 13
lw t6, 120(sp)
xor.1 t3, t6, a6
lw t6, 144(sp)
and.1 s0, t6, a3, 13
lw t6, 60(sp)
li t7, -20609491
xor a6, t6, t7
lw t7, 231(sp)
or s1, s0, t7, -13
li t7, 146679200
mul s0, t4, t7
lw t6, 42(sp)
lw t7, 60(sp)
xor.1 t4, t6, t7
lw t7, 123(sp)
or.T t5, t5, t7
li t7, -187609039
mul t2, t2, t7
li t7, 154925303
mul t6, t5, t7
sw t6, 21(sp)
li t7, -110718098
mul t5, s1, t7
lw t6, 123(sp)
li t7, -137006412
mul t6, t6, t7
sw t6, 3(sp)
add t5, s0, t5
li t7, 141039343
mul t6, a4, t7
sw t6, 30(sp)
lw t6, 231(sp)
and a4, t6, t3, 13
or.1 t0, t0, a4
xor a4, t1, t4
add a7, a7, t2
lw t6, 60(sp)
li t7, 137630597
mul t6, t6, t7
sw t6, 48(sp)
li t7, -133756175
mul t0, t0, t7
add t1, t5, t0
lw t6, 117(sp)
li t7, -20609491
xor.T t0, t6, t7
add t2, a7, t1
lw t6, 63(sp)
lw t7, 93(sp)
or.1 t1, t6, t7
lw t6, 93(sp)
lw t7, 144(sp)
xor.T a7, t6, t7
li t7, -50798960
mul t3, a4, t7
add a4, a5, t2
lw t6, 66(sp)
add a5, t6, t3
lw t6, 105(sp)
lw t7, 117(sp)
xor.T t2, t6, t7
xor.T t0, t0, t1
add a4, a4, a5
lw t6, 114(sp)
and.1 t1, t6, t2, 13
lw t6, 39(sp)
add a5, t6, a4
li t7, -179944825
mul a4, t1, t7
lw t6, 12(sp)
lw t7, 15(sp)
xor.1 t1, t6, t7
lw t6, 27(sp)
or.T t2, t6, a7
lw t6, 87(sp)
lw t7, 231(sp)
or t3, t6, t7, -13
lw t6, 9(sp)
add a5, t6, a5
xor a7, t1, a6
li t7, 85531933
mul t0, t0, t7
lw t6, 54(sp)
xor t1, t6, t3
lw t6, 75(sp)
and t2, t6, t2, 13
lw t6, 144(sp)
lw t7, 126(sp)
or.T t4, t6, t7
lw t6, 120(sp)
lw t7, 123(sp)
xor a6, t6, t7
li t7, -158654134
mul t3, t2, t7
lw t6, 6(sp)
lw t7, 60(sp)
and.1 t2, t6, t7, 13
lw t6, 36(sp)
lw t7, 189(sp)
or t6, t6, t7, -13
sw t6, 222(sp)
and.T s0, t4, a3, -13
lw t6, 87(sp)
li t7, 165444722
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 75(sp)
li t7, -51713819
mul t4, t6, t7
lw t6, 42(sp)
lw t7, 108(sp)
or a3, t6, t7, -13
lw t7, 51(sp)
and.1 t5, a3, t7, 13
lw t6, 144(sp)
lw t7, 117(sp)
and.1 a3, t6, t7, 13
and s1, a7, s0, 13
lw t7, 30(sp)
add s0, t3, t7
lw t6, 132(sp)
lw t7, 144(sp)
xor.1 a7, t6, t7
li t7, 11725614
mul t1, t1, t7
li t7, -64604974
mul s1, s1, t7
lw t7, 87(sp)
or.1 t3, t5, t7
add t6, s0, t4
sw t6, 30(sp)
li t7, -114613365
mul t6, t2, t7
sw t6, 9(sp)
lw t7, 3(sp)
add t2, s1, t7
lw t7, 21(sp)
add t1, t1, t7
lw t6, 243(sp)
lw t7, 243(sp)
xor t6, t6, t7
sw t6, 297(sp)
lw t7, 48(sp)
add t4, t1, t7
lw t6, 126(sp)
lw t7, 72(sp)
xor.T t1, t6, t7
add t0, t4, t0
add t0, t0, a4
lw t6, 222(sp)
li t7, -93531386
mul t6, t6, t7
sw t6, 237(sp)
li t7, 135508056
mul a4, t3, t7
li t7, -86753466
add t0, t0, t7
add t6, a5, t0
sw t6, 27(sp)
lw t6, 105(sp)
lw t7, 96(sp)
or.1 a5, t6, t7
add t6, t2, a4
sw t6, 21(sp)
lw t6, 243(sp)
lw t7, 99(sp)
and.T t6, t6, t7, -13
sw t6, 48(sp)
lw t6, 36(sp)
li t7, 176972493
or t6, t6, t7, -13
sw t6, 93(sp)
and.1 a4, a6, a5, 13
lw t6, 15(sp)
or a4, t6, a4, -13
lw t6, 189(sp)
li t7, 176972493
xor.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 189(sp)
andi a6, t6, 0
lw t6, 96(sp)
lw t7, 15(sp)
or.1 a5, t6, t7
lw t7, 144(sp)
xor a5, a5, t7
and.1 a5, a5, t1, 13
li t7, 2675100
mul a4, a4, t7
xor.1 t0, a3, a5
lw t6, 36(sp)
li t7, 176972493
and t6, t6, t7, 13
sw t6, 195(sp)
lw t6, 15(sp)
and.T a5, t6, a7, -13
lw t6, 36(sp)
li t7, 176972493
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 60(sp)
li t7, 145952774
mul a3, t6, t7
lw t6, 36(sp)
lw t7, 189(sp)
xor.T t6, t6, t7
sw t6, 207(sp)
lw t6, 189(sp)
lw t7, 36(sp)
and.T t6, t6, t7, -13
sw t6, 96(sp)
li t7, -152442508
mul t6, a6, t7
sw t6, 72(sp)
lw t6, 18(sp)
lw t7, 39(sp)
and.T t6, t6, t7, -13
sw t6, 15(sp)
lw t6, 36(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 81(sp)
lw t6, 207(sp)
lw t7, 81(sp)
or.T t6, t6, t7
sw t6, 111(sp)
lw t6, 96(sp)
li t7, 188755299
mul t6, t6, t7
sw t6, 3(sp)
li t7, 171711826
mul a6, t0, t7
lw t6, 114(sp)
add a7, t6, a6
lw t6, 36(sp)
lw t7, 189(sp)
or.T t6, t6, t7
sw t6, 183(sp)
li t7, -37205325
mul a6, a5, t7
lw t7, 6(sp)
add a7, a7, t7
lw t6, 189(sp)
li t7, 176972493
and t6, t6, t7, 13
sw t6, 216(sp)
lw t6, 36(sp)
li t7, 176972493
or.T a5, t6, t7
add a4, a4, a6
add a3, a7, a3
lw t6, 36(sp)
li t7, 176972493
and.T t6, t6, t7, -13
sw t6, 6(sp)
lw t6, 36(sp)
li t7, 176972493
xor t6, t6, t7
sw t6, 75(sp)
lw t6, 36(sp)
li t7, 176972493
or.1 t6, t6, t7
sw t6, 225(sp)
lw t6, 75(sp)
li t7, -88465729
mul t6, t6, t7
sw t6, 12(sp)
add a3, a4, a3
lw t6, 189(sp)
lw t7, 225(sp)
and t6, t6, t7, 13
sw t6, 153(sp)
li t7, 36548397
mul t6, a5, t7
sw t6, 177(sp)
lw t6, 36(sp)
lw t7, 189(sp)
or.1 t6, t6, t7
sw t6, 117(sp)
lw t6, 189(sp)
li t7, 176972493
or.1 t6, t6, t7
sw t6, 213(sp)
lw t6, 36(sp)
lw t7, 189(sp)
and.1 t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 117(sp)
li t7, -14576895
mul a4, t6, t7
lw t6, 36(sp)
li t7, -165286352
mul a5, t6, t7
add t6, a4, a5
sw t6, 78(sp)
lw t6, 9(sp)
add a3, t6, a3
lw t6, 21(sp)
add a3, t6, a3
lw t6, 30(sp)
add a3, t6, a3
lw t6, 27(sp)
add a3, t6, a3
lw t6, 0(sp)
add a3, t6, a3
lw t6, 42(sp)
li t7, 73509762
mul t6, t6, t7
sw t6, 87(sp)
lw t6, 45(sp)
add t6, t6, a3
sw t6, 234(sp)
lw t6, 243(sp)
lw t7, 234(sp)
and t6, t6, t7, 13
sw t6, 267(sp)
lw t6, 234(sp)
lw t7, 243(sp)
or.1 t6, t6, t7
sw t6, 318(sp)
lw t6, 234(sp)
lw t7, 243(sp)
and.1 t6, t6, t7, 13
sw t6, 168(sp)
lw t6, 243(sp)
lw t7, 234(sp)
xor.1 t6, t6, t7
sw t6, 303(sp)
lw t6, 234(sp)
lw t7, 243(sp)
or.T t6, t6, t7
sw t6, 114(sp)
lw t6, 243(sp)
lw t7, 234(sp)
and.T t6, t6, t7, -13
sw t6, 186(sp)
lw t6, 234(sp)
lw t7, 243(sp)
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 243(sp)
lw t7, 234(sp)
or t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 231(sp)
lw t7, 186(sp)
and a4, t6, t7, 13
lw t6, 243(sp)
lw t7, 168(sp)
and.T t6, t6, t7, -13
sw t6, 102(sp)
lw t6, 234(sp)
lw t7, 243(sp)
xor.T t6, t6, t7
sw t6, 51(sp)
lw t6, 168(sp)
lw t7, 234(sp)
xor.1 a3, t6, t7
lw t6, 168(sp)
lw t7, 243(sp)
or t6, t6, t7, -13
sw t6, 240(sp)
lw t6, 99(sp)
lw t7, 234(sp)
or a5, t6, t7, -13
lw t6, 168(sp)
lw t7, 243(sp)
and t6, t6, t7, 13
sw t6, 126(sp)
lw t7, 48(sp)
xor.T a5, a5, t7
lw t6, 168(sp)
li t7, 176972493
xor.T t6, t6, t7
sw t6, 57(sp)
lw t6, 303(sp)
and.T a5, t6, a5, -13
lw t6, 267(sp)
and t6, t6, a5, 13
sw t6, 105(sp)
lw t6, 105(sp)
xor.1 t6, t6, a4
sw t6, 288(sp)
lw t6, 243(sp)
lw t7, 168(sp)
xor.T t6, t6, t7
sw t6, 69(sp)
lw t6, 168(sp)
lw t7, 243(sp)
or.T t6, t6, t7
sw t6, 159(sp)
lw t6, 168(sp)
lw t7, 36(sp)
xor t6, t6, t7
sw t6, 174(sp)
lw t6, 168(sp)
lw t7, 168(sp)
xor t6, t6, t7
sw t6, 21(sp)
lw t6, 168(sp)
lw t7, 243(sp)
xor.1 t6, t6, t7
sw t6, 171(sp)
lw t7, 102(sp)
or.1 t6, a3, t7
sw t6, 60(sp)
lw t6, 36(sp)
lw t7, 168(sp)
or.T t6, t6, t7
sw t6, 48(sp)
lw t6, 36(sp)
lw t7, 168(sp)
or t6, t6, t7, -13
sw t6, 198(sp)
lw t6, 168(sp)
li t7, 176972493
or t6, t6, t7, -13
sw t6, 108(sp)
lw t6, 108(sp)
li t7, 171024517
mul a3, t6, t7
lw t6, 216(sp)
lw t7, 174(sp)
and.1 a4, t6, t7, 13
lw t6, 243(sp)
lw t7, 168(sp)
xor t6, t6, t7
sw t6, 219(sp)
lw t6, 48(sp)
lw t7, 36(sp)
and a6, t6, t7, 13
lw t6, 189(sp)
lw t7, 168(sp)
or.T t6, t6, t7
sw t6, 192(sp)
lw t6, 168(sp)
li t7, 176972493
xor t6, t6, t7
sw t6, 27(sp)
lw t6, 192(sp)
lw t7, 195(sp)
and.T a5, t6, t7, -13
lw t6, 36(sp)
lw t7, 168(sp)
xor.1 t6, t6, t7
sw t6, 147(sp)
lw t6, 189(sp)
lw t7, 168(sp)
and.1 t6, t6, t7, 13
sw t6, 135(sp)
lw t6, 168(sp)
lw t7, 189(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 168(sp)
li t7, 176972493
and.1 t6, t6, t7, 13
sw t6, 141(sp)
lw t6, 168(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 9(sp)
lw t6, 15(sp)
or.1 a7, t6, a5
lw t6, 135(sp)
lw t7, 57(sp)
or.T t0, t6, t7
lw t6, 123(sp)
lw t7, 192(sp)
or.1 a5, t6, t7
lw t6, 36(sp)
lw t7, 27(sp)
or t2, t6, t7, -13
lw t6, 141(sp)
lw t7, 198(sp)
and.1 t1, t6, t7, 13
lw t6, 66(sp)
li t7, 61660599
mul t6, t6, t7
sw t6, 150(sp)
lw t6, 93(sp)
or t2, t6, t2, -13
lw t6, 168(sp)
lw t7, 36(sp)
and t6, t6, t7, 13
sw t6, 144(sp)
or.1 t1, t1, t2
and.1 a6, a6, a7, 13
lw t6, 96(sp)
lw t7, 48(sp)
and.1 a7, t6, t7, 13
lw t6, 168(sp)
li t7, 176972493
or.T t6, t6, t7
sw t6, 99(sp)
lw t6, 36(sp)
lw t7, 168(sp)
and.1 t6, t6, t7, 13
sw t6, 156(sp)
lw t6, 168(sp)
lw t7, 36(sp)
and.T t6, t6, t7, -13
sw t6, 15(sp)
li t7, 111964710
mul t2, t1, t7
lw t6, 183(sp)
lw t7, 156(sp)
or.T t3, t6, t7
slli t1, a6, 7
or.T a6, a4, t0
lw t6, 189(sp)
li t7, 176972493
or.T t6, t6, t7
sw t6, 30(sp)
lw t6, 144(sp)
or.T t0, t6, t3
add a3, t2, a3
lw t6, 213(sp)
li t7, -173719008
mul t6, t6, t7
sw t6, 201(sp)
lw t7, 93(sp)
or a4, a5, t7, -13
add t6, t1, a3
sw t6, 0(sp)
li t7, -180538444
mul a4, a4, t7
lw t6, 168(sp)
lw t7, 96(sp)
xor.T t2, t6, t7
lw t6, 99(sp)
li t7, -185031270
mul t1, t6, t7
lw t6, 147(sp)
lw t7, 213(sp)
or.1 a5, t6, t7
lw t6, 189(sp)
lw t7, 9(sp)
or a3, t6, t7, -13
lw t6, 216(sp)
or.1 t3, t6, a6
lw t6, 21(sp)
lw t7, 57(sp)
xor.T a6, t6, t7
li t7, -130159644
mul t4, t3, t7
slli a7, a7, 3
lw t6, 168(sp)
lw t7, 36(sp)
or.1 t6, t6, t7
sw t6, 45(sp)
lw t7, 6(sp)
and t3, a3, t7, 13
lw t6, 78(sp)
add a3, t6, a7
lw t6, 72(sp)
add t6, t6, t4
sw t6, 132(sp)
lw t6, 207(sp)
lw t7, 156(sp)
and.1 t4, t6, t7, 13
lw t6, 111(sp)
xor t0, t6, t0
lw t6, 168(sp)
li t7, 176972493
or.1 t6, t6, t7
sw t6, 228(sp)
lw t6, 174(sp)
li t7, 176972493
and.T t6, t6, t7, -13
sw t6, 120(sp)
lw t7, 15(sp)
and a7, t2, t7, 13
li t7, -75374397
mul t0, t0, t7
lw t7, 3(sp)
add t2, t1, t7
lw t6, 45(sp)
lw t7, 147(sp)
or t1, t6, t7, -13
lw t6, 189(sp)
lw t7, 36(sp)
and t6, t6, t7, 13
sw t6, 138(sp)
li t7, -124667140
mul a7, a7, t7
add a4, t2, a4
lw t6, 15(sp)
xor t3, t6, t3
lw t6, 153(sp)
and t2, t6, t4, 13
li t7, -83743660
mul t3, t3, t7
add t0, t0, t3
li t7, 143254493
mul t4, t1, t7
lw t6, 30(sp)
and t3, t6, a5, 13
lw t6, 189(sp)
li t7, 176972493
and.T t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 192(sp)
lw t7, 228(sp)
or.T a5, t6, t7
lw t7, 198(sp)
xor.T a6, a6, t7
lw t6, 3(sp)
li t7, 6099448
mul t6, t6, t7
sw t6, 180(sp)
lw t6, 168(sp)
lw t7, 189(sp)
xor.T t6, t6, t7
sw t6, 153(sp)
lw t6, 222(sp)
li t7, 176972493
or.1 t1, t6, t7
li t7, 129481743
mul t5, t2, t7
lw t7, 177(sp)
add t2, t4, t7
lw t6, 12(sp)
add t4, t6, t5
lw t6, 168(sp)
li t7, 176972493
and.T t6, t6, t7, -13
sw t6, 177(sp)
lw t7, 228(sp)
xor t3, t3, t7
lw t6, 135(sp)
li t7, 24496526
mul t6, t6, t7
sw t6, 111(sp)
add t0, t0, t4
li t7, -70073524
mul t3, t3, t7
add a3, t2, a3
lw t6, 9(sp)
lw t7, 177(sp)
or t2, t6, t7, -13
add a7, a7, t3
lw t6, 201(sp)
add t4, t6, a7
lw t6, 39(sp)
lw t7, 135(sp)
xor.1 t3, t6, t7
li t7, -133769047
mul t6, t1, t7
sw t6, 201(sp)
lw t6, 168(sp)
lw t7, 189(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
lw t6, 177(sp)
lw t7, 222(sp)
xor.1 t6, t6, t7
sw t6, 246(sp)
add a4, a4, t0
lw t6, 198(sp)
lw t7, 189(sp)
and.T a7, t6, t7, -13
lw t6, 150(sp)
add t0, t6, a4
add t1, a3, t4
lw t6, 138(sp)
lw t7, 12(sp)
or a4, t6, t7, -13
lw t6, 57(sp)
lw t7, 42(sp)
xor.T a3, t6, t7
lw t6, 48(sp)
lw t7, 3(sp)
or t6, t6, t7, -13
sw t6, 78(sp)
xor.1 a5, a5, a4
lw t6, 66(sp)
or.1 a6, t6, a6
li t7, 176972493
xor t4, t2, t7
lw t6, 189(sp)
li t7, 176972493
or t6, t6, t7, -13
sw t6, 72(sp)
lw t6, 6(sp)
lw t7, 75(sp)
and.T a4, t6, t7, -13
lw t6, 18(sp)
and s0, t6, t3, 13
lw t6, 120(sp)
lw t7, 72(sp)
and.1 t6, t6, t7, 13
sw t6, 204(sp)
li t7, -53113880
mul t2, a6, t7
lw t6, 174(sp)
lw t7, 153(sp)
and.1 a6, t6, t7, 13
lw t6, 36(sp)
and a6, t6, a6, 13
lw t6, 6(sp)
xor.1 t5, t6, t4
lw t6, 72(sp)
lw t7, 108(sp)
xor.T t3, t6, t7
li t7, 112650270
mul t4, s0, t7
li t7, -29707319
mul t6, a7, t7
sw t6, 120(sp)
lw t6, 132(sp)
add a7, t6, t0
lw t7, 87(sp)
add t6, t1, t7
sw t6, 132(sp)
lw t6, 0(sp)
add t1, t6, a7
lw t6, 222(sp)
lw t7, 36(sp)
and.T a7, t6, t7, -13
li t7, 36379109
mul t0, t5, t7
lw t7, 180(sp)
add t0, t0, t7
lw t6, 237(sp)
add t6, t6, t1
sw t6, 180(sp)
li t7, -93666062
mul t1, a6, t7
lw t6, 18(sp)
lw t7, 216(sp)
and.1 t5, t6, t7, 13
lw t6, 183(sp)
lw t7, 222(sp)
xor.T a6, t6, t7
lw t6, 111(sp)
add t4, t6, t4
add s0, t0, t2
lw t6, 168(sp)
lw t7, 117(sp)
or.1 s1, t6, t7
and.T t5, a5, t5, -13
lw t6, 93(sp)
lw t7, 189(sp)
xor t0, t6, t7
lw t6, 3(sp)
and a5, t6, t3, 13
lw t6, 168(sp)
lw t7, 27(sp)
xor t3, t6, t7
li t7, -71592789
mul s2, a5, t7
lw t6, 6(sp)
lw t7, 147(sp)
and.T t2, t6, t7, -13
li t7, -60372402
mul a5, a7, t7
xor.T a3, a3, a4
lw t7, 189(sp)
or.T a4, a3, t7
add a3, s0, t1
lw t6, 246(sp)
and.1 s0, t6, s1, 13
add a7, t4, s2
lw t7, 33(sp)
xor.T t3, t3, t7
li t7, -190945958
mul t4, t5, t7
li t7, -189254232
mul t1, a4, t7
lw t6, 198(sp)
lw t7, 78(sp)
xor.T t5, t6, t7
lw t6, 201(sp)
add s1, t6, t4
li t7, -99775278
mul t3, t3, t7
lw t6, 189(sp)
lw t7, 177(sp)
xor.T a4, t6, t7
li t7, 151603414
mul t4, s0, t7
lw t6, 168(sp)
li t7, 176972493
and t6, t6, t7, 13
sw t6, 78(sp)
add t6, a3, s1
sw t6, 0(sp)
lw t6, 168(sp)
lw t7, 189(sp)
xor.1 t6, t6, t7
sw t6, 111(sp)
lw t6, 27(sp)
lw t7, 108(sp)
and.T a3, t6, t7, -13
li t7, 44000632
mul t6, a3, t7
sw t6, 150(sp)
lw t6, 9(sp)
lw t7, 189(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
and a3, t5, t2, 13
lw t7, 183(sp)
and.1 t0, t0, t7, 13
and.T a6, t0, a6, -13
li t7, -92571889
mul t0, a3, t7
li t7, 104930479
mul a3, a6, t7
lw t6, 156(sp)
lw t7, 168(sp)
xor s0, t6, t7
lw t6, 198(sp)
li t7, -126324795
mul t6, t6, t7
sw t6, 87(sp)
lw t6, 204(sp)
li t7, 153257940
mul a6, t6, t7
lw t6, 189(sp)
lw t7, 168(sp)
or.1 t5, t6, t7
add t3, t3, t4
lw t6, 81(sp)
lw t7, 174(sp)
and.1 t2, t6, t7, 13
lw t6, 189(sp)
li t7, 176972493
and.1 t6, t6, t7, 13
sw t6, 237(sp)
add t1, t3, t1
add t6, a7, t1
sw t6, 201(sp)
add a5, a5, t0
li t7, -136322273
mul t0, s0, t7
lw t6, 156(sp)
lw t7, 78(sp)
xor t1, t6, t7
lw t6, 111(sp)
lw t7, 237(sp)
xor a7, t6, t7
add a5, a5, t0
lw t6, 39(sp)
lw t7, 156(sp)
or.1 t0, t6, t7
lw t6, 66(sp)
lw t7, 93(sp)
and t3, t6, t7, 13
xor t1, t1, t5
li t7, 46055974
mul t6, t1, t7
sw t6, 156(sp)
lw t6, 192(sp)
li t7, 75582480
mul t6, t6, t7
sw t6, 108(sp)
li t7, -38926318
mul a7, a7, t7
and.1 t1, t3, t2, 13
lw t6, 36(sp)
lw t7, 189(sp)
xor.1 t3, t6, t7
lw t7, 225(sp)
and.T a4, a4, t7, -13
lw t6, 36(sp)
lw t7, 168(sp)
xor.T t6, t6, t7
sw t6, 33(sp)
lw t6, 213(sp)
lw t7, 45(sp)
or t2, t6, t7, -13
lw t7, 6(sp)
or.1 t4, t3, t7
li t7, -57411856
mul t1, t1, t7
li t7, -15062623
mul t2, t2, t7
add t6, t1, t2
sw t6, 204(sp)
lw t7, 36(sp)
xor t5, a4, t7
lw t6, 33(sp)
lw t7, 9(sp)
xor.1 t1, t6, t7
lw t6, 9(sp)
lw t7, 36(sp)
or.1 t2, t6, t7
li t7, -163509954
mul a4, t0, t7
li t7, 104980793
mul t5, t5, t7
lw t7, 153(sp)
and t0, t4, t7, 13
lw t7, 57(sp)
or.1 t4, t3, t7
add a6, t5, a6
add a3, a3, a5
add t3, a3, a7
li t7, 105673801
mul a5, t0, t7
lw t6, 177(sp)
lw t7, 36(sp)
and.T a3, t6, t7, -13
lw t6, 3(sp)
lw t7, 36(sp)
and t0, t6, t7, 13
lw t6, 30(sp)
lw t7, 36(sp)
or a7, t6, t7, -13
lw t6, 96(sp)
li t7, 112757032
mul t6, t6, t7
sw t6, 225(sp)
lw t7, 150(sp)
add t3, t3, t7
lw t6, 66(sp)
lw t7, 72(sp)
and.1 t6, t6, t7, 13
sw t6, 3(sp)
lw t7, 237(sp)
or.1 t2, t2, t7
and.T t1, t1, t4, -13
lw t7, 195(sp)
and.1 t2, t2, t7, 13
li t7, 49971406
mul a7, a7, t7
add a5, a7, a5
lw t6, 42(sp)
lw t7, 228(sp)
or t4, t6, t7, -13
slli a7, t1, 1
lw t7, 120(sp)
add a6, a6, t7
lw t6, 18(sp)
lw t7, 30(sp)
xor.T t1, t6, t7
lw t6, 48(sp)
lw t7, 222(sp)
or.T t5, t6, t7
li t7, 166970467
mul t6, t5, t7
sw t6, 45(sp)
li t7, -124467916
mul t1, t1, t7
add t3, a6, t3
li t7, 77483225
mul t2, t2, t7
lw t6, 15(sp)
li t7, -75160646
mul a6, t6, t7
li t7, 176972493
xor.T t0, t0, t7
lw t6, 6(sp)
xor.1 t4, t6, t4
li t7, -72041581
mul a3, a3, t7
lw t6, 189(sp)
li t7, 176972493
xor t6, t6, t7
sw t6, 120(sp)
lw t7, 108(sp)
add t5, t2, t7
lw t6, 144(sp)
li t7, -72436431
mul t6, t6, t7
sw t6, 195(sp)
lw t6, 9(sp)
and.1 t4, t6, t4, 13
lw t6, 201(sp)
add t2, t6, t3
lw t6, 111(sp)
lw t7, 222(sp)
and.1 t6, t6, t7, 13
sw t6, 108(sp)
lw t6, 87(sp)
add t3, t6, t5
add a4, a4, a5
li t7, -73150001
mul a5, t4, t7
lw t6, 168(sp)
lw t7, 153(sp)
and.1 t5, t6, t7, 13
lw t6, 204(sp)
add t4, t6, a4
lw t6, 96(sp)
or.1 a4, t6, t5
add t6, t1, a7
sw t6, 150(sp)
add t4, t3, t4
li t7, -146773628
mul t1, t0, t7
lw t6, 192(sp)
li t7, 176972493
or a7, t6, t7, -13
lw t6, 0(sp)
add t3, t6, t2
lw t7, 138(sp)
or.1 t0, a4, t7
lw t6, 156(sp)
add t6, t6, t4
sw t6, 15(sp)
lw t6, 36(sp)
li t7, 176972493
xor.T a4, t6, t7
lw t6, 120(sp)
li t7, -53199603
mul t2, t6, t7
lw t6, 99(sp)
lw t7, 189(sp)
or t4, t6, t7, -13
lw t6, 132(sp)
add t6, t6, t3
sw t6, 87(sp)
add t6, t1, a6
sw t6, 99(sp)
li t7, 158224818
mul t3, a4, t7
lw t7, 192(sp)
or a6, t4, t7, -13
lw t7, 66(sp)
xor a7, a7, t7
lw t6, 222(sp)
or.1 t1, t6, a7
lw t6, 153(sp)
lw t7, 198(sp)
and.1 a7, t6, t7, 13
add t6, t2, t3
sw t6, 18(sp)
lw t7, 3(sp)
xor.1 t0, t0, t7
lw t6, 72(sp)
li t7, 176972493
xor t3, t6, t7
lw t6, 96(sp)
lw t7, 12(sp)
and t2, t6, t7, 13
li t7, -175773731
mul t6, t3, t7
sw t6, 57(sp)
lw t7, 216(sp)
and.T t1, t1, t7, -13
li t7, -16119749
mul t0, t0, t7
lw t7, 45(sp)
add t3, t0, t7
lw t6, 75(sp)
lw t7, 36(sp)
or.T t0, t6, t7
xor.T t4, t2, a6
add a3, t3, a3
add t2, a3, a5
lw t6, 36(sp)
li t7, 176972493
and.1 t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 216(sp)
lw t7, 144(sp)
and.T a6, t6, t7, -13
li t7, -176972493
and.1 t3, a7, t7, 13
li t7, -12453531
mul t6, t1, t7
sw t6, 96(sp)
li t7, -28444149
mul t6, t4, t7
sw t6, 0(sp)
lw t6, 123(sp)
lw t7, 117(sp)
or a7, t6, t7, -13
lw t6, 144(sp)
lw t7, 81(sp)
and.T t4, t6, t7, -13
lw t6, 6(sp)
li t7, -113787387
mul a3, t6, t7
lw t6, 111(sp)
lw t7, 30(sp)
and.1 t5, t6, t7, 13
lw t6, 189(sp)
lw t7, 168(sp)
and.T t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 168(sp)
and.1 t1, t6, a4, 13
lw t6, 138(sp)
li t7, -127635398
mul a5, t6, t7
lw t6, 192(sp)
or.T s0, t6, a4
lw t6, 225(sp)
add a4, t6, t2
lw t6, 42(sp)
lw t7, 75(sp)
and.1 t6, t6, t7, 13
sw t6, 3(sp)
and t2, t0, t3, 13
and t3, t4, t5, 13
lw t6, 48(sp)
lw t7, 141(sp)
xor t0, t6, t7
li t7, 72903151
mul t6, t2, t7
sw t6, 75(sp)
lw t6, 135(sp)
xor.T t4, t6, s0
lw t6, 45(sp)
lw t7, 27(sp)
or.T t2, t6, t7
lw t7, 117(sp)
xor.T t5, t2, t7
lw t6, 150(sp)
add a4, t6, a4
lw t6, 39(sp)
lw t7, 12(sp)
xor.T s0, t6, t7
lw t6, 168(sp)
li t7, 176972493
xor.1 t2, t6, t7
lw t6, 189(sp)
li t7, 176972493
xor.T t6, t6, t7
sw t6, 48(sp)
lw t6, 108(sp)
xor.1 t1, t6, t1
ori t3, t3, 0
lw t6, 168(sp)
xor.T a6, t6, a6
or.1 t5, s0, t5
xor.T t4, t0, t4
li t7, -143372373
mul t0, a7, t7
li t7, 94706145
mul t1, t1, t7
li t7, -27505373
mul t5, t5, t7
li t7, 183075141
mul a7, t4, t7
li t7, 166313844
mul t4, a6, t7
slli a6, t2, 3
li t7, -153726124
mul t3, t3, t7
lw t6, 15(sp)
add t6, t6, a4
sw t6, 15(sp)
add a4, a3, t5
lw t6, 9(sp)
lw t7, 198(sp)
and t2, t6, t7, 13
add t3, a5, t3
lw t6, 72(sp)
lw t7, 207(sp)
or.1 a3, t6, t7
lw t6, 36(sp)
lw t7, 222(sp)
xor.T a5, t6, t7
add a4, a7, a4
add t3, t3, t4
lw t7, 195(sp)
add a4, a4, t7
lw t6, 135(sp)
lw t7, 144(sp)
xor.T a7, t6, t7
lw t6, 6(sp)
lw t7, 33(sp)
xor.T t4, t6, t7
add t6, t3, t0
sw t6, 72(sp)
lw t6, 57(sp)
add t3, t6, t1
and.T t1, a5, t2, -13
lw t7, 36(sp)
xor t2, t4, t7
lw t6, 39(sp)
lw t7, 189(sp)
and.T t5, t6, t7, -13
lw t6, 78(sp)
lw t7, 177(sp)
xor.1 t0, t6, t7
lw t6, 3(sp)
li t7, 117094117
mul t6, t6, t7
sw t6, 33(sp)
lw t6, 6(sp)
lw t7, 168(sp)
xor t4, t6, t7
lw t6, 177(sp)
lw t7, 168(sp)
xor s0, t6, t7
lw t6, 174(sp)
li t7, 143365570
mul a5, t6, t7
lw t7, 75(sp)
add s1, t3, t7
lw t7, 168(sp)
and.1 t3, t2, t7, 13
lw t7, 111(sp)
xor.1 t2, t5, t7
li t7, 185814585
mul t1, t1, t7
li t7, -191598550
mul t3, t3, t7
add t1, a6, t1
and.T a6, s0, t2, -13
lw t6, 0(sp)
add t5, t6, s1
li t7, 70640881
mul t2, a6, t7
lw t6, 9(sp)
lw t7, 117(sp)
xor.1 a6, t6, t7
lw t6, 18(sp)
add s0, t6, t5
lw t6, 120(sp)
lw t7, 48(sp)
xor.1 t5, t6, t7
lw t6, 168(sp)
and s1, t6, t4, 13
lw t6, 96(sp)
add t4, t6, s0
li t7, -105487019
mul a7, a7, t7
or.1 s1, t0, s1
lw t6, 45(sp)
lw t7, 168(sp)
xor.T t0, t6, t7
lw t6, 138(sp)
li t7, -157367055
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 147(sp)
lw t7, 36(sp)
and s0, t6, t7, 13
lw t7, 183(sp)
or s0, s0, t7, -13
lw t6, 27(sp)
or.T s2, t6, t5
lw t6, 99(sp)
add s3, t6, t4
li t7, 176972493
and.T t4, a3, t7, -13
lw t6, 93(sp)
and.T t5, t6, s1, -13
add a3, s3, a4
li t7, 11544913
mul a4, s2, t7
add a4, t3, a4
lw t6, 15(sp)
add t3, t6, a3
li t7, 134573892
mul a3, s0, t7
li t7, -16442052
mul t5, t5, t7
add t6, t1, a4
sw t6, 3(sp)
add a4, t2, t5
lw t6, 39(sp)
lw t7, 27(sp)
and.T t5, t6, t7, -13
lw t6, 141(sp)
lw t7, 42(sp)
and.T t1, t6, t7, -13
lw t6, 87(sp)
add t3, t6, t3
lw t6, 213(sp)
li t7, -10159987
mul t2, t6, t7
add t2, a5, t2
lw t7, 228(sp)
or a5, t5, t7, -13
lw t6, 180(sp)
add t6, t6, t3
sw t6, 0(sp)
lw t6, 33(sp)
add a4, t6, a4
li t7, -12837980
mul a5, a5, t7
add a4, a4, a7
and.1 t3, t0, t4, 13
lw t6, 45(sp)
lw t7, 42(sp)
xor.T t0, t6, t7
lw t6, 237(sp)
lw t7, 168(sp)
or.T t4, t6, t7
lw t6, 144(sp)
lw t7, 153(sp)
and.T a7, t6, t7, -13
xor.T a6, t4, a6
li t7, -190574919
mul t3, t3, t7
lw t6, 138(sp)
li t7, 73591475
mul t4, t6, t7
add t2, t4, t2
lw t6, 147(sp)
lw t7, 12(sp)
xor.T t5, t6, t7
li t7, 53876322
mul t4, t1, t7
add t3, a3, t3
lw t6, 51(sp)
lw t7, 51(sp)
xor t6, t6, t7
sw t6, 132(sp)
li t7, -9808904
mul a3, t5, t7
add t1, a5, a3
li t7, 57028395
mul a5, t0, t7
add a3, t2, t4
li t7, 111053880
mul a6, a6, t7
lw t6, 165(sp)
lw t7, 129(sp)
and t6, t6, t7, 13
sw t6, 195(sp)
lw t6, 6(sp)
add t0, t6, t3
lw t6, 129(sp)
li t7, -66370404
mul t6, t6, t7
sw t6, 12(sp)
lw t6, 165(sp)
li t7, 174851105
mul t6, t6, t7
sw t6, 9(sp)
add a4, a4, t0
li t7, 83355599
mul a7, a7, t7
lw t6, 30(sp)
lw t7, 66(sp)
xor.1 t0, t6, t7
add a7, t1, a7
lw t6, 129(sp)
lw t7, 165(sp)
or.1 t6, t6, t7
sw t6, 15(sp)
lw t6, 48(sp)
or.T t0, t6, t0
li t7, 135738216
mul t0, t0, t7
lw t6, 165(sp)
lw t7, 129(sp)
or.T t6, t6, t7
sw t6, 135(sp)
add t0, a7, t0
lw t6, 3(sp)
add a7, t6, a4
lw t6, 135(sp)
li t7, 31605624
mul t6, t6, t7
sw t6, 33(sp)
add a6, a6, t0
lw t6, 51(sp)
li t7, -4322022
xor a4, t6, t7
lw t6, 165(sp)
lw t7, 129(sp)
and.T t6, t6, t7, -13
sw t6, 39(sp)
add a5, a6, a5
lw t6, 165(sp)
lw t7, 129(sp)
or t6, t6, t7, -13
sw t6, 93(sp)
add a3, a3, a5
lw t6, 165(sp)
lw t7, 129(sp)
xor.1 t6, t6, t7
sw t6, 183(sp)
add a3, a7, a3
lw t6, 72(sp)
add a3, t6, a3
lw t6, 129(sp)
lw t7, 165(sp)
xor t6, t6, t7
sw t6, 27(sp)
lw t6, 231(sp)
lw t7, 168(sp)
and t6, t6, t7, 13
sw t6, 87(sp)
lw t6, 0(sp)
add a5, t6, a3
lw t7, 234(sp)
xor a3, a5, t7
lw t7, 129(sp)
xor.1 t6, a3, t7
sw t6, 144(sp)
lw t6, 129(sp)
or.T t6, t6, a3
sw t6, 108(sp)
lw t7, 129(sp)
and t6, a3, t7, 13
sw t6, 78(sp)
lw t6, 129(sp)
xor t6, t6, a3
sw t6, 18(sp)
or a4, a5, a4, -13
or.T t6, a4, a3
sw t6, 246(sp)
lw t7, 165(sp)
and.1 t6, a4, t7, 13
sw t6, 192(sp)
lw t6, 246(sp)
lw t7, 192(sp)
and.T a5, t6, t7, -13
li t7, 68626476
mul t6, a5, t7
sw t6, 6(sp)
lw t6, 78(sp)
slli t6, t6, 3
sw t6, 3(sp)
or.1 t6, a3, a4
sw t6, 0(sp)
or t6, a3, a4, -13
sw t6, 153(sp)
lw t6, 165(sp)
lw t7, 144(sp)
or a6, t6, t7, -13
lw t6, 129(sp)
or t6, t6, a4, -13
sw t6, 213(sp)
lw t6, 165(sp)
lw t7, 153(sp)
xor.T a7, t6, t7
lw t7, 165(sp)
xor.T t1, a4, t7
lw t7, 129(sp)
or.1 t6, a4, t7
sw t6, 111(sp)
lw t6, 165(sp)
or.T t6, t6, a4
sw t6, 42(sp)
and t6, a3, a4, 13
sw t6, 66(sp)
lw t6, 0(sp)
lw t7, 111(sp)
xor.T a5, t6, t7
xor t6, a3, a4
sw t6, 147(sp)
lw t7, 165(sp)
and t6, a3, t7, 13
sw t6, 138(sp)
lw t6, 129(sp)
and.1 t6, t6, a3, 13
sw t6, 156(sp)
lw t6, 147(sp)
lw t7, 195(sp)
and.1 t0, t6, t7, 13
lw t7, 195(sp)
xor.1 t1, t1, t7
and.1 t6, a4, a3, 13
sw t6, 177(sp)
lw t6, 129(sp)
or.1 t6, t6, a3
sw t6, 96(sp)
lw t7, 165(sp)
and t6, a4, t7, 13
sw t6, 75(sp)
lw t7, 138(sp)
or a7, a7, t7, -13
li t7, 30879559
mul t6, a6, t7
sw t6, 30(sp)
lw t6, 96(sp)
xor.1 t1, t6, t1
lw t6, 213(sp)
lw t7, 66(sp)
xor a6, t6, t7
lw t7, 165(sp)
or.1 t6, a3, t7
sw t6, 150(sp)
lw t7, 165(sp)
xor.T t6, a3, t7
sw t6, 252(sp)
lw t7, 18(sp)
and.T t0, t0, t7, -13
li t7, -184447572
mul t0, t0, t7
lw t6, 18(sp)
or.1 t3, t6, a6
lw t6, 129(sp)
lw t7, 177(sp)
or.1 a6, t6, t7
lw t6, 246(sp)
xor.T t2, t6, a7
lw t6, 42(sp)
lw t7, 111(sp)
xor.T a7, t6, t7
lw t7, 96(sp)
xor t1, t1, t7
xor a5, a5, a7
li t7, 112280859
mul a7, t1, t7
lw t6, 147(sp)
or.T t1, t6, a5
lw t6, 0(sp)
and.1 a5, t6, t3, 13
lw t7, 165(sp)
xor.1 t6, a3, t7
sw t6, 237(sp)
li t7, 44465720
mul t1, t1, t7
lw t6, 78(sp)
lw t7, 252(sp)
xor.1 t4, t6, t7
li t7, -174954496
mul t3, t2, t7
lw t6, 15(sp)
lw t7, 177(sp)
xor.T t2, t6, t7
lw t7, 96(sp)
or.T t4, t4, t7
li t7, 90968552
mul a5, a5, t7
lw t6, 129(sp)
and.T t6, t6, a4, -13
sw t6, 72(sp)
lw t6, 177(sp)
xor t2, t6, t2
li t7, -9513136
mul t2, t2, t7
lw t6, 33(sp)
add t2, t6, t2
lw t6, 72(sp)
lw t7, 237(sp)
and.T s0, t6, t7, -13
lw t6, 6(sp)
add t5, t6, a5
lw t6, 75(sp)
lw t7, 39(sp)
or.T a5, t6, t7
add t0, t1, t0
li t7, -116164706
mul t1, s0, t7
add t0, t0, t3
li t7, -166400332
mul t4, t4, t7
li t7, 72909552
mul a6, a6, t7
lw t7, 165(sp)
and.T t6, a3, t7, -13
sw t6, 258(sp)
lw t7, 3(sp)
add t6, t5, t7
sw t6, 141(sp)
lw t6, 129(sp)
or.T t6, t6, a4
sw t6, 81(sp)
lw t6, 165(sp)
xor.1 t6, t6, a4
sw t6, 117(sp)
add t6, t0, a7
sw t6, 57(sp)
and.T t6, a3, a4, -13
sw t6, 204(sp)
lw t7, 30(sp)
add a7, t2, t7
lw t6, 135(sp)
or.1 t2, t6, a4
lw t6, 129(sp)
xor t6, t6, a4
sw t6, 189(sp)
lw t6, 147(sp)
lw t7, 258(sp)
or.T t0, t6, t7
lw t7, 93(sp)
and t5, a4, t7, 13
lw t7, 165(sp)
and.T t6, a4, t7, -13
sw t6, 228(sp)
lw t6, 204(sp)
li t7, 167922216
mul t3, t6, t7
lw t6, 129(sp)
lw t7, 165(sp)
and.1 t6, t6, t7, 13
sw t6, 33(sp)
lw t6, 33(sp)
lw t7, 66(sp)
or s1, t6, t7, -13
li t7, -191658581
mul t5, t5, t7
lw t7, 129(sp)
or t6, a3, t7, -13
sw t6, 249(sp)
add t1, t1, t4
lw t6, 165(sp)
xor t6, t6, a4
sw t6, 48(sp)
lw t6, 249(sp)
lw t7, 117(sp)
or s0, t6, t7, -13
lw t6, 252(sp)
lw t7, 249(sp)
or s2, t6, t7, -13
add t4, a6, t5
lw t7, 150(sp)
and.T a6, s2, t7, -13
add a7, a7, t1
lw t7, 165(sp)
or t6, a4, t7, -13
sw t6, 225(sp)
lw t6, 249(sp)
and a5, t6, a5, 13
li t7, 157594198
mul t5, a5, t7
xor.1 t1, t2, s1
lw t6, 165(sp)
or.1 t6, t6, a4
sw t6, 6(sp)
lw t7, 129(sp)
xor.T t2, a4, t7
lw t6, 42(sp)
xor a5, t6, a3
li t7, 156791056
mul t0, t0, t7
add t0, t3, t0
lw t6, 156(sp)
and.T t3, t6, a6, -13
lw t6, 177(sp)
lw t7, 6(sp)
xor.1 a6, t6, t7
lw t7, 66(sp)
or.T t2, t2, t7
and.T s0, s0, t2, -13
li t7, 179095037
mul s1, t3, t7
lw t7, 129(sp)
and t6, a4, t7, 13
sw t6, 261(sp)
lw t6, 189(sp)
li t7, 44589024
mul t2, t6, t7
add t3, t4, t0
lw t6, 228(sp)
lw t7, 27(sp)
xor.1 t0, t6, t7
xor.1 t6, a3, a4
sw t6, 30(sp)
and t0, s0, t0, 13
add t4, s1, t5
li t7, 193019157
mul t6, t0, t7
sw t6, 3(sp)
add t4, a7, t4
li t7, 69545029
mul t1, t1, t7
lw t6, 72(sp)
lw t7, 150(sp)
or.1 t5, t6, t7
lw t6, 72(sp)
li t7, -63272138
mul t0, t6, t7
lw t6, 81(sp)
lw t7, 48(sp)
or.T a7, t6, t7
lw t6, 78(sp)
and.1 t6, t6, t5, 13
sw t6, 45(sp)
lw t7, 12(sp)
add t4, t4, t7
lw t6, 57(sp)
add t4, t6, t4
add t6, t4, t3
sw t6, 123(sp)
add t6, t2, t1
sw t6, 180(sp)
lw t6, 192(sp)
lw t7, 117(sp)
and t1, t6, t7, 13
lw t6, 129(sp)
xor.1 t6, t6, a4
sw t6, 198(sp)
li t7, 177571209
mul t3, a6, t7
lw t7, 225(sp)
xor a7, a7, t7
lw t6, 261(sp)
lw t7, 138(sp)
or t5, t6, t7, -13
lw t6, 153(sp)
lw t7, 75(sp)
and.1 t2, t6, t7, 13
lw t6, 237(sp)
lw t7, 15(sp)
xor.T t4, t6, t7
lw t6, 129(sp)
and.1 t6, t6, a4, 13
sw t6, 174(sp)
lw t7, 174(sp)
and s1, a4, t7, 13
lw t6, 33(sp)
li t7, 114029779
mul a6, t6, t7
lw t7, 129(sp)
xor.T t6, a3, t7
sw t6, 99(sp)
lw t6, 174(sp)
li t7, -16217325
mul s0, t6, t7
lw t6, 108(sp)
li t7, -99642828
mul t6, t6, t7
sw t6, 201(sp)
or s2, a5, s1, -13
lw t6, 174(sp)
li t7, 182830375
mul a5, t6, t7
lw t6, 93(sp)
lw t7, 174(sp)
or s3, t6, t7, -13
lw t6, 84(sp)
lw t7, 33(sp)
xor.1 s1, t6, t7
li t7, 18725191
mul t5, t5, t7
li t7, -151669010
mul s3, s3, t7
add t0, t0, s0
add t0, a5, t0
add s0, t5, s3
lw t6, 198(sp)
or.T t5, t6, a3
lw t7, 27(sp)
and a5, a4, t7, 13
add t3, t3, s0
lw t6, 0(sp)
lw t7, 72(sp)
or.T s0, t6, t7
or t1, s2, t1, -13
lw t6, 135(sp)
li t7, -115961507
mul t6, t6, t7
sw t6, 222(sp)
li t7, -110623132
mul s2, t4, t7
lw t6, 15(sp)
lw t7, 204(sp)
and t4, t6, t7, 13
lw t7, 39(sp)
or.T s1, s1, t7
or t4, t4, t2, -13
add t0, s2, t0
xor.T s2, t1, a7
lw t6, 18(sp)
lw t7, 204(sp)
and.T t1, t6, t7, -13
li t7, -104930376
mul a7, s1, t7
xor t2, a3, a3
li t7, 161399800
mul s1, s2, t7
lw t6, 165(sp)
xor t6, t6, a3
sw t6, 120(sp)
lw t7, 45(sp)
or.1 t4, t4, t7
add s1, s1, a7
li t7, -188267203
mul t4, t4, t7
xor.1 a7, a3, t2
lw t6, 165(sp)
or.1 a7, t6, a7
xor.T t5, a7, t5
lw t6, 129(sp)
lw t7, 72(sp)
and.1 t6, t6, t7, 13
sw t6, 57(sp)
lw t7, 66(sp)
and.T a7, s0, t7, -13
add s0, a6, s1
lw t7, 204(sp)
xor.1 a6, a5, t7
add t3, t3, s0
lw t6, 129(sp)
and.1 s0, t6, t1, 13
li t7, 53606666
mul t1, t5, t7
add t1, t4, t1
lw t7, 165(sp)
and.1 t6, a3, t7, 13
sw t6, 45(sp)
xor.T t6, a4, a3
sw t6, 12(sp)
lw t6, 237(sp)
lw t7, 120(sp)
or.T t4, t6, t7
lw t6, 27(sp)
lw t7, 249(sp)
and s1, t6, t7, 13
lw t6, 150(sp)
li t7, 187592317
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 6(sp)
lw t7, 258(sp)
or.T t5, t6, t7
or t6, t2, s1, -13
sw t6, 84(sp)
li t7, -145238529
mul s0, s0, t7
add t2, t3, t0
lw t6, 147(sp)
lw t7, 138(sp)
xor t0, t6, t7
slli a5, a5, 2
lw t7, 12(sp)
or.1 t3, a4, t7
li t7, 88635328
mul t6, a6, t7
sw t6, 108(sp)
or.T a6, t3, t4
lw t6, 30(sp)
li t7, 138093578
mul t3, t6, t7
lw t6, 258(sp)
lw t7, 99(sp)
and.1 t6, t6, t7, 13
sw t6, 216(sp)
add s0, s0, t3
li t7, -44824523
mul s4, a6, t7
li t7, 8611671
mul t3, a3, t7
lw t6, 15(sp)
li t7, 148867172
mul s1, t6, t7
lw t6, 231(sp)
lw t7, 165(sp)
and t4, t6, t7, 13
and.1 s5, a7, t5, 13
lw t6, 204(sp)
li t7, 43180266
mul a6, t6, t7
lw t6, 183(sp)
lw t7, 156(sp)
and.T s2, t6, t7, -13
lw t6, 48(sp)
lw t7, 231(sp)
or a7, t6, t7, -13
lw t6, 27(sp)
lw t7, 45(sp)
xor.T s3, t6, t7
add t1, t1, s4
lw t6, 129(sp)
lw t7, 30(sp)
or t5, t6, t7, -13
li t7, -32907146
mul s4, s5, t7
add t1, t1, s4
add t1, t2, t1
add t6, t1, s0
sw t6, 207(sp)
lw t6, 30(sp)
lw t7, 147(sp)
or.1 s0, t6, t7
lw t6, 165(sp)
slli t1, t6, 3
add a5, a5, s1
lw t7, 57(sp)
or s1, s3, t7, -13
lw t6, 129(sp)
lw t7, 165(sp)
xor.T t6, t6, t7
sw t6, 57(sp)
lw t6, 66(sp)
or.T t2, t6, t0
slli t0, s2, 6
add t0, t0, t3
lw t7, 225(sp)
xor.T s0, s0, t7
or.1 s2, t4, a7
li t7, -49982647
mul a7, s1, t7
lw t7, 162(sp)
or t5, t5, t7, -13
lw t6, 66(sp)
lw t7, 147(sp)
and t3, t6, t7, 13
lw t6, 150(sp)
lw t7, 93(sp)
or t4, t6, t7, -13
li t7, -64700293
mul t2, t2, t7
li t7, -56560016
mul s1, s0, t7
lw t6, 84(sp)
and s0, t6, s2, 13
li t7, 171887382
mul t5, t5, t7
add t0, t0, t2
li t7, 71207321
mul t2, s0, t7
lw t6, 156(sp)
lw t7, 57(sp)
or.T s0, t6, t7
lw t7, 177(sp)
and t4, t4, t7, 13
lw t7, 144(sp)
or.T s2, t3, t7
lw t6, 195(sp)
lw t7, 249(sp)
xor.1 t6, t6, t7
sw t6, 162(sp)
lw t6, 96(sp)
lw t7, 150(sp)
xor.1 t6, t6, t7
sw t6, 255(sp)
add t3, a6, s1
lw t6, 9(sp)
add a6, t6, t1
lw t6, 18(sp)
lw t7, 144(sp)
and.1 s1, t6, t7, 13
lw t6, 261(sp)
li t7, 9703644
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 129(sp)
lw t7, 204(sp)
and.T t1, t6, t7, -13
add s3, t5, a6
lw t7, 135(sp)
xor a6, s2, t7
and.1 a6, a6, s0, 13
lw t6, 183(sp)
li t7, -190694611
mul t6, t6, t7
sw t6, 93(sp)
lw t6, 12(sp)
lw t7, 66(sp)
and.1 t5, t6, t7, 13
add s0, t0, s3
li t7, 44459879
mul t0, t4, t7
lw t6, 108(sp)
add t2, t6, t2
li t7, 168413353
mul t6, s1, t7
sw t6, 108(sp)
add a5, a5, t2
li t7, -128079380
mul t6, a3, t7
sw t6, 9(sp)
add s0, s0, t3
lw t6, 30(sp)
lw t7, 261(sp)
xor t3, t6, t7
lw t6, 0(sp)
add t2, t6, a5
lw t6, 135(sp)
lw t7, 225(sp)
xor a5, t6, t7
add a7, t2, a7
or.1 t4, t1, t5
lw t6, 201(sp)
add a7, t6, a7
lw t6, 207(sp)
add a7, t6, a7
lw t6, 120(sp)
lw t7, 195(sp)
and.T t1, t6, t7, -13
lw t7, 216(sp)
or.1 t2, t1, t7
add s0, a7, s0
li t7, 2363325
mul t5, a6, t7
lw t6, 45(sp)
lw t7, 42(sp)
or.1 a6, t6, t7
lw t6, 33(sp)
li t7, 181267443
mul a7, t6, t7
lw t6, 138(sp)
and.1 t1, t6, a3, 13
lw t6, 198(sp)
xor.T t3, t6, t3
lw t7, 120(sp)
xor s1, a6, t7
li t7, 44307500
mul a6, t4, t7
lw t7, 189(sp)
xor t4, t3, t7
lw t6, 180(sp)
add t3, t6, s0
lw t6, 3(sp)
add t6, t6, t3
sw t6, 42(sp)
lw t6, 129(sp)
and.T t3, t6, a3, -13
lw t6, 45(sp)
lw t7, 66(sp)
or.T s0, t6, t7
add t0, t0, t5
lw t7, 117(sp)
or.1 t5, t3, t7
li t7, -148109567
mul t6, s1, t7
sw t6, 3(sp)
lw t6, 255(sp)
and.T t5, t6, t5, -13
li t7, -155600661
mul s2, t2, t7
lw t6, 162(sp)
lw t7, 15(sp)
and.1 t2, t6, t7, 13
lw t6, 165(sp)
xor.1 s1, t6, s0
li t7, 100793350
mul s0, t4, t7
lw t7, 48(sp)
and.T t4, a3, t7, -13
add s2, t0, s2
lw t6, 96(sp)
li t7, -74708543
mul t0, t6, t7
lw t6, 117(sp)
and.T t1, t6, t1, -13
or.1 t5, t5, t3
lw t6, 189(sp)
lw t7, 39(sp)
and.T t3, t6, t7, -13
lw t7, 222(sp)
add s2, s2, t7
lw t6, 78(sp)
or.T t5, t6, t5
li t7, -164452751
mul s4, s1, t7
lw t6, 195(sp)
and.T s1, t6, t2, -13
li t7, 82457054
mul s5, t4, t7
and.1 t2, t3, a5, 13
lw t7, 84(sp)
add t4, s2, t7
add s3, a7, s0
add s2, s4, s5
lw t6, 228(sp)
li t7, -57343992
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 165(sp)
li t7, 131274331
mul a7, t6, t7
li t7, -50685531
mul a5, a4, t7
lw t6, 48(sp)
lw t7, 6(sp)
xor s0, t6, t7
lw t6, 72(sp)
li t7, -98587740
mul t3, t6, t7
add t6, a6, s3
sw t6, 39(sp)
li t7, -70965258
mul t1, t1, t7
li t7, -95538618
mul a6, s1, t7
add t6, t0, t1
sw t6, 84(sp)
li t7, 148029668
mul t1, t5, t7
lw t7, 93(sp)
add a6, a6, t7
lw t6, 78(sp)
lw t7, 66(sp)
and t0, t6, t7, 13
add s1, a6, s2
lw t6, 174(sp)
lw t7, 96(sp)
xor.T t5, t6, t7
lw t6, 57(sp)
lw t7, 144(sp)
and.1 a6, t6, t7, 13
lw t6, 99(sp)
lw t7, 225(sp)
xor.T s2, t6, t7
and.T s2, a6, s2, -13
lw t6, 129(sp)
lw t7, 213(sp)
xor.T a6, t6, t7
lw t7, 108(sp)
add s3, t1, t7
li t7, -134795482
mul t1, s0, t7
lw t7, 9(sp)
add s0, s3, t7
add t6, t4, s0
sw t6, 78(sp)
li t7, -99161980
mul t2, t2, t7
lw t7, 3(sp)
add t2, t2, t7
add t6, t2, s1
sw t6, 6(sp)
li t7, 151512857
mul t4, s2, t7
li t7, -41326180
mul t2, t5, t7
lw t6, 96(sp)
lw t7, 48(sp)
xor.1 s0, t6, t7
lw t6, 237(sp)
lw t7, 33(sp)
and t5, t6, t7, 13
add t3, t4, t3
add a7, a7, t3
lw t7, 144(sp)
or t3, s0, t7, -13
lw t6, 192(sp)
lw t7, 231(sp)
or s1, t6, t7, -13
add t6, a5, a7
sw t6, 93(sp)
lw t6, 75(sp)
lw t7, 45(sp)
xor.1 a7, t6, t7
lw t6, 57(sp)
li t7, -67613222
mul a5, t6, t7
li t7, 10761928
mul a6, a6, t7
lw t6, 261(sp)
lw t7, 15(sp)
or.T t4, t6, t7
lw t6, 12(sp)
li t7, 107982757
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 183(sp)
lw t7, 66(sp)
or.1 s0, t6, t7
lw t6, 231(sp)
lw t7, 30(sp)
and s2, t6, t7, 13
li t7, 125225569
mul s3, t0, t7
and t5, t5, s1, 13
li t7, -46349542
mul s1, t3, t7
lw t6, 129(sp)
lw t7, 246(sp)
and t0, t6, t7, 13
li t7, -183878870
mul t3, t5, t7
add t2, t2, s1
li t7, -180285545
mul t6, s2, t7
sw t6, 45(sp)
add t1, s3, t1
add t1, t2, t1
lw t6, 144(sp)
lw t7, 153(sp)
or.1 t5, t6, t7
add t3, t3, a5
lw t6, 150(sp)
lw t7, 213(sp)
and.T a5, t6, t7, -13
lw t6, 48(sp)
lw t7, 147(sp)
xor.1 s1, t6, t7
and t0, t0, t4, 13
li t7, -79035453
mul t2, s0, t7
lw t6, 81(sp)
lw t7, 177(sp)
and.T s0, t6, t7, -13
li t7, -28858862
mul t4, t0, t7
lw t7, 183(sp)
xor.1 t0, a4, t7
lw t6, 129(sp)
lw t7, 156(sp)
xor.T a4, t6, t7
lw t6, 27(sp)
li t7, 59175762
mul t6, t6, t7
sw t6, 30(sp)
lw t7, 195(sp)
and.T t0, t0, t7, -13
lw t6, 129(sp)
lw t7, 177(sp)
and.1 s2, t6, t7, 13
lw t6, 18(sp)
and.1 s1, t6, s1, 13
lw t6, 165(sp)
lw t7, 246(sp)
and s3, t6, t7, 13
lw t6, 204(sp)
xor.T s3, t6, s3
or.T t0, t0, a4
xor.1 a4, a7, s3
li t7, 151722656
mul a7, a4, t7
lw t6, 144(sp)
lw t7, 231(sp)
and a4, t6, t7, 13
and s3, s0, t5, 13
lw t6, 96(sp)
lw t7, 252(sp)
xor.T t5, t6, t7
xor t5, t5, s2
add a6, a6, a7
add s0, t3, a6
li t7, 169606140
mul s2, s3, t7
li t7, 91455271
mul a7, s1, t7
lw t6, 183(sp)
lw t7, 15(sp)
xor.T a6, t6, t7
li t7, -130058290
mul t3, t5, t7
add t6, t4, s2
sw t6, 9(sp)
lw t6, 225(sp)
li t7, 154002847
mul t5, t6, t7
add t1, t1, s0
add t1, t1, t2
lw t6, 93(sp)
add t1, t6, t1
lw t6, 168(sp)
li t7, 53991395
and.1 t6, t6, t7, 13
sw t6, 144(sp)
lw t6, 198(sp)
lw t7, 228(sp)
xor.T s1, t6, t7
li t7, -81747964
mul s2, a4, t7
lw t6, 27(sp)
lw t7, 57(sp)
xor.1 t2, t6, t7
lw t7, 165(sp)
or a4, a3, t7, -13
lw t6, 246(sp)
lw t7, 72(sp)
or s0, t6, t7, -13
lw t6, 84(sp)
add t1, t6, t1
li t7, -78544289
mul t4, a5, t7
lw t6, 0(sp)
add t1, t6, t1
add t5, s2, t5
lw t6, 174(sp)
lw t7, 150(sp)
or.1 a5, t6, t7
lw t6, 6(sp)
add t1, t6, t1
lw t6, 228(sp)
lw t7, 231(sp)
and s3, t6, t7, 13
lw t6, 39(sp)
add s2, t6, t1
lw t6, 129(sp)
lw t7, 12(sp)
and.1 t1, t6, t7, 13
li t7, 47684679
mul t0, t0, t7
or s1, s1, a4, -13
add t0, t0, a7
li t7, -173940331
mul a7, s3, t7
add t0, t0, t3
lw t6, 78(sp)
add t6, t6, s2
sw t6, 6(sp)
lw t6, 27(sp)
lw t7, 66(sp)
and t3, t6, t7, 13
lw t6, 30(sp)
add t0, t6, t0
or.1 s0, s0, t2
lw t7, 138(sp)
and.1 a6, a6, t7, 13
li t7, -52841328
mul a6, a6, t7
add t2, t4, a7
lw t6, 72(sp)
lw t7, 228(sp)
xor.1 a7, t6, t7
add t0, t0, t5
lw t6, 168(sp)
li t7, 53991395
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 111(sp)
xor.1 t4, t6, s1
lw t6, 168(sp)
li t7, 53991395
and t6, t6, t7, 13
sw t6, 195(sp)
or.1 a5, a5, t3
lw t6, 165(sp)
or.T s1, t6, a3
lw t6, 258(sp)
lw t7, 249(sp)
or t3, t6, t7, -13
li t7, -161269119
mul t4, t4, t7
xor t5, s0, t1
lw t6, 75(sp)
xor.1 s0, t6, s1
lw t6, 168(sp)
li t7, 53991395
and.T t6, t6, t7, -13
sw t6, 15(sp)
and.1 a3, a3, a4, 13
lw t6, 168(sp)
li t7, 53991395
xor t6, t6, t7
sw t6, 111(sp)
lw t7, 81(sp)
xor.T t1, a3, t7
li t7, 110195285
mul a3, t5, t7
lw t7, 225(sp)
and.T t5, s0, t7, -13
lw t6, 243(sp)
lw t7, 180(sp)
and.T a4, t6, t7, -13
add t2, t2, a3
add a3, a6, t4
lw t6, 33(sp)
or.T a6, t6, a7
add a7, t0, t2
li t7, -170186816
mul t2, a6, t7
lw t6, 45(sp)
add a7, t6, a7
li t7, -38277814
mul a6, t5, t7
lw t6, 9(sp)
add t4, t6, a7
li t7, 149826099
mul a7, t3, t7
lw t6, 243(sp)
li t7, 53991395
xor.1 t6, t6, t7
sw t6, 216(sp)
lw t6, 195(sp)
lw t7, 216(sp)
and.1 t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 168(sp)
lw t7, 15(sp)
and.1 t0, t6, t7, 13
and.1 a5, a5, t1, 13
lw t6, 168(sp)
li t7, 53991395
or.T t6, t6, t7
sw t6, 156(sp)
li t7, -77060946
mul a5, a5, t7
add a5, t2, a5
lw t6, 168(sp)
li t7, 53991395
xor.T t6, t6, t7
sw t6, 150(sp)
lw t6, 3(sp)
add t1, t6, t4
add a5, a5, a6
lw t6, 6(sp)
add a6, t6, t1
add a5, a5, a7
li t7, 155732020
mul t6, a4, t7
sw t6, 39(sp)
lw t6, 150(sp)
li t7, -53991395
or t6, t6, t7, -13
sw t6, 9(sp)
li t7, 19994807
mul t6, t0, t7
sw t6, 138(sp)
add a3, a6, a3
lw t6, 243(sp)
li t7, -53991395
or.T a4, t6, t7
li t7, -131298684
mul t6, a4, t7
sw t6, 30(sp)
lw t6, 111(sp)
lw t7, 243(sp)
and.1 t6, t6, t7, 13
sw t6, 27(sp)
lw t6, 42(sp)
add a3, t6, a3
lw t6, 123(sp)
add a3, t6, a3
add a3, a3, a5
lw t6, 243(sp)
li t7, 53991395
or t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 168(sp)
li t7, 53991395
or.1 t6, t6, t7
sw t6, 93(sp)
lw t6, 141(sp)
add t6, t6, a3
sw t6, 78(sp)
lw t6, 78(sp)
lw t7, 24(sp)
and.T a3, t6, t7, -13
lw t6, 78(sp)
lw t7, 51(sp)
xor t6, t6, t7
sw t6, 282(sp)
lw t6, 24(sp)
lw t7, 78(sp)
or.T a4, t6, t7
xor a3, a3, a4
lw t6, 51(sp)
lw t7, 78(sp)
or t6, t6, t7, -13
sw t6, 117(sp)
lw t7, 243(sp)
or.1 t6, a3, t7
sw t6, 207(sp)
lw t6, 78(sp)
lw t7, 51(sp)
or.1 t6, t6, t7
sw t6, 108(sp)
lw t6, 51(sp)
lw t7, 78(sp)
xor.T t6, t6, t7
sw t6, 99(sp)
lw t7, 243(sp)
and t6, a3, t7, 13
sw t6, 3(sp)
lw t6, 78(sp)
lw t7, 51(sp)
and t6, t6, t7, 13
sw t6, 96(sp)
lw t6, 78(sp)
lw t7, 51(sp)
or.T t6, t6, t7
sw t6, 222(sp)
li t7, 53991395
or.T t6, a3, t7
sw t6, 177(sp)
lw t6, 51(sp)
lw t7, 78(sp)
xor.1 t6, t6, t7
sw t6, 153(sp)
lw t6, 90(sp)
lw t7, 78(sp)
xor t6, t6, t7
sw t6, 33(sp)
lw t6, 78(sp)
lw t7, 36(sp)
xor t6, t6, t7
sw t6, 6(sp)
li t7, 53991395
and t6, a3, t7, 13
sw t6, 48(sp)
lw t6, 156(sp)
or.1 a5, t6, a3
lw t7, 243(sp)
xor t6, a3, t7
sw t6, 129(sp)
lw t6, 51(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 120(sp)
lw t6, 168(sp)
and a4, t6, a3, 13
li t7, 53991395
or.1 t6, a3, t7
sw t6, 18(sp)
lw t6, 243(sp)
xor.1 t6, t6, a3
sw t6, 198(sp)
lw t6, 243(sp)
and.T t6, t6, a3, -13
sw t6, 165(sp)
lw t6, 48(sp)
lw t7, 3(sp)
xor.T a6, t6, t7
lw t6, 144(sp)
and a6, t6, a6, 13
lw t7, 168(sp)
or t6, a3, t7, -13
sw t6, 135(sp)
lw t6, 135(sp)
lw t7, 87(sp)
and.T a7, t6, t7, -13
lw t6, 243(sp)
and.1 t6, t6, a3, 13
sw t6, 42(sp)
lw t6, 78(sp)
lw t7, 51(sp)
and.T t6, t6, t7, -13
sw t6, 123(sp)
lw t6, 168(sp)
lw t7, 165(sp)
or.1 t0, t6, t7
li t7, -58869515
mul t6, a5, t7
sw t6, 45(sp)
lw t7, 21(sp)
xor.1 a5, t0, t7
li t7, -32016960
mul a6, a6, t7
lw t7, 243(sp)
or t6, a3, t7, -13
sw t6, 141(sp)
lw t7, 0(sp)
or.T a5, a5, t7
lw t7, 168(sp)
or.1 t6, a3, t7
sw t6, 36(sp)
lw t6, 159(sp)
li t7, 55566233
mul t6, t6, t7
sw t6, 57(sp)
lw t7, 9(sp)
and.T a7, a7, t7, -13
lw t6, 243(sp)
li t7, 53991395
xor.T t6, t6, t7
sw t6, 213(sp)
li t7, 53991395
and.T t6, a3, t7, -13
sw t6, 9(sp)
lw t6, 177(sp)
lw t7, 198(sp)
or.T t6, t6, t7
sw t6, 84(sp)
li t7, 178766147
mul t1, a5, t7
lw t7, 168(sp)
or.T t6, a3, t7
sw t6, 192(sp)
lw t6, 141(sp)
lw t7, 216(sp)
or.T a5, t6, t7
lw t6, 129(sp)
lw t7, 243(sp)
or t0, t6, t7, -13
lw t6, 243(sp)
and.T t0, t6, t0, -13
lw t7, 168(sp)
xor.T t6, a3, t7
sw t6, 72(sp)
lw t7, 39(sp)
add t3, t1, t7
lw t6, 9(sp)
lw t7, 219(sp)
or.T t4, t6, t7
lw t6, 159(sp)
lw t7, 141(sp)
xor.1 t1, t6, t7
li t7, 113718798
mul t2, a7, t7
lw t6, 243(sp)
or.T t6, t6, a3
sw t6, 189(sp)
lw t7, 168(sp)
xor a7, a3, t7
add a6, a6, t3
li t7, -75228827
mul t3, t4, t7
li t7, -77384499
mul t0, t0, t7
lw t6, 12(sp)
lw t7, 168(sp)
and.1 t6, t6, t7, 13
sw t6, 12(sp)
li t7, 137011894
mul t1, t1, t7
add t4, a6, t2
lw t6, 189(sp)
and.T a4, t6, a4, -13
li t7, 149506696
mul t2, a4, t7
lw t6, 72(sp)
xor a4, t6, a3
lw t6, 18(sp)
ori a6, t6, 0
add t6, t3, t4
sw t6, 162(sp)
lw t7, 102(sp)
xor a4, a4, t7
li t7, -51896229
mul t6, a7, t7
sw t6, 87(sp)
xor t6, a3, a3
sw t6, 147(sp)
li t7, 189855322
mul t6, a4, t7
sw t6, 24(sp)
li t7, -25529125
mul a5, a5, t7
lw t6, 192(sp)
li t7, 53991395
or a4, t6, t7, -13
add a5, t1, a5
add a5, a5, t2
lw t6, 243(sp)
li t7, 53991395
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 240(sp)
lw t7, 213(sp)
xor t1, t6, t7
lw t6, 168(sp)
xor.1 t6, t6, a3
sw t6, 75(sp)
lw t6, 45(sp)
add t2, t6, a5
lw t6, 3(sp)
li t7, 135920285
mul t3, t6, t7
li t7, 152087437
mul a5, t1, t7
li t7, 82627354
mul t4, a3, t7
lw t6, 36(sp)
li t7, 53991395
and.1 t6, t6, t7, 13
sw t6, 66(sp)
lw t6, 42(sp)
lw t7, 0(sp)
xor.T t1, t6, t7
li t7, 14313162
mul t6, a3, t7
sw t6, 81(sp)
add t6, t3, t4
sw t6, 3(sp)
lw t6, 18(sp)
and.T a7, t6, a7, -13
add t2, t2, t0
lw t7, 84(sp)
and t3, a7, t7, 13
lw t6, 243(sp)
xor a4, t6, a4
lw t6, 72(sp)
li t7, 53991395
xor a7, t6, t7
li t7, -154488035
mul a7, a7, t7
lw t6, 75(sp)
li t7, 190808189
mul t6, t6, t7
sw t6, 39(sp)
li t7, -15022020
mul t0, a4, t7
li t7, -53991395
or.T t4, a3, t7
li t7, 102465378
mul a4, t3, t7
lw t7, 57(sp)
add t5, a4, t7
lw t6, 243(sp)
li t7, 53991395
or.T a4, t6, t7
lw t7, 243(sp)
xor t3, t4, t7
add t4, t2, t5
lw t7, 12(sp)
or.1 t2, a6, t7
lw t6, 138(sp)
add t6, t6, t4
sw t6, 84(sp)
li t7, -38173554
mul t5, t3, t7
lw t7, 168(sp)
and.1 t6, a3, t7, 13
sw t6, 204(sp)
lw t6, 144(sp)
li t7, 53991395
xor a6, t6, t7
lw t6, 111(sp)
xor t3, t6, t1
lw t6, 204(sp)
lw t7, 147(sp)
xor.T t1, t6, t7
lw t6, 189(sp)
lw t7, 93(sp)
and.T t6, t6, t7, -13
sw t6, 12(sp)
lw t7, 156(sp)
or a6, a6, t7, -13
li t7, -53802065
mul t4, a6, t7
li t7, 53991395
xor t6, a3, t7
sw t6, 57(sp)
lw t6, 75(sp)
li t7, 86581008
mul a6, t6, t7
li t7, 53991395
xor.1 t6, a3, t7
sw t6, 45(sp)
lw t6, 150(sp)
lw t7, 141(sp)
and s2, t6, t7, 13
lw t6, 177(sp)
lw t7, 243(sp)
xor s0, t6, t7
lw t6, 57(sp)
lw t7, 141(sp)
and s3, t6, t7, 13
li t7, -59280807
mul s0, s0, t7
lw t7, 36(sp)
or s1, t1, t7, -13
add t0, a7, t0
li t7, -38920699
mul a7, t2, t7
lw t6, 24(sp)
add a5, t6, a5
add t5, t0, t5
lw t7, 243(sp)
xor.T t6, a3, t7
sw t6, 138(sp)
lw t6, 87(sp)
add t2, t6, a7
li t7, 34693336
mul t1, s2, t7
lw t6, 66(sp)
and s2, t6, s3, 13
lw t6, 45(sp)
lw t7, 198(sp)
and s3, t6, t7, 13
lw t6, 27(sp)
li t7, -77536603
mul t0, t6, t7
li t7, 85534208
mul t3, t3, t7
lw t6, 177(sp)
lw t7, 57(sp)
xor.T t6, t6, t7
sw t6, 201(sp)
li t7, 82348655
mul a7, s1, t7
add t4, t4, a7
lw t6, 216(sp)
lw t7, 102(sp)
and.1 t6, t6, t7, 13
sw t6, 87(sp)
lw t7, 231(sp)
or a7, a4, t7, -13
li t7, 191712666
mul s1, s2, t7
add s2, s0, t3
lw t7, 138(sp)
and.T t3, s3, t7, -13
li t7, 13086434
mul s0, t3, t7
lw t6, 81(sp)
add s3, t6, t5
lw t6, 129(sp)
and.T t5, t6, a4, -13
lw t6, 57(sp)
lw t7, 45(sp)
and t3, t6, t7, 13
li t7, 102140190
mul t6, t3, t7
sw t6, 183(sp)
lw t7, 57(sp)
and.T t3, a4, t7, -13
li t7, -94613476
mul s4, t5, t7
lw t7, 168(sp)
and.T t6, a3, t7, -13
sw t6, 24(sp)
lw t6, 150(sp)
lw t7, 126(sp)
xor.T t5, t6, t7
lw t6, 39(sp)
add a4, t6, s3
lw t6, 30(sp)
add s3, t6, s2
lw t6, 18(sp)
lw t7, 219(sp)
and.T s2, t6, t7, -13
add t1, s4, t1
add a6, a6, s1
add s1, t2, s3
lw t7, 243(sp)
add t2, s0, t7
add a5, a5, s1
lw t6, 240(sp)
lw t7, 216(sp)
and s0, t6, t7, 13
lw t6, 0(sp)
or.1 s0, t6, s0
add a6, a6, t4
lw t6, 3(sp)
add a4, t6, a4
li t7, 53991395
and.1 s1, a3, t7, 13
li t7, -163803127
mul t6, s2, t7
sw t6, 174(sp)
add a4, a5, a4
lw t6, 57(sp)
li t7, 116239910
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 213(sp)
lw t7, 36(sp)
and a5, t6, t7, 13
add t0, a6, t0
lw t6, 75(sp)
lw t7, 180(sp)
and.T s2, t6, t7, -13
lw t6, 93(sp)
lw t7, 147(sp)
and.T a6, t6, t7, -13
lw t6, 243(sp)
li t7, 53991395
and.1 t6, t6, t7, 13
sw t6, 66(sp)
li t7, -94262498
mul a6, a6, t7
lw t6, 177(sp)
xor s3, t6, t5
li t7, 53991395
xor.T t4, a3, t7
lw t6, 150(sp)
and.1 t6, t6, t3, 13
sw t6, 81(sp)
li t7, 140659593
mul t5, s0, t7
li t7, -32917007
mul a7, a7, t7
li t7, 14964171
mul t6, s1, t7
sw t6, 27(sp)
lw t6, 201(sp)
xor.T t3, t6, s3
lw t6, 159(sp)
lw t7, 66(sp)
and.1 s0, t6, t7, 13
li t7, 152969896
mul s3, t3, t7
lw t7, 168(sp)
and.1 s1, s2, t7, 13
add t2, t2, t1
lw t6, 243(sp)
lw t7, 24(sp)
or.1 t3, t6, t7
lw t6, 192(sp)
lw t7, 231(sp)
or t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 168(sp)
lw t7, 219(sp)
and t1, t6, t7, 13
lw t6, 192(sp)
or.1 s4, t6, t1
lw t6, 36(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 3(sp)
add s2, t5, s3
lw t6, 102(sp)
lw t7, 168(sp)
xor.T t6, t6, t7
sw t6, 201(sp)
lw t6, 216(sp)
lw t7, 66(sp)
and.1 t1, t6, t7, 13
li t7, 171871674
mul s3, s4, t7
lw t6, 12(sp)
or.T t5, t6, s0
xor.1 t5, s1, t5
lw t7, 183(sp)
add s0, s2, t7
lw t6, 144(sp)
li t7, -19200546
mul t6, t6, t7
sw t6, 12(sp)
li t7, -38735485
add s1, s3, t7
lw t7, 165(sp)
or.T t4, t4, t7
lw t7, 48(sp)
xor.T t6, a3, t7
sw t6, 165(sp)
add t0, t0, t2
add t2, a4, t0
li t7, -138670501
mul t0, t3, t7
lw t6, 243(sp)
li t7, 53991395
or.1 a4, t6, t7
li t7, 75505122
mul t5, t5, t7
lw t7, 87(sp)
xor.T t3, t4, t7
lw t6, 198(sp)
lw t7, 141(sp)
and t4, t6, t7, 13
xor a5, a5, t4
add a6, a6, s1
lw t6, 39(sp)
add a6, t6, a6
lw t6, 0(sp)
lw t7, 219(sp)
and.T t6, t6, t7, -13
sw t6, 87(sp)
add a6, a7, a6
add a7, s0, a6
li t7, -155241419
mul s0, t1, t7
lw t6, 168(sp)
lw t7, 45(sp)
or.1 t1, t6, t7
lw t6, 21(sp)
lw t7, 75(sp)
and.T a6, t6, t7, -13
lw t6, 72(sp)
lw t7, 93(sp)
xor.T t4, t6, t7
li t7, -166830635
mul t4, t4, t7
lw t6, 171(sp)
lw t7, 135(sp)
and.T t6, t6, t7, -13
sw t6, 72(sp)
lw t6, 243(sp)
li t7, 53991395
xor t6, t6, t7
sw t6, 135(sp)
lw t6, 174(sp)
add s0, t6, s0
xor.1 a5, a5, a4
lw t6, 27(sp)
add t6, t6, t5
sw t6, 174(sp)
add t5, a7, s0
lw t7, 216(sp)
and a7, a3, t7, 13
add t2, t2, t5
li t7, 175602847
mul t3, t3, t7
add t6, t0, t3
sw t6, 183(sp)
lw t6, 84(sp)
add t6, t6, t2
sw t6, 84(sp)
lw t6, 168(sp)
lw t7, 135(sp)
or.T t2, t6, t7
lw t6, 3(sp)
li t7, -42994424
mul t0, t6, t7
li t7, -131539238
mul t3, t2, t7
lw t6, 81(sp)
or.T t2, t6, a5
li t7, 53991395
or a5, a3, t7, -13
li t7, -156738575
mul t2, t2, t7
lw t6, 138(sp)
xor t5, t6, a5
lw t7, 213(sp)
or.T t5, t5, t7
lw t6, 0(sp)
li t7, 106621184
mul t6, t6, t7
sw t6, 21(sp)
add t6, t3, t4
sw t6, 39(sp)
lw t6, 135(sp)
and t3, t6, a4, 13
or.T t1, t1, t3
li t7, -53991395
xor.T t1, t1, t7
or.1 t1, t1, t5
lw t7, 18(sp)
xor.1 t4, a3, t7
lw t7, 93(sp)
and.T t5, a4, t7, -13
lw t6, 171(sp)
lw t7, 48(sp)
and.T s0, t6, t7, -13
lw t6, 30(sp)
xor s4, t6, t1
lw t6, 177(sp)
li t7, -53991395
or.1 s1, t6, t7
lw t6, 297(sp)
xor.1 t1, t6, a3
lw t6, 129(sp)
lw t7, 240(sp)
and s2, t6, t7, 13
lw t6, 243(sp)
lw t7, 135(sp)
or.T t3, t6, t7
lw t6, 180(sp)
xor.1 s3, t6, s0
lw t6, 201(sp)
or s5, t6, a7, -13
lw t6, 138(sp)
li t7, 9654693
mul s0, t6, t7
li t7, -64739543
mul a7, s4, t7
xor.1 a6, s5, a6
slli a6, a6, 2
li t7, 171690389
mul t6, a4, t7
sw t6, 3(sp)
add t2, t2, a6
lw t6, 87(sp)
lw t7, 204(sp)
or.1 s4, t6, t7
li t7, 33847436
mul s3, s3, t7
lw t6, 159(sp)
xor s1, t6, s1
lw t6, 171(sp)
lw t7, 216(sp)
xor.T s5, t6, t7
lw t7, 141(sp)
and t4, t4, t7, 13
lw t6, 111(sp)
lw t7, 9(sp)
and.1 a6, t6, t7, 13
lw t7, 165(sp)
or.T s2, s2, t7
add t2, t0, t2
lw t6, 216(sp)
and t0, t6, t5, 13
li t7, 50989670
mul t0, t0, t7
lw t7, 12(sp)
add t2, t2, t7
li t7, 55427930
mul t5, s4, t7
li t7, 38676535
mul s4, s5, t7
add s4, s4, t5
add t5, t0, s0
add t6, s3, s4
sw t6, 27(sp)
lw t6, 72(sp)
li t7, -175281317
mul t6, t6, t7
sw t6, 81(sp)
li t7, -100767875
mul t3, t3, t7
lw t6, 177(sp)
lw t7, 75(sp)
and.T t0, t6, t7, -13
li t7, -131654182
mul s0, s1, t7
li t7, -47148827
mul s1, s2, t7
or.T s3, t1, a5
li t7, 96595182
mul t0, t0, t7
li t7, -78824139
mul t1, a6, t7
lw t7, 21(sp)
add t6, s1, t7
sw t6, 72(sp)
lw t6, 75(sp)
lw t7, 180(sp)
or s1, t6, t7, -13
lw t6, 69(sp)
li t7, -51279213
mul a6, t6, t7
add s2, t3, t1
lw t6, 57(sp)
lw t7, 243(sp)
and t1, t6, t7, 13
xor s3, t4, s3
lw t7, 18(sp)
and.T t6, a3, t7, -13
sw t6, 48(sp)
lw t6, 102(sp)
li t7, -165717574
mul t3, t6, t7
lw t6, 126(sp)
lw t7, 147(sp)
xor.T t4, t6, t7
add a7, a7, s0
li t7, 126479804
mul s0, s3, t7
add t5, t5, s0
lw t6, 240(sp)
li t7, 53991395
and t6, t6, t7, 13
sw t6, 21(sp)
add a7, t2, a7
xor.1 t2, s1, t4
add t4, t5, s2
lw t6, 183(sp)
add a7, t6, a7
lw t6, 204(sp)
lw t7, 192(sp)
xor t6, t6, t7
sw t6, 12(sp)
lw t7, 39(sp)
add t6, a7, t7
sw t6, 30(sp)
lw t6, 216(sp)
lw t7, 204(sp)
and a7, t6, t7, 13
li t7, -40595451
mul t6, a7, t7
sw t6, 75(sp)
li t7, -130421762
mul t6, a5, t7
sw t6, 39(sp)
li t7, 45251872
mul a4, a4, t7
lw t6, 144(sp)
lw t7, 0(sp)
xor a7, t6, t7
li t7, 18390905
mul t5, t2, t7
lw t6, 3(sp)
add t2, t6, t3
lw t7, 204(sp)
and t3, a3, t7, 13
lw t7, 198(sp)
and s0, t1, t7, 13
lw t6, 177(sp)
lw t7, 144(sp)
xor.1 t1, t6, t7
slli t3, t3, 3
add t0, t3, t0
add t4, t4, t5
lw t7, 195(sp)
or t3, a3, t7, -13
lw t6, 81(sp)
add s1, t6, t4
lw t6, 15(sp)
and.T t5, t6, s0, -13
lw t6, 111(sp)
or.T t4, t6, a5
lw t6, 18(sp)
lw t7, 168(sp)
and.1 a5, t6, t7, 13
lw t6, 168(sp)
lw t7, 36(sp)
and.T s0, t6, t7, -13
lw t6, 150(sp)
xor s2, t6, s0
add a6, s1, a6
lw t6, 189(sp)
xor.T s0, t6, a5
lw t7, 207(sp)
xor.T a5, t5, t7
li t7, 193598555
mul t5, a5, t7
lw t6, 24(sp)
lw t7, 126(sp)
and.1 a5, t6, t7, 13
and.1 s1, t3, s2, 13
add t3, t0, t2
lw t7, 168(sp)
xor t2, a7, t7
lw t7, 45(sp)
and a7, s0, t7, 13
li t7, -149803161
mul s2, t4, t7
lw t6, 243(sp)
xor.1 t4, t6, t1
lw t6, 195(sp)
li t7, -64335052
mul t6, t6, t7
sw t6, 0(sp)
li t7, -187909699
mul t0, s1, t7
lw t6, 195(sp)
li t7, -146669045
mul t6, t6, t7
sw t6, 3(sp)
lw t7, 111(sp)
or.T t2, t2, t7
lw t6, 21(sp)
lw t7, 159(sp)
and.T s0, t6, t7, -13
add t5, t5, s2
lw t7, 177(sp)
xor t1, a3, t7
lw t6, 27(sp)
add a3, t6, a6
add t5, t5, a4
add a3, a3, t3
lw t6, 42(sp)
or.1 t3, t6, a7
lw t6, 72(sp)
add a3, t6, a3
li t7, 48919053
mul a6, t4, t7
lw t7, 39(sp)
add a4, a3, t7
slli a7, s0, 8
lw t6, 204(sp)
li t7, 177954993
mul a3, t6, t7
lw t6, 18(sp)
lw t7, 195(sp)
xor.T t6, t6, t7
sw t6, 27(sp)
add a7, t5, a7
lw t6, 48(sp)
xor.1 t4, t6, t2
li t7, -36889773
mul t2, t3, t7
lw t6, 102(sp)
li t7, 91072493
mul t6, t6, t7
sw t6, 21(sp)
add t2, t2, t0
lw t6, 243(sp)
li t7, 53991395
and.T t5, t6, t7, -13
li t7, 135064226
mul t0, t4, t7
lw t6, 12(sp)
lw t7, 231(sp)
and t4, t6, t7, 13
li t7, -163033579
mul t3, t1, t7
xor t5, a5, t5
lw t6, 156(sp)
li t7, 53991395
xor a5, t6, t7
lw t6, 75(sp)
add t1, t6, t0
lw t6, 24(sp)
li t7, -168421084
mul s0, t6, t7
lw t6, 192(sp)
li t7, 53991395
xor.T s1, t6, t7
lw t6, 231(sp)
lw t7, 195(sp)
and t0, t6, t7, 13
li t7, 25959131
mul t4, t4, t7
lw t6, 15(sp)
and s2, t6, s1, 13
lw t6, 138(sp)
lw t7, 195(sp)
xor s1, t6, t7
add t3, t3, s0
or.T t5, t5, s2
add a6, a6, t2
lw t6, 69(sp)
lw t7, 93(sp)
xor.T t2, t6, t7
add a7, a7, a6
li t7, 130955000
mul a6, s1, t7
add a7, a4, a7
lw t6, 144(sp)
lw t7, 57(sp)
and.1 a4, t6, t7, 13
lw t6, 30(sp)
add t6, t6, a7
sw t6, 24(sp)
add t6, t1, t4
sw t6, 18(sp)
lw t6, 135(sp)
li t7, 53991395
or.1 t4, t6, t7
lw t6, 66(sp)
lw t7, 102(sp)
xor.1 t1, t6, t7
li t7, 38506753
mul a7, t5, t7
lw t6, 0(sp)
add a3, t6, a3
or.1 t2, t1, t2
lw t7, 3(sp)
add t1, t3, t7
and.T t0, t0, t4, -13
or.T a5, a5, a4
li t7, -4090906
mul a4, t0, t7
lw t6, 15(sp)
li t7, 53991395
or.1 t0, t6, t7
li t7, -189619458
mul t2, t2, t7
add t6, a7, a3
sw t6, 3(sp)
lw t6, 90(sp)
li t7, 49598395
mul t6, t6, t7
sw t6, 273(sp)
add a3, t1, a4
lw t6, 147(sp)
lw t7, 9(sp)
or a4, t6, t7, -13
lw t6, 144(sp)
or a5, t6, a5, -13
lw t6, 27(sp)
lw t7, 171(sp)
or.1 a7, t6, t7
add t6, t2, a6
sw t6, 0(sp)
li t7, -86368538
mul a5, a5, t7
lw t6, 156(sp)
xor.1 a6, t6, t0
lw t6, 90(sp)
li t7, 143418902
and t6, t6, t7, 13
sw t6, 189(sp)
lw t6, 90(sp)
li t7, 143418902
xor t6, t6, t7
sw t6, 48(sp)
lw t6, 90(sp)
li t7, 143418902
xor.1 t6, t6, t7
sw t6, 276(sp)
lw t6, 90(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 69(sp)
lw t6, 21(sp)
add a3, t6, a3
lw t6, 90(sp)
li t7, 143418902
and.1 t6, t6, t7, 13
sw t6, 75(sp)
lw t6, 90(sp)
lw t7, 189(sp)
or.T t6, t6, t7
sw t6, 147(sp)
lw t7, 207(sp)
or.1 t0, a6, t7
lw t6, 90(sp)
li t7, 143418902
xor.T t6, t6, t7
sw t6, 258(sp)
lw t6, 45(sp)
lw t7, 93(sp)
xor.1 a6, t6, t7
or.T t0, a7, t0
lw t6, 90(sp)
li t7, 143418902
and.T t6, t6, t7, -13
sw t6, 252(sp)
lw t6, 297(sp)
lw t7, 93(sp)
and a7, t6, t7, 13
lw t6, 276(sp)
li t7, 143418902
and.1 t6, t6, t7, 13
sw t6, 312(sp)
lw t6, 90(sp)
li t7, 143418902
or t6, t6, t7, -13
sw t6, 111(sp)
li t7, -24402309
mul t0, t0, t7
lw t6, 276(sp)
li t7, 185318897
mul t6, t6, t7
sw t6, 42(sp)
lw t6, 90(sp)
li t7, 143418902
or.T t6, t6, t7
sw t6, 255(sp)
lw t6, 90(sp)
li t7, 143418902
or.1 t6, t6, t7
sw t6, 72(sp)
add a5, a5, t0
lw t7, 204(sp)
xor.T a7, a7, t7
lw t6, 45(sp)
or a7, t6, a7, -13
lw t6, 90(sp)
slli t6, t6, 4
sw t6, 309(sp)
or a6, a7, a6, -13
lw t6, 243(sp)
li t7, -137915394
and.T t6, t6, t7, -13
sw t6, 249(sp)
lw t6, 318(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 180(sp)
lw t6, 276(sp)
li t7, -143418902
xor.T t6, t6, t7
sw t6, 213(sp)
lw t7, 171(sp)
xor t0, a4, t7
lw t6, 231(sp)
lw t7, 189(sp)
and a7, t6, t7, 13
lw t6, 231(sp)
lw t7, 48(sp)
and t6, t6, t7, 13
sw t6, 102(sp)
lw t6, 72(sp)
lw t7, 189(sp)
xor.1 a4, t6, t7
lw t6, 48(sp)
li t7, 36496074
mul t6, t6, t7
sw t6, 165(sp)
lw t6, 231(sp)
lw t7, 72(sp)
or t1, t6, t7, -13
or.1 a6, a6, t0
lw t6, 90(sp)
li t7, 158407528
mul t6, t6, t7
sw t6, 135(sp)
li t7, 66473565
mul t6, t1, t7
sw t6, 57(sp)
li t7, 179694443
mul a6, a6, t7
li t7, 2984665
mul t6, a7, t7
sw t6, 93(sp)
add a5, a5, a6
lw t6, 252(sp)
lw t7, 75(sp)
xor a6, t6, t7
lw t6, 0(sp)
add a5, t6, a5
add a5, a3, a5
lw t6, 234(sp)
li t7, -137915394
or t6, t6, t7, -13
sw t6, 183(sp)
lw t6, 6(sp)
li t7, -144359731
xor a3, t6, t7
lw t6, 249(sp)
lw t7, 267(sp)
xor.T t6, t6, t7
sw t6, 12(sp)
li t7, 27503777
mul t6, a4, t7
sw t6, 156(sp)
li t7, -165430941
mul t6, a6, t7
sw t6, 285(sp)
lw t7, 234(sp)
and.1 t6, a3, t7, 13
sw t6, 291(sp)
lw t6, 234(sp)
li t7, -137915394
and.T t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 3(sp)
add a4, t6, a5
lw t6, 18(sp)
add a4, t6, a4
lw t6, 318(sp)
li t7, -90551088
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 234(sp)
li t7, -137915394
and t6, t6, t7, 13
sw t6, 207(sp)
lw t6, 24(sp)
add a4, t6, a4
lw t6, 234(sp)
li t7, -137915394
xor t6, t6, t7
sw t6, 306(sp)
lw t6, 243(sp)
li t7, -137915394
xor.1 t6, t6, t7
sw t6, 36(sp)
lw t6, 243(sp)
xor.T t6, t6, a3
sw t6, 18(sp)
lw t6, 243(sp)
li t7, -137915394
or.T t6, t6, t7
sw t6, 216(sp)
li t7, -137915394
xor t6, a3, t7
sw t6, 219(sp)
lw t6, 174(sp)
add a4, t6, a4
lw t6, 234(sp)
li t7, -137915394
xor.1 t6, t6, t7
sw t6, 66(sp)
lw t6, 18(sp)
lw t7, 66(sp)
xor.T a5, t6, t7
lw t7, 243(sp)
and.T t6, a3, t7, -13
sw t6, 87(sp)
lw t6, 36(sp)
lw t7, 114(sp)
or.T t6, t6, t7
sw t6, 237(sp)
li t7, -171361688
mul t6, a5, t7
sw t6, 126(sp)
lw t6, 243(sp)
and.1 t6, t6, a3, 13
sw t6, 294(sp)
li t7, -137915394
xor.T t6, a3, t7
sw t6, 201(sp)
lw t6, 84(sp)
add a4, t6, a4
lw t6, 162(sp)
add a4, t6, a4
li t7, 8158742
xor t6, a4, t7
sw t6, 162(sp)
lw t6, 162(sp)
li t7, 143418902
and.1 t6, t6, t7, 13
sw t6, 144(sp)
lw t6, 162(sp)
lw t7, 90(sp)
xor t6, t6, t7
sw t6, 279(sp)
lw t6, 162(sp)
lw t7, 48(sp)
xor.T a4, t6, t7
lw t6, 162(sp)
li t7, 143418902
and t6, t6, t7, 13
sw t6, 198(sp)
lw t6, 162(sp)
lw t7, 162(sp)
xor t6, t6, t7
sw t6, 246(sp)
lw t6, 162(sp)
li t7, 143418902
or.1 t6, t6, t7
sw t6, 171(sp)
lw t6, 162(sp)
li t7, 143418902
xor.T t6, t6, t7
sw t6, 228(sp)
lw t6, 198(sp)
lw t7, 171(sp)
xor.1 a7, t6, t7
lw t6, 162(sp)
lw t7, 90(sp)
or t6, t6, t7, -13
sw t6, 177(sp)
lw t6, 162(sp)
lw t7, 246(sp)
xor.T t6, t6, t7
sw t6, 141(sp)
lw t6, 162(sp)
lw t7, 90(sp)
and.1 t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 162(sp)
lw t7, 90(sp)
xor.1 t6, t6, t7
sw t6, 27(sp)
lw t6, 171(sp)
lw t7, 279(sp)
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 162(sp)
lw t7, 141(sp)
xor t6, t6, t7
sw t6, 15(sp)
lw t6, 279(sp)
lw t7, 27(sp)
xor a5, t6, t7
lw t6, 144(sp)
li t7, -118813598
mul t0, t6, t7
or a4, a4, a5, -13
lw t6, 90(sp)
lw t7, 162(sp)
and t6, t6, t7, 13
sw t6, 225(sp)
slli t1, a4, 2
lw t6, 27(sp)
li t7, 143418902
or t3, t6, t7, -13
lw t6, 279(sp)
lw t7, 6(sp)
and t2, t6, t7, 13
lw t6, 162(sp)
lw t7, 90(sp)
and.T a4, t6, t7, -13
lw t6, 162(sp)
li t7, 143418902
or.T t6, t6, t7
sw t6, 39(sp)
li t7, 143418902
or.1 a5, a4, t7
lw t6, 48(sp)
lw t7, 6(sp)
and.T t6, t6, t7, -13
sw t6, 270(sp)
lw t6, 162(sp)
li t7, 143418902
or t6, t6, t7, -13
sw t6, 81(sp)
lw t6, 198(sp)
and a6, t6, a4, 13
and a7, a7, t3, 13
li t7, -93765941
mul a7, a7, t7
lw t6, 162(sp)
li t7, 143418902
and.T t6, t6, t7, -13
sw t6, 300(sp)
add a7, a7, t1
lw t6, 90(sp)
lw t7, 162(sp)
or.T t6, t6, t7
sw t6, 3(sp)
lw t7, 39(sp)
and.1 t2, t2, t7, 13
lw t6, 144(sp)
li t7, -82472238
mul t6, t6, t7
sw t6, 159(sp)
lw t6, 162(sp)
lw t7, 3(sp)
xor t6, t6, t7
sw t6, 150(sp)
add t6, t0, a7
sw t6, 84(sp)
lw t6, 144(sp)
lw t7, 3(sp)
xor.T t1, t6, t7
li t7, 180727625
mul t6, t2, t7
sw t6, 138(sp)
lw t6, 162(sp)
lw t7, 27(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 162(sp)
li t7, 143418902
xor.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 24(sp)
lw t7, 3(sp)
or a7, t6, t7, -13
lw t6, 300(sp)
lw t7, 27(sp)
xor.1 t0, t6, t7
li t7, -112245349
mul a7, a7, t7
li t7, -94083214
mul t6, t0, t7
sw t6, 9(sp)
lw t6, 300(sp)
lw t7, 276(sp)
or.1 t0, t6, t7
lw t6, 177(sp)
lw t7, 144(sp)
or.T t2, t6, t7
lw t6, 162(sp)
li t7, 103311453
mul t6, t6, t7
sw t6, 192(sp)
li t7, 46006428
mul t3, t0, t7
lw t6, 3(sp)
lw t7, 39(sp)
xor.T t4, t6, t7
lw t6, 75(sp)
and.1 t6, t6, a6, 13
sw t6, 129(sp)
li t7, -190054910
mul s0, a5, t7
lw t6, 162(sp)
li t7, 61982663
mul t0, t6, t7
lw t6, 177(sp)
lw t7, 69(sp)
and a5, t6, t7, 13
lw t6, 177(sp)
lw t7, 0(sp)
and.T t5, t6, t7, -13
lw t6, 162(sp)
and.T s1, t6, a5, -13
lw t6, 72(sp)
lw t7, 27(sp)
and.1 a5, t6, t7, 13
lw t6, 90(sp)
lw t7, 162(sp)
or.1 t6, t6, t7
sw t6, 240(sp)
lw t6, 225(sp)
lw t7, 198(sp)
or.T a6, t6, t7
lw t6, 228(sp)
lw t7, 240(sp)
xor t6, t6, t7
sw t6, 264(sp)
li t7, -67115251
mul t6, s1, t7
sw t6, 0(sp)
lw t6, 15(sp)
xor.T s1, t6, t4
add t3, t3, s0
lw t7, 240(sp)
and t4, t1, t7, 13
li t7, -62287551
mul t6, t2, t7
sw t6, 15(sp)
li t7, 56591041
mul t1, s1, t7
li t7, 129668845
mul t6, t5, t7
sw t6, 261(sp)
lw t6, 144(sp)
lw t7, 258(sp)
and.1 t5, t6, t7, 13
li t7, 176475814
mul t2, t4, t7
lw t6, 225(sp)
lw t7, 27(sp)
xor s0, t6, t7
lw t6, 24(sp)
lw t7, 240(sp)
xor.T s2, t6, t7
lw t6, 162(sp)
li t7, 69456782
mul s1, t6, t7
li t7, -87209773
mul t6, a5, t7
sw t6, 315(sp)
lw t6, 225(sp)
li t7, 12101988
mul t4, t6, t7
lw t6, 198(sp)
li t7, -42626165
mul t6, t6, t7
sw t6, 69(sp)
lw t6, 90(sp)
lw t7, 162(sp)
xor.T a5, t6, t7
li t7, 183667283
mul s2, s2, t7
add t1, t1, a7
lw t6, 276(sp)
lw t7, 6(sp)
or s3, t6, t7, -13
add a7, t0, s1
lw t6, 162(sp)
li t7, 143418902
xor t6, t6, t7
sw t6, 174(sp)
li t7, 131613977
mul t6, t5, t7
sw t6, 195(sp)
li t7, -65030351
mul s0, s0, t7
lw t7, 111(sp)
xor.T t5, a5, t7
add t6, s2, t3
sw t6, 204(sp)
and.T t3, s3, a4, -13
lw t6, 48(sp)
lw t7, 240(sp)
or t0, t6, t7, -13
lw t7, 228(sp)
or.T t0, t0, t7
li t7, 160928614
mul s2, t0, t7
lw t6, 72(sp)
or t0, t6, a4, -13
lw t7, 231(sp)
or s4, t3, t7, -13
lw t6, 72(sp)
lw t7, 39(sp)
xor.1 t3, t6, t7
lw t7, 150(sp)
and.1 s3, t5, t7, 13
lw t6, 162(sp)
and s1, t6, a4, 13
lw t6, 240(sp)
lw t7, 162(sp)
and.T t6, t6, t7, -13
sw t6, 150(sp)
lw t6, 129(sp)
li t7, 118122244
mul t5, t6, t7
lw t6, 81(sp)
lw t7, 225(sp)
or.T t6, t6, t7
sw t6, 72(sp)
add s5, t2, t4
lw t6, 21(sp)
xor.1 a6, t6, a6
lw t6, 81(sp)
and.1 t2, t6, a4, 13
add s0, s0, s2
lw t6, 162(sp)
lw t7, 270(sp)
xor t4, t6, t7
lw t6, 300(sp)
xor.T s2, t6, s4
li t7, 162188740
mul t4, t4, t7
lw t6, 159(sp)
add s6, t6, s0
lw t7, 9(sp)
add s0, s5, t7
li t7, -193374981
mul s4, s3, t7
add t1, t1, s6
lw t6, 138(sp)
add s3, t6, t1
li t7, -16093641
mul s1, s1, t7
lw t6, 0(sp)
add s0, t6, s0
lw t6, 144(sp)
lw t7, 228(sp)
and t6, t6, t7, 13
sw t6, 9(sp)
lw t6, 255(sp)
xor.T t6, t6, t2
sw t6, 21(sp)
lw t6, 252(sp)
lw t7, 300(sp)
and.1 t1, t6, t7, 13
lw t6, 141(sp)
lw t7, 147(sp)
and.T t2, t6, t7, -13
lw t7, 261(sp)
add s3, s3, t7
add s1, t5, s1
li t7, -3006072
mul t5, s2, t7
add a7, a7, s1
lw t7, 144(sp)
or.T s2, t3, t7
lw t6, 246(sp)
lw t7, 162(sp)
xor.1 s5, t6, t7
lw t6, 273(sp)
add t3, t6, s4
li t7, 139079259
mul t6, t0, t7
sw t6, 129(sp)
lw t6, 177(sp)
li t7, -143418902
or.T s1, t6, t7
or.1 s2, s2, s5
li t7, 105124585
mul a6, a6, t7
lw t6, 69(sp)
add t4, t6, t4
lw t7, 228(sp)
and.T a5, a5, t7, -13
lw t6, 174(sp)
lw t7, 264(sp)
or.1 t0, t6, t7
lw t6, 204(sp)
add s4, t6, t3
lw t7, 42(sp)
add t3, t5, t7
add t5, s4, s0
add t5, s3, t5
lw t6, 258(sp)
or s0, t6, t0, -13
lw t7, 192(sp)
add t6, a6, t7
sw t6, 42(sp)
lw t6, 84(sp)
add a6, t6, t5
lw t6, 162(sp)
lw t7, 171(sp)
xor.1 t0, t6, t7
lw t6, 210(sp)
lw t7, 228(sp)
or.1 s4, t6, t7
li t7, -118917565
mul t6, t2, t7
sw t6, 138(sp)
lw t7, 174(sp)
xor.T s3, t1, t7
lw t6, 174(sp)
lw t7, 90(sp)
or.1 t1, t6, t7
lw t6, 255(sp)
lw t7, 162(sp)
or t5, t6, t7, -13
li t7, 191359730
mul t2, s2, t7
lw t6, 72(sp)
xor.1 t6, t6, s1
sw t6, 69(sp)
lw t6, 276(sp)
lw t7, 240(sp)
xor s1, t6, t7
add t6, a6, a7
sw t6, 204(sp)
li t7, 148750308
mul a6, s4, t7
lw t7, 15(sp)
add t6, t4, t7
sw t6, 0(sp)
li t7, 31514199
mul s0, s0, t7
xor t4, a4, s1
li t7, 111570566
mul a7, s3, t7
lw t7, 246(sp)
and.1 s2, a4, t7, 13
lw t7, 195(sp)
add t6, t3, t7
sw t6, 147(sp)
li t7, 189041947
mul t3, t4, t7
lw t6, 39(sp)
li t7, 79963731
mul s3, t6, t7
lw t7, 276(sp)
and.1 t4, t1, t7, 13
lw t6, 177(sp)
lw t7, 171(sp)
and.1 s4, t6, t7, 13
lw t6, 315(sp)
add t6, t6, a7
sw t6, 15(sp)
lw t6, 9(sp)
li t7, -129435617
mul t1, t6, t7
lw t6, 81(sp)
li t7, 52220736
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 6(sp)
lw t7, 162(sp)
xor.1 s5, t6, t7
lw t6, 279(sp)
lw t7, 300(sp)
or.1 s1, t6, t7
lw t6, 3(sp)
lw t7, 39(sp)
xor.1 a7, t6, t7
and.T t0, s5, t0, -13
li t7, -97193711
mul s5, t0, t7
lw t6, 228(sp)
and.1 s4, t6, s4, 13
lw t6, 162(sp)
li t7, 125361670
mul t0, t6, t7
lw t6, 144(sp)
or.T s6, t6, a5
add a5, s3, s5
lw t7, 171(sp)
and.1 t5, t5, t7, 13
lw t6, 81(sp)
lw t7, 48(sp)
xor s3, t6, t7
lw t6, 111(sp)
or.T s5, t6, s2
lw t6, 21(sp)
and.T s6, t6, s6, -13
lw t6, 228(sp)
li t7, -104618914
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 162(sp)
li t7, -158384806
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 246(sp)
lw t7, 81(sp)
xor.T s2, t6, t7
add s7, t2, s0
li t7, 34667568
mul t2, t5, t7
lw t6, 312(sp)
xor t5, t6, s4
lw t7, 129(sp)
add s4, t2, t7
lw t7, 111(sp)
or.1 s3, s3, t7
lw t6, 90(sp)
lw t7, 39(sp)
and.T s0, t6, t7, -13
or.1 t2, s1, s5
li t7, -83048948
mul s5, s6, t7
li t7, 82016201
mul s0, s0, t7
add a6, s4, a6
add s1, a5, t3
lw t7, 42(sp)
add s4, s7, t7
li t7, 32656755
mul t3, t4, t7
lw t6, 174(sp)
or.T a5, t6, s2
lw t6, 3(sp)
lw t7, 162(sp)
or s6, t6, t7, -13
lw t6, 240(sp)
li t7, 193030503
mul t6, t6, t7
sw t6, 192(sp)
lw t6, 69(sp)
lw t7, 150(sp)
or.T s7, t6, t7
add t4, t1, s5
li t7, 161452362
mul s2, s3, t7
lw t6, 48(sp)
lw t7, 162(sp)
or t6, t6, t7, -13
sw t6, 111(sp)
lw t7, 213(sp)
or t6, s6, t7, -13
sw t6, 72(sp)
xor.1 s3, a4, s7
lw t7, 15(sp)
add s4, s4, t7
li t7, -152288182
mul t5, t5, t7
li t7, 139932737
mul t1, a7, t7
add s2, t5, s2
add t6, s0, t0
sw t6, 159(sp)
add a7, s4, s1
li t7, -86028651
mul t5, s3, t7
lw t6, 189(sp)
lw t7, 228(sp)
or.T t6, t6, t7
sw t6, 15(sp)
lw t6, 0(sp)
add a7, t6, a7
lw t6, 138(sp)
add t0, t6, s2
lw t6, 24(sp)
lw t7, 198(sp)
xor.T t6, t6, t7
sw t6, 129(sp)
add t4, t4, t0
lw t6, 144(sp)
lw t7, 246(sp)
xor t0, t6, t7
add t3, t4, t3
add t6, a6, t3
sw t6, 42(sp)
li t7, 34974165
mul t3, t2, t7
lw t6, 6(sp)
lw t7, 27(sp)
and.T a6, t6, t7, -13
lw t6, 147(sp)
add t6, t6, a7
sw t6, 0(sp)
lw t6, 279(sp)
li t7, 171177575
mul t2, t6, t7
lw t6, 279(sp)
and.1 a7, t6, a4, 13
add t1, t1, t5
lw t6, 24(sp)
lw t7, 81(sp)
and t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 279(sp)
or.1 s0, t6, a6
lw t6, 24(sp)
lw t7, 39(sp)
xor t4, t6, t7
lw t6, 246(sp)
li t7, 83149221
mul t5, t6, t7
lw t6, 48(sp)
lw t7, 39(sp)
and.T a6, t6, t7, -13
lw t6, 276(sp)
lw t7, 162(sp)
and.1 t6, t6, t7, 13
sw t6, 69(sp)
li t7, 189271276
mul s1, s0, t7
lw t7, 9(sp)
add t3, t3, t7
lw t6, 162(sp)
lw t7, 231(sp)
or s2, t6, t7, -13
lw t6, 300(sp)
xor.1 s0, t6, a5
lw t6, 246(sp)
li t7, 193293798
mul a5, t6, t7
li t7, 29543511
mul s3, s0, t7
lw t6, 84(sp)
add s0, t6, t3
and.T t3, s2, t4, -13
lw t6, 6(sp)
lw t7, 162(sp)
and s2, t6, t7, 13
lw t7, 285(sp)
add t4, a5, t7
lw t6, 27(sp)
lw t7, 279(sp)
and.1 a5, t6, t7, 13
add t2, s3, t2
lw t6, 93(sp)
add s1, t6, s1
lw t6, 3(sp)
li t7, -52577640
mul t6, t6, t7
sw t6, 150(sp)
lw t6, 144(sp)
lw t7, 177(sp)
and s3, t6, t7, 13
add s1, s1, t5
lw t7, 177(sp)
xor t5, s3, t7
lw t6, 72(sp)
or.T s3, t6, t0
li t7, -45041048
mul t5, t5, t7
add s0, s0, t2
li t7, -24208741
mul t0, s2, t7
lw t6, 27(sp)
lw t7, 162(sp)
and.T t6, t6, t7, -13
sw t6, 93(sp)
li t7, -163590860
mul t2, s3, t7
lw t6, 165(sp)
add t6, t6, s1
sw t6, 84(sp)
lw t6, 246(sp)
li t7, 143418902
and.T s1, t6, t7, -13
add t6, t1, s0
sw t6, 138(sp)
lw t6, 24(sp)
lw t7, 279(sp)
xor.T t6, t6, t7
sw t6, 189(sp)
li t7, 72083616
mul t6, t3, t7
sw t6, 210(sp)
add t6, t5, t4
sw t6, 198(sp)
li t7, -47552647
mul t1, s1, t7
li t7, -40496607
mul a7, a7, t7
li t7, 148084505
mul t6, a5, t7
sw t6, 72(sp)
lw t6, 228(sp)
lw t7, 162(sp)
and.T a5, t6, t7, -13
lw t6, 39(sp)
or t3, t6, a5, -13
lw t6, 129(sp)
li t7, 19554125
mul a5, t6, t7
lw t6, 246(sp)
li t7, 89835261
mul t6, t6, t7
sw t6, 213(sp)
add t0, t0, t2
li t7, 78497859
mul t6, a6, t7
sw t6, 9(sp)
li t7, -78291618
mul t6, t3, t7
sw t6, 165(sp)
lw t6, 27(sp)
li t7, 188207009
mul t6, t6, t7
sw t6, 195(sp)
lw t6, 162(sp)
lw t7, 225(sp)
xor a6, t6, t7
lw t6, 240(sp)
lw t7, 39(sp)
xor.T t2, t6, t7
lw t6, 225(sp)
lw t7, 174(sp)
and t6, t6, t7, 13
sw t6, 228(sp)
lw t6, 111(sp)
xor.1 t6, t6, t2
sw t6, 147(sp)
lw t6, 162(sp)
li t7, -164830649
mul t6, t6, t7
sw t6, 129(sp)
add a7, t1, a7
lw t7, 69(sp)
or.T a6, a6, t7
lw t6, 258(sp)
lw t7, 240(sp)
and t6, t6, t7, 13
sw t6, 111(sp)
lw t6, 90(sp)
lw t7, 81(sp)
or.1 t1, t6, t7
lw t6, 192(sp)
add t6, t6, t0
sw t6, 144(sp)
lw t6, 81(sp)
or.T t0, t6, a4
lw t7, 240(sp)
or.1 t6, t0, t7
sw t6, 27(sp)
lw t6, 90(sp)
lw t7, 24(sp)
or t6, t6, t7, -13
sw t6, 69(sp)
add a5, a7, a5
li t7, -146490761
mul t6, t1, t7
sw t6, 192(sp)
lw t6, 24(sp)
lw t7, 75(sp)
xor.T t6, t6, t7
sw t6, 252(sp)
li t7, 162629793
mul t6, a6, t7
sw t6, 75(sp)
lw t6, 210(sp)
add t6, t6, a5
sw t6, 90(sp)
lw t6, 177(sp)
lw t7, 189(sp)
and.1 a7, t6, t7, 13
lw t6, 84(sp)
lw t7, 198(sp)
add t0, t6, t7
lw t6, 225(sp)
lw t7, 102(sp)
xor a6, t6, t7
lw t6, 150(sp)
lw t7, 228(sp)
add a5, t6, t7
lw t6, 93(sp)
li t7, 170117056
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 6(sp)
lw t7, 252(sp)
or t1, t6, t7, -13
lw t6, 174(sp)
and.1 t6, t6, t1, 13
sw t6, 84(sp)
li t7, -192370483
mul t3, a7, t7
lw t7, 15(sp)
xor.1 a7, a4, t7
lw t6, 9(sp)
lw t7, 165(sp)
add t1, t6, t7
lw t6, 90(sp)
add t4, t6, t1
lw t6, 27(sp)
lw t7, 162(sp)
and t2, t6, t7, 13
lw t7, 195(sp)
add t1, t0, t7
lw t7, 75(sp)
add t0, t3, t7
add t6, t4, t0
sw t6, 15(sp)
lw t6, 306(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 75(sp)
lw t6, 192(sp)
lw t7, 57(sp)
add t0, t6, t7
lw t7, 39(sp)
and.1 a4, a4, t7, 13
lw t6, 72(sp)
add a5, t6, a5
lw t7, 129(sp)
add t1, t1, t7
li t7, -137915394
xor.1 t6, a3, t7
sw t6, 72(sp)
lw t6, 144(sp)
add t3, t6, t1
lw t6, 162(sp)
lw t7, 3(sp)
xor.T t1, t6, t7
lw t7, 111(sp)
or.1 t4, a7, t7
lw t7, 225(sp)
and.T a7, t1, t7, -13
lw t6, 69(sp)
lw t7, 147(sp)
xor.T t5, t6, t7
li t7, -110787891
mul a7, a7, t7
lw t6, 231(sp)
lw t7, 240(sp)
or t1, t6, t7, -13
lw t6, 258(sp)
lw t7, 3(sp)
or.T t6, t6, t7
sw t6, 57(sp)
lw t6, 48(sp)
lw t7, 171(sp)
and s1, t6, t7, 13
li t7, 8742062
mul s0, t5, t7
lw t7, 171(sp)
xor.T t5, a4, t7
lw t7, 39(sp)
or a4, s1, t7, -13
li t7, -188935171
mul s1, t2, t7
lw t7, 162(sp)
and t2, a6, t7, 13
add a6, s0, s1
li t7, 119709347
mul s0, a4, t7
lw t6, 183(sp)
lw t7, 216(sp)
or.1 a4, t6, t7
lw t7, 309(sp)
add a6, a6, t7
slli t5, t5, 8
li t7, -70681211
mul t6, t4, t7
sw t6, 27(sp)
li t7, 128692078
mul t6, t2, t7
sw t6, 9(sp)
lw t6, 159(sp)
add t2, t6, t3
add s0, t0, s0
lw t6, 276(sp)
lw t7, 162(sp)
xor.T t0, t6, t7
lw t6, 213(sp)
add t4, t6, t5
lw t6, 138(sp)
add t3, t6, t2
lw t6, 30(sp)
lw t7, 219(sp)
or.T t2, t6, t7
lw t6, 180(sp)
li t7, 97505058
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 291(sp)
lw t7, 243(sp)
and.1 t5, t6, t7, 13
li t7, -125138126
mul s1, t1, t7
lw t7, 21(sp)
add t1, t3, t7
lw t6, 42(sp)
add t3, t6, t1
lw t6, 72(sp)
lw t7, 183(sp)
xor.T t1, t6, t7
lw t6, 243(sp)
or.T t6, t6, a3
sw t6, 129(sp)
add a7, a7, s0
add a5, a5, a7
lw t6, 171(sp)
lw t7, 84(sp)
xor a7, t6, t7
li t7, 57787203
mul a7, a7, t7
add s0, t4, s1
lw t6, 156(sp)
add a7, t6, a7
lw t7, 3(sp)
xor t0, t0, t7
li t7, 53957297
mul t4, t5, t7
lw t7, 87(sp)
or.1 t5, t1, t7
li t7, -83290380
mul t1, t2, t7
lw t6, 237(sp)
or.1 t2, t6, t5
lw t7, 12(sp)
or.T t5, t2, t7
lw t6, 66(sp)
li t7, 181899810
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 0(sp)
add t3, t6, t3
lw t6, 57(sp)
lw t7, 246(sp)
or.1 t2, t6, t7
add a6, a6, s0
add a5, a5, a6
li t7, -145842655
mul a6, t5, t7
lw t7, 15(sp)
add t6, t3, t7
sw t6, 12(sp)
lw t6, 81(sp)
and.T t0, t6, t0, -13
li t7, -118511916
mul t0, t0, t7
li t7, -61707964
mul a4, a4, t7
lw t6, 75(sp)
li t7, -4554146
mul t5, t6, t7
add t3, t4, a6
lw t6, 207(sp)
lw t7, 129(sp)
xor.T a6, t6, t7
li t7, 25879097
mul t4, t2, t7
li t7, -55415516
mul a6, a6, t7
lw t6, 234(sp)
li t7, -137915394
and.1 t6, t6, t7, 13
sw t6, 48(sp)
lw t6, 135(sp)
lw t7, 9(sp)
add t2, t6, t7
li t7, -153033342
add t4, t4, t7
add a4, t5, a4
lw t7, 45(sp)
add t1, t1, t7
add a7, a7, t4
lw t6, 126(sp)
add t6, t6, t3
sw t6, 9(sp)
lw t6, 207(sp)
li t7, -137915394
and.1 t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 129(sp)
lw t7, 291(sp)
xor t6, t6, t7
sw t6, 39(sp)
lw t6, 21(sp)
lw t7, 201(sp)
xor.1 t3, t6, t7
lw t6, 243(sp)
li t7, -137915394
or.1 t6, t6, t7
sw t6, 84(sp)
lw t6, 48(sp)
li t7, 148909941
mul t4, t6, t7
lw t6, 243(sp)
li t7, -137915394
and t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 27(sp)
add a7, t6, a7
lw t6, 24(sp)
add t5, t6, a7
li t7, 155620761
mul a7, t3, t7
lw t6, 207(sp)
lw t7, 45(sp)
and.T s0, t6, t7, -13
lw t6, 84(sp)
li t7, 145852712
mul t3, t6, t7
add t0, t5, t0
lw t6, 219(sp)
li t7, 56878829
mul t5, t6, t7
lw t7, 234(sp)
and s1, a3, t7, 13
and s0, s0, a3, 13
li t7, -137915394
or t6, a3, t7, -13
sw t6, 135(sp)
add t0, t0, t2
lw t7, 234(sp)
xor.T t6, a3, t7
sw t6, 42(sp)
add t1, t1, t4
lw t6, 234(sp)
li t7, -137915394
or.T t2, t6, t7
lw t6, 303(sp)
slli t6, t6, 6
sw t6, 15(sp)
add t0, a5, t0
lw t6, 63(sp)
xor.T a5, t6, s1
lw t6, 243(sp)
li t7, -137915394
xor.T t6, t6, t7
sw t6, 102(sp)
add a6, t1, a6
li t7, 140237962
mul t1, a5, t7
add t4, a7, t5
li t7, -171980309
mul a7, s0, t7
lw t6, 129(sp)
lw t7, 135(sp)
or.T a5, t6, t7
lw t6, 243(sp)
li t7, -137915394
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 3(sp)
add t1, t6, t1
add t1, t1, t3
add a4, a4, t4
lw t7, 318(sp)
xor.T t3, t2, t7
lw t7, 6(sp)
add a4, a4, t7
lw t6, 0(sp)
lw t7, 42(sp)
xor.T t4, t6, t7
lw t6, 12(sp)
add t2, t6, t0
lw t6, 243(sp)
li t7, -143492256
xor t0, t6, t7
lw t6, 54(sp)
or.T t4, t6, t4
lw t7, 243(sp)
xor.1 t6, a3, t7
sw t6, 93(sp)
lw t6, 204(sp)
add t6, t6, t2
sw t6, 57(sp)
lw t7, 234(sp)
xor t6, a3, t7
sw t6, 90(sp)
lw t6, 66(sp)
lw t7, 102(sp)
and.T t2, t6, t7, -13
lw t6, 39(sp)
and t5, t6, t3, 13
lw t6, 90(sp)
and.T t3, t6, t0, -13
li t7, 30250929
mul a5, a5, t7
lw t6, 36(sp)
li t7, 64333679
mul t0, t6, t7
lw t6, 36(sp)
lw t7, 30(sp)
and.1 s1, t6, t7, 13
and.T t4, t5, t4, -13
add a6, a6, t1
add t1, a6, a7
li t7, 18421007
mul a7, t4, t7
lw t6, 234(sp)
li t7, -137915394
or.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 144(sp)
lw t7, 267(sp)
xor.T t5, t6, t7
lw t6, 9(sp)
add s0, t6, a4
li t7, 39058786
mul a6, s1, t7
lw t6, 168(sp)
lw t7, 216(sp)
and.1 a4, t6, t7, 13
or.1 s1, t2, a4
li t7, -63341998
mul t2, t3, t7
lw t6, 105(sp)
li t7, -146761490
mul t4, t6, t7
li t7, -137915394
and.T t6, a3, t7, -13
sw t6, 12(sp)
lw t7, 234(sp)
and.T a4, a3, t7, -13
li t7, -112026748
mul t3, s1, t7
add t6, s0, t1
sw t6, 3(sp)
li t7, 165637608
mul t1, t5, t7
add t5, t0, t1
lw t7, 267(sp)
xor t0, a3, t7
lw t6, 63(sp)
and t1, t6, t0, 13
lw t7, 234(sp)
or t6, a3, t7, -13
sw t6, 69(sp)
lw t6, 42(sp)
lw t7, 90(sp)
or t0, t6, t7, -13
lw t6, 234(sp)
lw t7, 183(sp)
xor t6, t6, t7
sw t6, 9(sp)
li t7, 65205360
mul t0, t0, t7
add t0, a7, t0
lw t6, 243(sp)
li t7, -137915394
xor t6, t6, t7
sw t6, 138(sp)
li t7, -137915394
and t6, a3, t7, 13
sw t6, 111(sp)
lw t6, 294(sp)
and.T s0, t6, t1, -13
li t7, 61193893
mul t1, a4, t7
lw t6, 87(sp)
lw t7, 168(sp)
and.1 a7, t6, t7, 13
li t7, 176735157
mul s1, s0, t7
add s0, t5, t4
add t5, t2, a5
add t4, a6, s1
li t7, -137915394
and.1 t6, a3, t7, 13
sw t6, 75(sp)
lw t6, 15(sp)
add s0, t6, s0
lw t6, 111(sp)
li t7, -13018272
mul t2, t6, t7
lw t6, 249(sp)
lw t7, 114(sp)
xor.1 a5, t6, t7
lw t6, 18(sp)
lw t7, 138(sp)
xor.1 a6, t6, t7
li t7, -113701721
mul a6, a6, t7
add t3, t3, s0
add t5, t3, t5
lw t6, 243(sp)
li t7, -137915394
and.1 t6, t6, t7, 13
sw t6, 105(sp)
lw t6, 318(sp)
lw t7, 84(sp)
and t3, t6, t7, 13
add s0, t5, t4
lw t6, 243(sp)
xor t6, t6, a3
sw t6, 6(sp)
lw t6, 234(sp)
or.T t6, t6, a3
sw t6, 81(sp)
lw t6, 12(sp)
li t7, -114574020
mul t4, t6, t7
li t7, -34876326
mul t3, t3, t7
lw t6, 75(sp)
lw t7, 102(sp)
and t5, t6, t7, 13
li t7, -127986341
mul s1, t5, t7
lw t6, 81(sp)
li t7, -137915394
and s3, t6, t7, 13
lw t6, 54(sp)
lw t7, 84(sp)
and t5, t6, t7, 13
add s2, t0, s0
lw t7, 75(sp)
and.1 t0, a5, t7, 13
li t7, -38291411
mul s0, s3, t7
add t1, t1, s1
lw t6, 63(sp)
xor.1 a5, t6, a4
lw t6, 3(sp)
add t6, t6, s2
sw t6, 39(sp)
li t7, -187418945
mul a4, a7, t7
lw t6, 243(sp)
lw t7, 111(sp)
or.1 a7, t6, t7
add t1, t1, t4
li t7, 70961988
mul a7, a7, t7
add a4, a4, a7
add a7, t2, t3
add a7, a4, a7
lw t7, 66(sp)
xor.1 t2, t5, t7
lw t6, 48(sp)
lw t7, 105(sp)
xor a4, t6, t7
lw t6, 9(sp)
lw t7, 81(sp)
xor.1 t3, t6, t7
add t1, t1, s0
li t7, 116211160
mul t3, t3, t7
add t5, a6, t1
lw t7, 69(sp)
and t0, t0, t7, 13
li t7, 67437368
mul a6, t2, t7
lw t6, 168(sp)
xor.T t4, t6, a3
lw t6, 114(sp)
lw t7, 6(sp)
or.T t1, t6, t7
li t7, 144498834
mul s0, a4, t7
lw t6, 45(sp)
li t7, 137915394
and.T a4, t6, t7, -13
lw t6, 234(sp)
li t7, 172937552
mul t2, t6, t7
lw t6, 243(sp)
and s2, t6, t0, 13
lw t7, 243(sp)
or.1 s1, t1, t7
add t1, a7, s0
add t0, t5, t3
li t7, 4421425
mul t5, s2, t7
lw t6, 69(sp)
lw t7, 318(sp)
or.T s0, t6, t7
lw t7, 36(sp)
or.1 a7, a3, t7
lw t6, 183(sp)
xor.T t3, t6, a3
lw t7, 303(sp)
and s2, t3, t7, 13
lw t6, 18(sp)
lw t7, 291(sp)
and s3, t6, t7, 13
lw t6, 201(sp)
lw t7, 63(sp)
or.T t3, t6, t7
li t7, -160115695
mul s1, s1, t7
li t7, 69939735
mul s4, a5, t7
lw t6, 18(sp)
lw t7, 243(sp)
or t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 129(sp)
lw t7, 12(sp)
or.1 a5, t6, t7
add t5, s4, t5
add s1, s1, t5
li t7, 178846408
mul t5, s2, t7
lw t6, 90(sp)
or.1 s2, t6, s3
add t2, t2, t5
lw t6, 75(sp)
lw t7, 234(sp)
and.T t5, t6, t7, -13
lw t6, 318(sp)
lw t7, 234(sp)
xor s3, t6, t7
li t7, -37710949
mul t5, t5, t7
or.T s3, t4, s3
lw t6, 63(sp)
lw t7, 306(sp)
or.T s4, t6, t7
and t4, a5, a3, 13
xor a5, s4, s0
lw t7, 234(sp)
and a5, a5, t7, 13
add s0, a6, s1
lw t6, 303(sp)
or.1 a6, t6, s3
xor.T s1, a3, s2
li t7, -46448258
mul a6, a6, t7
add s0, t1, s0
li t7, 115563395
mul t1, s1, t7
add t6, t0, s0
sw t6, 15(sp)
li t7, -137915394
or.1 t6, a3, t7
sw t6, 9(sp)
lw t6, 135(sp)
lw t7, 66(sp)
xor t0, t6, t7
and a4, a4, t4, 13
xor.1 a7, t0, a7
lw t6, 216(sp)
or t0, t6, t3, -13
li t7, -137915394
or.T t6, a3, t7
sw t6, 126(sp)
lw t6, 126(sp)
li t7, -81963226
mul t4, t6, t7
lw t6, 201(sp)
lw t7, 219(sp)
xor.T t3, t6, t7
add s0, t4, a6
li t7, 18238057
mul a6, a4, t7
lw t6, 243(sp)
li t7, 153102380
mul t6, t6, t7
sw t6, 36(sp)
li t7, 29563454
mul a4, t3, t7
lw t6, 303(sp)
or.T t3, t6, a3
add t4, t5, t1
add t6, s0, t2
sw t6, 27(sp)
lw t6, 243(sp)
lw t7, 72(sp)
xor t1, t6, t7
lw t6, 105(sp)
lw t7, 63(sp)
or t2, t6, t7, -13
li t7, -45308840
mul t0, t0, t7
lw t7, 243(sp)
or t6, a3, t7, -13
sw t6, 114(sp)
and.T a7, a7, t2, -13
lw t6, 3(sp)
xor a7, t6, a7
lw t6, 138(sp)
lw t7, 168(sp)
or.T t2, t6, t7
add t6, t4, t0
sw t6, 3(sp)
xor t0, t2, t3
lw t6, 168(sp)
lw t7, 111(sp)
and.1 t2, t6, t7, 13
xor.1 t0, t0, t1
xor t3, a7, t0
lw t6, 69(sp)
li t7, 76637160
mul a7, t6, t7
lw t6, 81(sp)
lw t7, 72(sp)
or.T t1, t6, t7
lw t6, 231(sp)
li t7, -137915394
xor.1 t0, t6, t7
li t7, 35503399
mul a5, a5, t7
li t7, -87065788
mul t3, t3, t7
lw t6, 63(sp)
or t6, t6, a3, -13
sw t6, 24(sp)
add t3, t3, a4
lw t6, 234(sp)
or.1 a4, t6, a3
add a6, a6, t3
add a6, a5, a6
lw t6, 102(sp)
or.1 t3, t6, a3
lw t7, 243(sp)
and t4, a3, t7, 13
lw t6, 81(sp)
xor.T a5, t6, t1
lw t6, 318(sp)
lw t7, 75(sp)
and.T t1, t6, t7, -13
lw t7, 90(sp)
and t3, t3, t7, 13
lw t6, 93(sp)
lw t7, 186(sp)
or.T t5, t6, t7
xor t3, t3, t2
lw t6, 129(sp)
li t7, -53517909
mul t6, t6, t7
sw t6, 54(sp)
xor.T t2, a4, t5
lw t6, 306(sp)
and.1 t5, t6, a4, 13
and t4, t5, t4, 13
li t7, 83363322
mul t4, t4, t7
lw t7, 294(sp)
and t5, t0, t7, 13
slli s0, t2, 8
add a7, a7, t4
lw t6, 114(sp)
li t7, 87857752
mul t2, t6, t7
lw t6, 201(sp)
lw t7, 6(sp)
or t4, t6, t7, -13
li t7, -173571350
mul t0, t3, t7
add a7, a7, t0
lw t6, 36(sp)
add a7, t6, a7
add a6, a6, a7
li t7, -158722705
mul t0, a3, t7
li t7, -112165164
mul a7, t5, t7
add s0, a6, s0
lw t6, 93(sp)
lw t7, 111(sp)
and t3, t6, t7, 13
li t7, 183237202
mul a6, a3, t7
lw t6, 102(sp)
li t7, 158494391
mul t5, t6, t7
add t2, s0, t2
lw t6, 3(sp)
add s0, t6, t2
lw t6, 93(sp)
lw t7, 129(sp)
and t2, t6, t7, 13
lw t6, 207(sp)
li t7, 44684135
mul s1, t6, t7
and t1, t4, t1, 13
lw t6, 48(sp)
lw t7, 243(sp)
xor.T t4, t6, t7
lw t6, 318(sp)
lw t7, 42(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 27(sp)
add t6, t6, s0
sw t6, 27(sp)
lw t7, 234(sp)
xor.1 t6, a3, t7
sw t6, 36(sp)
lw t6, 36(sp)
li t7, -137915394
and.T s2, t6, t7, -13
lw t6, 216(sp)
lw t7, 69(sp)
and s4, t6, t7, 13
lw t6, 93(sp)
lw t7, 9(sp)
xor.1 s0, t6, t7
add t5, s1, t5
lw t6, 84(sp)
lw t7, 6(sp)
and s1, t6, t7, 13
xor s3, a5, s1
lw t6, 87(sp)
or.T s1, t6, t1
li t7, 110420668
mul t1, t4, t7
xor.1 s2, s4, s2
slli s4, t3, 3
lw t7, 126(sp)
and.1 a5, a4, t7, 13
lw t6, 21(sp)
lw t7, 18(sp)
and.T t4, t6, t7, -13
li t7, 132368838
mul t3, s1, t7
lw t6, 135(sp)
lw t7, 234(sp)
xor s1, t6, t7
li t7, -100802177
mul s3, s3, t7
lw t7, 24(sp)
xor.1 s0, s0, t7
add s4, s4, t0
li t7, -26176458
mul t0, s0, t7
add t5, s4, t5
li t7, 43486620
mul s0, s2, t7
lw t6, 36(sp)
li t7, -155509842
mul s2, t6, t7
lw t7, 114(sp)
and.1 t2, t2, t7, 13
add a7, a7, s3
lw t7, 12(sp)
or.T s4, a4, t7
add s3, t0, t3
li t7, 37232552
mul t0, s1, t7
li t7, -137915394
and.1 s1, s4, t7, 13
add t3, a6, s2
li t7, 175799686
mul t4, t4, t7
lw t6, 54(sp)
add a6, t6, a7
add a7, t1, t4
add t1, s3, s0
add a6, a6, t1
lw t6, 144(sp)
li t7, 102335991
mul t4, t6, t7
add a7, t5, a7
li t7, 97299729
mul t5, s1, t7
lw t6, 249(sp)
lw t7, 48(sp)
and.1 s0, t6, t7, 13
lw t6, 114(sp)
lw t7, 0(sp)
xor s1, t6, t7
li t7, -137915394
and.T t1, a5, t7, -13
lw t6, 168(sp)
xor.T a5, t6, s0
lw t6, 90(sp)
lw t7, 126(sp)
xor s0, t6, t7
lw t6, 66(sp)
lw t7, 138(sp)
xor.T s2, t6, t7
li t7, -65473531
mul s0, s0, t7
lw t7, 3(sp)
xor.T t2, t2, t7
li t7, -123095615
mul t2, t2, t7
add s3, t3, t2
li t7, -19700004
mul t3, a5, t7
or s1, s1, s2, -13
lw t6, 219(sp)
lw t7, 306(sp)
xor.T t2, t6, t7
add s2, t0, s3
add t5, t5, t4
lw t6, 129(sp)
li t7, -98165722
mul t0, t6, t7
lw t6, 306(sp)
lw t7, 243(sp)
and t4, t6, t7, 13
lw t6, 12(sp)
li t7, -137915394
xor a5, t6, t7
add t6, t5, s0
sw t6, 12(sp)
lw t6, 111(sp)
lw t7, 267(sp)
or.T t5, t6, t7
add s0, s2, t3
or t1, t1, s1, -13
and.T t5, t5, t1, -13
li t7, -88721391
mul t3, t4, t7
lw t6, 105(sp)
li t7, 104646888
mul t1, t6, t7
add t4, a7, s0
lw t6, 294(sp)
li t7, -137915394
or.1 a7, t6, t7
add a6, a6, t4
lw t6, 27(sp)
add a6, t6, a6
li t7, 141033598
mul t6, t5, t7
sw t6, 21(sp)
lw t6, 15(sp)
add t6, t6, a6
sw t6, 0(sp)
lw t7, 75(sp)
and.1 a6, t2, t7, 13
lw t6, 63(sp)
li t7, -26649709
mul t4, t6, t7
lw t6, 75(sp)
lw t7, 201(sp)
xor.1 t2, t6, t7
li t7, -88668351
mul t5, a6, t7
lw t7, 72(sp)
and.T a6, a7, t7, -13
add a7, t3, t4
lw t6, 30(sp)
li t7, 148007429
mul t3, t6, t7
add s1, a7, t0
lw t6, 9(sp)
li t7, 187798115
mul a7, t6, t7
lw t7, 45(sp)
or.1 s0, a4, t7
lw t6, 303(sp)
lw t7, 297(sp)
and t0, t6, t7, 13
li t7, 179528440
mul s3, a6, t7
lw t6, 303(sp)
xor.1 s2, t6, a4
lw t6, 63(sp)
lw t7, 72(sp)
or t4, t6, t7, -13
add a6, s1, t1
add a4, s3, t5
lw t6, 102(sp)
lw t7, 318(sp)
or s1, t6, t7, -13
li t7, -57728046
mul t1, s2, t7
lw t6, 234(sp)
lw t7, 45(sp)
or t5, t6, t7, -13
and.T t5, s0, t5, -13
lw t6, 249(sp)
lw t7, 186(sp)
or.1 s0, t6, t7
xor.1 a5, a5, s1
li t7, -130463873
mul s2, a5, t7
lw t7, 30(sp)
and.1 s1, t2, t7, 13
lw t6, 249(sp)
li t7, 80448478
mul t6, t6, t7
sw t6, 3(sp)
li t7, -165405351
mul a5, t5, t7
add t5, s2, t3
or.1 t2, t4, t0
lw t7, 6(sp)
or t0, s1, t7, -13
or t0, t0, s0, -13
lw t7, 36(sp)
and.1 t0, t0, t7, 13
add t4, a5, a7
lw t6, 18(sp)
li t7, -142554957
mul a7, t6, t7
slli a5, t0, 1
add s0, t1, a5
lw t6, 81(sp)
li t7, 163801178
mul a5, t6, t7
lw t6, 66(sp)
lw t7, 81(sp)
and.1 t0, t6, t7, 13
lw t6, 291(sp)
lw t7, 93(sp)
and.1 t3, t6, t7, 13
lw t6, 102(sp)
li t7, -137915394
or.1 t1, t6, t7
li t7, -177607076
mul t2, t2, t7
add t5, t5, s0
add t5, a6, t5
lw t6, 135(sp)
li t7, -137915394
or.T a6, t6, t7
lw t6, 33(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 66(sp)
add t4, t5, t4
add t4, a4, t4
xor a4, a3, a3
li t7, -157982641
mul s0, a4, t7
li t7, -7713884
mul a4, a6, t7
lw t6, 6(sp)
lw t7, 294(sp)
xor.1 t5, t6, t7
lw t6, 168(sp)
lw t7, 60(sp)
xor.T s1, t6, t7
lw t7, 48(sp)
or.1 a6, a3, t7
add s0, s0, a7
li t7, 54588005
mul a3, t3, t7
lw t6, 51(sp)
lw t7, 33(sp)
xor.T t6, t6, t7
sw t6, 24(sp)
li t7, -39340164
mul a7, s1, t7
add t3, t2, s0
xor t2, t0, t5
li t7, -140291507
mul t0, t1, t7
add t1, t4, t3
add t0, a5, t0
lw t6, 291(sp)
or.1 t2, t6, t2
lw t6, 21(sp)
add a5, t6, t1
lw t6, 12(sp)
add a5, t6, a5
lw t6, 78(sp)
li t7, -17588986
xor.T t6, t6, t7
sw t6, 147(sp)
lw t6, 3(sp)
add t1, t6, t0
lw t6, 51(sp)
li t7, -17588986
xor.T t6, t6, t7
sw t6, 21(sp)
lw t6, 234(sp)
lw t7, 114(sp)
xor.1 t0, t6, t7
li t7, -191255344
mul t0, t0, t7
lw t6, 33(sp)
li t7, -17588986
and.T t6, t6, t7, -13
sw t6, 69(sp)
lw t6, 33(sp)
lw t7, 66(sp)
xor.T t3, t6, t7
lw t6, 147(sp)
xor.T t3, t6, t3
lw t6, 147(sp)
lw t7, 24(sp)
and t4, t6, t7, 13
li t7, 121374379
mul t2, t2, t7
add a4, t2, a4
lw t6, 84(sp)
xor.T a6, t6, a6
li t7, 74534799
mul t2, t4, t7
li t7, -102057043
mul t3, t3, t7
add t1, t1, a4
add a4, a7, a3
add t6, t3, t2
sw t6, 165(sp)
li t7, 75730146
mul a3, a6, t7
add a6, a5, t1
add a5, a3, t0
lw t6, 0(sp)
add a6, t6, a6
lw t6, 33(sp)
li t7, -17588986
xor t6, t6, t7
sw t6, 105(sp)
lw t6, 282(sp)
lw t7, 123(sp)
and.T a3, t6, t7, -13
lw t6, 39(sp)
add a6, t6, a6
lw t6, 33(sp)
li t7, -17588986
or t6, t6, t7, -13
sw t6, 102(sp)
add a4, a4, a5
lw t6, 33(sp)
lw t7, 51(sp)
or t6, t6, t7, -13
sw t6, 168(sp)
lw t6, 51(sp)
li t7, -17588986
and t6, t6, t7, 13
sw t6, 90(sp)
add t6, a6, a4
sw t6, 171(sp)
lw t6, 21(sp)
li t7, 62679647
mul a4, t6, t7
lw t6, 78(sp)
li t7, -17588986
and.1 t6, t6, t7, 13
sw t6, 144(sp)
lw t6, 78(sp)
lw t7, 33(sp)
xor t6, t6, t7
sw t6, 39(sp)
lw t6, 39(sp)
lw t7, 69(sp)
and.T a5, t6, t7, -13
lw t7, 51(sp)
xor a7, a5, t7
lw t6, 78(sp)
li t7, -17588986
or t6, t6, t7, -13
sw t6, 135(sp)
lw t6, 144(sp)
lw t7, 102(sp)
xor.T a6, t6, t7
lw t6, 78(sp)
lw t7, 33(sp)
or.T a5, t6, t7
lw t6, 120(sp)
xor.T a7, t6, a7
li t7, -18621656
mul a7, a7, t7
lw t6, 108(sp)
lw t7, 90(sp)
or.T t0, t6, t7
lw t7, 96(sp)
or.1 t0, t0, t7
lw t7, 282(sp)
xor a6, a6, t7
li t7, -146657409
mul a6, a6, t7
add a6, a6, a7
lw t6, 168(sp)
lw t7, 135(sp)
or.1 a7, t6, t7
lw t6, 78(sp)
li t7, -17588986
or.1 t6, t6, t7
sw t6, 111(sp)
and a3, a3, t0, 13
lw t6, 33(sp)
lw t7, 51(sp)
and.1 t6, t6, t7, 13
sw t6, 12(sp)
li t7, 52362501
mul a3, a3, t7
lw t6, 33(sp)
li t7, -17588986
xor.1 t6, t6, t7
sw t6, 114(sp)
lw t6, 114(sp)
lw t7, 105(sp)
xor.T t1, t6, t7
li t7, 2593120
mul t0, a7, t7
lw t6, 51(sp)
li t7, -17588986
xor t6, t6, t7
sw t6, 48(sp)
lw t6, 33(sp)
li t7, -17588986
xor.T t6, t6, t7
sw t6, 156(sp)
lw t6, 24(sp)
lw t7, 48(sp)
or.1 a7, t6, t7
add t0, t0, a4
lw t6, 33(sp)
li t7, -17588986
and t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 12(sp)
lw t7, 48(sp)
or.T t2, t6, t7
lw t6, 48(sp)
lw t7, 99(sp)
xor.1 a4, t6, t7
add t6, a6, t0
sw t6, 3(sp)
lw t6, 33(sp)
lw t7, 12(sp)
or a6, t6, t7, -13
li t7, -25326297
mul t0, t2, t7
li t7, -17588986
and.T a5, a5, t7, -13
lw t6, 33(sp)
and.1 t1, t6, t1, 13
lw t6, 156(sp)
lw t7, 120(sp)
and t2, t6, t7, 13
lw t6, 111(sp)
or.1 t3, t6, a5
lw t6, 78(sp)
li t7, -17588986
xor t6, t6, t7
sw t6, 174(sp)
lw t6, 33(sp)
lw t7, 51(sp)
and t6, t6, t7, 13
sw t6, 81(sp)
lw t6, 78(sp)
li t7, -17588986
and.T t6, t6, t7, -13
sw t6, 126(sp)
lw t6, 120(sp)
lw t7, 156(sp)
xor.T a5, t6, t7
and t3, t2, t3, 13
lw t7, 174(sp)
and.1 t2, t1, t7, 13
lw t6, 153(sp)
lw t7, 231(sp)
or t1, t6, t7, -13
lw t6, 51(sp)
li t7, -17588986
or t6, t6, t7, -13
sw t6, 27(sp)
or.T t2, a7, t2
li t7, 41221299
mul a7, t3, t7
lw t6, 111(sp)
lw t7, 156(sp)
xor t3, t6, t7
add a7, t0, a7
add a7, a3, a7
lw t6, 51(sp)
li t7, -17588986
and.1 t6, t6, t7, 13
sw t6, 129(sp)
li t7, -23921166
mul t0, t2, t7
li t7, 187106849
mul a3, t3, t7
li t7, 91560407
mul a6, a6, t7
and.1 a4, a4, t1, 13
add a6, t0, a6
or.T a4, a5, a4
lw t6, 51(sp)
lw t7, 33(sp)
or.T t6, t6, t7
sw t6, 150(sp)
add a5, a7, a6
lw t6, 66(sp)
lw t7, 126(sp)
and a6, t6, t7, 13
lw t6, 6(sp)
lw t7, 129(sp)
xor a7, t6, t7
lw t6, 90(sp)
or a7, t6, a7, -13
li t7, 167617439
mul a6, a6, t7
lw t6, 33(sp)
lw t7, 78(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
li t7, -148108273
mul t0, a4, t7
lw t6, 12(sp)
li t7, -60003836
mul t1, t6, t7
lw t6, 129(sp)
lw t7, 51(sp)
xor.T a4, t6, t7
lw t7, 150(sp)
or.1 a4, a4, t7
li t7, 99545149
mul t3, a4, t7
lw t6, 12(sp)
lw t7, 96(sp)
or t2, t6, t7, -13
lw t6, 33(sp)
lw t7, 48(sp)
xor.T a4, t6, t7
li t7, 75553023
mul a7, a7, t7
lw t6, 78(sp)
li t7, -17588986
xor.1 t6, t6, t7
sw t6, 99(sp)
add a6, t3, a6
add a6, t0, a6
add t0, t1, a6
lw t6, 78(sp)
li t7, -17588986
or.T t6, t6, t7
sw t6, 159(sp)
lw t7, 18(sp)
xor.1 a6, t2, t7
lw t6, 99(sp)
lw t7, 27(sp)
or t1, t6, t7, -13
li t7, 166237533
mul a6, a6, t7
li t7, 898346
mul t1, t1, t7
lw t6, 51(sp)
lw t7, 33(sp)
and.T t6, t6, t7, -13
sw t6, 9(sp)
add t2, a7, a6
lw t6, 159(sp)
lw t7, 78(sp)
and a6, t6, t7, 13
lw t6, 12(sp)
lw t7, 135(sp)
or a7, t6, t7, -13
add a5, a5, t0
add t0, t2, t1
add a3, a3, t0
lw t6, 78(sp)
lw t7, 33(sp)
and t6, t6, t7, 13
sw t6, 60(sp)
lw t6, 135(sp)
lw t7, 81(sp)
xor.T t0, t6, t7
add t6, a5, a3
sw t6, 72(sp)
lw t7, 48(sp)
and a3, t0, t7, 13
xor.1 a3, a7, a3
lw t6, 69(sp)
li t7, -17588986
xor.1 a5, t6, t7
li t7, 12224941
mul a3, a3, t7
lw t6, 60(sp)
li t7, -17588986
and t0, t6, t7, 13
li t7, 80701650
mul a6, a6, t7
add a3, a6, a3
lw t6, 111(sp)
lw t7, 51(sp)
xor.T a7, t6, t7
lw t6, 33(sp)
lw t7, 51(sp)
xor t1, t6, t7
li t7, -163915269
mul t0, t0, t7
lw t6, 78(sp)
lw t7, 156(sp)
xor.T t6, t6, t7
sw t6, 93(sp)
lw t6, 33(sp)
lw t7, 78(sp)
xor.1 t6, t6, t7
sw t6, 87(sp)
lw t7, 135(sp)
xor a4, a4, t7
lw t6, 90(sp)
and.1 t3, t6, a4, 13
lw t6, 60(sp)
lw t7, 51(sp)
xor a6, t6, t7
lw t6, 51(sp)
xor a4, t6, t1
lw t6, 222(sp)
lw t7, 93(sp)
or.T t1, t6, t7
lw t6, 51(sp)
li t7, -17588986
and.T t6, t6, t7, -13
sw t6, 138(sp)
lw t7, 78(sp)
and.1 t2, a4, t7, 13
li t7, 143729567
mul t1, t1, t7
lw t6, 105(sp)
and.T a4, t6, a7, -13
li t7, 25400848
mul a4, a4, t7
lw t6, 9(sp)
lw t7, 123(sp)
or.1 t4, t6, t7
li t7, -124110011
mul t2, t2, t7
lw t6, 96(sp)
li t7, -17588986
or.1 a7, t6, t7
and a5, a5, t3, 13
lw t6, 168(sp)
lw t7, 174(sp)
or t3, t6, t7, -13
lw t6, 51(sp)
lw t7, 87(sp)
and.1 t5, t6, t7, 13
li t7, 89775236
mul a5, a5, t7
add a5, t0, a5
add a3, a3, a5
lw t6, 108(sp)
lw t7, 138(sp)
and.T s0, t6, t7, -13
lw t6, 33(sp)
lw t7, 51(sp)
xor.1 t6, t6, t7
sw t6, 0(sp)
lw t6, 138(sp)
lw t7, 222(sp)
or.1 a5, t6, t7
lw t7, 174(sp)
or.1 s1, t4, t7
lw t6, 27(sp)
lw t7, 24(sp)
or.1 t0, t6, t7
lw t6, 78(sp)
lw t7, 0(sp)
xor.1 t4, t6, t7
li t7, -94949711
mul a5, a5, t7
and.1 t5, t5, s0, 13
or.T a6, s1, a6
li t7, -68827609
mul a6, a6, t7
add a6, t1, a6
lw t6, 168(sp)
lw t7, 21(sp)
or.1 t1, t6, t7
lw t6, 231(sp)
and s0, t6, t3, 13
add t2, a6, t2
lw t6, 111(sp)
lw t7, 33(sp)
or a6, t6, t7, -13
lw t7, 51(sp)
or.T t3, t4, t7
li t7, -192989112
mul t3, t3, t7
li t7, 170322894
mul t4, t5, t7
li t7, -114068347
mul t5, s0, t7
li t7, -38427864
mul t1, t1, t7
add t4, t4, t1
li t7, -112941541
mul t1, a7, t7
lw t6, 33(sp)
li t7, -17588986
or.1 t6, t6, t7
sw t6, 63(sp)
add a4, a4, t5
add a4, a4, t3
lw t6, 33(sp)
lw t7, 78(sp)
or t6, t6, t7, -13
sw t6, 30(sp)
add a4, a4, t4
lw t6, 156(sp)
lw t7, 96(sp)
xor t3, t6, t7
add t2, t2, a4
li t7, 58514964
mul t6, t0, t7
sw t6, 15(sp)
lw t6, 39(sp)
lw t7, 51(sp)
xor.T a7, t6, t7
lw t6, 51(sp)
lw t7, 81(sp)
xor.1 a4, t6, t7
lw t6, 78(sp)
li t7, -17588986
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 30(sp)
lw t7, 87(sp)
or t0, t6, t7, -13
add a3, a3, t2
lw t7, 63(sp)
xor.1 t2, t3, t7
lw t6, 111(sp)
lw t7, 33(sp)
and.1 t4, t6, t7, 13
lw t6, 51(sp)
or t2, t6, t2, -13
li t7, -90289169
mul t2, t2, t7
li t7, -1528458
mul t3, t0, t7
add t0, t1, a5
li t7, 7465989
mul a5, t4, t7
lw t6, 33(sp)
lw t7, 33(sp)
xor t4, t6, t7
lw t6, 21(sp)
lw t7, 6(sp)
xor.1 t1, t6, t7
li t7, 145936665
add t2, t2, t7
lw t6, 87(sp)
xor.T t4, t6, t4
add t0, t0, t2
li t7, 176312899
mul a6, a6, t7
add a3, a3, t0
lw t6, 36(sp)
li t7, -52396778
mul t2, t6, t7
lw t6, 63(sp)
xor.T t0, t6, t4
lw t7, 30(sp)
or a7, a7, t7, -13
li t7, 45868178
mul t0, t0, t7
add a3, a3, t3
lw t6, 51(sp)
li t7, 111140745
mul t3, t6, t7
lw t6, 114(sp)
and.T t1, t6, t1, -13
lw t6, 78(sp)
lw t7, 33(sp)
or.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 33(sp)
li t7, -17588986
and.1 t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 51(sp)
li t7, -17588986
xor.1 t6, t6, t7
sw t6, 84(sp)
li t7, 11182039
mul t1, t1, t7
li t7, 73473562
mul t5, a7, t7
add t1, t3, t1
lw t6, 123(sp)
lw t7, 51(sp)
and a7, t6, t7, 13
li t7, -53057278
mul t6, a7, t7
sw t6, 45(sp)
lw t6, 33(sp)
li t7, -190483612
mul a7, t6, t7
lw t6, 51(sp)
lw t7, 222(sp)
and.1 t3, t6, t7, 13
lw t6, 54(sp)
or t4, t6, t3, -13
lw t7, 84(sp)
and.T a4, a4, t7, -13
lw t6, 9(sp)
lw t7, 51(sp)
xor.T t6, t6, t7
sw t6, 75(sp)
li t7, 187723718
mul t3, a4, t7
add s0, t2, t5
lw t6, 42(sp)
lw t7, 153(sp)
or a4, t6, t7, -13
li t7, -92072471
mul t5, a4, t7
lw t6, 168(sp)
lw t7, 24(sp)
xor s1, t6, t7
lw t6, 75(sp)
li t7, -34370801
mul t2, t6, t7
lw t6, 93(sp)
li t7, 82455956
mul a4, t6, t7
add s0, s0, a5
lw t6, 123(sp)
lw t7, 78(sp)
xor.1 a5, t6, t7
lw t6, 78(sp)
li t7, -115158141
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 39(sp)
and.1 s1, t6, s1, 13
add a6, a6, s0
add t0, a6, t0
lw t6, 126(sp)
lw t7, 108(sp)
xor.1 a6, t6, t7
xor.T t4, t4, s1
lw t6, 15(sp)
add t0, t6, t0
add t1, t0, t1
li t7, 85363975
mul t0, t4, t7
li t7, 72916747
mul a6, a6, t7
add t0, t0, t5
add t1, t1, t3
add a3, a3, t1
lw t6, 72(sp)
add a3, t6, a3
lw t6, 3(sp)
add a3, t6, a3
lw t6, 165(sp)
add t6, t6, a3
sw t6, 3(sp)
add a3, a7, t0
lw t6, 81(sp)
li t7, -110235508
mul t0, t6, t7
add a3, a3, t2
slli t1, a5, 7
lw t6, 96(sp)
li t7, -97163336
mul t2, t6, t7
lw t6, 33(sp)
slli a7, t6, 3
lw t6, 129(sp)
lw t7, 135(sp)
and a5, t6, t7, 13
lw t6, 78(sp)
li t7, -49249713
mul t3, t6, t7
add a6, a6, t3
add a7, a6, a7
add t1, t1, t2
lw t6, 69(sp)
li t7, -17588986
xor t3, t6, t7
add t2, a4, t0
lw t6, 99(sp)
lw t7, 9(sp)
or.1 a6, t6, t7
lw t6, 105(sp)
lw t7, 90(sp)
and.T a4, t6, t7, -13
lw t7, 150(sp)
and.T t4, a6, t7, -13
lw t6, 150(sp)
lw t7, 63(sp)
xor a6, t6, t7
lw t6, 51(sp)
li t7, -17588986
or.T t6, t6, t7
sw t6, 72(sp)
lw t6, 24(sp)
lw t7, 51(sp)
or.1 t0, t6, t7
li t7, 35554839
mul t4, t4, t7
li t7, -155044912
mul t3, t3, t7
add t1, t1, t4
add t1, t2, t1
lw t6, 78(sp)
lw t7, 66(sp)
and.T t2, t6, t7, -13
add t4, a7, t1
lw t6, 33(sp)
li t7, -17588986
or.T t6, t6, t7
sw t6, 15(sp)
lw t6, 12(sp)
lw t7, 33(sp)
xor t1, t6, t7
lw t6, 6(sp)
add a7, t6, t3
add t6, a3, t4
sw t6, 69(sp)
li t7, 43185863
mul a3, t2, t7
lw t6, 120(sp)
lw t7, 231(sp)
and t2, t6, t7, 13
xor.1 a4, a4, a5
and.T t0, t2, t0, -13
or.T a5, a6, a4
lw t6, 15(sp)
lw t7, 72(sp)
xor.1 a6, t6, t7
lw t6, 168(sp)
lw t7, 78(sp)
and a4, t6, t7, 13
lw t6, 111(sp)
xor t2, t6, a6
li t7, 119886189
mul t3, t0, t7
lw t6, 90(sp)
lw t7, 114(sp)
and.T t0, t6, t7, -13
li t7, 31047262
mul a5, a5, t7
li t7, -17588986
and.1 a6, t1, t7, 13
add a5, t3, a5
li t7, -17499144
mul t1, t2, t7
add t6, a7, a5
sw t6, 12(sp)
add t6, a3, t1
sw t6, 6(sp)
lw t6, 51(sp)
lw t7, 54(sp)
and.1 a5, t6, t7, 13
lw t6, 51(sp)
slli a3, t6, 3
li t7, -75529823
mul t1, a5, t7
lw t6, 36(sp)
lw t7, 168(sp)
and.1 t2, t6, t7, 13
lw t6, 24(sp)
lw t7, 153(sp)
or.1 a7, t6, t7
lw t6, 51(sp)
lw t7, 18(sp)
and.T a5, t6, t7, -13
or.T t0, t0, t2
lw t6, 24(sp)
lw t7, 51(sp)
and.1 t2, t6, t7, 13
lw t6, 117(sp)
xor.T t0, t6, t0
and.T a6, a6, t0, -13
lw t6, 36(sp)
lw t7, 51(sp)
or.1 t3, t6, t7
li t7, 56167668
mul t0, a6, t7
li t7, -3950544
mul a6, t3, t7
lw t6, 114(sp)
xor t2, t6, t2
add a6, t1, a6
or.T a4, t2, a4
li t7, -126595439
mul a4, a4, t7
li t7, -17588986
xor.1 t1, a7, t7
lw t6, 123(sp)
lw t7, 33(sp)
xor.1 t2, t6, t7
add a4, t0, a4
lw t6, 27(sp)
li t7, -17588986
or.1 a7, t6, t7
lw t6, 78(sp)
and.1 t0, t6, t2, 13
lw t6, 78(sp)
lw t7, 33(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
and.T t0, t0, t1, -13
lw t6, 0(sp)
lw t7, 144(sp)
and.T t1, t6, t7, -13
or.1 a5, t1, a5
li t7, 43703027
mul t1, t0, t7
li t7, 34787580
mul t0, a5, t7
add a3, t1, a3
lw t6, 288(sp)
li t7, 134618781
mul a5, t6, t7
add a3, a6, a3
add a4, a4, a3
lw t6, 222(sp)
lw t7, 21(sp)
or a6, t6, t7, -13
li t7, -86437654
mul a3, a7, t7
add a7, a3, t0
lw t6, 15(sp)
lw t7, 174(sp)
and.T a3, t6, t7, -13
lw t7, 18(sp)
or.1 a6, a6, t7
li t7, -163410685
mul a6, a6, t7
add a6, a7, a6
lw t6, 78(sp)
lw t7, 63(sp)
xor.1 t0, t6, t7
lw t6, 282(sp)
lw t7, 30(sp)
or.1 a7, t6, t7
li t7, -50206906
mul t1, a3, t7
li t7, -140913460
mul a3, t0, t7
add a5, a5, t1
lw t7, 78(sp)
xor a7, a7, t7
add a6, a6, a5
lw t6, 222(sp)
lw t7, 78(sp)
or.1 a5, t6, t7
li t7, -99786256
mul a7, a7, t7
add a6, a6, a7
add a6, a4, a6
lw t6, 78(sp)
lw t7, 15(sp)
or.T a7, t6, t7
lw t6, 126(sp)
lw t7, 51(sp)
or.1 a4, t6, t7
lw t6, 60(sp)
lw t7, 102(sp)
or.1 t0, t6, t7
or.1 a5, a5, t0
or.T a7, a7, a5
lw t6, 33(sp)
lw t7, 99(sp)
xor a5, t6, t7
li t7, -93530617
mul a5, a5, t7
lw t6, 6(sp)
add a6, t6, a6
lw t6, 12(sp)
add t0, t6, a6
lw t6, 138(sp)
lw t7, 33(sp)
or.T a6, t6, t7
lw t7, 18(sp)
xor.T a6, a6, t7
li t7, -140013485
mul t6, a6, t7
sw t6, 12(sp)
lw t6, 9(sp)
lw t7, 72(sp)
or.1 a6, t6, t7
li t7, 157479202
mul a7, a7, t7
lw t6, 69(sp)
add t0, t6, t0
lw t6, 45(sp)
add t6, t6, t0
sw t6, 0(sp)
add t6, a3, a7
sw t6, 6(sp)
li t7, -166443629
mul a3, a4, t7
lw t6, 51(sp)
lw t7, 39(sp)
xor a7, t6, t7
add a3, a5, a3
lw t6, 24(sp)
lw t7, 33(sp)
or.1 a4, t6, t7
li t7, -19780338
mul a4, a4, t7
lw t6, 99(sp)
lw t7, 54(sp)
xor a5, t6, t7
lw t6, 48(sp)
lw t7, 87(sp)
and.T t0, t6, t7, -13
lw t6, 90(sp)
xor.T t0, t6, t0
lw t6, 60(sp)
lw t7, 147(sp)
xor.1 t1, t6, t7
li t7, 135471060
mul t1, t1, t7
add a4, a4, t1
and a5, a5, t0, 13
slli a5, a5, 4
lw t6, 222(sp)
li t7, -17588986
xor t0, t6, t7
lw t6, 66(sp)
lw t7, 156(sp)
xor t1, t6, t7
lw t6, 75(sp)
and t2, t6, t1, 13
li t7, 79646073
mul t0, t0, t7
li t7, 25399531
mul a7, a7, t7
lw t6, 159(sp)
lw t7, 78(sp)
or.1 t1, t6, t7
xor a6, a6, t2
lw t6, 150(sp)
lw t7, 282(sp)
or.T t2, t6, t7
lw t6, 81(sp)
lw t7, 96(sp)
or.T t3, t6, t7
li t7, -90711960
mul a6, a6, t7
add a6, a6, t0
li t7, 179025001
mul t2, t2, t7
lw t6, 138(sp)
li t7, -34341832
mul t0, t6, t7
lw t7, 168(sp)
and.T t3, t3, t7, -13
lw t6, 33(sp)
lw t7, 84(sp)
xor.1 t4, t6, t7
lw t7, 15(sp)
xor t4, t4, t7
and t3, t1, t3, 13
li t7, -157528211
mul t1, t4, t7
li t7, -60681096
mul t3, t3, t7
add t3, t3, t2
lw t6, 42(sp)
lw t7, 78(sp)
or t2, t6, t7, -13
add t3, a7, t3
lw t6, 18(sp)
li t7, -154176642
mul a7, t6, t7
li t7, 80686954
mul t2, t2, t7
add a6, a6, t3
add t1, t1, t2
add t0, t0, t1
add a7, t0, a7
add a6, a6, a7
add a5, a5, a6
add a4, a4, a5
lw t6, 12(sp)
add a4, t6, a4
add a3, a3, a4
lw t6, 6(sp)
add a3, t6, a3
lw t6, 51(sp)
li t7, -103403613
or.T t6, t6, t7
sw t6, 39(sp)
lw t6, 0(sp)
add a3, t6, a3
lw t6, 51(sp)
li t7, -103403613
and a5, t6, t7, 13
lw t6, 3(sp)
add t6, t6, a3
sw t6, 174(sp)
lw t6, 174(sp)
lw t7, 171(sp)
xor t6, t6, t7
sw t6, 126(sp)
lw t6, 174(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 111(sp)
lw t6, 126(sp)
lw t7, 57(sp)
xor a3, t6, t7
li t7, -103403613
and.1 t6, a3, t7, 13
sw t6, 21(sp)
lw t6, 51(sp)
li t7, -103403613
or t6, t6, t7, -13
sw t6, 9(sp)
li t7, 109240288
xor a4, a3, t7
xor t6, a3, a3
sw t6, 168(sp)
li t7, -103403613
or.1 t6, a3, t7
sw t6, 96(sp)
lw t6, 9(sp)
lw t7, 39(sp)
xor.1 t1, t6, t7
li t7, -103403613
xor t6, a4, t7
sw t6, 36(sp)
li t7, -103403613
xor t6, a3, t7
sw t6, 12(sp)
lw t6, 96(sp)
li t7, -49943094
mul a6, t6, t7
li t7, -103403613
and t6, a4, t7, 13
sw t6, 84(sp)
or.1 t6, a4, a3
sw t6, 123(sp)
lw t6, 51(sp)
li t7, -103403613
and.1 t6, t6, t7, 13
sw t6, 72(sp)
lw t7, 21(sp)
xor.T t3, a4, t7
lw t7, 12(sp)
xor t0, a3, t7
lw t7, 51(sp)
xor.1 t6, a3, t7
sw t6, 24(sp)
lw t7, 51(sp)
and.T t6, a4, t7, -13
sw t6, 30(sp)
lw t6, 30(sp)
li t7, 184951338
mul a7, t6, t7
lw t6, 51(sp)
xor.1 t6, t6, a4
sw t6, 63(sp)
li t7, -103403613
xor.1 t6, a3, t7
sw t6, 156(sp)
lw t6, 36(sp)
lw t7, 24(sp)
xor.1 t2, t6, t7
lw t6, 51(sp)
or t6, t6, a4, -13
sw t6, 150(sp)
lw t6, 150(sp)
lw t7, 21(sp)
or.T t4, t6, t7
lw t6, 30(sp)
li t7, -103403613
and t5, t6, t7, 13
lw t6, 123(sp)
and t5, t6, t5, 13
li t7, 16214297
mul t2, t2, t7
or t6, a3, a4, -13
sw t6, 99(sp)
lw t7, 72(sp)
and s0, t0, t7, 13
li t7, -103403613
xor.T t6, a4, t7
sw t6, 81(sp)
lw t6, 99(sp)
lw t7, 63(sp)
or.T t0, t6, t7
or t3, t3, s0, -13
lw t6, 156(sp)
lw t7, 84(sp)
xor.T s0, t6, t7
or t1, t1, s0, -13
or.1 t1, t1, t5
or.T s0, a3, a5
li t7, 188460474
mul t5, t1, t7
xor.1 t4, t4, s0
lw t7, 81(sp)
or.1 t1, a4, t7
li t7, -103403613
or.T t6, a4, t7
sw t6, 93(sp)
li t7, 163927348
mul t4, t4, t7
li t7, -103403613
and.1 t6, a4, t7, 13
sw t6, 117(sp)
li t7, 130373663
mul t3, t3, t7
add a6, a6, t5
lw t7, 51(sp)
or.T t6, a4, t7
sw t6, 108(sp)
add t6, a6, t2
sw t6, 48(sp)
li t7, -103403613
or t6, a3, t7, -13
sw t6, 144(sp)
li t7, -103403613
or.1 t6, a4, t7
sw t6, 33(sp)
lw t6, 51(sp)
li t7, -103403613
xor.1 a6, t6, t7
add a7, a7, t3
add t6, t4, a7
sw t6, 18(sp)
and.1 t6, a4, a3, 13
sw t6, 138(sp)
or a7, t1, a4, -13
lw t6, 51(sp)
li t7, -103403613
xor.T t6, t6, t7
sw t6, 54(sp)
lw t6, 51(sp)
and.1 t1, t6, a6, 13
lw t7, 51(sp)
xor.T t6, a3, t7
sw t6, 27(sp)
xor.T t6, a4, a3
sw t6, 87(sp)
lw t6, 138(sp)
and.T t2, t6, a6, -13
or.T a7, a7, t0
lw t6, 117(sp)
lw t7, 54(sp)
or.T t4, t6, t7
li t7, 48851011
mul a7, a7, t7
lw t7, 93(sp)
xor.1 t0, t2, t7
lw t6, 30(sp)
xor t3, t6, a4
xor.T a5, a5, t4
xor t6, a4, a3
sw t6, 69(sp)
li t7, -79528989
mul a5, a5, t7
lw t6, 108(sp)
lw t7, 144(sp)
and t5, t6, t7, 13
lw t7, 51(sp)
xor.T t6, a4, t7
sw t6, 120(sp)
lw t7, 120(sp)
or t4, a4, t7, -13
add a5, a7, a5
li t7, 147301505
mul t0, t0, t7
lw t7, 51(sp)
and t2, a4, t7, 13
lw t6, 51(sp)
or a7, t6, a3, -13
lw t7, 99(sp)
xor.T s0, t3, t7
or t5, t5, t1, -13
lw t6, 69(sp)
li t7, -103403613
xor.T t1, t6, t7
lw t7, 33(sp)
xor.T t3, a7, t7
li t7, 87379129
mul t5, t5, t7
lw t6, 96(sp)
or t6, t6, a6, -13
sw t6, 3(sp)
li t7, -103403613
and.T a6, t4, t7, -13
lw t7, 27(sp)
and.T t1, t1, t7, -13
and.1 t1, t1, s0, 13
li t7, 10418858
mul t1, t1, t7
lw t6, 87(sp)
xor.T t2, t6, t2
li t7, -188925820
mul t2, t2, t7
add t1, t1, t2
add t2, t5, t0
li t7, -108854542
mul t6, t3, t7
sw t6, 15(sp)
lw t6, 69(sp)
li t7, -176577003
mul t0, t6, t7
and t6, a3, a4, 13
sw t6, 60(sp)
add t2, a5, t2
li t7, -103403613
and.T t6, a4, t7, -13
sw t6, 0(sp)
lw t7, 51(sp)
or.1 a5, a3, t7
lw t6, 123(sp)
and.1 t3, t6, a5, 13
li t7, 14068277
mul t4, a6, t7
lw t6, 72(sp)
li t7, -69895710
mul t6, t6, t7
sw t6, 6(sp)
lw t7, 63(sp)
or.1 t3, t3, t7
lw t6, 108(sp)
li t7, -111712274
mul s0, t6, t7
lw t7, 0(sp)
or a6, a7, t7, -13
lw t6, 60(sp)
li t7, 152488331
mul a7, t6, t7
li t7, 138849216
mul s2, a6, t7
li t7, -162752627
mul a6, a5, t7
lw t6, 93(sp)
lw t7, 120(sp)
xor s1, t6, t7
add a6, a6, t0
lw t6, 138(sp)
lw t7, 21(sp)
and.T t5, t6, t7, -13
add t4, t4, s2
add a7, s0, a7
lw t6, 69(sp)
lw t7, 24(sp)
and.T t0, t6, t7, -13
add t1, t1, t4
add t2, t2, t1
lw t6, 0(sp)
lw t7, 27(sp)
xor.1 s0, t6, t7
xor t1, t3, s1
lw t6, 21(sp)
or.1 t4, t6, a4
lw t6, 18(sp)
add t6, t6, t2
sw t6, 90(sp)
lw t6, 132(sp)
li t7, -103403613
xor t2, t6, t7
lw t6, 0(sp)
lw t7, 87(sp)
and t3, t6, t7, 13
lw t6, 51(sp)
and.T t6, t6, a3, -13
sw t6, 45(sp)
li t7, 103403613
xor.1 t5, t5, t7
lw t6, 3(sp)
and.1 s0, t6, s0, 13
li t7, 117471779
mul s1, s0, t7
lw t6, 51(sp)
or.1 t6, t6, a4
sw t6, 102(sp)
lw t7, 93(sp)
and.T s2, t3, t7, -13
xor s3, a4, a4
lw t6, 102(sp)
li t7, 57751621
mul s0, t6, t7
li t7, -103403613
or t6, a4, t7, -13
sw t6, 66(sp)
lw t6, 108(sp)
li t7, -181240317
mul t3, t6, t7
and.T t6, a3, a4, -13
sw t6, 114(sp)
xor s4, s2, t1
lw t7, 51(sp)
and s2, s3, t7, 13
lw t6, 45(sp)
slli t1, t6, 5
lw t6, 15(sp)
add s1, t6, s1
li t7, -147343305
mul t2, t2, t7
li t7, -70569580
mul s3, s4, t7
lw t7, 66(sp)
xor.T t4, t4, t7
xor t0, s2, t0
lw t6, 72(sp)
and.1 t4, t6, t4, 13
add s3, s3, a7
li t7, -132687025
mul s2, t4, t7
li t7, 126855312
mul t4, t5, t7
lw t6, 231(sp)
lw t7, 12(sp)
and a7, t6, t7, 13
add a6, s3, a6
lw t6, 114(sp)
li t7, 123051486
mul s3, t6, t7
lw t7, 51(sp)
xor t6, a3, t7
sw t6, 42(sp)
add s4, a6, s0
li t7, -105963312
mul s0, t0, t7
lw t7, 45(sp)
xor t0, a4, t7
lw t7, 69(sp)
or.T a6, a4, t7
lw t6, 39(sp)
lw t7, 33(sp)
or.T t5, t6, t7
add t3, t3, s3
lw t6, 114(sp)
lw t7, 51(sp)
xor.1 s3, t6, t7
add s1, s1, s4
lw t7, 6(sp)
add t6, s1, t7
sw t6, 135(sp)
lw t6, 69(sp)
lw t7, 0(sp)
or s1, t6, t7, -13
and.T s3, s3, s1, -13
add s1, s2, t3
li t7, 90436711
mul t3, s3, t7
add t1, s0, t1
add t1, t1, t2
add t2, t4, s1
li t7, -103403613
and.T t6, a3, t7, -13
sw t6, 105(sp)
li t7, -155156238
mul t4, t5, t7
li t7, -103403613
xor.1 t6, a4, t7
sw t6, 153(sp)
add t3, t3, t4
add t2, t1, t2
lw t6, 156(sp)
lw t7, 54(sp)
and.T t1, t6, t7, -13
lw t6, 72(sp)
lw t7, 39(sp)
xor t4, t6, t7
lw t6, 51(sp)
or t5, t6, a5, -13
lw t7, 84(sp)
or t5, t5, t7, -13
lw t6, 51(sp)
or s0, t6, t4, -13
li t7, 69081048
mul s1, t5, t7
lw t6, 153(sp)
lw t7, 9(sp)
xor.T t4, t6, t7
lw t7, 105(sp)
xor t0, t0, t7
li t7, 16104150
mul t0, t0, t7
lw t6, 42(sp)
or t5, t6, a5, -13
li t7, 61467993
mul t4, t4, t7
and.T a7, a7, s0, -13
add a5, t0, s1
add a5, t3, a5
lw t6, 120(sp)
lw t7, 9(sp)
xor t3, t6, t7
add a5, t2, a5
li t7, -103403613
or.T t6, a3, t7
sw t6, 147(sp)
lw t7, 51(sp)
or.T t6, a3, t7
sw t6, 3(sp)
li t7, -135125364
mul t0, t1, t7
lw t7, 81(sp)
and.T a6, a6, t7, -13
li t7, 165018565
mul t1, t5, t7
lw t6, 51(sp)
li t7, -103403613
or.1 t6, t6, t7
sw t6, 18(sp)
add t2, t1, t4
lw t6, 147(sp)
li t7, -103403613
xor t4, t6, t7
lw t6, 81(sp)
li t7, 157061870
mul t1, t6, t7
lw t7, 18(sp)
xor.T t5, a4, t7
lw t7, 153(sp)
xor t3, t3, t7
li t7, -106222521
mul t3, t3, t7
li t7, -58500184
mul a6, a6, t7
xor a7, a7, t4
li t7, 175053980
mul t4, a7, t7
li t7, 36264993
mul a7, t5, t7
add t6, a7, t3
sw t6, 6(sp)
lw t6, 9(sp)
li t7, -1260652
mul a7, t6, t7
add t0, t4, t0
lw t6, 51(sp)
and.1 t6, t6, a4, 13
sw t6, 129(sp)
add t2, t2, t0
li t7, -103403613
and t6, a3, t7, 13
sw t6, 75(sp)
lw t6, 3(sp)
li t7, 190861168
mul t0, t6, t7
add a5, a5, t2
lw t6, 3(sp)
lw t7, 51(sp)
and.1 t3, t6, t7, 13
add t1, t1, a7
lw t6, 45(sp)
li t7, -103403613
and a7, t6, t7, 13
lw t6, 129(sp)
li t7, 152325312
mul t2, t6, t7
lw t6, 60(sp)
lw t7, 36(sp)
or t4, t6, t7, -13
lw t6, 168(sp)
lw t7, 54(sp)
and s0, t6, t7, 13
lw t6, 51(sp)
lw t7, 120(sp)
and t5, t6, t7, 13
lw t6, 51(sp)
li t7, -103403613
and.T t6, t6, t7, -13
sw t6, 78(sp)
lw t6, 78(sp)
xor.1 t6, t6, a4
sw t6, 15(sp)
lw t6, 72(sp)
lw t7, 75(sp)
and s2, t6, t7, 13
lw t7, 21(sp)
and.1 s0, s0, t7, 13
lw t7, 120(sp)
and.1 s1, s0, t7, 13
li t7, 150550474
mul t5, t5, t7
li t7, -114748730
mul s2, s2, t7
or.1 s0, a7, t4
lw t6, 9(sp)
or t4, t6, a4, -13
lw t6, 93(sp)
li t7, -103403613
xor.T a7, t6, t7
xor t3, t3, s1
li t7, 6729715
mul s1, t3, t7
add t3, t5, s2
add t1, s1, t1
li t7, 91429570
mul t5, s0, t7
add t2, t2, t5
add t2, t1, t2
lw t6, 51(sp)
slli t1, t6, 4
add t5, a6, t2
lw t6, 129(sp)
lw t7, 54(sp)
or.1 t2, t6, t7
lw t7, 51(sp)
xor t6, a4, t7
sw t6, 120(sp)
lw t7, 129(sp)
xor t4, t4, t7
lw t7, 51(sp)
and t6, a3, t7, 13
sw t6, 12(sp)
lw t6, 108(sp)
li t7, 6469723
mul a6, t6, t7
li t7, 116308682
mul t4, t4, t7
add t0, t0, t4
add t3, t3, t0
lw t6, 54(sp)
lw t7, 120(sp)
xor.T t0, t6, t7
add t3, t5, t3
lw t6, 6(sp)
add t3, t6, t3
add t3, a5, t3
lw t6, 120(sp)
lw t7, 54(sp)
or t4, t6, t7, -13
lw t6, 75(sp)
lw t7, 231(sp)
and t5, t6, t7, 13
lw t6, 12(sp)
lw t7, 69(sp)
and a5, t6, t7, 13
li t7, -122532095
mul s0, t2, t7
li t7, -55812091
mul t0, t0, t7
lw t6, 60(sp)
or.1 t4, t6, t4
lw t7, 75(sp)
xor.1 t2, t5, t7
add t0, s0, t0
li t7, -78160975
mul t4, t4, t7
lw t7, 153(sp)
xor.T a5, a5, t7
add t4, t4, a6
lw t6, 102(sp)
lw t7, 0(sp)
or.1 a6, t6, t7
add t1, t1, t4
add t3, t3, t1
lw t6, 0(sp)
lw t7, 24(sp)
xor.T t1, t6, t7
xor.1 a6, a7, a6
lw t6, 135(sp)
add t6, t6, t3
sw t6, 60(sp)
lw t7, 15(sp)
xor a7, t2, t7
li t7, -5088067
mul a7, a7, t7
lw t6, 84(sp)
add a7, t6, a7
lw t6, 18(sp)
lw t7, 138(sp)
xor.1 t2, t6, t7
lw t6, 51(sp)
li t7, -103403613
xor t6, t6, t7
sw t6, 0(sp)
add a7, a7, t0
li t7, -94487168
mul t0, t1, t7
lw t6, 150(sp)
lw t7, 147(sp)
xor t1, t6, t7
lw t6, 144(sp)
lw t7, 87(sp)
and t3, t6, t7, 13
lw t6, 0(sp)
lw t7, 33(sp)
xor.1 t4, t6, t7
li t7, -157163461
mul a6, a6, t7
lw t6, 93(sp)
lw t7, 3(sp)
or t5, t6, t7, -13
andi t5, t5, 0
add t6, a7, a6
sw t6, 6(sp)
li t7, 38237367
mul a6, t5, t7
lw t6, 114(sp)
or a7, t6, t3, -13
lw t6, 18(sp)
lw t7, 45(sp)
or t3, t6, t7, -13
li t7, 149214906
mul t6, t3, t7
sw t6, 15(sp)
li t7, 75447099
mul a7, a7, t7
lw t6, 114(sp)
xor.T t3, t6, t1
xor.1 t6, a4, a3
sw t6, 84(sp)
lw t6, 123(sp)
lw t7, 144(sp)
and.1 t1, t6, t7, 13
and.T t2, t4, t2, -13
lw t7, 63(sp)
xor.1 t4, t2, t7
lw t6, 231(sp)
lw t7, 69(sp)
or t2, t6, t7, -13
lw t6, 231(sp)
and t5, t6, a4, 13
and t4, t4, a5, 13
lw t6, 39(sp)
or a5, t6, t5, -13
lw t6, 123(sp)
and.1 a5, t6, a5, 13
li t7, -139125826
mul t4, t4, t7
add t0, t4, t0
li t7, 131902287
add t4, t0, t7
lw t6, 123(sp)
lw t7, 9(sp)
and.1 t0, t6, t7, 13
and.1 t0, t0, t2, 13
li t7, -95258431
mul t2, t3, t7
li t7, -13115910
mul t3, a5, t7
lw t6, 156(sp)
lw t7, 129(sp)
xor.T t5, t6, t7
lw t6, 42(sp)
lw t7, 12(sp)
xor.1 a5, t6, t7
li t7, 182996158
mul t0, t0, t7
add t0, t2, t0
li t7, -82984071
mul t5, t5, t7
lw t6, 153(sp)
li t7, -103403613
xor.T t2, t6, t7
add a6, t4, a6
add a6, a6, a7
li t7, 166824801
mul a7, t1, t7
add t1, t3, t5
add t3, t1, a7
lw t6, 147(sp)
li t7, -108160431
mul a7, t6, t7
li t7, -41048846
mul t1, a4, t7
add a7, t1, a7
lw t6, 96(sp)
lw t7, 54(sp)
or.T t5, t6, t7
lw t6, 27(sp)
lw t7, 81(sp)
xor.1 t4, t6, t7
lw t6, 69(sp)
lw t7, 36(sp)
and.T s0, t6, t7, -13
lw t6, 75(sp)
lw t7, 129(sp)
xor.1 t1, t6, t7
add s1, t0, t3
lw t6, 24(sp)
xor.T t0, t6, t2
lw t6, 72(sp)
li t7, -103403613
or.T t2, t6, t7
lw t7, 147(sp)
xor.T t3, t5, t7
lw t7, 168(sp)
or.T t6, a3, t7
sw t6, 54(sp)
or.1 s2, s0, t4
lw t6, 15(sp)
add t5, t6, s1
lw t6, 51(sp)
and.1 t4, t6, a3, 13
li t7, -161548576
mul t2, t2, t7
lw t6, 156(sp)
lw t7, 9(sp)
or.1 s0, t6, t7
and.T t3, s2, t3, -13
and a5, t3, a5, 13
li t7, -53445123
mul a5, a5, t7
lw t7, 129(sp)
and t3, a3, t7, 13
add a5, a7, a5
add a5, t5, a5
and.T a7, t1, s0, -13
add a5, a6, a5
li t7, -103403613
or.1 t1, t4, t7
xor a6, t0, a7
lw t6, 132(sp)
lw t7, 27(sp)
xor.1 a7, t6, t7
li t7, 177404217
mul a6, a6, t7
li t7, 93072339
add a6, a6, t7
add a6, a6, t2
lw t6, 6(sp)
add a5, t6, a5
lw t6, 54(sp)
li t7, -167294928
mul t0, t6, t7
li t7, -120793184
mul t1, t1, t7
lw t6, 114(sp)
lw t7, 36(sp)
or.1 t4, t6, t7
lw t7, 102(sp)
or.1 t2, t3, t7
li t7, -123743256
mul a7, a7, t7
li t7, -168740242
mul t3, t4, t7
add t5, a7, t3
li t7, -136845747
mul t2, t2, t7
lw t6, 114(sp)
xor.T a7, t6, a3
add t3, t0, t2
lw t6, 39(sp)
li t7, 134251450
mul t2, t6, t7
lw t7, 117(sp)
xor.T t4, a3, t7
lw t6, 150(sp)
lw t7, 78(sp)
xor s0, t6, t7
lw t6, 45(sp)
li t7, 72748410
mul t0, t6, t7
add t5, t5, t0
or.T t0, a4, a3
li t7, 20064479
mul s0, s0, t7
lw t6, 72(sp)
lw t7, 51(sp)
xor.1 s1, t6, t7
add t1, t1, t3
add t1, a6, t1
xor a6, t4, s1
add t2, s0, t2
li t7, -14110275
mul a6, a6, t7
add t2, t5, t2
lw t6, 78(sp)
li t7, -103403613
xor t3, t6, t7
add a5, a5, t1
lw t6, 30(sp)
li t7, -149338599
mul t1, t6, t7
and.1 t3, a7, t3, 13
add a5, a5, t2
lw t6, 168(sp)
lw t7, 18(sp)
or.1 a7, t6, t7
lw t6, 33(sp)
lw t7, 51(sp)
xor.T t2, t6, t7
li t7, 156625814
mul a7, a7, t7
li t7, -98429121
mul t4, t3, t7
lw t6, 102(sp)
li t7, -64322704
mul t3, t6, t7
lw t6, 147(sp)
and t5, t6, t0, 13
lw t6, 21(sp)
lw t7, 36(sp)
and.1 t0, t6, t7, 13
lw t6, 27(sp)
lw t7, 81(sp)
and s0, t6, t7, 13
add a6, a6, t4
li t7, 23550583
mul t4, t5, t7
lw t6, 33(sp)
or t5, t6, s0, -13
add t1, t1, t3
lw t7, 144(sp)
xor t3, t2, t7
li t7, -151958735
mul t5, t5, t7
add t2, a7, t4
add t1, t5, t1
lw t6, 99(sp)
lw t7, 84(sp)
and a7, t6, t7, 13
lw t7, 144(sp)
or a7, a7, t7, -13
lw t7, 51(sp)
and.1 t0, t0, t7, 13
li t7, -127614917
mul t0, t0, t7
lw t6, 27(sp)
and.T t3, t6, t3, -13
li t7, 192027050
mul t4, a7, t7
lw t6, 12(sp)
slli a7, t6, 7
li t7, -160380508
mul t5, t3, t7
add t3, t0, t4
add t2, t2, t5
lw t6, 120(sp)
lw t7, 105(sp)
or.1 t0, t6, t7
add t1, t2, t1
add a6, a6, t1
add a6, a6, t3
add a5, a5, a6
lw t6, 60(sp)
add a5, t6, a5
lw t6, 90(sp)
add a5, t6, a5
lw t6, 129(sp)
li t7, 48221969
mul a6, t6, t7
lw t6, 0(sp)
li t7, 20626114
mul t1, t6, t7
li t7, -121300452
mul t0, t0, t7
add a7, a7, t1
li t7, -86196086
or t6, a3, t7, -13
sw t6, 9(sp)
lw t6, 66(sp)
lw t7, 132(sp)
xor.1 t1, t6, t7
lw t6, 3(sp)
and t1, t6, t1, 13
add a7, t0, a7
li t7, -86196086
or.T t6, a3, t7
sw t6, 102(sp)
li t7, -86196086
or.1 t6, a3, t7
sw t6, 66(sp)
li t7, -86196086
xor t6, a3, t7
sw t6, 0(sp)
li t7, 5842906
mul t0, t1, t7
add a6, a6, t0
add a6, a7, a6
li t7, -86196086
xor.T t6, a3, t7
sw t6, 45(sp)
add a5, a5, a6
li t7, -86196086
and.T t6, a3, t7, -13
sw t6, 15(sp)
lw t6, 48(sp)
add t6, t6, a5
sw t6, 123(sp)
lw t7, 123(sp)
xor.T t6, a4, t7
sw t6, 33(sp)
lw t6, 33(sp)
li t7, -86196086
and t6, t6, t7, 13
sw t6, 99(sp)
lw t7, 123(sp)
and.1 t6, a4, t7, 13
sw t6, 60(sp)
lw t6, 33(sp)
xor.T t6, t6, a3
sw t6, 135(sp)
lw t7, 33(sp)
and.1 t6, a3, t7, 13
sw t6, 198(sp)
lw t7, 60(sp)
and t6, a3, t7, 13
sw t6, 75(sp)
lw t6, 75(sp)
li t7, -176279259
mul a5, t6, t7
lw t6, 33(sp)
li t7, -86196086
and.T t6, t6, t7, -13
sw t6, 150(sp)
lw t6, 60(sp)
xor.T t6, t6, a3
sw t6, 18(sp)
lw t7, 60(sp)
or.1 a6, a3, t7
lw t6, 123(sp)
or.1 t6, t6, a4
sw t6, 159(sp)
lw t6, 123(sp)
or.T t6, t6, a4
sw t6, 39(sp)
lw t6, 18(sp)
li t7, 129308143
mul a4, t6, t7
lw t6, 99(sp)
lw t7, 39(sp)
and.T a7, t6, t7, -13
lw t6, 60(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 72(sp)
lw t6, 159(sp)
lw t7, 135(sp)
xor.1 t0, t6, t7
lw t7, 60(sp)
and.T t6, a3, t7, -13
sw t6, 105(sp)
li t7, -144824232
mul t1, t0, t7
lw t6, 198(sp)
lw t7, 66(sp)
xor t6, t6, t7
sw t6, 36(sp)
li t7, 124496738
mul a7, a7, t7
lw t6, 60(sp)
li t7, -86196086
and t6, t6, t7, 13
sw t6, 132(sp)
lw t6, 105(sp)
li t7, 144269353
mul t0, t6, t7
add t6, t1, a5
sw t6, 195(sp)
lw t7, 33(sp)
xor.1 t6, a3, t7
sw t6, 177(sp)
lw t6, 60(sp)
li t7, -86196086
or t6, t6, t7, -13
sw t6, 183(sp)
lw t6, 60(sp)
li t7, -86196086
xor t6, t6, t7
sw t6, 12(sp)
lw t6, 183(sp)
lw t7, 33(sp)
or.T t1, t6, t7
lw t6, 33(sp)
li t7, -154139240
mul a5, t6, t7
lw t6, 60(sp)
and.1 t6, t6, a3, 13
sw t6, 84(sp)
add a7, a7, t0
lw t6, 12(sp)
lw t7, 60(sp)
or.1 t0, t6, t7
lw t7, 33(sp)
and.T t6, a3, t7, -13
sw t6, 51(sp)
lw t7, 177(sp)
and.1 a6, a6, t7, 13
lw t6, 135(sp)
or t0, t6, t0, -13
lw t6, 9(sp)
or.T t1, t6, t1
add t6, a7, a4
sw t6, 42(sp)
lw t6, 33(sp)
lw t7, 60(sp)
and t6, t6, t7, 13
sw t6, 48(sp)
lw t6, 33(sp)
or t6, t6, a3, -13
sw t6, 87(sp)
lw t6, 60(sp)
lw t7, 51(sp)
xor.1 a4, t6, t7
lw t6, 33(sp)
lw t7, 60(sp)
xor.1 t6, t6, t7
sw t6, 165(sp)
lw t6, 51(sp)
li t7, 88380581
mul a7, t6, t7
lw t7, 36(sp)
and.T a6, a6, t7, -13
and a6, a6, t0, 13
li t7, 127829163
mul t0, a6, t7
lw t6, 33(sp)
li t7, -86196086
xor t6, t6, t7
sw t6, 120(sp)
li t7, -24660565
mul a6, a4, t7
lw t6, 33(sp)
lw t7, 60(sp)
or t6, t6, t7, -13
sw t6, 114(sp)
lw t6, 60(sp)
xor t6, t6, a3
sw t6, 27(sp)
lw t6, 0(sp)
lw t7, 84(sp)
and t2, t6, t7, 13
lw t6, 48(sp)
lw t7, 132(sp)
and.T a4, t6, t7, -13
lw t7, 183(sp)
xor.T a4, a4, t7
xor.T t1, t1, a4
lw t6, 51(sp)
lw t7, 183(sp)
xor.1 a4, t6, t7
lw t6, 33(sp)
li t7, -86196086
xor.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 165(sp)
lw t7, 144(sp)
xor.T t3, t6, t7
li t7, 187025446
mul t1, t1, t7
lw t6, 27(sp)
li t7, 72974803
mul t5, t6, t7
li t7, 177383926
mul s0, t3, t7
lw t6, 132(sp)
lw t7, 102(sp)
or.1 t3, t6, t7
lw t6, 60(sp)
li t7, -86196086
and.T t6, t6, t7, -13
sw t6, 138(sp)
add t4, t1, a5
li t7, 88545051
mul t1, t2, t7
li t7, -86196086
and.1 t6, a3, t7, 13
sw t6, 6(sp)
add a5, s0, t5
lw t6, 45(sp)
lw t7, 87(sp)
xor.T t5, t6, t7
lw t6, 87(sp)
lw t7, 120(sp)
xor.T t2, t6, t7
lw t7, 183(sp)
xor t2, t2, t7
lw t7, 39(sp)
and.1 t5, t5, t7, 13
add a7, t4, a7
li t7, 151754383
mul t4, t3, t7
add t3, t0, a7
li t7, 134971913
mul a7, t5, t7
lw t6, 60(sp)
li t7, -86196086
or.1 t6, t6, t7
sw t6, 69(sp)
lw t6, 135(sp)
lw t7, 6(sp)
xor.T t0, t6, t7
lw t6, 138(sp)
and.1 t5, t6, t0, 13
add t0, t4, t1
li t7, -131594356
mul t1, t2, t7
add t6, t3, a6
sw t6, 63(sp)
lw t6, 114(sp)
lw t7, 69(sp)
or.T a6, t6, t7
lw t6, 33(sp)
or.T t6, t6, a3
sw t6, 78(sp)
li t7, -6033578
mul t2, t5, t7
add a5, a5, t2
lw t6, 33(sp)
lw t7, 60(sp)
and.T t6, t6, t7, -13
sw t6, 180(sp)
li t7, 184063194
mul a6, a6, t7
lw t6, 33(sp)
li t7, -86196086
xor.T t6, t6, t7
sw t6, 3(sp)
li t7, -86196086
and t6, a3, t7, 13
sw t6, 117(sp)
lw t6, 60(sp)
li t7, -86196086
xor.T t6, t6, t7
sw t6, 93(sp)
lw t6, 78(sp)
lw t7, 9(sp)
or.1 t2, t6, t7
add t6, a7, t1
sw t6, 21(sp)
add a5, a6, a5
add t6, t0, a5
sw t6, 81(sp)
lw t6, 117(sp)
or.1 a5, t6, a4
lw t6, 15(sp)
lw t7, 3(sp)
and.1 a4, t6, t7, 13
and.T a4, t2, a4, -13
li t7, -112607564
mul a7, a4, t7
lw t6, 120(sp)
lw t7, 198(sp)
and a6, t6, t7, 13
lw t7, 60(sp)
or.T t6, a3, t7
sw t6, 24(sp)
lw t6, 48(sp)
lw t7, 93(sp)
xor.1 t0, t6, t7
lw t7, 60(sp)
xor.1 t6, a3, t7
sw t6, 90(sp)
lw t6, 60(sp)
li t7, -86196086
xor.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 33(sp)
li t7, -86196086
and.1 t6, t6, t7, 13
sw t6, 30(sp)
lw t6, 135(sp)
li t7, -86196086
xor.1 a4, t6, t7
lw t7, 156(sp)
and a6, a6, t7, 13
lw t6, 69(sp)
lw t7, 9(sp)
and t3, t6, t7, 13
lw t6, 135(sp)
lw t7, 159(sp)
or.1 t1, t6, t7
li t7, -46546595
mul t1, t1, t7
li t7, -86196086
xor.1 t6, a3, t7
sw t6, 15(sp)
li t7, -158071124
mul t5, a6, t7
lw t6, 90(sp)
lw t7, 33(sp)
xor.T t4, t6, t7
lw t6, 33(sp)
li t7, -86196086
or.1 t6, t6, t7
sw t6, 147(sp)
lw t7, 33(sp)
and t6, a3, t7, 13
sw t6, 189(sp)
lw t6, 60(sp)
lw t7, 180(sp)
xor.T t6, t6, t7
sw t6, 96(sp)
lw t6, 138(sp)
lw t7, 84(sp)
xor.T a6, t6, t7
lw t6, 165(sp)
li t7, -86196086
xor t2, t6, t7
and t0, a5, t0, 13
add a5, a7, t5
lw t6, 180(sp)
li t7, 192086368
mul t6, t6, t7
sw t6, 108(sp)
li t7, -19794628
mul a7, t4, t7
and.T t3, t3, t0, -13
lw t6, 135(sp)
lw t7, 15(sp)
or.1 t5, t6, t7
lw t6, 147(sp)
lw t7, 135(sp)
or.1 t4, t6, t7
lw t6, 165(sp)
lw t7, 189(sp)
xor.1 t0, t6, t7
add t1, t1, a7
lw t6, 30(sp)
and a7, t6, t4, 13
li t7, 167397291
mul a7, a7, t7
lw t6, 93(sp)
lw t7, 69(sp)
xor t4, t6, t7
slli t3, t3, 8
lw t7, 156(sp)
and.T t5, t5, t7, -13
lw t6, 60(sp)
li t7, -86196086
or.T t6, t6, t7
sw t6, 192(sp)
lw t6, 39(sp)
lw t7, 78(sp)
or s1, t6, t7, -13
lw t7, 54(sp)
or s0, t2, t7, -13
lw t6, 15(sp)
lw t7, 75(sp)
and.1 t2, t6, t7, 13
li t7, -34419040
mul s0, s0, t7
add t3, t3, t1
li t7, 91654633
mul t1, t5, t7
li t7, 51394701
mul t5, t2, t7
lw t6, 192(sp)
or.T t2, t6, a6
lw t7, 192(sp)
or s2, t4, t7, -13
lw t7, 96(sp)
and.T t4, s1, t7, -13
xor.T s1, a4, t0
lw t6, 177(sp)
lw t7, 24(sp)
or.T t0, t6, t7
lw t6, 36(sp)
li t7, 65799820
mul a6, t6, t7
li t7, -147837810
mul a4, s2, t7
li t7, -173365047
mul s2, t0, t7
add t0, a7, s0
li t7, -50219774
mul a7, s1, t7
add a7, s2, a7
lw t6, 189(sp)
lw t7, 159(sp)
or.T s1, t6, t7
add s0, t3, a5
add a5, t5, a7
add a5, t1, a5
lw t6, 99(sp)
li t7, -106667192
mul t3, t6, t7
li t7, 193557981
mul a7, t2, t7
xor.T t1, t4, s1
lw t6, 60(sp)
li t7, -86196086
and.1 t6, t6, t7, 13
sw t6, 36(sp)
li t7, -10094471
mul t2, t1, t7
lw t6, 138(sp)
li t7, -86196086
xor.T t1, t6, t7
li t7, 54317644
mul t4, t1, t7
lw t6, 21(sp)
add t1, t6, s0
add t0, t1, t0
lw t6, 81(sp)
add t5, t6, t0
lw t6, 117(sp)
lw t7, 90(sp)
or t1, t6, t7, -13
lw t6, 39(sp)
li t7, 58757314
mul t0, t6, t7
lw t6, 63(sp)
add t6, t6, t5
sw t6, 81(sp)
lw t6, 192(sp)
lw t7, 39(sp)
xor.1 s0, t6, t7
add t5, t2, t3
add a6, a6, t4
lw t7, 48(sp)
xor t4, s0, t7
lw t6, 84(sp)
li t7, -86196086
and.1 t2, t6, t7, 13
lw t7, 102(sp)
and t3, t2, t7, 13
lw t6, 33(sp)
or.1 t6, t6, a3
sw t6, 186(sp)
lw t6, 198(sp)
lw t7, 33(sp)
xor t2, t6, t7
add a7, a7, t5
lw t7, 78(sp)
or.T t4, t4, t7
add t5, a6, a7
li t7, -95219320
mul a7, t4, t7
lw t6, 93(sp)
lw t7, 186(sp)
xor.1 t4, t6, t7
lw t6, 96(sp)
li t7, -153230288
mul t6, t6, t7
sw t6, 21(sp)
li t7, -911747
mul t1, t1, t7
lw t6, 186(sp)
lw t7, 66(sp)
or.1 a6, t6, t7
add a4, a4, t5
add a4, a4, t1
add t0, a4, t0
or a4, t3, t4, -13
add t6, a5, t0
sw t6, 96(sp)
lw t6, 9(sp)
lw t7, 189(sp)
or.1 a5, t6, t7
li t7, -167584727
mul t0, a4, t7
lw t6, 69(sp)
or a4, t6, t2, -13
add t6, t0, a7
sw t6, 63(sp)
lw t6, 0(sp)
lw t7, 36(sp)
xor a7, t6, t7
lw t6, 3(sp)
xor t0, t6, a5
lw t6, 60(sp)
or t6, t6, a3, -13
sw t6, 153(sp)
lw t6, 15(sp)
li t7, -86196086
and.T t1, t6, t7, -13
lw t6, 99(sp)
lw t7, 6(sp)
or.1 t2, t6, t7
li t7, 147123929
mul a5, a4, t7
xor a4, a7, t1
xor t0, t2, t0
lw t6, 165(sp)
li t7, -33468927
mul t6, t6, t7
sw t6, 54(sp)
lw t6, 36(sp)
li t7, -71532561
mul t1, t6, t7
lw t6, 45(sp)
lw t7, 132(sp)
or.1 t3, t6, t7
lw t6, 36(sp)
lw t7, 78(sp)
or t6, t6, t7, -13
sw t6, 129(sp)
lw t6, 15(sp)
lw t7, 165(sp)
xor.T t2, t6, t7
lw t6, 24(sp)
lw t7, 150(sp)
xor.T a7, t6, t7
or t0, t3, t0, -13
li t7, -157607438
mul t3, a4, t7
lw t6, 6(sp)
lw t7, 30(sp)
and.1 a4, t6, t7, 13
li t7, 154326731
mul t5, t2, t7
li t7, -90132941
mul t4, a6, t7
add a6, t3, a5
lw t6, 75(sp)
lw t7, 192(sp)
or.T t2, t6, t7
li t7, 50917388
mul t3, t0, t7
lw t6, 159(sp)
lw t7, 45(sp)
and a5, t6, t7, 13
lw t6, 84(sp)
lw t7, 147(sp)
and t0, t6, t7, 13
lw t6, 156(sp)
or s0, t6, a7, -13
lw t6, 132(sp)
li t7, -147912304
mul a7, t6, t7
add t1, t5, t1
lw t7, 9(sp)
and.T t5, s0, t7, -13
add t1, t1, t4
li t7, -104302448
mul t4, t5, t7
lw t6, 183(sp)
li t7, -86196086
and t5, t6, t7, 13
lw t6, 108(sp)
add s0, t6, a6
lw t7, 9(sp)
and.T a6, t2, t7, -13
add t1, t3, t1
lw t6, 21(sp)
add t6, t6, t1
sw t6, 75(sp)
lw t6, 33(sp)
lw t7, 93(sp)
xor.T t1, t6, t7
li t7, -189981657
mul t3, t1, t7
lw t6, 33(sp)
xor t6, t6, a3
sw t6, 93(sp)
lw t6, 39(sp)
lw t7, 183(sp)
xor t1, t6, t7
lw t7, 99(sp)
or.1 t2, t5, t7
lw t6, 63(sp)
add t5, t6, s0
add t3, t4, t3
lw t6, 96(sp)
add t6, t6, t5
sw t6, 30(sp)
lw t7, 138(sp)
or.T t4, a3, t7
li t7, 123992714
mul t5, t0, t7
lw t6, 165(sp)
lw t7, 24(sp)
and.T s0, t6, t7, -13
lw t6, 168(sp)
xor t0, t6, t4
add t4, a7, t5
li t7, -130143466
mul a7, s0, t7
add t4, t3, t4
and.1 t3, a4, a5, 13
lw t6, 33(sp)
lw t7, 33(sp)
xor t6, t6, t7
sw t6, 327(sp)
li t7, -116933481
mul a5, t2, t7
lw t6, 78(sp)
li t7, 86196086
and.1 t2, t6, t7, 13
lw t7, 54(sp)
add a4, t4, t7
lw t6, 183(sp)
lw t7, 327(sp)
or.1 t4, t6, t7
li t7, -33022622
mul a6, a6, t7
or t1, t4, t1, -13
lw t6, 135(sp)
slli t6, t6, 2
sw t6, 63(sp)
li t7, 165677855
mul t6, t2, t7
sw t6, 21(sp)
lw t6, 3(sp)
lw t7, 12(sp)
xor.1 t2, t6, t7
or.T t1, t3, t1
li t7, -173417518
mul t3, t1, t7
li t7, -142108079
mul t1, t2, t7
add t4, a5, t3
lw t6, 93(sp)
lw t7, 99(sp)
or.T t2, t6, t7
lw t6, 144(sp)
lw t7, 33(sp)
and.T t3, t6, t7, -13
li t7, 81310608
mul t0, t0, t7
lw t6, 165(sp)
li t7, -144119095
mul a5, t6, t7
add a6, a6, t4
add t4, a6, a7
add t0, t0, t1
lw t6, 69(sp)
lw t7, 6(sp)
and a7, t6, t7, 13
lw t6, 33(sp)
li t7, -86196086
or t1, t6, t7, -13
lw t6, 120(sp)
lw t7, 156(sp)
xor a6, t6, t7
lw t6, 114(sp)
lw t7, 27(sp)
or.1 t5, t6, t7
xor a6, a6, t5
lw t6, 48(sp)
lw t7, 27(sp)
or t5, t6, t7, -13
add a4, a4, t4
lw t6, 75(sp)
add s0, t6, a4
lw t6, 24(sp)
lw t7, 129(sp)
or t4, t6, t7, -13
xor t2, t2, t5
lw t6, 78(sp)
xor.T a4, t6, t3
lw t6, 30(sp)
add t5, t6, s0
lw t6, 198(sp)
xor t3, t6, t1
li t7, 71243733
mul s0, t4, t7
li t7, 30713094
mul t4, t2, t7
add a5, a5, s0
add t2, t5, t0
add t6, t4, a5
sw t6, 54(sp)
li t7, 67671636
mul t0, a7, t7
lw t7, 39(sp)
xor a5, t1, t7
lw t6, 81(sp)
add a7, t6, t2
lw t7, 48(sp)
xor.1 a4, a4, t7
lw t6, 6(sp)
li t7, 86196086
xor.1 t1, t6, t7
li t7, -174786002
mul a4, a4, t7
lw t6, 102(sp)
li t7, 86196086
xor t4, t6, t7
lw t6, 45(sp)
lw t7, 156(sp)
xor.1 t5, t6, t7
lw t6, 42(sp)
add t6, t6, a7
sw t6, 30(sp)
lw t6, 177(sp)
or.1 t2, t6, a5
lw t6, 69(sp)
and.T a5, t6, t3, -13
lw t7, 6(sp)
xor.1 a5, a5, t7
li t7, 182479708
mul a5, a5, t7
lw t6, 63(sp)
add a7, t6, a5
lw t6, 144(sp)
lw t7, 15(sp)
xor a5, t6, t7
lw t6, 99(sp)
lw t7, 120(sp)
or.1 s0, t6, t7
lw t6, 51(sp)
lw t7, 6(sp)
or.1 t3, t6, t7
li t7, 119984821
mul s1, a6, t7
xor a6, t5, t3
lw t7, 90(sp)
or.T t5, t4, t7
lw t6, 99(sp)
lw t7, 147(sp)
and.T t3, t6, t7, -13
add t4, t0, s1
li t7, 86196086
or s1, s0, t7, -13
lw t6, 24(sp)
lw t7, 69(sp)
xor.1 t0, t6, t7
lw t7, 114(sp)
xor s0, t1, t7
lw t7, 120(sp)
and.1 t1, s1, t7, 13
lw t7, 78(sp)
or.1 t5, t5, t7
li t7, -1692042
mul t1, t1, t7
lw t6, 114(sp)
or.T s1, t6, a3
or s2, t5, t2, -13
lw t6, 66(sp)
lw t7, 33(sp)
or t5, t6, t7, -13
lw t6, 156(sp)
li t7, 25419632
mul t2, t6, t7
or s0, s0, s2, -13
li t7, -38759704
mul s2, s0, t7
lw t6, 69(sp)
or.T s0, t6, s1
xor t3, a3, t3
add s1, t4, s2
and.T t4, t3, a3, -13
add a7, a7, s1
lw t7, 132(sp)
xor.T t3, s0, t7
add a7, a4, a7
li t7, 126684785
mul a4, t3, t7
or.T a6, t5, a6
lw t6, 180(sp)
lw t7, 6(sp)
or.1 t3, t6, t7
lw t6, 165(sp)
lw t7, 153(sp)
xor.1 s0, t6, t7
li t7, 95105208
mul t5, t4, t7
li t7, 97623855
mul t6, a5, t7
sw t6, 15(sp)
li t7, 171081762
mul t4, t0, t7
lw t6, 99(sp)
lw t7, 120(sp)
and.1 a5, t6, t7, 13
li t7, 56321344
mul a6, a6, t7
add t1, t1, a6
lw t6, 105(sp)
lw t7, 120(sp)
xor.1 a6, t6, t7
lw t6, 45(sp)
and.T t0, t6, s0, -13
lw t6, 120(sp)
lw t7, 87(sp)
and s0, t6, t7, 13
add t2, t1, t2
li t7, 132723572
mul t1, s0, t7
add t2, t2, t5
add a7, a7, t2
lw t6, 54(sp)
add a7, t6, a7
lw t7, 138(sp)
or.T t2, t3, t7
add t3, t1, t4
li t7, -86196086
or t2, t2, t7, -13
lw t6, 165(sp)
lw t7, 3(sp)
xor.T t1, t6, t7
add t6, a4, t3
sw t6, 51(sp)
lw t6, 180(sp)
lw t7, 120(sp)
and.1 t3, t6, t7, 13
lw t6, 21(sp)
add a4, t6, a7
lw t6, 180(sp)
lw t7, 9(sp)
xor.T a7, t6, t7
lw t6, 30(sp)
add t6, t6, a4
sw t6, 3(sp)
or.T a4, t2, t0
lw t6, 144(sp)
lw t7, 231(sp)
or t2, t6, t7, -13
lw t6, 60(sp)
lw t7, 60(sp)
xor t0, t6, t7
li t7, 27600919
mul t6, a4, t7
sw t6, 9(sp)
lw t6, 105(sp)
or.T t0, t6, t0
lw t6, 186(sp)
lw t7, 231(sp)
and a4, t6, t7, 13
or.T t0, t0, t3
lw t6, 180(sp)
xor.1 a6, t6, a6
lw t6, 105(sp)
lw t7, 198(sp)
xor.1 t3, t6, t7
xor a6, t1, a6
lw t6, 39(sp)
xor t3, t6, t3
or a6, a5, a6, -13
lw t6, 84(sp)
or t1, t6, t2, -13
lw t6, 189(sp)
lw t7, 147(sp)
and t4, t6, t7, 13
lw t6, 78(sp)
lw t7, 165(sp)
or.1 a5, t6, t7
slli a5, a5, 6
lw t6, 147(sp)
lw t7, 0(sp)
and.T t2, t6, t7, -13
xor.T t1, t1, t4
lw t6, 48(sp)
and.1 a7, t6, a7, 13
and a7, t3, a7, 13
li t7, 70767780
mul a7, a7, t7
lw t6, 27(sp)
xor.T t3, t6, a3
or.T t0, t2, t0
xor.T a6, a6, t0
slli t0, a6, 3
lw t6, 105(sp)
lw t7, 231(sp)
and t2, t6, t7, 13
lw t6, 153(sp)
lw t7, 192(sp)
or a6, t6, t7, -13
li t7, -14089549
mul t4, t1, t7
lw t7, 36(sp)
xor.T t1, t3, t7
add a5, t0, a5
lw t6, 15(sp)
add t0, t6, a5
lw t6, 12(sp)
lw t7, 45(sp)
xor t3, t6, t7
li t7, 138246319
mul a5, t1, t7
add a5, a7, a5
li t7, -119249337
mul t3, t3, t7
lw t6, 69(sp)
lw t7, 165(sp)
xor a7, t6, t7
li t7, -29760590
mul t1, a7, t7
lw t6, 186(sp)
lw t7, 39(sp)
xor a7, t6, t7
lw t6, 168(sp)
or t5, t6, t2, -13
add t2, a5, t4
lw t6, 177(sp)
lw t7, 231(sp)
and a5, t6, t7, 13
li t7, 12506616
mul a4, a4, t7
or.1 t4, a6, t5
lw t7, 117(sp)
and.1 a6, a7, t7, 13
lw t6, 180(sp)
li t7, 184849060
mul a7, t6, t7
li t7, 84660530
mul a6, a6, t7
li t7, 83939542
mul t4, t4, t7
add t3, t4, t3
add t3, a4, t3
lw t6, 93(sp)
lw t7, 132(sp)
or.1 a4, t6, t7
add t2, t2, t3
add t3, t1, a6
lw t6, 120(sp)
lw t7, 12(sp)
xor t1, t6, t7
lw t6, 33(sp)
li t7, 24407743
mul a6, t6, t7
add t2, t0, t2
or.1 t0, t1, a3
lw t6, 9(sp)
add t4, t6, t2
lw t6, 60(sp)
lw t7, 90(sp)
or.T t1, t6, t7
lw t6, 93(sp)
lw t7, 69(sp)
xor t2, t6, t7
lw t6, 60(sp)
lw t7, 87(sp)
or t5, t6, t7, -13
add t3, t4, t3
lw t6, 165(sp)
xor t0, t6, t0
lw t6, 183(sp)
and.1 s0, t6, t0, 13
lw t6, 126(sp)
li t7, 182979952
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 18(sp)
xor.T t4, t6, a4
li t7, 152761620
mul t0, t5, t7
li t7, 16167422
mul a5, a5, t7
li t7, 73062162
mul a4, s0, t7
add a4, t3, a4
add a5, a7, a5
and a7, t2, a3, 13
lw t6, 162(sp)
li t7, -41777994
or.T t6, t6, t7
sw t6, 69(sp)
li t7, 69011565
mul a3, t4, t7
lw t6, 33(sp)
li t7, 64446036
xor t6, t6, t7
sw t6, 315(sp)
lw t7, 6(sp)
or.T t3, t1, t7
li t7, -69649406
mul t1, a7, t7
lw t6, 126(sp)
lw t7, 126(sp)
xor t2, t6, t7
li t7, 60397081
mul a7, t3, t7
lw t6, 315(sp)
lw t7, 315(sp)
xor t6, t6, t7
sw t6, 333(sp)
add a6, a6, t1
li t7, 94419088
mul t6, t2, t7
sw t6, 18(sp)
lw t6, 174(sp)
li t7, -41777994
or.T t6, t6, t7
sw t6, 129(sp)
add a6, a6, a7
lw t6, 174(sp)
li t7, -41777994
and.1 t6, t6, t7, 13
sw t6, 183(sp)
add a3, a3, a6
lw t6, 174(sp)
lw t7, 162(sp)
or t6, t6, t7, -13
sw t6, 165(sp)
lw t6, 162(sp)
lw t7, 174(sp)
and.T t6, t6, t7, -13
sw t6, 120(sp)
lw t6, 165(sp)
li t7, 34738528
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 162(sp)
li t7, -41777994
or.1 t6, t6, t7
sw t6, 93(sp)
lw t6, 174(sp)
lw t7, 162(sp)
xor t6, t6, t7
sw t6, 204(sp)
add a3, t0, a3
lw t6, 162(sp)
lw t7, 120(sp)
or.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 162(sp)
li t7, -41777994
and.1 t6, t6, t7, 13
sw t6, 81(sp)
lw t6, 162(sp)
li t7, -41777994
or t6, t6, t7, -13
sw t6, 150(sp)
lw t6, 174(sp)
lw t7, 204(sp)
or.1 t6, t6, t7
sw t6, 66(sp)
lw t6, 162(sp)
li t7, -41777994
xor.1 t6, t6, t7
sw t6, 42(sp)
add a3, a5, a3
add a4, a4, a3
lw t6, 174(sp)
li t7, -41777994
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 174(sp)
lw t7, 180(sp)
or.T a3, t6, t7
lw t6, 51(sp)
add a4, t6, a4
lw t6, 3(sp)
add a4, t6, a4
lw t6, 150(sp)
li t7, -123972517
mul t6, t6, t7
sw t6, 117(sp)
lw t6, 174(sp)
li t7, -41777994
or t6, t6, t7, -13
sw t6, 75(sp)
li t7, 41777994
xor.T a3, a3, t7
lw t6, 195(sp)
add t6, t6, a4
sw t6, 195(sp)
li t7, 185615353
mul t6, a3, t7
sw t6, 222(sp)
lw t6, 195(sp)
lw t7, 195(sp)
xor t6, t6, t7
sw t6, 12(sp)
lw t6, 42(sp)
lw t7, 162(sp)
and.T t6, t6, t7, -13
sw t6, 6(sp)
lw t6, 315(sp)
lw t7, 195(sp)
or a4, t6, t7, -13
lw t6, 195(sp)
lw t7, 123(sp)
xor a3, t6, t7
and t6, a4, a3, 13
sw t6, 153(sp)
xor.1 t6, a3, a4
sw t6, 3(sp)
lw t7, 126(sp)
xor.1 t6, a3, t7
sw t6, 30(sp)
lw t6, 126(sp)
xor.T t6, t6, a3
sw t6, 51(sp)
lw t7, 126(sp)
and.1 t6, a4, t7, 13
sw t6, 159(sp)
xor t6, a3, a4
sw t6, 45(sp)
and.T a5, a3, a4, -13
lw t7, 51(sp)
or.T t0, a4, t7
lw t6, 30(sp)
lw t7, 45(sp)
xor.T a6, t6, t7
lw t6, 126(sp)
or t6, t6, a4, -13
sw t6, 114(sp)
lw t7, 126(sp)
and.1 t6, a3, t7, 13
sw t6, 87(sp)
lw t6, 3(sp)
or.1 t6, t6, a5
sw t6, 135(sp)
lw t7, 126(sp)
xor.T t6, a4, t7
sw t6, 9(sp)
li t7, -100602974
mul a6, a6, t7
lw t6, 135(sp)
slli t6, t6, 2
sw t6, 96(sp)
lw t6, 114(sp)
or a7, t6, a3, -13
li t7, -146784561
mul t1, a7, t7
lw t7, 126(sp)
and a7, a4, t7, 13
add t6, a6, t1
sw t6, 0(sp)
lw t7, 126(sp)
and.T t6, a3, t7, -13
sw t6, 132(sp)
li t7, 59069733
mul t6, a7, t7
sw t6, 138(sp)
or t6, a4, a3, -13
sw t6, 78(sp)
lw t6, 126(sp)
xor.1 t6, t6, a4
sw t6, 123(sp)
lw t7, 126(sp)
or.1 t6, a4, t7
sw t6, 102(sp)
xor t6, a4, a4
sw t6, 21(sp)
lw t7, 126(sp)
and.T t6, a4, t7, -13
sw t6, 27(sp)
or.1 a6, a7, a4
lw t6, 21(sp)
lw t7, 3(sp)
xor t1, t6, t7
lw t6, 27(sp)
xor.1 t1, t6, t1
li t7, -6107010
mul t2, t1, t7
lw t6, 102(sp)
li t7, 192417332
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 21(sp)
xor.T t3, t6, a3
lw t6, 153(sp)
and t6, t6, a7, 13
sw t6, 48(sp)
lw t6, 153(sp)
lw t7, 132(sp)
and.T t1, t6, t7, -13
lw t7, 126(sp)
xor t6, a4, t7
sw t6, 147(sp)
lw t7, 126(sp)
or.T t6, a4, t7
sw t6, 36(sp)
lw t6, 147(sp)
lw t7, 87(sp)
or t5, t6, t7, -13
lw t6, 51(sp)
lw t7, 3(sp)
or.T t6, t6, t7
sw t6, 63(sp)
lw t6, 123(sp)
lw t7, 135(sp)
xor t4, t6, t7
and t1, t1, a3, 13
or s1, t4, a3, -13
lw t7, 126(sp)
and t6, a3, t7, 13
sw t6, 15(sp)
xor.T t6, a3, a4
sw t6, 90(sp)
and s0, t3, t0, 13
lw t7, 90(sp)
and.T t4, a3, t7, -13
li t7, 38937464
mul t0, s1, t7
add t3, t0, t2
li t7, 65152946
mul t6, t5, t7
sw t6, 105(sp)
and.1 t6, a4, a3, 13
sw t6, 108(sp)
lw t6, 15(sp)
lw t7, 231(sp)
and t2, t6, t7, 13
lw t6, 21(sp)
or.1 t5, t6, a4
lw t6, 135(sp)
lw t7, 21(sp)
and t0, t6, t7, 13
lw t6, 36(sp)
li t7, 105810034
mul t6, t6, t7
sw t6, 99(sp)
li t7, 32097928
mul t6, t5, t7
sw t6, 156(sp)
li t7, 153254950
mul s1, s0, t7
or.T a7, a7, a4
or s2, a4, a5, -13
lw t7, 36(sp)
and.1 t4, t4, t7, 13
lw t7, 36(sp)
xor s0, t4, t7
lw t6, 102(sp)
lw t7, 27(sp)
and t5, t6, t7, 13
lw t6, 96(sp)
add t4, t6, s1
add t4, t4, t3
lw t6, 108(sp)
or.T s1, t6, s2
lw t7, 126(sp)
or.1 t6, a3, t7
sw t6, 144(sp)
lw t6, 144(sp)
lw t7, 147(sp)
xor s2, t6, t7
or.1 a6, a3, a6
lw t6, 15(sp)
or.T t3, t6, a6
li t7, -161208158
mul s3, s1, t7
li t7, 160901299
mul s0, s0, t7
lw t7, 9(sp)
or.1 s4, t1, t7
xor s1, t5, a3
lw t6, 9(sp)
li t7, 187194865
mul a6, t6, t7
lw t7, 48(sp)
xor t1, t2, t7
lw t6, 147(sp)
li t7, 167431900
mul t2, t6, t7
lw t6, 0(sp)
add t4, t6, t4
li t7, 155459377
mul s2, s2, t7
lw t6, 102(sp)
lw t7, 126(sp)
or t5, t6, t7, -13
lw t7, 138(sp)
add t6, t4, t7
sw t6, 0(sp)
add s3, t2, s3
lw t6, 123(sp)
or t4, t6, s4, -13
lw t6, 78(sp)
xor.T t6, t6, a5
sw t6, 96(sp)
lw t6, 84(sp)
add s0, t6, s0
and t0, s1, t0, 13
lw t7, 96(sp)
xor.1 a7, a7, t7
lw t6, 51(sp)
lw t7, 63(sp)
or t2, t6, t7, -13
li t7, -14465293
mul s1, t0, t7
add s2, s3, s2
li t7, 26256819
mul t0, t1, t7
li t7, 63691052
mul t1, t3, t7
lw t6, 114(sp)
lw t7, 90(sp)
xor s4, t6, t7
li t7, 65686772
mul t3, t5, t7
lw t7, 153(sp)
or.T s3, a4, t7
li t7, -165723292
mul t6, s4, t7
sw t6, 84(sp)
add t5, s0, s1
add t1, t1, s2
or.T s1, s3, a7
lw t7, 87(sp)
and.T s0, a5, t7, -13
lw t7, 99(sp)
add t1, t1, t7
li t7, -146813982
mul a7, t4, t7
lw t6, 132(sp)
lw t7, 147(sp)
xor.T s2, t6, t7
lw t7, 105(sp)
add t4, a7, t7
lw t6, 87(sp)
lw t7, 36(sp)
or.T a7, t6, t7
li t7, 1426823
mul t6, s1, t7
sw t6, 48(sp)
or.T t6, a3, a4
sw t6, 138(sp)
lw t6, 9(sp)
li t7, 26937013
mul s1, t6, t7
li t7, -21508215
mul s3, t2, t7
lw t6, 114(sp)
li t7, 50295907
mul s4, t6, t7
xor.T t2, s0, s2
add t3, a6, t3
add s0, s3, s4
lw t6, 156(sp)
add a6, t6, t5
add s0, t0, s0
lw t7, 9(sp)
or.T t0, t2, t7
li t7, 25852261
mul t2, t0, t7
add t4, t4, a6
lw t7, 18(sp)
add t6, s1, t7
sw t6, 18(sp)
lw t6, 90(sp)
li t7, -176045364
mul t0, t6, t7
lw t6, 21(sp)
lw t7, 147(sp)
xor.1 t5, t6, t7
lw t6, 126(sp)
or a6, t6, a3, -13
add t1, t4, t1
lw t6, 21(sp)
lw t7, 138(sp)
xor.1 t4, t6, t7
lw t6, 78(sp)
and s2, t6, t4, 13
lw t7, 9(sp)
or.T s1, a6, t7
li t7, -71028066
mul t4, a4, t7
add t3, s0, t3
lw t7, 126(sp)
xor t6, a3, t7
sw t6, 63(sp)
lw t7, 9(sp)
and s0, a4, t7, 13
or.T s2, a7, s2
lw t6, 0(sp)
add a7, t6, t1
li t7, -15644651
mul t1, s2, t7
or.T s0, s0, s1
lw t6, 132(sp)
or.T s1, t6, a5
xor.1 s1, t5, s1
li t7, -58203856
mul t5, a4, t7
li t7, 67320824
mul s1, s1, t7
add t2, t1, t2
li t7, -179934627
mul s0, s0, t7
slli t1, a4, 2
add t1, s1, t1
add s1, t4, t5
lw t6, 123(sp)
lw t7, 63(sp)
and.1 t4, t6, t7, 13
add t0, t0, s0
add a7, a7, t3
lw t7, 102(sp)
xor s0, a5, t7
lw t6, 63(sp)
and t5, t6, a4, 13
add t0, t2, t0
lw t6, 84(sp)
add t0, t6, t0
add t0, t0, s1
lw t6, 63(sp)
or.T s1, t6, a3
lw t6, 147(sp)
and.T t2, t6, a3, -13
lw t6, 9(sp)
and.1 t3, t6, a4, 13
lw t6, 153(sp)
and s1, t6, s1, 13
li t7, -108939923
mul s0, s0, t7
lw t7, 135(sp)
or.T s2, a4, t7
li t7, 72628339
mul t4, t4, t7
or.T t5, s2, t5
li t7, 101203016
mul s2, t5, t7
add t1, t1, t4
li t7, -111266116
mul t6, a6, t7
sw t6, 99(sp)
lw t6, 153(sp)
xor.1 t5, t6, a3
li t7, 169699981
mul t4, s1, t7
add t0, t0, t1
lw t6, 159(sp)
xor t3, t6, t3
add s0, s0, s2
and.T t1, a4, a6, -13
lw t6, 135(sp)
xor.1 t2, t6, t2
lw t7, 102(sp)
and s1, t2, t7, 13
li t7, -181258028
mul t2, t5, t7
li t7, -25732706
mul s2, a5, t7
add t5, t4, t2
lw t6, 108(sp)
lw t7, 3(sp)
and t2, t6, t7, 13
li t7, -32741747
mul t4, t3, t7
lw t6, 51(sp)
xor.1 t3, t6, a5
xor t2, t2, t3
lw t6, 78(sp)
li t7, 168426773
mul t6, t6, t7
sw t6, 105(sp)
li t7, -7196247
mul s1, s1, t7
lw t6, 96(sp)
li t7, 14705496
mul t3, t6, t7
add t4, t4, s2
lw t6, 18(sp)
add s2, t6, s1
lw t6, 132(sp)
and.1 s1, t6, a5, 13
lw t7, 48(sp)
add s3, a7, t7
add a7, s0, s2
lw t7, 87(sp)
and s0, a5, t7, 13
add t6, s3, t0
sw t6, 156(sp)
lw t6, 21(sp)
xor.1 t0, t6, s0
li t7, -82667497
mul s2, t1, t7
lw t7, 153(sp)
and.T t1, a4, t7, -13
lw t7, 45(sp)
and.T s0, a4, t7, -13
add t5, s2, t5
add t6, a7, t5
sw t6, 18(sp)
lw t6, 231(sp)
lw t7, 51(sp)
or s2, t6, t7, -13
li t7, 124641382
mul t5, t1, t7
lw t7, 123(sp)
xor t1, a4, t7
li t7, -92875515
mul a7, s1, t7
lw t7, 135(sp)
xor s4, a4, t7
li t7, -160355279
mul s3, t0, t7
lw t6, 147(sp)
or.T t0, t6, a4
lw t6, 78(sp)
lw t7, 36(sp)
xor.T s1, t6, t7
li t7, 81548412
mul t1, t1, t7
xor.T s5, a6, a5
lw t6, 114(sp)
and.T s6, t6, a4, -13
lw t6, 138(sp)
or.1 a6, t6, a3
or.1 s2, s4, s2
li t7, 97200776
mul s0, s0, t7
add t4, t4, s3
add t3, t4, t3
and t2, s6, t2, 13
lw t6, 27(sp)
xor.1 t4, t6, s5
lw t6, 135(sp)
lw t7, 114(sp)
and.1 s5, t6, t7, 13
li t7, 324658
mul s3, t2, t7
li t7, 146542742
mul t6, a5, t7
sw t6, 0(sp)
lw t6, 123(sp)
and t6, t6, a4, 13
sw t6, 96(sp)
li t7, -144969960
mul t2, a6, t7
li t7, -55342832
mul t6, a4, t7
sw t6, 84(sp)
add s3, s3, t5
lw t7, 27(sp)
and.T s4, t4, t7, -13
li t7, 183073632
mul s5, s5, t7
lw t7, 231(sp)
or t6, a5, t7, -13
sw t6, 48(sp)
xor.1 s1, a4, s1
lw t6, 27(sp)
li t7, 189187734
mul a6, t6, t7
lw t7, 159(sp)
and.1 t4, a5, t7, 13
lw t7, 231(sp)
or t5, a4, t7, -13
lw t6, 99(sp)
add s5, t6, s5
li t7, 116275457
mul s6, s2, t7
li t7, 192419008
mul s2, s4, t7
add s4, s5, s3
add s3, s0, s6
lw t6, 105(sp)
add s4, t6, s4
lw t6, 144(sp)
li t7, 90018013
mul s0, t6, t7
add s5, a7, s4
lw t7, 39(sp)
add s3, s3, t7
li t7, 101893153
mul a7, s1, t7
li t7, 112119165
mul t0, t0, t7
add t0, t0, t1
lw t6, 78(sp)
lw t7, 87(sp)
or.1 t1, t6, t7
lw t7, 102(sp)
xor.T s4, t1, t7
add s2, s2, t2
lw t6, 51(sp)
li t7, -4081739
mul t1, t6, t7
add t3, t3, s5
lw t6, 147(sp)
lw t7, 90(sp)
or s1, t6, t7, -13
li t7, -22517651
mul t2, t5, t7
add t5, s3, s2
li t7, -106539526
mul t6, a5, t7
sw t6, 39(sp)
add t0, t0, t5
li t7, -105658228
mul t4, t4, t7
or s2, a4, s4, -13
add t0, t3, t0
add t5, t4, s0
lw t6, 87(sp)
xor.1 s0, t6, a4
add t4, a7, t1
lw t6, 30(sp)
lw t7, 21(sp)
xor t3, t6, t7
li t7, 181408978
mul a7, s1, t7
li t7, -139113627
mul s1, s2, t7
li t7, -68499614
mul t1, s0, t7
lw t7, 84(sp)
add s0, t1, t7
add t1, t5, a7
add t5, t2, a6
lw t6, 126(sp)
lw t7, 108(sp)
or.1 a7, t6, t7
lw t6, 9(sp)
xor.1 a6, t6, a3
lw t7, 147(sp)
xor s2, a3, t7
add s1, s1, t4
lw t6, 132(sp)
lw t7, 231(sp)
and t2, t6, t7, 13
lw t7, 96(sp)
or t4, s2, t7, -13
lw t7, 0(sp)
add s2, s0, t7
li t7, 50263863
mul t4, t4, t7
li t7, -133544282
mul s0, t3, t7
li t7, 43063674
mul t6, t2, t7
sw t6, 30(sp)
lw t6, 27(sp)
lw t7, 87(sp)
xor.T t2, t6, t7
li t7, -55322688
mul t2, t2, t7
add t3, s2, t5
add t0, t0, t3
lw t6, 138(sp)
lw t7, 87(sp)
xor s2, t6, t7
add s3, s1, t1
lw t6, 9(sp)
lw t7, 21(sp)
and.T t3, t6, t7, -13
lw t6, 48(sp)
lw t7, 126(sp)
xor t1, t6, t7
lw t6, 63(sp)
lw t7, 3(sp)
xor.T t5, t6, t7
xor.1 s1, a6, t1
li t7, -73624028
mul t1, a4, t7
add s3, t0, s3
li t7, -177431928
mul a6, s2, t7
lw t6, 138(sp)
li t7, 2162277
mul t0, t6, t7
lw t6, 132(sp)
or.1 t6, t6, a4
sw t6, 3(sp)
lw t6, 18(sp)
add t6, t6, s3
sw t6, 18(sp)
li t7, 28291575
mul s1, s1, t7
add s0, s0, s1
lw t6, 9(sp)
or s3, t6, a5, -13
lw t7, 123(sp)
xor s4, a5, t7
lw t6, 135(sp)
lw t7, 45(sp)
and s1, t6, t7, 13
and s1, s1, a4, 13
li t7, -70483317
mul s2, s1, t7
lw t6, 39(sp)
add s1, t6, t4
lw t6, 126(sp)
or.T t6, t6, a3
sw t6, 21(sp)
lw t7, 15(sp)
or.1 t4, a3, t7
or.T s3, a7, s3
lw t6, 126(sp)
xor s4, t6, s4
lw t6, 135(sp)
lw t7, 147(sp)
and.1 s5, t6, t7, 13
li t7, -85523328
mul t4, t4, t7
lw t6, 96(sp)
lw t7, 78(sp)
or.1 a7, t6, t7
add s2, s2, t2
lw t6, 63(sp)
xor.1 t2, t6, s5
xor s3, t3, s3
and.T t3, t5, s4, -13
li t7, 121039402
mul t5, t2, t7
li t7, 170751924
mul s4, s3, t7
lw t6, 174(sp)
lw t7, 75(sp)
or.1 t6, t6, t7
sw t6, 0(sp)
and.1 s3, a7, a3, 13
li t7, 176496480
mul t2, a3, t7
add a7, s1, s4
add t5, t1, t5
add a7, s0, a7
lw t7, 144(sp)
and.1 t1, a4, t7, 13
li t7, -94463488
mul s0, s3, t7
add t5, s2, t5
li t7, 101390068
mul t3, t3, t7
add t3, t3, t4
add t4, t3, t0
slli t3, t1, 5
add a6, a6, s0
lw t6, 9(sp)
and t1, t6, a5, 13
lw t6, 30(sp)
add t0, t6, t5
lw t6, 87(sp)
lw t7, 123(sp)
and s0, t6, t7, 13
add t4, t4, a6
lw t6, 90(sp)
lw t7, 102(sp)
xor.T a6, t6, t7
li t7, -57005111
mul a6, a6, t7
add t5, t3, a6
li t7, 68603481
mul a6, a3, t7
li t7, -191092525
mul a4, a4, t7
li t7, 2703298
mul s1, t1, t7
xor.T t3, a5, s0
lw t6, 6(sp)
lw t7, 246(sp)
and.1 t1, t6, t7, 13
add t2, t2, s1
lw t6, 162(sp)
lw t7, 174(sp)
xor.T t6, t6, t7
sw t6, 138(sp)
lw t6, 93(sp)
lw t7, 231(sp)
or a5, t6, t7, -13
add t5, t5, t2
lw t6, 36(sp)
lw t7, 108(sp)
and.1 t2, t6, t7, 13
add t4, t4, t5
add t0, t0, t4
add a7, a7, t0
lw t6, 3(sp)
li t7, -25963585
mul t0, t6, t7
xor a3, a3, a3
lw t6, 15(sp)
or.T a3, t6, a3
lw t7, 21(sp)
xor.1 t2, t2, t7
li t7, -180572800
mul t4, t2, t7
and.T a3, a3, t3, -13
li t7, 61451957
mul t2, a3, t7
add a3, t0, t4
li t7, -38635807
mul t6, t1, t7
sw t6, 216(sp)
lw t6, 81(sp)
li t7, 124995112
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 174(sp)
lw t7, 162(sp)
or.T t6, t6, t7
sw t6, 99(sp)
lw t6, 66(sp)
li t7, 88439437
mul t6, t6, t7
sw t6, 201(sp)
lw t6, 180(sp)
lw t7, 0(sp)
and.1 t0, t6, t7, 13
lw t6, 81(sp)
li t7, 92261024
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 174(sp)
li t7, -41777994
and.T t6, t6, t7, -13
sw t6, 192(sp)
lw t6, 192(sp)
slli t6, t6, 5
sw t6, 78(sp)
lw t6, 99(sp)
li t7, -190409698
mul t6, t6, t7
sw t6, 123(sp)
add a4, t2, a4
lw t6, 162(sp)
li t7, -41777994
and t6, t6, t7, 13
sw t6, 153(sp)
lw t6, 138(sp)
li t7, -41777994
xor t6, t6, t7
sw t6, 48(sp)
lw t6, 174(sp)
lw t7, 162(sp)
or.1 t6, t6, t7
sw t6, 9(sp)
lw t6, 162(sp)
li t7, -41777994
xor.T t6, t6, t7
sw t6, 90(sp)
add a4, a6, a4
li t7, 176924045
mul t6, a5, t7
sw t6, 105(sp)
lw t6, 174(sp)
lw t7, 192(sp)
xor.1 t6, t6, t7
sw t6, 36(sp)
add a3, a3, a4
li t7, -167788250
mul t6, t0, t7
sw t6, 108(sp)
add a3, a7, a3
lw t6, 174(sp)
li t7, -41777994
xor t6, t6, t7
sw t6, 135(sp)
lw t6, 18(sp)
add a3, t6, a3
lw t6, 180(sp)
lw t7, 153(sp)
or.T t6, t6, t7
sw t6, 27(sp)
lw t6, 174(sp)
li t7, -41777994
and t6, t6, t7, 13
sw t6, 198(sp)
lw t6, 129(sp)
lw t7, 183(sp)
xor t6, t6, t7
sw t6, 168(sp)
lw t6, 162(sp)
li t7, -41777994
xor t6, t6, t7
sw t6, 30(sp)
lw t6, 162(sp)
lw t7, 30(sp)
xor.T t6, t6, t7
sw t6, 66(sp)
lw t6, 120(sp)
lw t7, 111(sp)
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 156(sp)
add a3, t6, a3
lw t7, 57(sp)
xor t6, a3, t7
sw t6, 84(sp)
lw t6, 84(sp)
li t7, -41777994
xor.T t6, t6, t7
sw t6, 102(sp)
lw t6, 84(sp)
lw t7, 162(sp)
xor.T t6, t6, t7
sw t6, 57(sp)
lw t7, 171(sp)
xor t6, a3, t7
sw t6, 321(sp)
lw t6, 174(sp)
lw t7, 84(sp)
and.T t6, t6, t7, -13
sw t6, 132(sp)
lw t6, 84(sp)
lw t7, 162(sp)
or t6, t6, t7, -13
sw t6, 39(sp)
lw t6, 162(sp)
lw t7, 84(sp)
or.T t6, t6, t7
sw t6, 3(sp)
lw t6, 174(sp)
lw t7, 84(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
lw t6, 174(sp)
xor t6, t6, a3
sw t6, 156(sp)
lw t6, 156(sp)
lw t7, 321(sp)
xor t6, t6, t7
sw t6, 219(sp)
lw t6, 84(sp)
li t7, -33242312
mul a5, t6, t7
lw t6, 57(sp)
lw t7, 111(sp)
and.1 a6, t6, t7, 13
lw t6, 183(sp)
lw t7, 3(sp)
xor.1 a3, t6, t7
lw t6, 162(sp)
lw t7, 84(sp)
xor t6, t6, t7
sw t6, 144(sp)
li t7, -41777994
xor.1 a7, a3, t7
lw t6, 84(sp)
li t7, -41777994
xor.1 t6, t6, t7
sw t6, 207(sp)
lw t6, 132(sp)
li t7, 38628765
mul t2, t6, t7
lw t6, 84(sp)
li t7, -41777994
and.1 t6, t6, t7, 13
sw t6, 186(sp)
lw t6, 174(sp)
lw t7, 84(sp)
and.1 a3, t6, t7, 13
lw t6, 84(sp)
and a4, t6, a3, 13
lw t6, 84(sp)
li t7, -41777994
or t6, t6, t7, -13
sw t6, 126(sp)
li t7, 51459026
mul t6, a7, t7
sw t6, 171(sp)
lw t7, 69(sp)
and.T t3, a3, t7, -13
lw t6, 126(sp)
lw t7, 144(sp)
xor.1 t0, t6, t7
lw t6, 141(sp)
lw t7, 186(sp)
xor a7, t6, t7
lw t6, 162(sp)
lw t7, 84(sp)
and.T t1, t6, t7, -13
lw t6, 39(sp)
li t7, -41777994
and.T t4, t6, t7, -13
li t7, -69863712
mul t6, t4, t7
sw t6, 87(sp)
add t6, t2, a5
sw t6, 96(sp)
li t7, 118162025
mul t6, a3, t7
sw t6, 147(sp)
li t7, -5262210
mul a5, t3, t7
lw t6, 84(sp)
li t7, -41777994
and t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 174(sp)
lw t7, 84(sp)
xor.1 t6, t6, t7
sw t6, 159(sp)
or.1 a6, t4, a6
lw t6, 174(sp)
lw t7, 186(sp)
xor.1 t3, t6, t7
lw t6, 84(sp)
lw t7, 84(sp)
xor t6, t6, t7
sw t6, 51(sp)
lw t6, 174(sp)
lw t7, 84(sp)
and t6, t6, t7, 13
sw t6, 210(sp)
li t7, -189308260
mul a6, a6, t7
lw t6, 120(sp)
lw t7, 126(sp)
and.T t2, t6, t7, -13
lw t6, 84(sp)
lw t7, 162(sp)
and t6, t6, t7, 13
sw t6, 225(sp)
lw t6, 162(sp)
lw t7, 84(sp)
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 18(sp)
lw t7, 129(sp)
xor.T t4, t6, t7
li t7, 64876805
mul t6, t3, t7
sw t6, 189(sp)
lw t7, 207(sp)
xor.1 t5, t1, t7
lw t7, 54(sp)
and.T t0, t0, t7, -13
lw t6, 84(sp)
li t7, -41777994
and.T t6, t6, t7, -13
sw t6, 111(sp)
li t7, 191709605
mul a7, a7, t7
lw t6, 18(sp)
lw t7, 225(sp)
xor t3, t6, t7
lw t7, 84(sp)
or.T s1, t4, t7
lw t6, 84(sp)
lw t7, 180(sp)
and.T s0, t6, t7, -13
lw t6, 57(sp)
xor t0, t6, t0
lw t6, 51(sp)
li t7, -189833499
mul t1, t6, t7
lw t6, 210(sp)
lw t7, 204(sp)
and.T t4, t6, t7, -13
li t7, -30969721
mul a4, a4, t7
lw t6, 174(sp)
lw t7, 9(sp)
or.T s2, t6, t7
lw t7, 204(sp)
xor s1, s1, t7
lw t6, 84(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 177(sp)
lw t7, 225(sp)
and.T t6, s2, t7, -13
sw t6, 141(sp)
li t7, -100251397
mul s0, s0, t7
lw t7, 15(sp)
add s0, s0, t7
xor.1 t6, t5, t2
sw t6, 213(sp)
add a6, a4, a6
lw t6, 99(sp)
lw t7, 102(sp)
xor a4, t6, t7
add t5, a5, a6
li t7, -21992519
mul t2, s1, t7
lw t6, 30(sp)
lw t7, 129(sp)
xor.1 a6, t6, t7
li t7, 80662955
mul a5, t3, t7
lw t6, 126(sp)
lw t7, 204(sp)
and.T t3, t6, t7, -13
add t6, a5, s0
sw t6, 54(sp)
lw t6, 84(sp)
li t7, -41777994
or.T t6, t6, t7
sw t6, 63(sp)
lw t6, 51(sp)
or.T a5, t6, t4
lw t6, 96(sp)
add t4, t6, t5
lw t7, 102(sp)
xor.T t3, t3, t7
add t6, a7, t4
sw t6, 114(sp)
lw t6, 162(sp)
lw t7, 174(sp)
xor.1 t6, t6, t7
sw t6, 96(sp)
lw t6, 3(sp)
lw t7, 63(sp)
or.1 a7, t6, t7
li t7, -67400740
mul t6, t0, t7
sw t6, 15(sp)
add t0, t1, t2
lw t6, 171(sp)
add t0, t6, t0
lw t7, 117(sp)
add t0, t0, t7
lw t6, 87(sp)
add t0, t6, t0
lw t6, 177(sp)
lw t7, 177(sp)
xor t1, t6, t7
lw t7, 180(sp)
and.1 t6, a4, t7, 13
sw t6, 171(sp)
lw t7, 66(sp)
xor.T t2, t1, t7
lw t6, 93(sp)
or.1 a4, t6, t3
li t7, -70493616
mul t1, a7, t7
lw t6, 27(sp)
xor.T a7, t6, t2
lw t6, 189(sp)
add t6, t6, t0
sw t6, 87(sp)
lw t6, 159(sp)
lw t7, 6(sp)
or.T t0, t6, t7
xor.T a4, a4, a5
li t7, 185848311
mul a4, a4, t7
lw t7, 201(sp)
add t6, t1, t7
sw t6, 201(sp)
lw t6, 90(sp)
lw t7, 186(sp)
and.1 t1, t6, t7, 13
lw t6, 57(sp)
lw t7, 135(sp)
xor a5, t6, t7
lw t6, 180(sp)
lw t7, 111(sp)
or t2, t6, t7, -13
li t7, -39629487
mul t6, a6, t7
sw t6, 27(sp)
lw t6, 21(sp)
lw t7, 183(sp)
and.T a6, t6, t7, -13
lw t6, 177(sp)
lw t7, 165(sp)
or.1 t5, t6, t7
lw t6, 48(sp)
xor.T t3, t6, a6
lw t6, 84(sp)
lw t7, 63(sp)
xor.1 t4, t6, t7
lw t6, 51(sp)
xor.1 a6, t6, t1
and.T t0, t0, t4, -13
lw t6, 21(sp)
lw t7, 177(sp)
xor s0, t6, t7
lw t6, 213(sp)
and.T t0, t6, t0, -13
li t7, 25563023
mul t1, a7, t7
lw t6, 84(sp)
li t7, -41777994
or.1 t6, t6, t7
sw t6, 66(sp)
li t7, 192126094
mul t4, t2, t7
and.T a7, t5, a3, -13
lw t6, 135(sp)
lw t7, 207(sp)
and.T t2, t6, t7, -13
lw t6, 174(sp)
lw t7, 84(sp)
or t6, t6, t7, -13
sw t6, 48(sp)
li t7, -193580107
mul a3, t3, t7
lw t7, 108(sp)
add t3, a3, t7
lw t6, 36(sp)
and.T a3, t6, s0, -13
li t7, -104997994
mul a7, a7, t7
lw t6, 84(sp)
lw t7, 162(sp)
and.1 t6, t6, t7, 13
sw t6, 108(sp)
lw t7, 78(sp)
add t3, t3, t7
add a7, t3, a7
lw t6, 6(sp)
lw t7, 93(sp)
xor t5, t6, t7
lw t7, 123(sp)
add t4, t4, t7
lw t6, 57(sp)
lw t7, 198(sp)
or t3, t6, t7, -13
li t7, 25629260
mul t6, t3, t7
sw t6, 213(sp)
lw t7, 6(sp)
and.T t3, t2, t7, -13
li t7, 8817284
mul t0, t0, t7
lw t6, 162(sp)
li t7, -41777994
and.T t6, t6, t7, -13
sw t6, 117(sp)
lw t6, 216(sp)
add t0, t6, t0
lw t6, 144(sp)
lw t7, 66(sp)
and.1 t2, t6, t7, 13
lw t6, 174(sp)
lw t7, 6(sp)
or s0, t6, t7, -13
lw t6, 171(sp)
li t7, -155546666
mul s1, t6, t7
add t4, s1, t4
add t0, a4, t0
lw t6, 135(sp)
lw t7, 21(sp)
and a4, t6, t7, 13
li t7, 1982936
mul t2, t2, t7
lw t7, 0(sp)
and.T s1, a5, t7, -13
lw t6, 45(sp)
add a5, t6, t1
slli t6, s1, 2
sw t6, 135(sp)
lw t7, 144(sp)
and.T t1, t5, t7, -13
lw t7, 192(sp)
and s0, s0, t7, 13
li t7, 83422903
mul a6, a6, t7
lw t6, 48(sp)
li t7, 186009043
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 207(sp)
li t7, 159837518
mul t6, t6, t7
sw t6, 36(sp)
lw t7, 27(sp)
add t5, a5, t7
li t7, -144384160
mul t6, s0, t7
sw t6, 171(sp)
lw t7, 99(sp)
and a3, a3, t7, 13
or.1 a3, a3, t3
lw t6, 48(sp)
lw t7, 84(sp)
xor a5, t6, t7
lw t6, 141(sp)
xor.T t3, t6, a3
lw t6, 150(sp)
lw t7, 48(sp)
xor a3, t6, t7
lw t6, 174(sp)
lw t7, 84(sp)
or.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 108(sp)
lw t7, 96(sp)
or s0, t6, t7, -13
li t7, 50411092
mul s1, t1, t7
add t1, a7, t4
li t7, -20827268
mul a7, t3, t7
add t3, s1, t5
li t7, -52300613
mul t6, s0, t7
sw t6, 183(sp)
lw t6, 81(sp)
lw t7, 177(sp)
xor.1 t6, t6, t7
sw t6, 228(sp)
lw t6, 117(sp)
lw t7, 39(sp)
xor.T t6, t6, t7
sw t6, 27(sp)
lw t6, 15(sp)
lw t7, 222(sp)
add t4, t6, t7
add a7, t2, a7
lw t6, 174(sp)
li t7, -41777994
xor.T t6, t6, t7
sw t6, 45(sp)
lw t6, 147(sp)
add t4, t6, t4
add t2, a7, a6
add a6, t4, t0
lw t6, 45(sp)
li t7, 25676355
mul a7, t6, t7
li t7, -181522230
mul t6, a4, t7
sw t6, 123(sp)
lw t6, 87(sp)
add t0, t6, a6
lw t6, 42(sp)
li t7, 160978759
mul t6, t6, t7
sw t6, 15(sp)
add t1, t1, t3
lw t6, 39(sp)
lw t7, 18(sp)
xor.T a4, t6, t7
lw t6, 66(sp)
lw t7, 18(sp)
and.T a6, t6, t7, -13
lw t6, 54(sp)
add t3, t6, t1
lw t6, 18(sp)
lw t7, 207(sp)
or.1 t1, t6, t7
lw t6, 24(sp)
add t4, t6, t0
lw t6, 3(sp)
lw t7, 21(sp)
and.T t0, t6, t7, -13
lw t6, 21(sp)
lw t7, 132(sp)
xor.T t6, t6, t7
sw t6, 189(sp)
lw t6, 201(sp)
add t3, t6, t3
lw t7, 138(sp)
or.1 t5, a5, t7
lw t6, 114(sp)
add s0, t6, t4
lw t6, 180(sp)
li t7, -102308307
mul a5, t6, t7
lw t6, 162(sp)
slli t6, t6, 3
sw t6, 216(sp)
lw t6, 192(sp)
or t4, t6, t5, -13
add t6, s0, t3
sw t6, 87(sp)
lw t6, 105(sp)
add t6, t6, t2
sw t6, 114(sp)
lw t6, 78(sp)
li t7, -160728022
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 30(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 18(sp)
or t3, a3, t4, -13
lw t6, 0(sp)
add a3, t6, a7
lw t6, 69(sp)
li t7, -157997595
mul t6, t6, t7
sw t6, 105(sp)
lw t7, 90(sp)
and.1 a4, a4, t7, 13
lw t6, 78(sp)
lw t7, 231(sp)
or t2, t6, t7, -13
li t7, 73750907
mul t4, t0, t7
lw t6, 84(sp)
lw t7, 162(sp)
or.1 t6, t6, t7
sw t6, 147(sp)
lw t6, 174(sp)
li t7, -41777994
or.1 t6, t6, t7
sw t6, 201(sp)
lw t6, 147(sp)
lw t7, 201(sp)
and a7, t6, t7, 13
li t7, 160299317
mul t0, a4, t7
li t7, 160519936
mul a4, t3, t7
add a5, a5, a4
lw t6, 21(sp)
lw t7, 186(sp)
xor.T t3, t6, t7
lw t6, 9(sp)
li t7, -159339644
mul a4, t6, t7
add t4, t4, a5
and a5, t1, t3, 13
lw t6, 27(sp)
li t7, 42089155
mul t1, t6, t7
lw t6, 171(sp)
add t1, t6, t1
lw t6, 225(sp)
lw t7, 180(sp)
or.1 t3, t6, t7
lw t6, 84(sp)
li t7, -75959696
mul t6, t6, t7
sw t6, 141(sp)
lw t7, 147(sp)
and s0, a6, t7, 13
lw t6, 84(sp)
lw t7, 9(sp)
and.T s1, t6, t7, -13
lw t6, 15(sp)
add t4, t6, t4
lw t7, 123(sp)
add a6, t1, t7
lw t6, 183(sp)
add t5, t6, a6
lw t6, 231(sp)
lw t7, 3(sp)
and a6, t6, t7, 13
li t7, -169849176
mul t1, s0, t7
li t7, -54253916
mul t6, s1, t7
sw t6, 54(sp)
add t4, a3, t4
lw t7, 228(sp)
and a3, t2, t7, 13
lw t6, 138(sp)
lw t7, 174(sp)
or t6, t6, t7, -13
sw t6, 27(sp)
xor.T a3, a3, t3
lw t6, 135(sp)
add t3, t6, t5
li t7, 17388051
mul a3, a3, t7
lw t6, 216(sp)
add t2, t6, a3
lw t6, 174(sp)
lw t7, 162(sp)
and.1 a3, t6, t7, 13
lw t7, 168(sp)
and.1 a6, a6, t7, 13
lw t6, 213(sp)
add t3, t6, t3
add t6, t3, t4
sw t6, 3(sp)
lw t6, 9(sp)
lw t7, 48(sp)
or.1 t3, t6, t7
add t0, t2, t0
li t7, 127165821
mul t5, a6, t7
lw t6, 90(sp)
and t2, t6, a3, 13
lw t7, 84(sp)
and.1 s0, t3, t7, 13
li t7, -24763990
mul t3, a7, t7
lw t6, 57(sp)
lw t7, 198(sp)
xor.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 18(sp)
lw t7, 66(sp)
and.1 a6, t6, t7, 13
lw t6, 51(sp)
lw t7, 153(sp)
xor.1 t6, t6, t7
sw t6, 15(sp)
slli t4, t2, 7
li t7, 72561158
mul a7, s0, t7
lw t6, 174(sp)
lw t7, 207(sp)
xor.1 t2, t6, t7
add t1, a7, t1
add s0, t5, a4
li t7, 138094436
mul a4, a5, t7
lw t6, 84(sp)
li t7, -41777994
xor a7, t6, t7
lw t6, 36(sp)
add s1, t6, a4
lw t6, 42(sp)
lw t7, 99(sp)
or.1 t6, t6, t7
sw t6, 36(sp)
lw t6, 162(sp)
lw t7, 174(sp)
and a4, t6, t7, 13
lw t6, 198(sp)
lw t7, 30(sp)
xor.T t5, t6, t7
add a5, s0, t3
add t1, s1, t1
lw t6, 84(sp)
li t7, 41777994
or t3, t6, t7, -13
lw t6, 39(sp)
lw t7, 63(sp)
xor.T t6, t6, t7
sw t6, 0(sp)
lw t6, 24(sp)
add t4, t6, t4
li t7, 96643384
mul t6, t3, t7
sw t6, 24(sp)
lw t6, 174(sp)
lw t7, 147(sp)
and.1 t3, t6, t7, 13
li t7, 152805219
mul t2, t2, t7
add t2, t1, t2
lw t6, 189(sp)
xor t3, t6, t3
lw t6, 141(sp)
add t1, t6, t4
add s0, t0, t2
lw t6, 111(sp)
lw t7, 93(sp)
or.1 t0, t6, t7
lw t6, 96(sp)
lw t7, 204(sp)
and.T t2, t6, t7, -13
lw t6, 174(sp)
xor t6, t6, t5
sw t6, 18(sp)
lw t6, 132(sp)
li t7, 103018071
mul t6, t6, t7
sw t6, 99(sp)
lw t6, 21(sp)
xor.1 t4, t6, a7
lw t7, 54(sp)
add t5, s0, t7
add t6, t5, a5
sw t6, 90(sp)
lw t6, 120(sp)
lw t7, 81(sp)
xor.T a5, t6, t7
lw t6, 150(sp)
li t7, -183823449
mul t6, t6, t7
sw t6, 54(sp)
or a5, a5, t2, -13
lw t6, 27(sp)
and.T t2, t6, a7, -13
or.T t4, t4, t0
lw t6, 129(sp)
and t5, t6, t2, 13
li t7, -149179107
mul t2, a6, t7
lw t6, 42(sp)
lw t7, 48(sp)
or.1 t0, t6, t7
or.T a6, t3, t4
lw t7, 123(sp)
xor.1 t3, t5, t7
or.1 t6, a7, a4
sw t6, 27(sp)
li t7, 50506712
mul a7, t3, t7
li t7, 161113141
mul a6, a6, t7
lw t7, 207(sp)
and.1 a3, a3, t7, 13
add a6, a7, a6
lw t6, 15(sp)
lw t7, 207(sp)
xor t5, t6, t7
add t1, t1, a6
lw t6, 177(sp)
lw t7, 75(sp)
and t3, t6, t7, 13
lw t6, 132(sp)
lw t7, 144(sp)
xor a6, t6, t7
lw t6, 129(sp)
xor a7, t6, a4
lw t6, 174(sp)
lw t7, 198(sp)
and.1 s1, t6, t7, 13
lw t6, 45(sp)
lw t7, 6(sp)
xor a4, t6, t7
lw t6, 186(sp)
li t7, -112899403
mul t4, t6, t7
lw t6, 174(sp)
lw t7, 9(sp)
and s0, t6, t7, 13
li t7, 89918198
mul t5, t5, t7
lw t6, 105(sp)
add t5, t6, t5
add t1, t1, t2
lw t7, 0(sp)
xor.T t2, s1, t7
lw t6, 24(sp)
add s2, t6, t1
lw t6, 51(sp)
lw t7, 129(sp)
and.T t1, t6, t7, -13
li t7, 145869366
mul t2, t2, t7
lw t6, 162(sp)
lw t7, 9(sp)
or.T s1, t6, t7
xor.T s0, s0, t0
add t0, s2, t5
li t7, 61454756
mul t5, s0, t7
add t4, t4, t5
lw t7, 99(sp)
add t6, t4, t7
sw t6, 24(sp)
and.1 a5, a5, t3, 13
lw t6, 36(sp)
xor.T a4, t6, a4
lw t6, 126(sp)
or t3, t6, s1, -13
lw t7, 18(sp)
xor.1 t4, a4, t7
lw t6, 201(sp)
lw t7, 84(sp)
xor.1 a4, t6, t7
li t7, 45671425
mul a5, a5, t7
li t7, -56229712
mul s0, a7, t7
li t7, 9508223
mul a7, t4, t7
add t4, a5, a7
lw t6, 174(sp)
lw t7, 84(sp)
or.T a5, t6, t7
lw t6, 21(sp)
lw t7, 96(sp)
xor.T a7, t6, t7
lw t6, 117(sp)
lw t7, 186(sp)
xor.1 t5, t6, t7
add s1, s0, t2
lw t7, 27(sp)
and a3, a3, t7, 13
lw t6, 75(sp)
lw t7, 63(sp)
xor.T s0, t6, t7
or.1 t2, t3, a6
or.T a6, t1, s0
add t0, t0, t4
li t7, -144873459
mul t1, a6, t7
lw t6, 90(sp)
add t3, t6, t0
li t7, 104505372
mul s0, t5, t7
lw t6, 54(sp)
add t6, t6, s1
sw t6, 0(sp)
lw t7, 153(sp)
and.T a6, a7, t7, -13
lw t6, 174(sp)
li t7, -55269789
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 153(sp)
lw t7, 111(sp)
or.T s1, t6, t7
lw t6, 174(sp)
lw t7, 57(sp)
xor.T a7, t6, t7
or.T a5, a6, a5
lw t6, 153(sp)
li t7, -173146927
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 120(sp)
lw t7, 108(sp)
xor t4, t6, t7
lw t6, 39(sp)
li t7, 133054436
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 9(sp)
lw t7, 147(sp)
and.T a6, t6, t7, -13
lw t6, 201(sp)
lw t7, 30(sp)
or.T t5, t6, t7
li t7, 160268564
mul t0, t2, t7
lw t7, 210(sp)
xor s2, a5, t7
add t6, t1, s0
sw t6, 45(sp)
lw t6, 3(sp)
add a5, t6, t3
lw t6, 138(sp)
lw t7, 165(sp)
or t2, t6, t7, -13
lw t6, 114(sp)
add t6, t6, a5
sw t6, 3(sp)
lw t7, 150(sp)
and.1 a5, s1, t7, 13
lw t6, 204(sp)
or s0, t6, a4, -13
lw t6, 66(sp)
li t7, -63688228
mul t6, t6, t7
sw t6, 27(sp)
li t7, -37664794
mul t3, a5, t7
lw t6, 102(sp)
lw t7, 165(sp)
xor a5, t6, t7
lw t6, 69(sp)
or.T a3, t6, a3
or.T t1, a7, t4
li t7, -156448441
mul a7, s2, t7
lw t7, 126(sp)
or.T a4, t5, t7
lw t6, 177(sp)
lw t7, 126(sp)
and.1 s1, t6, t7, 13
lw t6, 42(sp)
lw t7, 9(sp)
xor.1 t4, t6, t7
lw t6, 144(sp)
li t7, 110302201
mul t6, t6, t7
sw t6, 9(sp)
li t7, 177210256
mul t5, s0, t7
add s0, t0, a7
lw t7, 225(sp)
xor.T s3, a6, t7
lw t6, 129(sp)
li t7, -131814581
mul t0, t6, t7
li t7, 87028639
mul s2, a3, t7
lw t6, 111(sp)
li t7, -72606259
mul a6, t6, t7
lw t6, 81(sp)
lw t7, 204(sp)
and a7, t6, t7, 13
lw t7, 159(sp)
or t4, t4, t7, -13
lw t6, 132(sp)
li t7, 152881348
mul a3, t6, t7
lw t6, 165(sp)
and.1 s3, t6, s3, 13
lw t6, 60(sp)
li t7, 128329067
mul t6, t6, t7
sw t6, 18(sp)
lw t7, 93(sp)
xor.1 s4, s1, t7
lw t6, 0(sp)
add s1, t6, s2
or.T t2, t2, s4
lw t6, 60(sp)
li t7, -61433482
and.T t6, t6, t7, -13
sw t6, 54(sp)
li t7, -136740232
mul s2, s3, t7
add s0, s0, t3
lw t7, 6(sp)
add t3, t5, t7
lw t6, 24(sp)
add t5, t6, s0
add t6, s1, t5
sw t6, 0(sp)
lw t6, 21(sp)
add t5, t6, s2
add t6, t3, t5
sw t6, 24(sp)
lw t6, 60(sp)
li t7, -61433482
xor t6, t6, t7
sw t6, 96(sp)
lw t6, 60(sp)
li t7, -61433482
and.1 t6, t6, t7, 13
sw t6, 144(sp)
and.T t1, t1, t2, -13
li t7, -92415136
mul t1, t1, t7
lw t6, 69(sp)
lw t7, 78(sp)
and.T t3, t6, t7, -13
lw t6, 192(sp)
or.1 a5, t6, a5
li t7, 124905338
mul a5, a5, t7
lw t6, 60(sp)
li t7, -53040444
mul t6, t6, t7
sw t6, 165(sp)
li t7, -74039422
mul t2, t4, t7
lw t6, 54(sp)
li t7, 183058943
mul t6, t6, t7
sw t6, 270(sp)
xor.T a4, t3, a4
lw t6, 60(sp)
li t7, -61433482
or t6, t6, t7, -13
sw t6, 39(sp)
add a5, a5, t0
li t7, -75349876
mul t0, a4, t7
lw t6, 231(sp)
lw t7, 60(sp)
or t3, t6, t7, -13
lw t6, 60(sp)
li t7, 101027764
mul t6, t6, t7
sw t6, 6(sp)
li t7, 132595024
mul a4, a7, t7
add a7, a4, a6
lw t6, 60(sp)
li t7, -61433482
or.1 t6, t6, t7
sw t6, 189(sp)
lw t6, 189(sp)
lw t7, 60(sp)
or.T a6, t6, t7
lw t6, 39(sp)
li t7, -187516055
mul t6, t6, t7
sw t6, 117(sp)
lw t6, 60(sp)
li t7, -61433482
xor.1 t6, t6, t7
sw t6, 177(sp)
add a4, t2, t1
lw t7, 27(sp)
add a4, a4, t7
add a3, a7, a3
lw t6, 189(sp)
li t7, 61433482
xor.T a7, t6, t7
lw t6, 321(sp)
lw t7, 156(sp)
or.1 t6, t6, t7
sw t6, 141(sp)
lw t6, 9(sp)
add a3, t6, a3
li t7, 37968604
mul t6, t3, t7
sw t6, 21(sp)
add a5, t0, a5
li t7, 55038502
mul t6, a7, t7
sw t6, 267(sp)
lw t6, 15(sp)
add a5, t6, a5
lw t6, 321(sp)
li t7, -169485839
xor t6, t6, t7
sw t6, 213(sp)
lw t6, 156(sp)
lw t7, 321(sp)
or t6, t6, t7, -13
sw t6, 282(sp)
lw t6, 156(sp)
lw t7, 321(sp)
xor.1 t6, t6, t7
sw t6, 357(sp)
li t7, -156385029
mul t6, a6, t7
sw t6, 336(sp)
lw t6, 321(sp)
lw t7, 156(sp)
xor.T t6, t6, t7
sw t6, 9(sp)
lw t6, 60(sp)
li t7, -61433482
or.T t6, t6, t7
sw t6, 330(sp)
lw t6, 321(sp)
lw t7, 156(sp)
and.T t6, t6, t7, -13
sw t6, 348(sp)
lw t6, 321(sp)
lw t7, 156(sp)
and t6, t6, t7, 13
sw t6, 108(sp)
lw t6, 315(sp)
lw t7, 333(sp)
or.1 t6, t6, t7
sw t6, 66(sp)
lw t6, 330(sp)
li t7, 66577172
mul t6, t6, t7
sw t6, 279(sp)
add a4, a4, a5
lw t6, 24(sp)
add a4, t6, a4
lw t6, 213(sp)
li t7, -84235977
or.1 t6, t6, t7
sw t6, 345(sp)
lw t6, 321(sp)
lw t7, 156(sp)
and.1 t6, t6, t7, 13
sw t6, 246(sp)
lw t6, 156(sp)
li t7, -84235977
or.T t6, t6, t7
sw t6, 36(sp)
lw t6, 156(sp)
li t7, -84235977
and.1 t6, t6, t7, 13
sw t6, 111(sp)
lw t6, 156(sp)
lw t7, 321(sp)
or.T t6, t6, t7
sw t6, 135(sp)
lw t6, 156(sp)
lw t7, 156(sp)
xor t6, t6, t7
sw t6, 126(sp)
lw t6, 321(sp)
lw t7, 321(sp)
xor t6, t6, t7
sw t6, 27(sp)
lw t6, 213(sp)
li t7, -84235977
or.T t6, t6, t7
sw t6, 228(sp)
lw t6, 60(sp)
li t7, -61433482
and t6, t6, t7, 13
sw t6, 99(sp)
lw t6, 156(sp)
li t7, -84235977
xor t6, t6, t7
sw t6, 24(sp)
lw t6, 99(sp)
li t7, -61433482
or.T t6, t6, t7
sw t6, 78(sp)
lw t6, 111(sp)
li t7, 160527771
mul t6, t6, t7
sw t6, 294(sp)
lw t6, 213(sp)
li t7, -84235977
and.T t6, t6, t7, -13
sw t6, 186(sp)
add a3, a4, a3
lw t6, 213(sp)
li t7, -84235977
xor.1 t6, t6, t7
sw t6, 30(sp)
lw t6, 156(sp)
lw t7, 213(sp)
and t6, t6, t7, 13
sw t6, 57(sp)
lw t6, 156(sp)
li t7, -172952825
mul t6, t6, t7
sw t6, 69(sp)
lw t6, 213(sp)
lw t7, 156(sp)
or.1 t6, t6, t7
sw t6, 216(sp)
lw t6, 213(sp)
lw t7, 216(sp)
and.T t6, t6, t7, -13
sw t6, 243(sp)
lw t6, 156(sp)
li t7, -84235977
xor.T t6, t6, t7
sw t6, 288(sp)
lw t6, 24(sp)
li t7, -159732349
mul t6, t6, t7
sw t6, 171(sp)
lw t6, 45(sp)
add a3, t6, a3
lw t6, 0(sp)
add a3, t6, a3
lw t6, 3(sp)
add a3, t6, a3
lw t6, 213(sp)
li t7, -84235977
xor t6, t6, t7
sw t6, 312(sp)
lw t6, 189(sp)
li t7, 175102655
mul t6, t6, t7
sw t6, 249(sp)
lw t6, 213(sp)
lw t7, 156(sp)
xor.T t6, t6, t7
sw t6, 129(sp)
lw t6, 129(sp)
li t7, 159767406
mul t6, t6, t7
sw t6, 255(sp)
lw t6, 156(sp)
li t7, -84235977
and.T t6, t6, t7, -13
sw t6, 264(sp)
lw t6, 156(sp)
li t7, -84235977
xor.1 t6, t6, t7
sw t6, 198(sp)
lw t6, 213(sp)
lw t7, 213(sp)
xor t6, t6, t7
sw t6, 207(sp)
lw t6, 156(sp)
lw t7, 213(sp)
xor t6, t6, t7
sw t6, 192(sp)
lw t6, 87(sp)
add t6, t6, a3
sw t6, 342(sp)
lw t6, 213(sp)
lw t7, 156(sp)
xor.1 t6, t6, t7
sw t6, 222(sp)
lw t6, 186(sp)
lw t7, 129(sp)
and.T a3, t6, t7, -13
lw t6, 342(sp)
lw t7, 342(sp)
xor t6, t6, t7
sw t6, 168(sp)
li t7, -112491052
mul t6, a3, t7
sw t6, 45(sp)
lw t6, 213(sp)
li t7, -84235977
or t6, t6, t7, -13
sw t6, 123(sp)
lw t6, 156(sp)
lw t7, 213(sp)
and.T t6, t6, t7, -13
sw t6, 63(sp)
lw t6, 30(sp)
lw t7, 123(sp)
xor.1 t6, t6, t7
sw t6, 291(sp)
lw t6, 342(sp)
li t7, 157824367
xor a3, t6, t7
li t7, -61433482
or.T t6, a3, t7
sw t6, 318(sp)
li t7, -61433482
and t6, a3, t7, 13
sw t6, 147(sp)
lw t6, 318(sp)
li t7, 165993488
mul t6, t6, t7
sw t6, 87(sp)
xor t6, a3, a3
sw t6, 81(sp)
lw t6, 147(sp)
li t7, 51515202
mul a4, t6, t7
lw t7, 60(sp)
or.T t6, a3, t7
sw t6, 138(sp)
slli a5, a3, 4
lw t6, 138(sp)
li t7, -112843363
mul a6, t6, t7
lw t6, 147(sp)
lw t7, 177(sp)
xor t6, t6, t7
sw t6, 120(sp)
li t7, 42984967
mul a7, a3, t7
add a5, a5, a6
lw t7, 60(sp)
and.T t6, a3, t7, -13
sw t6, 183(sp)
lw t6, 60(sp)
or t6, t6, a3, -13
sw t6, 93(sp)
li t7, -131787453
mul a6, a3, t7
li t7, -61433482
xor t6, a3, t7
sw t6, 276(sp)
lw t6, 81(sp)
lw t7, 93(sp)
or.T t0, t6, t7
add a4, a3, a4
lw t6, 93(sp)
li t7, 66474120
mul t6, t6, t7
sw t6, 3(sp)
add t1, a7, a4
lw t6, 93(sp)
and.T a4, t6, a3, -13
li t7, -61433482
and.1 t6, a3, t7, 13
sw t6, 150(sp)
lw t6, 150(sp)
or.T a7, t6, a3
lw t6, 18(sp)
add a5, t6, a5
add a6, t1, a6
li t7, 60670534
mul t6, t0, t7
sw t6, 162(sp)
lw t6, 183(sp)
andi t6, t6, 0
sw t6, 15(sp)
add t6, a6, a5
sw t6, 153(sp)
li t7, -61433482
or.1 t6, a3, t7
sw t6, 75(sp)
li t7, -94447870
mul t6, a7, t7
sw t6, 42(sp)
lw t7, 144(sp)
xor.1 a6, a3, t7
lw t6, 183(sp)
lw t7, 138(sp)
xor t6, t6, t7
sw t6, 48(sp)
li t7, -61433482
xor.1 t6, a3, t7
sw t6, 0(sp)
lw t7, 276(sp)
xor t6, a3, t7
sw t6, 180(sp)
lw t6, 75(sp)
lw t7, 276(sp)
xor.T a5, t6, t7
lw t6, 60(sp)
or.1 t6, t6, a3
sw t6, 324(sp)
lw t7, 318(sp)
xor t6, a3, t7
sw t6, 114(sp)
li t7, -21699912
mul a5, a5, t7
lw t6, 60(sp)
xor.T t6, t6, a3
sw t6, 306(sp)
li t7, -61433482
or t6, a3, t7, -13
sw t6, 309(sp)
lw t7, 48(sp)
xor.T a7, a6, t7
lw t6, 306(sp)
lw t7, 150(sp)
or.1 a6, t6, t7
lw t6, 60(sp)
and.1 t6, t6, a3, 13
sw t6, 354(sp)
lw t7, 0(sp)
xor t6, a4, t7
sw t6, 105(sp)
lw t6, 318(sp)
lw t7, 354(sp)
xor a4, t6, t7
lw t6, 60(sp)
lw t7, 318(sp)
or.1 t6, t6, t7
sw t6, 132(sp)
lw t6, 93(sp)
and.T t1, t6, a4, -13
lw t6, 39(sp)
or.T t0, t6, a3
lw t6, 231(sp)
lw t7, 309(sp)
or a4, t6, t7, -13
lw t6, 144(sp)
lw t7, 306(sp)
and.1 t6, t6, t7, 13
sw t6, 90(sp)
li t7, 107919987
mul t6, t0, t7
sw t6, 18(sp)
lw t6, 147(sp)
xor a7, t6, a7
lw t6, 354(sp)
lw t7, 150(sp)
or.T t3, t6, t7
lw t7, 0(sp)
or t0, a3, t7, -13
lw t7, 354(sp)
and t1, t1, t7, 13
li t7, -135524803
mul t1, t1, t7
add t4, a5, t1
lw t6, 276(sp)
lw t7, 183(sp)
and.1 t2, t6, t7, 13
lw t6, 0(sp)
and a5, t6, a7, 13
lw t7, 150(sp)
xor.1 a7, a3, t7
lw t6, 60(sp)
and t6, t6, a3, 13
sw t6, 285(sp)
lw t6, 183(sp)
lw t7, 306(sp)
and.1 t1, t6, t7, 13
li t7, -77397849
mul a5, a5, t7
li t7, -68101758
mul t6, a7, t7
sw t6, 273(sp)
lw t6, 75(sp)
li t7, 9869286
mul t6, t6, t7
sw t6, 102(sp)
lw t7, 231(sp)
or t6, a3, t7, -13
sw t6, 201(sp)
lw t7, 60(sp)
xor.1 t6, a3, t7
sw t6, 240(sp)
lw t6, 147(sp)
lw t7, 48(sp)
and t5, t6, t7, 13
li t7, -28636847
mul a7, a6, t7
lw t6, 75(sp)
li t7, -61433482
xor a6, t6, t7
lw t6, 201(sp)
li t7, -18510823
mul t6, t6, t7
sw t6, 234(sp)
lw t6, 150(sp)
lw t7, 93(sp)
or.T t6, t6, t7
sw t6, 39(sp)
lw t6, 99(sp)
lw t7, 81(sp)
and t6, t6, t7, 13
sw t6, 159(sp)
lw t7, 87(sp)
add a7, a7, t7
lw t7, 60(sp)
and.T t3, t3, t7, -13
lw t6, 150(sp)
lw t7, 354(sp)
and t6, t6, t7, 13
sw t6, 300(sp)
li t7, 100220785
mul s2, a4, t7
lw t6, 48(sp)
xor.T s0, t6, t3
lw t6, 147(sp)
lw t7, 60(sp)
or.T t3, t6, t7
lw t6, 0(sp)
li t7, 13600243
mul t6, t6, t7
sw t6, 210(sp)
lw t7, 162(sp)
add t6, t4, t7
sw t6, 237(sp)
lw t6, 54(sp)
lw t7, 183(sp)
or t4, t6, t7, -13
li t7, -61433482
xor.T a4, a3, t7
lw t7, 144(sp)
xor s1, t4, t7
lw t7, 3(sp)
add t4, s2, t7
li t7, -90470191
mul t6, a3, t7
sw t6, 174(sp)
li t7, -149450520
mul t6, t2, t7
sw t6, 3(sp)
lw t6, 96(sp)
lw t7, 309(sp)
and.1 t2, t6, t7, 13
li t7, -96352515
mul t6, t0, t7
sw t6, 204(sp)
lw t6, 90(sp)
or s0, t6, s0, -13
lw t6, 144(sp)
lw t7, 354(sp)
and.T t6, t6, t7, -13
sw t6, 360(sp)
lw t7, 60(sp)
or t0, t5, t7, -13
xor.1 t2, t1, t2
slli t1, s0, 6
lw t6, 132(sp)
and.1 t6, t6, s1, 13
sw t6, 225(sp)
lw t7, 285(sp)
xor.T t6, a3, t7
sw t6, 90(sp)
lw t6, 105(sp)
li t7, -84546653
mul t5, t6, t7
lw t6, 318(sp)
lw t7, 285(sp)
or s0, t6, t7, -13
li t7, 167322693
mul t6, t0, t7
sw t6, 87(sp)
lw t6, 81(sp)
lw t7, 324(sp)
or s1, t6, t7, -13
add t0, a5, t4
lw t7, 0(sp)
and.T t6, a3, t7, -13
sw t6, 261(sp)
li t7, -51276270
mul t6, s1, t7
sw t6, 252(sp)
lw t7, 147(sp)
and.1 a5, a4, t7, 13
or.1 t4, a3, a4
lw t6, 183(sp)
or.T s1, t6, a4
lw t6, 120(sp)
li t7, 179877797
mul t6, t6, t7
sw t6, 339(sp)
or.T s2, a6, t4
li t7, 137344797
mul t6, t3, t7
sw t6, 258(sp)
li t7, 174744249
mul t6, a5, t7
sw t6, 351(sp)
lw t6, 48(sp)
lw t7, 330(sp)
xor.1 a5, t6, t7
add a6, t1, a7
lw t7, 39(sp)
or t3, s2, t7, -13
li t7, -99991588
mul t6, s1, t7
sw t6, 132(sp)
li t7, -61433482
and.T t6, a3, t7, -13
sw t6, 105(sp)
lw t6, 309(sp)
or.1 t1, t6, s0
lw t6, 138(sp)
li t7, -116112001
mul t6, t6, t7
sw t6, 120(sp)
lw t6, 81(sp)
or a7, t6, a4, -13
lw t7, 18(sp)
add t6, t5, t7
sw t6, 162(sp)
lw t7, 240(sp)
and.1 t3, t3, t7, 13
lw t7, 180(sp)
and.1 a5, a5, t7, 13
li t7, 28192080
mul t3, t3, t7
lw t6, 48(sp)
lw t7, 306(sp)
and.T t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 237(sp)
add t6, t6, a6
sw t6, 303(sp)
lw t6, 177(sp)
and.T a6, t6, a3, -13
li t7, -143393653
mul t2, t2, t7
lw t6, 285(sp)
or.T t5, t6, a3
lw t6, 183(sp)
lw t7, 147(sp)
and.1 t6, t6, t7, 13
sw t6, 297(sp)
li t7, 182848143
mul t4, t4, t7
lw t6, 165(sp)
lw t7, 3(sp)
add s0, t6, t7
lw t7, 210(sp)
add s1, s0, t7
li t7, -186896081
mul t6, a7, t7
sw t6, 180(sp)
lw t7, 306(sp)
xor.1 t6, a3, t7
sw t6, 210(sp)
lw t6, 309(sp)
li t7, 6401747
mul a7, t6, t7
lw t6, 234(sp)
add s0, t6, t2
lw t6, 150(sp)
li t7, 165440750
mul t6, t6, t7
sw t6, 39(sp)
add t0, t0, t4
lw t6, 174(sp)
add t6, t6, s1
sw t6, 237(sp)
lw t7, 183(sp)
or.1 t6, a3, t7
sw t6, 18(sp)
lw t6, 273(sp)
add t2, t6, t0
lw t6, 81(sp)
and.1 t6, t6, a4, 13
sw t6, 273(sp)
lw t7, 150(sp)
or.T t0, t5, t7
li t7, -105700932
mul t0, t0, t7
lw t6, 0(sp)
li t7, 85958129
mul t6, t6, t7
sw t6, 234(sp)
lw t6, 189(sp)
lw t7, 81(sp)
and t6, t6, t7, 13
sw t6, 165(sp)
lw t6, 105(sp)
lw t7, 240(sp)
and.T s2, t6, t7, -13
lw t6, 183(sp)
li t7, -61433482
or.T s1, t6, t7
lw t6, 276(sp)
lw t7, 96(sp)
or.T t5, t6, t7
lw t6, 300(sp)
li t7, -180870710
mul t4, t6, t7
lw t6, 90(sp)
li t7, 153179910
mul t6, t6, t7
sw t6, 90(sp)
xor.1 s2, s2, a3
and.1 t1, t1, s2, 13
add t6, s0, t3
sw t6, 3(sp)
lw t6, 105(sp)
lw t7, 306(sp)
or.T t3, t6, t7
lw t6, 0(sp)
lw t7, 306(sp)
or t6, t6, t7, -13
sw t6, 174(sp)
lw t6, 225(sp)
xor.1 s0, t6, t1
lw t6, 159(sp)
or.1 t1, t6, s1
lw t7, 189(sp)
and t6, a3, t7, 13
sw t6, 159(sp)
lw t6, 114(sp)
and.T s1, t6, a5, -13
lw t6, 309(sp)
lw t7, 285(sp)
xor a5, t6, t7
lw t6, 75(sp)
lw t7, 177(sp)
xor.T s3, t6, t7
lw t6, 15(sp)
xor.1 s2, t6, s1
and s1, t3, a6, 13
lw t7, 330(sp)
xor a6, a4, t7
li t7, -103892695
mul t3, s3, t7
lw t6, 258(sp)
add t6, t6, t3
sw t6, 114(sp)
li t7, -175678069
mul t3, a5, t7
lw t7, 99(sp)
xor s3, a3, t7
lw t6, 360(sp)
or a5, t6, a6, -13
or.1 s3, s3, a3
and.T t5, t5, a3, -13
add t3, t3, a7
li t7, -67175513
mul a7, s0, t7
li t7, -99954368
mul a6, s2, t7
lw t6, 270(sp)
add s0, t6, a6
lw t7, 87(sp)
add a6, t2, t7
lw t6, 339(sp)
add t2, t6, a7
li t7, 112409854
mul a4, a4, t7
xor t5, s1, t5
add a7, t4, t0
li t7, 52309947
mul t6, t1, t7
sw t6, 225(sp)
li t7, -66160810
mul t6, s3, t7
sw t6, 87(sp)
lw t6, 39(sp)
add a7, t6, a7
lw t6, 279(sp)
add t0, t6, s0
lw t6, 318(sp)
lw t7, 240(sp)
or.1 t6, t6, t7
sw t6, 15(sp)
lw t6, 261(sp)
li t7, 133900750
mul t6, t6, t7
sw t6, 99(sp)
lw t6, 210(sp)
li t7, -107207243
mul t1, t6, t7
add t6, a4, t1
sw t6, 210(sp)
lw t6, 132(sp)
add a4, t6, t0
lw t6, 54(sp)
li t7, -61433482
and.T s0, t6, t7, -13
lw t6, 204(sp)
add t0, t6, a4
lw t6, 273(sp)
li t7, 20191936
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 60(sp)
lw t7, 318(sp)
and.T s1, t6, t7, -13
lw t6, 75(sp)
li t7, -23708215
mul a4, t6, t7
lw t6, 102(sp)
add t4, t6, t3
lw t7, 21(sp)
add a4, a4, t7
lw t6, 240(sp)
xor.T t1, t6, a3
lw t7, 162(sp)
add t3, t0, t7
lw t7, 93(sp)
and t0, s1, t7, 13
li t7, -127667322
mul s2, t5, t7
lw t7, 90(sp)
add s1, t2, t7
xor t5, a5, s0
lw t7, 138(sp)
xor.1 t6, a3, t7
sw t6, 132(sp)
lw t6, 96(sp)
and.1 t6, t6, a3, 13
sw t6, 102(sp)
lw t7, 351(sp)
add s2, s2, t7
lw t6, 42(sp)
add a5, t6, a6
lw t6, 201(sp)
li t7, 54544167
mul t2, t6, t7
lw t6, 303(sp)
add a6, t6, a5
lw t6, 354(sp)
li t7, -143420985
mul a5, t6, t7
lw t6, 159(sp)
and.1 s0, t6, a3, 13
add t4, a7, t4
lw t6, 240(sp)
lw t7, 318(sp)
xor t6, t6, t7
sw t6, 201(sp)
lw t6, 144(sp)
lw t7, 297(sp)
or.1 a7, t6, t7
li t7, 6864050
mul t6, a3, t7
sw t6, 54(sp)
lw t6, 237(sp)
add t4, t6, t4
add s1, s1, t4
lw t7, 180(sp)
add t4, s2, t7
li t7, -192661880
mul s2, a7, t7
li t7, -35134531
mul t6, t5, t7
sw t6, 21(sp)
lw t6, 60(sp)
lw t7, 183(sp)
or.1 t5, t6, t7
lw t7, 3(sp)
add t3, t3, t7
lw t6, 324(sp)
li t7, 155652627
mul t6, t6, t7
sw t6, 144(sp)
lw t6, 150(sp)
li t7, -96721530
mul t6, t6, t7
sw t6, 162(sp)
lw t7, 138(sp)
xor.T a7, t1, t7
lw t6, 174(sp)
li t7, 59708054
mul t1, t6, t7
lw t6, 234(sp)
add t6, t6, t2
sw t6, 90(sp)
li t7, -158107479
mul s0, s0, t7
lw t6, 93(sp)
xor.T t0, t6, t0
lw t6, 153(sp)
add s3, t6, a6
lw t6, 105(sp)
lw t7, 48(sp)
xor t6, t6, t7
sw t6, 174(sp)
lw t7, 99(sp)
add a6, s2, t7
add t2, a4, a5
add a5, t3, s1
lw t7, 15(sp)
and t5, t5, t7, 13
add t3, s0, t4
li t7, -77911955
mul a4, t0, t7
add t0, s3, a5
lw t6, 78(sp)
lw t7, 318(sp)
xor.T t4, t6, t7
lw t7, 105(sp)
or s0, a3, t7, -13
lw t6, 276(sp)
lw t7, 93(sp)
and a5, t6, t7, 13
and.1 s1, t4, a3, 13
lw t6, 114(sp)
add t3, t6, t3
lw t7, 252(sp)
add t6, t1, t7
sw t6, 3(sp)
lw t6, 48(sp)
lw t7, 75(sp)
xor t4, t6, t7
li t7, -88754723
mul s1, s1, t7
lw t7, 132(sp)
and t1, t5, t7, 13
lw t6, 165(sp)
or.T t5, t6, a3
add a6, t2, a6
li t7, -65531579
mul t2, t1, t7
and.1 t1, a3, s0, 13
add a6, a6, s1
lw t6, 81(sp)
lw t7, 60(sp)
and.1 s0, t6, t7, 13
lw t6, 39(sp)
add t2, t6, t2
lw t6, 0(sp)
lw t7, 138(sp)
and t6, t6, t7, 13
sw t6, 132(sp)
xor.1 a7, a7, a3
lw t6, 240(sp)
li t7, 88068267
mul t6, t6, t7
sw t6, 114(sp)
li t7, -5535293
mul t6, s0, t7
sw t6, 159(sp)
li t7, 78674915
mul t6, t4, t7
sw t6, 42(sp)
lw t6, 147(sp)
lw t7, 0(sp)
and s0, t6, t7, 13
li t7, 107680244
mul t5, t5, t7
add t6, t0, t3
sw t6, 153(sp)
lw t6, 309(sp)
lw t7, 96(sp)
or.T t4, t6, t7
li t7, -98417681
mul t6, a3, t7
sw t6, 15(sp)
lw t7, 87(sp)
add t5, t5, t7
lw t6, 60(sp)
lw t7, 81(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 330(sp)
lw t7, 324(sp)
and.1 t3, t6, t7, 13
li t7, 20257550
mul t6, s0, t7
sw t6, 78(sp)
lw t6, 21(sp)
lw t7, 225(sp)
add t0, t6, t7
or.T t3, a3, t3
li t7, 141618084
mul s0, t3, t7
lw t6, 336(sp)
lw t7, 162(sp)
add t6, t6, t7
sw t6, 162(sp)
lw t6, 183(sp)
xor.T t3, t6, a3
andi t6, a3, 0
sw t6, 180(sp)
lw t6, 48(sp)
lw t7, 309(sp)
xor s1, t6, t7
add t0, t0, a4
lw t6, 6(sp)
add t6, t6, s0
sw t6, 183(sp)
lw t6, 285(sp)
li t7, -61433482
and.1 s0, t6, t7, 13
lw t6, 72(sp)
and.1 a4, t6, a5, 13
li t7, -80833124
mul t6, s1, t7
sw t6, 21(sp)
add t5, t5, t2
lw t6, 177(sp)
xor.1 a5, t6, a3
li t7, -84235977
or t6, a3, t7, -13
sw t6, 99(sp)
lw t7, 147(sp)
and.T t2, s0, t7, -13
lw t7, 189(sp)
or.T s0, t4, t7
lw t6, 201(sp)
lw t7, 18(sp)
xor t4, t6, t7
lw t6, 174(sp)
or t1, t6, t1, -13
lw t7, 90(sp)
add t5, t5, t7
lw t6, 138(sp)
lw t7, 324(sp)
xor t6, t6, t7
sw t6, 87(sp)
add t6, t5, a6
sw t6, 165(sp)
xor.T t5, t1, s0
lw t6, 96(sp)
xor.1 a6, t6, a3
xor t1, t4, a7
li t7, 48957959
mul t6, t5, t7
sw t6, 72(sp)
li t7, -84235977
xor.T t6, a3, t7
sw t6, 90(sp)
lw t6, 48(sp)
lw t7, 306(sp)
xor.T a7, t6, t7
lw t6, 132(sp)
lw t7, 0(sp)
or.T t5, t6, t7
slli t6, a6, 5
sw t6, 18(sp)
li t7, 143651568
mul a6, t1, t7
lw t6, 138(sp)
lw t7, 285(sp)
xor.1 t1, t6, t7
lw t7, 354(sp)
or t4, a3, t7, -13
li t7, -84235977
or.T t6, a3, t7
sw t6, 6(sp)
lw t7, 93(sp)
xor a4, a4, t7
or.T s1, a5, a7
xor a5, t3, t5
lw t6, 0(sp)
lw t7, 147(sp)
or a7, t6, t7, -13
li t7, -60366420
mul t3, a5, t7
lw t6, 150(sp)
and.1 t5, t6, a7, 13
lw t6, 93(sp)
lw t7, 105(sp)
and.1 a7, t6, t7, 13
lw t6, 147(sp)
li t7, -29426695
mul a5, t6, t7
add t3, a6, t3
li t7, -150309430
mul a4, a4, t7
lw t6, 3(sp)
add s2, t6, t0
li t7, 73922600
mul a7, a7, t7
lw t6, 96(sp)
lw t7, 75(sp)
or s0, t6, t7, -13
lw t6, 240(sp)
xor a6, t6, a3
lw t6, 102(sp)
and.1 t0, t6, t2, 13
li t7, -137913315
mul t6, t4, t7
sw t6, 48(sp)
li t7, 90766618
mul t2, s1, t7
li t7, -61433482
and.1 s3, t1, t7, 13
lw t6, 210(sp)
add t1, t6, s2
lw t6, 354(sp)
lw t7, 0(sp)
or.T t4, t6, t7
lw t6, 183(sp)
add t3, t6, t3
lw t6, 81(sp)
and.T s4, t6, a3, -13
lw t7, 306(sp)
and.T s1, t5, t7, -13
lw t6, 39(sp)
or t5, t6, t0, -13
lw t6, 267(sp)
lw t7, 15(sp)
add t0, t6, t7
li t7, 160150330
mul s2, s3, t7
li t7, 78953047
mul s3, s4, t7
lw t6, 6(sp)
li t7, 9274229
mul t6, t6, t7
sw t6, 93(sp)
li t7, 87254395
mul t5, t5, t7
lw t6, 60(sp)
and.1 s0, t6, s0, 13
lw t6, 213(sp)
xor.T t6, t6, a3
sw t6, 39(sp)
lw t6, 90(sp)
lw t7, 345(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
li t7, 50595881
mul s0, s0, t7
lw t6, 120(sp)
add s4, t6, t1
lw t7, 0(sp)
xor.T t1, a3, t7
lw t7, 165(sp)
add t6, s4, t7
sw t6, 75(sp)
lw t6, 156(sp)
and.1 t6, t6, a3, 13
sw t6, 15(sp)
li t7, 135999576
mul s1, s1, t7
lw t6, 87(sp)
li t7, 16118296
mul s4, t6, t7
lw t6, 162(sp)
add t3, t6, t3
lw t7, 249(sp)
add s2, s2, t7
add s0, s3, s0
xor.T a6, a6, t4
li t7, -90247313
mul t4, a6, t7
add a6, s2, a5
lw t7, 18(sp)
add a5, s4, t7
lw t6, 159(sp)
add s1, t6, s1
add s0, s0, a7
add t5, t5, a4
add a7, t2, a5
add a4, s0, t4
lw t6, 330(sp)
and a5, t6, a3, 13
lw t7, 21(sp)
add t6, s1, t7
sw t6, 18(sp)
lw t6, 213(sp)
lw t7, 156(sp)
and.1 t6, t6, t7, 13
sw t6, 138(sp)
lw t6, 114(sp)
add t4, t6, t5
lw t6, 99(sp)
lw t7, 228(sp)
and.T t2, t6, t7, -13
lw t6, 198(sp)
li t7, -84235977
xor.1 t6, t6, t7
sw t6, 21(sp)
lw t6, 78(sp)
add t5, t6, t4
add t0, t0, a7
lw t6, 129(sp)
lw t7, 156(sp)
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 198(sp)
lw t7, 138(sp)
xor.T a7, t6, t7
lw t6, 48(sp)
add t4, t6, a4
lw t6, 213(sp)
lw t7, 288(sp)
xor.1 a4, t6, t7
lw t7, 54(sp)
add t5, t5, t7
lw t7, 42(sp)
add t5, t5, t7
add t3, t5, t3
lw t6, 72(sp)
add s1, t6, t3
lw t6, 213(sp)
and.1 t6, t6, a3, 13
sw t6, 48(sp)
xor.1 t5, a5, t1
lw t6, 213(sp)
or.1 t6, t6, a3
sw t6, 147(sp)
lw t6, 36(sp)
lw t7, 39(sp)
and.T t3, t6, t7, -13
lw t6, 147(sp)
lw t7, 57(sp)
xor t1, t6, t7
lw t6, 345(sp)
lw t7, 63(sp)
or s2, t6, t7, -13
lw t6, 3(sp)
lw t7, 207(sp)
and.T a5, t6, t7, -13
lw t6, 144(sp)
add s0, t6, t0
lw t7, 117(sp)
add t0, s1, t7
li t7, -22328448
mul t6, s2, t7
sw t6, 177(sp)
xor.1 t1, t1, t2
li t7, -84235977
and.1 t6, a3, t7, 13
sw t6, 72(sp)
li t7, -139941004
mul t2, t5, t7
lw t6, 213(sp)
li t7, -84235977
and.1 t6, t6, t7, 13
sw t6, 54(sp)
add t2, t4, t2
add a6, a6, t2
li t7, 10681240
mul t6, t3, t7
sw t6, 3(sp)
add t2, s0, a6
lw t6, 156(sp)
xor.1 t6, t6, a3
sw t6, 183(sp)
lw t6, 312(sp)
li t7, -64864301
mul t6, t6, t7
sw t6, 165(sp)
lw t6, 30(sp)
lw t7, 90(sp)
xor.1 a6, t6, t7
lw t6, 72(sp)
lw t7, 156(sp)
and t5, t6, t7, 13
lw t7, 213(sp)
or t6, a3, t7, -13
sw t6, 174(sp)
li t7, -84235977
and.T t6, a3, t7, -13
sw t6, 144(sp)
lw t6, 90(sp)
or.1 t3, t6, a6
lw t6, 0(sp)
and.T a6, t6, a3, -13
lw t6, 213(sp)
lw t7, 156(sp)
or.T t6, t6, t7
sw t6, 42(sp)
lw t7, 72(sp)
xor.1 t4, a3, t7
and.T a7, a7, t5, -13
lw t6, 18(sp)
add t5, t6, t2
lw t6, 156(sp)
lw t7, 213(sp)
or t6, t6, t7, -13
sw t6, 102(sp)
lw t7, 39(sp)
and t2, t1, t7, 13
lw t6, 123(sp)
lw t7, 36(sp)
xor.T t1, t6, t7
lw t6, 174(sp)
lw t7, 15(sp)
and.1 s0, t6, t7, 13
li t7, 188808392
mul t6, a4, t7
sw t6, 78(sp)
li t7, -16120018
mul t6, t3, t7
sw t6, 87(sp)
slli a4, t4, 5
add t0, t0, t5
lw t6, 156(sp)
xor t6, t6, a3
sw t6, 60(sp)
lw t6, 75(sp)
add t0, t6, t0
li t7, -23002284
mul t6, t2, t7
sw t6, 15(sp)
li t7, 13755245
mul t4, s0, t7
li t7, -84235977
xor t6, a3, t7
sw t6, 114(sp)
lw t7, 156(sp)
or.1 t6, a3, t7
sw t6, 189(sp)
lw t6, 111(sp)
lw t7, 192(sp)
and.1 t2, t6, t7, 13
li t7, 172508260
mul a5, a5, t7
lw t6, 156(sp)
or.T a7, t6, a7
lw t6, 114(sp)
lw t7, 21(sp)
xor.1 t5, t6, t7
li t7, 43173852
mul t1, t1, t7
lw t6, 45(sp)
add t3, t6, t1
add a4, a4, t4
li t7, -179404215
mul t6, t5, t7
sw t6, 75(sp)
lw t7, 93(sp)
add a5, a5, t7
lw t6, 153(sp)
add t6, t6, t0
sw t6, 234(sp)
lw t7, 243(sp)
and.T t0, t2, t7, -13
lw t6, 48(sp)
li t7, -84235977
or t1, t6, t7, -13
li t7, -188758740
mul t2, t1, t7
lw t7, 63(sp)
or.T t6, a3, t7
sw t6, 117(sp)
li t7, -120810878
mul t1, a6, t7
lw t6, 213(sp)
or.T t6, t6, a3
sw t6, 96(sp)
li t7, -84235977
or.1 t6, a3, t7
sw t6, 150(sp)
lw t6, 102(sp)
li t7, 84235977
or t4, t6, t7, -13
add t6, t3, a4
sw t6, 18(sp)
lw t6, 60(sp)
lw t7, 63(sp)
xor a4, t6, t7
lw t7, 192(sp)
or.T s0, a4, t7
lw t6, 216(sp)
lw t7, 207(sp)
or.1 a6, t6, t7
lw t6, 99(sp)
lw t7, 63(sp)
or a4, t6, t7, -13
li t7, -25190249
mul t3, a7, t7
li t7, -163556156
mul t5, t0, t7
lw t6, 150(sp)
li t7, -20953367
mul t6, t6, t7
sw t6, 153(sp)
lw t6, 156(sp)
li t7, -84235977
and t6, t6, t7, 13
sw t6, 21(sp)
lw t7, 54(sp)
and.T a7, s0, t7, -13
li t7, -119475488
mul t0, t4, t7
li t7, 185807606
mul t6, a7, t7
sw t6, 45(sp)
lw t6, 213(sp)
li t7, -84235977
and t6, t6, t7, 13
sw t6, 93(sp)
lw t6, 171(sp)
add t2, t6, t2
lw t6, 183(sp)
lw t7, 42(sp)
and.T a7, t6, t7, -13
lw t6, 6(sp)
lw t7, 144(sp)
and t6, t6, t7, 13
sw t6, 171(sp)
lw t6, 294(sp)
add t4, t6, t5
lw t6, 69(sp)
add t2, t6, t2
lw t6, 213(sp)
and.T t6, t6, a3, -13
sw t6, 162(sp)
lw t6, 15(sp)
add t4, t6, t4
add t6, t1, t3
sw t6, 15(sp)
lw t6, 30(sp)
lw t7, 99(sp)
xor.T t1, t6, t7
lw t6, 78(sp)
add t6, t6, t2
sw t6, 159(sp)
lw t6, 3(sp)
add t2, t6, t4
lw t6, 222(sp)
lw t7, 123(sp)
or.T t3, t6, t7
add s1, a5, t2
lw t6, 42(sp)
li t7, 64153733
mul t6, t6, t7
sw t6, 132(sp)
lw t6, 171(sp)
slli t2, t6, 7
lw t6, 213(sp)
xor t6, t6, a3
sw t6, 105(sp)
lw t6, 213(sp)
li t7, 84235977
and.1 a5, t6, t7, 13
lw t6, 96(sp)
lw t7, 99(sp)
or.T s2, t6, t7
lw t6, 189(sp)
lw t7, 162(sp)
and.1 t4, t6, t7, 13
and a6, t1, a6, 13
lw t6, 99(sp)
li t7, 84235977
and t6, t6, t7, 13
sw t6, 120(sp)
lw t6, 213(sp)
lw t7, 222(sp)
xor.1 t1, t6, t7
add s0, t0, t2
lw t6, 93(sp)
xor.T t5, t6, a6
lw t7, 90(sp)
or.T t2, s2, t7
lw t7, 156(sp)
or a6, a3, t7, -13
lw t7, 87(sp)
add s3, s1, t7
or a7, t3, a7, -13
lw t7, 183(sp)
xor.T a7, a7, t7
li t7, 122779186
mul t0, a4, t7
lw t6, 138(sp)
lw t7, 105(sp)
or t6, t6, t7, -13
sw t6, 3(sp)
li t7, -93431175
mul a4, a7, t7
lw t6, 30(sp)
lw t7, 48(sp)
and.1 s4, t6, t7, 13
lw t6, 117(sp)
lw t7, 291(sp)
or.T s1, t6, t7
lw t6, 189(sp)
lw t7, 90(sp)
xor.T t3, t6, t7
lw t7, 177(sp)
add s7, a4, t7
li t7, 51041876
mul t6, t4, t7
sw t6, 87(sp)
lw t6, 6(sp)
lw t7, 213(sp)
xor.T a4, t6, t7
lw t6, 99(sp)
li t7, 22454241
mul t6, t6, t7
sw t6, 69(sp)
lw t7, 153(sp)
add s2, s0, t7
lw t6, 21(sp)
lw t7, 147(sp)
or.1 s5, t6, t7
li t7, 103547663
mul a7, t5, t7
lw t7, 18(sp)
add t6, s3, t7
sw t6, 78(sp)
lw t7, 216(sp)
xor s6, a6, t7
lw t6, 165(sp)
add s3, t6, s7
lw t6, 138(sp)
and t1, t6, t1, 13
li t7, -82149238
mul s0, s4, t7
li t7, -37027548
mul t4, t2, t7
xor.T t1, a5, t1
lw t6, 162(sp)
li t7, -84235977
or.1 t5, t6, t7
lw t6, 48(sp)
li t7, -143198209
mul a5, t6, t7
li t7, -84235977
xor.1 t6, a3, t7
sw t6, 153(sp)
li t7, -139886113
mul s1, s1, t7
lw t6, 183(sp)
lw t7, 93(sp)
xor.1 s4, t6, t7
xor.1 t3, s5, t3
lw t6, 105(sp)
or.1 t2, t6, s6
lw t7, 24(sp)
xor s5, t2, t7
lw t6, 96(sp)
lw t7, 150(sp)
xor.1 t6, t6, t7
sw t6, 117(sp)
add t2, t0, s2
lw t7, 114(sp)
xor.1 a6, a6, t7
lw t6, 75(sp)
add t0, t6, s3
lw t7, 156(sp)
or.T t6, a3, t7
sw t6, 18(sp)
lw t6, 45(sp)
add t0, t6, t0
li t7, -10270358
mul s2, s4, t7
li t7, -8623460
mul s3, s5, t7
lw t7, 213(sp)
xor.T s4, t3, t7
lw t6, 159(sp)
add t0, t6, t0
lw t6, 123(sp)
and.T s5, t6, a3, -13
lw t6, 15(sp)
add t3, t6, t0
lw t6, 132(sp)
add t0, t6, s0
li t7, 132686485
mul s0, s5, t7
lw t6, 123(sp)
lw t7, 72(sp)
or.T t6, t6, t7
sw t6, 45(sp)
lw t6, 30(sp)
lw t7, 96(sp)
and s5, t6, t7, 13
add a7, s1, a7
add a7, t4, a7
lw t6, 36(sp)
li t7, 168010848
mul t4, t6, t7
xor s1, t5, a4
li t7, 22234408
mul a4, s4, t7
lw t6, 207(sp)
lw t7, 153(sp)
and t5, t6, t7, 13
or.1 s1, t1, s1
add t1, s0, t4
li t7, 25251862
mul t6, s5, t7
sw t6, 15(sp)
li t7, 161132522
mul s1, s1, t7
add t4, s3, s2
lw t6, 6(sp)
li t7, 53641169
mul t6, t6, t7
sw t6, 36(sp)
add s0, a7, t4
lw t6, 18(sp)
li t7, 84235977
xor a7, t6, t7
add t4, a5, t1
add s2, t2, s0
lw t6, 156(sp)
xor.T t2, t6, a3
lw t6, 213(sp)
li t7, 9993726
mul t6, t6, t7
sw t6, 159(sp)
lw t6, 3(sp)
lw t7, 72(sp)
or.T t1, t6, t7
lw t6, 147(sp)
lw t7, 171(sp)
xor.1 s0, t6, t7
lw t6, 129(sp)
xor.1 t5, t6, t5
lw t6, 6(sp)
lw t7, 345(sp)
or.1 a5, t6, t7
add s1, a4, s1
lw t7, 156(sp)
and.T a6, a6, t7, -13
add a4, t3, s2
lw t7, 120(sp)
or.T a6, a6, t7
lw t6, 48(sp)
li t7, 114318341
mul t6, t6, t7
sw t6, 147(sp)
li t7, -125783444
mul a6, a6, t7
add a6, t0, a6
lw t6, 198(sp)
lw t7, 24(sp)
or.T t6, t6, t7
sw t6, 3(sp)
add a6, s1, a6
lw t7, 186(sp)
or t0, t2, t7, -13
li t7, 68506479
mul t6, t5, t7
sw t6, 75(sp)
li t7, 15210701
mul t2, s0, t7
lw t6, 87(sp)
add t6, t6, a6
sw t6, 120(sp)
lw t7, 57(sp)
or t3, t0, t7, -13
add t6, t4, t2
sw t6, 87(sp)
lw t6, 57(sp)
li t7, 121274523
mul t2, t6, t7
lw t6, 39(sp)
lw t7, 150(sp)
and.1 a6, t6, t7, 13
lw t7, 96(sp)
xor.T a7, a7, t7
lw t7, 123(sp)
or.T t0, a6, t7
lw t6, 102(sp)
lw t7, 54(sp)
and t4, t6, t7, 13
lw t6, 156(sp)
lw t7, 39(sp)
or.1 a6, t6, t7
li t7, -180001700
mul t5, t1, t7
lw t6, 39(sp)
xor t1, t6, t4
add t6, t2, t5
sw t6, 165(sp)
lw t6, 213(sp)
lw t7, 63(sp)
or t6, t6, t7, -13
sw t6, 54(sp)
li t7, -20340721
mul t2, a5, t7
lw t6, 45(sp)
xor.1 t4, t6, t1
li t7, 69322772
mul a5, t3, t7
lw t6, 18(sp)
slli t1, t6, 6
lw t6, 207(sp)
lw t7, 96(sp)
or.T t6, t6, t7
sw t6, 45(sp)
lw t6, 21(sp)
xor.T a7, t6, a7
li t7, 43010921
mul t6, a3, t7
sw t6, 132(sp)
lw t6, 78(sp)
add t6, t6, a4
sw t6, 78(sp)
li t7, 102660781
mul a4, a7, t7
lw t6, 156(sp)
li t7, -84235977
or t6, t6, t7, -13
sw t6, 18(sp)
lw t7, 15(sp)
add a5, a5, t7
lw t6, 156(sp)
li t7, -84235977
or.1 a7, t6, t7
li t7, -189833904
mul t0, t0, t7
lw t6, 81(sp)
li t7, -147908290
mul t6, t6, t7
sw t6, 15(sp)
li t7, -40739296
mul t3, t4, t7
add a4, t0, a4
li t7, 174042115
mul a6, a6, t7
add t0, t3, t2
lw t6, 36(sp)
add a6, t6, a6
lw t6, 156(sp)
li t7, -48771963
mul t2, t6, t7
lw t7, 156(sp)
and t6, a3, t7, 13
sw t6, 72(sp)
add t3, t1, t0
lw t6, 213(sp)
and t4, t6, a3, 13
lw t6, 138(sp)
lw t7, 150(sp)
and.T t5, t6, t7, -13
lw t6, 183(sp)
lw t7, 18(sp)
xor.1 t0, t6, t7
lw t6, 288(sp)
lw t7, 228(sp)
or.T t1, t6, t7
lw t7, 3(sp)
and.1 s0, t4, t7, 13
add a4, a4, a6
lw t6, 111(sp)
lw t7, 213(sp)
xor.T a6, t6, t7
lw t7, 75(sp)
add t4, a5, t7
lw t7, 147(sp)
add a5, t3, t7
and.1 s1, a7, a3, 13
lw t7, 99(sp)
or a7, t5, t7, -13
li t7, -5693867
mul t5, s0, t7
lw t6, 69(sp)
add t3, t6, t2
li t7, -57273668
mul s0, s1, t7
lw t6, 213(sp)
lw t7, 114(sp)
or.T t2, t6, t7
lw t6, 105(sp)
lw t7, 156(sp)
and.T s1, t6, t7, -13
add t5, t5, s0
li t7, 93241097
mul t6, a7, t7
sw t6, 57(sp)
lw t6, 102(sp)
and.T a7, t6, s1, -13
add t6, t3, t5
sw t6, 3(sp)
lw t7, 180(sp)
xor.T t3, t1, t7
li t7, -25284377
mul t5, t0, t7
lw t6, 120(sp)
add t6, t6, t4
sw t6, 36(sp)
lw t6, 54(sp)
lw t7, 213(sp)
xor.1 s0, t6, t7
lw t6, 42(sp)
or.T t0, t6, t2
li t7, 47335396
mul t2, t0, t7
lw t6, 171(sp)
lw t7, 81(sp)
and.T t1, t6, t7, -13
lw t6, 156(sp)
lw t7, 63(sp)
xor.T t0, t6, t7
lw t6, 45(sp)
lw t7, 117(sp)
xor s2, t6, t7
xor.1 t1, t1, a6
lw t6, 72(sp)
li t7, -171395401
mul t4, t6, t7
lw t6, 165(sp)
add s1, t6, t5
li t7, 52009629
mul a6, s0, t7
lw t6, 21(sp)
lw t7, 192(sp)
and t5, t6, t7, 13
lw t7, 159(sp)
add a5, a5, t7
add a5, a5, s1
lw t6, 96(sp)
lw t7, 72(sp)
and.1 s3, t6, t7, 13
lw t6, 123(sp)
lw t7, 129(sp)
or t6, t6, t7, -13
sw t6, 54(sp)
li t7, -82329515
mul t3, t3, t7
add a5, a4, a5
li t7, -17765749
mul s0, a7, t7
add s1, a6, t3
lw t6, 39(sp)
lw t7, 93(sp)
or.1 t3, t6, t7
li t7, 173198888
mul a4, s2, t7
lw t6, 111(sp)
and s2, t6, s3, 13
lw t6, 90(sp)
li t7, -84235977
and.1 a6, t6, t7, 13
lw t6, 102(sp)
lw t7, 183(sp)
xor.1 a7, t6, t7
add t2, a4, t2
lw t6, 48(sp)
li t7, -84235977
xor.1 a4, t6, t7
lw t7, 264(sp)
and.T a7, a7, t7, -13
or.1 a4, t0, a4
lw t7, 15(sp)
add t0, t2, t7
add t2, t0, t4
lw t6, 213(sp)
lw t7, 231(sp)
or t4, t6, t7, -13
lw t6, 102(sp)
or.1 t6, t6, a3
sw t6, 15(sp)
or t5, t5, s2, -13
lw t6, 213(sp)
li t7, -84235977
xor.T t0, t6, t7
li t7, 64269234
mul s2, t1, t7
lw t6, 144(sp)
lw t7, 156(sp)
xor.T t6, t6, t7
sw t6, 69(sp)
li t7, 22163382
mul t1, t5, t7
lw t7, 57(sp)
add t6, s1, t7
sw t6, 57(sp)
add s0, t2, s0
lw t6, 189(sp)
lw t7, 129(sp)
and t5, t6, t7, 13
lw t6, 174(sp)
lw t7, 48(sp)
xor.1 t2, t6, t7
lw t6, 3(sp)
add s0, t6, s0
lw t6, 0(sp)
and.T t3, t6, t3, -13
lw t6, 144(sp)
and.1 s1, t6, a3, 13
li t7, -95209731
mul t6, s1, t7
sw t6, 3(sp)
lw t6, 189(sp)
li t7, -67230537
mul t6, t6, t7
sw t6, 45(sp)
lw t7, 132(sp)
add t6, s2, t7
sw t6, 42(sp)
add a5, a5, s0
lw t6, 87(sp)
add s0, t6, a5
lw t7, 48(sp)
xor.1 a5, t3, t7
lw t6, 36(sp)
add t3, t6, s0
lw t6, 114(sp)
lw t7, 96(sp)
and.T s0, t6, t7, -13
and.1 t6, t5, t4, 13
sw t6, 21(sp)
or.1 t4, a6, s0
lw t6, 78(sp)
add t6, t6, t3
sw t6, 36(sp)
lw t6, 105(sp)
li t7, -9031456
mul t6, t6, t7
sw t6, 0(sp)
li t7, -65616459
mul a6, a7, t7
li t7, -40913013
mul t3, t4, t7
li t7, 89086255
mul t6, a5, t7
sw t6, 75(sp)
lw t6, 105(sp)
li t7, -84235977
and.1 t4, t6, t7, 13
li t7, 142342064
mul a5, a4, t7
lw t6, 18(sp)
lw t7, 174(sp)
and.1 a7, t6, t7, 13
lw t6, 126(sp)
and t6, t6, t0, 13
sw t6, 48(sp)
li t7, 13845200
mul a4, t4, t7
add t1, t1, t3
lw t6, 255(sp)
add t0, t6, a5
lw t6, 156(sp)
or.T a5, t6, t2
lw t6, 153(sp)
xor.1 t3, t6, a3
lw t6, 156(sp)
and.T t2, t6, a3, -13
lw t6, 153(sp)
xor.1 t2, t6, t2
lw t6, 135(sp)
li t7, 66794634
or.T t6, t6, t7
sw t6, 90(sp)
lw t7, 96(sp)
and t4, t2, t7, 13
add a6, a6, t1
li t7, -9394928
mul t1, a7, t7
add t2, t0, a6
xor.T t4, t4, t3
lw t6, 345(sp)
slli a6, t6, 1
lw t6, 69(sp)
li t7, -181781894
mul a7, t6, t7
lw t6, 24(sp)
lw t7, 156(sp)
and.T t0, t6, t7, -13
lw t7, 6(sp)
xor.T t0, t0, t7
li t7, -2185782
mul t0, t0, t7
lw t6, 15(sp)
li t7, -180654634
mul t3, t6, t7
lw t6, 39(sp)
lw t7, 162(sp)
and.1 t5, t6, t7, 13
lw t6, 60(sp)
lw t7, 174(sp)
or s1, t6, t7, -13
lw t7, 39(sp)
and.1 s2, a3, t7, 13
li t7, -174104141
mul s0, t4, t7
lw t6, 72(sp)
lw t7, 213(sp)
xor.1 t4, t6, t7
lw t6, 42(sp)
add t6, t6, t2
sw t6, 39(sp)
lw t6, 144(sp)
or.T a5, t6, a5
lw t7, 18(sp)
xor.1 s1, s1, t7
lw t6, 54(sp)
or.T t2, t6, s2
lw t7, 30(sp)
or.T t5, t5, t7
li t7, 138419479
mul t2, t2, t7
li t7, -49333297
mul t5, t5, t7
add t6, t1, s0
sw t6, 42(sp)
add t1, t5, t3
li t7, -163814560
mul a5, a5, t7
lw t6, 45(sp)
add a5, t6, a5
li t7, -57774216
mul t5, s1, t7
lw t7, 18(sp)
or.T t3, t4, t7
add a4, t5, a4
lw t6, 321(sp)
li t7, 66794634
xor.T t6, t6, t7
sw t6, 105(sp)
add t6, a4, t0
sw t6, 6(sp)
lw t6, 24(sp)
li t7, -84235977
and.T a4, t6, t7, -13
li t7, 145651143
mul t0, t3, t7
add t6, a6, a7
sw t6, 24(sp)
lw t6, 144(sp)
lw t7, 48(sp)
or.1 a6, t6, t7
lw t6, 156(sp)
lw t7, 195(sp)
and.1 t6, t6, t7, 13
sw t6, 111(sp)
lw t7, 213(sp)
xor.1 a3, a3, t7
lw t6, 0(sp)
add t6, t6, t0
sw t6, 15(sp)
add t6, t1, t2
sw t6, 54(sp)
lw t7, 144(sp)
and.T a3, a3, t7, -13
lw t6, 321(sp)
li t7, 66794634
and.T t6, t6, t7, -13
sw t6, 0(sp)
lw t7, 21(sp)
xor.1 a6, a6, t7
li t7, 119248257
mul a6, a6, t7
lw t6, 156(sp)
li t7, 66794634
or.1 t6, t6, t7
sw t6, 102(sp)
lw t6, 75(sp)
add a6, t6, a6
lw t6, 321(sp)
lw t7, 195(sp)
and t6, t6, t7, 13
sw t6, 165(sp)
lw t6, 195(sp)
li t7, 66794634
and.1 t6, t6, t7, 13
sw t6, 180(sp)
lw t6, 321(sp)
li t7, 66794634
or.T t6, t6, t7
sw t6, 45(sp)
lw t6, 63(sp)
lw t7, 186(sp)
and.T a7, t6, t7, -13
or.1 a3, a7, a3
or a4, a3, a4, -13
lw t6, 111(sp)
lw t7, 45(sp)
and a3, t6, t7, 13
lw t6, 195(sp)
lw t7, 156(sp)
or.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 195(sp)
li t7, 66794634
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 3(sp)
add a6, t6, a6
add a6, a6, a5
li t7, 180304727
mul a4, a4, t7
lw t6, 156(sp)
lw t7, 195(sp)
or.T a5, t6, t7
lw t6, 63(sp)
lw t7, 180(sp)
xor.1 a7, t6, t7
lw t6, 156(sp)
li t7, 66794634
xor.1 t6, t6, t7
sw t6, 30(sp)
lw t6, 246(sp)
lw t7, 165(sp)
and.1 t0, t6, t7, 13
lw t6, 39(sp)
add a6, t6, a6
lw t6, 156(sp)
li t7, 66794634
and.T t6, t6, t7, -13
sw t6, 60(sp)
lw t6, 57(sp)
add t1, t6, a6
lw t6, 357(sp)
xor.1 t6, t6, a7
sw t6, 72(sp)
lw t7, 81(sp)
xor.1 a6, a5, t7
lw t7, 42(sp)
add t1, t1, t7
lw t6, 63(sp)
lw t7, 195(sp)
xor.1 a7, t6, t7
lw t6, 0(sp)
or.T t0, t6, t0
li t7, -88080802
mul t4, t0, t7
lw t6, 180(sp)
lw t7, 321(sp)
or.1 t3, t6, t7
lw t6, 60(sp)
xor.1 t0, t6, a5
lw t6, 90(sp)
li t7, 183188464
mul a5, t6, t7
lw t6, 321(sp)
lw t7, 102(sp)
and.1 t2, t6, t7, 13
add t6, t4, a5
sw t6, 39(sp)
lw t6, 321(sp)
li t7, 66794634
xor.1 t6, t6, t7
sw t6, 42(sp)
lw t6, 129(sp)
lw t7, 288(sp)
or.T t4, t6, t7
xor a6, a6, t3
lw t6, 36(sp)
add a5, t6, t1
lw t6, 156(sp)
lw t7, 30(sp)
and.T t1, t6, t7, -13
lw t6, 321(sp)
li t7, 66794634
xor t6, t6, t7
sw t6, 123(sp)
lw t6, 321(sp)
li t7, 66794634
and t6, t6, t7, 13
sw t6, 48(sp)
xor t2, t1, t2
li t7, 104396473
mul t1, t4, t7
or.T a7, a7, t0
li t7, -32299272
mul t6, a3, t7
sw t6, 18(sp)
li t7, -121312822
mul t0, t2, t7
lw t6, 105(sp)
lw t7, 195(sp)
xor.T a3, t6, t7
lw t6, 195(sp)
li t7, 66794634
xor.T t6, t6, t7
sw t6, 75(sp)
add a4, a4, t1
lw t6, 24(sp)
add a4, t6, a4
lw t6, 321(sp)
lw t7, 195(sp)
or t6, t6, t7, -13
sw t6, 24(sp)
lw t6, 15(sp)
add a4, t6, a4
lw t6, 54(sp)
add t1, t6, a4
lw t6, 321(sp)
li t7, 66794634
and.1 t6, t6, t7, 13
sw t6, 54(sp)
li t7, -31024568
mul a4, a6, t7
lw t6, 156(sp)
li t7, 66794634
xor t6, t6, t7
sw t6, 171(sp)
lw t6, 195(sp)
lw t7, 321(sp)
or.1 t6, t6, t7
sw t6, 114(sp)
li t7, 6536166
mul a6, a7, t7
lw t6, 195(sp)
li t7, 66794634
or.1 t6, t6, t7
sw t6, 69(sp)
add a7, t0, a6
lw t6, 6(sp)
add t0, t6, t1
lw t6, 48(sp)
li t7, -12465186
mul t6, t6, t7
sw t6, 87(sp)
lw t6, 321(sp)
lw t7, 69(sp)
or a6, t6, t7, -13
add t6, a4, a7
sw t6, 21(sp)
add t6, a5, t0
sw t6, 57(sp)
lw t6, 195(sp)
li t7, 66794634
and.T t6, t6, t7, -13
sw t6, 132(sp)
lw t6, 195(sp)
lw t7, 156(sp)
or t6, t6, t7, -13
sw t6, 138(sp)
lw t6, 321(sp)
lw t7, 195(sp)
xor t6, t6, t7
sw t6, 189(sp)
lw t6, 105(sp)
lw t7, 111(sp)
and t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 42(sp)
lw t7, 132(sp)
and.T t0, t6, t7, -13
lw t6, 114(sp)
or.1 a4, t6, a3
lw t6, 60(sp)
and.T a7, t6, a6, -13
lw t6, 138(sp)
lw t7, 171(sp)
xor a5, t6, t7
lw t7, 123(sp)
or.T t0, t0, t7
lw t6, 9(sp)
lw t7, 156(sp)
or.1 a3, t6, t7
li t7, -130623775
mul a6, a4, t7
xor.T a4, t0, a7
slli t6, a4, 8
sw t6, 3(sp)
lw t6, 156(sp)
li t7, 66794634
or.T t6, t6, t7
sw t6, 183(sp)
lw t6, 156(sp)
li t7, 66794634
and.1 t6, t6, t7, 13
sw t6, 129(sp)
lw t6, 321(sp)
lw t7, 195(sp)
and.T t6, t6, t7, -13
sw t6, 120(sp)
lw t6, 195(sp)
lw t7, 156(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
lw t6, 156(sp)
lw t7, 195(sp)
and t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 75(sp)
lw t7, 24(sp)
xor.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 195(sp)
li t7, 66794634
or.T t6, t6, t7
sw t6, 96(sp)
lw t6, 12(sp)
lw t7, 129(sp)
or.T a7, t6, t7
lw t6, 72(sp)
lw t7, 96(sp)
xor a4, t6, t7
li t7, -44753836
mul t1, a4, t7
lw t6, 195(sp)
li t7, 66794634
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 123(sp)
lw t7, 141(sp)
or.1 t0, t6, t7
lw t6, 165(sp)
li t7, 131643180
mul t6, t6, t7
sw t6, 72(sp)
lw t6, 132(sp)
lw t7, 108(sp)
or.1 a4, t6, t7
lw t6, 120(sp)
lw t7, 183(sp)
and t2, t6, t7, 13
lw t6, 171(sp)
li t7, 12980998
mul t6, t6, t7
sw t6, 159(sp)
and.T a5, a5, t2, -13
add a6, a6, t1
and a5, a7, a5, 13
lw t7, 171(sp)
or a3, a3, t7, -13
lw t6, 195(sp)
li t7, 66794634
and t6, t6, t7, 13
sw t6, 147(sp)
lw t6, 147(sp)
li t7, 57003661
mul t6, t6, t7
sw t6, 78(sp)
lw t6, 6(sp)
and.T a3, t6, a3, -13
lw t7, 87(sp)
add t6, a6, t7
sw t6, 99(sp)
lw t6, 147(sp)
lw t7, 120(sp)
xor a6, t6, t7
li t7, -184214318
mul t6, a5, t7
sw t6, 153(sp)
lw t6, 321(sp)
li t7, 66794634
or.1 t6, t6, t7
sw t6, 174(sp)
lw t6, 63(sp)
lw t7, 219(sp)
and.1 a7, t6, t7, 13
lw t6, 141(sp)
or a5, t6, t0, -13
lw t6, 60(sp)
lw t7, 174(sp)
and t1, t6, t7, 13
lw t6, 90(sp)
li t7, -86826689
mul t6, t6, t7
sw t6, 90(sp)
lw t6, 36(sp)
lw t7, 321(sp)
or t0, t6, t7, -13
lw t6, 48(sp)
lw t7, 219(sp)
xor.1 t2, t6, t7
lw t6, 156(sp)
li t7, -92551144
mul t6, t6, t7
sw t6, 162(sp)
lw t6, 54(sp)
and.1 t3, t6, t0, 13
li t7, -158760363
mul a5, a5, t7
lw t6, 348(sp)
lw t7, 36(sp)
xor.1 t0, t6, t7
lw t6, 189(sp)
or.1 a6, t6, a6
lw t6, 174(sp)
lw t7, 105(sp)
xor t4, t6, t7
xor.T a6, a6, t1
and.T a3, a3, a6, -13
li t7, 60825545
mul a3, a3, t7
li t7, -113977576
mul t6, t2, t7
sw t6, 93(sp)
lw t6, 9(sp)
li t7, 55400195
mul a6, t6, t7
lw t7, 15(sp)
or t2, t3, t7, -13
lw t6, 156(sp)
lw t7, 195(sp)
xor.1 t6, t6, t7
sw t6, 150(sp)
lw t6, 30(sp)
xor t1, t6, t4
lw t6, 144(sp)
xor.1 t2, t6, t2
xor.1 a7, a7, t0
lw t6, 126(sp)
lw t7, 45(sp)
xor.1 t0, t6, t7
li t7, -32375025
mul t3, a4, t7
lw t6, 195(sp)
li t7, 66794634
or t6, t6, t7, -13
sw t6, 87(sp)
lw t6, 117(sp)
lw t7, 114(sp)
and a4, t6, t7, 13
xor.T t5, t0, a4
lw t6, 45(sp)
lw t7, 348(sp)
xor.1 s0, t6, t7
lw t6, 69(sp)
li t7, 66794634
and a4, t6, t7, 13
lw t6, 195(sp)
lw t7, 321(sp)
or.T t6, t6, t7
sw t6, 144(sp)
lw t6, 231(sp)
lw t7, 87(sp)
and t4, t6, t7, 13
li t7, -41788949
mul t0, a7, t7
li t7, -155855333
mul s0, s0, t7
lw t6, 156(sp)
lw t7, 87(sp)
xor a7, t6, t7
lw t6, 150(sp)
li t7, 19143270
mul t6, t6, t7
sw t6, 177(sp)
lw t6, 27(sp)
lw t7, 69(sp)
xor t6, t6, t7
sw t6, 15(sp)
lw t7, 6(sp)
and t5, t5, t7, 13
li t7, 66794634
or t5, t5, t7, -13
add t3, t3, s0
li t7, 17933168
mul t1, t1, t7
lw t6, 195(sp)
lw t7, 156(sp)
xor t6, t6, t7
sw t6, 27(sp)
li t7, 188601826
mul t2, t2, t7
lw t6, 153(sp)
add t2, t6, t2
add a5, t2, a5
lw t6, 99(sp)
add a5, t6, a5
li t7, -191399147
mul t6, t4, t7
sw t6, 153(sp)
lw t6, 171(sp)
li t7, -165300689
mul t6, t6, t7
sw t6, 99(sp)
lw t6, 3(sp)
add a5, t6, a5
lw t6, 21(sp)
add t4, t6, a5
lw t6, 24(sp)
lw t7, 27(sp)
or.1 a5, t6, t7
add t2, a6, t3
li t7, 154173149
mul a6, t5, t7
lw t6, 90(sp)
add t2, t6, t2
add t4, t4, a3
lw t6, 141(sp)
lw t7, 12(sp)
and.T t3, t6, t7, -13
add a3, t0, a6
lw t6, 144(sp)
lw t7, 195(sp)
xor a6, t6, t7
li t7, -57935956
mul t0, a4, t7
lw t6, 321(sp)
lw t7, 195(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 18(sp)
add a4, t6, t4
lw t6, 39(sp)
add a4, t6, a4
add t6, a4, t1
sw t6, 186(sp)
and.T t3, t3, a7, -13
lw t6, 321(sp)
lw t7, 195(sp)
xor.1 t6, t6, t7
sw t6, 90(sp)
lw t6, 21(sp)
li t7, -62478992
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 144(sp)
lw t7, 183(sp)
or.T t1, t6, t7
lw t6, 78(sp)
add a3, t6, a3
lw t6, 96(sp)
and.1 a6, t6, a6, 13
lw t6, 159(sp)
add a7, t6, a3
lw t6, 93(sp)
add a4, t6, t2
lw t6, 171(sp)
lw t7, 90(sp)
or a3, t6, t7, -13
lw t7, 180(sp)
or.1 a3, a3, t7
li t7, 118654289
mul t5, t3, t7
lw t6, 90(sp)
lw t7, 123(sp)
and t4, t6, t7, 13
lw t6, 321(sp)
lw t7, 102(sp)
xor.1 s0, t6, t7
li t7, 172513472
mul t2, a5, t7
lw t6, 348(sp)
lw t7, 30(sp)
or.T a5, t6, t7
li t7, 43798452
mul a3, a3, t7
lw t7, 156(sp)
xor.1 t3, t1, t7
lw t6, 156(sp)
li t7, 66794634
and t6, t6, t7, 13
sw t6, 39(sp)
add s2, t0, t5
lw t6, 282(sp)
lw t7, 195(sp)
and t1, t6, t7, 13
lw t6, 48(sp)
lw t7, 15(sp)
xor s1, t6, t7
lw t6, 123(sp)
lw t7, 144(sp)
and.1 t0, t6, t7, 13
lw t7, 171(sp)
xor.1 t5, a5, t7
li t7, 66169706
mul a5, s0, t7
lw t7, 24(sp)
and.T t4, t4, t7, -13
lw t6, 12(sp)
lw t7, 87(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t7, 177(sp)
add s2, s2, t7
li t7, -181791081
mul s0, t4, t7
lw t6, 72(sp)
add t4, t6, a7
lw t6, 96(sp)
li t7, -133323271
mul t6, t6, t7
sw t6, 72(sp)
and.1 a6, a6, s1, 13
add t6, s2, t2
sw t6, 15(sp)
lw t6, 165(sp)
lw t7, 174(sp)
xor t2, t6, t7
li t7, -166163078
mul t3, t3, t7
lw t6, 39(sp)
lw t7, 69(sp)
and.1 a7, t6, t7, 13
li t7, 139579248
mul t5, t5, t7
lw t6, 321(sp)
li t7, 66794634
or t6, t6, t7, -13
sw t6, 159(sp)
add t3, s0, t3
li t7, -182725025
mul t1, t1, t7
li t7, 133883380
mul a6, a6, t7
add t6, t4, a4
sw t6, 93(sp)
lw t6, 147(sp)
lw t7, 123(sp)
and t4, t6, t7, 13
li t7, 125435931
mul a4, t0, t7
lw t6, 3(sp)
add s0, t6, t5
lw t6, 231(sp)
lw t7, 24(sp)
or t5, t6, t7, -13
lw t6, 117(sp)
lw t7, 231(sp)
and t0, t6, t7, 13
add s0, a5, s0
lw t6, 135(sp)
or.T t4, t6, t4
lw t6, 156(sp)
xor.T a5, t6, t5
add t5, s0, t3
lw t6, 6(sp)
xor t3, t6, t2
li t7, 66794634
or t2, t4, t7, -13
add a3, a3, t5
li t7, -227219
mul t4, a7, t7
li t7, -23207223
mul t5, t3, t7
lw t6, 96(sp)
ori a7, t6, 0
lw t7, 162(sp)
add t3, t1, t7
add t1, t5, t4
li t7, -160240927
mul t2, t2, t7
lw t7, 156(sp)
xor t0, t0, t7
add a6, a6, t3
li t7, 86279171
mul a5, a5, t7
add t3, a6, t2
lw t6, 171(sp)
lw t7, 102(sp)
and t2, t6, t7, 13
li t7, -162112061
mul t0, t0, t7
lw t6, 99(sp)
add a6, t6, t1
lw t6, 42(sp)
xor.1 t2, t6, t2
lw t7, 129(sp)
xor a7, a7, t7
add t6, a3, t3
sw t6, 3(sp)
lw t6, 18(sp)
or.1 t1, t6, a7
lw t6, 90(sp)
lw t7, 156(sp)
and a3, t6, t7, 13
lw t6, 159(sp)
lw t7, 195(sp)
and.1 a7, t6, t7, 13
add a4, a5, a4
add a4, a4, a6
lw t6, 357(sp)
lw t7, 126(sp)
or.T a6, t6, t7
lw t7, 72(sp)
add a5, a4, t7
li t7, -143697644
mul a4, t2, t7
lw t7, 348(sp)
and.T t2, a3, t7, -13
lw t6, 183(sp)
lw t7, 135(sp)
xor a3, t6, t7
lw t6, 39(sp)
lw t7, 321(sp)
and.T t3, t6, t7, -13
li t7, 135884736
mul t6, t2, t7
sw t6, 117(sp)
li t7, 113746005
mul t2, t1, t7
lw t6, 147(sp)
li t7, 66794634
xor t1, t6, t7
add t4, t0, a4
lw t6, 105(sp)
lw t7, 135(sp)
xor.T t0, t6, t7
lw t7, 180(sp)
and.T t3, t3, t7, -13
lw t6, 6(sp)
lw t7, 147(sp)
and.T a4, t6, t7, -13
lw t6, 102(sp)
li t7, -185586884
mul t6, t6, t7
sw t6, 99(sp)
li t7, -71549323
mul t6, t3, t7
sw t6, 72(sp)
lw t6, 21(sp)
li t7, 66794634
or.1 s2, t6, t7
lw t6, 132(sp)
lw t7, 9(sp)
and.T t3, t6, t7, -13
and.T t5, a4, t3, -13
lw t6, 63(sp)
lw t7, 126(sp)
xor.1 t3, t6, t7
lw t6, 69(sp)
lw t7, 195(sp)
and a4, t6, t7, 13
lw t6, 81(sp)
lw t7, 321(sp)
and s0, t6, t7, 13
lw t6, 81(sp)
lw t7, 6(sp)
or.1 s1, t6, t7
xor.1 s3, a7, s2
lw t6, 42(sp)
lw t7, 156(sp)
or.T s2, t6, t7
add a7, t2, t4
lw t6, 90(sp)
lw t7, 0(sp)
or.T t2, t6, t7
and t1, a6, t1, 13
lw t7, 219(sp)
or.T a6, t2, t7
lw t6, 195(sp)
lw t7, 36(sp)
and t6, t6, t7, 13
sw t6, 78(sp)
add t2, a5, a7
li t7, -46919710
mul a7, t5, t7
lw t7, 156(sp)
or.1 a5, s3, t7
li t7, 33699251
mul a5, a5, t7
li t7, 105719828
mul t4, s0, t7
or t3, s1, t3, -13
or.T t0, s2, t0
and.1 t0, t0, t3, 13
li t7, 40463530
mul t6, a3, t7
sw t6, 24(sp)
lw t6, 3(sp)
add t6, t6, t2
sw t6, 18(sp)
lw t7, 96(sp)
or.1 a3, a6, t7
lw t6, 45(sp)
li t7, 66794634
xor t2, t6, t7
li t7, 133643210
mul a6, t0, t7
add a6, t4, a6
li t7, -14558920
mul a3, a3, t7
lw t6, 156(sp)
lw t7, 231(sp)
and t3, t6, t7, 13
lw t6, 156(sp)
li t7, 66794634
or t0, t6, t7, -13
li t7, 131252341
mul t4, t1, t7
lw t6, 12(sp)
xor t0, t6, t0
lw t6, 117(sp)
add t1, t6, a3
lw t6, 27(sp)
lw t7, 129(sp)
and.T a3, t6, t7, -13
lw t6, 6(sp)
lw t7, 156(sp)
xor.1 t5, t6, t7
xor a4, a4, t2
lw t6, 195(sp)
lw t7, 156(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
li t7, 134456059
mul t2, t3, t7
lw t6, 99(sp)
add t3, t6, t4
lw t6, 69(sp)
lw t7, 21(sp)
or t4, t6, t7, -13
lw t6, 36(sp)
xor.T s0, t6, t5
add a7, a7, t3
lw t6, 72(sp)
add t5, t6, a7
and.T a4, s0, a4, -13
li t7, 147654327
mul a7, a4, t7
lw t6, 60(sp)
lw t7, 60(sp)
xor t3, t6, t7
lw t6, 180(sp)
or.T a4, t6, t4
add a5, a5, t5
add a5, t1, a5
lw t6, 9(sp)
li t7, -156102923
mul t6, t6, t7
sw t6, 60(sp)
lw t6, 282(sp)
li t7, 29691192
mul t6, t6, t7
sw t6, 12(sp)
li t7, 89796265
mul a4, a4, t7
lw t6, 156(sp)
lw t7, 54(sp)
and.1 t4, t6, t7, 13
add t1, t2, a7
lw t6, 189(sp)
and.1 a7, t6, t3, 13
add a6, a6, t1
lw t7, 78(sp)
or t0, t0, t7, -13
lw t6, 174(sp)
or.T t1, t6, a7
add t6, a5, a6
sw t6, 21(sp)
lw t6, 195(sp)
or.T a6, t6, t4
lw t6, 321(sp)
li t7, -66794634
and.1 a5, t6, t7, 13
lw t7, 132(sp)
or.1 a6, a6, t7
li t7, -112856030
mul a6, a6, t7
lw t6, 159(sp)
lw t7, 156(sp)
or.T a7, t6, t7
lw t6, 6(sp)
li t7, -21772840
mul t2, t6, t7
xor.1 t3, a3, a5
li t7, 90630794
mul t0, t0, t7
li t7, 116273925
mul a5, t1, t7
lw t6, 102(sp)
lw t7, 138(sp)
and a3, t6, t7, 13
lw t6, 108(sp)
lw t7, 54(sp)
or.T t1, t6, t7
lw t6, 150(sp)
lw t7, 138(sp)
and.T t4, t6, t7, -13
lw t6, 30(sp)
and.T t1, t6, t1, -13
li t7, 168978779
mul t3, t3, t7
lw t6, 63(sp)
li t7, 66794634
xor.T t5, t6, t7
lw t6, 39(sp)
xor.T t1, t6, t1
li t7, 66083086
mul t1, t1, t7
lw t7, 141(sp)
add t2, t2, t7
li t7, 124938158
mul t4, t4, t7
add t3, t3, t4
lw t6, 54(sp)
lw t7, 87(sp)
and s1, t6, t7, 13
lw t6, 321(sp)
lw t7, 195(sp)
xor.T s0, t6, t7
lw t7, 24(sp)
add t0, t0, t7
lw t6, 156(sp)
lw t7, 39(sp)
and.T t4, t6, t7, -13
or.1 a7, a7, t5
add t0, t0, a4
li t7, 69888029
mul a4, s1, t7
li t7, -155917444
mul a7, a7, t7
lw t6, 45(sp)
li t7, -182520012
mul t6, t6, t7
sw t6, 24(sp)
lw t7, 75(sp)
add a7, a7, t7
lw t6, 6(sp)
or s0, t6, s0, -13
add t5, t0, a6
lw t6, 105(sp)
lw t7, 282(sp)
and.T t0, t6, t7, -13
add a4, t2, a4
li t7, 125864321
mul t6, s0, t7
sw t6, 39(sp)
add t2, t1, t3
lw t6, 42(sp)
lw t7, 180(sp)
and t1, t6, t7, 13
lw t6, 0(sp)
li t7, 111665685
mul a6, t6, t7
lw t7, 60(sp)
add a7, a7, t7
lw t7, 108(sp)
and.T s0, t4, t7, -13
lw t6, 138(sp)
lw t7, 27(sp)
or t4, t6, t7, -13
add t2, a5, t2
lw t6, 114(sp)
lw t7, 171(sp)
and t3, t6, t7, 13
lw t6, 144(sp)
lw t7, 6(sp)
or a5, t6, t7, -13
lw t7, 231(sp)
and t3, t3, t7, 13
lw t6, 195(sp)
lw t7, 111(sp)
and s1, t6, t7, 13
lw t6, 171(sp)
and a3, t6, a3, 13
add t2, t5, t2
lw t6, 321(sp)
or t5, t6, s1, -13
li t7, -155632282
mul s0, s0, t7
li t7, -157265331
mul s1, t5, t7
lw t6, 357(sp)
lw t7, 180(sp)
or t5, t6, t7, -13
xor.1 t0, t0, t4
add t4, s0, s1
lw t7, 63(sp)
or.1 t1, t1, t7
lw t6, 87(sp)
or s0, t6, t1, -13
lw t6, 90(sp)
and.1 t1, t6, t5, 13
lw t6, 315(sp)
lw t7, 33(sp)
and.1 t6, t6, t7, 13
sw t6, 78(sp)
slli s0, s0, 7
li t7, 144729227
mul t3, t3, t7
lw t6, 3(sp)
lw t7, 36(sp)
or t5, t6, t7, -13
add a7, a7, s0
add a7, a7, a4
lw t6, 111(sp)
lw t7, 9(sp)
xor.T a4, t6, t7
add a7, t2, a7
lw t6, 21(sp)
add t2, t6, a7
add t4, a6, t4
lw t6, 144(sp)
lw t7, 45(sp)
and a7, t6, t7, 13
and.1 t5, t0, t5, 13
lw t6, 48(sp)
and.T a5, t6, a5, -13
lw t7, 195(sp)
or.1 a6, t1, t7
li t7, 109001163
mul a5, a5, t7
lw t6, 18(sp)
add t2, t6, t2
add t0, t4, t3
li t7, 139431260
mul t1, a3, t7
li t7, -3961620
mul a3, t5, t7
lw t6, 15(sp)
add t2, t6, t2
lw t6, 153(sp)
add t2, t6, t2
lw t6, 12(sp)
add a3, t6, a3
lw t7, 24(sp)
add t1, t1, t7
li t7, -24162388
mul a7, a7, t7
lw t7, 39(sp)
add t4, t2, t7
lw t6, 108(sp)
lw t7, 96(sp)
or t2, t6, t7, -13
lw t6, 159(sp)
lw t7, 75(sp)
xor.1 t3, t6, t7
lw t6, 93(sp)
add t4, t6, t4
add t0, t0, t1
lw t6, 315(sp)
li t7, -138584841
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 120(sp)
lw t7, 132(sp)
xor.1 t5, t6, t7
lw t6, 186(sp)
add t6, t6, t4
sw t6, 9(sp)
or t1, a4, t3, -13
lw t6, 102(sp)
or.1 t4, t6, t5
xor t3, a6, t2
lw t6, 114(sp)
li t7, -120788421
mul t2, t6, t7
add a4, t0, a5
li t7, -144673304
mul a6, t4, t7
lw t6, 180(sp)
li t7, -102622057
mul t0, t6, t7
li t7, 130507220
mul t4, t3, t7
lw t6, 315(sp)
li t7, -138584841
or.T t6, t6, t7
sw t6, 171(sp)
lw t6, 165(sp)
li t7, 66794634
and.1 a5, t6, t7, 13
lw t6, 102(sp)
lw t7, 30(sp)
and t3, t6, t7, 13
li t7, 167289633
add t4, t4, t7
add t2, a7, t2
li t7, 87135755
mul a7, t1, t7
li t7, -93426320
mul a5, a5, t7
lw t6, 315(sp)
lw t7, 33(sp)
or.T t6, t6, t7
sw t6, 138(sp)
add t1, t4, t2
lw t6, 138(sp)
lw t7, 315(sp)
or.1 t6, t6, t7
sw t6, 6(sp)
li t7, 45886006
mul t2, t3, t7
lw t6, 315(sp)
lw t7, 33(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
add a7, a7, t0
lw t6, 315(sp)
li t7, -138584841
or t6, t6, t7, -13
sw t6, 54(sp)
add a6, a7, a6
add a6, t1, a6
add a6, a6, t2
lw t6, 315(sp)
lw t7, 33(sp)
or.1 t6, t6, t7
sw t6, 102(sp)
add a3, a3, a6
lw t6, 33(sp)
li t7, -138584841
or.T t6, t6, t7
sw t6, 12(sp)
lw t6, 12(sp)
lw t7, 36(sp)
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 315(sp)
li t7, -138584841
xor.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 78(sp)
li t7, 5120483
mul t6, t6, t7
sw t6, 60(sp)
lw t6, 33(sp)
li t7, -138584841
xor.1 t6, t6, t7
sw t6, 96(sp)
lw t6, 315(sp)
li t7, -138584841
and.T t6, t6, t7, -13
sw t6, 189(sp)
add a3, a4, a3
lw t6, 54(sp)
li t7, -85138081
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 3(sp)
li t7, 69858065
mul t6, t6, t7
sw t6, 30(sp)
lw t6, 33(sp)
li t7, -138584841
xor t6, t6, t7
sw t6, 204(sp)
lw t6, 315(sp)
li t7, 185068310
mul t6, t6, t7
sw t6, 48(sp)
lw t6, 33(sp)
li t7, -138584841
and.1 t6, t6, t7, 13
sw t6, 87(sp)
add a3, a3, a5
lw t6, 33(sp)
li t7, -138584841
and.T t6, t6, t7, -13
sw t6, 141(sp)
lw t6, 9(sp)
add t6, t6, a3
sw t6, 132(sp)
lw t6, 132(sp)
lw t7, 132(sp)
xor t6, t6, t7
sw t6, 72(sp)
lw t6, 132(sp)
lw t7, 57(sp)
xor a3, t6, t7
lw t6, 315(sp)
lw t7, 33(sp)
xor t6, t6, t7
sw t6, 222(sp)
lw t6, 141(sp)
li t7, 148565294
mul t6, t6, t7
sw t6, 165(sp)
lw t6, 315(sp)
li t7, -138584841
xor.T t6, t6, t7
sw t6, 18(sp)
lw t6, 315(sp)
lw t7, 33(sp)
xor.T t6, t6, t7
sw t6, 24(sp)
lw t6, 33(sp)
li t7, -138584841
or t6, t6, t7, -13
sw t6, 9(sp)
lw t6, 33(sp)
lw t7, 315(sp)
and t6, t6, t7, 13
sw t6, 114(sp)
lw t6, 102(sp)
lw t7, 96(sp)
and.T t6, t6, t7, -13
sw t6, 120(sp)
lw t6, 114(sp)
lw t7, 315(sp)
or.T t6, t6, t7
sw t6, 201(sp)
lw t6, 3(sp)
lw t7, 9(sp)
xor.1 t6, t6, t7
sw t6, 69(sp)
lw t6, 87(sp)
lw t7, 204(sp)
or.T t6, t6, t7
sw t6, 27(sp)
lw t6, 327(sp)
lw t7, 33(sp)
or t6, t6, t7, -13
sw t6, 186(sp)
lw t6, 102(sp)
lw t7, 222(sp)
and t6, t6, t7, 13
sw t6, 75(sp)
lw t6, 315(sp)
lw t7, 36(sp)
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 234(sp)
xor a3, t6, a3
li t7, -7707049
xor t6, a3, t7
sw t6, 174(sp)
lw t7, 315(sp)
or.1 t6, a3, t7
sw t6, 45(sp)
lw t6, 315(sp)
xor t6, t6, a3
sw t6, 93(sp)
li t7, -138584841
or.T a4, a3, t7
lw t7, 78(sp)
and.1 a5, a4, t7, 13
lw t6, 33(sp)
xor.T t6, t6, a3
sw t6, 111(sp)
xor t6, a3, a3
sw t6, 195(sp)
li t7, -138584841
and t6, a3, t7, 13
sw t6, 129(sp)
lw t6, 45(sp)
li t7, 34324218
mul a7, t6, t7
li t7, -138584841
or.1 t6, a3, t7
sw t6, 135(sp)
lw t6, 33(sp)
and.1 t6, t6, a3, 13
sw t6, 21(sp)
lw t7, 45(sp)
and.1 t4, a4, t7, 13
lw t6, 111(sp)
lw t7, 93(sp)
or.T t3, t6, t7
lw t6, 315(sp)
and.1 t6, t6, a3, 13
sw t6, 192(sp)
lw t6, 111(sp)
lw t7, 171(sp)
and t0, t6, t7, 13
lw t7, 315(sp)
or t6, a3, t7, -13
sw t6, 159(sp)
lw t7, 33(sp)
xor t6, a3, t7
sw t6, 219(sp)
lw t6, 33(sp)
lw t7, 111(sp)
and t2, t6, t7, 13
lw t6, 12(sp)
lw t7, 129(sp)
or.T a6, t6, t7
lw t6, 45(sp)
lw t7, 36(sp)
and t1, t6, t7, 13
lw t6, 6(sp)
xor.T t4, t6, t4
lw t6, 315(sp)
and t6, t6, a3, 13
sw t6, 216(sp)
lw t6, 33(sp)
or t6, t6, a3, -13
sw t6, 117(sp)
lw t6, 81(sp)
lw t7, 192(sp)
and.T t6, t6, t7, -13
sw t6, 144(sp)
li t7, -138584841
and.T t6, a3, t7, -13
sw t6, 180(sp)
lw t7, 135(sp)
xor.T s0, t3, t7
li t7, -138584841
xor.T t6, a3, t7
sw t6, 183(sp)
lw t6, 219(sp)
lw t7, 21(sp)
and.T t5, t6, t7, -13
lw t6, 219(sp)
or t3, t6, t4, -13
li t7, 186988677
mul t4, t3, t7
lw t6, 216(sp)
lw t7, 129(sp)
or t3, t6, t7, -13
li t7, -16203856
mul s0, s0, t7
lw t7, 15(sp)
add s0, s0, t7
add s1, t4, a7
and.T t4, t2, a5, -13
lw t7, 135(sp)
xor.T t2, t5, t7
lw t6, 33(sp)
lw t7, 180(sp)
and a5, t6, t7, 13
lw t6, 315(sp)
xor.T t6, t6, a3
sw t6, 108(sp)
xor.T a7, t1, t0
add t6, s1, s0
sw t6, 39(sp)
lw t6, 327(sp)
or.T t1, t6, t3
lw t7, 0(sp)
and.T t0, a5, t7, -13
li t7, 185290187
mul a5, t1, t7
li t7, -138584841
and.1 t6, a3, t7, 13
sw t6, 90(sp)
xor.T t4, t0, t4
lw t6, 159(sp)
lw t7, 171(sp)
and t5, t6, t7, 13
lw t6, 102(sp)
xor.1 t0, t6, t2
li t7, 25489164
mul t1, a6, t7
lw t6, 189(sp)
lw t7, 183(sp)
and.1 t6, t6, t7, 13
sw t6, 123(sp)
lw t6, 117(sp)
lw t7, 78(sp)
and t3, t6, t7, 13
li t7, -138584841
xor.1 t6, a3, t7
sw t6, 15(sp)
li t7, -4239333
mul t6, t5, t7
sw t6, 6(sp)
lw t7, 90(sp)
xor.T s0, a3, t7
lw t6, 183(sp)
lw t7, 33(sp)
and t2, t6, t7, 13
or.1 t0, a7, t0
lw t6, 18(sp)
lw t7, 33(sp)
xor.T a6, t6, t7
lw t6, 21(sp)
lw t7, 315(sp)
and.1 t6, t6, t7, 13
sw t6, 42(sp)
li t7, -120511282
mul a7, t4, t7
lw t6, 333(sp)
lw t7, 108(sp)
and.1 t5, t6, t7, 13
lw t7, 33(sp)
and t6, a3, t7, 13
sw t6, 105(sp)
lw t6, 15(sp)
lw t7, 93(sp)
xor.T t4, t6, t7
lw t6, 78(sp)
lw t7, 105(sp)
and.T s1, t6, t7, -13
lw t6, 183(sp)
xor.1 s1, t6, s1
lw t6, 315(sp)
lw t7, 180(sp)
and.1 s2, t6, t7, 13
li t7, 174485332
mul t6, a3, t7
sw t6, 99(sp)
li t7, -138584841
xor.1 t5, t5, t7
li t7, 4472381
mul t6, s0, t7
sw t6, 0(sp)
li t7, -138584841
xor t6, a3, t7
sw t6, 150(sp)
li t7, -138584841
or s0, s2, t7, -13
lw t6, 33(sp)
or.T t6, t6, a3
sw t6, 210(sp)
lw t6, 144(sp)
xor s0, t6, s0
lw t6, 150(sp)
li t7, -52325500
mul s2, t6, t7
lw t7, 210(sp)
xor.1 s4, a4, t7
lw t6, 90(sp)
lw t7, 120(sp)
xor.1 s3, t6, t7
li t7, -62101148
mul s5, t0, t7
lw t6, 105(sp)
lw t7, 96(sp)
and s6, t6, t7, 13
li t7, 127689442
mul t0, s1, t7
xor.1 s1, t3, s4
li t7, -169043137
mul t3, s6, t7
add t1, t1, s5
lw t7, 81(sp)
xor.T s3, s3, t7
add a5, a5, t1
lw t6, 39(sp)
add t6, t6, a5
sw t6, 39(sp)
lw t6, 93(sp)
or.1 a5, t6, t2
lw t7, 60(sp)
add t6, s2, t7
sw t6, 60(sp)
xor.1 t2, t4, s1
lw t6, 189(sp)
lw t7, 27(sp)
or.1 t1, t6, t7
lw t6, 45(sp)
xor.T s2, t6, a3
lw t7, 201(sp)
xor.1 s1, t2, t7
li t7, -152400500
mul t2, a5, t7
li t7, -171247299
mul a5, t5, t7
lw t6, 123(sp)
lw t7, 204(sp)
xor.T t5, t6, t7
li t7, -169074700
mul t6, s3, t7
sw t6, 153(sp)
lw t6, 219(sp)
lw t7, 90(sp)
or t6, t6, t7, -13
sw t6, 120(sp)
lw t7, 33(sp)
xor.T a6, a6, t7
li t7, 113814506
mul t4, s0, t7
add a7, t3, a7
lw t7, 315(sp)
xor.1 t6, a3, t7
sw t6, 162(sp)
li t7, -8110754
mul t6, s2, t7
sw t6, 123(sp)
lw t6, 222(sp)
and t5, t6, t5, 13
lw t6, 162(sp)
lw t7, 171(sp)
and.1 s2, t6, t7, 13
lw t6, 30(sp)
add a7, t6, a7
li t7, -10151618
mul t3, s1, t7
lw t7, 33(sp)
and.T t6, a4, t7, -13
sw t6, 147(sp)
lw t7, 105(sp)
or t5, t5, t7, -13
li t7, -163244630
mul s1, t5, t7
lw t7, 189(sp)
xor.1 t5, t1, t7
lw t6, 0(sp)
add s0, t6, t2
li t7, 105604483
mul t1, s2, t7
lw t7, 117(sp)
or.T a4, a4, t7
lw t6, 6(sp)
add t2, t6, t4
add t4, a5, s1
add t0, t2, t0
li t7, -687148
mul t2, a6, t7
lw t6, 90(sp)
lw t7, 78(sp)
xor.T a5, t6, t7
lw t6, 129(sp)
lw t7, 114(sp)
and.1 a6, t6, t7, 13
add t3, t3, s0
lw t6, 315(sp)
or.T t6, t6, a3
sw t6, 30(sp)
add t4, t4, t3
lw t6, 315(sp)
lw t7, 129(sp)
xor t3, t6, t7
add a7, a7, t0
li t7, 190627757
mul t0, t5, t7
lw t6, 315(sp)
li t7, -138584841
or.1 t6, t6, t7
sw t6, 177(sp)
lw t7, 165(sp)
add t5, t4, t7
add t1, t1, t2
li t7, -138584841
or t6, a3, t7, -13
sw t6, 27(sp)
lw t6, 105(sp)
lw t7, 54(sp)
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 27(sp)
lw t7, 90(sp)
xor.T t2, t6, t7
lw t6, 327(sp)
or.T t4, t6, a6
lw t6, 39(sp)
add a7, t6, a7
lw t6, 69(sp)
xor.T a6, t6, a5
lw t7, 24(sp)
xor.1 a5, t2, t7
lw t6, 42(sp)
lw t7, 27(sp)
xor t2, t6, t7
slli s0, a6, 8
li t7, 144358554
mul t2, t2, t7
lw t7, 54(sp)
and.1 a6, a4, t7, 13
lw t6, 33(sp)
lw t7, 315(sp)
xor.1 t6, t6, t7
sw t6, 0(sp)
lw t6, 315(sp)
lw t7, 75(sp)
xor.1 a4, t6, t7
lw t6, 216(sp)
li t7, 164846495
mul t6, t6, t7
sw t6, 144(sp)
lw t6, 120(sp)
or.1 s3, t6, t3
lw t6, 0(sp)
lw t7, 216(sp)
or.T t3, t6, t7
lw t7, 153(sp)
add s2, t5, t7
lw t7, 33(sp)
or.1 s1, a3, t7
lw t7, 33(sp)
and.T t6, a3, t7, -13
sw t6, 153(sp)
add s5, s0, t0
li t7, 133518418
mul t5, s3, t7
lw t6, 153(sp)
li t7, -138584841
xor.T s3, t6, t7
li t7, -138584841
and t0, s1, t7, 13
li t7, 14976260
mul s0, t4, t7
lw t6, 60(sp)
add t4, t6, s2
lw t6, 48(sp)
add s4, t6, t1
lw t6, 96(sp)
lw t7, 153(sp)
xor.1 s6, t6, t7
lw t7, 99(sp)
add t6, s5, t7
sw t6, 60(sp)
lw t6, 81(sp)
or.T t1, t6, s1
lw t6, 177(sp)
lw t7, 15(sp)
and s1, t6, t7, 13
lw t6, 15(sp)
lw t7, 33(sp)
or.1 s2, t6, t7
xor.T s5, s3, s6
add s3, a7, t4
lw t6, 45(sp)
lw t7, 105(sp)
and.1 t4, t6, t7, 13
add s4, s4, t2
lw t7, 186(sp)
or a7, t3, t7, -13
li t7, 28111194
mul t3, a7, t7
li t7, -880360
mul a5, a5, t7
lw t6, 147(sp)
li t7, -61928624
mul a7, t6, t7
li t7, 6628524
mul t2, a6, t7
add a6, t5, s0
li t7, -157854715
mul t5, s5, t7
add s0, a5, a6
lw t7, 315(sp)
and.T t6, a3, t7, -13
sw t6, 75(sp)
lw t6, 63(sp)
li t7, -109365446
mul t6, t6, t7
sw t6, 48(sp)
add t6, s3, s4
sw t6, 69(sp)
li t7, -16990936
mul t6, s2, t7
sw t6, 63(sp)
lw t6, 171(sp)
lw t7, 216(sp)
and a6, t6, t7, 13
lw t6, 315(sp)
li t7, 79258280
mul t6, t6, t7
sw t6, 99(sp)
and.1 a5, a3, s1, 13
li t7, -48449305
mul t6, a4, t7
sw t6, 42(sp)
lw t6, 114(sp)
lw t7, 87(sp)
or.1 s1, t6, t7
li t7, 165502780
mul a4, a5, t7
lw t6, 96(sp)
lw t7, 111(sp)
or.1 a5, t6, t7
li t7, 109756836
mul s1, s1, t7
lw t6, 96(sp)
li t7, 138584841
and.T t6, t6, t7, -13
sw t6, 165(sp)
or.1 t0, t4, t0
lw t6, 33(sp)
li t7, -138584841
and t6, t6, t7, 13
sw t6, 24(sp)
lw t6, 33(sp)
li t7, -138584841
or.1 t6, t6, t7
sw t6, 198(sp)
lw t6, 114(sp)
xor.T t1, t6, t1
lw t6, 111(sp)
lw t7, 105(sp)
and.T t4, t6, t7, -13
lw t7, 177(sp)
xor.1 t1, t1, t7
lw t6, 114(sp)
lw t7, 27(sp)
or s2, t6, t7, -13
add t3, t3, s0
add a4, a4, t5
lw t6, 6(sp)
li t7, -172965480
mul t6, t6, t7
sw t6, 147(sp)
add t6, s1, a4
sw t6, 39(sp)
lw t6, 153(sp)
lw t7, 333(sp)
or.T t6, t6, t7
sw t6, 186(sp)
lw t6, 33(sp)
lw t7, 315(sp)
or a4, t6, t7, -13
add t6, t3, t2
sw t6, 6(sp)
li t7, -115280082
mul t2, t0, t7
li t7, -174498966
mul t0, s2, t7
lw t6, 90(sp)
li t7, 59457481
mul t6, t6, t7
sw t6, 90(sp)
add t5, t2, a7
lw t6, 96(sp)
lw t7, 315(sp)
xor.1 a7, t6, t7
lw t7, 45(sp)
xor.T t2, a4, t7
lw t6, 30(sp)
xor.1 t3, t6, t4
lw t6, 3(sp)
lw t7, 21(sp)
or t4, t6, t7, -13
lw t7, 45(sp)
xor.T s0, t1, t7
lw t6, 210(sp)
ori t1, t6, 0
lw t7, 198(sp)
xor t3, t3, t7
lw t6, 138(sp)
or s1, t6, s0, -13
li t7, -110392469
mul t3, t3, t7
li t7, 18396965
mul t6, a6, t7
sw t6, 120(sp)
lw t6, 81(sp)
lw t7, 102(sp)
or.1 s0, t6, t7
slli a6, s1, 4
add a6, t5, a6
lw t7, 48(sp)
add a6, a6, t7
lw t6, 30(sp)
lw t7, 141(sp)
or.T t5, t6, t7
lw t6, 114(sp)
lw t7, 315(sp)
or.1 s2, t6, t7
or.1 a5, t4, a5
lw t6, 231(sp)
and t4, t6, s0, 13
lw t7, 81(sp)
or.1 s1, t2, t7
lw t7, 231(sp)
or s0, s2, t7, -13
li t7, -85822936
mul t6, a5, t7
sw t6, 45(sp)
lw t6, 165(sp)
xor t2, t6, t1
lw t6, 315(sp)
li t7, -138584841
and.1 a5, t6, t7, 13
lw t7, 42(sp)
add t3, t3, t7
lw t6, 93(sp)
lw t7, 0(sp)
or.1 t1, t6, t7
and.T a7, a7, a5, -13
li t7, -111265967
mul t6, t5, t7
sw t6, 3(sp)
li t7, -75143143
mul t5, s1, t7
lw t7, 105(sp)
or.1 t6, a7, t7
sw t6, 42(sp)
or.T a7, t4, s0
add t5, t0, t5
lw t6, 33(sp)
lw t7, 24(sp)
or.1 t4, t6, t7
lw t6, 63(sp)
add s0, t6, t3
lw t6, 0(sp)
xor.T t3, t6, a3
li t7, -89808752
mul t6, t1, t7
sw t6, 63(sp)
lw t6, 186(sp)
lw t7, 210(sp)
or.T s1, t6, t7
lw t6, 111(sp)
lw t7, 189(sp)
and.1 t1, t6, t7, 13
lw t6, 96(sp)
li t7, 127532882
mul t0, t6, t7
and.1 s1, t2, s1, 13
lw t6, 147(sp)
add t6, t6, t5
sw t6, 48(sp)
add a6, a6, s0
lw t6, 12(sp)
lw t7, 111(sp)
and t2, t6, t7, 13
and t5, a7, s1, 13
lw t6, 33(sp)
lw t7, 27(sp)
and.T a7, t6, t7, -13
lw t6, 192(sp)
lw t7, 18(sp)
xor.T s0, t6, t7
or.T a4, t4, a4
lw t7, 18(sp)
or.1 s0, s0, t7
lw t6, 198(sp)
xor a4, t6, a4
lw t6, 39(sp)
add a6, t6, a6
li t7, 120157290
mul a4, a4, t7
lw t7, 138(sp)
xor.1 s1, t3, t7
lw t6, 9(sp)
li t7, -97845070
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 24(sp)
xor.1 t3, t6, a3
lw t6, 33(sp)
lw t7, 54(sp)
and t4, t6, t7, 13
li t7, 166487656
mul t3, t3, t7
lw t6, 6(sp)
add t6, t6, a6
sw t6, 18(sp)
lw t6, 195(sp)
lw t7, 30(sp)
xor a6, t6, t7
lw t7, 90(sp)
add t6, a4, t7
sw t6, 6(sp)
lw t6, 129(sp)
xor s3, t6, a6
lw t7, 96(sp)
or.T s2, a5, t7
and.1 t4, t4, t1, 13
lw t6, 21(sp)
li t7, 182661107
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 135(sp)
lw t7, 12(sp)
xor.1 a6, t6, t7
lw t6, 33(sp)
li t7, -138584841
xor.T a4, t6, t7
li t7, 146998658
mul t1, t5, t7
li t7, 69344672
mul s3, s3, t7
lw t6, 135(sp)
lw t7, 150(sp)
xor.1 a5, t6, t7
lw t6, 105(sp)
and.T t5, t6, a4, -13
or s0, s0, s1, -13
lw t6, 327(sp)
or s1, t6, s2, -13
lw t6, 141(sp)
li t7, 146617169
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 120(sp)
add s2, t6, t1
add t1, s3, t0
or.T t0, t2, s1
lw t6, 42(sp)
and s1, t6, t0, 13
lw t7, 99(sp)
add t0, s2, t7
lw t6, 108(sp)
lw t7, 96(sp)
xor.T t2, t6, t7
lw t6, 144(sp)
add t0, t6, t0
li t7, -104787517
mul t5, t5, t7
li t7, -43499641
mul s2, s0, t7
slli s0, a7, 6
li t7, -168688895
mul a7, s1, t7
add s1, a7, s2
lw t6, 78(sp)
or.1 a7, t6, a5
lw t6, 3(sp)
add a5, t6, s1
add s1, a5, t3
lw t6, 33(sp)
xor.1 a5, t6, a3
lw t7, 45(sp)
add t3, t0, t7
lw t6, 63(sp)
add t0, t6, s1
lw t6, 216(sp)
lw t7, 180(sp)
xor s1, t6, t7
li t7, 143031261
mul t2, t2, t7
li t7, -192393875
mul s4, t4, t7
li t7, -164628819
mul t6, s1, t7
sw t6, 9(sp)
li t7, -66119192
mul a7, a7, t7
lw t6, 36(sp)
lw t7, 222(sp)
and.1 t4, t6, t7, 13
lw t6, 48(sp)
add s1, t6, t3
lw t6, 189(sp)
li t7, -151464373
mul t3, t6, t7
lw t6, 153(sp)
lw t7, 33(sp)
xor s3, t6, t7
lw t6, 18(sp)
add s1, t6, s1
lw t6, 60(sp)
add s1, t6, s1
lw t6, 222(sp)
or a6, t6, a6, -13
li t7, 17664079
mul s2, a6, t7
lw t6, 114(sp)
lw t7, 81(sp)
or.1 a6, t6, t7
lw t7, 138(sp)
or.T a6, a6, t7
li t7, -141397322
mul a6, a6, t7
add s0, s0, t5
add t1, t1, s4
lw t6, 204(sp)
lw t7, 135(sp)
xor.1 t5, t6, t7
lw t7, 21(sp)
add s5, a6, t7
lw t7, 39(sp)
add s4, t1, t7
lw t6, 198(sp)
lw t7, 75(sp)
and t1, t6, t7, 13
lw t6, 210(sp)
li t7, 23073273
mul a6, t6, t7
lw t6, 15(sp)
or a4, t6, a4, -13
lw t6, 66(sp)
or.1 s6, t6, t5
li t7, -72414825
mul t5, s3, t7
lw t7, 0(sp)
add t3, t3, t7
lw t6, 36(sp)
and.1 s3, t6, a5, 13
lw t6, 177(sp)
li t7, -68204851
mul t6, t6, t7
sw t6, 12(sp)
li t7, 186986290
mul s3, s3, t7
or.1 t4, s6, t4
lw t6, 123(sp)
add s6, t6, s1
add s1, s2, t2
lw t6, 69(sp)
add t6, t6, s6
sw t6, 3(sp)
add s2, t0, s5
lw t6, 192(sp)
lw t7, 36(sp)
xor.T t2, t6, t7
add t0, s4, s3
add t0, t0, s0
lw t7, 315(sp)
or s0, t2, t7, -13
lw t6, 33(sp)
li t7, -2381915
mul t2, t6, t7
lw t7, 222(sp)
or.1 a5, a5, t7
lw t6, 6(sp)
add s2, t6, s2
add s1, a7, s1
li t7, -66393171
mul t4, t4, t7
li t7, -108256510
mul s0, s0, t7
lw t6, 315(sp)
li t7, -138584841
xor a7, t6, t7
lw t7, 198(sp)
and.1 s4, a7, t7, 13
lw t6, 129(sp)
li t7, -138584841
or.T s3, t6, t7
add a7, s2, t0
add t0, s1, t5
lw t6, 9(sp)
add t6, t6, t4
sw t6, 6(sp)
li t7, 43721410
mul t4, s4, t7
add t3, t3, s0
lw t6, 222(sp)
or.1 t1, t6, t1
or t5, a5, s3, -13
lw t7, 108(sp)
xor.1 a5, a3, t7
lw t7, 159(sp)
and.T s0, a5, t7, -13
add a5, a6, t3
li t7, -9712592
mul t3, s0, t7
li t7, 21452835
mul a4, a4, t7
lw t6, 135(sp)
lw t7, 195(sp)
or s0, t6, t7, -13
lw t6, 30(sp)
li t7, -172002919
mul a6, t6, t7
add t2, t2, a6
add t4, t4, a4
li t7, -136361370
mul a6, t5, t7
lw t6, 36(sp)
lw t7, 192(sp)
and.T a4, t6, t7, -13
lw t6, 33(sp)
xor.T s1, t6, s0
lw t6, 162(sp)
lw t7, 117(sp)
or.T s2, t6, t7
lw t6, 315(sp)
li t7, -20976950
mul s0, t6, t7
lw t6, 93(sp)
lw t7, 327(sp)
xor.1 t5, t6, t7
li t7, 21795300
mul s3, s1, t7
lw t7, 201(sp)
xor.1 s1, s2, t7
add s2, s3, t3
lw t6, 153(sp)
lw t7, 102(sp)
and t3, t6, t7, 13
add s2, s2, t2
lw t6, 198(sp)
lw t7, 183(sp)
xor t2, t6, t7
add t6, a7, t0
sw t6, 0(sp)
li t7, -76730014
mul s1, s1, t7
add t0, t4, s2
slli a7, t1, 4
add t6, s0, s1
sw t6, 9(sp)
lw t6, 174(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 246(sp)
lw t6, 33(sp)
lw t7, 87(sp)
xor.1 t1, t6, t7
li t7, -138584841
xor.T t4, t5, t7
lw t7, 87(sp)
xor t1, t1, t7
li t7, -130378731
mul t4, t4, t7
add a7, a7, t4
add t4, a5, a6
lw t7, 117(sp)
xor.1 a6, a3, t7
and.T a5, t1, t3, -13
li t7, -190794555
mul a5, a5, t7
add t0, t4, t0
lw t6, 12(sp)
add t0, t6, t0
lw t6, 168(sp)
lw t7, 342(sp)
and.1 t4, t6, t7, 13
lw t7, 333(sp)
or a4, a4, t7, -13
lw t7, 219(sp)
and t1, t2, t7, 13
lw t6, 27(sp)
lw t7, 189(sp)
or.1 t3, t6, t7
lw t6, 342(sp)
li t7, 64911430
xor.T t6, t6, t7
sw t6, 141(sp)
lw t7, 84(sp)
or t4, t4, t7, -13
li t7, -74061204
mul t2, a4, t7
lw t6, 6(sp)
add t0, t6, t0
lw t6, 315(sp)
or a6, t6, a6, -13
lw t6, 231(sp)
and a4, t6, t4, 13
xor t1, t3, t1
li t7, 65789329
mul t3, a6, t7
add a6, t0, a7
li t7, 29765391
mul a7, t1, t7
add t0, t3, t2
lw t6, 342(sp)
li t7, -86311344
mul t6, t6, t7
sw t6, 6(sp)
add t0, a5, t0
lw t6, 171(sp)
li t7, -49987456
mul a5, t6, t7
lw t6, 84(sp)
lw t7, 141(sp)
and t2, t6, t7, 13
lw t6, 342(sp)
li t7, 64911430
and.T t6, t6, t7, -13
sw t6, 48(sp)
add t1, a7, a5
li t7, -2450187
mul a7, t2, t7
lw t6, 342(sp)
lw t7, 84(sp)
or.T t6, t6, t7
sw t6, 24(sp)
lw t6, 231(sp)
li t7, 64911430
or.T a5, t6, t7
lw t6, 84(sp)
li t7, 64911430
xor.T t6, t6, t7
sw t6, 78(sp)
lw t6, 84(sp)
lw t7, 168(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
add t0, t0, t1
lw t6, 342(sp)
li t7, 64911430
or.T t6, t6, t7
sw t6, 99(sp)
lw t6, 84(sp)
li t7, 64911430
and t6, t6, t7, 13
sw t6, 111(sp)
lw t6, 342(sp)
lw t7, 84(sp)
xor t6, t6, t7
sw t6, 105(sp)
lw t6, 342(sp)
lw t7, 84(sp)
and.T t6, t6, t7, -13
sw t6, 135(sp)
li t7, 75693569
mul a4, a4, t7
lw t6, 9(sp)
add t0, t6, t0
add a6, a6, t0
lw t6, 0(sp)
add a6, t6, a6
lw t6, 84(sp)
lw t7, 342(sp)
and.1 t6, t6, t7, 13
sw t6, 177(sp)
add t6, a4, a7
sw t6, 12(sp)
lw t6, 342(sp)
li t7, 64911430
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 3(sp)
add t6, t6, a6
sw t6, 75(sp)
lw t6, 174(sp)
lw t7, 75(sp)
xor.T t6, t6, t7
sw t6, 192(sp)
lw t6, 111(sp)
li t7, -34827870
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 75(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 159(sp)
lw t6, 84(sp)
li t7, 64911430
and.T t6, t6, t7, -13
sw t6, 147(sp)
lw t6, 342(sp)
li t7, 64911430
or.1 t6, t6, t7
sw t6, 27(sp)
lw t6, 75(sp)
lw t7, 174(sp)
and.1 a4, t6, t7, 13
lw t6, 342(sp)
xor.1 t6, t6, a4
sw t6, 9(sp)
lw t6, 84(sp)
or t6, t6, a4, -13
sw t6, 201(sp)
lw t7, 342(sp)
xor t6, a4, t7
sw t6, 108(sp)
lw t7, 342(sp)
xor.T t6, a4, t7
sw t6, 138(sp)
lw t7, 84(sp)
xor t6, a4, t7
sw t6, 129(sp)
li t7, 64911430
or t6, a4, t7, -13
sw t6, 114(sp)
lw t7, 84(sp)
and t6, a4, t7, 13
sw t6, 117(sp)
lw t6, 117(sp)
lw t7, 78(sp)
and.T a6, t6, t7, -13
li t7, -89882724
mul t6, a6, t7
sw t6, 0(sp)
lw t7, 84(sp)
or.T t6, a4, t7
sw t6, 87(sp)
lw t6, 84(sp)
xor.T t6, t6, a4
sw t6, 33(sp)
lw t6, 87(sp)
lw t7, 48(sp)
or a6, t6, t7, -13
lw t7, 342(sp)
and t6, a4, t7, 13
sw t6, 39(sp)
li t7, 64911430
or.T t6, a4, t7
sw t6, 81(sp)
li t7, 64911430
and t6, a4, t7, 13
sw t6, 144(sp)
lw t6, 108(sp)
lw t7, 144(sp)
xor.T a7, t6, t7
lw t6, 84(sp)
or.1 t1, t6, a7
li t7, 64911430
xor.1 t6, a4, t7
sw t6, 15(sp)
lw t6, 231(sp)
lw t7, 117(sp)
or t2, t6, t7, -13
lw t7, 108(sp)
and a7, a4, t7, 13
lw t6, 18(sp)
lw t7, 81(sp)
and.1 t0, t6, t7, 13
lw t6, 24(sp)
lw t7, 15(sp)
xor.1 t6, t6, t7
sw t6, 36(sp)
lw t6, 81(sp)
li t7, -182517578
mul t6, t6, t7
sw t6, 30(sp)
li t7, 29873876
mul t4, t2, t7
lw t6, 147(sp)
lw t7, 129(sp)
xor.1 t3, t6, t7
lw t6, 87(sp)
li t7, 64911430
xor t5, t6, t7
lw t6, 87(sp)
li t7, 176235562
mul t6, t6, t7
sw t6, 42(sp)
li t7, 64911430
or.1 t6, a4, t7
sw t6, 69(sp)
lw t6, 108(sp)
lw t7, 129(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 144(sp)
xor t2, t6, a4
and.1 t5, a5, t5, 13
li t7, 82949700
mul s0, t5, t7
lw t6, 342(sp)
or t0, t6, t0, -13
or t5, a5, t0, -13
add t6, t4, s0
sw t6, 21(sp)
lw t6, 135(sp)
li t7, -64911430
and.T a5, t6, t7, -13
lw t7, 138(sp)
and t4, t3, t7, 13
lw t6, 15(sp)
li t7, 159594747
mul t0, t6, t7
lw t6, 81(sp)
and.1 t3, t6, a7, 13
lw t6, 3(sp)
add a7, t6, t0
li t7, 114022510
mul t0, t3, t7
lw t6, 39(sp)
lw t7, 69(sp)
xor.T s0, t6, t7
lw t7, 180(sp)
xor.1 t3, t2, t7
li t7, 60550473
mul t2, t5, t7
lw t7, 84(sp)
xor.1 t6, a4, t7
sw t6, 93(sp)
and.T t4, t4, s0, -13
and.T a6, a6, t1, -13
lw t7, 84(sp)
and.1 t6, a4, t7, 13
sw t6, 3(sp)
lw t7, 342(sp)
or.1 t6, a4, t7
sw t6, 120(sp)
lw t6, 342(sp)
li t7, 64911430
xor t6, t6, t7
sw t6, 183(sp)
li t7, 83342136
mul a6, a6, t7
li t7, -80774778
mul t6, a5, t7
sw t6, 66(sp)
lw t6, 84(sp)
lw t7, 342(sp)
or t6, t6, t7, -13
sw t6, 63(sp)
lw t6, 63(sp)
lw t7, 27(sp)
or.T t5, t6, t7
lw t6, 0(sp)
add a5, t6, a6
xor t6, a4, a4
sw t6, 27(sp)
lw t6, 12(sp)
add a6, t6, a5
lw t6, 84(sp)
lw t7, 93(sp)
and t1, t6, t7, 13
lw t6, 84(sp)
lw t7, 342(sp)
xor.1 t6, t6, t7
sw t6, 171(sp)
li t7, 185550889
mul t4, t4, t7
li t7, 64911430
and.T a5, a4, t7, -13
lw t7, 135(sp)
and.T s0, t3, t7, -13
lw t6, 6(sp)
add t4, t6, t4
lw t7, 36(sp)
and t5, t5, t7, 13
lw t6, 342(sp)
lw t7, 84(sp)
and t6, t6, t7, 13
sw t6, 186(sp)
lw t6, 87(sp)
or.1 t3, t6, a4
lw t6, 129(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 54(sp)
li t7, -141578929
mul s0, s0, t7
add t6, t2, s0
sw t6, 12(sp)
lw t7, 30(sp)
add t2, t4, t7
li t7, -106685970
mul t4, t5, t7
add t6, t4, t0
sw t6, 162(sp)
add a7, a7, t2
lw t6, 171(sp)
li t7, -138755355
mul t6, t6, t7
sw t6, 60(sp)
lw t6, 84(sp)
or.1 t6, t6, a4
sw t6, 123(sp)
lw t6, 21(sp)
add t4, t6, a7
lw t6, 120(sp)
lw t7, 123(sp)
or.1 t0, t6, t7
lw t6, 3(sp)
or t2, t6, t1, -13
lw t6, 342(sp)
lw t7, 24(sp)
xor.1 t1, t6, t7
lw t6, 201(sp)
lw t7, 183(sp)
and.T t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 186(sp)
lw t7, 3(sp)
xor.T t5, t6, t7
lw t6, 84(sp)
li t7, 64911430
or.T t6, t6, t7
sw t6, 153(sp)
lw t6, 84(sp)
and.1 a7, t6, t3, 13
lw t6, 27(sp)
li t7, 64911430
xor.1 s0, t6, t7
add t6, a6, t4
sw t6, 21(sp)
lw t6, 24(sp)
lw t7, 27(sp)
xor t3, t6, t7
lw t7, 117(sp)
and.1 t1, t1, t7, 13
xor.T t4, t5, s0
lw t6, 120(sp)
li t7, 64911430
xor a6, t6, t7
lw t7, 84(sp)
or a6, a6, t7, -13
lw t6, 84(sp)
li t7, 64911430
or t6, t6, t7, -13
sw t6, 102(sp)
lw t6, 48(sp)
li t7, -71167557
mul t6, t6, t7
sw t6, 36(sp)
lw t6, 144(sp)
or.T t3, t6, t3
lw t6, 342(sp)
and.T t3, t6, t3, -13
lw t6, 105(sp)
xor.T t4, t6, t4
and.1 t2, t2, t4, 13
lw t7, 99(sp)
and.1 s0, a5, t7, 13
li t7, 156038814
mul t0, t0, t7
li t7, 87347432
mul t2, t2, t7
lw t6, 342(sp)
lw t7, 84(sp)
xor.T t6, t6, t7
sw t6, 6(sp)
lw t6, 342(sp)
or.T t6, t6, a4
sw t6, 150(sp)
lw t6, 66(sp)
add t2, t6, t2
lw t6, 63(sp)
li t7, -74622758
mul t6, t6, t7
sw t6, 90(sp)
add t5, t0, t2
lw t6, 171(sp)
lw t7, 153(sp)
and t4, t6, t7, 13
li t7, -30969468
mul t1, t1, t7
lw t6, 123(sp)
lw t7, 141(sp)
and.T t2, t6, t7, -13
lw t7, 18(sp)
xor.T t0, s0, t7
li t7, 169590383
mul t6, t3, t7
sw t6, 165(sp)
lw t6, 102(sp)
li t7, 14401848
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 342(sp)
and.1 t6, t6, a4, 13
sw t6, 30(sp)
lw t6, 342(sp)
lw t7, 84(sp)
or.1 t6, t6, t7
sw t6, 96(sp)
lw t7, 96(sp)
and t3, a4, t7, 13
lw t6, 96(sp)
or.T a7, t6, a7
lw t6, 60(sp)
add t1, t6, t1
lw t7, 54(sp)
and s0, t3, t7, 13
li t7, -18526150
mul t6, a7, t7
sw t6, 54(sp)
lw t6, 42(sp)
add t3, t6, t5
lw t6, 102(sp)
or.T a7, t6, a5
and a5, t4, s0, 13
lw t6, 48(sp)
lw t7, 6(sp)
or.T t6, t6, t7
sw t6, 18(sp)
xor.T a6, a6, a5
li t7, 64911430
and.1 t6, a4, t7, 13
sw t6, 198(sp)
lw t6, 81(sp)
lw t7, 45(sp)
or t4, t6, t7, -13
lw t6, 12(sp)
add a5, t6, t3
lw t6, 84(sp)
li t7, 64911430
or.1 t6, t6, t7
sw t6, 60(sp)
lw t7, 147(sp)
xor t2, t2, t7
li t7, 87765442
mul t5, a6, t7
lw t6, 342(sp)
and.T t6, t6, a4, -13
sw t6, 66(sp)
li t7, 80701022
mul a7, a7, t7
lw t6, 102(sp)
lw t7, 69(sp)
or.1 t3, t6, t7
lw t7, 33(sp)
and.1 a6, t2, t7, 13
lw t6, 198(sp)
li t7, -64911430
or.T s0, t6, t7
li t7, 161832021
mul t2, a6, t7
or.1 a6, t0, s0
lw t6, 147(sp)
lw t7, 150(sp)
xor s0, t6, t7
lw t7, 177(sp)
xor.1 t0, a6, t7
lw t6, 60(sp)
lw t7, 342(sp)
xor a6, t6, t7
add s1, a5, t1
lw t6, 84(sp)
lw t7, 9(sp)
xor t1, t6, t7
lw t6, 84(sp)
li t7, 64911430
xor.1 a5, t6, t7
lw t6, 162(sp)
add t6, t6, s1
sw t6, 81(sp)
li t7, 186495577
mul s1, t0, t7
li t7, 51380532
mul t0, t4, t7
lw t6, 30(sp)
lw t7, 144(sp)
xor.T t6, t6, t7
sw t6, 162(sp)
lw t6, 342(sp)
li t7, 64911430
and.1 t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 66(sp)
lw t7, 3(sp)
and.T t4, t6, t7, -13
add t5, s1, t5
lw t6, 90(sp)
add t5, t6, t5
li t7, 64911430
and s1, a5, t7, 13
li t7, 174977361
mul t6, t1, t7
sw t6, 12(sp)
and t1, t3, s0, 13
li t7, 185671269
mul t1, t1, t7
lw t6, 63(sp)
li t7, 64911430
xor.T t3, t6, t7
lw t6, 165(sp)
add t5, t6, t5
lw t6, 129(sp)
lw t7, 114(sp)
or s0, t6, t7, -13
add t2, a7, t2
lw t7, 342(sp)
and a7, a5, t7, 13
lw t7, 93(sp)
or.1 s3, t3, t7
lw t7, 54(sp)
add s2, t1, t7
lw t6, 60(sp)
or.T t1, t6, s0
lw t6, 147(sp)
lw t7, 30(sp)
and.1 s0, t6, t7, 13
lw t6, 342(sp)
li t7, 64911430
and t3, t6, t7, 13
lw t6, 138(sp)
lw t7, 60(sp)
xor.1 t6, t6, t7
sw t6, 54(sp)
li t7, 42326475
mul s1, s1, t7
lw t7, 111(sp)
and.T s3, s3, t7, -13
li t7, -8471109
mul t4, t4, t7
lw t7, 183(sp)
or.T a7, a7, t7
li t7, 139132890
mul s3, s3, t7
lw t7, 177(sp)
xor.T s4, t3, t7
add t4, s1, t4
add t2, t2, s2
li t7, 64911430
xor t6, a4, t7
sw t6, 63(sp)
or.1 s2, t3, a4
lw t6, 69(sp)
xor.1 s1, t6, s4
lw t6, 18(sp)
xor.T s4, t6, a6
add t6, t5, t2
sw t6, 189(sp)
lw t6, 120(sp)
lw t7, 48(sp)
xor t5, t6, t7
lw t6, 84(sp)
li t7, 64911430
and.1 a6, t6, t7, 13
lw t6, 342(sp)
li t7, 64911430
or t6, t6, t7, -13
sw t6, 165(sp)
add t2, t0, s3
lw t6, 108(sp)
lw t7, 186(sp)
or t0, t6, t7, -13
li t7, 68684396
mul s5, s4, t7
lw t7, 15(sp)
xor.1 s4, s0, t7
lw t7, 66(sp)
xor.1 s0, t0, t7
lw t6, 39(sp)
xor.T t0, t6, t3
or.T s3, s2, t5
lw t7, 36(sp)
add t5, s5, t7
lw t6, 84(sp)
and.T t6, t6, a4, -13
sw t6, 90(sp)
lw t6, 48(sp)
or.T s4, t6, s4
lw t7, 63(sp)
xor.T s2, a5, t7
lw t6, 84(sp)
lw t7, 147(sp)
xor.T s5, t6, t7
lw t6, 117(sp)
li t7, -107299997
mul t3, t6, t7
li t7, 64911430
xor.1 s5, s5, t7
lw t7, 69(sp)
and.1 s1, s1, t7, 13
and t1, t1, s1, 13
li t7, -117950131
mul t1, t1, t7
or s5, s3, s5, -13
add t1, t4, t1
lw t6, 147(sp)
lw t7, 42(sp)
xor s1, t6, t7
li t7, 79412524
mul s3, s4, t7
li t7, 133603174
mul t4, s0, t7
li t7, -102699501
mul t6, s5, t7
sw t6, 42(sp)
li t7, -149304699
mul t6, s2, t7
sw t6, 45(sp)
lw t6, 165(sp)
lw t7, 117(sp)
or s0, t6, t7, -13
li t7, -43434629
mul s2, s0, t7
li t7, 55818223
mul t6, a7, t7
sw t6, 204(sp)
lw t6, 162(sp)
lw t7, 153(sp)
and.T a7, t6, t7, -13
add t5, s3, t5
lw t7, 12(sp)
add s0, t5, t7
add t6, t4, s2
sw t6, 162(sp)
li t7, 186548984
mul t4, a7, t7
lw t7, 186(sp)
or.1 t5, s1, t7
lw t6, 84(sp)
lw t7, 147(sp)
and a7, t6, t7, 13
lw t6, 231(sp)
and a7, t6, a7, 13
add s0, t2, s0
lw t6, 135(sp)
lw t7, 342(sp)
xor.T t6, t6, t7
sw t6, 18(sp)
li t7, 152971015
mul t2, a6, t7
lw t6, 189(sp)
add s0, t6, s0
slli t6, a6, 6
sw t6, 108(sp)
lw t6, 81(sp)
add a6, t6, s0
lw t6, 171(sp)
and.1 t5, t6, t5, 13
lw t6, 117(sp)
lw t7, 15(sp)
or t6, t6, t7, -13
sw t6, 189(sp)
li t7, 126254787
mul t6, t0, t7
sw t6, 81(sp)
lw t6, 129(sp)
li t7, -102851516
mul t6, t6, t7
sw t6, 12(sp)
li t7, 95761388
mul t5, t5, t7
add t4, t4, t3
lw t6, 15(sp)
lw t7, 78(sp)
or t0, t6, t7, -13
add t1, a6, t1
lw t6, 63(sp)
li t7, 64911430
or.T a6, t6, t7
li t7, -87353415
mul a7, a7, t7
lw t6, 21(sp)
add t6, t6, t1
sw t6, 36(sp)
lw t7, 0(sp)
add t3, t2, t7
lw t6, 90(sp)
lw t7, 39(sp)
and.1 t2, t6, t7, 13
lw t6, 129(sp)
li t7, 64911430
and.1 t6, t6, t7, 13
sw t6, 90(sp)
lw t7, 42(sp)
add t1, t4, t7
lw t7, 162(sp)
add t1, t1, t7
lw t6, 204(sp)
lw t7, 81(sp)
add t4, t6, t7
add t4, t5, t4
lw t6, 54(sp)
or t5, t6, a5, -13
lw t7, 45(sp)
add t4, t4, t7
add t6, t1, t4
sw t6, 21(sp)
lw t6, 342(sp)
li t7, -121106977
mul t4, t6, t7
li t7, -110391082
mul a6, a6, t7
lw t6, 108(sp)
add t1, t6, a6
lw t6, 84(sp)
lw t7, 33(sp)
or.1 s0, t6, t7
lw t6, 150(sp)
li t7, -27354920
mul a6, t6, t7
li t7, 64911430
and.T t2, t2, t7, -13
li t7, 150552196
mul t2, t2, t7
lw t6, 144(sp)
and.1 t6, t6, a5, 13
sw t6, 42(sp)
lw t6, 18(sp)
and.1 a5, t6, t5, 13
li t7, -92034913
mul t5, a5, t7
add a7, a7, t3
lw t6, 189(sp)
lw t7, 138(sp)
xor.1 a5, t6, t7
add t3, t5, t4
lw t6, 231(sp)
lw t7, 9(sp)
or t5, t6, t7, -13
and.1 t4, t0, s0, 13
lw t6, 84(sp)
li t7, 64911430
xor t0, t6, t7
and a5, a5, t4, 13
lw t7, 30(sp)
or.T s0, a4, t7
lw t7, 12(sp)
add t3, t3, t7
lw t6, 102(sp)
lw t7, 33(sp)
and t4, t6, t7, 13
lw t7, 60(sp)
or.1 t4, t4, t7
lw t7, 144(sp)
and.T t5, t5, t7, -13
or.T t0, s0, t0
li t7, -29696013
mul t5, t5, t7
li t7, 43603538
mul t0, t0, t7
add t5, t5, t0
lw t6, 15(sp)
lw t7, 69(sp)
xor t0, t6, t7
lw t6, 117(sp)
lw t7, 123(sp)
xor.1 s0, t6, t7
li t7, 150096591
mul t6, s0, t7
sw t6, 0(sp)
add s0, t1, t3
li t7, 23379635
mul s1, a5, t7
lw t6, 168(sp)
li t7, 64911430
xor t1, t6, t7
add a5, t2, t5
lw t7, 66(sp)
and.1 t3, a4, t7, 13
or t5, t4, a4, -13
lw t6, 48(sp)
lw t7, 198(sp)
or.T t2, t6, t7
add a6, a6, s1
add a6, s0, a6
lw t6, 177(sp)
lw t7, 201(sp)
xor t6, t6, t7
sw t6, 18(sp)
lw t6, 120(sp)
lw t7, 3(sp)
xor.1 t4, t6, t7
lw t6, 78(sp)
li t7, 177151920
mul s1, t6, t7
add a7, a7, a6
lw t6, 177(sp)
lw t7, 150(sp)
xor.T a6, t6, t7
li t7, -97602916
mul t5, t5, t7
lw t6, 147(sp)
lw t7, 141(sp)
or s2, t6, t7, -13
add t6, a7, t5
sw t6, 12(sp)
lw t7, 180(sp)
and.T a7, t1, t7, -13
lw t6, 117(sp)
li t7, 164324428
mul t1, t6, t7
li t7, 84436395
mul s3, a7, t7
lw t6, 93(sp)
lw t7, 60(sp)
xor.T a7, t6, t7
li t7, 131335218
mul t5, t2, t7
lw t6, 30(sp)
li t7, 153908746
mul s0, t6, t7
lw t6, 39(sp)
lw t7, 141(sp)
or.T t2, t6, t7
lw t6, 84(sp)
lw t7, 141(sp)
or s4, t6, t7, -13
add s1, s1, s3
lw t6, 51(sp)
li t7, 172983901
mul s5, t6, t7
li t7, 120174866
mul t6, t3, t7
sw t6, 3(sp)
or.T t3, t4, t0
lw t6, 165(sp)
li t7, 98333393
mul t0, t6, t7
lw t6, 69(sp)
lw t7, 93(sp)
or.T s3, t6, t7
lw t6, 123(sp)
and.T t4, t6, s2, -13
add t0, t0, s5
lw t6, 96(sp)
lw t7, 84(sp)
xor.T s2, t6, t7
lw t6, 15(sp)
xor s4, t6, s4
lw t6, 90(sp)
or.1 t3, t6, t3
slli t3, t3, 2
lw t7, 135(sp)
xor t6, a4, t7
sw t6, 15(sp)
li t7, -191866206
mul s5, t4, t7
lw t6, 0(sp)
add t3, t6, t3
add t4, a5, t3
li t7, -134905200
mul t3, s4, t7
li t7, 193072847
mul s3, s3, t7
add a5, s1, s5
add a5, a5, t5
add t5, s0, s3
lw t6, 153(sp)
li t7, 8546348
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 198(sp)
and.1 s0, t6, s2, 13
add t1, a5, t1
lw t6, 78(sp)
lw t7, 42(sp)
and a5, t6, t7, 13
or.1 s0, s0, a6
or.T a7, t2, a7
lw t6, 84(sp)
lw t7, 177(sp)
xor t6, t6, t7
sw t6, 0(sp)
lw t6, 342(sp)
or a6, t6, a4, -13
lw t6, 93(sp)
li t7, 64911430
or.T t2, t6, t7
li t7, -112328142
mul s1, s0, t7
li t7, 16483872
mul s2, a5, t7
li t7, 36095579
mul a5, t2, t7
li t7, 13348016
mul t2, a6, t7
lw t6, 24(sp)
li t7, 11597296
mul s0, t6, t7
add t1, t1, s2
add s2, t1, t0
add t0, t5, s1
lw t6, 0(sp)
lw t7, 171(sp)
or t5, t6, t7, -13
lw t6, 18(sp)
and.1 t1, t6, a7, 13
add a7, t4, s2
lw t6, 87(sp)
li t7, 64911430
xor.T t4, t6, t7
lw t6, 342(sp)
slli s2, t6, 4
lw t6, 123(sp)
lw t7, 78(sp)
or.T s1, t6, t7
add t3, t0, t3
lw t6, 153(sp)
lw t7, 39(sp)
and.T t0, t6, t7, -13
li t7, -63573533
mul s6, t1, t7
lw t6, 69(sp)
lw t7, 105(sp)
xor.1 t1, t6, t7
lw t6, 69(sp)
or s5, t6, a6, -13
lw t6, 3(sp)
add s3, t6, t3
lw t6, 183(sp)
lw t7, 6(sp)
or s4, t6, t7, -13
add s6, s6, t2
add t3, s0, s2
lw t6, 63(sp)
lw t7, 201(sp)
xor.1 a6, t6, t7
lw t7, 15(sp)
xor s2, s5, t7
lw t6, 48(sp)
lw t7, 30(sp)
or t2, t6, t7, -13
add s3, s3, s6
lw t6, 147(sp)
lw t7, 69(sp)
or s5, t6, t7, -13
lw t6, 342(sp)
or.1 s1, t6, s1
li t7, 64911430
and s4, s4, t7, 13
lw t7, 84(sp)
or.T s0, t4, t7
or s4, s4, t5, -13
lw t6, 114(sp)
lw t7, 186(sp)
or.1 t5, t6, t7
and.T t4, s1, s5, -13
lw t6, 156(sp)
or.T t6, t6, a3
sw t6, 150(sp)
lw t6, 33(sp)
li t7, -8322582
mul s1, t6, t7
li t7, 132892729
mul s5, t4, t7
li t7, 181467256
mul t4, s2, t7
add a5, a5, t3
add t3, s3, a5
li t7, -51572425
mul a5, s4, t7
add a7, a7, t3
lw t6, 12(sp)
add t3, t6, a7
add s2, a5, s5
lw t6, 111(sp)
lw t7, 99(sp)
and.1 s3, t6, t7, 13
li t7, -59901734
mul a5, s0, t7
li t7, 155066556
mul s4, t0, t7
lw t6, 60(sp)
lw t7, 84(sp)
xor.T t0, t6, t7
xor.1 t5, t5, t1
lw t6, 9(sp)
add a7, t6, s1
lw t6, 63(sp)
lw t7, 342(sp)
xor t1, t6, t7
lw t6, 27(sp)
and.1 s0, t6, t0, 13
li t7, -117188059
mul t0, t1, t7
xor.1 t1, t2, s3
add t2, t4, s4
li t7, 80113911
mul t1, t1, t7
add t4, s2, t2
and.1 a6, a4, a6, 13
lw t7, 156(sp)
and.T t6, a3, t7, -13
sw t6, 111(sp)
lw t6, 156(sp)
xor t6, t6, a3
sw t6, 219(sp)
lw t7, 105(sp)
and t5, t5, t7, 13
li t7, 66733700
mul t2, s0, t7
lw t6, 30(sp)
lw t7, 117(sp)
or.T s0, t6, t7
add a4, t3, t4
lw t6, 21(sp)
add a4, t6, a4
slli t5, t5, 3
lw t6, 0(sp)
li t7, 125181433
mul t3, t6, t7
li t7, -165817258
mul t4, s0, t7
add a5, t4, a5
lw t6, 186(sp)
lw t7, 63(sp)
xor.T t4, t6, t7
add t1, t1, a5
add a5, a7, t2
add t2, t5, a5
lw t7, 156(sp)
xor.T t6, a3, t7
sw t6, 189(sp)
add a7, t0, t3
lw t6, 192(sp)
li t7, -62625766
xor a5, t6, t7
lw t7, 156(sp)
or.1 t6, a3, t7
sw t6, 63(sp)
xor.1 t0, a6, t4
lw t7, 156(sp)
and.1 t6, a3, t7, 13
sw t6, 87(sp)
add a6, t2, t1
lw t6, 231(sp)
lw t7, 39(sp)
and t1, t6, t7, 13
li t7, -116531720
mul t6, a3, t7
sw t6, 90(sp)
lw t6, 156(sp)
xor.1 t6, t6, a3
sw t6, 147(sp)
lw t6, 63(sp)
li t7, 176569933
mul t6, t6, t7
sw t6, 168(sp)
lw t6, 156(sp)
and t6, t6, a3, 13
sw t6, 180(sp)
lw t6, 156(sp)
li t7, -153677786
mul t6, t6, t7
sw t6, 129(sp)
lw t7, 27(sp)
xor.1 t1, t1, t7
xor t0, t1, t0
li t7, 77190003
mul t0, t0, t7
add a7, a7, t0
lw t6, 156(sp)
li t7, -64129621
mul t6, t6, t7
sw t6, 114(sp)
add a6, a6, a7
lw t6, 87(sp)
lw t7, 87(sp)
xor t6, t6, t7
sw t6, 12(sp)
lw t6, 63(sp)
li t7, -165986187
mul t6, t6, t7
sw t6, 30(sp)
lw t6, 213(sp)
li t7, -167767257
or t6, t6, t7, -13
sw t6, 21(sp)
add a4, a4, a6
lw t6, 36(sp)
add t6, t6, a4
sw t6, 93(sp)
lw t6, 93(sp)
lw t7, 174(sp)
or.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 174(sp)
lw t7, 93(sp)
xor t6, t6, t7
sw t6, 177(sp)
lw t6, 75(sp)
lw t7, 93(sp)
xor a4, t6, t7
lw t6, 174(sp)
lw t7, 93(sp)
and.1 t6, t6, t7, 13
sw t6, 60(sp)
lw t6, 93(sp)
lw t7, 174(sp)
and t6, t6, t7, 13
sw t6, 144(sp)
lw t6, 93(sp)
lw t7, 174(sp)
xor.1 t6, t6, t7
sw t6, 255(sp)
xor t6, a3, a4
sw t6, 45(sp)
lw t6, 93(sp)
lw t7, 174(sp)
xor.T t6, t6, t7
sw t6, 165(sp)
lw t6, 45(sp)
lw t7, 111(sp)
xor a7, t6, t7
or.T t6, a3, a4
sw t6, 102(sp)
lw t6, 156(sp)
xor.T t6, t6, a4
sw t6, 3(sp)
lw t6, 174(sp)
lw t7, 93(sp)
or t6, t6, t7, -13
sw t6, 183(sp)
lw t7, 93(sp)
or a5, a5, t7, -13
lw t6, 174(sp)
lw t7, 93(sp)
and.T t6, t6, t7, -13
sw t6, 249(sp)
lw t6, 93(sp)
lw t7, 174(sp)
or.T t6, t6, t7
sw t6, 210(sp)
xor t6, a5, a4
sw t6, 15(sp)
lw t6, 93(sp)
lw t7, 93(sp)
xor t6, t6, t7
sw t6, 9(sp)
lw t6, 3(sp)
lw t7, 102(sp)
or a6, t6, t7, -13
lw t7, 156(sp)
or.T t6, a5, t7
sw t6, 84(sp)
lw t6, 111(sp)
lw t7, 15(sp)
and.1 t4, t6, t7, 13
xor.T t6, a3, a4
sw t6, 225(sp)
and.1 t6, a4, a5, 13
sw t6, 123(sp)
xor.T t6, a3, a5
sw t6, 69(sp)
lw t7, 156(sp)
and.1 t6, a4, t7, 13
sw t6, 66(sp)
lw t6, 84(sp)
lw t7, 111(sp)
xor t2, t6, t7
or t3, a4, a5, -13
and.T t6, a3, a4, -13
sw t6, 192(sp)
lw t7, 156(sp)
xor.1 t6, a5, t7
sw t6, 33(sp)
lw t6, 156(sp)
lw t7, 33(sp)
and.T t5, t6, t7, -13
xor.1 t6, a4, a3
sw t6, 216(sp)
lw t6, 189(sp)
or.T t0, t6, t3
lw t7, 192(sp)
or t1, a4, t7, -13
lw t7, 156(sp)
xor t6, a5, t7
sw t6, 24(sp)
lw t6, 156(sp)
xor.T t6, t6, a5
sw t6, 6(sp)
xor.1 t6, a5, a4
sw t6, 42(sp)
or.1 t6, a4, a5
sw t6, 171(sp)
lw t7, 42(sp)
xor.T t4, t4, t7
lw t6, 156(sp)
xor.1 t6, t6, a4
sw t6, 108(sp)
slli t4, t4, 1
and a7, t5, a7, 13
lw t6, 195(sp)
lw t7, 123(sp)
xor.T t5, t6, t7
lw t7, 156(sp)
and.1 s0, a7, t7, 13
and.1 t5, t5, a4, 13
lw t7, 156(sp)
xor.1 a7, t3, t7
li t7, -111747054
mul t3, s0, t7
lw t7, 156(sp)
or.1 s0, a5, t7
lw t6, 33(sp)
and.1 t6, t6, a4, 13
sw t6, 18(sp)
or.T t2, t2, a7
lw t6, 3(sp)
xor.T a7, t6, a5
lw t6, 45(sp)
lw t7, 171(sp)
or s1, t6, t7, -13
li t7, -91855468
mul t6, s1, t7
sw t6, 27(sp)
lw t6, 225(sp)
xor.T s1, t6, s0
or.T s0, t5, s0
xor t5, a6, s1
li t7, -148715645
mul a6, t2, t7
and.T t6, a4, a5, -13
sw t6, 117(sp)
add t6, a6, t4
sw t6, 81(sp)
lw t6, 66(sp)
xor a6, t6, t1
li t7, 22788055
mul t1, a6, t7
lw t6, 63(sp)
lw t7, 45(sp)
or.T a6, t6, t7
lw t6, 117(sp)
lw t7, 150(sp)
and.1 t2, t6, t7, 13
lw t6, 216(sp)
li t7, 55211025
mul t6, t6, t7
sw t6, 36(sp)
lw t7, 171(sp)
or t4, a4, t7, -13
and.T t0, t0, s0, -13
li t7, -24763359
mul t0, t0, t7
add t1, t1, t0
lw t7, 117(sp)
xor t0, a3, t7
or t0, t0, a3, -13
add t1, t3, t1
li t7, -155615276
mul a6, a6, t7
li t7, 108489763
mul t3, t5, t7
lw t7, 69(sp)
and.1 t4, t4, t7, 13
and t6, a5, a4, 13
sw t6, 198(sp)
li t7, 23112020
mul t6, t4, t7
sw t6, 120(sp)
or.T t6, a3, a5
sw t6, 0(sp)
lw t6, 156(sp)
lw t7, 108(sp)
and.1 t4, t6, t7, 13
and.1 t6, a5, a3, 13
sw t6, 51(sp)
or.1 t6, a3, a4
sw t6, 186(sp)
or t6, a3, a4, -13
sw t6, 48(sp)
lw t6, 156(sp)
lw t7, 51(sp)
or.T s0, t6, t7
and t6, a5, a3, 13
sw t6, 138(sp)
lw t6, 156(sp)
or.1 t6, t6, a4
sw t6, 237(sp)
lw t6, 156(sp)
and t6, t6, a5, 13
sw t6, 195(sp)
lw t7, 66(sp)
xor s1, a4, t7
lw t6, 111(sp)
lw t7, 6(sp)
or t5, t6, t7, -13
xor.T t4, t4, a7
lw t6, 24(sp)
lw t7, 138(sp)
and.1 a7, t6, t7, 13
li t7, 20167624
mul t0, t0, t7
xor.T t6, a4, a5
sw t6, 96(sp)
li t7, -57260665
mul a7, a7, t7
add s2, t3, t0
lw t6, 96(sp)
or.1 t0, t6, t2
lw t6, 18(sp)
or.T t2, t6, s0
lw t7, 156(sp)
and.T t6, a4, t7, -13
sw t6, 135(sp)
li t7, -156574745
mul t3, s1, t7
lw t7, 156(sp)
or t6, a5, t7, -13
sw t6, 39(sp)
li t7, 81406823
mul t0, t0, t7
lw t7, 156(sp)
and t6, a4, t7, 13
sw t6, 54(sp)
lw t6, 27(sp)
add t0, t6, t0
li t7, -104027777
mul s0, t5, t7
lw t6, 117(sp)
lw t7, 186(sp)
and.1 s3, t6, t7, 13
add t6, t1, s2
sw t6, 27(sp)
lw t6, 63(sp)
and t1, t6, t4, 13
lw t6, 48(sp)
lw t7, 219(sp)
xor.T s1, t6, t7
lw t6, 87(sp)
lw t7, 135(sp)
or.T t4, t6, t7
and.T s5, a5, a3, -13
lw t6, 150(sp)
lw t7, 39(sp)
or.1 t5, t6, t7
add s6, s0, a6
li t7, 133479096
mul s2, s3, t7
add a6, t3, a7
lw t6, 135(sp)
xor s4, t6, s5
lw t6, 45(sp)
lw t7, 69(sp)
or.1 s0, t6, t7
lw t6, 195(sp)
lw t7, 135(sp)
and a7, t6, t7, 13
lw t6, 36(sp)
add s3, t6, s6
lw t6, 63(sp)
lw t7, 237(sp)
or t3, t6, t7, -13
xor a7, a7, s5
xor s5, s5, a7
lw t6, 156(sp)
or.T t6, t6, a4
sw t6, 99(sp)
lw t6, 66(sp)
or a7, t6, a5, -13
lw t6, 192(sp)
xor.1 t6, t6, a3
sw t6, 204(sp)
or.1 t3, t3, a5
li t7, 71133039
mul s6, s1, t7
li t7, -4178748
mul s1, s5, t7
li t7, -55577569
mul t2, t2, t7
li t7, 12847095
mul t6, s4, t7
sw t6, 18(sp)
or t4, t4, t5, -13
add t5, t2, s2
lw t7, 90(sp)
add t6, s6, t7
sw t6, 201(sp)
lw t6, 0(sp)
lw t7, 42(sp)
or t2, t6, t7, -13
add t5, s3, t5
li t7, -94060088
mul t6, s0, t7
sw t6, 105(sp)
li t7, 921929
mul t1, t1, t7
add s0, t1, t0
xor t6, a4, a4
sw t6, 222(sp)
add t0, a6, s1
lw t6, 39(sp)
lw t7, 237(sp)
xor a6, t6, t7
add t5, t5, t0
lw t7, 192(sp)
xor.T t0, t4, t7
li t7, -170034938
mul t6, t0, t7
sw t6, 36(sp)
lw t7, 156(sp)
and.1 a6, a6, t7, 13
lw t6, 54(sp)
lw t7, 108(sp)
xor.1 t6, t6, t7
sw t6, 162(sp)
lw t6, 51(sp)
lw t7, 84(sp)
xor.T t0, t6, t7
li t7, 191797508
mul t6, a4, t7
sw t6, 63(sp)
lw t7, 171(sp)
or.T t1, a5, t7
xor.T t2, t2, t3
li t7, -77231804
mul t4, t2, t7
lw t6, 156(sp)
and.1 t6, t6, a5, 13
sw t6, 51(sp)
lw t6, 120(sp)
add s2, t6, s0
lw t6, 15(sp)
lw t7, 66(sp)
and s4, t6, t7, 13
lw t6, 33(sp)
lw t7, 87(sp)
xor.T s0, t6, t7
or a6, a6, a3, -13
lw t6, 180(sp)
lw t7, 147(sp)
and.T t3, t6, t7, -13
lw t6, 150(sp)
xor.1 s1, t6, a5
lw t6, 3(sp)
li t7, -163295918
mul t2, t6, t7
lw t6, 54(sp)
lw t7, 135(sp)
or.1 s3, t6, t7
li t7, 161240862
mul t6, a7, t7
sw t6, 120(sp)
li t7, -91467594
mul t6, s4, t7
sw t6, 228(sp)
lw t6, 27(sp)
add a7, t6, s2
lw t6, 192(sp)
li t7, 41991871
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 99(sp)
lw t7, 198(sp)
and.1 s4, t6, t7, 13
add a7, a7, t5
lw t6, 99(sp)
lw t7, 156(sp)
or t6, t6, t7, -13
sw t6, 153(sp)
and t6, a4, a3, 13
sw t6, 141(sp)
lw t6, 81(sp)
add t6, t6, a7
sw t6, 90(sp)
lw t6, 150(sp)
lw t7, 96(sp)
or.1 a7, t6, t7
lw t6, 204(sp)
or.T s2, t6, a4
li t7, -17477975
mul t3, t3, t7
and t5, t0, s3, 13
li t7, -65258569
mul t0, s1, t7
li t7, 156195709
mul s1, s4, t7
lw t7, 18(sp)
add t4, t4, t7
lw t6, 147(sp)
xor.T s0, t6, s0
xor t6, a5, a3
sw t6, 81(sp)
li t7, -85435438
mul t5, t5, t7
lw t7, 105(sp)
add s4, t4, t7
lw t7, 162(sp)
and s3, s0, t7, 13
lw t6, 198(sp)
lw t7, 141(sp)
and t4, t6, t7, 13
and s0, a4, t1, 13
and.1 t6, a3, a4, 13
sw t6, 204(sp)
li t7, 116628505
mul t1, s2, t7
lw t6, 201(sp)
add t6, t6, s4
sw t6, 18(sp)
lw t6, 6(sp)
lw t7, 81(sp)
or.T s2, t6, t7
add t1, t2, t1
lw t6, 195(sp)
lw t7, 0(sp)
or.T t2, t6, t7
or.T s2, a7, s2
lw t6, 129(sp)
add a7, t6, s1
li t7, -64180676
mul s1, s3, t7
lw t6, 162(sp)
lw t7, 45(sp)
and.1 s3, t6, t7, 13
li t7, 22616668
mul a6, a6, t7
li t7, 94206775
mul t6, s3, t7
sw t6, 45(sp)
lw t6, 63(sp)
add a6, t6, a6
lw t6, 204(sp)
lw t7, 6(sp)
xor.T s3, t6, t7
lw t6, 168(sp)
add s1, t6, s1
add a6, a6, t3
lw t6, 36(sp)
add t3, t6, a6
lw t6, 96(sp)
lw t7, 150(sp)
xor.T s4, t6, t7
lw t6, 6(sp)
lw t7, 189(sp)
and a6, t6, t7, 13
add s1, s1, t5
xor t5, a5, a5
li t7, -149106691
mul s0, s0, t7
lw t7, 27(sp)
add s5, s0, t7
xor s0, s2, s3
or.1 t6, a3, a5
sw t6, 129(sp)
and.1 t4, t4, s4, 13
add s3, t0, s5
lw t6, 81(sp)
lw t7, 156(sp)
or.1 t0, t6, t7
li t7, 87540165
mul s2, s0, t7
add s4, s3, t1
li t7, 119997348
mul t4, t4, t7
lw t6, 225(sp)
li t7, -163339957
mul s0, t6, t7
lw t7, 153(sp)
xor.1 t1, a5, t7
and a6, t2, a6, 13
li t7, 100903434
mul t2, a6, t7
lw t7, 66(sp)
or.1 s3, a3, t7
lw t6, 120(sp)
add s5, t6, s4
or a6, a5, a3, -13
lw t6, 114(sp)
add s4, t6, t4
li t7, 66695407
mul t4, a6, t7
lw t7, 228(sp)
add t3, t3, t7
add s4, t2, s4
lw t6, 51(sp)
lw t7, 192(sp)
xor.T t2, t6, t7
add s1, s5, s1
add t6, s1, s2
sw t6, 105(sp)
add a7, t3, a7
lw t6, 129(sp)
xor.T t3, t6, s3
lw t6, 18(sp)
add t6, t6, a7
sw t6, 114(sp)
lw t6, 108(sp)
and.1 t5, t6, t5, 13
lw t6, 138(sp)
li t7, 179998965
mul t6, t6, t7
sw t6, 27(sp)
lw t7, 30(sp)
add s1, s4, t7
xor.1 t6, a3, a5
sw t6, 168(sp)
lw t7, 33(sp)
xor a7, a4, t7
lw t6, 162(sp)
li t7, 74366078
mul t6, t6, t7
sw t6, 30(sp)
li t7, 179524733
mul s2, t2, t7
li t7, 117632411
mul t2, t5, t7
add s1, s1, s2
or t5, a4, a6, -13
add s0, s1, s0
add t2, s0, t2
lw t6, 69(sp)
lw t7, 42(sp)
or.1 s0, t6, t7
lw t6, 24(sp)
lw t7, 84(sp)
xor s1, t6, t7
lw t7, 81(sp)
or.T s3, s1, t7
or.1 t5, t5, t0
lw t6, 54(sp)
and t0, t6, a6, 13
li t7, 136375381
mul s2, t5, t7
li t7, -43940897
mul s1, t1, t7
lw t6, 48(sp)
lw t7, 117(sp)
and.T t5, t6, t7, -13
li t7, -26006804
mul t1, s3, t7
add t1, t1, t4
lw t6, 99(sp)
xor.T t6, t6, a6
sw t6, 63(sp)
lw t6, 186(sp)
li t7, -33808140
mul t6, t6, t7
sw t6, 18(sp)
add t6, s2, t1
sw t6, 42(sp)
xor.1 t4, s0, t0
lw t6, 66(sp)
lw t7, 141(sp)
and t0, t6, t7, 13
lw t6, 168(sp)
or s2, t6, a3, -13
lw t6, 3(sp)
li t7, 133797508
mul t1, t6, t7
li t7, 156861848
mul t3, t3, t7
add s0, s1, t3
or.T t6, a4, a5
sw t6, 36(sp)
lw t7, 219(sp)
and t3, t4, t7, 13
lw t6, 162(sp)
and t6, t6, a3, 13
sw t6, 153(sp)
and.T t4, a6, s2, -13
lw t6, 138(sp)
lw t7, 81(sp)
and.T s2, t6, t7, -13
li t7, 113805215
mul s1, t3, t7
lw t7, 96(sp)
and.1 t4, t4, t7, 13
and t5, s2, t5, 13
lw t6, 48(sp)
lw t7, 6(sp)
or.T t3, t6, t7
lw t7, 138(sp)
xor.1 s2, a5, t7
lw t6, 45(sp)
add s3, t6, s0
lw t6, 192(sp)
or a7, t6, a7, -13
lw t6, 168(sp)
and.1 s0, t6, a3, 13
li t7, -5374784
mul a7, a7, t7
add s3, t2, s3
xor s2, t5, s2
lw t6, 30(sp)
add a3, t6, s1
lw t6, 36(sp)
lw t7, 189(sp)
or s1, t6, t7, -13
lw t6, 222(sp)
lw t7, 126(sp)
or t5, t6, t7, -13
lw t7, 171(sp)
or.T t6, a4, t7
sw t6, 120(sp)
lw t6, 147(sp)
lw t7, 99(sp)
and t2, t6, t7, 13
or.T s0, a6, s0
lw t6, 105(sp)
add s4, t6, s3
xor.T s3, t4, s0
li t7, 129453633
mul s5, s2, t7
lw t6, 12(sp)
lw t7, 180(sp)
xor.1 t4, t6, t7
lw t6, 33(sp)
xor.1 s0, t6, s1
li t7, 138396570
mul s2, s0, t7
li t7, 87185800
mul s0, t4, t7
lw t6, 114(sp)
add t6, t6, s4
sw t6, 114(sp)
lw t6, 54(sp)
li t7, -99301436
mul t4, t6, t7
add s1, t1, s5
li t7, -111794514
mul t1, s3, t7
and s3, t0, t3, 13
lw t6, 24(sp)
lw t7, 237(sp)
and.1 t0, t6, t7, 13
lw t6, 186(sp)
li t7, -149927025
mul t6, t6, t7
sw t6, 69(sp)
add t3, a3, s2
lw t6, 24(sp)
xor.1 a3, t6, t5
li t7, 72817420
mul s2, s3, t7
lw t6, 135(sp)
li t7, -35652827
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 96(sp)
and t5, t6, a6, 13
add s3, s0, t1
lw t6, 63(sp)
lw t7, 225(sp)
or.T s0, t6, t7
or.T t1, a3, t5
add s1, s3, s1
lw t6, 198(sp)
or.1 a3, t6, a5
lw t6, 96(sp)
lw t7, 66(sp)
and.T t5, t6, t7, -13
and t5, t2, t5, 13
add s1, s1, a7
lw t6, 156(sp)
li t7, -161218391
mul a7, t6, t7
add t2, s2, a7
lw t6, 162(sp)
lw t7, 189(sp)
or.T a7, t6, t7
lw t7, 129(sp)
and.1 t0, t0, t7, 13
add t4, t2, t4
lw t6, 39(sp)
lw t7, 0(sp)
and.T t2, t6, t7, -13
add t6, s1, t4
sw t6, 66(sp)
lw t6, 42(sp)
add s1, t6, t3
lw t6, 168(sp)
lw t7, 225(sp)
or.T t3, t6, t7
li t7, 93870481
mul t6, s0, t7
sw t6, 30(sp)
or.T t4, t3, a4
lw t7, 216(sp)
or.T t3, a5, t7
lw t7, 18(sp)
add s0, s1, t7
lw t6, 27(sp)
add t6, t6, s0
sw t6, 63(sp)
lw t7, 117(sp)
or t2, t2, t7, -13
lw t7, 120(sp)
xor s0, a4, t7
li t7, 170017070
mul t6, s0, t7
sw t6, 12(sp)
lw t6, 15(sp)
lw t7, 6(sp)
and.1 s0, t6, t7, 13
li t7, 125295604
mul t6, t5, t7
sw t6, 105(sp)
li t7, 96927894
mul t6, t4, t7
sw t6, 42(sp)
li t7, -170060818
mul t1, t1, t7
lw t6, 156(sp)
lw t7, 81(sp)
xor.T t5, t6, t7
lw t7, 135(sp)
and t4, a7, t7, 13
lw t6, 96(sp)
lw t7, 138(sp)
or s1, t6, t7, -13
lw t6, 156(sp)
lw t7, 180(sp)
xor.1 a7, t6, t7
lw t6, 36(sp)
li t7, -184134342
mul t6, t6, t7
sw t6, 36(sp)
lw t6, 138(sp)
lw t7, 192(sp)
and.1 t6, t6, t7, 13
sw t6, 18(sp)
or t3, s1, t3, -13
lw t7, 39(sp)
or s1, t5, t7, -13
lw t7, 156(sp)
and.T t5, a5, t7, -13
lw t7, 153(sp)
xor.1 s2, a7, t7
lw t7, 219(sp)
xor a7, t5, t7
or a3, a3, s2, -13
lw t6, 192(sp)
xor.1 t5, t6, s0
lw t6, 24(sp)
or a3, t6, a3, -13
li t7, 81389312
mul a3, a3, t7
add s0, t1, a3
li t7, 66501459
mul a3, t3, t7
lw t6, 138(sp)
lw t7, 15(sp)
xor.1 t1, t6, t7
li t7, 111843347
mul s2, t0, t7
lw t6, 33(sp)
li t7, 180429204
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 219(sp)
lw t7, 186(sp)
or.T t3, t6, t7
lw t6, 87(sp)
lw t7, 204(sp)
or t0, t6, t7, -13
li t7, -21284342
mul s1, s1, t7
lw t6, 195(sp)
lw t7, 0(sp)
and.1 s3, t6, t7, 13
or t2, t4, t2, -13
lw t6, 123(sp)
li t7, 88745336
mul t6, t6, t7
sw t6, 6(sp)
li t7, -50235516
mul s4, t2, t7
lw t6, 0(sp)
lw t7, 150(sp)
and.T t4, t6, t7, -13
lw t6, 111(sp)
or.T t2, t6, a5
lw t7, 42(sp)
add a5, s2, t7
lw t6, 105(sp)
add s2, t6, s4
li t7, 19880162
mul t5, t5, t7
li t7, 105307212
mul s3, s3, t7
lw t6, 69(sp)
add s2, t6, s2
lw t6, 30(sp)
add t6, t6, s2
sw t6, 0(sp)
lw t6, 36(sp)
add s2, t6, s3
slli s4, a6, 3
lw t6, 99(sp)
xor.T s3, t6, t2
lw t6, 219(sp)
li t7, 38825539
mul t2, t6, t7
add s0, s0, s1
lw t6, 12(sp)
add s0, t6, s0
add s0, s0, a5
lw t6, 192(sp)
lw t7, 18(sp)
xor a5, t6, t7
add a3, s0, a3
lw t6, 81(sp)
lw t7, 54(sp)
xor.1 s0, t6, t7
add s2, s2, s4
li t7, 23559816
mul s1, a5, t7
and s4, a7, s0, 13
and.T s0, s3, t3, -13
lw t6, 129(sp)
lw t7, 186(sp)
or.1 a5, t6, t7
or.1 a7, t0, t1
lw t7, 195(sp)
xor.1 t0, a7, t7
lw t7, 147(sp)
and.1 a7, t4, t7, 13
lw t6, 141(sp)
li t7, -133430020
mul t1, t6, t7
li t7, 189482425
mul t3, s4, t7
li t7, -50473892
mul t0, t0, t7
add t1, t5, t1
add t0, t1, t0
lw t6, 138(sp)
lw t7, 48(sp)
or.T t1, t6, t7
add t4, s2, t0
lw t6, 171(sp)
lw t7, 189(sp)
and.T t0, t6, t7, -13
lw t6, 102(sp)
li t7, -161207332
mul s2, t6, t7
lw t6, 204(sp)
and.T t5, t6, a7, -13
add a7, t3, s1
lw t6, 45(sp)
add s1, t6, a7
lw t6, 168(sp)
lw t7, 129(sp)
or t3, t6, t7, -13
add a7, t2, s2
li t7, 81045610
mul s0, s0, t7
lw t6, 213(sp)
li t7, -167767257
and.T t6, t6, t7, -13
sw t6, 102(sp)
lw t7, 156(sp)
xor t2, a4, t7
lw t6, 6(sp)
add a4, t6, s0
add a4, s1, a4
add t4, t4, a4
lw t6, 51(sp)
xor.T a4, t6, t1
li t7, -80347525
mul t1, t5, t7
lw t6, 108(sp)
lw t7, 219(sp)
xor t5, t6, t7
lw t7, 189(sp)
and t2, t2, t7, 13
lw t6, 342(sp)
li t7, -167767257
or.1 t6, t6, t7
sw t6, 18(sp)
xor a6, t5, a6
lw t6, 18(sp)
lw t7, 102(sp)
or.1 t5, t6, t7
lw t7, 231(sp)
or t6, t5, t7, -13
sw t6, 12(sp)
add a3, a3, t4
lw t6, 72(sp)
lw t7, 132(sp)
or t6, t6, t7, -13
sw t6, 180(sp)
lw t6, 0(sp)
add a3, t6, a3
lw t6, 342(sp)
li t7, -167767257
or.T t6, t6, t7
sw t6, 201(sp)
lw t6, 66(sp)
add t6, t6, a3
sw t6, 6(sp)
xor.1 a3, a5, t3
lw t6, 213(sp)
lw t7, 342(sp)
xor.1 t6, t6, t7
sw t6, 66(sp)
lw t6, 186(sp)
lw t7, 3(sp)
or.1 a5, t6, t7
and.T t0, t0, a3, -13
li t7, -66698858
mul a3, t2, t7
lw t6, 342(sp)
li t7, -167767257
xor.1 t6, t6, t7
sw t6, 105(sp)
lw t7, 15(sp)
and t2, a5, t7, 13
li t7, 145710200
mul a5, t0, t7
lw t6, 342(sp)
li t7, -167767257
and.1 t6, t6, t7, 13
sw t6, 24(sp)
lw t6, 84(sp)
or.1 t0, t6, t2
add a3, a3, t1
lw t6, 342(sp)
li t7, -167767257
xor t6, t6, t7
sw t6, 117(sp)
lw t6, 27(sp)
add a5, t6, a5
li t7, -71312476
mul t0, t0, t7
add a7, a3, a7
li t7, 171835413
mul a3, a6, t7
lw t6, 342(sp)
lw t7, 213(sp)
or.T t6, t6, t7
sw t6, 96(sp)
lw t6, 213(sp)
li t7, -167767257
or.1 t6, t6, t7
sw t6, 51(sp)
slli a4, a4, 6
lw t6, 213(sp)
li t7, -167767257
xor.1 t6, t6, t7
sw t6, 228(sp)
lw t6, 105(sp)
lw t7, 342(sp)
xor.1 t6, t6, t7
sw t6, 0(sp)
add a5, a5, a7
add a6, t0, a4
lw t6, 51(sp)
lw t7, 18(sp)
and.T t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 24(sp)
lw t7, 117(sp)
xor.1 a4, t6, t7
lw t6, 342(sp)
li t7, -167767257
xor.T t6, t6, t7
sw t6, 225(sp)
lw t6, 342(sp)
lw t7, 213(sp)
and.T t6, t6, t7, -13
sw t6, 168(sp)
lw t7, 228(sp)
xor.T a7, a4, t7
lw t6, 342(sp)
li t7, -167767257
and.T t6, t6, t7, -13
sw t6, 81(sp)
lw t6, 117(sp)
lw t7, 81(sp)
xor.1 a4, t6, t7
lw t6, 213(sp)
li t7, -167767257
or.T t6, t6, t7
sw t6, 192(sp)
lw t6, 342(sp)
li t7, -167767257
or t6, t6, t7, -13
sw t6, 48(sp)
lw t6, 168(sp)
lw t7, 51(sp)
or.T t6, t6, t7
sw t6, 42(sp)
li t7, -82401690
mul t6, a7, t7
sw t6, 129(sp)
lw t6, 228(sp)
lw t7, 342(sp)
or.T t0, t6, t7
lw t6, 201(sp)
li t7, 6767439
mul t6, t6, t7
sw t6, 126(sp)
lw t6, 192(sp)
li t7, 90859760
mul t6, t6, t7
sw t6, 261(sp)
lw t6, 48(sp)
lw t7, 102(sp)
xor a7, t6, t7
add a5, a5, a6
lw t7, 102(sp)
or.T t6, t0, t7
sw t6, 54(sp)
lw t6, 6(sp)
add a5, t6, a5
lw t6, 63(sp)
add a5, t6, a5
lw t6, 213(sp)
li t7, -167767257
and t6, t6, t7, 13
sw t6, 189(sp)
lw t6, 66(sp)
slli t6, t6, 7
sw t6, 69(sp)
lw t6, 114(sp)
add a5, t6, a5
lw t6, 102(sp)
li t7, 27860056
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 342(sp)
li t7, -167767257
and t6, t6, t7, 13
sw t6, 114(sp)
lw t6, 90(sp)
add a5, t6, a5
lw t6, 51(sp)
li t7, -188563129
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 342(sp)
lw t7, 213(sp)
xor.T t6, t6, t7
sw t6, 33(sp)
or.1 a4, a7, a4
lw t6, 66(sp)
or a4, t6, a4, -13
li t7, 11857307
mul a4, a4, t7
lw t6, 114(sp)
lw t7, 96(sp)
and t6, t6, t7, 13
sw t6, 135(sp)
add a3, a5, a3
lw t6, 213(sp)
lw t7, 342(sp)
or t6, t6, t7, -13
sw t6, 27(sp)
lw t6, 114(sp)
li t7, -167767257
xor.1 t6, t6, t7
sw t6, 36(sp)
lw t6, 168(sp)
lw t7, 51(sp)
or.1 a5, t6, t7
lw t6, 189(sp)
li t7, 97384725
mul t6, t6, t7
sw t6, 111(sp)
lw t6, 342(sp)
lw t7, 225(sp)
xor.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 57(sp)
xor t6, t6, a3
sw t6, 141(sp)
lw t6, 342(sp)
lw t7, 213(sp)
and t6, t6, t7, 13
sw t6, 264(sp)
lw t6, 342(sp)
lw t7, 207(sp)
xor t6, t6, t7
sw t6, 3(sp)
lw t6, 168(sp)
lw t7, 225(sp)
or.T t6, t6, t7
sw t6, 195(sp)
li t7, -15287536
mul t6, a5, t7
sw t6, 258(sp)
lw t6, 234(sp)
xor t6, t6, a3
sw t6, 198(sp)
lw t6, 198(sp)
li t7, -167767257
xor.1 t6, t6, t7
sw t6, 30(sp)
lw t6, 198(sp)
li t7, -167767257
xor.T t6, t6, t7
sw t6, 162(sp)
lw t6, 342(sp)
lw t7, 198(sp)
and t6, t6, t7, 13
sw t6, 153(sp)
lw t6, 213(sp)
lw t7, 198(sp)
and t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 342(sp)
lw t7, 198(sp)
or.1 t6, t6, t7
sw t6, 57(sp)
lw t6, 198(sp)
li t7, -167767257
xor t6, t6, t7
sw t6, 186(sp)
lw t6, 198(sp)
lw t7, 213(sp)
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 132(sp)
xor t6, t6, a3
sw t6, 156(sp)
lw t6, 198(sp)
lw t7, 342(sp)
and.1 t6, t6, t7, 13
sw t6, 39(sp)
lw t6, 342(sp)
lw t7, 198(sp)
and.T t6, t6, t7, -13
sw t6, 90(sp)
lw t6, 30(sp)
lw t7, 201(sp)
xor.1 a3, t6, t7
lw t6, 342(sp)
lw t7, 213(sp)
xor t6, t6, t7
sw t6, 120(sp)
lw t6, 15(sp)
li t7, 28444997
mul a6, t6, t7
lw t6, 21(sp)
lw t7, 57(sp)
and t6, t6, t7, 13
sw t6, 123(sp)
li t7, -164315454
mul a3, a3, t7
lw t6, 225(sp)
lw t7, 57(sp)
and.T a5, t6, t7, -13
lw t6, 198(sp)
li t7, -167767257
or.T t6, t6, t7
sw t6, 216(sp)
lw t6, 15(sp)
lw t7, 24(sp)
xor a7, t6, t7
lw t6, 231(sp)
li t7, -167767257
and t6, t6, t7, 13
sw t6, 243(sp)
lw t6, 213(sp)
lw t7, 39(sp)
and.T t1, t6, t7, -13
lw t6, 45(sp)
and.T a7, t6, a7, -13
add t0, a4, a6
lw t6, 186(sp)
lw t7, 51(sp)
or.1 a4, t6, t7
lw t7, 12(sp)
xor.1 a6, t1, t7
lw t6, 213(sp)
lw t7, 198(sp)
or.T t6, t6, t7
sw t6, 204(sp)
li t7, 32550567
mul a6, a6, t7
add a3, a3, a6
lw t6, 39(sp)
li t7, -167767257
xor.T t6, t6, t7
sw t6, 108(sp)
li t7, -137580898
mul a6, a7, t7
lw t6, 204(sp)
li t7, -84920712
mul t6, t6, t7
sw t6, 147(sp)
li t7, 8607598
mul t3, a4, t7
lw t6, 117(sp)
lw t7, 162(sp)
and t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 198(sp)
lw t7, 342(sp)
xor.1 a7, t6, t7
lw t6, 63(sp)
lw t7, 153(sp)
or.1 t1, t6, t7
lw t6, 213(sp)
lw t7, 342(sp)
and.1 t6, t6, t7, 13
sw t6, 240(sp)
lw t6, 216(sp)
li t7, 100808119
mul t2, t6, t7
lw t6, 198(sp)
lw t7, 213(sp)
or t6, t6, t7, -13
sw t6, 99(sp)
lw t6, 342(sp)
lw t7, 198(sp)
xor.T t4, t6, t7
lw t7, 204(sp)
and.1 a4, t4, t7, 13
or a4, a4, a5, -13
lw t6, 90(sp)
slli a5, t6, 3
add t2, t2, t0
lw t7, 69(sp)
add t6, t3, t7
sw t6, 150(sp)
lw t6, 342(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 69(sp)
lw t6, 240(sp)
lw t7, 162(sp)
or.1 t3, t6, t7
lw t6, 342(sp)
lw t7, 198(sp)
or.T t6, t6, t7
sw t6, 219(sp)
lw t6, 27(sp)
and.1 t0, t6, t4, 13
lw t6, 213(sp)
li t7, -167767257
xor.T t6, t6, t7
sw t6, 237(sp)
lw t7, 126(sp)
add a5, a5, t7
lw t6, 87(sp)
or t3, t6, t3, -13
lw t6, 24(sp)
lw t7, 198(sp)
xor.T t4, t6, t7
lw t6, 0(sp)
and.1 t1, t6, t1, 13
lw t7, 42(sp)
or.T t4, t4, t7
lw t7, 207(sp)
and.1 a7, a7, t7, 13
lw t6, 129(sp)
add t2, t6, t2
add a6, a6, t2
add t2, a3, a6
lw t6, 198(sp)
lw t7, 213(sp)
xor.T t6, t6, t7
sw t6, 42(sp)
lw t7, 99(sp)
xor.1 a6, t3, t7
lw t6, 198(sp)
li t7, -167767257
or t6, t6, t7, -13
sw t6, 222(sp)
lw t7, 54(sp)
or.T a3, t4, t7
lw t6, 123(sp)
li t7, 142564555
mul t6, t6, t7
sw t6, 138(sp)
li t7, 36165039
mul t6, a6, t7
sw t6, 87(sp)
lw t6, 153(sp)
lw t7, 204(sp)
and.T t6, t6, t7, -13
sw t6, 54(sp)
li t7, 41025132
mul t1, t1, t7
lw t7, 42(sp)
xor a6, t0, t7
lw t6, 213(sp)
lw t7, 198(sp)
and.1 t6, t6, t7, 13
sw t6, 252(sp)
lw t6, 216(sp)
lw t7, 264(sp)
or.T t6, t6, t7
sw t6, 12(sp)
add t6, t2, t1
sw t6, 0(sp)
li t7, -60206126
mul t0, a7, t7
lw t6, 24(sp)
li t7, -154725037
mul t6, t6, t7
sw t6, 234(sp)
lw t6, 198(sp)
li t7, -167767257
and t6, t6, t7, 13
sw t6, 123(sp)
lw t6, 198(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 129(sp)
lw t6, 102(sp)
lw t7, 3(sp)
and.1 t3, t6, t7, 13
lw t6, 198(sp)
li t7, -167767257
and.1 t6, t6, t7, 13
sw t6, 126(sp)
lw t7, 123(sp)
xor a4, a4, t7
lw t6, 219(sp)
lw t7, 117(sp)
or.1 t2, t6, t7
lw t6, 129(sp)
lw t7, 42(sp)
and.T a7, t6, t7, -13
li t7, -39807502
mul a4, a4, t7
add a4, a4, a5
lw t6, 198(sp)
lw t7, 126(sp)
and t1, t6, t7, 13
lw t6, 252(sp)
li t7, 66057268
mul t6, t6, t7
sw t6, 171(sp)
li t7, 46657329
mul a5, a7, t7
lw t6, 126(sp)
lw t7, 33(sp)
and.1 a7, t6, t7, 13
lw t7, 186(sp)
add t5, t0, t7
li t7, -54519135
mul s0, t3, t7
lw t6, 153(sp)
lw t7, 69(sp)
xor.1 t0, t6, t7
lw t6, 129(sp)
lw t7, 114(sp)
or.T t3, t6, t7
lw t6, 30(sp)
lw t7, 222(sp)
or t4, t6, t7, -13
add t5, t5, s0
lw t7, 135(sp)
xor t2, t2, t7
lw t6, 123(sp)
lw t7, 189(sp)
or.T s0, t6, t7
lw t6, 45(sp)
and s1, t6, t0, 13
li t7, 35367469
mul t0, t2, t7
li t7, 78734403
mul t2, s1, t7
li t7, -158826307
mul t1, t1, t7
or.T a6, a6, s0
li t7, -97722777
mul a3, a3, t7
lw t6, 252(sp)
or.1 s0, t6, t3
xor.1 a6, a6, t4
add t3, a4, t5
li t7, 59868501
mul t5, a6, t7
lw t6, 108(sp)
lw t7, 192(sp)
or.1 a6, t6, t7
lw t7, 87(sp)
add a4, t2, t7
lw t6, 264(sp)
li t7, -18903322
mul t6, t6, t7
sw t6, 87(sp)
lw t6, 33(sp)
lw t7, 192(sp)
xor.T t6, t6, t7
sw t6, 45(sp)
li t7, -48806933
mul t6, s0, t7
sw t6, 24(sp)
lw t6, 114(sp)
li t7, -8891892
mul t4, t6, t7
lw t6, 84(sp)
add t5, t6, t5
lw t6, 150(sp)
add t2, t6, t3
lw t6, 168(sp)
or.T a7, t6, a7
add t0, t0, t1
lw t6, 261(sp)
add t1, t6, t2
lw t6, 0(sp)
add t6, t6, t1
sw t6, 135(sp)
add t2, t0, a5
lw t6, 195(sp)
lw t7, 213(sp)
or t1, t6, t7, -13
lw t6, 147(sp)
add a5, t6, t5
lw t6, 90(sp)
lw t7, 198(sp)
xor.T t5, t6, t7
lw t7, 6(sp)
add s0, a5, t7
lw t6, 201(sp)
lw t7, 204(sp)
and.T t6, t6, t7, -13
sw t6, 0(sp)
li t7, -59670222
mul a6, a6, t7
lw t6, 243(sp)
li t7, -42885192
mul a5, t6, t7
lw t6, 57(sp)
lw t7, 231(sp)
and t0, t6, t7, 13
lw t7, 123(sp)
xor.T t3, t0, t7
lw t6, 111(sp)
add t0, t6, t4
lw t6, 48(sp)
lw t7, 237(sp)
xor.T s2, t6, t7
lw t6, 12(sp)
lw t7, 54(sp)
and.1 s1, t6, t7, 13
lw t6, 342(sp)
lw t7, 225(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
li t7, 7544469
add t4, a6, t7
and t5, t5, s2, 13
lw t7, 258(sp)
add a6, s0, t7
li t7, 22321551
mul t5, t5, t7
lw t6, 342(sp)
lw t7, 213(sp)
or.1 t6, t6, t7
sw t6, 3(sp)
lw t7, 171(sp)
add a6, a6, t7
lw t6, 57(sp)
li t7, -44339163
mul s0, t6, t7
lw t6, 120(sp)
lw t7, 198(sp)
and.1 s2, t6, t7, 13
add s3, a3, t2
li t7, -192347537
mul t2, a7, t7
and a3, s2, t1, 13
lw t6, 138(sp)
add t1, t6, s3
add a4, a4, t4
li t7, 175563566
mul a7, t3, t7
add t4, t2, a4
lw t7, 264(sp)
or.T s1, s1, t7
lw t6, 99(sp)
li t7, 87945750
mul t2, t6, t7
lw t6, 228(sp)
lw t7, 3(sp)
or.1 a4, t6, t7
li t7, 72802824
mul t3, a3, t7
lw t6, 126(sp)
li t7, -122126227
mul s3, t6, t7
li t7, 40539865
mul a3, s1, t7
lw t6, 33(sp)
lw t7, 51(sp)
xor.1 s1, t6, t7
add t6, t0, t5
sw t6, 6(sp)
lw t6, 36(sp)
lw t7, 204(sp)
xor s2, t6, t7
add t0, s3, s0
lw t6, 201(sp)
lw t7, 21(sp)
and.T t5, t6, t7, -13
lw t6, 189(sp)
lw t7, 33(sp)
xor s0, t6, t7
add a7, a5, a7
lw t6, 219(sp)
li t7, 4147096
mul a5, t6, t7
add t6, a7, t2
sw t6, 36(sp)
lw t6, 105(sp)
li t7, -10538337
mul t6, t6, t7
sw t6, 120(sp)
li t7, -96022913
mul t6, s1, t7
sw t6, 54(sp)
lw t6, 0(sp)
li t7, 56983706
mul a7, t6, t7
li t7, -29873107
mul t2, s2, t7
lw t6, 186(sp)
lw t7, 153(sp)
xor.T s1, t6, t7
add a6, t1, a6
li t7, 45540790
mul t1, s1, t7
add t2, t1, t2
add t6, a6, t4
sw t6, 84(sp)
lw t6, 48(sp)
xor t5, t6, t5
lw t6, 42(sp)
lw t7, 114(sp)
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 105(sp)
xor t4, t6, s0
lw t6, 225(sp)
lw t7, 63(sp)
or.T t1, t6, t7
lw t6, 162(sp)
lw t7, 57(sp)
xor s0, t6, t7
lw t7, 24(sp)
add s1, t3, t7
lw t6, 153(sp)
lw t7, 33(sp)
or.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 213(sp)
lw t7, 198(sp)
xor.1 t6, t6, t7
sw t6, 111(sp)
lw t6, 69(sp)
lw t7, 96(sp)
or t6, t6, t7, -13
sw t6, 108(sp)
lw t6, 342(sp)
lw t7, 99(sp)
and t3, t6, t7, 13
slli a4, a4, 7
lw t6, 81(sp)
lw t7, 123(sp)
or.1 a6, t6, t7
li t7, -146236978
mul t4, t4, t7
lw t6, 27(sp)
lw t7, 99(sp)
xor s2, t6, t7
lw t7, 87(sp)
add s3, a4, t7
lw t6, 213(sp)
li t7, -167767257
and.1 a4, t6, t7, 13
lw t7, 12(sp)
and.T s2, s2, t7, -13
add t0, s3, t0
li t7, -91914552
mul t5, t5, t7
lw t6, 213(sp)
li t7, -167767257
xor t6, t6, t7
sw t6, 12(sp)
add a3, a3, s1
lw t7, 234(sp)
add t0, t0, t7
lw t6, 18(sp)
xor s0, t6, s0
lw t7, 6(sp)
add a3, a3, t7
li t7, -176073659
mul s1, s2, t7
lw t7, 21(sp)
or.1 s2, s0, t7
add a5, s1, a5
add t2, t0, t2
lw t6, 111(sp)
li t7, 170549250
mul t0, t6, t7
add t6, a7, t0
sw t6, 87(sp)
lw t6, 162(sp)
li t7, -181461350
mul s1, t6, t7
lw t7, 3(sp)
xor.T s0, a4, t7
lw t6, 186(sp)
lw t7, 69(sp)
and t0, t6, t7, 13
lw t6, 162(sp)
li t7, -90631949
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 36(sp)
add s3, t6, t2
or.T t1, s2, t1
lw t7, 45(sp)
and.1 a7, t3, t7, 13
lw t6, 54(sp)
add t2, t6, t5
li t7, 29393241
mul t1, t1, t7
add t1, t4, t1
add t6, a3, s3
sw t6, 69(sp)
lw t6, 198(sp)
lw t7, 216(sp)
xor.1 t5, t6, t7
add a5, a5, s1
lw t6, 198(sp)
lw t7, 213(sp)
and.T a3, t6, t7, -13
li t7, -64568108
mul t4, s0, t7
lw t6, 342(sp)
lw t7, 15(sp)
xor.1 t3, t6, t7
lw t7, 204(sp)
or.1 a3, a3, t7
lw t6, 198(sp)
lw t7, 81(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
xor.T s0, a3, a6
li t7, 52196285
mul t6, t5, t7
sw t6, 6(sp)
lw t6, 0(sp)
or.T a6, t6, a7
li t7, 151137860
mul a6, a6, t7
li t7, -186400648
mul a7, s0, t7
lw t6, 63(sp)
or.1 t6, t6, a4
sw t6, 0(sp)
add a4, t1, t4
lw t6, 21(sp)
lw t7, 105(sp)
or.1 t4, t6, t7
li t7, -164111102
mul t1, t0, t7
add t6, t2, a4
sw t6, 45(sp)
lw t6, 198(sp)
li t7, -167767257
or.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 3(sp)
lw t7, 198(sp)
or.T s0, t6, t7
lw t6, 42(sp)
lw t7, 102(sp)
xor.1 t5, t6, t7
lw t7, 168(sp)
or.1 t2, t3, t7
lw t6, 51(sp)
lw t7, 186(sp)
xor.1 a4, t6, t7
lw t6, 126(sp)
lw t7, 342(sp)
or t0, t6, t7, -13
lw t6, 57(sp)
and.T t3, t6, s0, -13
lw t6, 108(sp)
li t7, 58828688
mul s0, t6, t7
add s0, s0, a6
li t7, -67404280
mul a6, t2, t7
li t7, 138597516
mul t2, t4, t7
lw t6, 252(sp)
lw t7, 240(sp)
xor.1 t6, t6, t7
sw t6, 63(sp)
lw t6, 3(sp)
lw t7, 198(sp)
and.1 t4, t6, t7, 13
add a5, s0, a5
lw t7, 24(sp)
and.T s0, t5, t7, -13
lw t7, 12(sp)
or.T t5, a3, t7
lw t6, 18(sp)
xor.T s0, t6, s0
lw t6, 87(sp)
add a5, t6, a5
lw t6, 213(sp)
and t5, t6, t5, 13
li t7, -20862538
mul t6, t4, t7
sw t6, 42(sp)
xor t5, t0, t5
li t7, 78631496
mul t0, t3, t7
lw t6, 21(sp)
lw t7, 33(sp)
or.T t4, t6, t7
li t7, -21550457
mul t5, t5, t7
add t1, a7, t1
lw t6, 213(sp)
li t7, 151424335
mul t6, t6, t7
sw t6, 57(sp)
lw t6, 48(sp)
lw t7, 222(sp)
xor a7, t6, t7
li t7, 124257476
mul s0, s0, t7
lw t6, 204(sp)
li t7, -167767257
or s1, t6, t7, -13
lw t6, 96(sp)
lw t7, 222(sp)
and.1 t3, t6, t7, 13
add s0, s0, t2
lw t6, 213(sp)
lw t7, 96(sp)
xor.1 t6, t6, t7
sw t6, 24(sp)
lw t7, 252(sp)
and.T s2, s1, t7, -13
lw t6, 222(sp)
and.T s1, t6, a7, -13
lw t6, 216(sp)
lw t7, 186(sp)
xor.T t2, t6, t7
lw t6, 6(sp)
add s0, t6, s0
lw t6, 0(sp)
li t7, 156698528
mul a7, t6, t7
li t7, -167767257
and.T t3, t3, t7, -13
lw t7, 120(sp)
add t5, t5, t7
lw t6, 54(sp)
and.T t4, t6, t4, -13
add t5, t5, a6
li t7, 37802533
mul s2, s2, t7
li t7, -1812972
mul a4, a4, t7
lw t6, 117(sp)
lw t7, 99(sp)
xor.1 a6, t6, t7
li t7, 62773095
mul s1, s1, t7
add s1, s1, a4
li t7, 178725335
mul a4, t2, t7
add t2, t1, s0
lw t6, 192(sp)
and t1, t6, a3, 13
add t2, t2, t5
lw t7, 27(sp)
add t5, s1, t7
add t0, t0, s2
add t2, a5, t2
lw t6, 51(sp)
li t7, -101276808
mul t6, t6, t7
sw t6, 3(sp)
li t7, -151104119
mul t4, t4, t7
lw t6, 18(sp)
li t7, 134430028
mul t6, t6, t7
sw t6, 33(sp)
li t7, -51541457
mul t3, t3, t7
lw t6, 237(sp)
lw t7, 219(sp)
or.1 s0, t6, t7
add a5, t0, a4
lw t6, 198(sp)
and.T a4, t6, a3, -13
add t0, t3, a7
lw t6, 36(sp)
or a7, t6, s0, -13
lw t6, 63(sp)
and.1 a7, t6, a7, 13
lw t6, 219(sp)
lw t7, 48(sp)
or s0, t6, t7, -13
li t7, -44923852
mul t6, t1, t7
sw t6, 36(sp)
add t3, t5, a5
xor.T a5, a6, s0
xor.1 a6, a5, a7
lw t6, 111(sp)
lw t7, 231(sp)
or t1, t6, t7, -13
lw t6, 342(sp)
lw t7, 39(sp)
or.T a5, t6, t7
lw t7, 42(sp)
add a7, t3, t7
li t7, -149142849
mul t3, a6, t7
add a6, t2, a7
add t3, t4, t3
lw t6, 189(sp)
lw t7, 66(sp)
and.T a7, t6, t7, -13
lw t6, 66(sp)
lw t7, 342(sp)
and.1 t2, t6, t7, 13
li t7, -97675529
mul s0, a7, t7
lw t6, 213(sp)
lw t7, 219(sp)
xor.1 t6, t6, t7
sw t6, 27(sp)
lw t6, 12(sp)
li t7, -167767257
and.1 a7, t6, t7, 13
lw t6, 207(sp)
li t7, 5212716
mul t4, t6, t7
lw t6, 57(sp)
add t4, t6, t4
lw t6, 81(sp)
lw t7, 189(sp)
xor.1 t5, t6, t7
lw t6, 192(sp)
lw t7, 15(sp)
or.1 s1, t6, t7
add t0, t4, t0
add t4, a6, t3
add t0, t0, s0
lw t6, 132(sp)
lw t7, 174(sp)
and.1 t6, t6, t7, 13
sw t6, 111(sp)
lw t7, 48(sp)
or t3, s1, t7, -13
lw t7, 225(sp)
or.T a6, a3, t7
li t7, 72358631
mul t3, t3, t7
lw t6, 219(sp)
lw t7, 30(sp)
and s1, t6, t7, 13
lw t7, 123(sp)
and t1, t1, t7, 13
lw t6, 132(sp)
lw t7, 174(sp)
xor t6, t6, t7
sw t6, 6(sp)
lw t6, 48(sp)
li t7, -167767257
xor s0, t6, t7
lw t6, 12(sp)
or.T s1, t6, s1
li t7, -41104572
mul t5, t5, t7
li t7, 143153539
mul t6, t1, t7
sw t6, 39(sp)
lw t6, 21(sp)
and a4, t6, a4, 13
lw t6, 24(sp)
and.1 t6, t6, t2, 13
sw t6, 0(sp)
lw t6, 90(sp)
li t7, 74119155
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 192(sp)
lw t7, 342(sp)
xor.T s2, t6, t7
lw t6, 123(sp)
and.T t1, t6, a3, -13
lw t6, 228(sp)
lw t7, 81(sp)
and t2, t6, t7, 13
lw t6, 174(sp)
li t7, 106663942
xor t6, t6, t7
sw t6, 87(sp)
and.1 s1, a5, s1, 13
lw t6, 45(sp)
add s3, t6, t4
lw t6, 264(sp)
and.T t4, t6, s2, -13
lw t6, 30(sp)
li t7, 138779781
mul a5, t6, t7
and a3, a7, s0, 13
li t7, -144229817
mul t6, s1, t7
sw t6, 21(sp)
lw t6, 69(sp)
add a7, t6, s3
add t5, t5, t3
lw t6, 240(sp)
andi t3, t6, 0
add a7, a7, t0
lw t7, 3(sp)
add t0, t5, t7
lw t6, 84(sp)
add a7, t6, a7
li t7, -7308454
mul a3, a3, t7
lw t6, 135(sp)
add t6, t6, a7
sw t6, 18(sp)
lw t6, 36(sp)
add a3, t6, a3
li t7, 164678457
mul t4, t4, t7
lw t7, 27(sp)
or.T a7, a6, t7
lw t6, 54(sp)
or.T a6, t6, t2
li t7, 74467056
mul a4, a4, t7
lw t6, 174(sp)
li t7, 106663942
and t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 132(sp)
li t7, 106663942
and t6, t6, t7, 13
sw t6, 69(sp)
li t7, 118917961
mul a6, a6, t7
lw t6, 132(sp)
li t7, 106663942
and.T t6, t6, t7, -13
sw t6, 195(sp)
lw t6, 129(sp)
xor t2, t6, t3
lw t6, 186(sp)
or t1, t6, t1, -13
lw t6, 198(sp)
xor t1, t6, t1
add a6, a6, a5
add a5, t0, t4
lw t6, 132(sp)
lw t7, 174(sp)
or.1 t6, t6, t7
sw t6, 138(sp)
li t7, -44832738
mul t0, t1, t7
lw t6, 174(sp)
lw t7, 132(sp)
and.T t6, t6, t7, -13
sw t6, 171(sp)
lw t6, 132(sp)
li t7, 106663942
xor.T t6, t6, t7
sw t6, 48(sp)
lw t6, 171(sp)
lw t7, 69(sp)
xor.1 t6, t6, t7
sw t6, 3(sp)
lw t6, 132(sp)
li t7, 106663942
and.1 t6, t6, t7, 13
sw t6, 189(sp)
lw t6, 0(sp)
or t1, t6, a7, -13
lw t6, 15(sp)
andi t6, t6, 0
sw t6, 12(sp)
li t7, 175251211
mul a7, t2, t7
lw t6, 48(sp)
lw t7, 174(sp)
and.1 t2, t6, t7, 13
li t7, 82148567
mul t1, t1, t7
li t7, -19909778
mul t6, t2, t7
sw t6, 0(sp)
lw t6, 132(sp)
lw t7, 174(sp)
or.T t6, t6, t7
sw t6, 96(sp)
lw t6, 24(sp)
add t1, t6, t1
lw t6, 189(sp)
lw t7, 174(sp)
or t2, t6, t7, -13
lw t7, 39(sp)
add a7, a7, t7
add a7, t0, a7
li t7, 123596951
mul t6, t2, t7
sw t6, 24(sp)
lw t6, 21(sp)
add t0, t6, t1
lw t6, 33(sp)
add t1, t6, a7
add a7, a3, t0
lw t6, 138(sp)
li t7, 106663942
or t0, t6, t7, -13
add a3, t1, a6
add a3, a4, a3
lw t6, 174(sp)
li t7, 106663942
xor.1 t6, t6, t7
sw t6, 30(sp)
add a4, a7, a5
lw t7, 87(sp)
or a5, t0, t7, -13
lw t6, 174(sp)
lw t7, 132(sp)
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 246(sp)
li t7, -106663942
and.1 t6, t6, t7, 13
sw t6, 168(sp)
lw t6, 174(sp)
lw t7, 132(sp)
or t6, t6, t7, -13
sw t6, 123(sp)
lw t6, 174(sp)
li t7, -133473873
mul t6, t6, t7
sw t6, 153(sp)
lw t6, 36(sp)
lw t7, 111(sp)
xor t6, t6, t7
sw t6, 114(sp)
add a3, a4, a3
li t7, 155852448
mul t6, a5, t7
sw t6, 66(sp)
lw t6, 132(sp)
li t7, 106663942
xor.1 t6, t6, t7
sw t6, 117(sp)
lw t6, 18(sp)
add a3, t6, a3
lw t6, 174(sp)
li t7, 106663942
or t6, t6, t7, -13
sw t6, 102(sp)
lw t6, 174(sp)
li t7, 65519741
mul t6, t6, t7
sw t6, 135(sp)
lw t6, 174(sp)
li t7, 106663942
and.T t6, t6, t7, -13
sw t6, 207(sp)
li t7, -124274567
xor a4, a3, t7
li t7, 106663942
xor.T t6, a4, t7
sw t6, 42(sp)
lw t7, 132(sp)
or t6, a4, t7, -13
sw t6, 120(sp)
lw t6, 174(sp)
or t6, t6, a4, -13
sw t6, 54(sp)
lw t6, 132(sp)
xor t6, t6, a4
sw t6, 201(sp)
xor t6, a4, a4
sw t6, 21(sp)
lw t6, 201(sp)
xor.1 a7, t6, a4
lw t6, 174(sp)
lw t7, 120(sp)
xor.1 a5, t6, t7
lw t7, 132(sp)
and.1 t6, a4, t7, 13
sw t6, 39(sp)
lw t6, 3(sp)
lw t7, 54(sp)
and.T a3, t6, t7, -13
li t7, 106663942
xor.1 t6, a4, t7
sw t6, 45(sp)
li t7, 106663942
or.T t6, a4, t7
sw t6, 81(sp)
lw t6, 6(sp)
lw t7, 21(sp)
or.T t0, t6, t7
lw t6, 39(sp)
lw t7, 45(sp)
or a6, t6, t7, -13
li t7, 2077763
mul a3, a3, t7
lw t7, 132(sp)
or.T t6, a4, t7
sw t6, 27(sp)
lw t6, 87(sp)
lw t7, 81(sp)
xor t1, t6, t7
xor.1 a6, t1, a6
li t7, -81502822
mul a5, a5, t7
lw t6, 132(sp)
xor.T t6, t6, a4
sw t6, 204(sp)
lw t6, 204(sp)
li t7, -7963777
mul t1, t6, t7
li t7, 106221132
mul t3, a6, t7
lw t6, 132(sp)
and t6, t6, a4, 13
sw t6, 99(sp)
lw t6, 96(sp)
lw t7, 204(sp)
or.T a6, t6, t7
lw t6, 81(sp)
lw t7, 6(sp)
xor.1 t2, t6, t7
lw t6, 27(sp)
lw t7, 45(sp)
and t4, t6, t7, 13
li t7, 106663942
or t6, a4, t7, -13
sw t6, 186(sp)
li t7, 111613984
mul t4, t4, t7
lw t6, 174(sp)
xor.1 t6, t6, a4
sw t6, 63(sp)
lw t6, 201(sp)
lw t7, 186(sp)
or t5, t6, t7, -13
lw t6, 24(sp)
add t3, t6, t3
lw t6, 99(sp)
xor.1 s0, t6, a4
add a5, a5, t4
li t7, 181070524
mul t4, s0, t7
li t7, -133790320
mul t6, a6, t7
sw t6, 51(sp)
lw t7, 12(sp)
and.T s0, t5, t7, -13
lw t6, 81(sp)
lw t7, 174(sp)
and.1 t5, t6, t7, 13
li t7, 26634203
mul s0, s0, t7
li t7, -176029444
mul a7, a7, t7
lw t7, 174(sp)
xor s1, t0, t7
li t7, -16896003
mul t6, t2, t7
sw t6, 90(sp)
lw t6, 0(sp)
add t0, t6, t3
li t7, 44638974
mul t3, s1, t7
add t1, s0, t1
lw t6, 174(sp)
xor.T t6, t6, a4
sw t6, 24(sp)
add s0, t1, a7
lw t6, 231(sp)
or t1, t6, t5, -13
li t7, 106663942
xor t6, a4, t7
sw t6, 3(sp)
add t2, t0, a3
lw t6, 174(sp)
and.T t6, t6, a4, -13
sw t6, 192(sp)
li t7, 106663942
and.T t6, a4, t7, -13
sw t6, 147(sp)
lw t6, 111(sp)
lw t7, 192(sp)
xor.T a7, t6, t7
li t7, -147950565
mul a3, t1, t7
add t5, t4, a3
lw t7, 174(sp)
and t6, a4, t7, 13
sw t6, 108(sp)
li t7, 106663942
and a3, a4, t7, 13
lw t7, 132(sp)
and.T t6, a4, t7, -13
sw t6, 18(sp)
lw t6, 108(sp)
xor a6, t6, a6
lw t6, 189(sp)
lw t7, 63(sp)
xor.T t0, t6, t7
lw t6, 132(sp)
xor.1 t4, t6, a4
lw t6, 42(sp)
li t7, 106663942
xor.1 t6, t6, t7
sw t6, 0(sp)
lw t6, 108(sp)
lw t7, 207(sp)
xor.1 t1, t6, t7
li t7, -187314286
mul a6, a6, t7
lw t6, 3(sp)
lw t7, 45(sp)
xor.1 t6, t6, t7
sw t6, 126(sp)
lw t6, 39(sp)
lw t7, 63(sp)
xor t6, t6, t7
sw t6, 105(sp)
add a6, s0, a6
lw t6, 147(sp)
lw t7, 138(sp)
and.1 t6, t6, t7, 13
sw t6, 57(sp)
add a5, t3, a5
lw t6, 147(sp)
lw t7, 39(sp)
xor.1 s0, t6, t7
lw t6, 24(sp)
li t7, 178006137
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 24(sp)
li t7, 106663942
or t3, t6, t7, -13
lw t6, 171(sp)
lw t7, 24(sp)
xor.1 s1, t6, t7
add a5, a5, a6
xor.T a6, s1, s0
add a5, a5, t5
add t6, t2, a5
sw t6, 216(sp)
lw t6, 45(sp)
lw t7, 192(sp)
and s0, t6, t7, 13
lw t6, 192(sp)
lw t7, 132(sp)
xor a5, t6, t7
lw t6, 108(sp)
lw t7, 36(sp)
or.1 t5, t6, t7
lw t6, 132(sp)
lw t7, 174(sp)
xor.1 t6, t6, t7
sw t6, 33(sp)
lw t6, 195(sp)
xor.1 t2, t6, a3
lw t6, 96(sp)
xor t5, t6, t5
lw t6, 99(sp)
and.T t4, t6, t4, -13
lw t7, 180(sp)
xor a7, a7, t7
li t7, -143975236
mul s0, s0, t7
lw t6, 174(sp)
li t7, 106663942
and.1 t6, t6, t7, 13
sw t6, 12(sp)
lw t7, 96(sp)
or t4, t4, t7, -13
lw t6, 33(sp)
lw t7, 186(sp)
xor s1, t6, t7
lw t6, 33(sp)
xor.T s2, t6, a3
or.1 t0, t0, t1
lw t6, 12(sp)
lw t7, 171(sp)
xor.1 s3, t6, t7
lw t7, 42(sp)
xor.1 t1, a3, t7
lw t6, 66(sp)
add t6, t6, s0
sw t6, 150(sp)
lw t6, 117(sp)
or s1, t6, s1, -13
lw t7, 132(sp)
and.T s0, t2, t7, -13
li t7, 32450067
mul t2, s2, t7
li t7, -165504786
mul s2, s0, t7
or.1 s3, s3, t3
li t7, -61316261
mul t3, t0, t7
lw t6, 123(sp)
xor s0, t6, a3
li t7, 107571620
mul t5, t5, t7
lw t6, 99(sp)
li t7, 193607578
mul t0, t6, t7
li t7, 133291698
mul s3, s3, t7
li t7, -410257
mul t6, t4, t7
sw t6, 162(sp)
add t4, s2, t5
li t7, -11434512
mul t6, s1, t7
sw t6, 66(sp)
lw t7, 90(sp)
add s1, s3, t7
li t7, -33623828
mul s2, a6, t7
li t7, -183482270
mul t1, t1, t7
lw t7, 0(sp)
or a6, a7, t7, -13
lw t6, 147(sp)
lw t7, 174(sp)
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 102(sp)
lw t7, 3(sp)
xor.1 a7, t6, t7
li t7, -137401302
mul s3, a6, t7
li t7, -51744114
mul a6, a7, t7
li t7, 88783601
mul s4, s0, t7
lw t6, 126(sp)
or a5, t6, a5, -13
li t7, 153286694
mul t5, a5, t7
lw t6, 174(sp)
and.1 t6, t6, a4, 13
sw t6, 126(sp)
lw t6, 153(sp)
add s0, t6, s1
lw t6, 51(sp)
add a5, t6, s2
lw t6, 195(sp)
lw t7, 189(sp)
xor.T a7, t6, t7
add s0, s3, s0
lw t6, 33(sp)
lw t7, 99(sp)
xor.1 s1, t6, t7
add s3, s4, t2
lw t6, 174(sp)
lw t7, 132(sp)
xor.T t6, t6, t7
sw t6, 51(sp)
lw t6, 132(sp)
li t7, 106663942
or t6, t6, t7, -13
sw t6, 153(sp)
add a5, t3, a5
add t3, t4, a5
lw t6, 174(sp)
li t7, 106663942
xor.T a5, t6, t7
lw t7, 57(sp)
xor t2, s1, t7
lw t7, 132(sp)
or.1 t4, a4, t7
lw t6, 39(sp)
li t7, 106663942
and.T s2, t6, t7, -13
lw t6, 207(sp)
li t7, 85389920
mul s1, t6, t7
add s4, t5, s0
add t5, t0, s3
lw t6, 132(sp)
li t7, 106663942
or.1 t6, t6, t7
sw t6, 90(sp)
lw t6, 6(sp)
lw t7, 36(sp)
or s0, t6, t7, -13
add t1, t3, t1
lw t7, 36(sp)
or.T t0, t4, t7
lw t7, 150(sp)
add s3, s4, t7
lw t6, 132(sp)
or t3, t6, a5, -13
lw t6, 30(sp)
or s5, t6, t0, -13
li t7, 19543641
mul t0, a5, t7
lw t6, 132(sp)
li t7, 106663942
or.T t6, t6, t7
sw t6, 219(sp)
lw t6, 219(sp)
li t7, -10078749
mul t4, t6, t7
add s3, t1, s3
lw t6, 66(sp)
add t1, t6, t5
lw t6, 15(sp)
or.1 s4, t6, s2
lw t6, 87(sp)
lw t7, 219(sp)
xor s2, t6, t7
lw t7, 84(sp)
add s1, s1, t7
lw t7, 114(sp)
and.1 t5, s5, t7, 13
lw t6, 45(sp)
lw t7, 168(sp)
and s6, t6, t7, 13
add a6, a6, s1
lw t6, 162(sp)
add s5, t6, a6
li t7, -118068200
mul s1, s6, t7
li t7, -55957296
mul a6, t2, t7
lw t6, 105(sp)
or a7, t6, a7, -13
li t7, -124124075
mul t2, a7, t7
xor.1 a7, s0, s2
add s2, s3, s5
lw t7, 90(sp)
or s0, s4, t7, -13
li t7, -34389436
mul s3, a7, t7
li t7, -150554831
mul s0, s0, t7
lw t6, 153(sp)
lw t7, 108(sp)
and.1 a7, t6, t7, 13
li t7, -28676157
mul t3, t3, t7
lw t6, 174(sp)
or.T t6, t6, a4
sw t6, 180(sp)
lw t6, 174(sp)
or.1 t6, t6, a4
sw t6, 150(sp)
add t4, t4, s3
lw t6, 180(sp)
lw t7, 219(sp)
or.1 s5, t6, t7
lw t7, 201(sp)
xor s4, a3, t7
lw t6, 219(sp)
lw t7, 72(sp)
and.T s3, t6, t7, -13
li t7, -20664408
mul t6, s5, t7
sw t6, 66(sp)
lw t6, 150(sp)
slli a3, t6, 5
li t7, 70257213
mul t5, t5, t7
add t6, t0, s1
sw t6, 72(sp)
add t0, t1, t5
add a6, t0, a6
lw t6, 45(sp)
lw t7, 102(sp)
and.T t6, t6, t7, -13
sw t6, 213(sp)
add t5, s2, a6
li t7, 182250789
mul a6, s4, t7
add t6, t3, t2
sw t6, 162(sp)
lw t6, 3(sp)
lw t7, 108(sp)
and.T t0, t6, t7, -13
lw t6, 96(sp)
and t3, t6, s3, 13
li t7, 106663942
and.1 t6, t0, t7, 13
sw t6, 57(sp)
add t0, s0, t4
lw t6, 150(sp)
ori s0, t6, 0
add a3, a3, t0
lw t6, 171(sp)
lw t7, 45(sp)
xor.T s1, t6, t7
lw t6, 21(sp)
lw t7, 27(sp)
and.1 t0, t6, t7, 13
lw t6, 201(sp)
lw t7, 138(sp)
xor t1, t6, t7
li t7, -170695464
mul t6, a7, t7
sw t6, 168(sp)
lw t6, 174(sp)
li t7, 106663942
or.1 a7, t6, t7
add t2, t5, a3
lw t6, 174(sp)
li t7, 106663942
or.T a3, t6, t7
lw t6, 33(sp)
lw t7, 12(sp)
or t4, t6, t7, -13
lw t6, 0(sp)
lw t7, 69(sp)
and.T t5, t6, t7, -13
lw t6, 216(sp)
add t6, t6, t2
sw t6, 84(sp)
li t7, -58318898
mul t2, t5, t7
lw t6, 150(sp)
lw t7, 246(sp)
and.1 s4, t6, t7, 13
xor.T s1, s0, s1
xor.T t3, t3, a4
lw t7, 171(sp)
xor.1 t5, a3, t7
lw t6, 36(sp)
and.1 a5, t6, a5, 13
lw t6, 36(sp)
lw t7, 102(sp)
or.1 s2, t6, t7
lw t6, 51(sp)
or.1 s3, t6, a7
lw t6, 51(sp)
li t7, 60546162
mul t6, t6, t7
sw t6, 105(sp)
and.1 s4, s4, a4, 13
li t7, -23155281
mul t3, t3, t7
add t3, t3, a6
lw t6, 174(sp)
or.T t6, t6, a7
sw t6, 0(sp)
andi s0, t4, 0
lw t6, 174(sp)
xor t6, t6, a4
sw t6, 3(sp)
lw t6, 132(sp)
lw t7, 27(sp)
xor a6, t6, t7
lw t6, 186(sp)
xor a5, t6, a5
xor.1 a7, t1, s1
or s1, t0, s3, -13
li t7, 71581732
mul t4, a7, t7
li t7, -155133877
mul t1, s4, t7
lw t7, 42(sp)
and a7, s2, t7, 13
lw t6, 153(sp)
xor t0, t6, t5
lw t6, 39(sp)
lw t7, 102(sp)
and.T s2, t6, t7, -13
lw t6, 174(sp)
li t7, 66070193
mul t5, t6, t7
add t2, t5, t2
lw t6, 3(sp)
lw t7, 192(sp)
or.1 t5, t6, t7
lw t7, 171(sp)
and.T t5, t5, t7, -13
lw t6, 123(sp)
lw t7, 90(sp)
and s3, t6, t7, 13
xor.1 s2, s3, s2
lw t6, 57(sp)
xor.1 s0, t6, s0
li t7, 161205156
mul t6, s2, t7
sw t6, 114(sp)
li t7, -88211685
mul s1, s1, t7
li t7, -189932427
mul t6, a4, t7
sw t6, 27(sp)
lw t6, 213(sp)
xor.1 t5, t6, t5
lw t6, 66(sp)
add t2, t6, t2
add s2, t2, t3
li t7, -62126636
mul t2, s0, t7
add t4, s1, t4
lw t6, 24(sp)
li t7, 9729475
mul t3, t6, t7
add t6, s2, t1
sw t6, 57(sp)
lw t6, 219(sp)
li t7, -106663942
xor.1 t1, t6, t7
lw t6, 171(sp)
xor.T a6, t6, a6
lw t6, 48(sp)
or.T t6, t6, a3
sw t6, 186(sp)
lw t6, 45(sp)
or.T s0, t6, a4
li t7, -193624849
mul t5, t5, t7
add t4, t4, t5
or a7, t0, a7, -13
lw t6, 63(sp)
lw t7, 15(sp)
or s1, t6, t7, -13
lw t6, 123(sp)
lw t7, 153(sp)
or.T t6, t6, t7
sw t6, 48(sp)
li t7, -83735784
mul t5, a7, t7
li t7, -139543381
mul a7, s0, t7
li t7, 63002877
mul s0, a5, t7
lw t6, 6(sp)
lw t7, 36(sp)
xor.1 t0, t6, t7
lw t6, 96(sp)
li t7, -13692927
mul a5, t6, t7
lw t7, 0(sp)
xor.1 t1, t1, t7
xor t1, t1, s1
lw t7, 135(sp)
add t2, t2, t7
lw t7, 105(sp)
add t2, t2, t7
add t3, t4, t3
lw t6, 21(sp)
slli t6, t6, 5
sw t6, 66(sp)
add t6, t5, s0
sw t6, 105(sp)
lw t6, 102(sp)
and.T t6, t6, a4, -13
sw t6, 15(sp)
add t6, t2, t3
sw t6, 63(sp)
lw t6, 108(sp)
lw t7, 174(sp)
and.1 t2, t6, t7, 13
li t7, 62980096
mul t2, t2, t7
li t7, -93163411
mul t1, t1, t7
lw t6, 153(sp)
and t0, t6, t0, 13
xor t0, t0, a6
add a7, a7, t2
lw t6, 189(sp)
li t7, 106663942
xor a6, t6, t7
li t7, 140780799
mul t2, t0, t7
lw t7, 99(sp)
and t0, a3, t7, 13
lw t7, 153(sp)
xor t0, t0, t7
lw t6, 114(sp)
add t3, t6, t1
lw t6, 18(sp)
lw t7, 111(sp)
xor t4, t6, t7
lw t6, 27(sp)
add t1, t6, a5
add t5, t2, t3
lw t6, 132(sp)
lw t7, 96(sp)
xor.1 t3, t6, t7
lw t6, 126(sp)
and.T a5, t6, t4, -13
lw t6, 99(sp)
lw t7, 6(sp)
or.1 t2, t6, t7
add t1, t5, t1
lw t6, 3(sp)
lw t7, 150(sp)
and.1 t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 54(sp)
lw t7, 204(sp)
xor.1 t6, t6, t7
sw t6, 18(sp)
lw t6, 102(sp)
and.1 t4, t6, t3, 13
or.1 a3, a3, t0
li t7, -121339787
mul a3, a3, t7
lw t6, 54(sp)
lw t7, 132(sp)
xor.T t0, t6, t7
lw t6, 204(sp)
xor.1 t0, t6, t0
lw t6, 96(sp)
li t7, -104910114
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 6(sp)
lw t7, 21(sp)
xor t3, t6, t7
xor.1 t0, t0, t4
li t7, -9202646
mul t0, t0, t7
add a3, a7, a3
lw t6, 42(sp)
li t7, 69744560
mul t6, t6, t7
sw t6, 21(sp)
add a3, t1, a3
lw t6, 69(sp)
and.T a6, t6, a6, -13
lw t6, 48(sp)
and.T t1, t6, a6, -13
li t7, 106663942
and.1 a6, a4, t7, 13
lw t6, 33(sp)
or t4, t6, a4, -13
lw t6, 150(sp)
xor.T a6, t6, a6
lw t7, 186(sp)
or.T a7, t2, t7
slli a7, a7, 5
li t7, -111532853
mul t6, t3, t7
sw t6, 99(sp)
lw t7, 66(sp)
add t3, a7, t7
lw t6, 81(sp)
li t7, 38142558
mul a7, t6, t7
lw t6, 126(sp)
lw t7, 153(sp)
and.1 t2, t6, t7, 13
lw t6, 171(sp)
lw t7, 201(sp)
and.1 t5, t6, t7, 13
lw t6, 171(sp)
lw t7, 69(sp)
and t6, t6, t7, 13
sw t6, 48(sp)
xor.1 t2, t5, t2
add a3, a3, t3
lw t6, 33(sp)
and.T t3, t6, t4, -13
lw t7, 192(sp)
xor.1 t3, t3, t7
lw t7, 15(sp)
or.1 t4, a6, t7
lw t6, 105(sp)
add a3, t6, a3
lw t6, 33(sp)
lw t7, 54(sp)
xor.1 a6, t6, t7
or.T t4, t4, a5
lw t6, 63(sp)
add a5, t6, a3
li t7, 106663942
or.1 a3, a4, t7
lw t6, 57(sp)
add a5, t6, a5
and.1 t1, t1, t4, 13
li t7, -10635936
mul t1, t1, t7
add t1, t0, t1
li t7, -86338947
mul t3, t3, t7
lw t6, 180(sp)
lw t7, 174(sp)
xor.1 t4, t6, t7
lw t7, 18(sp)
or.T t2, t2, t7
lw t6, 45(sp)
li t7, 106663942
or t5, t6, t7, -13
lw t6, 6(sp)
lw t7, 30(sp)
xor.T t0, t6, t7
li t7, -181025753
mul s0, t4, t7
lw t7, 24(sp)
xor s3, t5, t7
li t7, 175023325
mul t2, t2, t7
lw t7, 171(sp)
and t4, a3, t7, 13
add t2, t1, t2
li t7, 127721600
mul t6, t4, t7
sw t6, 15(sp)
lw t6, 12(sp)
li t7, 106663942
and.T s1, t6, t7, -13
lw t7, 126(sp)
or s2, a4, t7, -13
lw t6, 96(sp)
lw t7, 120(sp)
xor.1 t1, t6, t7
lw t6, 207(sp)
lw t7, 0(sp)
and t5, t6, t7, 13
lw t6, 24(sp)
li t7, -106663942
or.T t4, t6, t7
add t6, a7, t3
sw t6, 0(sp)
lw t6, 3(sp)
lw t7, 174(sp)
xor.1 a7, t6, t7
li t7, -15565018
mul t3, s3, t7
add t3, s0, t3
lw t6, 99(sp)
add t6, t6, t3
sw t6, 12(sp)
lw t6, 81(sp)
lw t7, 174(sp)
or t3, t6, t7, -13
lw t6, 36(sp)
or a7, t6, a7, -13
lw t7, 36(sp)
and.T s3, a7, t7, -13
lw t6, 138(sp)
lw t7, 81(sp)
xor.1 a7, t6, t7
and.1 s1, s1, s2, 13
add t2, a5, t2
lw t6, 147(sp)
li t7, 106663942
xor.T s0, t6, t7
xor.1 a6, a6, s3
lw t6, 96(sp)
or a5, t6, t5, -13
lw t6, 102(sp)
li t7, 114261214
mul t5, t6, t7
xor.1 s2, t0, t4
lw t6, 72(sp)
add t6, t6, t2
sw t6, 24(sp)
li t7, -118257030
mul a6, a6, t7
lw t7, 48(sp)
or t4, s1, t7, -13
lw t6, 87(sp)
lw t7, 123(sp)
and.1 t2, t6, t7, 13
li t7, -67153856
mul t0, t3, t7
li t7, 188566943
mul t3, s2, t7
li t7, -45435572
mul t6, t1, t7
sw t6, 3(sp)
lw t7, 174(sp)
xor.T t1, s0, t7
lw t6, 219(sp)
xor.1 s0, t6, t1
li t7, -85070048
mul t1, t4, t7
add t1, t1, t5
lw t7, 27(sp)
add t1, t1, t7
li t7, -173076262
mul s0, s0, t7
lw t6, 246(sp)
lw t7, 96(sp)
or.T t5, t6, t7
li t7, 149369369
mul t4, a5, t7
add t0, t0, s0
add t3, t3, a6
slli t2, t2, 2
and.T a6, a7, t5, -13
lw t6, 51(sp)
li t7, -164489285
mul a5, t6, t7
lw t7, 42(sp)
and a3, a3, t7, 13
lw t6, 93(sp)
li t7, 174955247
xor.T t6, t6, t7
sw t6, 63(sp)
add t1, t1, t4
li t7, -170749741
mul a7, a6, t7
lw t6, 81(sp)
lw t7, 6(sp)
or.1 t4, t6, t7
li t7, 23244579
mul a6, a3, t7
add t1, t3, t1
lw t6, 174(sp)
xor.1 a3, t6, t4
add t2, a7, t2
lw t6, 93(sp)
li t7, 174955247
or.T t6, t6, t7
sw t6, 99(sp)
add a7, t1, t0
lw t6, 39(sp)
lw t7, 207(sp)
xor t0, t6, t7
lw t6, 195(sp)
xor.1 t1, t6, a3
lw t6, 111(sp)
lw t7, 90(sp)
or.T t4, t6, t7
lw t6, 141(sp)
li t7, 66324488
xor a3, t6, t7
lw t6, 138(sp)
li t7, 23631609
mul t3, t6, t7
xor.1 t5, t4, t0
li t7, 48018649
mul t0, t1, t7
add t0, t0, a6
lw t6, 246(sp)
lw t7, 189(sp)
and a6, t6, t7, 13
lw t6, 141(sp)
lw t7, 141(sp)
xor t6, t6, t7
sw t6, 18(sp)
lw t7, 174(sp)
xor.T t6, a3, t7
sw t6, 27(sp)
lw t6, 15(sp)
add a7, t6, a7
li t7, 174955247
and.T t6, a3, t7, -13
sw t6, 138(sp)
lw t6, 12(sp)
add a7, t6, a7
lw t6, 174(sp)
lw t7, 27(sp)
and s0, t6, t7, 13
lw t6, 0(sp)
add t4, t6, a7
lw t6, 132(sp)
li t7, 106663942
xor t1, t6, t7
lw t6, 63(sp)
li t7, 174955247
and.T a7, t6, t7, -13
lw t7, 3(sp)
add t4, t4, t7
add t2, t4, t2
lw t6, 174(sp)
xor t6, t6, a3
sw t6, 66(sp)
lw t6, 24(sp)
add s1, t6, t2
lw t6, 117(sp)
or.T t4, t6, t1
li t7, 50051672
mul t2, t5, t7
lw t6, 93(sp)
li t7, 174955247
xor.1 t6, t6, t7
sw t6, 45(sp)
add t5, t2, a5
lw t6, 21(sp)
add t2, t6, t3
lw t6, 66(sp)
lw t7, 138(sp)
and.1 a5, t6, t7, 13
or.T a5, s0, a5
lw t7, 99(sp)
and a5, a5, t7, 13
lw t6, 174(sp)
li t7, 174955247
and.1 t6, t6, t7, 13
sw t6, 30(sp)
lw t6, 168(sp)
add t3, t6, s1
add t0, t0, t5
lw t6, 93(sp)
and.1 t6, t6, a3, 13
sw t6, 3(sp)
li t7, 174955247
xor.T t6, a3, t7
sw t6, 15(sp)
lw t6, 162(sp)
add t3, t6, t3
add t0, t3, t0
lw t7, 93(sp)
xor.1 t6, a3, t7
sw t6, 24(sp)
li t7, 174955247
or.1 t6, a3, t7
sw t6, 147(sp)
and.1 a4, a4, t1, 13
lw t7, 174(sp)
or t6, a3, t7, -13
sw t6, 36(sp)
lw t7, 174(sp)
and t6, a3, t7, 13
sw t6, 150(sp)
li t7, 106663942
or.T a4, a4, t7
xor t1, t4, a6
lw t6, 24(sp)
lw t7, 249(sp)
xor a6, t6, t7
li t7, 46820704
mul t3, t1, t7
lw t6, 99(sp)
lw t7, 147(sp)
or.T t1, t6, t7
li t7, -31772795
mul t4, a4, t7
add t2, t2, t3
lw t6, 30(sp)
li t7, 101396659
mul a4, t6, t7
add t2, t4, t2
and t3, t1, a7, 13
lw t6, 36(sp)
lw t7, 30(sp)
xor.1 a7, t6, t7
lw t6, 177(sp)
li t7, -49767648
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 231(sp)
lw t7, 24(sp)
and t1, t6, t7, 13
or a5, a5, t3, -13
lw t6, 45(sp)
xor.T t3, t6, a6
add a6, t0, t2
xor.1 t0, a7, t3
lw t6, 150(sp)
lw t7, 93(sp)
and.1 a7, t6, t7, 13
lw t6, 84(sp)
add t6, t6, a6
sw t6, 186(sp)
li t7, -55504066
mul a6, t0, t7
li t7, 184326122
mul a5, a5, t7
lw t6, 24(sp)
lw t7, 9(sp)
xor t3, t6, t7
lw t6, 93(sp)
li t7, 174955247
xor t6, t6, t7
sw t6, 72(sp)
add a5, a5, a4
lw t6, 174(sp)
or.T t6, t6, a3
sw t6, 54(sp)
li t7, 174955247
or.T t0, a3, t7
lw t7, 3(sp)
or t2, a7, t7, -13
lw t6, 72(sp)
li t7, -184577658
mul a7, t6, t7
and.1 t1, t3, t1, 13
lw t6, 93(sp)
li t7, 174955247
and.1 t6, t6, t7, 13
sw t6, 132(sp)
lw t7, 93(sp)
or.1 a4, a3, t7
lw t6, 54(sp)
li t7, 174955247
xor t4, t6, t7
lw t6, 93(sp)
li t7, 174955247
or.1 t6, t6, t7
sw t6, 42(sp)
lw t6, 15(sp)
lw t7, 132(sp)
xor.1 t6, t6, t7
sw t6, 0(sp)
li t7, 174955247
xor t6, a3, t7
sw t6, 123(sp)
lw t7, 123(sp)
or t5, t1, t7, -13
lw t6, 42(sp)
lw t7, 231(sp)
and t1, t6, t7, 13
lw t6, 93(sp)
li t7, 174955247
and t6, t6, t7, 13
sw t6, 114(sp)
lw t7, 72(sp)
or t3, a3, t7, -13
lw t6, 138(sp)
xor.1 t4, t6, t4
lw t6, 54(sp)
slli t6, t6, 8
sw t6, 12(sp)
lw t7, 93(sp)
xor.T t6, a3, t7
sw t6, 102(sp)
xor.T t5, t2, t5
li t7, -33277258
mul t2, t4, t7
li t7, 21941504
mul t4, t5, t7
lw t7, 72(sp)
or.1 t0, t0, t7
lw t6, 27(sp)
lw t7, 102(sp)
xor t5, t6, t7
or.1 s0, t1, t3
li t7, 174955247
or t6, a3, t7, -13
sw t6, 81(sp)
lw t6, 9(sp)
lw t7, 81(sp)
xor.T t3, t6, t7
lw t6, 78(sp)
li t7, 174955247
or.T t1, t6, t7
li t7, 15257208
mul s0, s0, t7
lw t7, 45(sp)
or.1 t5, t5, t7
lw t6, 231(sp)
li t7, 174955247
or.T t6, t6, t7
sw t6, 162(sp)
add s0, s0, t2
add t2, a6, t4
lw t6, 6(sp)
add t4, t6, s0
lw t6, 174(sp)
li t7, 174955247
and.T t6, t6, t7, -13
sw t6, 135(sp)
lw t6, 177(sp)
lw t7, 72(sp)
and.1 a6, t6, t7, 13
or t5, t5, t1, -13
li t7, 78427141
mul t1, t0, t7
add a5, a5, t2
add a7, t4, a7
add t6, a5, a7
sw t6, 6(sp)
li t7, -65099445
mul t0, a4, t7
lw t6, 255(sp)
lw t7, 30(sp)
or a7, t6, t7, -13
lw t6, 114(sp)
xor.1 t4, t6, a4
lw t7, 183(sp)
or.T t2, a4, t7
li t7, 174955247
xor.1 t6, a3, t7
sw t6, 33(sp)
lw t6, 174(sp)
li t7, 174955247
and t6, t6, t7, 13
sw t6, 168(sp)
lw t7, 42(sp)
or s0, t5, t7, -13
lw t6, 174(sp)
xor.1 t6, t6, a3
sw t6, 27(sp)
lw t6, 174(sp)
li t7, 174955247
xor.1 t5, t6, t7
lw t6, 114(sp)
li t7, 174955247
or.T s2, t6, t7
lw t7, 33(sp)
and.1 a5, t3, t7, 13
lw t7, 165(sp)
or.1 s1, a3, t7
li t7, 51136507
mul a5, a5, t7
lw t6, 0(sp)
xor t3, t6, s0
lw t7, 174(sp)
and.1 t6, a3, t7, 13
sw t6, 21(sp)
or.T a6, a3, a6
and.T s4, s2, a6, -13
lw t6, 174(sp)
li t7, 174955247
or.T a6, t6, t7
li t7, -60624155
mul t3, t3, t7
lw t7, 21(sp)
and.1 t4, t4, t7, 13
lw t6, 72(sp)
and.T s2, t6, a6, -13
or s3, a7, a3, -13
add s5, t3, t1
lw t6, 174(sp)
lw t7, 15(sp)
and t3, t6, t7, 13
lw t6, 168(sp)
li t7, 101891788
mul a7, t6, t7
lw t7, 93(sp)
or s0, t5, t7, -13
lw t7, 183(sp)
and s1, s1, t7, 13
lw t6, 231(sp)
or s4, t6, s4, -13
lw t6, 78(sp)
li t7, 168062057
mul t1, t6, t7
lw t7, 174(sp)
and.T t6, a3, t7, -13
sw t6, 69(sp)
lw t6, 15(sp)
lw t7, 147(sp)
xor s6, t6, t7
add t0, t0, s5
li t7, 15600885
mul t5, s2, t7
lw t7, 162(sp)
and.1 s3, s3, t7, 13
lw t7, 210(sp)
xor s2, a4, t7
li t7, 149707031
mul a4, s6, t7
li t7, 175899228
mul s3, s3, t7
lw t6, 93(sp)
li t7, 174955247
and.T t6, t6, t7, -13
sw t6, 48(sp)
li t7, -159989556
mul t6, t2, t7
sw t6, 39(sp)
lw t6, 210(sp)
xor s4, t6, s4
lw t7, 12(sp)
add s3, s3, t7
li t7, -122389044
mul t6, s1, t7
sw t6, 51(sp)
lw t6, 33(sp)
lw t7, 30(sp)
xor.T t2, t6, t7
li t7, 170720213
mul s1, s4, t7
lw t6, 27(sp)
and.1 s0, t6, s0, 13
lw t6, 174(sp)
li t7, 174955247
or.1 t6, t6, t7
sw t6, 153(sp)
lw t6, 174(sp)
lw t7, 153(sp)
or.T s4, t6, t7
or t4, t4, s4, -13
lw t7, 93(sp)
xor t6, a3, t7
sw t6, 12(sp)
or t2, s2, t2, -13
add a5, a5, s3
lw t6, 177(sp)
li t7, 174955247
and.T t6, t6, t7, -13
sw t6, 57(sp)
lw t6, 174(sp)
li t7, 174955247
xor t6, t6, t7
sw t6, 87(sp)
li t7, 79544523
mul t4, t4, t7
lw t6, 144(sp)
xor.T a6, t6, a6
li t7, 28286843
mul s0, s0, t7
add s1, s1, s0
lw t6, 147(sp)
or.1 s0, t6, t3
li t7, 174955247
and.1 t3, a3, t7, 13
add a4, t5, a4
add a5, a5, s1
add a7, a7, t4
and.1 a6, a3, a6, 13
lw t6, 153(sp)
lw t7, 93(sp)
and t5, t6, t7, 13
add t1, a5, t1
lw t6, 210(sp)
lw t7, 132(sp)
xor.1 t4, t6, t7
lw t7, 93(sp)
or.T a5, a3, t7
li t7, -56084739
mul a6, a6, t7
add s1, t0, t1
lw t6, 93(sp)
or t1, t6, t3, -13
add t6, a7, a4
sw t6, 105(sp)
lw t7, 255(sp)
or.T a4, t3, t7
lw t6, 69(sp)
or.1 t0, t6, t5
lw t6, 93(sp)
xor.T a4, t6, a4
lw t6, 87(sp)
lw t7, 174(sp)
and.T a7, t6, t7, -13
li t7, 110558144
mul t5, s0, t7
lw t6, 6(sp)
add t6, t6, s1
sw t6, 108(sp)
li t7, 192933383
mul s0, a4, t7
lw t6, 144(sp)
lw t7, 45(sp)
xor.1 s1, t6, t7
li t7, 174955247
xor.T s2, a5, t7
lw t6, 135(sp)
li t7, 174955247
xor t6, t6, t7
sw t6, 84(sp)
li t7, 174955247
and a4, a3, t7, 13
xor.T a7, t2, a7
and t2, s2, s1, 13
and.T a7, a7, t2, -13
lw t7, 93(sp)
and.T t6, a3, t7, -13
sw t6, 90(sp)
li t7, -123528487
mul t2, a7, t7
lw t6, 81(sp)
lw t7, 93(sp)
and.T t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 36(sp)
lw t7, 174(sp)
or.T a7, t6, t7
lw t6, 39(sp)
add s2, t6, s0
lw t7, 132(sp)
or s0, t3, t7, -13
lw t6, 255(sp)
lw t7, 246(sp)
and s1, t6, t7, 13
lw t6, 57(sp)
xor t4, t6, t4
lw t6, 51(sp)
add t3, t6, s2
add t2, t5, t2
lw t7, 87(sp)
xor s3, t0, t7
lw t7, 132(sp)
and.T s2, s1, t7, -13
lw t6, 60(sp)
lw t7, 48(sp)
and.1 t6, t6, t7, 13
sw t6, 39(sp)
lw t6, 12(sp)
lw t7, 48(sp)
and.T t0, t6, t7, -13
and.T t0, t0, s0, -13
lw t6, 135(sp)
or t5, t6, t0, -13
lw t6, 78(sp)
li t7, 62207874
mul t0, t6, t7
li t7, -174955247
or s0, t1, t7, -13
lw t6, 63(sp)
lw t7, 12(sp)
and.1 s1, t6, t7, 13
lw t6, 153(sp)
lw t7, 12(sp)
and.1 s4, t6, t7, 13
li t7, -125614504
mul t1, s3, t7
add s3, a6, t1
li t7, -169964746
mul t1, t4, t7
lw t6, 174(sp)
lw t7, 72(sp)
xor.T a6, t6, t7
add t4, t3, s3
li t7, -134491983
mul s2, s2, t7
lw t6, 174(sp)
li t7, 174955247
xor.T t6, t6, t7
sw t6, 6(sp)
lw t6, 93(sp)
xor.T s3, t6, s4
lw t6, 135(sp)
lw t7, 87(sp)
or.T t3, t6, t7
li t7, 181833472
mul s3, s3, t7
li t7, 174397700
mul t5, t5, t7
add s5, t2, t5
li t7, -45614054
mul t5, t3, t7
or.1 s6, s0, s1
lw t7, 177(sp)
or.1 s4, a4, t7
lw t6, 132(sp)
lw t7, 66(sp)
or.T t3, t6, t7
lw t6, 84(sp)
li t7, -68743668
mul t2, t6, t7
lw t6, 69(sp)
lw t7, 135(sp)
and t6, t6, t7, 13
sw t6, 57(sp)
add s0, s5, s2
lw t6, 72(sp)
and s1, t6, a5, 13
lw t7, 30(sp)
or.1 s5, s6, t7
lw t6, 30(sp)
li t7, 174955247
xor.1 a5, t6, t7
lw t6, 114(sp)
xor.1 s2, t6, a7
li t7, 134675130
mul a7, s4, t7
add s3, s3, a7
li t7, -182748127
mul s4, s5, t7
lw t6, 174(sp)
lw t7, 210(sp)
and a7, t6, t7, 13
add s4, s4, t2
lw t6, 60(sp)
li t7, 81219841
mul t6, t6, t7
sw t6, 96(sp)
lw t6, 6(sp)
lw t7, 90(sp)
and t2, t6, t7, 13
add s4, s0, s4
lw t7, 93(sp)
or s0, a7, t7, -13
add a7, t4, s4
lw t6, 105(sp)
add a7, t6, a7
add s4, a7, t0
lw t6, 39(sp)
li t7, 174955247
or.1 t4, t6, t7
lw t7, 255(sp)
xor t0, s1, t7
add t5, t1, t5
lw t6, 255(sp)
li t7, 181944549
mul a7, t6, t7
li t7, -91544462
mul t1, s2, t7
add s2, s4, s3
lw t6, 42(sp)
lw t7, 0(sp)
and s1, t6, t7, 13
lw t6, 78(sp)
and.1 t6, t6, a6, 13
sw t6, 105(sp)
add t5, s2, t5
lw t6, 48(sp)
li t7, -140642142
mul t6, t6, t7
sw t6, 84(sp)
li t7, -95899522
mul t6, t3, t7
sw t6, 120(sp)
li t7, 132353925
mul a6, s1, t7
add t6, a6, t1
sw t6, 51(sp)
lw t6, 123(sp)
lw t7, 81(sp)
or.T a6, t6, t7
lw t6, 174(sp)
lw t7, 15(sp)
xor.1 t1, t6, t7
lw t6, 153(sp)
lw t7, 42(sp)
and t6, t6, t7, 13
sw t6, 66(sp)
lw t6, 93(sp)
li t7, 174955247
or t6, t6, t7, -13
sw t6, 72(sp)
xor a5, a5, s0
lw t6, 174(sp)
or.1 t6, t6, a3
sw t6, 126(sp)
lw t6, 147(sp)
lw t7, 54(sp)
xor.1 t3, t6, t7
lw t6, 108(sp)
add t6, t6, t5
sw t6, 117(sp)
lw t6, 126(sp)
li t7, 12733962
mul t6, t6, t7
sw t6, 48(sp)
lw t6, 93(sp)
lw t7, 45(sp)
xor.1 s2, t6, t7
lw t6, 57(sp)
or.1 s0, t6, t3
lw t7, 6(sp)
and.T t5, a4, t7, -13
lw t6, 126(sp)
li t7, -120419637
mul t3, t6, t7
li t7, 184858484
mul t4, t4, t7
lw t6, 63(sp)
lw t7, 6(sp)
and s1, t6, t7, 13
xor.1 s3, t2, s0
and.T t1, t1, a6, -13
lw t7, 114(sp)
and.T s0, a4, t7, -13
li t7, -182444396
mul a6, s2, t7
lw t6, 72(sp)
li t7, -387155
mul t2, t6, t7
xor.T s2, s3, t0
lw t7, 3(sp)
and a4, a4, t7, 13
lw t6, 168(sp)
xor t0, t6, t5
li t7, -162550104
mul t5, s2, t7
lw t6, 183(sp)
xor.T s1, t6, s1
li t7, 167382813
mul t6, s1, t7
sw t6, 111(sp)
add t6, t4, a7
sw t6, 0(sp)
add a7, t3, t5
li t7, 104135778
mul t6, s0, t7
sw t6, 39(sp)
lw t6, 27(sp)
li t7, -5672587
mul t3, t6, t7
li t7, -111645416
mul t4, a4, t7
lw t6, 93(sp)
and t6, t6, a3, 13
sw t6, 57(sp)
lw t6, 93(sp)
or a4, t6, a3, -13
add t5, a6, t4
lw t6, 231(sp)
lw t7, 174(sp)
or a6, t6, t7, -13
li t7, -53628959
mul t4, t1, t7
li t7, -166122935
mul t0, t0, t7
lw t6, 21(sp)
lw t7, 138(sp)
and t1, t6, t7, 13
add t4, t4, t2
lw t6, 51(sp)
add t6, t6, a7
sw t6, 108(sp)
add t5, t5, t3
lw t6, 105(sp)
li t7, -44576661
mul t3, t6, t7
lw t7, 132(sp)
and.T a7, t1, t7, -13
li t7, 169302031
mul a5, a5, t7
lw t6, 36(sp)
and.T s0, t6, a4, -13
lw t6, 24(sp)
xor.1 t2, t6, a3
lw t6, 174(sp)
li t7, 174955247
or t1, t6, t7, -13
add t3, t4, t3
add t4, t5, t0
lw t6, 66(sp)
or.1 s0, t6, s0
lw t6, 147(sp)
li t7, 174955247
or.T t0, t6, t7
lw t6, 102(sp)
and.1 t5, t6, a3, 13
li t7, -14524745
mul s1, s0, t7
lw t6, 135(sp)
li t7, 174955247
and.1 s0, t6, t7, 13
lw t6, 30(sp)
lw t7, 15(sp)
or s2, t6, t7, -13
xor.T s2, t0, s2
add t0, t3, s1
li t7, 130099973
mul t6, s2, t7
sw t6, 66(sp)
lw t6, 69(sp)
xor.T t3, t6, t5
lw t7, 84(sp)
add s1, a5, t7
slli t2, t2, 6
lw t7, 165(sp)
and t5, a4, t7, 13
li t7, 13668292
mul a5, a6, t7
lw t7, 57(sp)
or.1 t1, t1, t7
add a6, s1, t4
or.T a7, a7, t1
lw t6, 69(sp)
and.1 t1, t6, s0, 13
lw t6, 21(sp)
li t7, -32258638
mul s0, t6, t7
li t7, -78468251
mul s1, t1, t7
lw t6, 36(sp)
lw t7, 93(sp)
xor.T t6, t6, t7
sw t6, 51(sp)
lw t6, 0(sp)
add a6, t6, a6
lw t6, 45(sp)
lw t7, 78(sp)
xor t1, t6, t7
lw t6, 150(sp)
li t7, -174955247
or t4, t6, t7, -13
lw t6, 231(sp)
lw t7, 168(sp)
and s2, t6, t7, 13
li t7, 87209225
mul t1, t1, t7
lw t6, 120(sp)
add a6, t6, a6
lw t7, 69(sp)
and s3, t4, t7, 13
lw t6, 33(sp)
lw t7, 249(sp)
or t4, t6, t7, -13
add t6, a6, t0
sw t6, 21(sp)
li t7, 99791979
mul t3, t3, t7
li t7, -73673890
mul a6, t5, t7
lw t6, 81(sp)
lw t7, 168(sp)
and.T t5, t6, t7, -13
add t0, s1, t2
lw t6, 99(sp)
lw t7, 93(sp)
and s4, t6, t7, 13
li t7, -37142713
mul t2, s2, t7
lw t6, 123(sp)
and.T s3, t6, s3, -13
add s2, t0, s0
li t7, -188011925
mul s1, a7, t7
lw t6, 36(sp)
li t7, 65026562
mul t0, t6, t7
li t7, 91768365
mul a7, s3, t7
lw t6, 12(sp)
and.1 s0, t6, a3, 13
li t7, -138805125
mul t6, s4, t7
sw t6, 0(sp)
li t7, 120068137
mul t6, a4, t7
sw t6, 78(sp)
add s2, t3, s2
li t7, 61417079
mul t5, t5, t7
lw t6, 153(sp)
li t7, 174955247
and.T t3, t6, t7, -13
lw t6, 48(sp)
add s1, t6, s1
add t2, s2, t2
add s1, s1, a5
add a5, t1, t5
lw t7, 63(sp)
xor.1 t4, t4, t7
lw t6, 72(sp)
lw t7, 87(sp)
xor.1 t1, t6, t7
lw t6, 174(sp)
and.T t5, t6, s0, -13
lw t7, 147(sp)
or.1 s2, a4, t7
lw t6, 39(sp)
add s3, t6, s1
lw t6, 42(sp)
lw t7, 54(sp)
xor.T s0, t6, t7
li t7, -123898168
mul a4, t4, t7
lw t6, 147(sp)
li t7, -174955247
xor.1 t4, t6, t7
li t7, -51597828
mul s1, s2, t7
lw t6, 111(sp)
add s2, t6, s3
lw t7, 66(sp)
add s2, s2, t7
lw t7, 93(sp)
or.1 t4, t4, t7
lw t6, 123(sp)
lw t7, 60(sp)
and s3, t6, t7, 13
lw t7, 162(sp)
or t4, t4, t7, -13
li t7, -36334979
mul t4, t4, t7
li t7, 147614501
mul t5, t5, t7
add t0, t0, a6
lw t6, 147(sp)
and.T a6, t6, a3, -13
add s4, a5, a4
lw t7, 51(sp)
and.T a4, t3, t7, -13
lw t6, 69(sp)
xor a5, t6, t1
li t7, 80927270
mul t1, s0, t7
add t2, t2, s4
add a7, t1, a7
add t0, s1, t0
li t7, -148330767
mul t1, s3, t7
add t2, s2, t2
lw t6, 21(sp)
add t3, t6, t2
lw t6, 255(sp)
lw t7, 102(sp)
xor t2, t6, t7
li t7, 21142555
mul a6, a6, t7
lw t6, 9(sp)
li t7, -169428236
mul t6, t6, t7
sw t6, 39(sp)
add s1, a7, t1
add a7, t5, t0
add t6, t4, a7
sw t6, 33(sp)
lw t6, 93(sp)
lw t7, 246(sp)
or t4, t6, t7, -13
lw t6, 126(sp)
li t7, 174955247
or.T a7, t6, t7
li t7, -134269373
mul t1, a5, t7
lw t6, 36(sp)
lw t7, 123(sp)
and.T s0, t6, t7, -13
lw t6, 72(sp)
li t7, 157500016
mul t0, t6, t7
lw t6, 0(sp)
add a5, t6, s1
lw t6, 78(sp)
add s1, t6, a5
li t7, -71306142
mul a5, a4, t7
lw t6, 114(sp)
lw t7, 102(sp)
xor t5, t6, t7
add a4, t3, s1
lw t6, 108(sp)
add a4, t6, a4
lw t6, 174(sp)
xor t2, t6, t2
lw t6, 96(sp)
add a4, t6, a4
lw t6, 117(sp)
add t6, t6, a4
sw t6, 21(sp)
and.T a4, s0, t4, -13
lw t6, 6(sp)
li t7, 174955247
and s0, t6, t7, 13
lw t6, 168(sp)
lw t7, 3(sp)
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 138(sp)
lw t7, 12(sp)
xor.T t3, t6, t7
li t7, 138018775
mul t4, a4, t7
lw t6, 15(sp)
lw t7, 174(sp)
or.T a4, t6, t7
lw t6, 63(sp)
and.1 s0, t6, s0, 13
add a6, a6, t1
lw t6, 36(sp)
and.T t1, t6, t5, -13
or.1 a7, a7, t1
li t7, 62192962
mul t1, a7, t7
lw t6, 102(sp)
lw t7, 255(sp)
or.1 a7, t6, t7
add t0, t1, t0
add t4, t4, t0
li t7, 19362085
mul t5, t2, t7
lw t6, 99(sp)
xor.T t3, t6, t3
li t7, 109649590
mul t1, s0, t7
lw t7, 138(sp)
and.T t2, a7, t7, -13
lw t6, 87(sp)
lw t7, 144(sp)
xor t0, t6, t7
lw t6, 90(sp)
li t7, -99905179
mul a7, t6, t7
li t7, -128639158
add t5, t5, t7
add a5, t5, a5
lw t7, 174(sp)
or.1 t3, t3, t7
li t7, -59883096
mul t3, t3, t7
add a5, a5, a6
add t5, t4, t3
lw t6, 33(sp)
add t3, t6, a5
lw t6, 54(sp)
lw t7, 246(sp)
xor.1 a5, t6, t7
lw t6, 144(sp)
li t7, 174955247
xor.1 a6, t6, t7
lw t6, 27(sp)
li t7, -130765934
mul s0, t6, t7
lw t6, 57(sp)
lw t7, 27(sp)
xor.T t4, t6, t7
lw t6, 198(sp)
li t7, -184095268
xor t6, t6, t7
sw t6, 6(sp)
li t7, -72058755
mul t2, t2, t7
add t1, t1, t2
lw t6, 39(sp)
add t5, t6, t5
add t1, t1, s0
xor.T t0, t0, a4
lw t6, 60(sp)
lw t7, 81(sp)
xor t2, t6, t7
lw t6, 93(sp)
lw t7, 30(sp)
xor s0, t6, t7
add a4, t3, t5
li t7, -1860143
mul t0, t0, t7
lw t6, 45(sp)
lw t7, 54(sp)
or.1 t3, t6, t7
or.1 t5, a3, s0
or.1 a5, a5, t4
add a7, a7, t0
add t0, t1, a7
and t3, t3, t5, 13
lw t7, 114(sp)
xor.1 a7, a3, t7
li t7, 36323876
mul t1, a5, t7
lw t6, 183(sp)
lw t7, 54(sp)
and.T a5, t6, t7, -13
lw t7, 126(sp)
and.T t4, t2, t7, -13
lw t6, 15(sp)
lw t7, 42(sp)
and.T t2, t6, t7, -13
or.1 t4, a7, t4
lw t6, 156(sp)
lw t7, 198(sp)
and.T t6, t6, t7, -13
sw t6, 126(sp)
slli a5, a5, 7
lw t6, 24(sp)
li t7, -7662001
mul a7, t6, t7
lw t6, 0(sp)
and t2, t6, t2, 13
and.1 t4, t4, t2, 13
or.1 a6, a6, t3
li t7, 80070378
mul t2, a6, t7
lw t6, 75(sp)
lw t7, 198(sp)
and.1 t6, t6, t7, 13
sw t6, 165(sp)
li t7, -104675126
mul t3, t4, t7
lw t6, 147(sp)
or.T a6, t6, a3
lw t6, 75(sp)
li t7, -184095268
or.T t6, t6, t7
sw t6, 81(sp)
lw t6, 75(sp)
lw t7, 198(sp)
or.1 t6, t6, t7
sw t6, 153(sp)
lw t6, 198(sp)
li t7, -184095268
and.T t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 153(sp)
lw t7, 66(sp)
and.T a3, t6, t7, -13
lw t6, 75(sp)
li t7, -184095268
and.T t6, t6, t7, -13
sw t6, 114(sp)
lw t6, 198(sp)
lw t7, 156(sp)
xor t6, t6, t7
sw t6, 45(sp)
lw t6, 156(sp)
li t7, -184095268
and.T t6, t6, t7, -13
sw t6, 12(sp)
add t2, t2, t3
add t1, t1, t2
add t1, t0, t1
lw t6, 156(sp)
li t7, -184095268
and t6, t6, t7, 13
sw t6, 90(sp)
lw t6, 12(sp)
li t7, -184095268
or.T t0, t6, t7
lw t6, 45(sp)
lw t7, 81(sp)
or.T t2, t6, t7
lw t7, 144(sp)
xor.T a6, a6, t7
lw t6, 156(sp)
lw t7, 165(sp)
or.1 t3, t6, t7
add a4, a4, t1
slli a6, a6, 7
lw t6, 45(sp)
or t1, t6, t3, -13
and a3, t2, a3, 13
lw t6, 6(sp)
xor.T t6, t6, t0
sw t6, 147(sp)
or.T a3, a3, t1
add a7, a7, a6
lw t6, 126(sp)
li t7, -184095268
or a6, t6, t7, -13
lw t6, 147(sp)
li t7, -84636731
mul t6, t6, t7
sw t6, 27(sp)
add a5, a7, a5
lw t6, 156(sp)
li t7, -184095268
or.1 t6, t6, t7
sw t6, 99(sp)
lw t6, 198(sp)
li t7, -184095268
or.T t6, t6, t7
sw t6, 87(sp)
li t7, 28641502
mul t6, a3, t7
sw t6, 0(sp)
lw t6, 75(sp)
lw t7, 156(sp)
xor.1 t6, t6, t7
sw t6, 117(sp)
add a3, a4, a5
lw t6, 156(sp)
li t7, -184095268
or.T t6, t6, t7
sw t6, 108(sp)
lw t6, 21(sp)
add t6, t6, a3
sw t6, 78(sp)
lw t6, 99(sp)
lw t7, 117(sp)
or a4, t6, t7, -13
lw t6, 198(sp)
slli a3, t6, 8
lw t7, 45(sp)
xor.1 a4, a4, t7
lw t7, 153(sp)
or.T a6, a6, t7
lw t6, 90(sp)
lw t7, 87(sp)
xor.T a5, t6, t7
lw t6, 117(sp)
xor.1 a7, t6, a4
li t7, -102062898
mul a5, a5, t7
lw t6, 153(sp)
lw t7, 114(sp)
and.1 t0, t6, t7, 13
lw t6, 156(sp)
lw t7, 198(sp)
xor.T t6, t6, t7
sw t6, 21(sp)
lw t6, 66(sp)
li t7, -184095268
and.1 a4, t6, t7, 13
and.1 a6, a6, a7, 13
li t7, -83248295
mul t6, t0, t7
sw t6, 3(sp)
li t7, 178939602
mul a7, a6, t7
lw t6, 87(sp)
lw t7, 81(sp)
and.1 a6, t6, t7, 13
lw t6, 198(sp)
li t7, -184095268
xor.1 t6, t6, t7
sw t6, 48(sp)
lw t6, 108(sp)
lw t7, 21(sp)
or t0, t6, t7, -13
lw t6, 198(sp)
lw t7, 75(sp)
and.T t6, t6, t7, -13
sw t6, 171(sp)
add a5, a7, a5
add t6, a5, a3
sw t6, 24(sp)
li t7, -171460191
mul a3, t0, t7
lw t6, 156(sp)
lw t7, 171(sp)
or a5, t6, t7, -13
lw t6, 156(sp)
lw t7, 198(sp)
and.1 t6, t6, t7, 13
sw t6, 33(sp)
lw t6, 75(sp)
li t7, -184095268
xor t6, t6, t7
sw t6, 150(sp)
lw t6, 198(sp)
li t7, -184095268
or t6, t6, t7, -13
sw t6, 60(sp)
xor.T a7, a6, a5
lw t6, 6(sp)
lw t7, 165(sp)
xor.1 a6, t6, t7
lw t6, 33(sp)
li t7, -184095268
xor.T t0, t6, t7
lw t6, 156(sp)
li t7, -184095268
or t6, t6, t7, -13
sw t6, 96(sp)
lw t7, 150(sp)
xor a5, a4, t7
lw t6, 75(sp)
lw t7, 87(sp)
and.1 t1, t6, t7, 13
lw t6, 60(sp)
lw t7, 48(sp)
and a4, t6, t7, 13
li t7, -142855435
mul a5, a5, t7
lw t7, 96(sp)
xor t1, t1, t7
lw t6, 156(sp)
and.1 t1, t6, t1, 13
lw t6, 171(sp)
and.T t2, t6, a4, -13
lw t6, 21(sp)
lw t7, 96(sp)
xor.T t3, t6, t7
li t7, -39304729
mul a4, t0, t7
lw t6, 198(sp)
li t7, -184095268
xor.T t6, t6, t7
sw t6, 105(sp)
or.T t0, a7, t3
li t7, 110666860
mul a7, t1, t7
xor.T t0, t2, t0
lw t6, 198(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 102(sp)
lw t6, 198(sp)
lw t7, 75(sp)
and t6, t6, t7, 13
sw t6, 42(sp)
lw t6, 198(sp)
lw t7, 156(sp)
and t6, t6, t7, 13
sw t6, 57(sp)
lw t6, 75(sp)
lw t7, 156(sp)
and.1 t6, t6, t7, 13
sw t6, 120(sp)
lw t6, 198(sp)
lw t7, 156(sp)
xor.1 t6, t6, t7
sw t6, 54(sp)
li t7, 115310481
mul t0, t0, t7
add a7, t0, a7
lw t6, 159(sp)
or.T a6, t6, a6
li t7, -166409360
mul a6, a6, t7
lw t6, 75(sp)
lw t7, 198(sp)
or t6, t6, t7, -13
sw t6, 135(sp)
lw t6, 198(sp)
li t7, -184095268
and.1 t6, t6, t7, 13
sw t6, 138(sp)
lw t6, 75(sp)
lw t7, 156(sp)
or t6, t6, t7, -13
sw t6, 144(sp)
lw t6, 75(sp)
lw t7, 57(sp)
and t0, t6, t7, 13
lw t6, 198(sp)
lw t7, 135(sp)
and.1 t1, t6, t7, 13
li t7, -50679966
mul t1, t1, t7
add a5, a5, a7
lw t6, 156(sp)
lw t7, 198(sp)
or.1 t6, t6, t7
sw t6, 15(sp)
add a3, a3, a5
lw t6, 75(sp)
lw t7, 156(sp)
or.T t6, t6, t7
sw t6, 168(sp)
lw t6, 120(sp)
lw t7, 42(sp)
xor.T a7, t6, t7
lw t6, 3(sp)
add a3, t6, a3
lw t6, 24(sp)
add a5, t6, a3
lw t6, 42(sp)
lw t7, 15(sp)
or a3, t6, t7, -13
lw t6, 135(sp)
or a3, t6, a3, -13
li t7, 43114536
mul t6, a3, t7
sw t6, 24(sp)
add a3, a6, t1
lw t6, 156(sp)
lw t7, 75(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
add a4, a5, a4
lw t6, 0(sp)
add a4, t6, a4
lw t6, 6(sp)
and.T a5, t6, t0, -13
lw t6, 27(sp)
add a4, t6, a4
lw t6, 126(sp)
lw t7, 198(sp)
xor a6, t6, t7
add a4, a4, a3
li t7, -41409206
mul t1, a5, t7
lw t6, 105(sp)
lw t7, 102(sp)
and.T t2, t6, t7, -13
lw t6, 198(sp)
lw t7, 156(sp)
or.T a3, t6, t7
lw t6, 60(sp)
lw t7, 57(sp)
and.1 a5, t6, t7, 13
lw t6, 75(sp)
li t7, -184095268
or t6, t6, t7, -13
sw t6, 69(sp)
lw t6, 144(sp)
lw t7, 69(sp)
or.T t4, t6, t7
lw t6, 168(sp)
lw t7, 42(sp)
or.T t3, t6, t7
lw t6, 48(sp)
lw t7, 3(sp)
and t0, t6, t7, 13
xor.T a7, a7, t4
lw t6, 168(sp)
lw t7, 198(sp)
xor.1 t4, t6, t7
xor a7, t3, a7
add t6, a4, t1
sw t6, 51(sp)
and.T a4, t2, t4, -13
lw t6, 198(sp)
lw t7, 171(sp)
xor.1 t4, t6, t7
lw t6, 138(sp)
lw t7, 60(sp)
xor.1 t1, t6, t7
lw t6, 198(sp)
or.1 t3, t6, a4
lw t6, 135(sp)
lw t7, 54(sp)
and a4, t6, t7, 13
lw t6, 75(sp)
lw t7, 198(sp)
xor.T t6, t6, t7
sw t6, 84(sp)
li t7, 186769754
mul t2, a7, t7
li t7, 137695627
mul a7, t3, t7
lw t6, 66(sp)
li t7, -58611459
mul t3, t6, t7
lw t6, 42(sp)
and.1 a6, t6, a6, 13
lw t6, 156(sp)
li t7, -184095268
and.1 t6, t6, t7, 13
sw t6, 111(sp)
li t7, -184095268
and a6, a6, t7, 13
lw t7, 54(sp)
and t5, t4, t7, 13
li t7, 130764621
mul t4, a6, t7
lw t6, 111(sp)
li t7, 185026309
mul a6, t6, t7
lw t7, 84(sp)
or.1 t0, t0, t7
xor.1 a5, a5, t5
xor.1 a3, a5, a3
li t7, 45378658
mul a5, a3, t7
lw t6, 156(sp)
li t7, -184095268
xor.1 t6, t6, t7
sw t6, 30(sp)
lw t7, 24(sp)
add a3, t4, t7
lw t6, 30(sp)
and t1, t6, t1, 13
add a5, a5, t3
add a5, t2, a5
li t7, 186325632
mul t6, t0, t7
sw t6, 72(sp)
lw t6, 75(sp)
li t7, -184095268
and t6, t6, t7, 13
sw t6, 162(sp)
lw t7, 162(sp)
or t0, t1, t7, -13
add a3, a7, a3
lw t6, 105(sp)
lw t7, 12(sp)
xor.T a7, t6, t7
add t6, a3, a5
sw t6, 174(sp)
li t7, -42875906
mul a7, a7, t7
li t7, -952181
mul a3, t0, t7
lw t6, 75(sp)
li t7, -184095268
or.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 138(sp)
lw t7, 33(sp)
and a5, t6, t7, 13
add a3, a6, a3
lw t6, 171(sp)
lw t7, 102(sp)
and t0, t6, t7, 13
xor.1 a4, a4, a5
lw t6, 75(sp)
lw t7, 198(sp)
or.T t6, t6, t7
sw t6, 24(sp)
lw t6, 198(sp)
li t7, -184095268
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 39(sp)
lw t7, 150(sp)
xor a5, t6, t7
lw t6, 156(sp)
lw t7, 75(sp)
or.1 t6, t6, t7
sw t6, 132(sp)
lw t6, 156(sp)
lw t7, 156(sp)
xor a6, t6, t7
li t7, 63731249
mul t2, a4, t7
lw t6, 156(sp)
li t7, -184095268
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 105(sp)
li t7, -19864470
mul t4, t6, t7
lw t6, 63(sp)
lw t7, 231(sp)
or t1, t6, t7, -13
lw t6, 105(sp)
lw t7, 120(sp)
xor a4, t6, t7
lw t6, 6(sp)
lw t7, 117(sp)
xor t3, t6, t7
add a7, t4, a7
lw t6, 99(sp)
lw t7, 132(sp)
xor t4, t6, t7
lw t7, 0(sp)
or.1 t4, t4, t7
lw t6, 111(sp)
lw t7, 30(sp)
or t5, t6, t7, -13
xor t0, t0, t5
li t7, 157256938
mul t4, t4, t7
add a7, t2, a7
lw t6, 156(sp)
lw t7, 75(sp)
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 198(sp)
lw t7, 24(sp)
and.1 t5, t6, t7, 13
lw t6, 36(sp)
li t7, -74483752
mul t2, t6, t7
add s0, a7, t2
li t7, 14175467
mul a7, t3, t7
xor t2, t0, t1
add t4, s0, t4
lw t6, 75(sp)
li t7, -184095268
and.1 t6, t6, t7, 13
sw t6, 123(sp)
lw t6, 75(sp)
li t7, -184095268
xor.1 t6, t6, t7
sw t6, 27(sp)
xor a5, t5, a5
lw t6, 21(sp)
lw t7, 108(sp)
xor t0, t6, t7
lw t7, 123(sp)
or a6, a6, t7, -13
lw t7, 147(sp)
and a6, a6, t7, 13
lw t6, 156(sp)
li t7, 26936806
mul t1, t6, t7
li t7, -159540767
mul t3, a6, t7
add a3, a3, t4
lw t6, 72(sp)
add a6, t6, a3
lw t6, 129(sp)
lw t7, 42(sp)
or a3, t6, t7, -13
or.1 t2, a5, t2
lw t6, 174(sp)
add a5, t6, a6
li t7, 171376428
mul t4, t2, t7
lw t6, 81(sp)
and.1 t2, t6, a3, 13
li t7, 32460276
mul a3, a4, t7
add a6, a3, a7
lw t6, 75(sp)
lw t7, 231(sp)
or a3, t6, t7, -13
lw t6, 156(sp)
lw t7, 75(sp)
xor.T t6, t6, t7
sw t6, 72(sp)
li t7, 37076123
mul a7, a3, t7
add a4, t3, t1
lw t7, 72(sp)
xor.T t1, t0, t7
lw t6, 3(sp)
lw t7, 198(sp)
or a3, t6, t7, -13
add t0, t4, a4
lw t6, 132(sp)
lw t7, 63(sp)
and.T a4, t6, t7, -13
lw t6, 66(sp)
or t2, t6, t2, -13
lw t6, 111(sp)
li t7, -64353186
mul t6, t6, t7
sw t6, 66(sp)
lw t6, 120(sp)
li t7, -184095268
xor.1 t3, t6, t7
li t7, 44630006
mul t3, t3, t7
lw t6, 24(sp)
and.1 t4, t6, t1, 13
lw t6, 75(sp)
li t7, -184095268
xor.T t1, t6, t7
lw t6, 0(sp)
li t7, 93053696
mul t5, t6, t7
add t3, t3, t5
xor.1 t2, t2, t4
slli t2, t2, 5
add a6, a6, a7
lw t6, 87(sp)
lw t7, 99(sp)
and.1 a7, t6, t7, 13
add a6, t0, a6
add a6, a5, a6
lw t6, 171(sp)
lw t7, 150(sp)
and a5, t6, t7, 13
add t0, t2, t3
add t6, a6, t0
sw t6, 3(sp)
lw t6, 30(sp)
lw t7, 45(sp)
xor t0, t6, t7
or a5, t1, a5, -13
li t7, 42735402
mul a6, a5, t7
lw t6, 75(sp)
lw t7, 0(sp)
xor.1 a5, t6, t7
and a7, t0, a7, 13
li t7, 150307773
mul t1, a7, t7
lw t6, 81(sp)
li t7, 115507845
mul a7, t6, t7
lw t6, 102(sp)
li t7, 140446979
mul t0, t6, t7
add a4, a4, t1
lw t6, 33(sp)
xor.T t1, t6, a3
lw t6, 138(sp)
lw t7, 159(sp)
xor.1 a3, t6, t7
li t7, 4760413
mul t1, t1, t7
li t7, -115807469
mul a5, a5, t7
add a5, a5, t1
lw t6, 75(sp)
lw t7, 150(sp)
or.T t2, t6, t7
lw t6, 102(sp)
li t7, -184095268
or.T t3, t6, t7
lw t6, 168(sp)
lw t7, 156(sp)
or.1 t1, t6, t7
lw t6, 156(sp)
lw t7, 75(sp)
xor t6, t6, t7
sw t6, 120(sp)
lw t6, 120(sp)
and.T t4, t6, a3, -13
add a3, a4, a6
li t7, 53040026
mul a6, t4, t7
lw t7, 30(sp)
or.T t3, t3, t7
li t7, 5094751
mul t2, t2, t7
add a4, a3, a7
add t0, t2, t0
lw t6, 57(sp)
li t7, 8394941
mul a3, t6, t7
lw t6, 66(sp)
add a4, t6, a4
li t7, 26078909
mul a7, t3, t7
lw t6, 87(sp)
li t7, -185269734
mul t2, t6, t7
add a7, a7, t2
li t7, -116166937
mul t1, t1, t7
add t0, t0, a6
lw t6, 135(sp)
lw t7, 132(sp)
xor.1 t3, t6, t7
lw t6, 84(sp)
li t7, 48999260
mul a6, t6, t7
add t2, a5, t0
lw t6, 231(sp)
lw t7, 198(sp)
and t0, t6, t7, 13
lw t6, 168(sp)
lw t7, 54(sp)
and.T t6, t6, t7, -13
sw t6, 84(sp)
lw t6, 111(sp)
lw t7, 114(sp)
and t4, t6, t7, 13
lw t6, 33(sp)
lw t7, 156(sp)
xor a5, t6, t7
li t7, -129664274
mul t5, t4, t7
li t7, -27645404
mul t0, t0, t7
lw t6, 156(sp)
lw t7, 198(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
li t7, -97020990
mul t3, t3, t7
lw t6, 90(sp)
lw t7, 24(sp)
xor.T s0, t6, t7
lw t6, 198(sp)
lw t7, 0(sp)
xor.T s1, t6, t7
lw t6, 150(sp)
lw t7, 30(sp)
xor.T t4, t6, t7
lw t7, 33(sp)
xor s2, s0, t7
add s0, a6, t5
li t7, -157746090
mul a6, s2, t7
lw t6, 57(sp)
lw t7, 24(sp)
or s2, t6, t7, -13
li t7, 191464900
mul t5, s1, t7
li t7, 44282344
mul s1, s2, t7
add t1, t1, s1
add t1, a7, t1
lw t6, 48(sp)
li t7, 120975440
mul a7, t6, t7
add t3, s0, t3
add s0, t2, t1
lw t6, 66(sp)
li t7, 112780035
mul t1, t6, t7
lw t6, 66(sp)
xor.1 t2, t6, t4
add a7, t5, a7
add a3, s0, a3
add a4, a4, a3
lw t6, 198(sp)
li t7, -184095268
or.1 t6, t6, t7
sw t6, 90(sp)
li t7, 106357744
mul a3, t2, t7
add t0, t3, t0
lw t6, 3(sp)
add a4, t6, a4
add a4, a4, t0
lw t6, 51(sp)
add t6, t6, a4
sw t6, 24(sp)
li t7, 34336878
mul a5, a5, t7
li t7, -157961178
add t0, a3, t7
lw t6, 111(sp)
li t7, 90747189
mul a4, t6, t7
add a5, t1, a5
lw t6, 21(sp)
ori a3, t6, 0
add t0, a6, t0
lw t6, 96(sp)
lw t7, 90(sp)
xor a6, t6, t7
add t6, t0, a7
sw t6, 21(sp)
lw t6, 84(sp)
li t7, 16058778
mul a7, t6, t7
lw t6, 165(sp)
xor.1 a6, t6, a6
lw t7, 156(sp)
xor.T a6, a6, t7
add t6, a5, a7
sw t6, 51(sp)
lw t6, 30(sp)
lw t7, 6(sp)
and.1 a7, t6, t7, 13
li t7, 183683406
mul t0, a6, t7
lw t6, 0(sp)
lw t7, 42(sp)
and.1 a5, t6, t7, 13
lw t6, 117(sp)
lw t7, 162(sp)
and t1, t6, t7, 13
lw t6, 87(sp)
lw t7, 75(sp)
xor.1 a6, t6, t7
lw t6, 81(sp)
lw t7, 231(sp)
and t2, t6, t7, 13
li t7, -53981289
mul a5, a5, t7
li t7, 137631259
mul t2, t2, t7
add a4, t2, a4
add t0, t0, a4
lw t6, 144(sp)
xor.1 t1, t6, t1
and a4, a3, a7, 13
lw t6, 111(sp)
li t7, 127514907
mul a7, t6, t7
li t7, -19881415
mul t2, t1, t7
lw t6, 198(sp)
li t7, -60344139
mul t1, t6, t7
lw t6, 153(sp)
lw t7, 198(sp)
or.T a3, t6, t7
add t0, t0, t2
lw t6, 231(sp)
lw t7, 75(sp)
and t6, t6, t7, 13
sw t6, 3(sp)
add t0, t0, t1
lw t7, 6(sp)
xor.T t1, a6, t7
li t7, -81397848
mul a4, a4, t7
add a6, a7, a4
lw t6, 3(sp)
li t7, -88084658
mul a4, t6, t7
add a4, t0, a4
li t7, 183588469
mul a7, t1, t7
add a5, a5, a7
lw t6, 60(sp)
lw t7, 105(sp)
xor.1 a7, t6, t7
xor a3, a7, a3
li t7, 88689305
mul a7, a3, t7
lw t6, 135(sp)
li t7, -110038814
mul t0, t6, t7
lw t6, 15(sp)
lw t7, 90(sp)
xor a3, t6, t7
add a7, a7, t0
add a5, a5, a7
add a6, a6, a5
lw t6, 75(sp)
lw t7, 144(sp)
xor.1 a7, t6, t7
lw t6, 105(sp)
lw t7, 108(sp)
or.1 a5, t6, t7
lw t6, 138(sp)
xor t1, t6, a7
lw t6, 156(sp)
li t7, -184095268
xor.T t2, t6, t7
lw t6, 69(sp)
lw t7, 66(sp)
or t0, t6, t7, -13
lw t6, 90(sp)
lw t7, 171(sp)
xor a7, t6, t7
lw t6, 120(sp)
or.T t2, t6, t2
xor.1 a3, a3, t1
lw t7, 57(sp)
or.T t1, t2, t7
li t7, 123673368
mul t2, t1, t7
lw t6, 126(sp)
lw t7, 117(sp)
xor.1 t1, t6, t7
xor.T t3, t0, a5
lw t6, 72(sp)
lw t7, 48(sp)
or.T a5, t6, t7
li t7, -70481209
mul t0, a3, t7
li t7, -167754745
mul a3, t3, t7
add a3, a3, t2
li t7, 89629145
mul a5, a5, t7
or a7, t1, a7, -13
li t7, -123156342
mul a7, a7, t7
add a6, a6, t0
add a4, a4, a6
lw t6, 51(sp)
add a6, t6, a4
lw t6, 120(sp)
lw t7, 45(sp)
and a4, t6, t7, 13
lw t6, 21(sp)
add a6, t6, a6
lw t6, 24(sp)
add t6, t6, a6
sw t6, 6(sp)
lw t6, 156(sp)
li t7, 184095268
and a6, t6, t7, 13
li t7, -136494661
mul a6, a6, t7
lw t6, 198(sp)
lw t7, 108(sp)
and.1 t0, t6, t7, 13
add a6, a7, a6
lw t6, 99(sp)
li t7, 181701671
mul a7, t6, t7
xor.1 t1, a4, t0
lw t6, 63(sp)
lw t7, 123(sp)
xor.1 a4, t6, t7
lw t7, 69(sp)
or.T t2, a4, t7
lw t6, 45(sp)
li t7, -65593196
mul t0, t6, t7
lw t6, 36(sp)
lw t7, 30(sp)
or a4, t6, t7, -13
li t7, 4709835
mul t1, t1, t7
add t3, t1, a7
lw t6, 15(sp)
and.T t1, t6, t2, -13
lw t6, 81(sp)
li t7, 184095268
xor a7, t6, t7
add a5, a5, t3
lw t7, 102(sp)
and.1 a4, a4, t7, 13
li t7, -27776674
mul t1, t1, t7
lw t6, 96(sp)
lw t7, 63(sp)
xor t2, t6, t7
li t7, -38768326
mul t2, t2, t7
li t7, 146797853
mul a4, a4, t7
add t0, t0, t2
add t0, t1, t0
add a5, a5, t0
add a5, a6, a5
add a3, a3, a5
lw t6, 114(sp)
li t7, -184095268
and a5, t6, t7, 13
lw t7, 3(sp)
and.T a5, a5, t7, -13
lw t6, 12(sp)
li t7, 145457957
mul a6, t6, t7
lw t6, 96(sp)
xor.T t0, t6, a7
lw t6, 0(sp)
lw t7, 42(sp)
or.T a7, t6, t7
xor.1 t0, a5, t0
lw t6, 66(sp)
li t7, -184095268
or.1 a5, t6, t7
lw t6, 198(sp)
lw t7, 171(sp)
xor t1, t6, t7
li t7, 89746040
mul a5, a5, t7
lw t6, 66(sp)
or t1, t6, t1, -13
and t0, t0, t1, 13
li t7, 151058566
mul t0, t0, t7
add t0, t0, a6
li t7, -131202442
mul a7, a7, t7
lw t6, 27(sp)
lw t7, 54(sp)
or.1 a6, t6, t7
add a4, a4, t0
add a3, a3, a4
add a3, a3, a7
lw t6, 162(sp)
li t7, 177315930
mul a4, t6, t7
li t7, 33171178
mul a6, a6, t7
add a6, a6, a5
lw t6, 33(sp)
li t7, -184095268
or.T a5, t6, t7
lw t6, 48(sp)
lw t7, 54(sp)
and.1 a7, t6, t7, 13
and a5, a7, a5, 13
li t7, -156981921
mul a7, a5, t7
lw t6, 114(sp)
li t7, -40440291
mul t0, t6, t7
lw t6, 33(sp)
li t7, 191892192
mul a5, t6, t7
add t0, a7, t0
lw t6, 90(sp)
li t7, -112153705
mul a7, t6, t7
add a4, a4, t0
add a6, a6, a4
lw t6, 54(sp)
li t7, 159586910
mul a4, t6, t7
lw t6, 198(sp)
lw t7, 75(sp)
xor.1 t0, t6, t7
lw t6, 132(sp)
or t0, t6, t0, -13
lw t7, 27(sp)
or.T t0, t0, t7
li t7, 35898722
mul t1, t0, t7
lw t6, 39(sp)
li t7, -184095268
or.T t0, t6, t7
add a7, a7, t1
add a7, a5, a7
li t7, -184095268
xor.1 a5, t0, t7
li t7, 152078205
mul a5, a5, t7
add a6, a6, a7
add a3, a3, a6
lw t6, 33(sp)
lw t7, 66(sp)
xor.T a6, t6, t7
lw t7, 75(sp)
xor.T a6, a6, t7
li t7, 192764456
mul a6, a6, t7
add a4, a4, a6
add a4, a5, a4
lw t6, 186(sp)
lw t7, 186(sp)
xor t6, t6, t7
sw t6, 132(sp)
add a3, a3, a4
lw t6, 93(sp)
li t7, 190135924
or.T t6, t6, t7
sw t6, 33(sp)
lw t6, 6(sp)
add t6, t6, a3
sw t6, 171(sp)
lw t6, 171(sp)
lw t7, 171(sp)
xor t6, t6, t7
sw t6, 162(sp)
lw t6, 78(sp)
lw t7, 171(sp)
xor t6, t6, t7
sw t6, 3(sp)
lw t6, 3(sp)
lw t7, 186(sp)
xor a4, t6, t7
lw t6, 3(sp)
lw t7, 3(sp)
xor t6, t6, t7
sw t6, 201(sp)
li t7, 41283645
xor a3, a4, t7
lw t6, 93(sp)
li t7, 190135924
xor.T t6, t6, t7
sw t6, 174(sp)
li t7, 190135924
and.1 t6, a4, t7, 13
sw t6, 24(sp)
and.1 t6, a4, a3, 13
sw t6, 123(sp)
li t7, 190135924
xor.1 t6, a4, t7
sw t6, 15(sp)
lw t6, 174(sp)
lw t7, 33(sp)
or a6, t6, t7, -13
lw t6, 93(sp)
and.1 t6, t6, a3, 13
sw t6, 129(sp)
lw t7, 15(sp)
or.1 t6, a4, t7
sw t6, 39(sp)
li t7, -100273310
mul a5, a4, t7
li t7, 190135924
or t6, a4, t7, -13
sw t6, 21(sp)
lw t7, 21(sp)
xor.1 t0, a4, t7
xor.T t6, a4, a3
sw t6, 45(sp)
ori a7, a3, 0
lw t6, 93(sp)
xor.T t6, t6, a4
sw t6, 189(sp)
slli t1, t0, 1
li t7, 190135924
and.1 t6, a3, t7, 13
sw t6, 87(sp)
lw t6, 45(sp)
and t3, t6, a3, 13
lw t6, 189(sp)
lw t7, 24(sp)
xor.T t2, t6, t7
lw t6, 87(sp)
lw t7, 129(sp)
and.T t0, t6, t7, -13
lw t6, 33(sp)
and t3, t6, t3, 13
lw t6, 39(sp)
li t7, 176976768
mul t4, t6, t7
lw t6, 93(sp)
or t6, t6, a3, -13
sw t6, 6(sp)
lw t6, 93(sp)
xor t6, t6, a3
sw t6, 126(sp)
and.T a6, t3, a6, -13
li t7, 190135924
or.T t3, a3, t7
li t7, -51886394
mul t5, t0, t7
or t6, a3, a4, -13
sw t6, 114(sp)
li t7, 140683688
mul t0, a6, t7
add a6, t4, t5
lw t6, 126(sp)
lw t7, 123(sp)
xor.T t4, t6, t7
lw t6, 6(sp)
lw t7, 114(sp)
and t5, t6, t7, 13
add t6, a6, t1
sw t6, 30(sp)
li t7, -156059253
mul a6, t2, t7
li t7, 190135924
and t6, a4, t7, 13
sw t6, 54(sp)
and a7, a7, t5, 13
slli t2, a7, 6
li t7, 131210809
mul t3, t3, t7
lw t7, 93(sp)
xor.1 t6, a3, t7
sw t6, 156(sp)
lw t7, 54(sp)
and.1 t1, a3, t7, 13
li t7, -55568439
mul a7, t4, t7
lw t6, 93(sp)
and.T t6, t6, a3, -13
sw t6, 138(sp)
lw t7, 93(sp)
and.1 t6, a4, t7, 13
sw t6, 66(sp)
and.T t6, a3, a4, -13
sw t6, 81(sp)
add t6, t2, a5
sw t6, 36(sp)
lw t6, 93(sp)
lw t7, 174(sp)
xor t2, t6, t7
xor t6, a4, a4
sw t6, 150(sp)
lw t6, 93(sp)
li t7, 190135924
or t6, t6, t7, -13
sw t6, 48(sp)
add t6, t0, t3
sw t6, 42(sp)
lw t6, 66(sp)
li t7, 190135924
or a5, t6, t7, -13
lw t7, 81(sp)
and t0, a4, t7, 13
or.T t3, t0, t1
lw t6, 93(sp)
xor t6, t6, a4
sw t6, 84(sp)
li t7, -33777053
mul a5, a5, t7
lw t6, 93(sp)
and t6, t6, a4, 13
sw t6, 135(sp)
lw t6, 93(sp)
lw t7, 24(sp)
and.T t1, t6, t7, -13
lw t6, 156(sp)
lw t7, 138(sp)
or t0, t6, t7, -13
li t7, 162320213
mul t3, t3, t7
add a7, t3, a7
li t7, 190135924
xor t3, a3, t7
li t7, -105417335
mul t2, t2, t7
add a7, a6, a7
lw t6, 21(sp)
lw t7, 87(sp)
or t5, t6, t7, -13
xor s0, t0, a3
li t7, 190135924
xor t6, a4, t7
sw t6, 99(sp)
lw t6, 93(sp)
lw t7, 84(sp)
xor.T t0, t6, t7
lw t6, 24(sp)
lw t7, 150(sp)
and.T s1, t6, t7, -13
lw t6, 48(sp)
lw t7, 93(sp)
and.T t4, t6, t7, -13
lw t6, 93(sp)
or.T t6, t6, a4
sw t6, 12(sp)
lw t6, 93(sp)
li t7, 190135924
and.T t6, t6, t7, -13
sw t6, 0(sp)
li t7, -158184760
mul a6, a4, t7
lw t7, 135(sp)
or.1 t3, t3, t7
or.1 s2, t3, t5
xor.1 s0, s0, s1
lw t6, 93(sp)
lw t7, 54(sp)
or.T t3, t6, t7
and t6, a3, a4, 13
sw t6, 27(sp)
lw t7, 138(sp)
xor t5, t1, t7
li t7, 49715291
mul t1, s2, t7
lw t6, 99(sp)
lw t7, 0(sp)
xor.1 s1, t6, t7
or.T s1, s1, t4
li t7, -190235170
mul s0, s0, t7
add t4, t2, t1
li t7, 144453294
mul t1, s1, t7
lw t6, 93(sp)
li t7, 190135924
and t6, t6, t7, 13
sw t6, 177(sp)
add s0, a7, s0
lw t6, 48(sp)
and t2, t6, t5, 13
lw t6, 177(sp)
lw t7, 93(sp)
and.T t5, t6, t7, -13
lw t7, 24(sp)
xor.1 t0, t0, t7
lw t6, 6(sp)
li t7, 125198378
mul a7, t6, t7
li t7, -93755509
mul t2, t2, t7
add t2, a5, t2
lw t6, 36(sp)
add a5, t6, s0
lw t6, 42(sp)
add s0, t6, a5
lw t7, 9(sp)
xor.1 a5, t3, t7
li t7, 20623326
mul t5, t5, t7
li t7, 127836125
mul t3, t0, t7
lw t6, 30(sp)
add s0, t6, s0
lw t7, 93(sp)
or.T t6, a3, t7
sw t6, 75(sp)
li t7, -94177087
mul t0, a5, t7
add a5, a6, t5
add t6, s0, t4
sw t6, 30(sp)
lw t6, 93(sp)
li t7, 190135924
xor t6, t6, t7
sw t6, 117(sp)
lw t6, 93(sp)
xor.T t6, t6, a3
sw t6, 159(sp)
lw t6, 21(sp)
lw t7, 75(sp)
xor.T a6, t6, t7
li t7, -115043280
mul t5, a6, t7
li t7, 190135924
or t6, a3, t7, -13
sw t6, 183(sp)
lw t6, 117(sp)
lw t7, 75(sp)
xor.1 a6, t6, t7
add s0, t3, t1
li t7, 190135924
xor.T t1, a4, t7
lw t6, 177(sp)
lw t7, 159(sp)
and.T t4, t6, t7, -13
lw t6, 174(sp)
li t7, 134497467
mul t3, t6, t7
lw t6, 189(sp)
xor.1 s1, t6, a4
lw t7, 27(sp)
xor.1 s2, t4, t7
lw t6, 27(sp)
lw t7, 33(sp)
or.1 t4, t6, t7
add t6, t2, s0
sw t6, 6(sp)
add t2, a7, t5
and.1 a7, s1, t1, 13
lw t6, 12(sp)
or t5, t6, s2, -13
li t7, -50446837
add t1, t2, t7
li t7, -172239631
mul a6, a6, t7
lw t7, 93(sp)
and.T t6, a4, t7, -13
sw t6, 111(sp)
lw t6, 231(sp)
li t7, 190135924
or.1 t2, t6, t7
li t7, -192727406
mul t5, t5, t7
li t7, 190135924
and.T s0, a3, t7, -13
lw t6, 183(sp)
lw t7, 174(sp)
or.T s1, t6, t7
add t0, t0, a6
li t7, 108968018
mul a7, a7, t7
li t7, 190135924
xor.T t6, a3, t7
sw t6, 105(sp)
li t7, -61094016
mul s1, s1, t7
li t7, 114476622
mul a6, s0, t7
add a7, a7, t3
li t7, -81465246
mul t3, t4, t7
add a5, a5, s1
lw t7, 93(sp)
or.1 t6, a4, t7
sw t6, 60(sp)
add a5, t5, a5
li t7, 190135924
and t6, a3, t7, 13
sw t6, 144(sp)
lw t6, 93(sp)
li t7, 190135924
or.1 t6, t6, t7
sw t6, 165(sp)
li t7, 190135924
or.1 t6, a3, t7
sw t6, 63(sp)
li t7, 114837641
mul t6, t2, t7
sw t6, 51(sp)
lw t6, 93(sp)
and t6, t6, a3, 13
sw t6, 180(sp)
add a5, a5, t1
lw t6, 75(sp)
lw t7, 60(sp)
and.1 t1, t6, t7, 13
lw t7, 111(sp)
xor.T t1, t1, t7
li t7, 163615235
mul t4, t1, t7
lw t6, 111(sp)
lw t7, 63(sp)
xor.T t1, t6, t7
lw t6, 27(sp)
lw t7, 159(sp)
or.T t2, t6, t7
add t6, t3, t4
sw t6, 36(sp)
or.1 t6, a4, a3
sw t6, 120(sp)
add a5, a5, t0
xor t6, a4, a3
sw t6, 108(sp)
lw t6, 75(sp)
lw t7, 108(sp)
and.1 t0, t6, t7, 13
lw t7, 180(sp)
and t3, t1, t7, 13
lw t6, 93(sp)
xor.1 t6, t6, a4
sw t6, 69(sp)
lw t6, 105(sp)
lw t7, 144(sp)
and.T t4, t6, t7, -13
lw t6, 120(sp)
lw t7, 180(sp)
and t1, t6, t7, 13
li t7, 148400355
mul t3, t3, t7
li t7, -26059448
mul t4, t4, t7
add a7, a5, a7
lw t6, 108(sp)
slli t5, t6, 7
li t7, 145416527
mul a5, t1, t7
add t1, a6, t3
lw t6, 165(sp)
lw t7, 54(sp)
or.1 t3, t6, t7
lw t6, 111(sp)
li t7, -77212375
mul t6, t6, t7
sw t6, 147(sp)
lw t6, 6(sp)
add t6, t6, a7
sw t6, 102(sp)
lw t6, 159(sp)
xor.T a7, t6, t0
li t7, -47424930
mul a6, t2, t7
lw t6, 174(sp)
or.T t0, t6, t3
li t7, -67342679
mul a7, a7, t7
lw t6, 15(sp)
lw t7, 81(sp)
or.T t2, t6, t7
lw t7, 114(sp)
xor.1 t3, a4, t7
li t7, 77740889
mul s0, t0, t7
lw t6, 69(sp)
li t7, 142528722
mul t0, t6, t7
add s0, s0, t5
lw t6, 105(sp)
lw t7, 69(sp)
or.T t5, t6, t7
lw t6, 150(sp)
li t7, 190135924
or t6, t6, t7, -13
sw t6, 96(sp)
lw t6, 135(sp)
li t7, -165075308
mul t6, t6, t7
sw t6, 6(sp)
add s1, t4, s0
lw t6, 177(sp)
lw t7, 105(sp)
xor s0, t6, t7
lw t6, 39(sp)
lw t7, 93(sp)
and.1 s2, t6, t7, 13
lw t6, 93(sp)
li t7, 190135924
xor.1 t6, t6, t7
sw t6, 42(sp)
lw t6, 69(sp)
xor t4, t6, a4
add a6, s1, a6
add s1, a5, a6
li t7, -88954890
mul s3, t5, t7
li t7, 135255024
mul s0, s0, t7
lw t6, 183(sp)
or.1 t5, t6, s2
lw t6, 42(sp)
lw t7, 60(sp)
xor.1 a5, t6, t7
lw t6, 129(sp)
li t7, -79737890
mul a6, t6, t7
li t7, -1492807
mul a5, a5, t7
lw t7, 51(sp)
add s3, s3, t7
add s4, t1, s1
lw t6, 39(sp)
li t7, 190135924
or s2, t6, t7, -13
li t7, 190135924
and.1 s1, t4, t7, 13
lw t6, 63(sp)
lw t7, 33(sp)
or t4, t6, t7, -13
lw t6, 123(sp)
li t7, -114983127
mul t1, t6, t7
lw t6, 39(sp)
li t7, 190135924
xor.T t6, t6, t7
sw t6, 57(sp)
and.1 t3, t2, t3, 13
lw t6, 93(sp)
or t6, t6, a4, -13
sw t6, 168(sp)
lw t6, 168(sp)
lw t7, 12(sp)
xor t2, t6, t7
lw t6, 36(sp)
add t6, t6, s4
sw t6, 72(sp)
add s5, a7, s3
li t7, -27476683
mul a7, t3, t7
lw t6, 117(sp)
lw t7, 84(sp)
and.1 s3, t6, t7, 13
lw t6, 123(sp)
lw t7, 168(sp)
or.1 s4, t6, t7
add t0, t0, s5
add t6, t0, s0
sw t6, 153(sp)
lw t6, 93(sp)
li t7, 190135924
and.1 t6, t6, t7, 13
sw t6, 90(sp)
xor t3, s2, t5
li t7, 190135924
xor.1 t6, a3, t7
sw t6, 51(sp)
lw t6, 63(sp)
lw t7, 114(sp)
xor t0, t6, t7
li t7, 156883097
mul s0, s1, t7
lw t6, 120(sp)
li t7, 190135924
and t5, t6, t7, 13
li t7, -18902079
mul s1, s4, t7
xor.1 t5, s3, t5
lw t6, 93(sp)
li t7, 18486186
mul t6, t6, t7
sw t6, 36(sp)
lw t6, 135(sp)
li t7, 190135924
xor.T t6, t6, t7
sw t6, 114(sp)
lw t7, 147(sp)
add s0, s0, t7
lw t6, 90(sp)
or t4, t6, t4, -13
lw t7, 6(sp)
add s1, s1, t7
li t7, -73116190
mul s2, t3, t7
lw t6, 168(sp)
lw t7, 180(sp)
or.T t3, t6, t7
add t1, s2, t1
and.T t2, t2, t5, -13
add a6, s0, a6
add a6, a7, a6
add a6, a6, s1
add a5, a5, a6
lw t6, 96(sp)
lw t7, 180(sp)
and a7, t6, t7, 13
lw t7, 231(sp)
and a6, t4, t7, 13
xor.1 t6, a4, a3
sw t6, 96(sp)
or.T t5, t2, a7
lw t6, 81(sp)
lw t7, 96(sp)
xor a7, t6, t7
lw t7, 12(sp)
and.T t0, t0, t7, -13
lw t6, 144(sp)
and t2, t6, t3, 13
xor.1 t0, t0, t2
lw t6, 81(sp)
lw t7, 183(sp)
or.1 t2, t6, t7
lw t6, 168(sp)
lw t7, 138(sp)
and.T t4, t6, t7, -13
li t7, 156524027
mul t3, t5, t7
li t7, 61138299
mul t0, t0, t7
li t7, 14478356
mul a6, a6, t7
add a6, a6, t3
add t5, t1, a6
lw t6, 135(sp)
lw t7, 144(sp)
and t1, t6, t7, 13
lw t6, 138(sp)
li t7, 68102144
mul a6, t6, t7
li t7, -103129924
mul t3, t1, t7
lw t6, 93(sp)
lw t7, 108(sp)
xor t1, t6, t7
lw t7, 60(sp)
xor.1 t4, t4, t7
xor.1 t4, a7, t4
lw t6, 144(sp)
li t7, 190135924
and.1 t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 123(sp)
xor t2, t6, t2
add a7, a5, t5
li t7, -161255274
mul a5, t2, t7
lw t6, 168(sp)
lw t7, 90(sp)
or.1 t2, t6, t7
li t7, 143469498
mul t4, t4, t7
add t0, t0, t4
li t7, -71231877
mul t2, t2, t7
add a5, t3, a5
lw t6, 153(sp)
add a7, t6, a7
lw t7, 108(sp)
or.T t5, t1, t7
lw t6, 93(sp)
li t7, -161637521
mul t4, t6, t7
add a6, t0, a6
lw t6, 72(sp)
add t0, t6, a7
lw t7, 36(sp)
add t3, a6, t7
lw t6, 0(sp)
li t7, -129262791
mul a7, t6, t7
lw t6, 144(sp)
lw t7, 120(sp)
xor.T a6, t6, t7
lw t6, 57(sp)
lw t7, 105(sp)
and.1 s2, t6, t7, 13
lw t6, 231(sp)
lw t7, 51(sp)
or t1, t6, t7, -13
li t7, 53351758
mul s0, t5, t7
lw t6, 111(sp)
li t7, 190135924
or.T t5, t6, t7
add s1, a5, t4
lw t6, 12(sp)
lw t7, 159(sp)
xor a5, t6, t7
li t7, -99212950
mul t4, t5, t7
li t7, 61098967
mul s3, s2, t7
lw t6, 15(sp)
li t7, 190135924
or.T t5, t6, t7
lw t6, 177(sp)
lw t7, 39(sp)
and.T s2, t6, t7, -13
add s0, s0, s3
add t2, t2, s0
add s0, s1, t2
lw t6, 42(sp)
lw t7, 24(sp)
or t2, t6, t7, -13
add t3, t3, s0
lw t6, 63(sp)
and.T s1, t6, s2, -13
lw t6, 60(sp)
lw t7, 54(sp)
xor s0, t6, t7
lw t6, 87(sp)
and.1 s1, t6, s1, 13
lw t6, 114(sp)
or.T s1, t6, s1
li t7, 46082581
mul s1, s1, t7
add t0, t0, t3
lw t6, 99(sp)
lw t7, 129(sp)
and.T t6, t6, t7, -13
sw t6, 36(sp)
li t7, -168585152
mul t2, t2, t7
add t3, t4, s1
li t7, -40907267
mul t6, t5, t7
sw t6, 42(sp)
lw t6, 6(sp)
or t5, t6, a3, -13
lw t6, 159(sp)
lw t7, 90(sp)
xor.1 t4, t6, t7
add t3, t3, a7
lw t6, 156(sp)
or.T a7, t6, t1
xor.1 a7, t5, a7
lw t7, 174(sp)
and.1 t5, s0, t7, 13
lw t6, 69(sp)
or.T t1, t6, a3
lw t6, 60(sp)
lw t7, 63(sp)
or s0, t6, t7, -13
and.T a6, t4, a6, -13
li t7, 190135924
or.T s0, s0, t7
or a7, a7, a6, -13
lw t6, 45(sp)
li t7, -13300103
mul a6, t6, t7
lw t6, 51(sp)
li t7, 190135924
or t4, t6, t7, -13
li t7, 9071850
mul s1, a7, t7
li t7, 116142252
mul a7, s0, t7
xor.1 s0, a5, t5
add a5, t2, s1
lw t6, 69(sp)
lw t7, 168(sp)
and t5, t6, t7, 13
lw t6, 159(sp)
lw t7, 33(sp)
and t2, t6, t7, 13
lw t6, 180(sp)
lw t7, 81(sp)
xor s1, t6, t7
lw t6, 108(sp)
xor t5, t6, t5
add s2, t3, a5
lw t6, 54(sp)
lw t7, 63(sp)
or.1 t3, t6, t7
lw t7, 66(sp)
xor.1 a5, s1, t7
li t7, 122032662
mul t3, t3, t7
add s1, t0, s2
lw t6, 156(sp)
li t7, 190135924
xor.T t0, t6, t7
or.T t0, t2, t0
or.1 t2, s0, t4
lw t6, 102(sp)
add t4, t6, s1
lw t6, 30(sp)
add t6, t6, t4
sw t6, 6(sp)
li t7, 137439927
mul t2, t2, t7
lw t6, 96(sp)
lw t7, 93(sp)
or.1 t4, t6, t7
li t7, -8347584
mul t0, t0, t7
lw t7, 90(sp)
xor.T t1, t1, t7
li t7, -81004744
mul s0, t4, t7
ori t5, t5, 0
lw t6, 45(sp)
and.1 s2, t6, a3, 13
lw t6, 66(sp)
li t7, 142372863
mul t4, t6, t7
lw t6, 177(sp)
lw t7, 150(sp)
and.T s3, t6, t7, -13
add t4, t4, t0
lw t6, 36(sp)
li t7, -51509186
mul s1, t6, t7
lw t6, 93(sp)
lw t7, 60(sp)
xor.1 t0, t6, t7
and s2, s3, s2, 13
add s0, s0, t3
li t7, 27906797
mul t3, t5, t7
add t3, a6, t3
lw t7, 144(sp)
xor.1 a6, a3, t7
li t7, 143142106
mul t5, s2, t7
add t3, a7, t3
add a7, t5, s1
add t4, s0, t4
lw t6, 12(sp)
xor.1 t5, t6, a6
lw t6, 60(sp)
lw t7, 144(sp)
and.1 s0, t6, t7, 13
lw t6, 96(sp)
lw t7, 93(sp)
and.1 a6, t6, t7, 13
xor a5, t1, a5
li t7, 181943168
mul a5, a5, t7
add t1, t2, t3
add t2, a5, t4
li t7, -192014517
mul t3, t5, t7
lw t7, 33(sp)
and.T a5, s0, t7, -13
li t7, 190989627
mul a5, a5, t7
li t7, -7021855
add t3, t3, t7
lw t6, 42(sp)
add t2, t6, t2
add t2, t1, t2
li t7, 190135924
and.T a4, a4, t7, -13
lw t6, 156(sp)
lw t7, 84(sp)
or.T t1, t6, t7
add t3, t3, a7
lw t6, 183(sp)
xor a7, t6, a4
add t6, t2, t3
sw t6, 33(sp)
lw t7, 15(sp)
or.1 t0, t0, t7
li t7, -166119525
mul t2, t0, t7
lw t6, 39(sp)
or.T a6, t6, a6
li t7, -153650582
mul a6, a6, t7
li t7, -164252333
mul t0, a7, t7
add a6, t2, a6
lw t6, 189(sp)
li t7, 190135924
and a7, t6, t7, 13
add a6, a5, a6
lw t7, 90(sp)
xor.1 t2, a7, t7
lw t6, 156(sp)
lw t7, 117(sp)
and.T a5, t6, t7, -13
xor t6, a3, a3
sw t6, 189(sp)
lw t6, 177(sp)
lw t7, 63(sp)
xor.1 a7, t6, t7
and t3, a5, a7, 13
lw t6, 105(sp)
li t7, -48637800
mul a7, t6, t7
lw t6, 174(sp)
lw t7, 66(sp)
and.T a5, t6, t7, -13
lw t6, 177(sp)
lw t7, 129(sp)
xor.1 s0, t6, t7
lw t6, 93(sp)
lw t7, 54(sp)
and t5, t6, t7, 13
lw t6, 93(sp)
or.1 t4, t6, a3
xor.T s0, a5, s0
lw t6, 165(sp)
xor.1 a5, t6, t4
or t5, t1, t5, -13
add t1, t0, s0
lw t6, 15(sp)
li t7, -149322476
mul t0, t6, t7
xor t2, t2, t5
li t7, -183648079
mul t5, t2, t7
li t7, -45097716
mul t3, t3, t7
lw t7, 168(sp)
and.T t2, t4, t7, -13
add t3, t5, t3
add t3, t3, t0
lw t6, 24(sp)
xor.1 t0, t6, a4
lw t6, 120(sp)
lw t7, 0(sp)
xor.1 t4, t6, t7
add a4, t1, t3
lw t6, 189(sp)
li t7, -20874698
mul t1, t6, t7
lw t7, 93(sp)
xor t3, t4, t7
xor.1 t2, t2, t3
li t7, -47531171
mul t2, t2, t7
add a4, a6, a4
lw t6, 180(sp)
lw t7, 75(sp)
xor t3, t6, t7
add a6, t1, a7
lw t6, 168(sp)
li t7, -49049183
mul t6, t6, t7
sw t6, 42(sp)
li t7, -67421659
mul a7, t0, t7
add t0, t2, a7
lw t6, 129(sp)
lw t7, 117(sp)
xor a7, t6, t7
lw t6, 9(sp)
xor.T t2, t6, t3
lw t7, 48(sp)
or.1 t1, a7, t7
li t7, -189507497
mul a7, t2, t7
add t2, a6, t0
lw t6, 27(sp)
li t7, 190135924
xor.T t3, t6, t7
lw t6, 87(sp)
lw t7, 177(sp)
xor.T t0, t6, t7
li t7, -158859694
mul a6, t1, t7
xor a5, t3, a5
add t6, a4, t2
sw t6, 0(sp)
lw t6, 120(sp)
li t7, 157506674
mul a4, t6, t7
add t1, a4, a7
li t7, -181526737
mul a4, t0, t7
lw t6, 60(sp)
lw t7, 63(sp)
xor.T t2, t6, t7
lw t7, 126(sp)
xor a7, a3, t7
li t7, 101583606
mul t0, a5, t7
add t1, a6, t1
lw t6, 51(sp)
xor.T a6, t6, t2
li t7, -102144892
and.T t6, a3, t7, -13
sw t6, 123(sp)
lw t6, 21(sp)
lw t7, 129(sp)
and.T a5, t6, t7, -13
add a4, a4, t0
add a4, t1, a4
lw t6, 96(sp)
and.1 a7, t6, a7, 13
li t7, -102144892
xor t6, a3, t7
sw t6, 156(sp)
or a6, a6, a7, -13
lw t6, 12(sp)
li t7, 190135924
xor t0, t6, t7
li t7, 7561771
mul a6, a6, t7
lw t6, 171(sp)
li t7, -102144892
xor t6, t6, t7
sw t6, 30(sp)
lw t6, 168(sp)
lw t7, 21(sp)
and.T t1, t6, t7, -13
lw t6, 171(sp)
xor.1 t6, t6, a3
sw t6, 93(sp)
lw t7, 81(sp)
and.1 a7, a3, t7, 13
li t7, -97087398
mul a7, a7, t7
or.1 t0, t1, t0
lw t6, 156(sp)
li t7, -102144892
xor.1 t1, t6, t7
li t7, 152767734
mul t6, t1, t7
sw t6, 72(sp)
lw t6, 30(sp)
li t7, 90889561
mul t6, t6, t7
sw t6, 81(sp)
lw t6, 93(sp)
li t7, -102144892
and.1 t6, t6, t7, 13
sw t6, 15(sp)
lw t7, 171(sp)
or.1 t6, a3, t7
sw t6, 36(sp)
lw t6, 171(sp)
li t7, -102144892
xor.T t6, t6, t7
sw t6, 39(sp)
xor.T a5, a5, t0
li t7, -102144892
or t6, a3, t7, -13
sw t6, 51(sp)
lw t6, 171(sp)
li t7, -102144892
or t6, t6, t7, -13
sw t6, 153(sp)
lw t6, 171(sp)
xor t6, t6, a3
sw t6, 24(sp)
lw t6, 51(sp)
xor.1 t0, t6, a3
li t7, -78903714
mul a5, a5, t7
add a5, a6, a5
li t7, -36260742
mul t6, t0, t7
sw t6, 54(sp)
li t7, -102144892
or.T t6, a3, t7
sw t6, 99(sp)
add a5, a5, a7
add a4, a4, a5
lw t7, 171(sp)
xor.T t6, a3, t7
sw t6, 111(sp)
lw t6, 171(sp)
and.1 t6, t6, a3, 13
sw t6, 138(sp)
lw t6, 42(sp)
add a4, t6, a4
lw t6, 0(sp)
add a4, t6, a4
lw t6, 171(sp)
li t7, -102144892
and.1 t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 24(sp)
lw t7, 111(sp)
and.T t6, t6, t7, -13
sw t6, 12(sp)
lw t7, 156(sp)
or t6, a3, t7, -13
sw t6, 57(sp)
lw t6, 33(sp)
add a4, t6, a4
lw t6, 6(sp)
add t6, t6, a4
sw t6, 63(sp)
lw t7, 63(sp)
xor.T t6, a3, t7
sw t6, 42(sp)
lw t7, 171(sp)
and t6, a3, t7, 13
sw t6, 66(sp)
lw t6, 39(sp)
lw t7, 138(sp)
and.1 a6, t6, t7, 13
lw t6, 171(sp)
li t7, -102144892
and.T t6, t6, t7, -13
sw t6, 144(sp)
lw t6, 111(sp)
lw t7, 123(sp)
xor.1 t6, t6, t7
sw t6, 60(sp)
lw t6, 63(sp)
and.1 a4, t6, a3, 13
lw t6, 63(sp)
lw t7, 63(sp)
xor t6, t6, t7
sw t6, 168(sp)
and t6, a4, a3, 13
sw t6, 45(sp)
lw t7, 171(sp)
or.1 t6, a4, t7
sw t6, 90(sp)
li t7, -102144892
and.1 t6, a4, t7, 13
sw t6, 21(sp)
lw t7, 90(sp)
xor a7, a3, t7
xor.T t6, a3, a4
sw t6, 87(sp)
xor t0, a4, a4
lw t6, 45(sp)
or.T a5, t6, a3
xor.1 t6, a3, a4
sw t6, 0(sp)
li t7, -102144892
xor t6, a4, t7
sw t6, 177(sp)
lw t6, 21(sp)
lw t7, 123(sp)
xor.T t1, t6, t7
or.1 a7, a5, a7
lw t6, 171(sp)
xor.1 t6, t6, a4
sw t6, 96(sp)
lw t7, 171(sp)
or.T t6, a4, t7
sw t6, 120(sp)
lw t7, 171(sp)
and t6, a4, t7, 13
sw t6, 9(sp)
li t7, -102144892
and t6, a4, t7, 13
sw t6, 33(sp)
lw t7, 171(sp)
and.1 t6, a4, t7, 13
sw t6, 48(sp)
li t7, 125424244
mul a7, a7, t7
and t2, a6, t0, 13
lw t7, 171(sp)
xor t6, a4, t7
sw t6, 114(sp)
lw t7, 177(sp)
and.T t0, t0, t7, -13
li t7, -102144892
or.1 t6, a4, t7
sw t6, 69(sp)
lw t6, 120(sp)
xor a6, t6, a4
lw t7, 66(sp)
or t6, a5, t7, -13
sw t6, 75(sp)
lw t7, 69(sp)
or t3, t2, t7, -13
lw t6, 21(sp)
lw t7, 48(sp)
or t2, t6, t7, -13
lw t6, 153(sp)
li t7, 124521132
mul t6, t6, t7
sw t6, 27(sp)
lw t7, 123(sp)
and.1 t5, t2, t7, 13
li t7, -102144892
and.T t4, a4, t7, -13
lw t7, 114(sp)
xor.1 t2, t4, t7
li t7, 166863298
mul s0, t5, t7
lw t6, 36(sp)
or.T t1, t6, t1
lw t6, 33(sp)
lw t7, 48(sp)
or.T t5, t6, t7
lw t6, 96(sp)
li t7, -102144892
xor s1, t6, t7
lw t7, 81(sp)
add s2, s0, t7
lw t6, 153(sp)
xor.T s0, t6, a6
lw t7, 171(sp)
or t6, a4, t7, -13
sw t6, 81(sp)
lw t7, 15(sp)
and s1, s1, t7, 13
lw t6, 72(sp)
add a6, t6, s2
lw t6, 117(sp)
xor.T t2, t6, t2
li t7, 130911888
mul s0, s0, t7
li t7, 42166623
mul s2, s1, t7
lw t7, 171(sp)
and.1 t2, t2, t7, 13
lw t6, 81(sp)
slli s1, t6, 4
li t7, 65438313
mul t6, a5, t7
sw t6, 6(sp)
li t7, -93171348
mul s3, t5, t7
li t7, -158928834
mul a5, t3, t7
lw t7, 54(sp)
add t5, s2, t7
lw t6, 9(sp)
or.1 t3, t6, t0
lw t6, 39(sp)
and.T t4, t6, t4, -13
lw t6, 0(sp)
lw t7, 153(sp)
xor.1 t0, t6, t7
add s2, s3, a7
add s1, s0, s1
lw t6, 90(sp)
lw t7, 114(sp)
and a7, t6, t7, 13
lw t6, 171(sp)
xor.T t6, t6, a4
sw t6, 159(sp)
lw t7, 12(sp)
xor t0, t0, t7
li t7, 141580668
mul t1, t1, t7
add t5, s2, t5
add s0, t1, a5
lw t6, 159(sp)
li t7, -102144892
and.1 t1, t6, t7, 13
li t7, 110711969
mul a5, t4, t7
or t1, a4, t1, -13
add s1, t5, s1
and.T t4, a3, a4, -13
or t6, a3, a4, -13
sw t6, 105(sp)
lw t6, 48(sp)
lw t7, 144(sp)
xor s2, t6, t7
li t7, 136232874
mul t2, t2, t7
li t7, -119133704
mul t0, t0, t7
li t7, -102144892
or t6, a4, t7, -13
sw t6, 84(sp)
add t0, t2, t0
lw t7, 177(sp)
or.T t5, a7, t7
add a7, s1, s0
lw t6, 111(sp)
and s1, t6, t3, 13
li t7, -102144892
xor.1 t2, a4, t7
li t7, 16419019
mul s0, s2, t7
add t6, a6, a7
sw t6, 54(sp)
xor t6, a3, a4
sw t6, 12(sp)
lw t6, 144(sp)
lw t7, 12(sp)
and.1 a7, t6, t7, 13
lw t6, 57(sp)
lw t7, 75(sp)
or.T t3, t6, t7
li t7, -102144892
or.T t6, a4, t7
sw t6, 75(sp)
lw t6, 12(sp)
lw t7, 177(sp)
or.1 a6, t6, t7
or t3, t4, t3, -13
lw t6, 171(sp)
and.T t6, t6, a4, -13
sw t6, 150(sp)
li t7, -141414677
mul t4, s1, t7
lw t6, 171(sp)
li t7, -102144892
or.T t6, t6, t7
sw t6, 15(sp)
lw t7, 21(sp)
xor.1 s1, t1, t7
lw t6, 84(sp)
li t7, 11513690
mul t6, t6, t7
sw t6, 102(sp)
lw t6, 75(sp)
lw t7, 45(sp)
or t1, t6, t7, -13
li t7, -6244107
mul t5, t5, t7
lw t6, 6(sp)
add t5, t6, t5
li t7, 139212671
mul s1, s1, t7
add t6, s0, t5
sw t6, 6(sp)
add t4, s1, t4
lw t7, 27(sp)
add t4, t4, t7
add a5, a5, t4
lw t6, 171(sp)
and.T t5, t6, a3, -13
lw t7, 144(sp)
xor.1 t4, a6, t7
or.T s0, t2, a3
lw t6, 231(sp)
and t2, t6, a4, 13
add a6, t0, a5
li t7, 10359343
mul a5, t3, t7
li t7, 29790374
mul t2, t2, t7
li t7, -146058506
mul s0, s0, t7
lw t7, 90(sp)
or t0, t1, t7, -13
lw t6, 15(sp)
and.T t1, t6, t0, -13
lw t7, 96(sp)
xor.1 t0, t5, t7
lw t6, 171(sp)
or t6, t6, a3, -13
sw t6, 57(sp)
li t7, 155419638
mul t3, t1, t7
and a7, a7, t4, 13
add t5, t2, s0
li t7, -111776658
mul t4, a7, t7
lw t6, 45(sp)
lw t7, 24(sp)
or.1 a7, t6, t7
lw t6, 57(sp)
or t2, t6, a7, -13
lw t6, 96(sp)
lw t7, 105(sp)
and.1 a7, t6, t7, 13
lw t6, 111(sp)
lw t7, 96(sp)
xor.1 t1, t6, t7
li t7, -102144892
or.1 t6, a3, t7
sw t6, 135(sp)
add t3, t5, t3
lw t6, 135(sp)
lw t7, 159(sp)
xor.1 t5, t6, t7
li t7, -28397321
mul t6, t5, t7
sw t6, 108(sp)
li t7, -102144892
xor.T t6, a3, t7
sw t6, 72(sp)
lw t6, 135(sp)
lw t7, 156(sp)
xor.1 t5, t6, t7
add s0, a5, t3
lw t6, 114(sp)
lw t7, 135(sp)
and.T s1, t6, t7, -13
lw t6, 177(sp)
lw t7, 150(sp)
and.T a5, t6, t7, -13
lw t6, 144(sp)
lw t7, 24(sp)
xor t3, t6, t7
or.T t5, s1, t5
lw t7, 102(sp)
add t4, t4, t7
li t7, -102144892
xor.T t6, a4, t7
sw t6, 174(sp)
add s0, s0, t4
lw t6, 144(sp)
lw t7, 174(sp)
xor t4, t6, t7
li t7, -102144892
xor.1 t6, a3, t7
sw t6, 165(sp)
lw t6, 6(sp)
add s0, t6, s0
and.1 t0, t0, a7, 13
li t7, 157134122
mul a7, t5, t7
lw t6, 171(sp)
li t7, -102144892
and t6, t6, t7, 13
sw t6, 126(sp)
add t5, a6, s0
or.T a6, t0, t2
lw t6, 57(sp)
li t7, -1190580
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 126(sp)
li t7, -80582898
mul t0, t6, t7
lw t6, 54(sp)
add t6, t6, t5
sw t6, 147(sp)
lw t6, 165(sp)
lw t7, 81(sp)
xor.T t2, t6, t7
and.T t1, t1, t3, -13
lw t6, 150(sp)
xor.T t5, t6, t4
lw t6, 72(sp)
lw t7, 90(sp)
or t3, t6, t7, -13
lw t6, 24(sp)
andi t4, t6, 0
li t7, 109684537
mul t6, a6, t7
sw t6, 129(sp)
lw t6, 171(sp)
li t7, -102144892
xor.1 t6, t6, t7
sw t6, 102(sp)
lw t7, 60(sp)
or.T t5, t5, t7
lw t6, 0(sp)
li t7, -117538016
mul t6, t6, t7
sw t6, 27(sp)
li t7, 79757219
mul t6, t3, t7
sw t6, 60(sp)
lw t7, 162(sp)
and t3, a3, t7, 13
lw t6, 39(sp)
or a6, t6, a4, -13
lw t6, 84(sp)
lw t7, 39(sp)
and.1 s1, t6, t7, 13
lw t6, 159(sp)
xor s0, t6, t2
li t7, -66663322
mul t1, t1, t7
or.1 s1, s1, t4
lw t7, 126(sp)
and.1 s3, a3, t7, 13
lw t7, 24(sp)
xor.1 t2, a4, t7
lw t6, 93(sp)
lw t7, 102(sp)
or.1 t4, t6, t7
lw t6, 33(sp)
or.1 s2, t6, t5
li t7, 100429173
mul s4, s3, t7
li t7, -3483846
mul t5, s1, t7
li t7, 134404005
mul s3, a5, t7
add a5, a7, s4
add a7, t0, a5
li t7, 14960238
mul t0, s0, t7
lw t6, 39(sp)
lw t7, 138(sp)
or.1 a5, t6, t7
lw t6, 81(sp)
lw t7, 66(sp)
xor s0, t6, t7
or.T s1, a5, a4
li t7, 128116842
mul a5, s2, t7
add s2, s3, t0
li t7, 117065299
mul t0, t3, t7
add t0, t5, t0
lw t6, 231(sp)
lw t7, 90(sp)
and t5, t6, t7, 13
lw t6, 69(sp)
lw t7, 24(sp)
or.T t6, t6, t7
sw t6, 54(sp)
lw t7, 36(sp)
xor t3, s0, t7
lw t6, 24(sp)
li t7, -102144892
and.T s0, t6, t7, -13
li t7, -102144892
and t3, t3, t7, 13
li t7, 155518831
mul t5, t5, t7
lw t6, 57(sp)
xor.1 s4, t6, t4
li t7, -3355810
mul t4, s1, t7
add t4, s2, t4
add a5, a5, t1
lw t6, 81(sp)
and.1 s3, t6, t2, 13
lw t7, 6(sp)
add t2, a5, t7
lw t6, 48(sp)
lw t7, 81(sp)
xor.1 s2, t6, t7
lw t6, 144(sp)
lw t7, 123(sp)
xor a5, t6, t7
lw t6, 117(sp)
lw t7, 93(sp)
or s5, t6, t7, -13
and.1 s1, s4, a6, 13
lw t6, 39(sp)
lw t7, 159(sp)
or s4, t6, t7, -13
lw t6, 84(sp)
lw t7, 159(sp)
and.1 s6, t6, t7, 13
li t7, -102144892
and t6, a3, t7, 13
sw t6, 6(sp)
lw t6, 171(sp)
lw t7, 153(sp)
and.1 t1, t6, t7, 13
or a5, a5, s5, -13
lw t6, 36(sp)
lw t7, 21(sp)
or.T t6, t6, t7
sw t6, 33(sp)
li t7, -149872486
mul s5, s3, t7
lw t6, 150(sp)
lw t7, 6(sp)
or.T a6, t6, t7
xor s0, s6, s0
lw t7, 90(sp)
xor.T s3, s2, t7
li t7, 34167005
mul s0, s0, t7
add a7, a7, t2
li t7, -102144892
or.1 s2, s4, t7
lw t6, 135(sp)
li t7, -102144892
and.T t2, t6, t7, -13
lw t6, 108(sp)
add a7, t6, a7
lw t6, 60(sp)
add s4, t6, a7
li t7, -69627118
mul s1, s1, t7
add a7, t5, s5
li t7, 170216016
mul t3, t3, t7
add t0, s4, t0
lw t6, 129(sp)
add t5, t6, t0
li t7, 160771226
mul s3, s3, t7
add t0, t4, t3
lw t6, 27(sp)
add t4, t6, t0
lw t6, 45(sp)
li t7, -102144892
or.1 t3, t6, t7
lw t6, 54(sp)
or s2, t6, s2, -13
lw t6, 144(sp)
lw t7, 123(sp)
and.1 t0, t6, t7, 13
li t7, -27705021
mul t6, s2, t7
sw t6, 27(sp)
li t7, 76038003
mul t3, t3, t7
add t4, t4, s1
lw t6, 162(sp)
li t7, -40147899
mul s1, t6, t7
add t4, t4, a7
li t7, -157022298
mul a6, a6, t7
lw t6, 81(sp)
lw t7, 144(sp)
or.1 a7, t6, t7
add s2, s0, s3
lw t6, 114(sp)
lw t7, 36(sp)
xor s0, t6, t7
li t7, 173500436
mul t1, t1, t7
lw t6, 30(sp)
xor a7, t6, a7
slli s0, s0, 3
li t7, -44521988
mul t6, a7, t7
sw t6, 60(sp)
lw t6, 30(sp)
lw t7, 231(sp)
or a7, t6, t7, -13
add s0, s0, s1
li t7, -35364995
mul a5, a5, t7
add s0, s0, t1
add t3, a5, t3
add t4, t4, s2
lw t7, 123(sp)
xor.T t1, t2, t7
lw t6, 69(sp)
xor a5, t6, a3
add t6, t5, t4
sw t6, 54(sp)
lw t6, 9(sp)
lw t7, 33(sp)
and t4, t6, t7, 13
lw t6, 102(sp)
lw t7, 111(sp)
or.T t5, t6, t7
li t7, -126021961
mul s1, t1, t7
lw t6, 93(sp)
lw t7, 171(sp)
and t2, t6, t7, 13
lw t6, 171(sp)
li t7, -102144892
or.1 t6, t6, t7
sw t6, 33(sp)
lw t7, 84(sp)
or.1 s2, t5, t7
lw t7, 72(sp)
or.T t5, a4, t7
lw t6, 33(sp)
slli t1, t6, 1
li t7, -48540764
mul s5, t4, t7
lw t6, 72(sp)
and.T s3, t6, t0, -13
lw t6, 144(sp)
or.T t0, t6, s2
li t7, 88559347
mul s2, t0, t7
lw t6, 57(sp)
lw t7, 165(sp)
xor.T t0, t6, t7
li t7, -102144892
or.1 t4, t2, t7
add s0, s2, s0
lw t6, 123(sp)
li t7, -1767705
mul s4, t6, t7
lw t6, 9(sp)
lw t7, 105(sp)
xor.T t2, t6, t7
lw t6, 111(sp)
lw t7, 144(sp)
xor s2, t6, t7
add a6, a6, s5
li t7, 153549027
mul s5, a3, t7
li t7, 115191806
mul s6, s3, t7
lw t6, 75(sp)
lw t7, 96(sp)
and.1 s3, t6, t7, 13
add s1, s6, s1
add s1, s5, s1
add t3, t3, a6
lw t7, 123(sp)
xor a6, a7, t7
add s1, s4, s1
and.1 a7, a6, t5, 13
lw t6, 171(sp)
li t7, -132623328
mul a6, t6, t7
add s1, s0, s1
lw t6, 174(sp)
lw t7, 105(sp)
or.T s0, t6, t7
or.T t5, s2, s3
lw t6, 60(sp)
add s1, t6, s1
add t3, t3, s1
lw t6, 27(sp)
add t3, t6, t3
lw t6, 87(sp)
xor.1 s1, t6, t4
lw t7, 48(sp)
xor.T a5, a5, t7
lw t7, 156(sp)
and t4, s0, t7, 13
add t3, t3, t1
xor.1 a5, a5, t2
li t7, -105103820
mul s0, a7, t7
lw t6, 48(sp)
xor.1 s2, t6, a3
lw t6, 159(sp)
lw t7, 45(sp)
xor t1, t6, t7
li t7, 49254851
mul t4, t4, t7
li t7, 24327360
mul a7, s1, t7
li t7, 68717984
mul t2, t0, t7
li t7, -32782964
mul s2, s2, t7
li t7, -167119765
mul s1, a5, t7
li t7, -12919180
mul t0, t5, t7
li t7, 162869551
mul s3, t1, t7
lw t6, 171(sp)
lw t7, 81(sp)
and.1 a5, t6, t7, 13
lw t6, 39(sp)
lw t7, 123(sp)
or t1, t6, t7, -13
li t7, 134545408
mul t5, a5, t7
lw t6, 102(sp)
li t7, -106667377
mul a5, t6, t7
add s2, s3, s2
lw t6, 117(sp)
lw t7, 135(sp)
and.T s3, t6, t7, -13
add s0, s1, s0
add t6, t3, s0
sw t6, 27(sp)
li t7, 155147885
mul t3, s3, t7
add s0, t0, t5
lw t6, 6(sp)
lw t7, 120(sp)
or.T t5, t6, t7
add s1, t4, s2
li t7, 89474253
mul t0, a4, t7
lw t6, 171(sp)
lw t7, 159(sp)
and t4, t6, t7, 13
add a7, a7, t2
add a7, a7, s1
add a6, a6, s0
add t6, a7, a6
sw t6, 45(sp)
lw t7, 15(sp)
and.1 a6, a4, t7, 13
lw t6, 30(sp)
lw t7, 9(sp)
xor a7, t6, t7
lw t6, 75(sp)
xor t2, t6, t4
or.T a6, a6, t1
li t7, 132801739
mul a6, a6, t7
add a6, a6, t3
li t7, -28992195
mul t1, t5, t7
lw t7, 171(sp)
or.T t3, a3, t7
add t1, a6, t1
lw t6, 162(sp)
li t7, -24451700
mul a6, t6, t7
lw t6, 126(sp)
lw t7, 6(sp)
or.1 t4, t6, t7
add t1, t1, a5
li t7, 33104808
mul a5, t3, t7
li t7, 140863788
mul t3, t2, t7
lw t6, 0(sp)
lw t7, 21(sp)
xor.T t2, t6, t7
li t7, -20437890
mul t4, t4, t7
add t5, a5, t0
lw t7, 84(sp)
or.1 t2, t2, t7
li t7, -102144892
and.1 a5, a3, t7, 13
lw t6, 51(sp)
li t7, 61417849
mul t0, t6, t7
lw t6, 135(sp)
lw t7, 24(sp)
xor.T s3, t6, t7
lw t6, 21(sp)
lw t7, 105(sp)
and.T s0, t6, t7, -13
lw t6, 36(sp)
lw t7, 33(sp)
and s4, t6, t7, 13
lw t6, 99(sp)
lw t7, 117(sp)
xor.T s1, t6, t7
add s2, t5, a6
lw t6, 93(sp)
xor.1 a6, t6, a3
li t7, -184620552
mul s5, t2, t7
lw t7, 39(sp)
or.1 t2, a5, t7
and.1 t5, s3, s4, 13
and.1 a7, t2, a7, 13
li t7, -165073492
mul t2, a7, t7
li t7, -108736787
mul s0, s0, t7
add a7, t4, s5
add a7, t3, a7
and.1 s1, s1, a3, 13
lw t6, 105(sp)
lw t7, 135(sp)
or t4, t6, t7, -13
lw t6, 111(sp)
lw t7, 21(sp)
or.T t3, t6, t7
lw t7, 39(sp)
or.T t4, t4, t7
add t1, t1, s2
lw t6, 141(sp)
or.1 t6, t6, a3
sw t6, 183(sp)
lw t6, 96(sp)
lw t7, 72(sp)
xor.T s3, t6, t7
and.T s2, a5, a4, -13
lw t7, 87(sp)
or.T s3, s3, t7
li t7, 177907960
mul s3, s3, t7
lw t6, 66(sp)
and.1 s4, t6, a4, 13
li t7, 181306065
mul t3, t3, t7
li t7, -52090513
mul a4, t4, t7
add t4, t0, s3
add a4, s0, a4
li t7, -78275959
mul s3, t5, t7
or t0, s1, s4, -13
lw t6, 90(sp)
li t7, 42309364
mul t5, t6, t7
lw t6, 177(sp)
slli s1, t6, 2
li t7, -72132708
mul s0, t0, t7
li t7, -66400886
mul s2, s2, t7
lw t6, 42(sp)
lw t7, 42(sp)
xor t6, t6, t7
sw t6, 51(sp)
lw t6, 42(sp)
li t7, -17167474
xor t0, t6, t7
add t2, t2, s3
lw t7, 33(sp)
or.T s3, a5, t7
add a5, s1, s2
lw t6, 162(sp)
lw t7, 12(sp)
or.T s1, t6, t7
xor.1 a6, s3, a6
add a7, a7, t2
add a7, t1, a7
lw t7, 111(sp)
xor t1, s1, t7
li t7, 164345480
mul t1, t1, t7
add s0, s0, t1
lw t6, 45(sp)
add t1, t6, a7
add t2, t3, t5
add t3, t4, s0
li t7, -15923966
mul t4, a6, t7
lw t6, 42(sp)
xor.T a7, t6, a3
lw t6, 27(sp)
add a6, t6, t1
add t1, t4, t2
add a5, t3, a5
add a5, a5, t1
add a4, a4, a5
add a4, a6, a4
lw t7, 141(sp)
xor t6, a3, t7
sw t6, 21(sp)
lw t6, 54(sp)
add a4, t6, a4
lw t6, 147(sp)
add a4, t6, a4
lw t6, 141(sp)
and t6, t6, a3, 13
sw t6, 129(sp)
or a6, t0, a4, -13
xor t6, a4, a4
sw t6, 204(sp)
lw t7, 231(sp)
and t6, a7, t7, 13
sw t6, 48(sp)
xor.T t6, a6, a3
sw t6, 144(sp)
lw t7, 63(sp)
xor a5, a4, t7
and.T t6, a6, a5, -13
sw t6, 138(sp)
xor.1 t6, a6, a5
sw t6, 165(sp)
xor t6, a5, a6
sw t6, 192(sp)
xor.T t6, a5, a6
sw t6, 33(sp)
lw t6, 21(sp)
lw t7, 165(sp)
xor.1 a7, t6, t7
li t7, 142975534
mul t6, a7, t7
sw t6, 114(sp)
and t6, a5, a6, 13
sw t6, 210(sp)
lw t7, 141(sp)
and.T t6, a6, t7, -13
sw t6, 147(sp)
lw t7, 141(sp)
xor t6, a6, t7
sw t6, 150(sp)
lw t6, 141(sp)
or t6, t6, a3, -13
sw t6, 117(sp)
lw t6, 150(sp)
lw t7, 192(sp)
or.1 a7, t6, t7
lw t6, 33(sp)
lw t7, 147(sp)
or.1 t0, t6, t7
or t6, a5, a3, -13
sw t6, 153(sp)
and.T t6, a3, a5, -13
sw t6, 75(sp)
xor.T t6, a3, a5
sw t6, 93(sp)
li t7, -142285233
mul t2, t0, t7
lw t6, 117(sp)
lw t7, 144(sp)
or.1 t1, t6, t7
or.T t6, a3, a5
sw t6, 195(sp)
lw t6, 153(sp)
li t7, -58560011
mul t3, t6, t7
lw t6, 141(sp)
or.1 t6, t6, a6
sw t6, 45(sp)
lw t6, 33(sp)
and.T t0, t6, a6, -13
and t6, a5, a3, 13
sw t6, 156(sp)
lw t6, 141(sp)
xor t6, t6, a5
sw t6, 36(sp)
lw t6, 210(sp)
lw t7, 117(sp)
and.T t4, t6, t7, -13
li t7, 164149524
mul t5, a7, t7
lw t6, 93(sp)
li t7, 56622257
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 141(sp)
or.T t6, t6, a6
sw t6, 30(sp)
lw t6, 138(sp)
li t7, -134022442
mul a7, t6, t7
lw t7, 141(sp)
and.1 t6, a3, t7, 13
sw t6, 207(sp)
lw t6, 207(sp)
lw t7, 183(sp)
xor.1 t6, t6, t7
sw t6, 84(sp)
lw t7, 141(sp)
and.1 t6, a5, t7, 13
sw t6, 99(sp)
lw t6, 84(sp)
or s0, t6, a3, -13
add t5, t5, t3
lw t6, 99(sp)
lw t7, 210(sp)
xor.1 t3, t6, t7
lw t6, 30(sp)
lw t7, 75(sp)
xor s1, t6, t7
add t6, t5, t2
sw t6, 9(sp)
or.T t6, a6, a5
sw t6, 96(sp)
xor t2, t4, s1
and t1, t2, t1, 13
xor t3, t3, s0
li t7, -117360729
mul t2, t1, t7
lw t6, 150(sp)
lw t7, 195(sp)
or t4, t6, t7, -13
lw t6, 45(sp)
li t7, -154225822
mul t1, t6, t7
lw t7, 141(sp)
and.1 t6, a6, t7, 13
sw t6, 54(sp)
lw t7, 165(sp)
or.1 t6, a6, t7
sw t6, 123(sp)
lw t7, 192(sp)
xor.T t4, t4, t7
and t6, a6, a3, 13
sw t6, 0(sp)
li t7, 87881289
mul t0, t0, t7
slli s1, a5, 2
lw t6, 36(sp)
li t7, -79272159
mul t6, t6, t7
sw t6, 6(sp)
li t7, 52011637
mul s2, a5, t7
lw t6, 123(sp)
li t7, -173927283
mul s0, t6, t7
lw t6, 141(sp)
or t6, t6, a6, -13
sw t6, 198(sp)
li t7, 110302110
mul t3, t3, t7
lw t6, 84(sp)
xor.T t5, t6, a5
add s2, s2, s1
lw t6, 0(sp)
lw t7, 96(sp)
xor.T s1, t6, t7
add a7, a7, t3
li t7, 35605826
mul s3, t4, t7
add t4, s0, s2
lw t6, 198(sp)
li t7, 139743440
mul t3, t6, t7
add t2, t2, s3
add t0, a7, t0
xor a7, a5, a5
and.T t5, t5, s1, -13
lw t6, 141(sp)
xor.T t6, t6, a5
sw t6, 60(sp)
lw t6, 60(sp)
lw t7, 183(sp)
or.T s0, t6, t7
add t1, t0, t1
lw t6, 45(sp)
lw t7, 36(sp)
and s1, t6, t7, 13
lw t6, 54(sp)
lw t7, 138(sp)
and.1 t0, t6, t7, 13
lw t6, 129(sp)
lw t7, 195(sp)
or.T s3, t6, t7
li t7, 31321725
mul t0, t0, t7
li t7, 44536745
mul s2, s1, t7
or.1 t6, a3, a5
sw t6, 27(sp)
and.T t5, s3, t5, -13
li t7, 84364481
mul s1, t5, t7
add t1, t2, t1
lw t6, 93(sp)
lw t7, 84(sp)
and.T t5, t6, t7, -13
add t3, t3, s2
add s3, t1, t4
xor t6, a3, a5
sw t6, 12(sp)
lw t6, 141(sp)
lw t7, 27(sp)
and.T t1, t6, t7, -13
li t7, -102909659
mul t4, t1, t7
lw t7, 231(sp)
and t2, a6, t7, 13
lw t7, 207(sp)
or.1 s2, s0, t7
lw t6, 99(sp)
lw t7, 138(sp)
xor t1, t6, t7
and.1 t6, a5, a6, 13
sw t6, 177(sp)
and.T t6, a6, a3, -13
sw t6, 15(sp)
add s4, s1, t4
lw t7, 15(sp)
or.T s0, a7, t7
lw t6, 15(sp)
lw t7, 165(sp)
or.1 t4, t6, t7
lw t7, 141(sp)
or t6, a5, t7, -13
sw t6, 24(sp)
lw t6, 39(sp)
add s3, t6, s3
xor t6, a6, a3
sw t6, 105(sp)
or.T t6, a3, a6
sw t6, 39(sp)
lw t6, 24(sp)
lw t7, 105(sp)
xor.T s6, t6, t7
or.1 s5, t5, a3
lw t7, 99(sp)
and.T t5, a3, t7, -13
li t7, 32741894
mul s0, s0, t7
lw t6, 192(sp)
or.T s1, t6, a7
lw t6, 6(sp)
add s7, t6, s4
li t7, -28861724
mul s4, s6, t7
lw t7, 54(sp)
and t6, a7, t7, 13
sw t6, 57(sp)
add t3, s7, t3
or t6, a3, a6, -13
sw t6, 120(sp)
add s6, s3, t3
lw t6, 39(sp)
xor s3, t6, a3
and.1 t3, s5, s2, 13
lw t6, 39(sp)
lw t7, 165(sp)
and s5, t6, t7, 13
add t0, t0, s4
lw t6, 9(sp)
add t6, t6, s6
sw t6, 9(sp)
lw t6, 21(sp)
li t7, -19573985
mul t6, t6, t7
sw t6, 162(sp)
lw t6, 189(sp)
lw t7, 39(sp)
and s2, t6, t7, 13
li t7, 20013841
mul t6, t2, t7
sw t6, 6(sp)
lw t6, 177(sp)
lw t7, 156(sp)
xor.T s4, t6, t7
and.T t4, t4, s3, -13
lw t7, 141(sp)
or s3, s5, t7, -13
li t7, 173227057
mul s5, t3, t7
lw t7, 120(sp)
xor.1 t3, a7, t7
lw t6, 210(sp)
li t7, -106078669
mul t2, t6, t7
li t7, -48793374
mul s7, t4, t7
and t5, t5, t1, 13
add s6, s0, t0
and s0, s1, s4, 13
li t7, 89101787
mul t4, s2, t7
lw t6, 231(sp)
lw t7, 189(sp)
and t0, t6, t7, 13
add s4, s7, s5
lw t6, 129(sp)
or.1 s1, t6, s3
lw t6, 144(sp)
li t7, -184554072
mul t1, t6, t7
lw t6, 12(sp)
li t7, -60997997
mul s2, t6, t7
li t7, 6650273
mul t5, t5, t7
add s3, s6, s4
lw t7, 6(sp)
add s3, s3, t7
lw t6, 9(sp)
add t6, t6, s3
sw t6, 90(sp)
li t7, 61601208
mul s3, s0, t7
lw t7, 141(sp)
or.1 t6, a5, t7
sw t6, 69(sp)
lw t6, 45(sp)
li t7, 103516970
mul t6, t6, t7
sw t6, 108(sp)
li t7, -61386665
mul s0, s1, t7
add s0, s0, t4
add s1, s2, s3
lw t6, 141(sp)
xor.1 t6, t6, a5
sw t6, 189(sp)
lw t6, 57(sp)
and.T t3, t6, t3, -13
li t7, -20853730
mul t3, t3, t7
add t5, t3, t5
lw t6, 141(sp)
li t7, 25552812
mul t3, t6, t7
and.T a7, a7, a5, -13
lw t6, 0(sp)
lw t7, 198(sp)
xor t4, t6, t7
add t2, t5, t2
lw t6, 141(sp)
and t6, t6, a6, 13
sw t6, 57(sp)
lw t6, 123(sp)
lw t7, 69(sp)
and.1 t6, t6, t7, 13
sw t6, 87(sp)
add t6, s0, s1
sw t6, 111(sp)
lw t6, 84(sp)
lw t7, 99(sp)
or.1 t5, t6, t7
lw t6, 105(sp)
lw t7, 120(sp)
or s0, t6, t7, -13
li t7, -43972262
mul t6, s0, t7
sw t6, 9(sp)
add t3, t1, t3
lw t6, 141(sp)
xor.1 t6, t6, a6
sw t6, 81(sp)
li t7, 141871418
mul t6, t0, t7
sw t6, 72(sp)
lw t6, 183(sp)
xor.T t6, t6, a6
sw t6, 174(sp)
lw t6, 21(sp)
lw t7, 84(sp)
or t6, t6, t7, -13
sw t6, 126(sp)
xor.1 t6, a6, a3
sw t6, 135(sp)
lw t6, 189(sp)
lw t7, 57(sp)
and t6, t6, t7, 13
sw t6, 159(sp)
li t7, 189327094
mul t6, t4, t7
sw t6, 180(sp)
lw t6, 129(sp)
li t7, -58526262
mul t6, t6, t7
sw t6, 102(sp)
lw t6, 129(sp)
lw t7, 81(sp)
and t0, t6, t7, 13
li t7, 52504497
mul t6, t5, t7
sw t6, 66(sp)
lw t6, 57(sp)
li t7, 192852069
mul t4, t6, t7
lw t6, 141(sp)
lw t7, 45(sp)
or t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 198(sp)
lw t7, 189(sp)
or t6, t6, t7, -13
sw t6, 6(sp)
lw t6, 195(sp)
li t7, -1736975
mul t1, t6, t7
lw t6, 162(sp)
add t4, t6, t4
or.1 a7, t0, a7
add t2, t2, t3
lw t7, 141(sp)
and.T t6, a3, t7, -13
sw t6, 162(sp)
lw t7, 162(sp)
and t3, a3, t7, 13
li t7, -50443663
mul t0, a7, t7
lw t6, 126(sp)
or.T t3, t6, t3
lw t6, 87(sp)
lw t7, 105(sp)
xor.T a7, t6, t7
lw t6, 111(sp)
add t2, t6, t2
lw t6, 66(sp)
lw t7, 72(sp)
add t5, t6, t7
lw t6, 159(sp)
li t7, -20556125
mul t6, t6, t7
sw t6, 87(sp)
li t7, -161838859
mul t3, t3, t7
lw t7, 108(sp)
add s0, t5, t7
lw t7, 9(sp)
add t0, t0, t7
and.1 t5, a3, a6, 13
add s0, t2, s0
lw t7, 180(sp)
add t0, t0, t7
add t6, t4, t3
sw t6, 111(sp)
lw t6, 141(sp)
or.T t6, t6, a5
sw t6, 108(sp)
lw t6, 102(sp)
add t1, t6, t1
lw t6, 123(sp)
lw t7, 108(sp)
and.T t2, t6, t7, -13
lw t6, 129(sp)
lw t7, 69(sp)
or.T t3, t6, t7
lw t6, 45(sp)
lw t7, 231(sp)
and s2, t6, t7, 13
lw t6, 90(sp)
add t4, t6, s0
lw t6, 114(sp)
add s4, t6, t4
lw t7, 60(sp)
or.1 s1, a3, t7
lw t7, 141(sp)
and t6, a5, t7, 13
sw t6, 45(sp)
lw t7, 96(sp)
or.T s3, t5, t7
lw t6, 192(sp)
lw t7, 45(sp)
and.1 t4, t6, t7, 13
lw t6, 135(sp)
xor.1 a7, t6, a7
lw t6, 231(sp)
lw t7, 198(sp)
and t5, t6, t7, 13
lw t6, 174(sp)
lw t7, 138(sp)
xor.T s0, t6, t7
xor.1 t6, a3, a5
sw t6, 72(sp)
li t7, -8394755
mul a7, a7, t7
lw t6, 144(sp)
or.T t4, t6, t4
li t7, 430188
mul s1, s1, t7
lw t6, 72(sp)
lw t7, 0(sp)
and.1 s5, t6, t7, 13
add t6, s4, t0
sw t6, 159(sp)
li t7, 19581996
mul t0, s2, t7
lw t6, 153(sp)
lw t7, 129(sp)
or.1 s4, t6, t7
add t1, t1, t0
lw t7, 54(sp)
or s3, s3, t7, -13
lw t6, 36(sp)
li t7, -67503306
mul t0, t6, t7
lw t6, 57(sp)
lw t7, 96(sp)
xor.T s6, t6, t7
and.1 t6, a3, a5, 13
sw t6, 114(sp)
xor.T s2, s5, t3
lw t6, 33(sp)
lw t7, 24(sp)
or t3, t6, t7, -13
li t7, -179848933
mul t5, t5, t7
lw t6, 60(sp)
xor.T t6, t6, a5
sw t6, 66(sp)
and.T s3, s3, t2, -13
lw t7, 30(sp)
xor.T t2, t3, t7
li t7, -4220210
mul s5, s6, t7
and.1 s0, s4, s0, 13
li t7, -12320149
mul t3, t2, t7
add s1, s5, s1
lw t6, 75(sp)
lw t7, 120(sp)
or.1 t2, t6, t7
and.1 t4, s0, t4, 13
lw t6, 12(sp)
li t7, 115325304
mul s0, t6, t7
li t7, -1427580
mul s4, t4, t7
lw t6, 36(sp)
li t7, -36784944
mul s5, t6, t7
lw t7, 141(sp)
xor.T t6, a3, t7
sw t6, 126(sp)
lw t6, 114(sp)
and t4, t6, a6, 13
xor.1 s6, s2, t4
lw t6, 150(sp)
xor.1 t4, t6, a3
li t7, 143543442
mul s2, s3, t7
lw t6, 45(sp)
li t7, -31285227
mul s3, t6, t7
or.T s6, a5, s6
or t6, a5, a6, -13
sw t6, 174(sp)
lw t6, 99(sp)
li t7, 156873896
mul t6, t6, t7
sw t6, 102(sp)
add a7, a7, s2
add t6, t5, s5
sw t6, 9(sp)
add a7, a7, t1
add s2, s4, s1
lw t6, 111(sp)
add s1, t6, a7
li t7, -157498493
mul t1, s6, t7
lw t6, 108(sp)
lw t7, 18(sp)
or.1 a7, t6, t7
add s3, s3, t1
add t1, t0, s0
lw t6, 138(sp)
lw t7, 207(sp)
xor.T t0, t6, t7
lw t7, 93(sp)
and.1 t5, a6, t7, 13
lw t6, 39(sp)
lw t7, 174(sp)
xor s4, t6, t7
lw t6, 117(sp)
lw t7, 195(sp)
or.1 t6, t6, t7
sw t6, 90(sp)
add s0, t3, s3
li t7, 75673105
mul s3, s4, t7
lw t6, 6(sp)
li t7, 159393297
mul t3, t6, t7
lw t7, 57(sp)
xor.1 s4, a5, t7
lw t7, 30(sp)
or s5, t2, t7, -13
add t2, s2, s0
lw t6, 87(sp)
add s2, t6, t2
li t7, 185542
mul s0, t0, t7
lw t6, 138(sp)
and.1 t2, t6, t4, 13
or t0, a5, s5, -13
add t4, s1, s2
add t6, t4, s3
sw t6, 111(sp)
li t7, 6112477
mul s1, s4, t7
li t7, -174992707
mul t0, t0, t7
lw t6, 141(sp)
xor.T t4, t6, a6
add t0, t0, a3
lw t6, 177(sp)
lw t7, 117(sp)
or.T s2, t6, t7
add t3, s1, t3
li t7, 177469615
mul t2, t2, t7
add s1, s0, t3
lw t6, 129(sp)
lw t7, 195(sp)
and.T t3, t6, t7, -13
lw t7, 123(sp)
and.1 s0, s2, t7, 13
add t6, t1, s1
sw t6, 99(sp)
li t7, -59732572
mul t1, a7, t7
lw t6, 75(sp)
or.1 s1, t6, t5
lw t7, 141(sp)
and.1 t5, t3, t7, 13
li t7, 104506019
mul t6, s0, t7
sw t6, 54(sp)
or.1 a7, a3, a6
li t7, -166166160
mul t6, a7, t7
sw t6, 87(sp)
xor.1 t4, s1, t4
lw t6, 39(sp)
lw t7, 123(sp)
xor.1 t3, t6, t7
lw t7, 231(sp)
and s0, t3, t7, 13
lw t6, 192(sp)
lw t7, 93(sp)
and.1 t3, t6, t7, 13
lw t7, 84(sp)
or s1, a5, t7, -13
li t7, -23327778
mul t5, t5, t7
li t7, 162860946
mul t4, t4, t7
lw t6, 141(sp)
and.T t6, t6, a5, -13
sw t6, 6(sp)
lw t6, 66(sp)
or s0, t6, s0, -13
add t4, t4, t5
li t7, -107850030
mul t5, s1, t7
lw t6, 24(sp)
li t7, 81023300
mul t6, t6, t7
sw t6, 153(sp)
li t7, -172841777
mul s0, s0, t7
add t6, t5, t2
sw t6, 93(sp)
lw t6, 72(sp)
li t7, 30093322
mul t6, t6, t7
sw t6, 117(sp)
add t6, s0, t1
sw t6, 66(sp)
li t7, -131718401
mul t6, a5, t7
sw t6, 18(sp)
add t0, t0, t4
and.T t2, a7, a3, -13
lw t6, 12(sp)
lw t7, 189(sp)
and.1 t1, t6, t7, 13
lw t6, 30(sp)
lw t7, 60(sp)
and.T t5, t6, t7, -13
lw t6, 147(sp)
xor.1 t2, t6, t2
li t7, 33997741
mul s0, t2, t7
li t7, -97505897
mul t1, t1, t7
lw t6, 96(sp)
lw t7, 90(sp)
and.1 t4, t6, t7, 13
lw t6, 210(sp)
li t7, 144574065
mul t2, t6, t7
li t7, -128592245
mul t3, t3, t7
lw t6, 93(sp)
add s0, t6, s0
li t7, 50534207
mul s1, t5, t7
lw t7, 66(sp)
add s0, s0, t7
lw t6, 6(sp)
li t7, -178600259
mul s3, t6, t7
lw t6, 33(sp)
lw t7, 84(sp)
and.1 t5, t6, t7, 13
add s2, t0, s0
lw t6, 117(sp)
add t0, t6, s3
lw t6, 96(sp)
xor t4, t6, t4
lw t6, 135(sp)
lw t7, 0(sp)
and.1 s0, t6, t7, 13
lw t6, 87(sp)
add s1, t6, s1
lw t7, 153(sp)
add s4, t0, t7
li t7, -190381118
mul t0, a3, t7
lw t6, 69(sp)
lw t7, 141(sp)
xor s3, t6, t7
add s2, s2, s4
add s1, s1, t3
lw t7, 45(sp)
or.T t3, a5, t7
lw t6, 18(sp)
add s4, t6, s1
li t7, -158110885
mul s1, s3, t7
lw t6, 102(sp)
add s3, t6, s4
or.T s4, t4, t3
lw t6, 72(sp)
li t7, -133052650
mul t4, t6, t7
lw t6, 165(sp)
lw t7, 138(sp)
and t3, t6, t7, 13
li t7, -76461341
mul s0, s0, t7
li t7, 126293532
mul s4, s4, t7
add s1, s4, s1
add s3, s3, s1
lw t6, 183(sp)
lw t7, 138(sp)
and.1 s1, t6, t7, 13
lw t6, 54(sp)
add s4, t6, s2
lw t6, 60(sp)
and s2, t6, t5, 13
lw t6, 57(sp)
xor.1 t5, t6, a6
add t1, t1, s0
add t1, t1, t2
lw t6, 99(sp)
add t2, t6, s4
add t1, s3, t1
lw t6, 9(sp)
add t6, t6, t2
sw t6, 69(sp)
or.1 s0, a6, s2
lw t6, 141(sp)
lw t7, 39(sp)
and.1 t2, t6, t7, 13
lw t6, 156(sp)
lw t7, 105(sp)
xor.1 s3, t6, t7
lw t7, 195(sp)
and.1 s4, s0, t7, 13
lw t6, 15(sp)
lw t7, 231(sp)
and s0, t6, t7, 13
li t7, 152586909
mul s2, s0, t7
lw t6, 36(sp)
and.T s5, t6, t5, -13
lw t6, 96(sp)
lw t7, 57(sp)
or.1 s0, t6, t7
li t7, -190537639
mul t5, a5, t7
lw t6, 126(sp)
and.T a7, t6, a7, -13
lw t6, 15(sp)
and.1 s6, t6, t2, 13
and.1 s4, s4, s1, 13
lw t6, 210(sp)
lw t7, 162(sp)
xor.1 t2, t6, t7
li t7, -67279270
mul s1, s5, t7
slli s4, s4, 3
add t0, t0, s4
add t4, t4, t0
li t7, -3048066
mul s4, s6, t7
li t7, -36540488
mul t0, s3, t7
li t7, 137965015
mul t3, t3, t7
add s3, s4, s1
lw t6, 126(sp)
lw t7, 150(sp)
or.T s1, t6, t7
lw t6, 231(sp)
lw t7, 12(sp)
or s4, t6, t7, -13
add t3, s2, t3
li t7, 135776293
mul a7, a7, t7
add t4, t4, s3
add t6, t1, t4
sw t6, 66(sp)
or.T s1, s4, s1
lw t6, 189(sp)
or t1, t6, s0, -13
lw t6, 120(sp)
lw t7, 126(sp)
xor t4, t6, t7
li t7, 145290943
mul s0, t1, t7
lw t6, 144(sp)
lw t7, 141(sp)
or t1, t6, t7, -13
lw t6, 162(sp)
lw t7, 81(sp)
or.1 s3, t6, t7
li t7, 43227009
mul s2, s1, t7
lw t6, 114(sp)
lw t7, 165(sp)
xor s1, t6, t7
add t5, t5, a7
li t7, 119244086
mul a7, s3, t7
li t7, 172159200
mul t6, a6, t7
sw t6, 45(sp)
add a7, a7, s2
lw t6, 123(sp)
lw t7, 60(sp)
and.1 s2, t6, t7, 13
xor.T s1, s1, t2
lw t6, 126(sp)
xor t2, t6, s2
add s2, t5, s0
lw t6, 39(sp)
lw t7, 108(sp)
or.T t5, t6, t7
lw t6, 129(sp)
and t4, t6, t4, 13
li t7, 161996249
mul s0, t4, t7
lw t7, 39(sp)
xor t4, a5, t7
add t0, s2, t0
and.T t4, a6, t4, -13
add t0, t3, t0
lw t6, 144(sp)
lw t7, 207(sp)
and.1 a6, t6, t7, 13
lw t7, 150(sp)
xor t3, a6, t7
lw t6, 57(sp)
and a6, t6, s1, 13
li t7, -160754853
mul a6, a6, t7
lw t6, 141(sp)
or.T s1, t6, a3
lw t6, 0(sp)
and.T s2, t6, a5, -13
xor.T s1, s1, s2
and t1, s1, t1, 13
li t7, -124060002
mul s1, t3, t7
lw t6, 162(sp)
and.1 t3, t6, t5, 13
li t7, -134918461
mul t1, t1, t7
add t1, s0, t1
li t7, 117793311
mul s0, t2, t7
add t2, a6, t1
lw t6, 96(sp)
li t7, -161714941
mul a6, t6, t7
li t7, 96564747
mul t5, t4, t7
lw t6, 84(sp)
and t1, t6, a5, 13
add t2, t2, s1
add t4, a7, s0
lw t6, 231(sp)
lw t7, 162(sp)
or a7, t6, t7, -13
add t6, t0, t4
sw t6, 33(sp)
lw t6, 210(sp)
lw t7, 114(sp)
and.T t4, t6, t7, -13
slli t0, t3, 6
add t0, t5, t0
lw t6, 24(sp)
lw t7, 21(sp)
or.1 t3, t6, t7
lw t7, 195(sp)
xor t5, a3, t7
li t7, -32244883
and.1 t6, a4, t7, 13
sw t6, 39(sp)
add t6, t2, t0
sw t6, 12(sp)
and.1 t0, t3, t5, 13
li t7, -32244883
or.1 t6, a4, t7
sw t6, 30(sp)
li t7, 9933121
mul t1, t1, t7
or a7, a7, t4, -13
lw t7, 123(sp)
or.T t2, a5, t7
lw t6, 75(sp)
li t7, -104285340
mul a5, t6, t7
li t7, -16514568
mul t2, t2, t7
li t7, 51382640
mul a7, a7, t7
li t7, -32244883
xor t6, a4, t7
sw t6, 84(sp)
add t2, a7, t2
add a7, t1, a5
li t7, -156027483
mul t6, a4, t7
sw t6, 108(sp)
lw t6, 27(sp)
lw t7, 15(sp)
and t1, t6, t7, 13
lw t6, 174(sp)
or.1 t0, t6, t0
add a5, a6, t2
xor a3, t0, a3
li t7, -32244883
and.T t6, a4, t7, -13
sw t6, 21(sp)
li t7, 187126771
mul t6, a4, t7
sw t6, 96(sp)
li t7, -32244883
and t6, a4, t7, 13
sw t6, 6(sp)
li t7, 13458796
mul a6, t1, t7
lw t6, 39(sp)
li t7, 112118419
mul t6, t6, t7
sw t6, 81(sp)
li t7, -32244883
xor.1 t6, a4, t7
sw t6, 102(sp)
lw t7, 30(sp)
or.T t6, a4, t7
sw t6, 27(sp)
lw t6, 6(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 18(sp)
lw t6, 21(sp)
and t6, t6, a4, 13
sw t6, 0(sp)
lw t6, 39(sp)
lw t7, 84(sp)
or.1 t0, t6, t7
li t7, -32244883
xor.T t6, a4, t7
sw t6, 54(sp)
li t7, -137378265
mul a3, a3, t7
li t7, 188173605
mul t6, t0, t7
sw t6, 9(sp)
li t7, -32244883
or t6, a4, t7, -13
sw t6, 24(sp)
add t1, a7, a3
lw t7, 204(sp)
or.1 t0, a4, t7
lw t6, 102(sp)
li t7, -172415695
mul t6, t6, t7
sw t6, 87(sp)
lw t7, 102(sp)
xor a3, a4, t7
lw t6, 24(sp)
lw t7, 102(sp)
and.T a7, t6, t7, -13
add a6, t1, a6
li t7, -32244883
or.T t6, a4, t7
sw t6, 36(sp)
add a6, a5, a6
lw t6, 84(sp)
and.T t6, t6, a4, -13
sw t6, 90(sp)
lw t7, 36(sp)
and t6, t0, t7, 13
sw t6, 99(sp)
li t7, -76349097
mul a5, a4, t7
lw t6, 45(sp)
add a6, t6, a6
lw t6, 12(sp)
add t0, t6, a6
lw t6, 24(sp)
and.T a6, t6, a4, -13
lw t6, 231(sp)
lw t7, 24(sp)
and t6, t6, t7, 13
sw t6, 45(sp)
li t7, -168363017
mul a6, a6, t7
lw t6, 33(sp)
add t0, t6, t0
lw t6, 66(sp)
add t0, t6, t0
lw t6, 54(sp)
li t7, 142812005
mul t6, t6, t7
sw t6, 66(sp)
lw t6, 36(sp)
or t6, t6, a7, -13
sw t6, 93(sp)
li t7, 135318254
mul t6, a3, t7
sw t6, 33(sp)
lw t6, 69(sp)
add a3, t6, t0
add t6, a5, a6
sw t6, 60(sp)
lw t6, 111(sp)
add a3, t6, a3
lw t6, 159(sp)
add a6, t6, a3
lw t7, 171(sp)
xor t6, a6, t7
sw t6, 72(sp)
lw t6, 186(sp)
xor a3, t6, a6
lw t6, 102(sp)
li t7, 45844776
mul t6, t6, t7
sw t6, 105(sp)
li t7, -32244883
or.T a5, a3, t7
lw t6, 78(sp)
xor t6, t6, a6
sw t6, 114(sp)
or.1 t6, a4, a3
sw t6, 69(sp)
li t7, -32244883
or.1 t6, a3, t7
sw t6, 123(sp)
li t7, -4618784
mul t0, a5, t7
and.T t6, a3, a4, -13
sw t6, 12(sp)
lw t7, 69(sp)
and t2, a5, t7, 13
lw t7, 204(sp)
xor.1 t1, a5, t7
lw t6, 39(sp)
lw t7, 12(sp)
and a6, t6, t7, 13
li t7, -5569666
mul a7, a6, t7
xor t6, a4, a3
sw t6, 78(sp)
xor.T t6, a3, a4
sw t6, 57(sp)
lw t6, 69(sp)
xor.T t3, t6, a4
lw t6, 12(sp)
li t7, -104678813
mul a6, t6, t7
lw t6, 123(sp)
and t3, t6, t3, 13
and.1 t2, a5, t2, 13
lw t7, 0(sp)
xor t2, t2, t7
or t6, a3, a4, -13
sw t6, 15(sp)
lw t6, 39(sp)
lw t7, 15(sp)
or.T t4, t6, t7
li t7, -106940697
mul t5, t2, t7
li t7, -32244883
and.T t6, a3, t7, -13
sw t6, 126(sp)
lw t6, 204(sp)
or t4, t6, t4, -13
lw t6, 78(sp)
lw t7, 18(sp)
and.T t2, t6, t7, -13
lw t7, 27(sp)
and t2, t2, t7, 13
li t7, -83006529
mul t2, t2, t7
li t7, -162517419
mul t3, t3, t7
and t6, a4, a3, 13
sw t6, 75(sp)
lw t7, 9(sp)
add t6, t5, t7
sw t6, 27(sp)
add t0, t3, t0
lw t6, 69(sp)
li t7, 79041513
mul t6, t6, t7
sw t6, 117(sp)
lw t7, 99(sp)
and t1, t1, t7, 13
lw t6, 81(sp)
add t3, t6, t0
lw t6, 69(sp)
lw t7, 24(sp)
and.T t5, t6, t7, -13
and.1 t6, a4, a3, 13
sw t6, 9(sp)
li t7, -32244883
xor.1 t6, a3, t7
sw t6, 81(sp)
li t7, -147599354
mul s0, t4, t7
lw t6, 15(sp)
lw t7, 57(sp)
and t4, t6, t7, 13
and t0, a4, a5, 13
lw t7, 90(sp)
or s1, t5, t7, -13
lw t7, 108(sp)
add a7, a7, t7
lw t7, 96(sp)
add t5, s0, t7
li t7, -160277404
mul t6, s1, t7
sw t6, 0(sp)
lw t6, 54(sp)
lw t7, 69(sp)
or s1, t6, t7, -13
lw t6, 78(sp)
li t7, -32244883
xor.T s0, t6, t7
add t2, t5, t2
or.T t6, a4, a3
sw t6, 99(sp)
li t7, 182815280
mul t5, t1, t7
add t1, t3, t2
lw t6, 99(sp)
or.1 t2, t6, a5
add t1, t1, a6
lw t6, 54(sp)
and a6, t6, t4, 13
lw t6, 57(sp)
lw t7, 6(sp)
or.1 t6, t6, t7
sw t6, 18(sp)
lw t6, 15(sp)
lw t7, 78(sp)
xor.T s2, t6, t7
li t7, 52158076
mul t3, s1, t7
xor.1 a5, a3, a4
lw t6, 15(sp)
lw t7, 36(sp)
or.1 t4, t6, t7
or.T s3, a5, t2
lw t6, 126(sp)
xor.T t2, t6, a3
lw t7, 45(sp)
xor s1, s2, t7
li t7, -89294891
mul t2, t2, t7
li t7, 76418203
add s2, t2, t7
li t7, -122002624
mul t2, s0, t7
lw t6, 78(sp)
lw t7, 99(sp)
xor s4, t6, t7
li t7, -55629278
mul s0, s3, t7
li t7, 174615917
mul s3, a6, t7
or.1 a6, a3, s4
add s4, s3, t5
lw t7, 57(sp)
or.1 s5, t0, t7
lw t6, 24(sp)
lw t7, 99(sp)
and.1 t0, t6, t7, 13
and.T t5, a4, a5, -13
add s3, s0, s2
li t7, 45273127
mul s0, s5, t7
add a7, a7, s4
and.T s4, a3, a5, -13
li t7, 23043006
mul a6, a6, t7
lw t6, 69(sp)
lw t7, 21(sp)
or s2, t6, t7, -13
lw t7, 81(sp)
xor.T s5, s1, t7
lw t6, 27(sp)
add a7, t6, a7
lw t7, 54(sp)
xor s1, t0, t7
lw t7, 66(sp)
add t0, t3, t7
li t7, -137805097
mul s5, s5, t7
and.1 t3, t4, a5, 13
add a7, t1, a7
add t6, s3, s5
sw t6, 111(sp)
li t7, -32244883
or t6, a3, t7, -13
sw t6, 27(sp)
lw t6, 15(sp)
lw t7, 99(sp)
xor.1 t1, t6, t7
li t7, -16058284
mul s3, s4, t7
lw t7, 27(sp)
and.1 t4, t5, t7, 13
lw t7, 87(sp)
add s0, s0, t7
or.1 t1, t1, a4
li t7, 63051240
mul t5, t1, t7
lw t7, 39(sp)
or s1, s1, t7, -13
li t7, -41803661
mul t1, s2, t7
add t6, t2, s3
sw t6, 66(sp)
li t7, -94059980
mul t2, s1, t7
lw t6, 84(sp)
li t7, -144396865
mul s1, t6, t7
lw t7, 0(sp)
add s0, s0, t7
li t7, -113861535
mul s2, a3, t7
lw t6, 57(sp)
lw t7, 18(sp)
xor.T s3, t6, t7
xor.T t4, t4, s3
lw t6, 54(sp)
ori t6, t6, 0
sw t6, 87(sp)
li t7, 64343460
mul s3, t3, t7
li t7, 159237457
mul t4, t4, t7
add s4, t2, t5
add t5, s2, s1
li t7, -101596051
mul t3, a3, t7
lw t6, 6(sp)
lw t7, 204(sp)
and t2, t6, t7, 13
lw t6, 33(sp)
add t5, t6, t5
add s1, t1, s3
lw t6, 231(sp)
lw t7, 204(sp)
and s2, t6, t7, 13
lw t6, 60(sp)
add t1, t6, s4
li t7, -32244883
xor t6, a3, t7
sw t6, 120(sp)
add a6, a6, s0
add a6, a6, t0
xor t6, a3, a3
sw t6, 18(sp)
lw t6, 120(sp)
li t7, 58288630
mul t0, t6, t7
lw t6, 9(sp)
lw t7, 78(sp)
xor.1 s0, t6, t7
li t7, 134931175
mul t6, s0, t7
sw t6, 90(sp)
lw t6, 18(sp)
or.T s0, t6, a3
add t6, a7, a6
sw t6, 60(sp)
li t7, -187879548
mul t6, s0, t7
sw t6, 33(sp)
li t7, -32244883
xor.T t6, a3, t7
sw t6, 45(sp)
lw t6, 99(sp)
slli t6, t6, 6
sw t6, 96(sp)
add a6, s1, t4
li t7, 149511930
mul a7, s2, t7
lw t6, 93(sp)
li t7, -37867757
mul t4, t6, t7
add t6, t5, t4
sw t6, 93(sp)
add a7, a7, t0
add t6, t3, a7
sw t6, 0(sp)
lw t6, 204(sp)
lw t7, 126(sp)
and t0, t6, t7, 13
lw t6, 45(sp)
xor.T t6, t6, t2
sw t6, 108(sp)
lw t6, 12(sp)
lw t7, 45(sp)
xor t5, t6, t7
lw t6, 24(sp)
lw t7, 9(sp)
or.T s1, t6, t7
lw t6, 45(sp)
or a7, t6, a5, -13
li t7, -75620943
mul t0, t0, t7
lw t6, 120(sp)
li t7, -32244883
xor.1 t3, t6, t7
lw t6, 24(sp)
lw t7, 204(sp)
or.T s0, t6, t7
lw t7, 39(sp)
and t4, a3, t7, 13
lw t6, 78(sp)
lw t7, 24(sp)
and.T t2, t6, t7, -13
lw t6, 27(sp)
lw t7, 30(sp)
and.T s3, t6, t7, -13
add a6, t1, a6
lw t6, 66(sp)
add a6, t6, a6
lw t6, 111(sp)
add s2, t6, a6
li t7, -149829575
mul t1, s1, t7
lw t6, 21(sp)
lw t7, 126(sp)
or s4, t6, t7, -13
lw t6, 6(sp)
xor.T a6, t6, a5
lw t7, 33(sp)
add t1, t1, t7
or.T s1, t5, s3
li t7, -32244883
or.T t6, s0, t7
sw t6, 66(sp)
lw t6, 105(sp)
add t1, t6, t1
lw t6, 108(sp)
and.T s0, t6, s4, -13
lw t6, 60(sp)
add t5, t6, s2
lw t6, 69(sp)
li t7, -32244883
xor.T s2, t6, t7
li t7, -133713277
mul t6, a5, t7
sw t6, 9(sp)
and.T a7, s2, a7, -13
and t3, s1, t3, 13
li t7, 179018998
mul s0, s0, t7
xor.T t4, a4, t4
li t7, -108949810
mul t4, t4, t7
lw t6, 84(sp)
li t7, 32244883
and.T s1, t6, t7, -13
li t7, 172241809
mul t3, t3, t7
li t7, -32244883
and t6, a3, t7, 13
sw t6, 105(sp)
lw t7, 126(sp)
and.1 t2, t2, t7, 13
add t0, t0, t3
lw t6, 87(sp)
xor.1 s1, t6, s1
lw t7, 93(sp)
add t3, t5, t7
li t7, -101972446
mul t5, s1, t7
lw t6, 39(sp)
and.T t6, t6, a4, -13
sw t6, 87(sp)
lw t6, 96(sp)
add t4, t6, t4
lw t7, 90(sp)
add t0, t0, t7
li t7, -32244883
and.1 s3, a3, t7, 13
lw t6, 45(sp)
xor.T s1, t6, a4
add s2, t0, s0
li t7, -138520845
mul t0, a5, t7
lw t6, 15(sp)
lw t7, 36(sp)
and.T t6, t6, t7, -13
sw t6, 33(sp)
lw t7, 12(sp)
and.T s3, s3, t7, -13
lw t7, 120(sp)
or.1 s0, a4, t7
lw t6, 105(sp)
or.1 s5, t6, a4
add s4, t1, s2
xor.1 t1, a6, s5
lw t6, 39(sp)
lw t7, 126(sp)
xor.1 s2, t6, t7
or.T s5, s1, s3
lw t6, 15(sp)
li t7, -33827133
mul a6, t6, t7
lw t6, 0(sp)
add s4, t6, s4
lw t7, 117(sp)
add s3, t5, t7
and.1 s1, t1, a7, 13
and.T a7, s5, s2, -13
add t6, t3, s4
sw t6, 60(sp)
li t7, 105726775
mul t3, s0, t7
li t7, 164040225
mul t5, t2, t7
add t2, t4, s3
slli t4, a7, 6
lw t6, 120(sp)
xor a7, t6, a3
lw t6, 78(sp)
li t7, -32244883
and.T t1, t6, t7, -13
lw t6, 66(sp)
li t7, -95182023
mul s0, t6, t7
li t7, -17296092
add s0, s0, t7
li t7, -133303704
mul s1, s1, t7
lw t6, 15(sp)
li t7, -14761071
mul s4, t6, t7
add s2, s0, t4
lw t6, 99(sp)
li t7, 18000305
mul t4, t6, t7
add s3, a6, t0
lw t6, 123(sp)
lw t7, 69(sp)
and t0, t6, t7, 13
lw t6, 12(sp)
lw t7, 57(sp)
xor s0, t6, t7
lw t6, 84(sp)
li t7, -32244883
xor s5, t6, t7
add a6, s4, t4
lw t7, 15(sp)
xor.T t4, a3, t7
add t5, s1, t5
add t3, t3, t5
add t6, s2, s3
sw t6, 69(sp)
add t6, t2, t3
sw t6, 66(sp)
lw t6, 87(sp)
and.T t5, t6, s5, -13
lw t6, 27(sp)
li t7, -32244883
xor.T s1, t6, t7
lw t6, 78(sp)
li t7, -32244883
and.1 t2, t6, t7, 13
and s2, s0, a7, 13
lw t6, 231(sp)
and a7, t6, a5, 13
lw t6, 81(sp)
xor.1 s0, t6, a4
andi t3, t0, 0
lw t6, 126(sp)
and.1 t0, t6, t2, 13
lw t6, 105(sp)
slli t2, t6, 5
xor.1 t1, s0, t1
xor.1 s0, a4, s1
or.1 s1, t5, s2
li t7, 143012980
mul t5, t0, t7
lw t7, 99(sp)
and.1 t0, a3, t7, 13
li t7, -32244883
xor.T t4, t4, t7
lw t6, 24(sp)
or.T s3, t6, s1
lw t6, 54(sp)
li t7, -32244883
or s1, t6, t7, -13
lw t6, 33(sp)
lw t7, 39(sp)
or s2, t6, t7, -13
lw t6, 123(sp)
xor t6, t6, a4
sw t6, 0(sp)
and t1, t1, s2, 13
li t7, 153066010
mul t1, t1, t7
li t7, -119678028
mul s2, t3, t7
add t1, t1, t5
li t7, -2517921
mul s3, s3, t7
li t7, -87342368
mul t3, t4, t7
lw t6, 84(sp)
lw t7, 24(sp)
and.1 t5, t6, t7, 13
li t7, -20508045
mul t4, a4, t7
lw t6, 54(sp)
xor.T s5, t6, a4
add t3, a6, t3
lw t7, 6(sp)
xor.T a6, s0, t7
lw t6, 123(sp)
lw t7, 102(sp)
xor.1 s0, t6, t7
slli s4, a6, 1
lw t6, 57(sp)
and.1 s1, t6, s1, 13
or a7, a7, s5, -13
add a6, s3, t2
lw t6, 84(sp)
lw t7, 120(sp)
and s3, t6, t7, 13
lw t6, 9(sp)
add a6, t6, a6
add a6, a6, s2
li t7, -42986589
mul t6, s1, t7
sw t6, 33(sp)
lw t6, 24(sp)
lw t7, 30(sp)
xor t2, t6, t7
lw t6, 78(sp)
xor.1 s5, t6, s3
lw t6, 84(sp)
lw t7, 99(sp)
or.T s1, t6, t7
li t7, -64366445
add s3, s4, t7
lw t7, 75(sp)
and.1 a5, a5, t7, 13
lw t6, 18(sp)
and.T s2, t6, a4, -13
xor.T s2, t5, s2
li t7, 91744361
mul t0, t0, t7
li t7, 96501206
mul s4, s5, t7
lw t6, 18(sp)
xor t5, t6, s0
add t4, t0, t4
lw t6, 84(sp)
lw t7, 126(sp)
xor.T t0, t6, t7
lw t6, 99(sp)
lw t7, 231(sp)
and s0, t6, t7, 13
add t4, t4, s4
add t3, s3, t3
add t3, t1, t3
lw t6, 75(sp)
li t7, -24318034
mul s3, t6, t7
li t7, -96042755
mul t6, a3, t7
sw t6, 9(sp)
lw t6, 78(sp)
and.T s4, t6, s1, -13
lw t6, 102(sp)
lw t7, 6(sp)
and.T t1, t6, t7, -13
and.1 t0, t0, s0, 13
lw t7, 21(sp)
xor s5, s2, t7
li t7, 190172603
mul s1, t0, t7
li t7, -64850871
mul s0, a5, t7
li t7, -156076923
mul a5, a4, t7
lw t6, 45(sp)
li t7, -104672541
mul s6, t6, t7
lw t7, 0(sp)
and.T t0, a4, t7, -13
li t7, -193623775
mul s2, s4, t7
and t2, t2, t5, 13
or.1 s4, a7, s5
li t7, -144835638
mul t5, t2, t7
add t2, s6, s3
lw t6, 21(sp)
xor.1 a7, t6, a4
li t7, -48126056
mul s3, s4, t7
add t4, s3, t4
add t3, t3, t4
add t4, s1, t5
add a6, a6, t3
add t4, s2, t4
lw t6, 54(sp)
lw t7, 18(sp)
or t3, t6, t7, -13
lw t6, 33(sp)
add t4, t6, t4
add t2, t4, t2
add t2, s0, t2
li t7, 27163708
mul t3, t3, t7
lw t6, 69(sp)
add a6, t6, a6
li t7, -107416271
mul t1, t1, t7
lw t6, 21(sp)
li t7, 32244883
or.1 t4, t6, t7
lw t6, 105(sp)
lw t7, 24(sp)
and.1 t5, t6, t7, 13
add a6, a6, t2
li t7, -32244883
or t4, t4, t7, -13
lw t6, 15(sp)
and t5, t6, t5, 13
lw t6, 24(sp)
lw t7, 204(sp)
xor t2, t6, t7
lw t6, 66(sp)
add a6, t6, a6
li t7, -175513464
mul t0, t0, t7
add t3, t0, t3
lw t7, 18(sp)
xor t0, t5, t7
li t7, 95735299
mul t5, t4, t7
li t7, 47651736
mul t4, a7, t7
lw t6, 9(sp)
add a7, t6, t5
add a5, t3, a5
add t3, a5, t4
lw t6, 120(sp)
lw t7, 39(sp)
or.1 t5, t6, t7
lw t6, 39(sp)
li t7, 178506787
mul t4, t6, t7
li t7, 18487953
mul a5, t0, t7
lw t6, 27(sp)
lw t7, 102(sp)
or.T s1, t6, t7
lw t7, 24(sp)
or.1 t2, t2, t7
lw t6, 99(sp)
lw t7, 36(sp)
xor.T s0, t6, t7
add t1, a5, t1
lw t6, 84(sp)
lw t7, 99(sp)
xor.T a5, t6, t7
lw t6, 204(sp)
li t7, -32244883
xor.1 t0, t6, t7
xor.T t5, t5, s1
li t7, 12643699
mul t5, t5, t7
add t1, t3, t1
add t6, t5, t4
sw t6, 30(sp)
lw t7, 54(sp)
xor.T t4, s0, t7
add t3, a7, t1
lw t6, 15(sp)
li t7, 28974221
mul a7, t6, t7
xor.T t5, t2, a3
lw t6, 231(sp)
lw t7, 204(sp)
or t1, t6, t7, -13
and.1 t2, t4, a4, 13
lw t6, 45(sp)
li t7, -32244883
xor a3, t6, t7
li t7, -18390595
mul t4, t5, t7
add t3, t3, t4
add t6, a6, t3
sw t6, 0(sp)
lw t6, 12(sp)
lw t7, 39(sp)
or a6, t6, t7, -13
li t7, -167767914
mul a3, a3, t7
li t7, -25197642
mul t2, t2, t7
li t7, -86146438
mul t3, t0, t7
lw t6, 27(sp)
xor t4, t6, a4
lw t6, 99(sp)
lw t7, 204(sp)
or t5, t6, t7, -13
lw t6, 75(sp)
xor.1 a4, t6, a4
li t7, 151883973
mul t1, t1, t7
lw t7, 39(sp)
and.T a5, a5, t7, -13
lw t6, 186(sp)
li t7, 99550385
and.1 t0, t6, t7, 13
or a5, a5, a6, -13
li t7, 189422658
mul a5, a5, t7
add a5, a5, t2
add a6, a7, t3
li t7, -5868326
mul a7, t4, t7
xor.T a4, t5, a4
add a5, a5, t1
lw t6, 42(sp)
li t7, 99550385
or.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 186(sp)
li t7, 99550385
xor t1, t6, t7
li t7, -164219767
mul a4, a4, t7
lw t6, 132(sp)
li t7, -99550385
and.1 t6, t6, t7, 13
sw t6, 39(sp)
lw t6, 42(sp)
lw t7, 186(sp)
xor.T t6, t6, t7
sw t6, 174(sp)
lw t6, 186(sp)
lw t7, 42(sp)
or.T t6, t6, t7
sw t6, 141(sp)
lw t6, 42(sp)
li t7, 99550385
xor t6, t6, t7
sw t6, 9(sp)
lw t6, 186(sp)
li t7, 99550385
or.T t6, t6, t7
sw t6, 66(sp)
lw t6, 141(sp)
xor t6, t6, t0
sw t6, 21(sp)
lw t6, 186(sp)
li t7, 99550385
and.T t6, t6, t7, -13
sw t6, 75(sp)
lw t7, 75(sp)
xor.T t6, t1, t7
sw t6, 18(sp)
lw t6, 42(sp)
li t7, 99550385
and.1 t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 186(sp)
li t7, 99550385
and t6, t6, t7, 13
sw t6, 99(sp)
lw t6, 42(sp)
li t7, 99550385
or t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 54(sp)
lw t7, 186(sp)
or.T t1, t6, t7
lw t6, 99(sp)
li t7, 188739144
mul t0, t6, t7
add a3, a3, a6
add a3, a3, a7
lw t6, 66(sp)
li t7, -83739069
mul a7, t6, t7
lw t6, 42(sp)
lw t7, 186(sp)
or.1 t6, t6, t7
sw t6, 108(sp)
li t7, 99550385
or.T a6, t1, t7
lw t6, 186(sp)
lw t7, 42(sp)
and.T t6, t6, t7, -13
sw t6, 150(sp)
add a5, a5, a3
add t6, a7, t0
sw t6, 6(sp)
lw t6, 42(sp)
lw t7, 186(sp)
and t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 150(sp)
lw t7, 54(sp)
and a3, t6, t7, 13
lw t6, 42(sp)
li t7, 99550385
and.T t6, t6, t7, -13
sw t6, 177(sp)
add a5, a5, a4
lw t6, 42(sp)
li t7, 99550385
xor.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 174(sp)
li t7, -126415699
mul t6, t6, t7
sw t6, 105(sp)
lw t6, 15(sp)
li t7, -181083019
mul t6, t6, t7
sw t6, 69(sp)
lw t6, 177(sp)
li t7, -99550385
or a4, t6, t7, -13
lw t6, 186(sp)
li t7, 99550385
or t6, t6, t7, -13
sw t6, 192(sp)
lw t6, 30(sp)
add a5, t6, a5
lw t6, 75(sp)
li t7, 153110305
mul t6, t6, t7
sw t6, 210(sp)
li t7, -99512708
mul t6, a6, t7
sw t6, 78(sp)
lw t6, 0(sp)
add a5, t6, a5
lw t6, 186(sp)
li t7, 182851460
mul t6, t6, t7
sw t6, 144(sp)
lw t6, 60(sp)
add t6, t6, a5
sw t6, 225(sp)
lw t6, 192(sp)
li t7, -114027611
mul t6, t6, t7
sw t6, 183(sp)
lw t6, 42(sp)
li t7, 99550385
and t6, t6, t7, 13
sw t6, 204(sp)
lw t6, 99(sp)
xor.1 t6, t6, a3
sw t6, 0(sp)
lw t6, 225(sp)
lw t7, 225(sp)
xor t6, t6, t7
sw t6, 111(sp)
lw t6, 42(sp)
lw t7, 186(sp)
xor t6, t6, t7
sw t6, 189(sp)
lw t6, 225(sp)
li t7, 54537180
xor t6, t6, t7
sw t6, 30(sp)
lw t6, 30(sp)
li t7, 99550385
and.T t6, t6, t7, -13
sw t6, 213(sp)
lw t6, 30(sp)
li t7, 99550385
xor.1 t6, t6, t7
sw t6, 216(sp)
lw t7, 75(sp)
xor a4, a4, t7
lw t6, 42(sp)
lw t7, 30(sp)
xor.T t6, t6, t7
sw t6, 84(sp)
lw t6, 186(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 30(sp)
lw t7, 42(sp)
and.1 t6, t6, t7, 13
sw t6, 57(sp)
lw t6, 30(sp)
lw t7, 186(sp)
xor.1 t6, t6, t7
sw t6, 171(sp)
lw t6, 171(sp)
lw t7, 18(sp)
and a6, t6, t7, 13
lw t6, 30(sp)
lw t7, 186(sp)
xor t6, t6, t7
sw t6, 165(sp)
lw t6, 30(sp)
lw t7, 30(sp)
xor t6, t6, t7
sw t6, 207(sp)
lw t6, 30(sp)
lw t7, 186(sp)
and.T t6, t6, t7, -13
sw t6, 129(sp)
lw t6, 42(sp)
lw t7, 30(sp)
xor.1 a3, t6, t7
lw t6, 81(sp)
lw t7, 57(sp)
and.T a5, t6, t7, -13
lw t6, 186(sp)
or t6, t6, a3, -13
sw t6, 60(sp)
lw t6, 30(sp)
li t7, -120503231
mul t6, t6, t7
sw t6, 102(sp)
lw t6, 129(sp)
xor.1 t0, t6, a3
li t7, 137884555
mul a7, a6, t7
lw t6, 30(sp)
li t7, 99550385
xor t6, t6, t7
sw t6, 147(sp)
li t7, 4448198
mul a6, a3, t7
lw t6, 30(sp)
li t7, 99550385
and.1 t6, t6, t7, 13
sw t6, 87(sp)
lw t7, 171(sp)
and t6, a3, t7, 13
sw t6, 135(sp)
lw t6, 30(sp)
lw t7, 42(sp)
and t6, t6, t7, 13
sw t6, 93(sp)
li t7, -117115619
mul t1, t0, t7
lw t6, 30(sp)
lw t7, 186(sp)
or.1 t6, t6, t7
sw t6, 198(sp)
lw t6, 30(sp)
lw t7, 186(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
lw t6, 216(sp)
xor.T a5, t6, a5
lw t6, 30(sp)
lw t7, 42(sp)
and.T t6, t6, t7, -13
sw t6, 45(sp)
li t7, 117623994
mul t0, a5, t7
lw t6, 171(sp)
lw t7, 42(sp)
xor.T a5, t6, t7
lw t6, 186(sp)
lw t7, 42(sp)
or t6, t6, t7, -13
sw t6, 120(sp)
li t7, -45118158
mul t2, a4, t7
lw t6, 93(sp)
lw t7, 207(sp)
and.T t3, t6, t7, -13
add t4, a7, t0
lw t6, 87(sp)
lw t7, 75(sp)
xor t0, t6, t7
lw t6, 99(sp)
lw t7, 198(sp)
and.T a7, t6, t7, -13
lw t6, 204(sp)
lw t7, 93(sp)
xor.1 a4, t6, t7
lw t7, 213(sp)
and.1 t5, t3, t7, 13
lw t6, 45(sp)
lw t7, 174(sp)
xor t3, t6, t7
add t6, t4, t1
sw t6, 123(sp)
lw t6, 42(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 162(sp)
li t7, -88897522
mul t6, t5, t7
sw t6, 96(sp)
add t6, a6, t2
sw t6, 195(sp)
lw t6, 30(sp)
li t7, 99550385
or t6, t6, t7, -13
sw t6, 153(sp)
lw t6, 129(sp)
lw t7, 231(sp)
or t6, t6, t7, -13
sw t6, 33(sp)
lw t6, 186(sp)
li t7, 99550385
or.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 84(sp)
lw t7, 42(sp)
xor.T a6, t6, t7
lw t6, 198(sp)
lw t7, 9(sp)
and t2, t6, t7, 13
li t7, 180911951
mul t6, a6, t7
sw t6, 138(sp)
lw t6, 42(sp)
lw t7, 30(sp)
or.T t6, t6, t7
sw t6, 18(sp)
li t7, 99550385
and t6, a3, t7, 13
sw t6, 27(sp)
lw t6, 39(sp)
and.1 t1, t6, t0, 13
lw t6, 75(sp)
or.1 a6, t6, t3
lw t6, 30(sp)
li t7, 99550385
and t6, t6, t7, 13
sw t6, 159(sp)
lw t6, 162(sp)
lw t7, 165(sp)
or t3, t6, t7, -13
lw t6, 42(sp)
lw t7, 30(sp)
or.1 t6, t6, t7
sw t6, 126(sp)
li t7, -150045288
mul t0, a6, t7
and t3, a5, t3, 13
lw t6, 147(sp)
lw t7, 9(sp)
or.1 t4, t6, t7
lw t6, 126(sp)
lw t7, 147(sp)
xor t5, t6, t7
lw t6, 186(sp)
lw t7, 126(sp)
or.1 a5, t6, t7
lw t6, 36(sp)
lw t7, 186(sp)
and a6, t6, t7, 13
lw t6, 12(sp)
xor.1 t2, t6, t2
lw t6, 30(sp)
li t7, 99550385
or.1 t6, t6, t7
sw t6, 90(sp)
lw t7, 21(sp)
or.T t2, t2, t7
lw t7, 24(sp)
or.1 s0, t5, t7
lw t6, 84(sp)
lw t7, 216(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 60(sp)
or.T a7, t6, a7
li t7, 20743223
mul t5, a7, t7
lw t7, 135(sp)
and.1 a7, s0, t7, 13
li t7, 148661557
mul t6, t3, t7
sw t6, 60(sp)
lw t7, 171(sp)
xor.1 t4, t4, t7
li t7, -98721036
mul t3, a7, t7
lw t6, 198(sp)
and.1 a4, t6, a4, 13
li t7, -53499172
mul a7, t1, t7
lw t6, 174(sp)
xor.T t6, t6, a3
sw t6, 39(sp)
add t6, t5, t3
sw t6, 222(sp)
li t7, -83442569
mul t1, a4, t7
li t7, 95463448
mul a4, t2, t7
lw t6, 171(sp)
lw t7, 30(sp)
or t5, t6, t7, -13
add a4, t0, a4
lw t7, 42(sp)
and t0, a5, t7, 13
lw t6, 78(sp)
add t6, t6, t1
sw t6, 78(sp)
lw t6, 30(sp)
li t7, 99550385
or.T t6, t6, t7
sw t6, 180(sp)
li t7, 91670360
mul t6, t0, t7
sw t6, 219(sp)
lw t6, 162(sp)
lw t7, 18(sp)
xor t0, t6, t7
lw t6, 198(sp)
lw t7, 24(sp)
xor.1 t3, t6, t7
lw t7, 0(sp)
and.1 t2, t0, t7, 13
lw t6, 90(sp)
lw t7, 156(sp)
xor s0, t6, t7
lw t6, 30(sp)
lw t7, 186(sp)
and t6, t6, t7, 13
sw t6, 135(sp)
li t7, 49660117
mul t1, t4, t7
lw t7, 117(sp)
and.1 t0, t5, t7, 13
li t7, -134856036
mul t4, t0, t7
lw t6, 42(sp)
lw t7, 159(sp)
xor.1 t0, t6, t7
li t7, -168485362
mul t0, t0, t7
lw t6, 96(sp)
add a4, t6, a4
lw t6, 123(sp)
add t5, t6, a4
li t7, -96579403
mul t6, a5, t7
sw t6, 0(sp)
and a6, a6, s0, 13
lw t6, 33(sp)
li t7, -114328385
mul a4, t6, t7
lw t6, 186(sp)
lw t7, 42(sp)
and.1 t6, t6, t7, 13
sw t6, 96(sp)
lw t6, 102(sp)
add t4, t6, t4
add t5, t5, a7
lw t6, 96(sp)
lw t7, 18(sp)
xor.T a5, t6, t7
lw t7, 138(sp)
add t4, t4, t7
li t7, 105291264
mul t6, a6, t7
sw t6, 102(sp)
li t7, 54258510
mul a7, t3, t7
lw t6, 21(sp)
li t7, 156081540
mul a6, t6, t7
li t7, 13915206
mul t2, t2, t7
lw t6, 57(sp)
lw t7, 216(sp)
and.1 t3, t6, t7, 13
lw t7, 195(sp)
add t6, t5, t7
sw t6, 33(sp)
lw t6, 192(sp)
lw t7, 45(sp)
xor.T t5, t6, t7
li t7, 99550385
or.1 t6, t5, t7
sw t6, 21(sp)
lw t7, 204(sp)
xor.1 t6, a3, t7
sw t6, 123(sp)
lw t6, 147(sp)
lw t7, 177(sp)
xor.1 t6, t6, t7
sw t6, 195(sp)
add t1, t4, t1
lw t6, 222(sp)
add t6, t6, t1
sw t6, 138(sp)
lw t6, 186(sp)
lw t7, 177(sp)
xor t1, t6, t7
add a7, a7, t2
li t7, 76849572
mul t2, t3, t7
add a6, a6, t0
add a7, a6, a7
lw t6, 60(sp)
lw t7, 78(sp)
add a6, t6, t7
lw t6, 120(sp)
lw t7, 54(sp)
and.1 t0, t6, t7, 13
lw t6, 219(sp)
add t5, t6, a6
slli a6, a5, 7
li t7, 72699311
mul a5, t1, t7
lw t6, 216(sp)
li t7, 46949689
mul t1, t6, t7
lw t6, 147(sp)
lw t7, 180(sp)
or.T t4, t6, t7
lw t6, 159(sp)
xor.1 t6, t6, a3
sw t6, 60(sp)
lw t6, 93(sp)
lw t7, 189(sp)
and t3, t6, t7, 13
lw t6, 66(sp)
xor t0, t6, t0
lw t6, 69(sp)
add t6, t6, t5
sw t6, 78(sp)
li t7, 184814307
mul t0, t0, t7
lw t6, 39(sp)
lw t7, 162(sp)
and t5, t6, t7, 13
add a4, a4, t0
lw t6, 186(sp)
lw t7, 30(sp)
and.1 t6, t6, t7, 13
sw t6, 39(sp)
add a4, t2, a4
lw t6, 30(sp)
lw t7, 66(sp)
xor.1 t0, t6, t7
li t7, -7128908
mul t5, t5, t7
lw t6, 0(sp)
add a4, t6, a4
lw t6, 27(sp)
li t7, -138841346
mul t2, t6, t7
lw t7, 162(sp)
or t4, t4, t7, -13
add s0, a4, t2
lw t6, 15(sp)
lw t7, 108(sp)
and.T a4, t6, t7, -13
lw t6, 9(sp)
and t2, t6, t3, 13
lw t6, 180(sp)
li t7, 61071247
mul t6, t6, t7
sw t6, 180(sp)
add s0, a7, s0
add a7, t5, t1
lw t6, 186(sp)
lw t7, 117(sp)
or.T t3, t6, t7
lw t6, 147(sp)
li t7, 160323050
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 171(sp)
xor.T t1, t6, t4
lw t7, 21(sp)
and.1 t1, t1, t7, 13
li t7, 29467201
mul t1, t1, t7
lw t6, 102(sp)
add t5, t6, s0
lw t7, 210(sp)
add a6, a6, t7
lw t6, 195(sp)
lw t7, 216(sp)
and t4, t6, t7, 13
add s0, a6, a7
lw t6, 186(sp)
and.1 a6, t6, t3, 13
lw t6, 204(sp)
li t7, 187773877
mul a7, t6, t7
lw t6, 159(sp)
li t7, 99550385
or t6, t6, t7, -13
sw t6, 69(sp)
add a7, a5, a7
lw t6, 138(sp)
add t5, t6, t5
lw t6, 69(sp)
and.T t0, t6, t0, -13
lw t6, 30(sp)
lw t7, 42(sp)
xor t6, t6, t7
sw t6, 102(sp)
add t6, t1, s0
sw t6, 138(sp)
lw t6, 84(sp)
li t7, 16659732
mul t1, t6, t7
lw t6, 87(sp)
lw t7, 66(sp)
and.T t3, t6, t7, -13
or t4, t2, t4, -13
lw t6, 102(sp)
lw t7, 39(sp)
and.T s0, t6, t7, -13
lw t6, 54(sp)
and.1 a5, t6, a3, 13
lw t6, 60(sp)
li t7, 115752467
mul t2, t6, t7
lw t6, 186(sp)
lw t7, 30(sp)
or.T t6, t6, t7
sw t6, 21(sp)
lw t6, 51(sp)
xor.T s0, t6, s0
lw t6, 78(sp)
add s2, t6, t5
lw t6, 21(sp)
li t7, -99550385
or t5, t6, t7, -13
li t7, 175653084
mul s1, t4, t7
and.T a6, a3, a6, -13
lw t6, 6(sp)
add s3, t6, s2
li t7, -131910435
mul s2, a6, t7
lw t6, 123(sp)
lw t7, 12(sp)
and.T t4, t6, t7, -13
li t7, 15737041
mul t5, t5, t7
lw t6, 75(sp)
lw t7, 36(sp)
xor.T a6, t6, t7
or.1 a4, a4, a6
lw t6, 36(sp)
lw t7, 39(sp)
and a6, t6, t7, 13
lw t6, 33(sp)
add t6, t6, s3
sw t6, 159(sp)
li t7, 99550385
xor.1 s0, s0, t7
li t7, -54686037
mul s4, s0, t7
li t7, 53108731
mul s0, t3, t7
add s3, a7, s1
add s1, s2, s4
li t7, -185761053
mul t3, t0, t7
lw t6, 30(sp)
li t7, 99550385
xor.T a7, t6, t7
add t0, s0, t1
lw t6, 0(sp)
add t1, t6, s3
lw t6, 9(sp)
lw t7, 186(sp)
or.1 s0, t6, t7
lw t6, 189(sp)
li t7, -38674554
mul t6, t6, t7
sw t6, 123(sp)
add t2, t5, t2
add t5, t1, s1
lw t6, 108(sp)
li t7, 99550385
or.1 t6, t6, t7
sw t6, 27(sp)
add t4, t3, t4
lw t6, 213(sp)
lw t7, 204(sp)
xor t1, t6, t7
lw t6, 189(sp)
lw t7, 93(sp)
xor.1 t6, t6, t7
sw t6, 108(sp)
lw t7, 180(sp)
add s1, t2, t7
lw t7, 57(sp)
or t3, a5, t7, -13
lw t7, 105(sp)
add t4, t4, t7
lw t6, 93(sp)
lw t7, 186(sp)
and a5, t6, t7, 13
lw t7, 186(sp)
xor t2, s0, t7
li t7, -100023288
mul a7, a7, t7
add t0, s1, t0
lw t6, 177(sp)
li t7, 40368726
mul t6, t6, t7
sw t6, 105(sp)
lw t7, 183(sp)
add a7, a7, t7
lw t6, 171(sp)
lw t7, 174(sp)
and.T t6, t6, t7, -13
sw t6, 33(sp)
lw t7, 165(sp)
xor.1 a6, a6, t7
lw t6, 141(sp)
lw t7, 9(sp)
and s0, t6, t7, 13
add t4, t5, t4
lw t6, 87(sp)
or a6, t6, a6, -13
lw t6, 138(sp)
add t6, t6, t4
sw t6, 57(sp)
li t7, 95414817
mul a6, a6, t7
lw t6, 186(sp)
li t7, 99550385
xor.T t6, t6, t7
sw t6, 6(sp)
li t7, 108138622
mul t4, a4, t7
li t7, -150024182
mul a4, s0, t7
xor t5, t1, t3
lw t6, 231(sp)
lw t7, 54(sp)
or t3, t6, t7, -13
lw t6, 30(sp)
lw t7, 96(sp)
and s0, t6, t7, 13
lw t6, 15(sp)
lw t7, 99(sp)
and t1, t6, t7, 13
li t7, -37276215
mul s2, t5, t7
li t7, 99550385
xor.1 s1, a3, t7
li t7, -121351762
mul t5, t2, t7
li t7, -171569340
mul t6, a5, t7
sw t6, 78(sp)
lw t6, 12(sp)
andi t2, t6, 0
lw t7, 144(sp)
add s2, s2, t7
li t7, 146715458
mul t6, s0, t7
sw t6, 51(sp)
lw t7, 198(sp)
or t3, t3, t7, -13
lw t7, 192(sp)
and.T s0, s1, t7, -13
lw t7, 156(sp)
and.1 a5, a3, t7, 13
lw t6, 186(sp)
li t7, 99550385
xor.1 t6, t6, t7
sw t6, 0(sp)
add s1, s2, t4
lw t6, 9(sp)
lw t7, 45(sp)
or.T t4, t6, t7
lw t6, 42(sp)
li t7, 99550385
or.T t6, t6, t7
sw t6, 60(sp)
add s1, t0, s1
lw t6, 93(sp)
lw t7, 87(sp)
or.1 t0, t6, t7
add s1, s1, a4
lw t6, 21(sp)
lw t7, 153(sp)
or.1 a4, t6, t7
add a7, s1, a7
lw t6, 123(sp)
add t5, t6, t5
li t7, -181140761
mul t6, t0, t7
sw t6, 21(sp)
li t7, 102149470
mul a4, a4, t7
lw t6, 24(sp)
lw t7, 0(sp)
xor.T s1, t6, t7
li t7, -21965732
mul t6, s0, t7
sw t6, 9(sp)
lw t6, 60(sp)
li t7, -64753359
mul t6, t6, t7
sw t6, 87(sp)
lw t6, 99(sp)
lw t7, 198(sp)
xor.1 t0, t6, t7
li t7, -165000246
mul t0, t0, t7
li t7, -119774627
mul t3, t3, t7
li t7, -189978162
mul t4, t4, t7
add s0, a6, t5
li t7, -48251117
mul a6, t1, t7
lw t6, 174(sp)
and.T t5, t6, s1, -13
add s0, a7, s0
lw t7, 108(sp)
and.1 a7, t2, t7, 13
lw t6, 75(sp)
lw t7, 198(sp)
xor t1, t6, t7
li t7, 43747701
mul t6, a3, t7
sw t6, 24(sp)
lw t6, 57(sp)
add t6, t6, s0
sw t6, 57(sp)
lw t6, 15(sp)
li t7, 154833482
mul t2, t6, t7
lw t6, 42(sp)
lw t7, 54(sp)
or.T s1, t6, t7
lw t6, 204(sp)
lw t7, 147(sp)
and s2, t6, t7, 13
lw t6, 27(sp)
and.T a7, t6, a7, -13
lw t7, 33(sp)
or.1 t1, t1, t7
li t7, -113703156
mul s0, t1, t7
lw t6, 6(sp)
li t7, 177883286
mul t1, t6, t7
li t7, 89006729
mul s3, a7, t7
lw t6, 60(sp)
lw t7, 30(sp)
and.1 a7, t6, t7, 13
li t7, 67220192
mul t6, s1, t7
sw t6, 6(sp)
li t7, -146462285
mul a5, a5, t7
li t7, -27888008
mul s1, t5, t7
add t4, t4, a5
lw t6, 231(sp)
and s2, t6, s2, 13
add t5, t3, s3
lw t6, 216(sp)
xor a5, t6, a3
add t0, t0, t4
li t7, -143876693
mul t3, s2, t7
lw t6, 15(sp)
lw t7, 141(sp)
xor t4, t6, t7
lw t6, 45(sp)
lw t7, 186(sp)
or.T s2, t6, t7
lw t6, 81(sp)
lw t7, 84(sp)
or.1 t6, t6, t7
sw t6, 33(sp)
add t2, t2, s0
lw t7, 66(sp)
or s0, s2, t7, -13
add a4, s1, a4
lw t7, 162(sp)
xor s0, s0, t7
lw t7, 105(sp)
add a4, a4, t7
lw t6, 51(sp)
lw t7, 21(sp)
add s1, t6, t7
lw t6, 18(sp)
lw t7, 99(sp)
and.T t6, t6, t7, -13
sw t6, 15(sp)
lw t7, 78(sp)
add a4, a4, t7
lw t7, 87(sp)
add s1, s1, t7
add t5, t5, s1
add a6, t2, a6
add a4, t1, a4
add t1, t0, a6
li t7, -73099199
mul t2, s0, t7
lw t6, 42(sp)
lw t7, 186(sp)
xor.1 a6, t6, t7
lw t6, 36(sp)
lw t7, 42(sp)
xor.1 t0, t6, t7
add t2, t3, t2
or.1 t3, a7, t4
lw t6, 9(sp)
add t4, t6, t1
lw t6, 147(sp)
lw t7, 69(sp)
or a7, t6, t7, -13
lw t6, 213(sp)
lw t7, 30(sp)
and t1, t6, t7, 13
add t4, t5, t4
lw t7, 42(sp)
and.T t3, t3, t7, -13
or.T a6, a6, a3
lw t6, 126(sp)
lw t7, 120(sp)
and.T a3, t6, t7, -13
lw t7, 117(sp)
or.T a7, a7, t7
add t4, a4, t4
li t7, 187660205
mul a4, t3, t7
li t7, 141786562
mul t1, t1, t7
lw t7, 6(sp)
add t3, t4, t7
or.1 a3, a5, a3
li t7, -101070176
mul a3, a3, t7
lw t6, 0(sp)
lw t7, 75(sp)
or t4, t6, t7, -13
lw t6, 99(sp)
slli a5, t6, 8
lw t6, 126(sp)
or.1 t4, t6, t4
add a3, t2, a3
lw t6, 30(sp)
lw t7, 135(sp)
or.1 t5, t6, t7
li t7, 39674313
mul t2, a7, t7
or.T t0, t5, t0
lw t6, 186(sp)
lw t7, 102(sp)
or.T a7, t6, t7
li t7, 140039268
mul t5, t0, t7
lw t6, 102(sp)
lw t7, 84(sp)
and s0, t6, t7, 13
lw t6, 57(sp)
add t6, t6, t3
sw t6, 6(sp)
lw t6, 132(sp)
lw t7, 60(sp)
and.T t0, t6, t7, -13
lw t6, 63(sp)
li t7, -25445660
and.T t6, t6, t7, -13
sw t6, 27(sp)
li t7, 167293084
mul t3, t4, t7
add t2, t2, t3
li t7, 143770026
mul t6, a6, t7
sw t6, 0(sp)
add a6, t1, t2
add t2, t5, a6
lw t7, 177(sp)
and.T a6, s0, t7, -13
lw t6, 84(sp)
li t7, -111027545
mul t1, t6, t7
add a4, a4, t2
lw t6, 63(sp)
li t7, -25445660
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 66(sp)
lw t7, 30(sp)
and t2, t6, t7, 13
lw t6, 54(sp)
li t7, -26381198
mul t3, t6, t7
add t4, t3, a5
lw t6, 186(sp)
lw t7, 60(sp)
or.T a5, t6, t7
lw t6, 90(sp)
lw t7, 192(sp)
xor t3, t6, t7
lw t7, 129(sp)
and t3, t3, t7, 13
lw t7, 15(sp)
xor.1 a7, a7, t7
add a3, a3, a4
lw t6, 24(sp)
add t6, t6, a3
sw t6, 24(sp)
add a4, t1, t4
or.T a3, t2, t0
lw t7, 33(sp)
xor.1 t0, a7, t7
lw t6, 42(sp)
li t7, 99550385
xor.T a7, t6, t7
li t7, -41657182
mul t0, t0, t7
li t7, -82766403
mul t2, t3, t7
lw t6, 42(sp)
lw t7, 171(sp)
or.T t3, t6, t7
or.1 t1, a6, a7
lw t6, 30(sp)
lw t7, 213(sp)
xor a7, t6, t7
lw t6, 168(sp)
li t7, -82942562
mul t6, t6, t7
sw t6, 141(sp)
lw t6, 12(sp)
lw t7, 150(sp)
or a6, t6, t7, -13
lw t6, 63(sp)
li t7, -25445660
or t6, t6, t7, -13
sw t6, 57(sp)
li t7, -140782523
mul t6, t3, t7
sw t6, 33(sp)
li t7, 135960436
mul a6, a6, t7
lw t6, 63(sp)
li t7, -25445660
or.T t6, t6, t7
sw t6, 21(sp)
li t7, 167877114
mul a3, a3, t7
add t2, a3, t2
lw t6, 114(sp)
lw t7, 114(sp)
xor t6, t6, t7
sw t6, 153(sp)
lw t7, 39(sp)
xor.T a3, a5, t7
li t7, -123799075
mul a5, a3, t7
lw t6, 63(sp)
slli t6, t6, 8
sw t6, 12(sp)
li t7, 110063556
mul a3, t1, t7
lw t6, 63(sp)
slli t6, t6, 6
sw t6, 105(sp)
add t0, t0, t2
lw t6, 21(sp)
lw t7, 168(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 63(sp)
li t7, -25445660
and.1 t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 63(sp)
li t7, -25445660
xor.T t6, t6, t7
sw t6, 45(sp)
add a4, a4, t0
lw t6, 114(sp)
li t7, 120015809
xor t6, t6, t7
sw t6, 258(sp)
lw t6, 186(sp)
lw t7, 93(sp)
or.T t0, t6, t7
lw t7, 213(sp)
or t1, a7, t7, -13
lw t6, 0(sp)
add t6, t6, a4
sw t6, 0(sp)
lw t6, 258(sp)
li t7, -25445660
and.1 t6, t6, t7, 13
sw t6, 9(sp)
slli a4, t0, 8
lw t6, 63(sp)
lw t7, 258(sp)
xor t6, t6, t7
sw t6, 96(sp)
lw t6, 117(sp)
lw t7, 9(sp)
and a7, t6, t7, 13
li t7, -50676810
mul t6, a7, t7
sw t6, 42(sp)
add a6, a6, a5
lw t6, 63(sp)
lw t7, 258(sp)
xor.T t6, t6, t7
sw t6, 147(sp)
lw t6, 258(sp)
li t7, -25445660
xor.1 t6, t6, t7
sw t6, 90(sp)
lw t6, 258(sp)
li t7, -25445660
xor.T t6, t6, t7
sw t6, 138(sp)
lw t6, 90(sp)
li t7, 21764665
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 258(sp)
lw t7, 63(sp)
and t6, t6, t7, 13
sw t6, 132(sp)
lw t6, 117(sp)
lw t7, 147(sp)
or.1 a7, t6, t7
lw t6, 258(sp)
lw t7, 132(sp)
or.T a5, t6, t7
li t7, 140861744
mul a5, a5, t7
lw t6, 258(sp)
lw t7, 63(sp)
xor.1 t6, t6, t7
sw t6, 129(sp)
lw t6, 63(sp)
li t7, -25445660
xor t6, t6, t7
sw t6, 99(sp)
lw t6, 63(sp)
lw t7, 21(sp)
xor t0, t6, t7
lw t6, 129(sp)
lw t7, 117(sp)
xor.1 t3, t6, t7
li t7, 168099834
mul t1, t1, t7
lw t6, 63(sp)
lw t7, 258(sp)
or.T t6, t6, t7
sw t6, 75(sp)
lw t6, 258(sp)
li t7, -25445660
or.1 t6, t6, t7
sw t6, 51(sp)
lw t6, 258(sp)
lw t7, 63(sp)
or t6, t6, t7, -13
sw t6, 81(sp)
lw t6, 63(sp)
lw t7, 99(sp)
and.1 t2, t6, t7, 13
lw t6, 258(sp)
lw t7, 81(sp)
and.T t4, t6, t7, -13
lw t6, 63(sp)
lw t7, 258(sp)
and.T t6, t6, t7, -13
sw t6, 144(sp)
lw t6, 21(sp)
lw t7, 96(sp)
and.T t5, t6, t7, -13
add a3, a3, t1
lw t7, 63(sp)
and.1 t1, t5, t7, 13
lw t6, 33(sp)
add t5, t6, a3
and a3, t1, t3, 13
lw t6, 258(sp)
li t7, -25445660
and.T t6, t6, t7, -13
sw t6, 39(sp)
li t7, -9981184
mul t1, a3, t7
lw t6, 258(sp)
lw t7, 63(sp)
or.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 57(sp)
and.1 t4, t6, t4, 13
lw t6, 87(sp)
li t7, -48225698
mul a3, t6, t7
lw t6, 18(sp)
lw t7, 144(sp)
or t3, t6, t7, -13
add a4, t5, a4
lw t6, 57(sp)
and.1 a7, t6, a7, 13
li t7, -13800159
mul a7, a7, t7
lw t6, 0(sp)
add a4, t6, a4
add t5, a4, a6
li t7, -25445660
or.T a4, t0, t7
or.1 a6, t4, t2
li t7, 171530716
mul a6, a6, t7
lw t6, 24(sp)
add t0, t6, t5
lw t6, 63(sp)
li t7, -25445660
xor.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 6(sp)
add t0, t6, t0
lw t6, 39(sp)
lw t7, 96(sp)
or.1 t2, t6, t7
li t7, 55671719
mul t6, t2, t7
sw t6, 0(sp)
lw t6, 159(sp)
add t6, t6, t0
sw t6, 33(sp)
add a5, a5, a7
lw t6, 39(sp)
li t7, -25445660
xor.T a7, t6, t7
lw t7, 57(sp)
and.T t2, t3, t7, -13
lw t7, 75(sp)
or.T t0, a7, t7
lw t6, 42(sp)
add t4, t6, t1
lw t6, 147(sp)
lw t7, 138(sp)
xor t1, t6, t7
lw t6, 258(sp)
li t7, -25445660
and a7, t6, t7, 13
li t7, -153667531
mul t3, t2, t7
add t6, a5, t4
sw t6, 24(sp)
lw t6, 258(sp)
lw t7, 258(sp)
xor t6, t6, t7
sw t6, 69(sp)
lw t6, 138(sp)
lw t7, 168(sp)
xor.T t2, t6, t7
lw t6, 81(sp)
li t7, -130518046
mul a5, t6, t7
lw t7, 12(sp)
add t3, t3, t7
lw t6, 258(sp)
li t7, -25445660
or.T t6, t6, t7
sw t6, 93(sp)
lw t6, 63(sp)
li t7, -25445660
or.1 t6, t6, t7
sw t6, 66(sp)
lw t6, 132(sp)
li t7, -25445660
xor.1 t6, t6, t7
sw t6, 54(sp)
li t7, 185530798
mul t6, t2, t7
sw t6, 108(sp)
li t7, 129575290
mul t1, t1, t7
add t6, a3, t3
sw t6, 6(sp)
lw t6, 36(sp)
lw t7, 63(sp)
and.T a3, t6, t7, -13
lw t6, 27(sp)
and t2, t6, t0, 13
lw t6, 69(sp)
lw t7, 21(sp)
or.1 t0, t6, t7
li t7, 172737335
mul t4, t2, t7
lw t6, 45(sp)
li t7, -25445660
or.1 t3, t6, t7
lw t6, 231(sp)
or t2, t6, t0, -13
lw t6, 132(sp)
li t7, -135493014
mul t0, t6, t7
lw t7, 45(sp)
or t6, a7, t7, -13
sw t6, 60(sp)
add a6, a6, t4
lw t6, 258(sp)
lw t7, 138(sp)
and.1 t4, t6, t7, 13
and.T t3, t3, a4, -13
add a7, a6, t1
lw t6, 51(sp)
lw t7, 21(sp)
and t1, t6, t7, 13
lw t6, 66(sp)
lw t7, 132(sp)
or t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 12(sp)
li t7, -19753308
mul a6, t6, t7
lw t6, 258(sp)
li t7, -25445660
xor t6, t6, t7
sw t6, 78(sp)
lw t6, 63(sp)
xor.1 t5, t6, t4
lw t6, 78(sp)
lw t7, 45(sp)
or.T a4, t6, t7
li t7, -47561647
mul t4, t3, t7
lw t6, 132(sp)
li t7, 3810920
mul t6, t6, t7
sw t6, 42(sp)
li t7, -131557289
mul t2, t2, t7
add t2, t2, a5
li t7, 142163042
mul a5, t5, t7
add a6, a6, a5
lw t6, 63(sp)
lw t7, 144(sp)
xor.1 t6, t6, t7
sw t6, 135(sp)
lw t6, 87(sp)
lw t7, 66(sp)
xor.T a5, t6, t7
lw t6, 144(sp)
lw t7, 78(sp)
xor.T t3, t6, t7
lw t6, 66(sp)
li t7, -63590161
mul t6, t6, t7
sw t6, 18(sp)
lw t7, 93(sp)
or.T t3, t3, t7
li t7, -98818221
mul t5, t3, t7
lw t6, 81(sp)
lw t7, 66(sp)
and.1 t3, t6, t7, 13
add t0, t5, t0
lw t7, 168(sp)
and.T a5, a5, t7, -13
lw t6, 63(sp)
lw t7, 258(sp)
and.1 t6, t6, t7, 13
sw t6, 102(sp)
add t0, t4, t0
lw t6, 144(sp)
lw t7, 63(sp)
xor.T t4, t6, t7
lw t7, 123(sp)
or t1, t1, t7, -13
lw t6, 102(sp)
lw t7, 231(sp)
and t5, t6, t7, 13
lw t6, 24(sp)
add a7, t6, a7
xor a3, t5, a3
add t0, t2, t0
lw t6, 258(sp)
li t7, -25445660
or t6, t6, t7, -13
sw t6, 84(sp)
lw t6, 0(sp)
add t0, t6, t0
li t7, 156008213
mul t1, t1, t7
li t7, 184042007
mul a3, a3, t7
lw t6, 147(sp)
lw t7, 78(sp)
and t5, t6, t7, 13
lw t6, 84(sp)
lw t7, 36(sp)
xor.1 t2, t6, t7
lw t6, 99(sp)
li t7, 191237327
mul t6, t6, t7
sw t6, 120(sp)
li t7, -92455818
mul t6, t5, t7
sw t6, 0(sp)
lw t6, 63(sp)
and.T t5, t6, t3, -13
lw t6, 63(sp)
lw t7, 81(sp)
and.1 t6, t6, t7, 13
sw t6, 126(sp)
lw t7, 99(sp)
and.T t4, t4, t7, -13
lw t6, 63(sp)
lw t7, 123(sp)
xor.T t6, t6, t7
sw t6, 24(sp)
lw t7, 15(sp)
add a7, a7, t7
lw t6, 96(sp)
lw t7, 36(sp)
xor.1 t3, t6, t7
lw t6, 21(sp)
li t7, -133867218
mul t6, t6, t7
sw t6, 150(sp)
lw t7, 87(sp)
xor a4, a4, t7
lw t7, 54(sp)
xor.1 t4, t4, t7
li t7, -25445660
and.T t5, t5, t7, -13
li t7, 15003343
mul t5, t5, t7
lw t6, 108(sp)
add a6, t6, a6
lw t7, 99(sp)
or.T t2, t2, t7
lw t6, 6(sp)
add s1, t6, t1
li t7, -175416940
mul a4, a4, t7
add s0, t0, a6
lw t7, 132(sp)
xor.T t1, t3, t7
lw t6, 138(sp)
lw t7, 93(sp)
xor a6, t6, t7
lw t6, 105(sp)
add s1, t6, s1
lw t6, 90(sp)
li t7, -34982046
mul t0, t6, t7
li t7, -13933025
mul t2, t2, t7
lw t6, 63(sp)
li t7, 160267365
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 135(sp)
and.1 t3, t6, a5, 13
lw t7, 60(sp)
xor.1 a5, t1, t7
li t7, -161099842
mul t3, t3, t7
li t7, -135637769
mul t1, t4, t7
li t7, 23856136
mul a5, a5, t7
add t5, t5, a5
lw t6, 21(sp)
lw t7, 39(sp)
and t4, t6, t7, 13
lw t6, 36(sp)
li t7, 172987025
mul t6, t6, t7
sw t6, 15(sp)
add s0, s1, s0
lw t6, 231(sp)
lw t7, 81(sp)
or a5, t6, t7, -13
add a3, s0, a3
li t7, -157883298
mul s0, t4, t7
lw t6, 102(sp)
lw t7, 99(sp)
xor t6, t6, t7
sw t6, 60(sp)
lw t6, 63(sp)
lw t7, 45(sp)
xor.T t4, t6, t7
lw t6, 144(sp)
li t7, -78242074
mul s2, t6, t7
lw t7, 42(sp)
add t0, t0, t7
lw t6, 27(sp)
lw t7, 168(sp)
or.T s1, t6, t7
add t6, a7, a3
sw t6, 54(sp)
add a3, t2, t5
lw t6, 63(sp)
lw t7, 138(sp)
and a7, t6, t7, 13
lw t6, 102(sp)
li t7, -124066895
mul t5, t6, t7
add s0, s0, t3
lw t6, 24(sp)
li t7, 70556894
mul t3, t6, t7
lw t6, 96(sp)
lw t7, 63(sp)
and t2, t6, t7, 13
li t7, -176293253
mul t6, t2, t7
sw t6, 24(sp)
li t7, 151384237
mul a7, a7, t7
add t2, a4, t1
add a7, s2, a7
lw t6, 129(sp)
lw t7, 51(sp)
xor.1 t1, t6, t7
lw t7, 117(sp)
or s2, a6, t7, -13
xor a4, t4, s1
lw t6, 60(sp)
or.T a4, t6, a4
li t7, 36400570
mul t6, a4, t7
sw t6, 108(sp)
lw t6, 117(sp)
li t7, 166291799
mul t4, t6, t7
lw t6, 90(sp)
lw t7, 63(sp)
and a4, t6, t7, 13
lw t6, 78(sp)
ori a6, t6, 0
add t6, t5, t4
sw t6, 90(sp)
add a3, a3, s0
lw t7, 126(sp)
or.T s0, s2, t7
lw t6, 87(sp)
li t7, -25445660
or.T s2, t6, t7
lw t6, 63(sp)
lw t7, 75(sp)
xor t4, t6, t7
lw t6, 48(sp)
li t7, -153535217
mul s1, t6, t7
lw t6, 45(sp)
lw t7, 81(sp)
and t5, t6, t7, 13
li t7, 55230919
mul a5, a5, t7
lw t6, 102(sp)
xor.T t6, t6, a4
sw t6, 105(sp)
lw t6, 6(sp)
add t3, t6, t3
lw t6, 18(sp)
add a4, t6, a5
lw t7, 63(sp)
and a5, s2, t7, 13
lw t7, 120(sp)
add t3, t3, t7
add t0, t3, t0
add t6, t2, t0
sw t6, 120(sp)
li t7, -128884919
mul t2, s0, t7
lw t6, 258(sp)
li t7, 84321420
mul t0, t6, t7
add t0, s1, t0
add t6, t2, a7
sw t6, 18(sp)
lw t6, 168(sp)
and a7, t6, t1, 13
li t7, 109910673
mul a5, a5, t7
lw t6, 9(sp)
lw t7, 147(sp)
or t6, t6, t7, -13
sw t6, 42(sp)
lw t6, 147(sp)
li t7, 101032411
mul t6, t6, t7
sw t6, 39(sp)
add t0, a5, t0
lw t6, 81(sp)
lw t7, 123(sp)
xor.T a5, t6, t7
and.1 t2, a5, t5, 13
lw t6, 129(sp)
lw t7, 87(sp)
xor.T a5, t6, t7
li t7, 33009912
mul t1, t4, t7
lw t6, 117(sp)
or.T a5, t6, a5
lw t7, 51(sp)
or t4, a6, t7, -13
li t7, 159471381
mul a6, a5, t7
lw t6, 258(sp)
lw t7, 81(sp)
and.1 a5, t6, t7, 13
lw t7, 138(sp)
and.T t2, t2, t7, -13
or.1 t3, a7, t2
li t7, 45240109
mul t2, t4, t7
lw t6, 150(sp)
add t0, t6, t0
lw t6, 21(sp)
lw t7, 93(sp)
or.1 t4, t6, t7
lw t6, 21(sp)
andi a7, t6, 0
add t0, t0, t1
lw t6, 0(sp)
add t5, t6, a3
lw t6, 132(sp)
li t7, 166646220
mul t1, t6, t7
lw t6, 51(sp)
xor.T s1, t6, t4
lw t6, 258(sp)
lw t7, 45(sp)
xor.1 t4, t6, t7
lw t6, 45(sp)
lw t7, 51(sp)
xor.1 a3, t6, t7
add t6, t2, a6
sw t6, 126(sp)
lw t6, 123(sp)
lw t7, 258(sp)
or.1 s0, t6, t7
li t7, -122101373
mul t6, s1, t7
sw t6, 6(sp)
lw t6, 90(sp)
add s1, t6, a4
lw t6, 66(sp)
li t7, 129971324
mul t6, t6, t7
sw t6, 48(sp)
lw t6, 21(sp)
lw t7, 105(sp)
and.1 t2, t6, t7, 13
lw t6, 54(sp)
add a6, t6, t5
slli a4, t3, 3
lw t6, 24(sp)
add t3, t6, a4
lw t6, 27(sp)
lw t7, 93(sp)
xor.T a4, t6, t7
or a4, t4, a4, -13
lw t7, 144(sp)
and.1 t4, s0, t7, 13
add t3, s1, t3
lw t6, 144(sp)
lw t7, 102(sp)
xor t6, t6, t7
sw t6, 24(sp)
li t7, -18562059
mul t5, t4, t7
lw t6, 57(sp)
lw t7, 81(sp)
and.T t4, t6, t7, -13
add t1, t1, t5
lw t6, 18(sp)
add s0, t6, t3
lw t6, 258(sp)
lw t7, 27(sp)
xor.1 t3, t6, t7
li t7, 143542534
mul t5, t3, t7
li t7, -70215787
mul t3, a7, t7
add t0, s0, t0
lw t6, 117(sp)
lw t7, 63(sp)
or a7, t6, t7, -13
lw t7, 147(sp)
and.1 s0, t4, t7, 13
or.1 a5, a5, t2
lw t6, 42(sp)
or.1 t2, t6, a5
lw t6, 15(sp)
add t4, t6, t0
add t1, t1, t5
li t7, 15256798
mul a5, s0, t7
lw t6, 51(sp)
lw t7, 87(sp)
and.T t0, t6, t7, -13
lw t6, 93(sp)
li t7, -142018756
mul t6, t6, t7
sw t6, 18(sp)
lw t6, 39(sp)
add t5, t6, t3
lw t6, 108(sp)
add t4, t6, t4
li t7, -171254525
mul t3, t2, t7
add t2, t1, t5
li t7, -123871413
mul a4, a4, t7
lw t6, 120(sp)
add t1, t6, t4
add t6, a6, t1
sw t6, 39(sp)
li t7, 86057444
mul a3, a3, t7
lw t6, 96(sp)
lw t7, 144(sp)
and.1 t1, t6, t7, 13
lw t7, 66(sp)
or.1 t0, t0, t7
lw t6, 144(sp)
lw t7, 84(sp)
and a6, t6, t7, 13
lw t6, 87(sp)
lw t7, 96(sp)
and t4, t6, t7, 13
li t7, -160184032
mul s0, t0, t7
lw t6, 21(sp)
or.1 t4, t6, t4
lw t6, 96(sp)
and.1 t5, t6, a6, 13
lw t6, 27(sp)
lw t7, 69(sp)
or t0, t6, t7, -13
lw t6, 45(sp)
li t7, 13371303
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 126(sp)
add a6, t6, t3
lw t6, 99(sp)
lw t7, 258(sp)
and.1 t3, t6, t7, 13
add t6, a6, t2
sw t6, 42(sp)
lw t6, 87(sp)
lw t7, 75(sp)
xor.1 a6, t6, t7
lw t6, 51(sp)
and.T t2, t6, t5, -13
lw t6, 78(sp)
li t7, -25445660
xor.1 s1, t6, t7
lw t6, 24(sp)
li t7, 16522239
mul t5, t6, t7
lw t6, 63(sp)
lw t7, 129(sp)
xor s2, t6, t7
li t7, -172522223
mul t2, t2, t7
and.1 a7, t3, a7, 13
li t7, 100517046
mul t3, s1, t7
li t7, -92208712
mul a7, a7, t7
lw t6, 117(sp)
lw t7, 63(sp)
and s1, t6, t7, 13
add a7, a7, s0
lw t6, 132(sp)
lw t7, 123(sp)
or.1 s0, t6, t7
add a7, a5, a7
li t7, 48660610
mul t6, t1, t7
sw t6, 15(sp)
lw t7, 123(sp)
or a5, s1, t7, -13
xor.T a5, a5, t4
lw t6, 87(sp)
lw t7, 63(sp)
and s3, t6, t7, 13
lw t7, 60(sp)
xor t1, s2, t7
li t7, -29413100
mul s4, a5, t7
li t7, -121750411
mul s0, s0, t7
li t7, 34676556
mul s2, t1, t7
lw t6, 102(sp)
lw t7, 51(sp)
or a5, t6, t7, -13
li t7, -81256066
mul t1, t0, t7
add a4, t5, a4
li t7, 116608709
mul t5, s1, t7
lw t6, 9(sp)
lw t7, 168(sp)
and.T t4, t6, t7, -13
add a4, a4, a3
li t7, 142981824
mul s1, s3, t7
lw t7, 18(sp)
add a3, s4, t7
add a3, t2, a3
lw t6, 258(sp)
li t7, 129481470
mul t0, t6, t7
add t6, t3, s2
sw t6, 51(sp)
add s2, s1, s0
lw t6, 66(sp)
li t7, -140337651
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 21(sp)
lw t7, 81(sp)
and s1, t6, t7, 13
lw t6, 27(sp)
lw t7, 66(sp)
xor.T t2, t6, t7
lw t6, 96(sp)
li t7, -123840118
mul t3, t6, t7
lw t6, 63(sp)
xor.1 s0, t6, a6
add a3, a3, s2
lw t7, 0(sp)
add s2, a3, t7
lw t7, 48(sp)
add a3, t5, t7
lw t7, 63(sp)
xor.T a6, s1, t7
lw t6, 99(sp)
slli t5, t6, 7
add s1, a7, s2
lw t6, 81(sp)
lw t7, 147(sp)
xor.1 a7, t6, t7
lw t6, 57(sp)
lw t7, 99(sp)
or s2, t6, t7, -13
add t6, t1, a3
sw t6, 21(sp)
li t7, -81151678
mul a3, t4, t7
lw t6, 168(sp)
lw t7, 96(sp)
xor.T t4, t6, t7
add t6, a4, s1
sw t6, 0(sp)
lw t7, 99(sp)
and.T t1, s2, t7, -13
lw t7, 258(sp)
xor s1, a7, t7
li t7, -56746515
mul a7, s0, t7
lw t6, 57(sp)
li t7, 51497629
mul s0, t6, t7
lw t6, 99(sp)
ori a4, t6, 0
add t3, t3, s0
add t0, t0, t3
add t6, t5, t0
sw t6, 18(sp)
or.1 t0, t2, a6
lw t6, 87(sp)
lw t7, 63(sp)
xor.T a6, t6, t7
lw t6, 258(sp)
or.1 t2, t6, a5
lw t6, 36(sp)
lw t7, 168(sp)
xor t3, t6, t7
li t7, -55319401
mul t0, t0, t7
li t7, -67191979
mul a5, t4, t7
li t7, -51789719
mul t4, t2, t7
li t7, -143969674
mul t2, t3, t7
and.T t1, t1, s1, -13
lw t6, 36(sp)
li t7, 25445660
xor.1 t3, t6, t7
li t7, -8018302
mul t1, t1, t7
add a7, t4, a7
lw t6, 72(sp)
li t7, -55760003
xor.T t6, t6, t7
sw t6, 9(sp)
add t0, t1, t0
lw t6, 141(sp)
add t1, t6, t0
lw t6, 63(sp)
li t7, 57522208
mul t0, t6, t7
add a3, a3, a7
lw t6, 12(sp)
li t7, -160753339
mul t4, t6, t7
li t7, -154311482
mul a7, a6, t7
lw t6, 87(sp)
lw t7, 84(sp)
and.1 t5, t6, t7, 13
lw t7, 24(sp)
add t1, t1, t7
add a6, t2, t4
li t7, -20061062
mul t3, t3, t7
xor.T a4, t5, a4
lw t6, 72(sp)
lw t7, 3(sp)
xor.1 t6, t6, t7
sw t6, 78(sp)
li t7, -73448694
mul a4, a4, t7
lw t6, 138(sp)
lw t7, 63(sp)
xor.1 t2, t6, t7
lw t7, 123(sp)
xor.T t2, t2, t7
lw t6, 75(sp)
li t7, 145582660
mul t4, t6, t7
add a5, a5, t3
lw t6, 114(sp)
li t7, -184366470
mul t6, t6, t7
sw t6, 12(sp)
add t3, t0, t4
lw t6, 72(sp)
li t7, -55760003
and.T t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 3(sp)
li t7, -55760003
xor.1 t6, t6, t7
sw t6, 141(sp)
lw t6, 21(sp)
add t0, t6, t1
lw t6, 51(sp)
add t0, t6, t0
lw t6, 15(sp)
add t0, t6, t0
lw t6, 78(sp)
li t7, -30095438
mul t6, t6, t7
sw t6, 21(sp)
add a7, a7, a5
li t7, -58125562
mul t1, t2, t7
lw t6, 9(sp)
lw t7, 114(sp)
or.T a5, t6, t7
lw t6, 3(sp)
li t7, -55760003
or.T t6, t6, t7
sw t6, 15(sp)
add a7, a7, a4
add a4, t3, t1
add a4, a4, a6
lw t6, 114(sp)
li t7, -55760003
or.T t6, t6, t7
sw t6, 57(sp)
lw t6, 3(sp)
lw t7, 114(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
lw t6, 114(sp)
lw t7, 72(sp)
and.1 t6, t6, t7, 13
sw t6, 138(sp)
lw t6, 15(sp)
lw t7, 45(sp)
or a6, t6, t7, -13
lw t6, 141(sp)
lw t7, 138(sp)
and t2, t6, t7, 13
lw t6, 18(sp)
add a7, t6, a7
add a3, a3, a7
lw t6, 114(sp)
li t7, -55760003
and.T t6, t6, t7, -13
sw t6, 165(sp)
add a3, t0, a3
lw t6, 3(sp)
lw t7, 114(sp)
or.T t6, t6, t7
sw t6, 150(sp)
lw t6, 0(sp)
add t1, t6, a3
lw t6, 3(sp)
lw t7, 114(sp)
and.T t6, t6, t7, -13
sw t6, 90(sp)
lw t6, 78(sp)
or.1 t2, t6, t2
lw t6, 57(sp)
li t7, -147138002
mul a3, t6, t7
lw t6, 72(sp)
li t7, -55760003
and t6, t6, t7, 13
sw t6, 0(sp)
xor a6, a6, a5
lw t6, 72(sp)
lw t7, 3(sp)
xor t6, t6, t7
sw t6, 60(sp)
lw t6, 114(sp)
li t7, -55760003
and.1 t6, t6, t7, 13
sw t6, 24(sp)
lw t6, 3(sp)
li t7, -55760003
or t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 72(sp)
lw t7, 0(sp)
xor.T a7, t6, t7
lw t6, 60(sp)
lw t7, 150(sp)
xor.T t0, t6, t7
lw t6, 6(sp)
add t1, t6, t1
li t7, -40158993
mul a5, t2, t7
lw t6, 42(sp)
add t1, t6, t1
lw t6, 3(sp)
lw t7, 72(sp)
or.1 t6, t6, t7
sw t6, 117(sp)
add t2, t1, a4
lw t6, 78(sp)
lw t7, 24(sp)
xor.1 t1, t6, t7
lw t6, 90(sp)
lw t7, 150(sp)
or.1 t6, t6, t7
sw t6, 96(sp)
lw t6, 0(sp)
lw t7, 96(sp)
or a4, t6, t7, -13
lw t6, 39(sp)
add t6, t6, t2
sw t6, 48(sp)
lw t6, 24(sp)
li t7, -55760003
xor.T t2, t6, t7
li t7, 75459207
mul t3, a6, t7
lw t7, 117(sp)
xor a6, t0, t7
lw t6, 72(sp)
li t7, -55760003
and.1 t6, t6, t7, 13
sw t6, 156(sp)
li t7, -55760003
or.1 t4, a7, t7
lw t6, 165(sp)
or a7, t6, t1, -13
lw t6, 18(sp)
lw t7, 90(sp)
xor.1 t0, t6, t7
li t7, -77647688
mul t1, t4, t7
lw t7, 21(sp)
add t4, t1, t7
lw t7, 36(sp)
xor t2, t2, t7
add a5, a5, t3
li t7, -170385329
mul t1, a4, t7
add t6, a5, t4
sw t6, 6(sp)
and.T a5, t2, a7, -13
lw t7, 156(sp)
or a4, t0, t7, -13
xor a4, a4, a6
li t7, -28541804
mul a4, a4, t7
lw t6, 96(sp)
lw t7, 0(sp)
or.1 a6, t6, t7
lw t6, 72(sp)
lw t7, 3(sp)
and t6, t6, t7, 13
sw t6, 135(sp)
add a3, t1, a3
lw t6, 12(sp)
add a3, t6, a3
lw t6, 3(sp)
lw t7, 72(sp)
xor.T t6, t6, t7
sw t6, 54(sp)
lw t6, 54(sp)
li t7, -148564067
mul t1, t6, t7
lw t6, 3(sp)
lw t7, 72(sp)
and.T t6, t6, t7, -13
sw t6, 42(sp)
lw t6, 135(sp)
lw t7, 78(sp)
xor.1 t6, t6, t7
sw t6, 81(sp)
lw t6, 72(sp)
li t7, -55760003
or.T t6, t6, t7
sw t6, 93(sp)
lw t6, 42(sp)
lw t7, 54(sp)
and.T t6, t6, t7, -13
sw t6, 27(sp)
li t7, 27440483
mul t0, a5, t7
lw t6, 78(sp)
lw t7, 96(sp)
xor.1 a5, t6, t7
lw t6, 81(sp)
xor.1 a5, t6, a5
li t7, -105544288
mul a7, a5, t7
lw t6, 150(sp)
xor a6, t6, a6
lw t6, 15(sp)
lw t7, 93(sp)
xor a5, t6, t7
add a4, a4, t1
lw t6, 3(sp)
li t7, -55760003
or.1 t6, t6, t7
sw t6, 12(sp)
lw t6, 114(sp)
lw t7, 72(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 3(sp)
li t7, -55760003
xor.T t6, t6, t7
sw t6, 102(sp)
li t7, -126570270
mul a5, a5, t7
lw t6, 3(sp)
lw t7, 114(sp)
xor t6, t6, t7
sw t6, 159(sp)
lw t6, 3(sp)
li t7, -55760003
xor t6, t6, t7
sw t6, 75(sp)
lw t6, 72(sp)
li t7, -55760003
xor t6, t6, t7
sw t6, 39(sp)
add a4, t0, a4
add t1, a3, a4
lw t6, 12(sp)
li t7, 74911856
mul a3, t6, t7
lw t6, 159(sp)
li t7, -140297099
mul a4, t6, t7
lw t6, 60(sp)
lw t7, 0(sp)
xor t0, t6, t7
lw t6, 27(sp)
lw t7, 75(sp)
or.T t2, t6, t7
li t7, 117618526
mul t2, t2, t7
lw t6, 3(sp)
lw t7, 114(sp)
or t6, t6, t7, -13
sw t6, 126(sp)
add t4, a7, t2
li t7, 157841319
mul a7, t0, t7
lw t6, 72(sp)
lw t7, 72(sp)
xor t2, t6, t7
lw t6, 72(sp)
lw t7, 114(sp)
xor t6, t6, t7
sw t6, 147(sp)
lw t6, 72(sp)
li t7, -149766505
mul t0, t6, t7
lw t6, 39(sp)
lw t7, 147(sp)
xor.T t3, t6, t7
lw t6, 126(sp)
or t3, t6, t3, -13
add t1, t1, t4
add a5, t1, a5
lw t6, 114(sp)
li t7, -55760003
xor.1 t6, t6, t7
sw t6, 99(sp)
lw t6, 126(sp)
li t7, 113614495
mul t1, t6, t7
lw t6, 18(sp)
lw t7, 72(sp)
or.1 t4, t6, t7
lw t7, 18(sp)
xor.1 t5, t2, t7
lw t6, 6(sp)
add a5, t6, a5
or.1 a6, t3, a6
li t7, 108874278
mul t2, a6, t7
lw t6, 72(sp)
lw t7, 3(sp)
or.T t6, t6, t7
sw t6, 21(sp)
lw t6, 21(sp)
lw t7, 57(sp)
or a6, t6, t7, -13
lw t6, 147(sp)
xor s0, t6, t4
li t7, -69868123
mul t3, a6, t7
lw t6, 72(sp)
li t7, -55760003
or.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 3(sp)
li t7, -55760003
and.T t6, t6, t7, -13
sw t6, 129(sp)
lw t6, 102(sp)
lw t7, 3(sp)
and t4, t6, t7, 13
lw t6, 66(sp)
lw t7, 18(sp)
xor a6, t6, t7
li t7, 152385736
mul s1, s0, t7
lw t6, 72(sp)
li t7, -151515558
mul s0, t6, t7
li t7, -89537553
mul t5, t5, t7
add a7, a7, t5
lw t6, 72(sp)
lw t7, 114(sp)
or.1 t6, t6, t7
sw t6, 84(sp)
add a7, a7, t0
add t1, a7, t1
lw t6, 3(sp)
lw t7, 78(sp)
and.1 t0, t6, t7, 13
add a3, t2, a3
add a4, a3, a4
lw t6, 150(sp)
lw t7, 147(sp)
xor.T a3, t6, t7
lw t6, 9(sp)
lw t7, 129(sp)
and a7, t6, t7, 13
add t2, t3, s1
lw t6, 231(sp)
lw t7, 159(sp)
and t5, t6, t7, 13
lw t6, 99(sp)
or.T t3, t6, t4
add t2, t2, s0
xor.1 t3, t3, t0
lw t7, 0(sp)
and.1 t0, t5, t7, 13
lw t6, 3(sp)
lw t7, 114(sp)
xor.1 t6, t6, t7
sw t6, 171(sp)
lw t6, 72(sp)
lw t7, 84(sp)
and.T t5, t6, t7, -13
lw t6, 114(sp)
li t7, -55760003
and t6, t6, t7, 13
sw t6, 108(sp)
add t1, t1, t2
lw t6, 153(sp)
lw t7, 165(sp)
or.T t2, t6, t7
li t7, 163850470
mul t3, t3, t7
lw t6, 15(sp)
lw t7, 24(sp)
and.T t4, t6, t7, -13
add a4, a4, t1
li t7, 52921252
mul t1, t5, t7
add t6, a5, a4
sw t6, 6(sp)
lw t6, 87(sp)
li t7, 70178935
mul a4, t6, t7
li t7, -62190613
mul a5, a7, t7
lw t6, 171(sp)
lw t7, 159(sp)
and.1 t5, t6, t7, 13
add a7, a5, t3
and.1 a5, t4, a6, 13
xor a6, t5, t2
and.T a6, t0, a6, -13
lw t6, 114(sp)
lw t7, 72(sp)
and.T t6, t6, t7, -13
sw t6, 51(sp)
lw t7, 87(sp)
or.T t2, a6, t7
li t7, -116968769
mul t3, a3, t7
lw t6, 51(sp)
lw t7, 135(sp)
xor.1 t0, t6, t7
li t7, -17216345
mul t4, a5, t7
lw t6, 90(sp)
lw t7, 72(sp)
or.1 a5, t6, t7
add a3, t1, a7
lw t6, 114(sp)
slli a6, t6, 5
lw t6, 66(sp)
li t7, -150659054
mul t6, t6, t7
sw t6, 132(sp)
li t7, -62117038
mul t1, t2, t7
add t2, t3, t4
lw t6, 72(sp)
li t7, -55760003
xor.1 t6, t6, t7
sw t6, 123(sp)
lw t6, 108(sp)
li t7, -41917159
mul a7, t6, t7
lw t6, 150(sp)
lw t7, 78(sp)
and.1 t3, t6, t7, 13
add t4, t2, a4
lw t6, 72(sp)
lw t7, 114(sp)
xor.1 t6, t6, t7
sw t6, 162(sp)
lw t6, 81(sp)
lw t7, 18(sp)
or.T t2, t6, t7
lw t6, 0(sp)
lw t7, 141(sp)
or.1 a4, t6, t7
or t2, t0, t2, -13
lw t6, 123(sp)
xor t3, t6, t3
add t0, t1, t4
lw t6, 96(sp)
lw t7, 156(sp)
xor t1, t6, t7
or.T a5, a5, t3
li t7, -48410285
mul t3, a5, t7
lw t6, 72(sp)
lw t7, 3(sp)
and.1 t6, t6, t7, 13
sw t6, 105(sp)
li t7, -146773855
mul t2, t2, t7
lw t6, 129(sp)
li t7, 183160536
mul a5, t6, t7
add t2, t2, a6
add a6, a7, t3
lw t6, 114(sp)
li t7, -55760003
or.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 156(sp)
lw t7, 162(sp)
and t3, t6, t7, 13
lw t6, 159(sp)
lw t7, 162(sp)
or.1 a7, t6, t7
or t1, t1, t3, -13
lw t6, 144(sp)
li t7, 89056730
mul t3, t6, t7
add t0, t0, a6
lw t6, 105(sp)
li t7, -103598989
mul a6, t6, t7
li t7, 167372378
mul t4, t1, t7
add t2, t0, t2
lw t6, 66(sp)
lw t7, 36(sp)
or t1, t6, t7, -13
lw t6, 27(sp)
li t7, 72170200
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 147(sp)
lw t7, 231(sp)
or t0, t6, t7, -13
add t4, t4, t3
lw t6, 57(sp)
or.T t3, t6, a4
lw t6, 81(sp)
lw t7, 84(sp)
xor.1 a4, t6, t7
li t7, -79892555
mul t3, t3, t7
add a3, a3, t2
add t2, t4, a6
lw t6, 99(sp)
and.1 t1, t6, t1, 13
lw t6, 126(sp)
slli a6, t6, 4
lw t6, 114(sp)
lw t7, 72(sp)
or.T t6, t6, t7
sw t6, 120(sp)
lw t6, 132(sp)
add t2, t6, t2
add a3, a3, t2
add t4, a5, t3
lw t6, 120(sp)
lw t7, 75(sp)
and a5, t6, t7, 13
lw t7, 87(sp)
xor.T t2, t1, t7
lw t6, 93(sp)
lw t7, 57(sp)
and.T t3, t6, t7, -13
lw t6, 18(sp)
and.1 a7, t6, a7, 13
or a7, a7, t0, -13
li t7, -21406652
mul a7, a7, t7
add a7, a7, t4
add a7, a3, a7
lw t6, 87(sp)
slli t1, t6, 7
lw t6, 57(sp)
xor a3, t6, a5
li t7, -160454340
mul t0, a3, t7
li t7, 133387465
mul t4, t3, t7
lw t6, 15(sp)
lw t7, 75(sp)
xor t5, t6, t7
lw t6, 36(sp)
lw t7, 24(sp)
and.1 a3, t6, t7, 13
lw t6, 84(sp)
lw t7, 9(sp)
or.T a5, t6, t7
lw t6, 126(sp)
lw t7, 108(sp)
and.1 s0, t6, t7, 13
lw t6, 171(sp)
lw t7, 54(sp)
or t3, t6, t7, -13
xor a4, a4, t2
lw t6, 0(sp)
or t2, t6, s0, -13
lw t6, 60(sp)
lw t7, 51(sp)
and.1 s0, t6, t7, 13
li t7, 72608504
mul s2, s0, t7
lw t7, 150(sp)
or.T t3, t3, t7
lw t6, 108(sp)
lw t7, 21(sp)
and.T s0, t6, t7, -13
li t7, -4027358
mul s1, s0, t7
li t7, 62109214
mul s0, a4, t7
add t4, s2, t4
li t7, 71817719
mul a4, t5, t7
add t4, a6, t4
lw t6, 114(sp)
lw t7, 3(sp)
and.1 a6, t6, t7, 13
add t1, t1, s1
lw t7, 39(sp)
xor.1 t5, a6, t7
lw t6, 27(sp)
add t6, t6, t1
sw t6, 99(sp)
lw t6, 15(sp)
lw t7, 36(sp)
xor.T s1, t6, t7
add s0, t0, s0
lw t6, 120(sp)
lw t7, 117(sp)
and t1, t6, t7, 13
lw t6, 54(sp)
or t0, t6, s1, -13
li t7, -63912594
mul t5, t5, t7
add t4, s0, t4
lw t7, 117(sp)
or t2, t2, t7, -13
add a7, a7, t4
or t3, t3, t2, -13
lw t6, 114(sp)
li t7, -55760003
xor.T t6, t6, t7
sw t6, 27(sp)
lw t6, 6(sp)
add t6, t6, a7
sw t6, 9(sp)
lw t6, 171(sp)
lw t7, 3(sp)
and a7, t6, t7, 13
lw t6, 138(sp)
lw t7, 81(sp)
or.T t2, t6, t7
li t7, 14213090
mul t3, t3, t7
add t3, t3, t5
li t7, -57300943
mul t6, t1, t7
sw t6, 24(sp)
lw t6, 27(sp)
or.1 a5, t6, a5
lw t6, 114(sp)
li t7, -57955630
mul t1, t6, t7
add t4, t1, t3
lw t6, 3(sp)
li t7, -55760003
and t6, t6, t7, 13
sw t6, 6(sp)
li t7, 77771917
mul t1, a3, t7
and a5, t0, a5, 13
lw t6, 3(sp)
lw t7, 114(sp)
and a3, t6, t7, 13
lw t6, 78(sp)
li t7, -55760003
xor t3, t6, t7
lw t6, 171(sp)
and.1 t5, t6, t2, 13
li t7, -77842486
mul t2, a3, t7
li t7, 39631523
mul t0, a5, t7
lw t7, 66(sp)
xor a5, a6, t7
li t7, 16470811
add a6, t0, t7
add a4, a4, a6
lw t6, 6(sp)
lw t7, 72(sp)
and s0, t6, t7, 13
add t4, a4, t4
li t7, -171556584
mul a4, a7, t7
lw t6, 129(sp)
lw t7, 60(sp)
and.T s1, t6, t7, -13
lw t6, 153(sp)
li t7, -55760003
or a7, t6, t7, -13
lw t6, 159(sp)
li t7, -55760003
and.1 t0, t6, t7, 13
lw t7, 39(sp)
or s3, a3, t7, -13
li t7, -54661812
mul t5, t5, t7
lw t6, 0(sp)
lw t7, 75(sp)
xor.1 a6, t6, t7
lw t6, 72(sp)
li t7, -55760003
or s2, t6, t7, -13
add t1, t1, t5
or t5, s3, t3, -13
xor.1 t3, s0, s1
li t7, 22769921
mul t6, t5, t7
sw t6, 81(sp)
add t1, t1, t2
li t7, 147807773
mul t3, t3, t7
lw t6, 99(sp)
add t5, t6, t4
li t7, -167119218
mul t2, s2, t7
lw t6, 123(sp)
or a5, t6, a5, -13
lw t6, 114(sp)
li t7, -55760003
or t6, t6, t7, -13
sw t6, 99(sp)
add a4, t2, a4
xor.T t4, a7, a5
lw t6, 57(sp)
lw t7, 72(sp)
and.1 a7, t6, t7, 13
lw t6, 90(sp)
lw t7, 99(sp)
or t2, t6, t7, -13
add a4, a4, t3
lw t6, 201(sp)
li t7, -156866149
mul t3, t6, t7
add t6, t5, t1
sw t6, 57(sp)
lw t6, 21(sp)
lw t7, 135(sp)
xor.1 a5, t6, t7
lw t6, 72(sp)
li t7, -81240349
mul t1, t6, t7
lw t6, 99(sp)
lw t7, 72(sp)
or.T t5, t6, t7
li t7, -55760003
and s0, t5, t7, 13
lw t6, 102(sp)
lw t7, 153(sp)
or.1 t5, t6, t7
xor.1 t5, t5, t0
lw t6, 6(sp)
lw t7, 60(sp)
and.1 t0, t6, t7, 13
and.T t4, t4, s0, -13
li t7, -12965181
mul t4, t4, t7
lw t7, 60(sp)
or.T s0, a3, t7
or t2, t5, t2, -13
or a6, s0, a6, -13
lw t7, 201(sp)
xor t2, t2, t7
li t7, 167870037
mul t2, t2, t7
li t7, -188917529
mul t0, t0, t7
add t4, t4, t2
li t7, -178940807
mul s0, a6, t7
lw t6, 144(sp)
lw t7, 150(sp)
and t2, t6, t7, 13
lw t6, 54(sp)
li t7, 58719558
mul a6, t6, t7
add a6, t0, a6
lw t6, 42(sp)
lw t7, 18(sp)
or.1 t5, t6, t7
add s0, t3, s0
lw t6, 129(sp)
li t7, -133308573
mul t3, t6, t7
lw t7, 117(sp)
xor.T a7, a7, t7
lw t6, 165(sp)
lw t7, 51(sp)
or.1 t0, t6, t7
lw t7, 147(sp)
and.T t0, t0, t7, -13
li t7, 142027354
mul t0, t0, t7
add t1, t1, s0
add a6, t1, a6
lw t6, 135(sp)
lw t7, 108(sp)
xor.T t1, t6, t7
add s0, a6, t3
lw t6, 3(sp)
li t7, -55760003
and.1 a6, t6, t7, 13
lw t6, 45(sp)
lw t7, 105(sp)
xor.1 t3, t6, t7
add s0, t4, s0
lw t6, 27(sp)
li t7, -139193576
mul t4, t6, t7
add a4, a4, s0
lw t6, 81(sp)
add a4, t6, a4
lw t6, 24(sp)
add t6, t6, a4
sw t6, 24(sp)
and t5, a5, t5, 13
li t7, -103113387
mul a5, t3, t7
lw t6, 15(sp)
lw t7, 42(sp)
and.1 t3, t6, t7, 13
and t2, a6, t2, 13
lw t6, 21(sp)
lw t7, 0(sp)
or.1 a4, t6, t7
and t2, t1, t2, 13
add t1, a5, t4
lw t6, 117(sp)
li t7, -129207201
mul a5, t6, t7
and.1 t4, t5, t2, 13
lw t6, 36(sp)
li t7, 190903078
mul t2, t6, t7
li t7, 10718417
mul t4, t4, t7
lw t6, 159(sp)
or.1 a7, t6, a7
lw t6, 141(sp)
lw t7, 123(sp)
or.T t5, t6, t7
add t0, t0, t4
lw t7, 108(sp)
or t4, t5, t7, -13
li t7, -126308608
mul t5, t3, t7
li t7, -125978198
mul a7, a7, t7
add t3, a7, t2
lw t6, 171(sp)
lw t7, 45(sp)
xor a7, t6, t7
lw t7, 135(sp)
and.T t2, a6, t7, -13
add t1, t5, t1
li t7, 175401647
mul t4, t4, t7
li t7, -127221978
mul a4, a4, t7
add a4, t3, a4
add a4, t0, a4
add a5, a5, t4
lw t6, 0(sp)
li t7, 55760003
or t3, t6, t7, -13
lw t6, 90(sp)
li t7, 87302995
mul t0, t6, t7
li t7, 137197058
mul t3, t3, t7
lw t7, 54(sp)
and.1 t5, a6, t7, 13
lw t6, 120(sp)
lw t7, 72(sp)
and.1 a6, t6, t7, 13
add t1, a4, t1
lw t6, 72(sp)
lw t7, 114(sp)
and a4, t6, t7, 13
lw t6, 72(sp)
lw t7, 15(sp)
or.T t4, t6, t7
lw t7, 84(sp)
xor a6, a6, t7
lw t7, 54(sp)
or t4, t4, t7, -13
lw t7, 99(sp)
or.1 s0, a7, t7
lw t6, 93(sp)
and s1, t6, t2, 13
lw t6, 105(sp)
lw t7, 120(sp)
xor t2, t6, t7
li t7, 21941301
mul a6, a6, t7
li t7, -86744789
mul a7, a4, t7
lw t6, 27(sp)
xor.1 t2, t6, t2
and.T s1, s1, t5, -13
lw t6, 66(sp)
or.1 t5, t6, a3
li t7, -81849970
mul s1, s1, t7
add t3, s1, t3
add t0, t3, t0
li t7, 1910297
add t0, t0, t7
lw t6, 165(sp)
lw t7, 147(sp)
xor t3, t6, t7
and.T t4, s0, t4, -13
lw t6, 156(sp)
and.T s1, t6, t5, -13
lw t6, 99(sp)
li t7, -55760003
and.T t5, t6, t7, -13
add a5, a5, t0
or.1 s0, t4, t2
lw t6, 21(sp)
lw t7, 126(sp)
or.1 t4, t6, t7
lw t6, 39(sp)
li t7, 125834180
mul t0, t6, t7
lw t6, 114(sp)
and t2, t6, s1, 13
add a5, t1, a5
lw t6, 24(sp)
add a5, t6, a5
lw t6, 57(sp)
add a5, t6, a5
lw t6, 9(sp)
add a5, t6, a5
lw t6, 51(sp)
li t7, -116745902
mul s1, t6, t7
lw t6, 18(sp)
lw t7, 153(sp)
xor.1 t1, t6, t7
lw t6, 0(sp)
li t7, 137496880
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 93(sp)
lw t7, 75(sp)
and.T s2, t6, t7, -13
li t7, -27498067
mul s0, s0, t7
or.T t3, t3, t1
li t7, -123731800
mul t5, t5, t7
add t1, a6, s0
add a7, a7, t5
li t7, 57782288
mul t5, t3, t7
or.T a6, t4, a3
li t7, -175022182
mul a6, a6, t7
add t3, a6, s1
lw t7, 87(sp)
and.1 a6, a3, t7, 13
lw t6, 6(sp)
and.T t4, t6, s2, -13
lw t6, 99(sp)
or s0, t6, t4, -13
lw t6, 27(sp)
lw t7, 45(sp)
xor.T t4, t6, t7
li t7, 135443054
mul s0, s0, t7
xor.1 s1, t2, a6
lw t7, 159(sp)
xor.1 a6, a3, t7
lw t6, 93(sp)
lw t7, 3(sp)
and.1 t2, t6, t7, 13
add t0, t0, s0
li t7, -88024082
mul a3, s1, t7
add t5, t5, a3
li t7, -71689010
mul a3, t4, t7
add t0, t5, t0
add a7, a7, t0
add t0, a7, t3
lw t6, 12(sp)
lw t7, 36(sp)
xor.T a7, t6, t7
add a3, t0, a3
lw t7, 117(sp)
and.T t0, a4, t7, -13
add a3, t1, a3
lw t6, 171(sp)
li t7, -55760003
or a4, t6, t7, -13
lw t6, 159(sp)
or.1 t1, t6, a7
lw t6, 51(sp)
lw t7, 162(sp)
and.T a7, t6, t7, -13
add a3, a5, a3
xor.1 t3, t2, t0
li t7, 120247543
mul a5, t1, t7
lw t6, 108(sp)
lw t7, 12(sp)
or.1 t0, t6, t7
lw t6, 162(sp)
li t7, -55760003
and t2, t6, t7, 13
lw t7, 51(sp)
and.1 t1, t3, t7, 13
and.1 a7, t1, a7, 13
li t7, 92706163
mul a7, a7, t7
li t7, 152947646
mul t1, t0, t7
lw t6, 201(sp)
li t7, -55760003
or t0, t6, t7, -13
xor.T t3, a6, a4
li t7, -78505386
mul a6, t2, t7
lw t6, 78(sp)
lw t7, 45(sp)
xor.1 a4, t6, t7
li t7, 136142701
mul t2, t3, t7
add a5, a5, t2
lw t6, 99(sp)
lw t7, 87(sp)
or t2, t6, t7, -13
add a5, a5, t1
add a5, a5, a6
add a5, a7, a5
li t7, -55760003
or.1 a6, t2, t7
li t7, 77752696
mul a7, t0, t7
li t7, -27062962
mul a4, a4, t7
slli t0, a6, 4
lw t6, 63(sp)
li t7, 119848828
xor.T t6, t6, t7
sw t6, 183(sp)
lw t6, 66(sp)
lw t7, 72(sp)
xor a6, t6, t7
lw t6, 30(sp)
lw t7, 63(sp)
xor.T t6, t6, t7
sw t6, 141(sp)
add a7, t0, a7
add a5, a5, a7
lw t6, 0(sp)
add a5, t6, a5
add a3, a3, a5
lw t6, 30(sp)
li t7, 119848828
and.T t6, t6, t7, -13
sw t6, 78(sp)
lw t6, 96(sp)
xor.T a5, t6, a6
lw t6, 123(sp)
and a5, t6, a5, 13
li t7, -94728117
mul a5, a5, t7
add a5, a4, a5
lw t6, 183(sp)
lw t7, 141(sp)
and a4, t6, t7, 13
lw t7, 78(sp)
or.T a4, a4, t7
add t6, a3, a5
sw t6, 189(sp)
lw t6, 189(sp)
lw t7, 48(sp)
xor t6, t6, t7
sw t6, 198(sp)
lw t6, 198(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 129(sp)
lw t6, 33(sp)
lw t7, 198(sp)
xor a3, t6, t7
lw t6, 189(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 72(sp)
lw t7, 225(sp)
xor.T t6, a3, t7
sw t6, 156(sp)
lw t6, 189(sp)
lw t7, 72(sp)
and t6, t6, t7, 13
sw t6, 57(sp)
lw t7, 225(sp)
or.T t6, a3, t7
sw t6, 132(sp)
li t7, -24085313
xor t6, a3, t7
sw t6, 96(sp)
lw t6, 225(sp)
xor.1 t6, t6, a3
sw t6, 150(sp)
li t7, 116234594
mul t6, a4, t7
sw t6, 0(sp)
lw t6, 225(sp)
and.T t6, t6, a3, -13
sw t6, 75(sp)
lw t6, 63(sp)
li t7, 119848828
or.T t6, t6, t7
sw t6, 99(sp)
lw t6, 225(sp)
or t6, t6, a3, -13
sw t6, 84(sp)
lw t6, 225(sp)
and t6, t6, a3, 13
sw t6, 219(sp)
lw t6, 225(sp)
and.1 t6, t6, a3, 13
sw t6, 204(sp)
lw t6, 63(sp)
or.1 t6, t6, a3
sw t6, 9(sp)
lw t6, 225(sp)
xor t6, t6, a3
sw t6, 153(sp)
lw t6, 9(sp)
li t7, 119848828
or.1 a4, t6, t7
li t7, 119848828
and.T t6, a3, t7, -13
sw t6, 24(sp)
li t7, -67451762
mul t6, a4, t7
sw t6, 90(sp)
lw t6, 225(sp)
or.1 t6, t6, a3
sw t6, 117(sp)
lw t6, 63(sp)
li t7, 119848828
xor t6, t6, t7
sw t6, 120(sp)
lw t7, 30(sp)
and.T t6, a3, t7, -13
sw t6, 12(sp)
li t7, 119848828
xor.1 t6, a3, t7
sw t6, 27(sp)
lw t6, 30(sp)
lw t7, 63(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
xor t6, a3, a3
sw t6, 51(sp)
lw t6, 30(sp)
li t7, 119848828
xor t6, t6, t7
sw t6, 147(sp)
lw t6, 30(sp)
li t7, 119848828
and.1 t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 30(sp)
lw t7, 63(sp)
or t6, t6, t7, -13
sw t6, 138(sp)
lw t6, 120(sp)
lw t7, 3(sp)
and.T a4, t6, t7, -13
lw t7, 99(sp)
or.T a6, a4, t7
lw t6, 141(sp)
li t7, 6188445
mul a5, t6, t7
lw t6, 30(sp)
li t7, 119848828
or.T t6, t6, t7
sw t6, 18(sp)
lw t6, 27(sp)
lw t7, 24(sp)
xor t6, t6, t7
sw t6, 108(sp)
lw t6, 18(sp)
li t7, 119848828
or.1 a4, t6, t7
lw t6, 108(sp)
li t7, -154165811
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 138(sp)
li t7, -153612026
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 63(sp)
xor t6, t6, a3
sw t6, 222(sp)
lw t6, 138(sp)
and a7, t6, a3, 13
lw t6, 63(sp)
li t7, 119848828
xor.1 t6, t6, t7
sw t6, 192(sp)
li t7, 119848828
or.1 t6, a3, t7
sw t6, 144(sp)
lw t7, 63(sp)
xor.1 t6, a3, t7
sw t6, 123(sp)
li t7, 10311098
mul t6, a4, t7
sw t6, 6(sp)
lw t6, 123(sp)
and.T t0, t6, a3, -13
lw t7, 144(sp)
xor t0, t0, t7
lw t6, 63(sp)
li t7, 119848828
or t6, t6, t7, -13
sw t6, 81(sp)
lw t6, 30(sp)
or t6, t6, a3, -13
sw t6, 93(sp)
lw t6, 93(sp)
lw t7, 27(sp)
and.1 t2, t6, t7, 13
lw t6, 147(sp)
li t7, 119848828
and t3, t6, t7, 13
li t7, 162757300
mul t1, a7, t7
lw t7, 108(sp)
xor t4, t3, t7
lw t6, 21(sp)
lw t7, 18(sp)
or.T a7, t6, t7
lw t7, 144(sp)
or.T t3, t2, t7
li t7, 119848828
and.1 t2, a3, t7, 13
xor.1 t4, a6, t4
li t7, -129149519
mul a6, t0, t7
lw t6, 27(sp)
and t0, t6, t2, 13
add t2, a5, t1
lw t6, 30(sp)
or.1 t6, t6, a3
sw t6, 87(sp)
li t7, -72204212
mul t0, t0, t7
lw t6, 183(sp)
lw t7, 21(sp)
and.1 t6, t6, t7, 13
sw t6, 54(sp)
lw t6, 63(sp)
li t7, 156891335
mul a5, t6, t7
lw t6, 30(sp)
li t7, 119848828
or t6, t6, t7, -13
sw t6, 165(sp)
lw t6, 165(sp)
li t7, -62213953
mul t1, t6, t7
lw t6, 30(sp)
li t7, 119848828
or.1 t6, t6, t7
sw t6, 114(sp)
li t7, -50679409
mul t6, t4, t7
sw t6, 15(sp)
lw t6, 63(sp)
li t7, 119848828
or.1 t6, t6, t7
sw t6, 60(sp)
li t7, -136560341
mul t3, t3, t7
add t6, a6, t3
sw t6, 36(sp)
lw t6, 222(sp)
lw t7, 12(sp)
or.1 t3, t6, t7
lw t6, 3(sp)
li t7, 160784147
mul a6, t6, t7
lw t6, 60(sp)
or.T t4, t6, a3
add a5, a6, a5
lw t6, 30(sp)
li t7, 119848828
xor.T t6, t6, t7
sw t6, 177(sp)
lw t6, 177(sp)
li t7, 193291365
mul a6, t6, t7
li t7, -134918901
mul a7, a7, t7
add a7, a7, t2
lw t6, 165(sp)
lw t7, 81(sp)
and.1 t2, t6, t7, 13
lw t6, 9(sp)
lw t7, 222(sp)
or t6, t6, t7, -13
sw t6, 42(sp)
lw t7, 177(sp)
and.T t4, t4, t7, -13
or.1 t4, a4, t4
lw t6, 87(sp)
lw t7, 114(sp)
xor a4, t6, t7
lw t6, 63(sp)
lw t7, 30(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
add t0, t0, t1
lw t7, 81(sp)
or.1 a4, a4, t7
lw t6, 192(sp)
xor.T t1, t6, t3
li t7, 18147672
mul t3, t1, t7
lw t7, 45(sp)
add t0, t0, t7
add t0, a7, t0
lw t7, 21(sp)
xor.T a7, t2, t7
li t7, -153517381
mul t1, t4, t7
lw t6, 108(sp)
lw t7, 78(sp)
and.1 t4, t6, t7, 13
lw t6, 93(sp)
li t7, 119848828
xor t2, t6, t7
lw t6, 39(sp)
add t3, t6, t3
lw t6, 30(sp)
xor.T t6, t6, a3
sw t6, 180(sp)
li t7, 119848828
xor t6, a3, t7
sw t6, 135(sp)
lw t6, 231(sp)
li t7, 119848828
and t6, t6, t7, 13
sw t6, 9(sp)
lw t7, 141(sp)
and.1 t4, t4, t7, 13
li t7, -15152583
mul t5, a4, t7
li t7, 81317743
mul t2, t2, t7
li t7, -101991467
mul a4, t4, t7
add t4, t3, t5
lw t6, 30(sp)
li t7, 119848828
xor.1 t6, t6, t7
sw t6, 45(sp)
lw t6, 207(sp)
lw t7, 54(sp)
xor s0, t6, t7
li t7, 119848828
xor.T t6, a3, t7
sw t6, 105(sp)
lw t6, 180(sp)
or.T t3, t6, a7
lw t7, 6(sp)
add t5, t4, t7
li t7, 169076689
mul a7, s0, t7
lw t6, 63(sp)
lw t7, 135(sp)
and t4, t6, t7, 13
li t7, 168327945
mul t4, t4, t7
add a5, a5, t1
add a5, a6, a5
add a6, t0, t5
add a5, a6, a5
lw t6, 36(sp)
add a5, t6, a5
lw t7, 63(sp)
or.T t6, a3, t7
sw t6, 174(sp)
lw t6, 15(sp)
add a6, t6, a5
li t7, -13321023
mul t0, t3, t7
lw t6, 108(sp)
lw t7, 12(sp)
and.1 t1, t6, t7, 13
add a5, t2, t4
lw t6, 63(sp)
or t6, t6, a3, -13
sw t6, 66(sp)
li t7, 119848828
or t6, a3, t7, -13
sw t6, 102(sp)
lw t6, 78(sp)
li t7, -47010186
mul t6, t6, t7
sw t6, 162(sp)
lw t6, 51(sp)
lw t7, 105(sp)
or t2, t6, t7, -13
lw t6, 93(sp)
or.1 t1, t6, t1
li t7, 32844797
mul t1, t1, t7
lw t6, 63(sp)
and t2, t6, t2, 13
add t1, a6, t1
add a4, a4, t0
lw t6, 93(sp)
li t7, -193078751
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 27(sp)
li t7, 55945536
mul t6, t6, t7
sw t6, 186(sp)
lw t6, 30(sp)
xor t6, t6, a3
sw t6, 195(sp)
lw t6, 63(sp)
li t7, 119848828
and.1 t6, t6, t7, 13
sw t6, 126(sp)
add a4, a4, a7
add t6, a5, a4
sw t6, 39(sp)
lw t6, 30(sp)
lw t7, 63(sp)
and.T t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 99(sp)
li t7, 61369943
mul t0, t6, t7
li t7, 10008202
mul a6, t2, t7
lw t6, 126(sp)
lw t7, 174(sp)
or.1 a4, t6, t7
lw t6, 0(sp)
add a5, t6, t1
lw t6, 90(sp)
add t6, t6, a5
sw t6, 36(sp)
lw t6, 9(sp)
lw t7, 42(sp)
and a7, t6, t7, 13
lw t6, 51(sp)
lw t7, 195(sp)
xor.1 a5, t6, t7
lw t6, 45(sp)
and t1, t6, a4, 13
lw t6, 66(sp)
li t7, -22968175
mul t6, t6, t7
sw t6, 201(sp)
lw t6, 222(sp)
or.1 a4, t6, a7
lw t6, 24(sp)
lw t7, 60(sp)
and.1 t2, t6, t7, 13
li t7, 82589377
mul a4, a4, t7
lw t6, 105(sp)
lw t7, 147(sp)
and.1 t4, t6, t7, 13
lw t6, 30(sp)
lw t7, 144(sp)
and.1 a7, t6, t7, 13
li t7, 180414164
mul t6, a5, t7
sw t6, 90(sp)
lw t7, 30(sp)
and.1 t6, a3, t7, 13
sw t6, 210(sp)
lw t6, 114(sp)
lw t7, 138(sp)
or.T a5, t6, t7
lw t6, 63(sp)
li t7, 119848828
and t6, t6, t7, 13
sw t6, 171(sp)
li t7, 119848828
and.1 a5, a5, t7, 13
lw t6, 171(sp)
lw t7, 66(sp)
and.1 t3, t6, t7, 13
lw t6, 138(sp)
or.1 t4, t6, t4
lw t7, 21(sp)
and t4, t4, t7, 13
li t7, -21813641
mul t4, t4, t7
lw t7, 45(sp)
or.T t5, a7, t7
li t7, 177223396
mul t6, a3, t7
sw t6, 159(sp)
lw t6, 63(sp)
li t7, 119848828
and.T t6, t6, t7, -13
sw t6, 0(sp)
lw t7, 30(sp)
or.T t6, a3, t7
sw t6, 216(sp)
lw t6, 168(sp)
lw t7, 165(sp)
or a7, t6, t7, -13
lw t6, 87(sp)
lw t7, 0(sp)
and.T s1, t6, t7, -13
add t0, t0, t4
lw t6, 93(sp)
lw t7, 3(sp)
xor.1 t6, t6, t7
sw t6, 213(sp)
lw t6, 147(sp)
lw t7, 12(sp)
or.T t6, t6, t7
sw t6, 15(sp)
add s0, a6, t0
li t7, 176890507
mul t6, s1, t7
sw t6, 93(sp)
lw t7, 192(sp)
xor.1 t0, t1, t7
lw t6, 51(sp)
lw t7, 231(sp)
or t6, t6, t7, -13
sw t6, 42(sp)
lw t7, 120(sp)
and a6, a3, t7, 13
xor t0, t0, t2
li t7, 152497127
mul t2, t0, t7
lw t6, 30(sp)
xor.1 t6, t6, a3
sw t6, 9(sp)
lw t6, 144(sp)
slli s1, t6, 7
lw t6, 60(sp)
li t7, -157683335
mul t4, t6, t7
li t7, 149728364
mul t5, t5, t7
lw t6, 9(sp)
lw t7, 54(sp)
and.T t0, t6, t7, -13
lw t7, 21(sp)
or t3, t3, t7, -13
li t7, -143222885
mul t0, t0, t7
lw t6, 102(sp)
lw t7, 51(sp)
or.T s2, t6, t7
lw t6, 39(sp)
add t1, t6, s0
add t1, t1, a4
lw t7, 135(sp)
and.T s0, t3, t7, -13
lw t6, 186(sp)
add t6, t6, s1
sw t6, 138(sp)
lw t7, 78(sp)
xor.T a4, a3, t7
lw t6, 24(sp)
lw t7, 126(sp)
and.T t3, t6, t7, -13
xor a5, s2, a5
lw t7, 162(sp)
add t2, t2, t7
lw t6, 6(sp)
add s1, t6, t2
lw t6, 63(sp)
lw t7, 216(sp)
and t2, t6, t7, 13
li t7, 96468856
mul s0, s0, t7
lw t6, 123(sp)
and.T a7, t6, a7, -13
lw t7, 90(sp)
add t6, s0, t7
sw t6, 186(sp)
li t7, 193373833
mul a7, a7, t7
add s0, s1, t5
add t4, a7, t4
lw t6, 216(sp)
li t7, -74087377
mul a7, t6, t7
lw t6, 108(sp)
lw t7, 177(sp)
or.1 t5, t6, t7
li t7, -3986426
mul s1, a4, t7
li t7, -173449152
mul a4, a6, t7
li t7, 119848828
and t6, a3, t7, 13
sw t6, 120(sp)
li t7, -69012581
mul t6, a5, t7
sw t6, 6(sp)
lw t6, 201(sp)
add s1, t6, s1
lw t6, 63(sp)
and.1 t6, t6, a3, 13
sw t6, 177(sp)
lw t6, 177(sp)
li t7, -118200228
mul t6, t6, t7
sw t6, 162(sp)
lw t6, 63(sp)
and t6, t6, a3, 13
sw t6, 90(sp)
add a5, s0, t0
add a5, t1, a5
lw t6, 36(sp)
add t6, t6, a5
sw t6, 36(sp)
li t7, 21743272
mul a5, t3, t7
lw t6, 90(sp)
lw t7, 144(sp)
and.T t0, t6, t7, -13
lw t6, 180(sp)
xor.T t1, t6, t5
lw t6, 42(sp)
li t7, 181998013
mul a6, t6, t7
lw t6, 15(sp)
lw t7, 78(sp)
xor.1 s0, t6, t7
add t3, t4, s1
lw t7, 183(sp)
xor t5, t2, t7
and.T t2, t1, s0, -13
lw t6, 213(sp)
and.T t0, t6, t0, -13
li t7, -164311509
mul t1, t0, t7
lw t6, 183(sp)
li t7, -119848828
or.1 t0, t6, t7
li t7, 28334874
mul t4, t2, t7
add t2, a7, t3
li t7, -181801882
mul a7, t5, t7
lw t6, 102(sp)
lw t7, 27(sp)
xor.1 t3, t6, t7
lw t6, 63(sp)
and.T s0, t6, a3, -13
lw t7, 30(sp)
and t6, a3, t7, 13
sw t6, 102(sp)
lw t6, 105(sp)
li t7, 119848828
xor.1 t5, t6, t7
lw t6, 30(sp)
lw t7, 63(sp)
xor t6, t6, t7
sw t6, 39(sp)
lw t6, 141(sp)
xor.1 t5, t6, t5
lw t7, 93(sp)
add s1, a7, t7
lw t6, 3(sp)
and a7, t6, t3, 13
lw t7, 87(sp)
or t3, s0, t7, -13
li t7, 68145909
mul t0, t0, t7
lw t6, 159(sp)
add t4, t6, t4
lw t6, 90(sp)
li t7, -14859323
mul s0, t6, t7
lw t7, 138(sp)
add s3, s1, t7
add s1, a4, t4
lw t6, 66(sp)
lw t7, 210(sp)
xor.1 a4, t6, t7
lw t6, 123(sp)
lw t7, 120(sp)
xor s2, t6, t7
li t7, -189429735
mul a4, a4, t7
lw t7, 30(sp)
xor.1 t4, t5, t7
lw t6, 6(sp)
add s3, t6, s3
lw t6, 39(sp)
lw t7, 3(sp)
and.1 t5, t6, t7, 13
lw t6, 30(sp)
lw t7, 63(sp)
or.1 t6, t6, t7
sw t6, 42(sp)
lw t7, 162(sp)
add s3, s3, t7
add a5, a5, s0
add a6, s1, a6
add t6, t1, a6
sw t6, 66(sp)
and.T t1, t3, s2, -13
add t6, s3, t2
sw t6, 138(sp)
lw t6, 54(sp)
li t7, -40093963
mul a6, t6, t7
li t7, 47084996
mul t1, t1, t7
lw t6, 144(sp)
lw t7, 99(sp)
and.T t2, t6, t7, -13
xor.T t3, t4, t5
lw t6, 180(sp)
xor.1 t6, t6, a3
sw t6, 141(sp)
add t1, t1, a5
lw t6, 192(sp)
li t7, 97398616
mul t4, t6, t7
lw t6, 63(sp)
lw t7, 21(sp)
and t5, t6, t7, 13
lw t6, 216(sp)
lw t7, 168(sp)
or s0, t6, t7, -13
lw t6, 63(sp)
lw t7, 12(sp)
xor.1 a5, t6, t7
or.T t5, t2, t5
li t7, 19186893
mul t2, s0, t7
li t7, 192153886
mul a7, a7, t7
add a6, t0, a6
li t7, -9963950
mul t0, t3, t7
add t0, t0, t4
lw t6, 222(sp)
li t7, 119848828
xor.T s0, t6, t7
lw t6, 210(sp)
lw t7, 165(sp)
or.T t4, t6, t7
add t0, t1, t0
lw t7, 30(sp)
xor t3, t5, t7
lw t7, 174(sp)
and t4, t4, t7, 13
add t0, t0, a4
lw t6, 171(sp)
lw t7, 216(sp)
xor.1 t1, t6, t7
add a4, t2, a7
li t7, 23616837
mul t2, s0, t7
lw t6, 24(sp)
li t7, -17634699
mul t6, t6, t7
sw t6, 93(sp)
lw t6, 54(sp)
lw t7, 3(sp)
or.1 t5, t6, t7
lw t6, 135(sp)
li t7, -119848828
xor.1 a7, t6, t7
li t7, -38641506
mul a5, a5, t7
li t7, -28333875
mul s0, t3, t7
li t7, 190792697
mul t3, t4, t7
add a6, s0, a6
add t6, t0, a6
sw t6, 15(sp)
xor a6, t5, t1
lw t6, 42(sp)
lw t7, 147(sp)
and t0, t6, t7, 13
add t6, a4, t2
sw t6, 24(sp)
add t6, a5, t3
sw t6, 6(sp)
li t7, -131630899
mul a4, a6, t7
li t7, -7691394
mul a5, t0, t7
li t7, -25768983
mul a6, a7, t7
lw t6, 45(sp)
li t7, -42509512
mul t6, t6, t7
sw t6, 135(sp)
lw t6, 105(sp)
lw t7, 18(sp)
or t1, t6, t7, -13
lw t6, 180(sp)
lw t7, 165(sp)
or t4, t6, t7, -13
lw t6, 63(sp)
li t7, 48743924
mul a7, t6, t7
lw t6, 45(sp)
li t7, 119848828
xor.T t2, t6, t7
lw t6, 195(sp)
li t7, 119848828
xor t0, t6, t7
lw t6, 108(sp)
li t7, 119848828
and.1 t3, t6, t7, 13
lw t6, 177(sp)
li t7, 119848828
xor t5, t6, t7
lw t7, 0(sp)
or s0, t5, t7, -13
slli t5, t4, 1
lw t7, 87(sp)
xor t4, t1, t7
lw t6, 183(sp)
lw t7, 12(sp)
and.T t1, t6, t7, -13
li t7, -159571553
mul s0, s0, t7
lw t6, 141(sp)
xor t2, t6, t2
li t7, 22024690
mul t2, t2, t7
li t7, -136582109
mul s1, t4, t7
lw t6, 99(sp)
lw t7, 60(sp)
xor.T t4, t6, t7
add a6, a6, t2
add t2, t5, s1
add t5, a6, s0
add t2, a7, t2
lw t6, 120(sp)
li t7, 119848828
and.1 a7, t6, t7, 13
li t7, -83892920
mul a6, t3, t7
add a5, a5, t5
lw t7, 105(sp)
and.T a7, a7, t7, -13
add a5, a4, a5
lw t6, 60(sp)
or.T s0, t6, t0
lw t6, 180(sp)
li t7, -11045313
mul a4, t6, t7
lw t6, 93(sp)
add t0, t6, a5
lw t6, 183(sp)
lw t7, 51(sp)
or t3, t6, t7, -13
lw t6, 21(sp)
lw t7, 120(sp)
or a5, t6, t7, -13
or t4, t1, t4, -13
lw t6, 18(sp)
lw t7, 3(sp)
xor.1 t5, t6, t7
li t7, -3093254
mul t1, s0, t7
lw t6, 45(sp)
and.T t4, t6, t4, -13
lw t6, 120(sp)
lw t7, 222(sp)
xor.T s0, t6, t7
li t7, 113441792
mul t4, t4, t7
lw t6, 6(sp)
add t0, t6, t0
lw t6, 24(sp)
add t0, t6, t0
add t0, t0, t2
lw t6, 90(sp)
li t7, -46140404
mul s1, t6, t7
lw t6, 15(sp)
add s2, t6, t0
li t7, -105978871
mul t2, a5, t7
lw t6, 9(sp)
lw t7, 81(sp)
and.T s3, t6, t7, -13
lw t6, 192(sp)
li t7, 11208673
mul a5, t6, t7
lw t6, 63(sp)
lw t7, 216(sp)
and.T t0, t6, t7, -13
lw t7, 144(sp)
or t5, t5, t7, -13
lw t6, 66(sp)
add s2, t6, s2
xor s3, t3, s3
li t7, -63428430
mul t3, s0, t7
or s0, s3, a7, -13
add t4, t4, t1
lw t6, 63(sp)
lw t7, 30(sp)
or.T a7, t6, t7
li t7, -76577272
mul t1, s0, t7
add t1, s1, t1
lw t7, 135(sp)
add s0, s2, t7
add t4, t4, a6
lw t6, 42(sp)
or.1 a6, t6, t5
add t6, t2, t4
sw t6, 21(sp)
lw t6, 138(sp)
add t2, t6, s0
li t7, -87156399
mul a6, a6, t7
add a6, t3, a6
lw t6, 186(sp)
add t6, t6, t2
sw t6, 15(sp)
lw t6, 174(sp)
lw t7, 126(sp)
xor t2, t6, t7
add a4, t1, a4
add t6, a6, a4
sw t6, 12(sp)
lw t7, 30(sp)
and.1 a7, a7, t7, 13
lw t6, 60(sp)
lw t7, 123(sp)
xor.1 a4, t6, t7
lw t7, 108(sp)
and.1 a4, a4, t7, 13
li t7, -172646372
mul a6, a4, t7
li t7, -15486374
mul t1, t2, t7
li t7, -113606304
mul t3, t0, t7
lw t6, 30(sp)
lw t7, 9(sp)
or.T t2, t6, t7
lw t6, 90(sp)
lw t7, 147(sp)
xor t0, t6, t7
lw t7, 123(sp)
xor.T a4, a3, t7
lw t7, 102(sp)
xor.T t4, a3, t7
add t3, t3, t1
or.T t4, t4, a7
li t7, 41600514
mul t1, t2, t7
lw t6, 30(sp)
li t7, 18984631
mul a7, t6, t7
add t2, t3, a5
li t7, 14287996
mul t4, t4, t7
lw t6, 60(sp)
li t7, 18565763
mul t3, t6, t7
li t7, -145744629
or t6, a3, t7, -13
sw t6, 108(sp)
slli a5, t0, 5
add a6, t4, a6
lw t6, 225(sp)
li t7, -145744629
and t6, t6, t7, 13
sw t6, 123(sp)
add a6, a6, t1
add a6, a6, t3
add t6, t2, a6
sw t6, 9(sp)
lw t6, 147(sp)
lw t7, 165(sp)
xor.T a6, t6, t7
li t7, 141267476
mul t1, a4, t7
lw t6, 114(sp)
lw t7, 39(sp)
or.T a4, t6, t7
lw t6, 81(sp)
lw t7, 18(sp)
and.T t0, t6, t7, -13
add a7, a7, t1
lw t6, 27(sp)
li t7, -70140089
mul t1, t6, t7
add t1, a5, t1
li t7, 126854549
mul a5, t0, t7
lw t7, 105(sp)
or.1 t0, a4, t7
add a4, t1, a7
lw t7, 207(sp)
xor t0, t0, t7
lw t6, 54(sp)
lw t7, 114(sp)
or.T a7, t6, t7
and.T a7, a7, a6, -13
li t7, 14814648
mul a6, t0, t7
lw t6, 60(sp)
lw t7, 78(sp)
xor.1 t1, t6, t7
lw t6, 0(sp)
li t7, 119848828
xor.T t3, t6, t7
lw t6, 30(sp)
li t7, 119848828
and t2, t6, t7, 13
lw t6, 63(sp)
li t7, 59062666
mul t0, t6, t7
lw t7, 99(sp)
or t2, t2, t7, -13
lw t6, 225(sp)
li t7, -145744629
or.T t6, t6, t7
sw t6, 120(sp)
li t7, 74530759
mul t2, t2, t7
lw t6, 225(sp)
lw t7, 123(sp)
or.T t6, t6, t7
sw t6, 18(sp)
and t1, t1, t3, 13
or a7, t1, a7, -13
lw t6, 75(sp)
li t7, 152348166
mul t6, t6, t7
sw t6, 30(sp)
lw t6, 225(sp)
li t7, -145744629
or.1 t6, t6, t7
sw t6, 207(sp)
li t7, 112952771
mul a7, a7, t7
add a5, a5, a7
add a7, t2, t0
add a5, a5, a7
lw t6, 96(sp)
lw t7, 96(sp)
xor t6, t6, t7
sw t6, 27(sp)
lw t6, 225(sp)
li t7, -145744629
xor t6, t6, t7
sw t6, 3(sp)
lw t6, 153(sp)
lw t7, 3(sp)
or.1 t6, t6, t7
sw t6, 81(sp)
add a5, a6, a5
add a4, a4, a5
lw t6, 225(sp)
li t7, -145744629
xor.T t6, t6, t7
sw t6, 159(sp)
lw t6, 225(sp)
li t7, -145744629
xor.1 a6, t6, t7
lw t6, 207(sp)
li t7, -145744629
and t6, t6, t7, 13
sw t6, 6(sp)
lw t7, 123(sp)
or a5, a6, t7, -13
li t7, -145744629
and t6, a3, t7, 13
sw t6, 147(sp)
lw t6, 207(sp)
lw t7, 123(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 219(sp)
li t7, 92172044
mul t6, t6, t7
sw t6, 126(sp)
lw t6, 9(sp)
add a7, t6, a4
lw t6, 225(sp)
li t7, -145744629
or t6, t6, t7, -13
sw t6, 180(sp)
lw t6, 180(sp)
lw t7, 159(sp)
and.1 a4, t6, t7, 13
li t7, -145744629
and.1 t6, a3, t7, 13
sw t6, 216(sp)
li t7, -145744629
xor t6, a3, t7
sw t6, 168(sp)
lw t6, 12(sp)
add a7, t6, a7
lw t6, 21(sp)
add a7, t6, a7
or t6, a3, a6, -13
sw t6, 105(sp)
lw t6, 15(sp)
add a6, t6, a7
lw t6, 36(sp)
add t6, t6, a6
sw t6, 93(sp)
lw t6, 93(sp)
lw t7, 93(sp)
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 96(sp)
lw t7, 93(sp)
or.1 t6, t6, t7
sw t6, 78(sp)
lw t6, 96(sp)
lw t7, 93(sp)
xor.1 t6, t6, t7
sw t6, 222(sp)
lw t6, 96(sp)
lw t7, 93(sp)
and.1 t6, t6, t7, 13
sw t6, 15(sp)
lw t6, 96(sp)
lw t7, 93(sp)
or.T t6, t6, t7
sw t6, 165(sp)
lw t6, 15(sp)
lw t7, 225(sp)
and.T t6, t6, t7, -13
sw t6, 21(sp)
lw t6, 96(sp)
lw t7, 93(sp)
and t6, t6, t7, 13
sw t6, 102(sp)
lw t6, 15(sp)
lw t7, 225(sp)
xor t6, t6, t7
sw t6, 54(sp)
lw t7, 207(sp)
xor.1 a4, a4, t7
lw t6, 15(sp)
and.1 t6, t6, a3, 13
sw t6, 0(sp)
lw t7, 0(sp)
and t0, a5, t7, 13
lw t6, 15(sp)
li t7, -145744629
xor t6, t6, t7
sw t6, 12(sp)
lw t6, 15(sp)
lw t7, 225(sp)
and.1 t6, t6, t7, 13
sw t6, 60(sp)
lw t6, 15(sp)
lw t7, 225(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
li t7, -145744629
or.1 t6, a3, t7
sw t6, 9(sp)
lw t6, 21(sp)
li t7, -145744629
xor.T a7, t6, t7
lw t6, 66(sp)
li t7, -134789448
mul a6, t6, t7
lw t6, 15(sp)
lw t7, 225(sp)
xor.T t6, t6, t7
sw t6, 45(sp)
lw t6, 93(sp)
lw t7, 96(sp)
xor.T t6, t6, t7
sw t6, 249(sp)
lw t6, 15(sp)
xor t6, t6, a3
sw t6, 201(sp)
lw t6, 15(sp)
li t7, -145744629
or.T t6, t6, t7
sw t6, 138(sp)
lw t6, 15(sp)
li t7, -145744629
xor.T t6, t6, t7
sw t6, 174(sp)
lw t7, 15(sp)
or.T t6, a3, t7
sw t6, 114(sp)
lw t6, 60(sp)
lw t7, 108(sp)
and.T a5, t6, t7, -13
lw t6, 15(sp)
li t7, -145744629
and.T t6, t6, t7, -13
sw t6, 135(sp)
lw t6, 54(sp)
lw t7, 114(sp)
and.1 t1, t6, t7, 13
lw t6, 15(sp)
li t7, -145744629
xor.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 15(sp)
or.1 t6, t6, a3
sw t6, 87(sp)
lw t6, 0(sp)
lw t7, 135(sp)
and t2, t6, t7, 13
lw t7, 15(sp)
and.T t0, t0, t7, -13
lw t6, 87(sp)
lw t7, 225(sp)
xor t3, t6, t7
lw t6, 15(sp)
lw t7, 225(sp)
and t6, t6, t7, 13
sw t6, 24(sp)
li t7, -178399965
mul t0, t0, t7
lw t6, 15(sp)
lw t7, 15(sp)
xor t6, t6, t7
sw t6, 42(sp)
lw t6, 60(sp)
lw t7, 45(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
lw t6, 18(sp)
xor.T t4, t6, a7
lw t7, 15(sp)
and t6, a3, t7, 13
sw t6, 90(sp)
lw t6, 135(sp)
li t7, -145744629
or a7, t6, t7, -13
li t7, -120842851
mul t1, t1, t7
lw t6, 120(sp)
lw t7, 60(sp)
xor t5, t6, t7
lw t7, 225(sp)
or.T t4, t4, t7
lw t7, 144(sp)
or.1 t6, t2, t7
sw t6, 213(sp)
lw t6, 24(sp)
lw t7, 45(sp)
and.1 t2, t6, t7, 13
and a4, t3, a4, 13
li t7, 40601173
mul t5, t5, t7
lw t7, 117(sp)
or.1 t3, t2, t7
lw t6, 216(sp)
lw t7, 60(sp)
and t6, t6, t7, 13
sw t6, 99(sp)
add a6, a6, t5
and t2, t4, a4, 13
add a4, t0, a6
add a4, a4, t1
lw t7, 138(sp)
and.T t0, a3, t7, -13
lw t6, 108(sp)
or.T a6, t6, a7
li t7, -157030159
mul a7, a6, t7
lw t6, 153(sp)
li t7, -145744629
or.1 a6, t6, t7
lw t6, 123(sp)
or t1, t6, t3, -13
lw t6, 9(sp)
and.1 a5, t6, a5, 13
li t7, -128225870
mul a5, a5, t7
lw t6, 159(sp)
lw t7, 24(sp)
and t4, t6, t7, 13
lw t6, 12(sp)
li t7, 141362622
mul t6, t6, t7
sw t6, 18(sp)
lw t6, 213(sp)
li t7, 106658990
mul s1, t6, t7
li t7, 154232841
mul t3, t1, t7
lw t6, 24(sp)
lw t7, 114(sp)
or.T t5, t6, t7
li t7, -68391541
mul t1, t4, t7
li t7, -78779503
mul t4, t2, t7
lw t6, 42(sp)
lw t7, 201(sp)
and.1 t2, t6, t7, 13
lw t7, 81(sp)
and.1 s2, t5, t7, 13
lw t7, 39(sp)
or t2, t2, t7, -13
add t5, t4, a4
lw t6, 225(sp)
lw t7, 135(sp)
xor.1 s0, t6, t7
lw t6, 15(sp)
lw t7, 225(sp)
or.T t6, t6, t7
sw t6, 162(sp)
lw t6, 219(sp)
lw t7, 21(sp)
xor t6, t6, t7
sw t6, 186(sp)
li t7, 113514070
mul t4, t2, t7
lw t6, 105(sp)
lw t7, 6(sp)
and.1 a4, t6, t7, 13
add s4, s1, a5
lw t6, 90(sp)
lw t7, 144(sp)
or t2, t6, t7, -13
lw t6, 84(sp)
lw t7, 213(sp)
or s3, t6, t7, -13
lw t6, 174(sp)
lw t7, 138(sp)
xor.T a5, t6, t7
or.T s1, s2, t0
add t3, t3, s4
lw t6, 75(sp)
lw t7, 9(sp)
xor.1 t0, t6, t7
add t3, a7, t3
li t7, 19085965
mul a7, s3, t7
add t6, t5, t3
sw t6, 177(sp)
lw t7, 147(sp)
and.1 s0, s0, t7, 13
lw t6, 15(sp)
or t6, t6, a3, -13
sw t6, 192(sp)
lw t6, 15(sp)
and.T t6, t6, a3, -13
sw t6, 195(sp)
lw t7, 36(sp)
xor t3, a6, t7
lw t6, 162(sp)
li t7, 80018427
mul t5, t6, t7
add t6, t1, t4
sw t6, 39(sp)
lw t6, 213(sp)
lw t7, 87(sp)
and.1 t1, t6, t7, 13
li t7, -57989106
mul a6, s1, t7
lw t7, 126(sp)
add s1, a6, t7
lw t6, 45(sp)
li t7, 159403142
mul s2, t6, t7
li t7, 15838218
mul t4, t2, t7
li t7, -125155173
mul a6, s0, t7
lw t7, 225(sp)
and s0, t1, t7, 13
lw t6, 195(sp)
li t7, 150607033
mul t2, t6, t7
lw t6, 99(sp)
li t7, -168644172
mul t6, t6, t7
sw t6, 210(sp)
lw t6, 201(sp)
lw t7, 24(sp)
or.1 t1, t6, t7
add t6, s2, t5
sw t6, 126(sp)
li t7, 69800185
mul t6, t3, t7
sw t6, 153(sp)
add t6, s1, a7
sw t6, 36(sp)
li t7, 144657196
mul a7, s0, t7
lw t7, 18(sp)
add a7, a7, t7
add a7, a7, t4
lw t6, 225(sp)
lw t7, 159(sp)
xor.1 t6, t6, t7
sw t6, 18(sp)
li t7, -136026323
mul t3, a4, t7
xor.1 a5, a5, t0
lw t6, 54(sp)
lw t7, 195(sp)
or.T a4, t6, t7
lw t6, 117(sp)
xor t0, t6, a3
lw t6, 15(sp)
xor.T t6, t6, a3
sw t6, 141(sp)
lw t6, 15(sp)
li t7, -145744629
and.1 t6, t6, t7, 13
sw t6, 81(sp)
lw t6, 84(sp)
lw t7, 174(sp)
and t4, t6, t7, 13
li t7, 71647136
mul t5, a5, t7
add t2, t2, t3
lw t6, 3(sp)
or.1 a5, t6, t0
lw t7, 30(sp)
add t0, t2, t7
add t2, a7, t0
lw t6, 225(sp)
lw t7, 201(sp)
xor.1 t3, t6, t7
lw t6, 147(sp)
lw t7, 21(sp)
and.T t0, t6, t7, -13
lw t6, 168(sp)
lw t7, 60(sp)
or s1, t6, t7, -13
lw t6, 219(sp)
lw t7, 15(sp)
xor.1 a7, t6, t7
lw t6, 141(sp)
lw t7, 54(sp)
xor.T s0, t6, t7
add t6, a6, t5
sw t6, 6(sp)
or.1 t1, t1, t4
lw t6, 192(sp)
xor a4, t6, a4
li t7, 6648441
mul a6, s1, t7
lw t7, 60(sp)
or.T t5, a3, t7
li t7, -145744629
xor.1 t6, a3, t7
sw t6, 171(sp)
lw t6, 195(sp)
lw t7, 135(sp)
xor.1 t6, t6, t7
sw t6, 183(sp)
lw t6, 15(sp)
lw t7, 24(sp)
and.1 t6, t6, t7, 13
sw t6, 99(sp)
slli a4, a4, 7
lw t6, 159(sp)
or.1 t0, t6, t0
lw t6, 186(sp)
or s0, t6, s0, -13
lw t6, 15(sp)
li t7, -145744629
and t6, t6, t7, 13
sw t6, 186(sp)
li t7, -145744629
and.T t6, a3, t7, -13
sw t6, 105(sp)
lw t6, 0(sp)
lw t7, 3(sp)
xor.1 t4, t6, t7
or.1 t1, s0, t1
lw t7, 108(sp)
xor.T t3, t3, t7
li t7, 132351567
mul t1, t1, t7
xor.T t5, t3, t5
lw t6, 36(sp)
add t3, t6, t2
lw t6, 45(sp)
lw t7, 120(sp)
xor.1 t2, t6, t7
add a6, t1, a6
lw t6, 111(sp)
lw t7, 15(sp)
xor.1 t1, t6, t7
lw t6, 81(sp)
lw t7, 147(sp)
or.T s0, t6, t7
lw t6, 153(sp)
add s1, t6, a6
lw t7, 210(sp)
add a6, t3, t7
lw t7, 126(sp)
add s1, s1, t7
and.T a5, s0, a5, -13
li t7, -76789269
mul s2, a5, t7
lw t6, 201(sp)
slli t6, t6, 2
sw t6, 30(sp)
li t7, 92769527
mul t3, a7, t7
lw t6, 18(sp)
and a5, t6, t4, 13
lw t6, 84(sp)
lw t7, 15(sp)
xor t6, t6, t7
sw t6, 18(sp)
lw t6, 75(sp)
lw t7, 192(sp)
or s0, t6, t7, -13
lw t6, 171(sp)
lw t7, 147(sp)
and.1 t4, t6, t7, 13
lw t6, 216(sp)
and a7, t6, a3, 13
lw t7, 66(sp)
xor.1 s0, s0, t7
lw t6, 51(sp)
li t7, 189814729
mul s3, t6, t7
lw t6, 45(sp)
and t4, t6, t4, 13
lw t6, 3(sp)
or s4, t6, t4, -13
lw t6, 15(sp)
lw t7, 66(sp)
and.T t4, t6, t7, -13
lw t7, 114(sp)
or s5, t0, t7, -13
lw t6, 15(sp)
and.T a7, t6, a7, -13
li t7, 1177553
mul t0, t5, t7
add t5, s1, s2
lw t6, 6(sp)
add s1, t6, t5
xor.T t2, t2, s4
li t7, 157408803
mul t5, s5, t7
add a4, a4, t5
li t7, 192460646
mul t2, t2, t7
add t5, s3, t2
lw t6, 99(sp)
li t7, -8185074
mul t2, t6, t7
add t0, a4, t0
li t7, -191339754
mul a4, t1, t7
lw t6, 147(sp)
lw t7, 156(sp)
or t1, t6, t7, -13
li t7, -92173
mul s2, s0, t7
add t0, t3, t0
li t7, 95532546
add t3, t0, t7
lw t6, 159(sp)
lw t7, 225(sp)
or t0, t6, t7, -13
add a6, a6, s1
lw t6, 39(sp)
add s0, t6, a6
lw t6, 105(sp)
lw t7, 138(sp)
xor a6, t6, t7
lw t6, 177(sp)
add t6, t6, s0
sw t6, 6(sp)
lw t6, 21(sp)
li t7, -34201866
mul s0, t6, t7
lw t6, 90(sp)
lw t7, 186(sp)
or.1 s1, t6, t7
lw t6, 3(sp)
lw t7, 15(sp)
and.1 t6, t6, t7, 13
sw t6, 39(sp)
lw t6, 75(sp)
or.T s4, t6, t4
lw t6, 141(sp)
or.1 a6, t6, a6
lw t6, 225(sp)
li t7, -145744629
and.1 t4, t6, t7, 13
xor s3, a5, a6
lw t6, 186(sp)
lw t7, 21(sp)
or a6, t6, t7, -13
add s2, t5, s2
li t7, 141018437
mul a5, s4, t7
li t7, 186688651
mul t5, a7, t7
lw t6, 225(sp)
li t7, -145744629
and.T a7, t6, t7, -13
lw t7, 162(sp)
or s5, t4, t7, -13
slli s6, s3, 6
li t7, 140376726
mul t6, t4, t7
sw t6, 126(sp)
add s2, t3, s2
lw t6, 18(sp)
lw t7, 114(sp)
or.1 s4, t6, t7
lw t7, 186(sp)
xor s3, s5, t7
add t2, t2, s6
lw t7, 183(sp)
xor.1 t3, s1, t7
li t7, 164089122
mul t4, t1, t7
add t6, s0, a5
sw t6, 90(sp)
lw t7, 15(sp)
xor.1 a5, a3, t7
li t7, 159350228
mul t1, t3, t7
add t3, t5, t1
lw t6, 87(sp)
or.T s0, t6, s4
lw t7, 66(sp)
or.1 t6, t0, t7
sw t6, 18(sp)
li t7, -127075502
mul t0, s3, t7
add t1, s2, t2
add s1, a4, t0
lw t6, 12(sp)
xor.1 t5, t6, a7
lw t6, 192(sp)
lw t7, 0(sp)
xor t6, t6, t7
sw t6, 36(sp)
lw t6, 15(sp)
li t7, -145744629
or t2, t6, t7, -13
lw t6, 156(sp)
li t7, -145744629
xor t0, t6, t7
li t7, -145744629
xor.T a4, a3, t7
lw t7, 30(sp)
add s2, t4, t7
lw t6, 15(sp)
lw t7, 0(sp)
and t6, t6, t7, 13
sw t6, 99(sp)
li t7, 182906655
mul s3, s0, t7
lw t6, 15(sp)
li t7, -51002646
mul s0, t6, t7
lw t7, 141(sp)
and.T t4, a3, t7, -13
add s1, s3, s1
li t7, -116229932
mul a6, a6, t7
or a7, a5, a7, -13
add t3, t3, s2
lw t7, 195(sp)
or.T s2, a7, t7
lw t6, 24(sp)
and.T a7, t6, t5, -13
add a6, a6, s0
add t5, s1, t3
lw t6, 75(sp)
and.1 t3, t6, s2, 13
lw t6, 120(sp)
xor.T t4, t6, t4
li t7, -150177908
mul s2, a7, t7
li t7, -9636482
mul t3, t3, t7
lw t6, 87(sp)
lw t7, 201(sp)
and.T a7, t6, t7, -13
add s0, t1, t5
lw t6, 24(sp)
lw t7, 39(sp)
xor.T s1, t6, t7
li t7, -15353641
mul t1, t4, t7
add t4, t1, s2
lw t7, 114(sp)
and.T t1, t2, t7, -13
lw t6, 120(sp)
li t7, -145744629
xor.1 t2, t6, t7
lw t6, 180(sp)
xor.1 t5, t6, a5
lw t6, 123(sp)
li t7, 97034321
mul a5, t6, t7
lw t6, 225(sp)
li t7, 8493821
mul t6, t6, t7
sw t6, 0(sp)
or.T t0, s1, t0
lw t6, 6(sp)
add t6, t6, s0
sw t6, 51(sp)
lw t6, 24(sp)
lw t7, 201(sp)
and.T s1, t6, t7, -13
lw t6, 186(sp)
lw t7, 132(sp)
or.T s0, t6, t7
lw t7, 18(sp)
or.1 s0, s0, t7
lw t7, 90(sp)
add t4, t4, t7
add t4, t4, t3
lw t6, 21(sp)
li t7, -145744629
and s2, t6, t7, 13
or t3, s1, t5, -13
li t7, -97098365
mul t0, t0, t7
add t5, t4, t0
and.T t1, s2, t1, -13
li t7, -179295177
mul t4, s0, t7
li t7, -30730657
mul t6, t3, t7
sw t6, 30(sp)
lw t6, 12(sp)
slli t0, t6, 5
add s0, t5, a6
lw t6, 15(sp)
lw t7, 60(sp)
or t5, t6, t7, -13
li t7, -62439856
mul t1, t1, t7
li t7, 64010966
mul t2, t2, t7
lw t6, 15(sp)
lw t7, 225(sp)
or.1 t6, t6, t7
sw t6, 39(sp)
li t7, -145744629
or.T t3, a3, t7
lw t6, 3(sp)
lw t7, 216(sp)
or a6, t6, t7, -13
lw t7, 219(sp)
xor a7, a7, t7
add t6, s0, t4
sw t6, 18(sp)
lw t6, 36(sp)
li t7, -180948192
mul t4, t6, t7
lw t6, 147(sp)
lw t7, 21(sp)
xor.1 s1, t6, t7
or.1 t5, a4, t5
lw t6, 54(sp)
and.1 s0, t6, a4, 13
li t7, -164516594
mul s1, s1, t7
add t2, t2, t4
add t6, s1, t0
sw t6, 111(sp)
lw t6, 87(sp)
or.1 t4, t6, s0
lw t7, 114(sp)
or t5, t5, t7, -13
lw t6, 66(sp)
lw t7, 120(sp)
or.T t0, t6, t7
li t7, -51617650
mul t5, t5, t7
add t5, t5, a5
lw t6, 180(sp)
lw t7, 174(sp)
xor.T a5, t6, t7
lw t7, 117(sp)
or.T a5, a5, t7
lw t6, 81(sp)
lw t7, 180(sp)
or.T t6, t6, t7
sw t6, 90(sp)
lw t6, 126(sp)
add s2, t6, t2
lw t6, 225(sp)
lw t7, 87(sp)
and.1 s1, t6, t7, 13
lw t7, 12(sp)
or.T t2, a7, t7
lw t7, 171(sp)
xor s0, t3, t7
add t1, t1, s2
lw t6, 87(sp)
xor a7, t6, a3
add t1, t1, t5
lw t6, 0(sp)
add t1, t6, t1
lw t6, 144(sp)
lw t7, 87(sp)
xor.T t6, t6, t7
sw t6, 6(sp)
lw t6, 99(sp)
li t7, 171972289
mul s2, t6, t7
lw t6, 150(sp)
lw t7, 105(sp)
xor.T s3, t6, t7
lw t7, 75(sp)
or.1 t5, t4, t7
li t7, -130286873
mul t3, s1, t7
lw t6, 225(sp)
or s1, t6, s3, -13
li t7, 52389582
mul s3, a7, t7
lw t6, 81(sp)
li t7, 186537622
mul t4, t6, t7
or.1 a5, a4, a5
lw t7, 135(sp)
xor.T a7, a4, t7
xor.1 s0, a6, s0
li t7, 82164317
mul t6, a5, t7
sw t6, 0(sp)
add a5, t1, s2
lw t6, 39(sp)
lw t7, 75(sp)
and.T a6, t6, t7, -13
li t7, -91185048
mul t0, t0, t7
li t7, -2745629
mul a6, a6, t7
add s2, s3, a6
lw t7, 30(sp)
add a5, a5, t7
li t7, 18382716
mul t1, s1, t7
lw t6, 225(sp)
lw t7, 213(sp)
xor.1 a6, t6, t7
lw t7, 192(sp)
and.T t2, t2, t7, -13
lw t6, 141(sp)
lw t7, 135(sp)
xor.T s1, t6, t7
li t7, 84507722
mul t6, s1, t7
sw t6, 36(sp)
li t7, -154555160
mul s0, s0, t7
li t7, -130674953
mul s1, t5, t7
li t7, -35993781
mul t5, t2, t7
add t6, s1, t3
sw t6, 30(sp)
lw t6, 108(sp)
lw t7, 84(sp)
and s1, t6, t7, 13
lw t6, 24(sp)
li t7, -145744629
xor t3, t6, t7
add t4, t4, s2
lw t6, 21(sp)
lw t7, 168(sp)
and.1 t2, t6, t7, 13
lw t6, 90(sp)
xor.T s2, t6, s1
lw t6, 111(sp)
add t4, t6, t4
li t7, -9428153
mul s1, t3, t7
add t4, t4, s0
lw t6, 147(sp)
lw t7, 21(sp)
or.T t3, t6, t7
add t4, t5, t4
lw t6, 75(sp)
lw t7, 9(sp)
or t5, t6, t7, -13
li t7, 27936286
mul s0, s2, t7
xor.1 a7, a7, a3
add t0, t0, s0
lw t6, 135(sp)
or a7, t6, a7, -13
or a7, t5, a7, -13
add s0, t1, s1
lw t6, 204(sp)
lw t7, 144(sp)
xor t5, t6, t7
li t7, 64295478
mul t1, a7, t7
lw t6, 39(sp)
lw t7, 12(sp)
xor.1 a7, t6, t7
add t6, s0, t0
sw t6, 9(sp)
add t6, a5, t4
sw t6, 12(sp)
li t7, -173498846
mul a5, t5, t7
and a6, a4, a6, 13
lw t6, 216(sp)
li t7, 145744629
or t0, t6, t7, -13
lw t7, 87(sp)
and.1 t4, t3, t7, 13
lw t6, 3(sp)
lw t7, 156(sp)
xor.1 t3, t6, t7
li t7, -171152491
mul a6, a6, t7
li t7, 62794922
mul t5, t2, t7
li t7, 73453202
mul t2, t4, t7
li t7, 145744629
and.T t4, a4, t7, -13
add a4, t1, t5
or t1, t4, t3, -13
lw t7, 162(sp)
and.T a7, a7, t7, -13
lw t6, 66(sp)
lw t7, 150(sp)
or t3, t6, t7, -13
lw t6, 156(sp)
lw t7, 213(sp)
xor.T t5, t6, t7
li t7, -157932334
mul t3, t3, t7
li t7, -131898459
mul a7, a7, t7
lw t7, 36(sp)
add t3, t3, t7
add a7, a6, a7
lw t6, 207(sp)
lw t7, 132(sp)
and.1 s0, t6, t7, 13
lw t6, 150(sp)
li t7, -31256271
mul a6, t6, t7
lw t6, 147(sp)
lw t7, 45(sp)
or.1 t4, t6, t7
lw t6, 195(sp)
lw t7, 60(sp)
xor.T s1, t6, t7
li t7, -145744629
and.1 s1, s1, t7, 13
and s0, s0, s1, 13
lw t6, 6(sp)
and t5, t6, t5, 13
and.1 t0, s0, t0, 13
lw t6, 249(sp)
li t7, 50356991
xor t6, t6, t7
sw t6, 6(sp)
li t7, -149498845
mul t0, t0, t7
li t7, 50907565
mul t5, t5, t7
add t0, t2, t0
lw t6, 207(sp)
or.1 a3, t6, a3
lw t6, 249(sp)
lw t7, 249(sp)
xor t6, t6, t7
sw t6, 201(sp)
add t2, t5, a5
li t7, -73883667
mul a5, t1, t7
lw t6, 198(sp)
li t7, 138102272
mul t6, t6, t7
sw t6, 90(sp)
add t2, t3, t2
lw t6, 204(sp)
lw t7, 180(sp)
or t3, t6, t7, -13
and.1 t1, a3, t4, 13
li t7, 32034961
mul a3, t3, t7
lw t6, 54(sp)
lw t7, 42(sp)
xor.T t3, t6, t7
lw t6, 198(sp)
li t7, 51258993
mul t6, t6, t7
sw t6, 99(sp)
li t7, 54394312
mul t3, t3, t7
add a5, a5, t0
lw t6, 231(sp)
lw t7, 198(sp)
or t0, t6, t7, -13
lw t6, 189(sp)
li t7, 31103510
xor.1 t6, t6, t7
sw t6, 186(sp)
li t7, 24318108
add t2, t2, t7
add a7, a7, t2
add a4, a4, a7
lw t6, 96(sp)
li t7, 31103510
or t6, t6, t7, -13
sw t6, 147(sp)
add a6, t3, a6
li t7, 119894114
mul a7, t1, t7
lw t6, 9(sp)
add a4, t6, a4
lw t6, 96(sp)
li t7, 31103510
and.1 t6, t6, t7, 13
sw t6, 111(sp)
lw t6, 30(sp)
add a4, t6, a4
li t7, -70534224
mul t6, t0, t7
sw t6, 3(sp)
add a6, a7, a6
lw t6, 96(sp)
li t7, 31103510
and t6, t6, t7, 13
sw t6, 162(sp)
add a5, a5, a6
lw t6, 189(sp)
lw t7, 96(sp)
and t6, t6, t7, 13
sw t6, 108(sp)
lw t6, 189(sp)
li t7, 31103510
xor t6, t6, t7
sw t6, 204(sp)
lw t6, 189(sp)
li t7, 31103510
or.T t6, t6, t7
sw t6, 54(sp)
add a3, a5, a3
lw t6, 189(sp)
li t7, 31103510
and.T t6, t6, t7, -13
sw t6, 36(sp)
lw t6, 96(sp)
li t7, 31103510
or.T t6, t6, t7
sw t6, 240(sp)
add a3, a4, a3
lw t6, 0(sp)
add a3, t6, a3
lw t6, 240(sp)
lw t7, 162(sp)
xor t6, t6, t7
sw t6, 138(sp)
lw t6, 12(sp)
add a3, t6, a3
lw t6, 189(sp)
lw t7, 96(sp)
xor t6, t6, t7
sw t6, 210(sp)
lw t6, 96(sp)
lw t7, 36(sp)
xor.1 t6, t6, t7
sw t6, 135(sp)
lw t6, 27(sp)
lw t7, 96(sp)
and.T a4, t6, t7, -13
lw t6, 189(sp)
lw t7, 96(sp)
or.T t6, t6, t7
sw t6, 237(sp)
lw t6, 204(sp)
li t7, 31103510
and.1 a5, t6, t7, 13
li t7, -71920623
mul t6, a5, t7
sw t6, 195(sp)
lw t6, 96(sp)
li t7, 31103510
xor.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 18(sp)
add a3, t6, a3
lw t6, 51(sp)
add a5, t6, a3
li t7, -172469166
mul t6, a4, t7
sw t6, 180(sp)
lw t6, 93(sp)
xor a3, t6, a5
lw t6, 198(sp)
xor a4, t6, a3
lw t6, 198(sp)
and.T t6, t6, a3, -13
sw t6, 174(sp)
li t7, -38723139
mul t6, a3, t7
sw t6, 12(sp)
xor t6, a3, a3
sw t6, 132(sp)
lw t6, 198(sp)
xor.T t6, t6, a3
sw t6, 126(sp)
lw t7, 198(sp)
or.1 t6, a3, t7
sw t6, 150(sp)
lw t7, 198(sp)
and.1 t6, a3, t7, 13
sw t6, 0(sp)
lw t6, 6(sp)
or t6, t6, a5, -13
sw t6, 9(sp)
lw t6, 9(sp)
lw t7, 198(sp)
xor.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 198(sp)
lw t7, 9(sp)
and.1 t6, t6, t7, 13
sw t6, 6(sp)
lw t6, 144(sp)
lw t7, 9(sp)
xor a5, t6, t7
lw t6, 9(sp)
lw t7, 198(sp)
xor t6, t6, t7
sw t6, 120(sp)
lw t6, 9(sp)
and.1 t6, t6, a3, 13
sw t6, 153(sp)
lw t6, 9(sp)
xor t0, t6, a4
lw t7, 9(sp)
xor.1 t6, a3, t7
sw t6, 18(sp)
lw t6, 120(sp)
lw t7, 126(sp)
or.1 a4, t6, t7
lw t6, 9(sp)
lw t7, 198(sp)
xor.T t6, t6, t7
sw t6, 123(sp)
lw t7, 9(sp)
or t6, a3, t7, -13
sw t6, 159(sp)
lw t7, 120(sp)
or.T a7, a3, t7
lw t6, 9(sp)
lw t7, 18(sp)
xor.T t1, t6, t7
lw t6, 120(sp)
lw t7, 9(sp)
xor.T a6, t6, t7
lw t6, 9(sp)
xor.1 t4, t6, t0
lw t6, 198(sp)
lw t7, 9(sp)
or.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 9(sp)
lw t7, 198(sp)
and.T t6, t6, t7, -13
sw t6, 168(sp)
lw t6, 153(sp)
xor t0, t6, t1
lw t6, 198(sp)
lw t7, 9(sp)
or.T t6, t6, t7
sw t6, 207(sp)
lw t6, 120(sp)
lw t7, 153(sp)
and.1 t2, t6, t7, 13
lw t6, 9(sp)
lw t7, 123(sp)
xor.T t1, t6, t7
li t7, 113430619
mul t3, t2, t7
li t7, 191493458
mul t0, t0, t7
lw t6, 6(sp)
lw t7, 174(sp)
xor t2, t6, t7
lw t6, 87(sp)
xor t4, t6, t4
li t7, 86775974
mul a4, a4, t7
lw t6, 9(sp)
and t6, t6, a3, 13
sw t6, 141(sp)
lw t6, 198(sp)
lw t7, 9(sp)
and t6, t6, t7, 13
sw t6, 117(sp)
lw t6, 198(sp)
xor.1 a5, t6, a5
li t7, 39431091
mul t5, a6, t7
lw t6, 9(sp)
xor.T t6, t6, a3
sw t6, 30(sp)
lw t6, 141(sp)
lw t7, 117(sp)
or.T a6, t6, t7
lw t7, 9(sp)
or.T t6, a3, t7
sw t6, 24(sp)
xor.T a7, t4, a7
lw t6, 168(sp)
lw t7, 24(sp)
and.1 t4, t6, t7, 13
li t7, 130081290
mul a7, a7, t7
li t7, -122645160
mul s0, a5, t7
lw t6, 144(sp)
li t7, 132683857
mul a5, t6, t7
add t5, s0, t5
add t3, a7, t3
lw t6, 6(sp)
or.1 a7, t6, t1
li t7, -14217198
mul a7, a7, t7
xor.T t2, t4, t2
add t1, t0, t3
lw t6, 9(sp)
lw t7, 198(sp)
or t6, t6, t7, -13
sw t6, 21(sp)
li t7, 185399009
mul t0, t2, t7
lw t6, 9(sp)
add t4, t6, t5
lw t6, 21(sp)
li t7, -22697604
mul t5, t6, t7
lw t6, 132(sp)
lw t7, 9(sp)
and.1 t2, t6, t7, 13
lw t7, 12(sp)
add s0, t0, t7
lw t6, 87(sp)
lw t7, 9(sp)
xor.1 t0, t6, t7
li t7, 134898398
mul t3, t2, t7
lw t7, 9(sp)
and.T t6, a3, t7, -13
sw t6, 60(sp)
lw t6, 87(sp)
lw t7, 60(sp)
and.T t2, t6, t7, -13
lw t6, 9(sp)
or.1 t6, t6, a3
sw t6, 192(sp)
lw t6, 9(sp)
li t7, 123708190
mul t6, t6, t7
sw t6, 39(sp)
lw t6, 192(sp)
li t7, 31915321
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 207(sp)
xor.T s2, t6, a6
add s1, a4, t4
lw t6, 141(sp)
lw t7, 21(sp)
or.1 a6, t6, t7
lw t6, 141(sp)
lw t7, 21(sp)
or.T t4, t6, t7
li t7, -145917973
mul a4, s2, t7
lw t6, 30(sp)
lw t7, 141(sp)
and.1 t6, t6, t7, 13
sw t6, 105(sp)
add t5, a4, t5
lw t6, 159(sp)
lw t7, 9(sp)
xor.1 a4, t6, t7
add t5, s0, t5
lw t6, 9(sp)
lw t7, 9(sp)
xor t6, t6, t7
sw t6, 243(sp)
add t5, s1, t5
add t1, t1, t5
add t6, a7, t1
sw t6, 84(sp)
lw t6, 105(sp)
li t7, -32789669
mul a7, t6, t7
add a5, a7, a5
add a5, t3, a5
lw t6, 18(sp)
li t7, -61181733
mul a7, t6, t7
lw t6, 30(sp)
lw t7, 21(sp)
xor.T t1, t6, t7
li t7, 66455638
mul t2, t2, t7
slli t6, t0, 1
sw t6, 12(sp)
and.T t1, t4, t1, -13
lw t6, 60(sp)
lw t7, 9(sp)
xor t0, t6, t7
lw t6, 174(sp)
lw t7, 141(sp)
and t4, t6, t7, 13
lw t7, 207(sp)
xor.T t3, t1, t7
li t7, 142815259
mul t1, t4, t7
lw t6, 87(sp)
lw t7, 9(sp)
xor.T t4, t6, t7
add a5, a5, t2
li t7, -19742536
mul t3, t3, t7
lw t6, 150(sp)
lw t7, 243(sp)
or.T t2, t6, t7
add t3, a5, t3
lw t6, 192(sp)
lw t7, 117(sp)
xor.T t5, t6, t7
lw t6, 168(sp)
li t7, -51378886
mul a5, t6, t7
or.T t4, t2, t4
or.1 a6, a3, a6
li t7, -147397322
mul t2, t5, t7
lw t6, 0(sp)
lw t7, 243(sp)
xor.T s0, t6, t7
li t7, -135844191
mul a6, a6, t7
li t7, 87490862
mul s1, t0, t7
lw t6, 141(sp)
or t4, t6, t4, -13
lw t6, 144(sp)
slli t5, t6, 7
lw t6, 129(sp)
lw t7, 9(sp)
or t0, t6, t7, -13
add a6, t3, a6
lw t7, 39(sp)
add s1, s1, t7
xor t3, a4, s0
lw t6, 9(sp)
xor t6, t6, a3
sw t6, 171(sp)
add a4, a7, s1
lw t6, 171(sp)
lw t7, 9(sp)
or.T s0, t6, t7
li t7, -130658758
mul s1, t3, t7
lw t6, 45(sp)
add t5, t6, t5
lw t6, 243(sp)
lw t7, 168(sp)
or t3, t6, t7, -13
lw t6, 87(sp)
lw t7, 60(sp)
xor.T s3, t6, t7
lw t6, 171(sp)
lw t7, 9(sp)
or.1 a7, t6, t7
li t7, 128395888
mul s0, s0, t7
lw t7, 171(sp)
and s2, t4, t7, 13
add s0, t1, s0
add s1, t2, s1
li t7, 66951297
mul t1, s3, t7
lw t6, 87(sp)
lw t7, 24(sp)
or t4, t6, t7, -13
lw t6, 207(sp)
lw t7, 174(sp)
xor t2, t6, t7
lw t6, 30(sp)
lw t7, 153(sp)
and.T t6, t6, t7, -13
sw t6, 51(sp)
lw t6, 60(sp)
lw t7, 168(sp)
or t6, t6, t7, -13
sw t6, 45(sp)
add s3, a4, t1
li t7, 158100112
mul a4, s2, t7
lw t6, 120(sp)
lw t7, 168(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 12(sp)
add s2, t6, a4
lw t6, 9(sp)
lw t7, 171(sp)
and t1, t6, t7, 13
lw t6, 192(sp)
li t7, -74629583
mul s4, t6, t7
add a5, s1, a5
lw t6, 153(sp)
li t7, -57183544
mul a4, t6, t7
lw t6, 159(sp)
slli t6, t6, 6
sw t6, 81(sp)
add t6, a5, s4
sw t6, 12(sp)
lw t6, 171(sp)
li t7, -164570170
mul a5, t6, t7
add t6, s0, a5
sw t6, 114(sp)
li t7, 114365916
mul t6, t0, t7
sw t6, 75(sp)
lw t6, 198(sp)
xor.1 s1, t6, a3
add a5, t5, s3
add a6, a6, a5
lw t6, 192(sp)
lw t7, 159(sp)
xor a5, t6, t7
xor.T t0, t3, a5
lw t6, 159(sp)
li t7, -120953435
mul a5, t6, t7
add a6, a6, s2
lw t6, 9(sp)
li t7, 81848444
mul t6, t6, t7
sw t6, 183(sp)
li t7, 87455651
mul t5, t0, t7
lw t6, 84(sp)
add t6, t6, a6
sw t6, 177(sp)
lw t6, 9(sp)
lw t7, 243(sp)
xor.1 a6, t6, t7
lw t6, 126(sp)
lw t7, 192(sp)
or.1 t3, t6, t7
xor s0, a7, t4
lw t6, 87(sp)
lw t7, 144(sp)
xor t0, t6, t7
lw t7, 120(sp)
and.T a7, t2, t7, -13
li t7, -119945575
mul t0, t0, t7
lw t6, 243(sp)
li t7, -62118035
mul s2, t6, t7
lw t6, 9(sp)
and.T t4, t6, t3, -13
lw t6, 9(sp)
lw t7, 174(sp)
or.1 t3, t6, t7
lw t6, 207(sp)
li t7, 36054439
mul t2, t6, t7
li t7, -52005660
mul s3, t4, t7
lw t6, 117(sp)
lw t7, 30(sp)
xor t4, t6, t7
lw t6, 174(sp)
xor t6, t6, s1
sw t6, 84(sp)
li t7, 144484065
mul t6, a7, t7
sw t6, 39(sp)
li t7, -32180291
mul s4, t1, t7
lw t7, 159(sp)
and.1 t1, a3, t7, 13
lw t6, 105(sp)
li t7, 184792095
mul s1, t6, t7
lw t6, 171(sp)
lw t7, 87(sp)
and.T a7, t6, t7, -13
li t7, -99842718
mul a6, a6, t7
lw t6, 0(sp)
and.T a7, t6, a7, -13
lw t6, 9(sp)
lw t7, 30(sp)
xor.T t6, t6, t7
sw t6, 105(sp)
lw t6, 105(sp)
lw t7, 0(sp)
xor.1 s5, t6, t7
add s3, t5, s3
add a4, s4, a4
lw t6, 51(sp)
and t5, t6, s5, 13
and.1 t5, t5, s0, 13
li t7, -107548593
mul s0, t5, t7
add s2, a4, s2
lw t6, 9(sp)
lw t7, 60(sp)
and t5, t6, t7, 13
lw t7, 81(sp)
add a4, s0, t7
lw t7, 75(sp)
add s0, s2, t7
lw t6, 87(sp)
lw t7, 9(sp)
or s2, t6, t7, -13
lw t6, 12(sp)
add s3, t6, s3
lw t6, 114(sp)
add t6, t6, s3
sw t6, 75(sp)
add a5, a5, s1
lw t7, 99(sp)
add a4, a4, t7
lw t7, 132(sp)
or.1 t4, t4, t7
lw t6, 84(sp)
li t7, -30138747
mul s3, t6, t7
li t7, -183979705
mul s1, s2, t7
li t7, -28633150
mul t3, t3, t7
add t0, t0, a5
li t7, -51970656
mul t6, t1, t7
sw t6, 51(sp)
add t1, s3, t2
lw t6, 84(sp)
lw t7, 30(sp)
and a5, t6, t7, 13
lw t6, 24(sp)
li t7, -138752603
mul t2, t6, t7
add t0, t0, t1
lw t7, 231(sp)
or t4, t4, t7, -13
add t1, s0, t0
add t3, s1, t3
lw t6, 243(sp)
lw t7, 120(sp)
or t0, t6, t7, -13
li t7, 42077185
mul t6, t4, t7
sw t6, 81(sp)
lw t7, 183(sp)
add t3, t3, t7
lw t7, 45(sp)
or.1 t4, t5, t7
lw t7, 39(sp)
add s0, t3, t7
lw t6, 18(sp)
lw t7, 192(sp)
or t5, t6, t7, -13
lw t6, 9(sp)
li t7, -171224747
mul t6, t6, t7
sw t6, 12(sp)
lw t6, 171(sp)
lw t7, 144(sp)
or t3, t6, t7, -13
add t1, t1, a6
li t7, -37650451
mul a6, a7, t7
lw t7, 9(sp)
or a5, a5, t7, -13
add a7, t1, s0
li t7, -104245467
mul t1, a5, t7
add t6, a4, a7
sw t6, 39(sp)
lw t6, 117(sp)
lw t7, 198(sp)
and.T a5, t6, t7, -13
li t7, 104027236
mul a7, t4, t7
lw t6, 159(sp)
lw t7, 84(sp)
xor.T a4, t6, t7
lw t6, 243(sp)
lw t7, 123(sp)
and.T t4, t6, t7, -13
li t7, -115215685
mul a5, a5, t7
add t6, t2, a7
sw t6, 114(sp)
lw t6, 24(sp)
lw t7, 243(sp)
and.1 a7, t6, t7, 13
lw t6, 84(sp)
lw t7, 153(sp)
xor.T t2, t6, t7
li t7, 164511940
mul t6, t5, t7
sw t6, 99(sp)
lw t6, 60(sp)
or t5, t6, a3, -13
and.T s1, t5, a4, -13
li t7, -169671164
mul a4, t0, t7
lw t6, 9(sp)
lw t7, 141(sp)
xor t5, t6, t7
lw t6, 6(sp)
lw t7, 66(sp)
and.T s2, t6, t7, -13
or t3, a7, t3, -13
lw t6, 21(sp)
lw t7, 24(sp)
and.1 a7, t6, t7, 13
lw t6, 231(sp)
lw t7, 207(sp)
or t0, t6, t7, -13
lw t6, 144(sp)
lw t7, 141(sp)
and s0, t6, t7, 13
li t7, -53853849
mul t6, a3, t7
sw t6, 45(sp)
lw t7, 153(sp)
or.T t5, t5, t7
li t7, -21096778
mul t5, t5, t7
add a6, a6, t5
or t4, t4, t2, -13
add t2, a6, t1
lw t6, 18(sp)
li t7, -160784415
mul t5, t6, t7
lw t7, 9(sp)
or.1 a6, s1, t7
lw t6, 168(sp)
xor t1, t6, s2
li t7, -34177812
mul s1, t1, t7
lw t6, 126(sp)
lw t7, 9(sp)
or.T t6, t6, t7
sw t6, 66(sp)
lw t6, 24(sp)
lw t7, 6(sp)
xor.1 t1, t6, t7
lw t6, 141(sp)
lw t7, 87(sp)
and s2, t6, t7, 13
or.T t3, t3, a6
lw t6, 144(sp)
lw t7, 24(sp)
or.1 s3, t6, t7
add a5, s1, a5
lw t6, 18(sp)
and s4, t6, s0, 13
lw t6, 198(sp)
lw t7, 30(sp)
or.1 a6, t6, t7
li t7, -186765332
mul t3, t3, t7
li t7, -84387915
mul t1, t1, t7
xor.T t4, t4, s3
lw t6, 144(sp)
li t7, 9547564
mul s0, t6, t7
lw t6, 9(sp)
lw t7, 21(sp)
and.1 s1, t6, t7, 13
and.1 t4, t4, a3, 13
li t7, 13947076
mul s3, t4, t7
and.1 s4, s4, t0, 13
lw t6, 9(sp)
lw t7, 30(sp)
xor.1 t0, t6, t7
li t7, 21575542
mul t4, a7, t7
add t5, t5, a4
lw t6, 12(sp)
add t2, t6, t2
lw t6, 198(sp)
or a4, t6, a3, -13
lw t6, 87(sp)
lw t7, 21(sp)
xor a7, t6, t7
lw t6, 81(sp)
add a3, t6, t2
li t7, 107601682
mul t2, s2, t7
lw t6, 21(sp)
lw t7, 231(sp)
and s2, t6, t7, 13
lw t7, 114(sp)
add a3, a3, t7
li t7, 592354
mul s4, s4, t7
lw t6, 9(sp)
lw t7, 174(sp)
or t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 0(sp)
li t7, 137833812
mul t6, t6, t7
sw t6, 12(sp)
lw t7, 99(sp)
add s5, t5, t7
lw t6, 45(sp)
add t5, t6, s4
add t3, t3, s5
add t3, t3, s3
add s3, t5, s0
xor.1 t5, s1, s2
lw t7, 168(sp)
xor s0, a4, t7
add t2, t1, t2
and.T t5, t5, a4, -13
add a5, a5, s3
li t7, -177854685
mul a4, a6, t7
add a5, a5, t4
li t7, 69435407
mul t1, s0, t7
add a5, a5, t2
add t2, t3, a5
li t7, 16477247
mul a5, t5, t7
lw t6, 159(sp)
lw t7, 171(sp)
or t6, t6, t7, -13
sw t6, 0(sp)
lw t6, 117(sp)
or.1 a6, t6, t0
lw t6, 9(sp)
li t7, -123284184
mul t0, t6, t7
lw t7, 207(sp)
and t3, a7, t7, 13
lw t6, 105(sp)
li t7, -170882015
mul a7, t6, t7
lw t6, 129(sp)
lw t7, 207(sp)
xor t4, t6, t7
li t7, 80306212
mul a6, a6, t7
lw t7, 168(sp)
and.T t4, t4, t7, -13
lw t6, 87(sp)
lw t7, 66(sp)
or t5, t6, t7, -13
add t2, t2, t1
lw t6, 24(sp)
li t7, 170935074
mul t1, t6, t7
lw t6, 120(sp)
or.1 s0, t6, t4
add a3, a3, t2
lw t6, 144(sp)
lw t7, 30(sp)
and.T s1, t6, t7, -13
lw t6, 174(sp)
lw t7, 21(sp)
and.1 t4, t6, t7, 13
lw t6, 51(sp)
add t2, t6, a3
li t7, 120834075
mul s2, t3, t7
li t7, -109916919
mul t3, t5, t7
lw t6, 84(sp)
lw t7, 171(sp)
and a3, t6, t7, 13
lw t7, 90(sp)
add t5, s2, t7
li t7, -114812071
mul s0, s0, t7
add s0, t0, s0
lw t7, 231(sp)
and t0, s1, t7, 13
add a7, t5, a7
add t5, a4, s0
lw t7, 150(sp)
xor a4, t4, t7
lw t6, 231(sp)
lw t7, 21(sp)
or t4, t6, t7, -13
add t5, a5, t5
add a5, a7, t1
li t7, 65601808
mul a7, t4, t7
add t3, t5, t3
lw t6, 9(sp)
or t1, t6, a4, -13
lw t6, 39(sp)
add a4, t6, t2
lw t6, 75(sp)
add a4, t6, a4
add t2, a6, t3
lw t6, 177(sp)
add t6, t6, a4
sw t6, 21(sp)
lw t7, 18(sp)
and t3, t0, t7, 13
lw t6, 120(sp)
li t7, 146749786
mul a4, t6, t7
li t7, 40870657
mul a6, t1, t7
add a7, a5, a7
lw t6, 6(sp)
lw t7, 0(sp)
xor a5, t6, t7
add t6, t2, a7
sw t6, 6(sp)
lw t6, 123(sp)
li t7, 78134885
mul t0, t6, t7
lw t7, 60(sp)
and.1 t1, t3, t7, 13
lw t6, 189(sp)
li t7, 31103510
and t6, t6, t7, 13
sw t6, 81(sp)
li t7, 129741981
mul a3, a3, t7
lw t6, 171(sp)
lw t7, 30(sp)
or.1 a7, t6, t7
li t7, 161750841
mul t2, a7, t7
lw t6, 150(sp)
li t7, 65040504
mul a7, t6, t7
add a6, a6, a3
li t7, 139881434
mul t3, t1, t7
add a3, t0, t2
lw t6, 186(sp)
lw t7, 156(sp)
or t1, t6, t7, -13
add a6, a6, t3
lw t6, 81(sp)
lw t7, 135(sp)
or t0, t6, t7, -13
lw t6, 87(sp)
lw t7, 120(sp)
or.T t2, t6, t7
lw t7, 192(sp)
and.T t2, t2, t7, -13
lw t6, 189(sp)
lw t7, 96(sp)
or t6, t6, t7, -13
sw t6, 45(sp)
lw t6, 96(sp)
li t7, 31103510
xor t6, t6, t7
sw t6, 192(sp)
li t7, -20753205
mul t2, t2, t7
lw t6, 189(sp)
xor t1, t6, t1
add a4, a4, t2
lw t6, 84(sp)
or.T a5, t6, a5
lw t6, 96(sp)
li t7, -169903614
mul t6, t6, t7
sw t6, 66(sp)
lw t7, 3(sp)
add a4, a4, t7
li t7, -65225675
mul t2, a5, t7
lw t6, 138(sp)
and.1 a5, t6, t0, 13
add a7, t2, a7
lw t6, 96(sp)
li t7, 31103510
and.T t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 189(sp)
li t7, 31103510
xor.T t6, t6, t7
sw t6, 129(sp)
lw t6, 81(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 0(sp)
lw t6, 96(sp)
lw t7, 189(sp)
and.1 t6, t6, t7, 13
sw t6, 150(sp)
li t7, 42791463
mul t6, t1, t7
sw t6, 198(sp)
lw t6, 12(sp)
add a7, t6, a7
lw t6, 189(sp)
li t7, 31103510
and.1 t6, t6, t7, 13
sw t6, 24(sp)
add a6, a6, a7
add a3, a3, a4
li t7, -54937725
mul t6, a5, t7
sw t6, 18(sp)
lw t6, 96(sp)
li t7, 31103510
or.1 t6, t6, t7
sw t6, 153(sp)
lw t6, 153(sp)
lw t7, 96(sp)
and t6, t6, t7, 13
sw t6, 135(sp)
lw t6, 189(sp)
li t7, 31103510
or.1 t6, t6, t7
sw t6, 234(sp)
lw t6, 24(sp)
li t7, -44404665
mul t6, t6, t7
sw t6, 246(sp)
lw t6, 189(sp)
lw t7, 96(sp)
xor.1 t6, t6, t7
sw t6, 114(sp)
lw t6, 6(sp)
add a4, t6, a6
add a3, a4, a3
lw t6, 111(sp)
lw t7, 114(sp)
or.T t6, t6, t7
sw t6, 3(sp)
lw t6, 108(sp)
lw t7, 189(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t6, 21(sp)
add a4, t6, a3
lw t6, 162(sp)
li t7, 152712693
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 33(sp)
xor a3, t6, a4
lw t6, 48(sp)
xor t6, t6, a4
sw t6, 144(sp)
lw t7, 96(sp)
xor.T t6, a3, t7
sw t6, 33(sp)
lw t7, 189(sp)
xor t6, a4, t7
sw t6, 207(sp)
lw t7, 189(sp)
or t6, a3, t7, -13
sw t6, 141(sp)
lw t7, 189(sp)
xor t6, a3, t7
sw t6, 90(sp)
lw t6, 189(sp)
and t6, t6, a3, 13
sw t6, 174(sp)
lw t7, 96(sp)
xor t6, a3, t7
sw t6, 117(sp)
lw t7, 189(sp)
and.T t6, a3, t7, -13
sw t6, 159(sp)
lw t7, 189(sp)
or.1 t6, a3, t7
sw t6, 75(sp)
lw t7, 189(sp)
xor.1 t6, a3, t7
sw t6, 171(sp)
lw t7, 189(sp)
xor.T t6, a3, t7
sw t6, 255(sp)
lw t6, 96(sp)
or.T t6, t6, a3
sw t6, 120(sp)
li t7, 31103510
and t6, a3, t7, 13
sw t6, 123(sp)
li t7, 31103510
xor.1 t6, a3, t7
sw t6, 87(sp)
lw t6, 141(sp)
lw t7, 255(sp)
or.T t6, t6, t7
sw t6, 51(sp)
lw t7, 189(sp)
and.1 t6, a3, t7, 13
sw t6, 252(sp)
li t7, 31103510
xor.T a5, a3, t7
lw t6, 54(sp)
lw t7, 123(sp)
xor.1 a6, t6, t7
li t7, 31103510
xor t6, a3, t7
sw t6, 219(sp)
li t7, 31103510
or.T t6, a3, t7
sw t6, 183(sp)
lw t7, 96(sp)
xor.1 a4, a3, t7
lw t6, 96(sp)
or t6, t6, a3, -13
sw t6, 126(sp)
lw t6, 126(sp)
li t7, -147464514
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 51(sp)
li t7, 31103510
and.T a7, t6, t7, -13
lw t6, 174(sp)
and a5, t6, a5, 13
lw t6, 174(sp)
lw t7, 162(sp)
or.T t6, t6, t7
sw t6, 105(sp)
lw t7, 45(sp)
xor.1 t6, a3, t7
sw t6, 12(sp)
lw t6, 174(sp)
lw t7, 87(sp)
and.T t2, t6, t7, -13
lw t6, 33(sp)
lw t7, 174(sp)
and.1 t6, t6, t7, 13
sw t6, 60(sp)
lw t6, 183(sp)
and.1 t0, t6, a5, 13
lw t6, 111(sp)
and.T a5, t6, a4, -13
li t7, 109620843
mul a7, a7, t7
xor t6, a3, a3
sw t6, 48(sp)
li t7, -114430377
mul a5, a5, t7
lw t6, 147(sp)
lw t7, 219(sp)
and t6, t6, t7, 13
sw t6, 99(sp)
lw t6, 219(sp)
lw t7, 108(sp)
xor t1, t6, t7
lw t6, 174(sp)
lw t7, 111(sp)
or.1 t5, t6, t7
lw t7, 18(sp)
add t3, a5, t7
li t7, 102207397
mul t6, t1, t7
sw t6, 177(sp)
lw t6, 120(sp)
slli a5, t6, 8
li t7, 134705247
mul t0, t0, t7
lw t6, 255(sp)
lw t7, 123(sp)
and t1, t6, t7, 13
lw t6, 183(sp)
lw t7, 210(sp)
and.T t4, t6, t7, -13
lw t6, 153(sp)
lw t7, 234(sp)
xor t6, t6, t7
sw t6, 225(sp)
lw t6, 96(sp)
and t6, t6, a3, 13
sw t6, 216(sp)
li t7, -189622329
mul t2, t2, t7
lw t6, 186(sp)
or t6, t6, t5, -13
sw t6, 18(sp)
lw t6, 114(sp)
lw t7, 90(sp)
or t5, t6, t7, -13
lw t6, 147(sp)
lw t7, 174(sp)
and.T s0, t6, t7, -13
lw t7, 96(sp)
and.1 t6, a3, t7, 13
sw t6, 168(sp)
or a6, a6, s0, -13
li t7, 31103510
or.1 t6, a3, t7
sw t6, 132(sp)
lw t6, 51(sp)
and.T s0, t6, t5, -13
lw t7, 51(sp)
xor t5, t4, t7
lw t6, 195(sp)
add t2, t6, t2
add t3, t3, t2
lw t6, 0(sp)
lw t7, 117(sp)
or.1 t4, t6, t7
li t7, 125044185
mul a6, a6, t7
lw t7, 24(sp)
and.T t2, t5, t7, -13
li t7, 37945275
mul s1, t2, t7
li t7, -142243668
mul t2, t1, t7
lw t6, 192(sp)
lw t7, 33(sp)
and.T s2, t6, t7, -13
add t3, t3, a7
lw t6, 219(sp)
lw t7, 156(sp)
xor.1 t5, t6, t7
lw t6, 120(sp)
lw t7, 81(sp)
xor.T t1, t6, t7
li t7, -13580146
add a7, s1, t7
li t7, -148711473
mul s0, s0, t7
slli s2, s2, 3
lw t6, 21(sp)
add s1, t6, t0
lw t7, 66(sp)
add s2, s2, t7
lw t6, 96(sp)
li t7, 31103510
xor.T t6, t6, t7
sw t6, 0(sp)
li t7, 31103510
and.T t6, a3, t7, -13
sw t6, 213(sp)
lw t6, 129(sp)
lw t7, 213(sp)
and.1 t6, t6, t7, 13
sw t6, 21(sp)
lw t7, 168(sp)
or.1 t6, a4, t7
sw t6, 138(sp)
lw t6, 60(sp)
or.1 t0, t6, t4
li t7, 31103510
and.1 t4, a4, t7, 13
lw t6, 96(sp)
lw t7, 189(sp)
or.1 t6, t6, t7
sw t6, 84(sp)
add a4, s1, s0
add a5, a5, s2
li t7, 60234924
mul t6, t5, t7
sw t6, 60(sp)
lw t6, 132(sp)
lw t7, 45(sp)
xor t5, t6, t7
lw t7, 198(sp)
add t2, t2, t7
add t3, t3, t2
li t7, -191835794
mul t6, t5, t7
sw t6, 66(sp)
lw t6, 150(sp)
lw t7, 105(sp)
xor t2, t6, t7
lw t6, 0(sp)
li t7, 116411087
mul t6, t6, t7
sw t6, 195(sp)
li t7, -76690674
mul t5, t0, t7
li t7, 31103510
or t0, a3, t7, -13
lw t6, 219(sp)
lw t7, 75(sp)
and.1 t6, t6, t7, 13
sw t6, 198(sp)
and.T t4, t4, t1, -13
add t1, t5, a6
lw t6, 51(sp)
lw t7, 234(sp)
xor.T a6, t6, t7
lw t6, 225(sp)
lw t7, 216(sp)
and s0, t6, t7, 13
lw t6, 237(sp)
lw t7, 159(sp)
xor.T t6, t6, t7
sw t6, 105(sp)
lw t6, 99(sp)
lw t7, 12(sp)
xor t5, t6, t7
lw t7, 96(sp)
and.T t6, a3, t7, -13
sw t6, 225(sp)
lw t6, 171(sp)
lw t7, 36(sp)
and.T t6, t6, t7, -13
sw t6, 99(sp)
li t7, -121318104
mul t5, t5, t7
add t5, a7, t5
add t6, t3, a4
sw t6, 228(sp)
lw t6, 132(sp)
lw t7, 138(sp)
and.1 a4, t6, t7, 13
lw t7, 18(sp)
xor.1 s0, s0, t7
lw t6, 135(sp)
lw t7, 138(sp)
xor.1 t3, t6, t7
lw t6, 84(sp)
lw t7, 141(sp)
and.1 a7, t6, t7, 13
lw t6, 132(sp)
and.T s1, t6, a6, -13
li t7, 69252558
mul a6, t4, t7
lw t7, 132(sp)
xor t4, a4, t7
li t7, -22070565
mul t6, t3, t7
sw t6, 18(sp)
li t7, -164877279
mul a4, s1, t7
lw t6, 177(sp)
add t3, t6, t5
add a5, t3, a5
lw t7, 147(sp)
and.1 t4, t4, t7, 13
lw t6, 117(sp)
and t5, t6, t0, 13
lw t6, 234(sp)
and.1 t3, t6, t2, 13
lw t6, 36(sp)
li t7, -190571045
mul t6, t6, t7
sw t6, 147(sp)
lw t6, 246(sp)
add t2, t6, a6
lw t7, 21(sp)
and.T a6, t4, t7, -13
lw t7, 27(sp)
and.1 t0, t0, t7, 13
lw t6, 24(sp)
lw t7, 36(sp)
xor t4, t6, t7
li t7, -69931806
mul t6, s0, t7
sw t6, 171(sp)
add a5, t1, a5
lw t6, 156(sp)
xor t1, t6, t0
lw t6, 138(sp)
lw t7, 45(sp)
xor.1 s0, t6, t7
add a5, a5, t2
lw t6, 138(sp)
lw t7, 45(sp)
and.T t6, t6, t7, -13
sw t6, 21(sp)
lw t6, 225(sp)
li t7, 60793320
mul t6, t6, t7
sw t6, 177(sp)
lw t6, 210(sp)
lw t7, 252(sp)
and t2, t6, t7, 13
lw t6, 111(sp)
lw t7, 210(sp)
or s1, t6, t7, -13
lw t6, 252(sp)
lw t7, 189(sp)
or t0, t6, t7, -13
lw t6, 198(sp)
and.1 s0, t6, s0, 13
lw t6, 3(sp)
xor t1, t6, t1
lw t6, 84(sp)
li t7, 100477692
mul t6, t6, t7
sw t6, 12(sp)
li t7, -21582348
mul s2, t1, t7
xor t1, t5, a7
lw t6, 33(sp)
xor t5, t6, s1
li t7, -164835174
mul a7, t3, t7
lw t7, 240(sp)
or.1 t5, t5, t7
lw t6, 123(sp)
lw t7, 252(sp)
and t6, t6, t7, 13
sw t6, 198(sp)
lw t6, 123(sp)
lw t7, 189(sp)
and t6, t6, t7, 13
sw t6, 135(sp)
lw t6, 195(sp)
add t3, t6, s2
lw t6, 39(sp)
or t4, t6, t4, -13
li t7, -151584159
mul t6, t5, t7
sw t6, 39(sp)
lw t6, 138(sp)
lw t7, 111(sp)
or t5, t6, t7, -13
add a4, a4, a7
lw t6, 60(sp)
add a7, t6, a4
li t7, 81501054
mul t6, t4, t7
sw t6, 60(sp)
lw t7, 213(sp)
or.1 a4, t5, t7
lw t6, 66(sp)
add t3, t6, t3
li t7, 136279542
mul a6, a6, t7
lw t6, 18(sp)
add t3, t6, t3
xor t2, t2, s0
lw t6, 180(sp)
add t3, t6, t3
li t7, -17515683
mul t2, t2, t7
li t7, -133654344
mul t4, a4, t7
lw t6, 186(sp)
lw t7, 156(sp)
and.1 t6, t6, t7, 13
sw t6, 18(sp)
lw t6, 99(sp)
lw t7, 105(sp)
or t5, t6, t7, -13
lw t6, 189(sp)
li t7, -56887489
mul a4, t6, t7
lw t7, 6(sp)
add t6, t4, t7
sw t6, 3(sp)
or t0, t1, t0, -13
li t7, -152560188
mul t0, t0, t7
add t1, a5, t3
lw t6, 213(sp)
li t7, -96669273
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 108(sp)
li t7, -39965562
mul t3, t6, t7
lw t6, 36(sp)
li t7, 59499398
mul t4, t6, t7
lw t6, 150(sp)
li t7, 31103510
or a5, t6, t7, -13
li t7, 98361147
add s0, t4, t7
add t0, t0, t2
lw t6, 120(sp)
lw t7, 96(sp)
or.1 t2, t6, t7
lw t6, 138(sp)
and.T a5, t6, a5, -13
lw t7, 153(sp)
and t4, a5, t7, 13
lw t6, 21(sp)
or.1 a5, t6, t2
li t7, 108608361
mul t4, t4, t7
lw t6, 108(sp)
lw t7, 117(sp)
and.1 t2, t6, t7, 13
lw t6, 171(sp)
add t0, t6, t0
lw t6, 189(sp)
li t7, 31103510
or t6, t6, t7, -13
sw t6, 66(sp)
add a6, a7, a6
add s3, a6, t0
lw t6, 66(sp)
lw t7, 210(sp)
xor.T s2, t6, t7
lw t6, 168(sp)
li t7, 145311828
mul s1, t6, t7
li t7, 41921223
mul a6, t5, t7
lw t7, 66(sp)
xor t0, a3, t7
li t7, 46451088
mul a7, a5, t7
lw t6, 213(sp)
lw t7, 189(sp)
or.1 t5, t6, t7
lw t6, 84(sp)
lw t7, 174(sp)
or.1 a5, t6, t7
li t7, 11474145
mul s2, s2, t7
lw t6, 147(sp)
lw t7, 60(sp)
add s4, t6, t7
add t1, t1, s3
li t7, 79373769
mul t5, t5, t7
add t3, t3, s0
lw t6, 198(sp)
li t7, 40440813
mul t6, t6, t7
sw t6, 6(sp)
add t5, s1, t5
lw t7, 39(sp)
add s1, s4, t7
lw t6, 189(sp)
and s0, t6, t0, 13
xor s0, s0, a3
lw t6, 228(sp)
add t6, t6, t1
sw t6, 21(sp)
add t1, s2, a4
li t7, 148076469
mul s0, s0, t7
add s1, s1, t4
lw t7, 12(sp)
add a7, a7, t7
lw t6, 75(sp)
lw t7, 162(sp)
and.1 t6, t6, t7, 13
sw t6, 60(sp)
slli a4, t2, 8
lw t6, 96(sp)
lw t7, 18(sp)
xor.1 t4, t6, t7
lw t6, 3(sp)
add t2, t6, s1
lw t6, 36(sp)
and.1 t6, t6, a3, 13
sw t6, 12(sp)
lw t6, 186(sp)
lw t7, 174(sp)
xor.1 s4, t6, t7
lw t6, 114(sp)
lw t7, 213(sp)
and.T s1, t6, t7, -13
lw t6, 204(sp)
li t7, 31103510
or.1 s2, t6, t7
lw t6, 66(sp)
lw t7, 123(sp)
xor.1 s3, t6, t7
lw t6, 135(sp)
xor.T s4, t6, s4
add t3, t3, t5
lw t6, 141(sp)
lw t7, 216(sp)
xor.1 t6, t6, t7
sw t6, 39(sp)
lw t7, 87(sp)
or t5, t0, t7, -13
lw t6, 168(sp)
lw t7, 81(sp)
and t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 255(sp)
lw t7, 117(sp)
xor.1 t0, t6, t7
lw t7, 225(sp)
or.T s5, t0, t7
add a6, s0, a6
lw t6, 66(sp)
lw t7, 150(sp)
xor t0, t6, t7
lw t7, 177(sp)
add a6, a6, t7
lw t6, 210(sp)
lw t7, 87(sp)
and.1 s0, t6, t7, 13
lw t6, 129(sp)
lw t7, 219(sp)
xor.1 s7, t6, t7
lw t6, 120(sp)
or s6, t6, s0, -13
and.1 s0, s1, s2, 13
xor.T a5, a5, s3
xor s2, s4, s7
add a6, t1, a6
xor.T s1, t4, s6
li t7, -116121705
mul t4, s5, t7
add t1, t2, a6
li t7, 83530284
mul a6, s2, t7
and.1 s0, t5, s0, 13
li t7, -103098918
mul t2, a5, t7
lw t6, 126(sp)
lw t7, 204(sp)
or.T t5, t6, t7
slli s2, s0, 7
lw t6, 96(sp)
li t7, 169307238
mul a5, t6, t7
add a7, a7, t3
lw t6, 6(sp)
add s0, t6, a7
li t7, 186637506
mul a7, s1, t7
add a7, a7, a4
add a4, t2, s2
lw t6, 45(sp)
add t3, t6, a7
lw t6, 132(sp)
lw t7, 234(sp)
and.1 a7, t6, t7, 13
li t7, -9882160
add t2, t4, t7
lw t6, 186(sp)
lw t7, 183(sp)
or.1 s2, t6, t7
lw t6, 192(sp)
li t7, -138928324
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 153(sp)
lw t7, 138(sp)
or.1 t4, t6, t7
add a4, t3, a4
lw t7, 0(sp)
xor.1 s1, t0, t7
lw t6, 150(sp)
li t7, -31103510
and.T t3, t6, t7, -13
li t7, 133470510
mul s3, t4, t7
lw t7, 66(sp)
and.T t0, a3, t7, -13
lw t6, 39(sp)
li t7, 67514247
mul t4, t6, t7
xor.T t3, t3, t5
li t7, -35471544
mul t3, t3, t7
add a4, s0, a4
add a4, t1, a4
lw t6, 21(sp)
add t1, t6, a4
lw t6, 3(sp)
li t7, -150707466
mul t5, t6, t7
lw t6, 183(sp)
li t7, 31103510
and.T a4, t6, t7, -13
li t7, 129279690
mul s0, s2, t7
lw t6, 141(sp)
lw t7, 189(sp)
xor.T s2, t6, t7
lw t6, 0(sp)
lw t7, 60(sp)
and.1 s4, t6, t7, 13
li t7, -173570766
mul s4, s4, t7
add a6, a6, s3
add a6, t2, a6
li t7, -190393176
mul s1, s1, t7
li t7, 95256015
mul s2, s2, t7
lw t6, 30(sp)
li t7, -158837344
mul t2, t6, t7
add t5, t5, s4
add s0, s2, s0
add s1, s1, s0
add t6, t1, a6
sw t6, 3(sp)
add a5, t4, a5
lw t6, 132(sp)
lw t7, 240(sp)
xor.1 t1, t6, t7
lw t6, 33(sp)
li t7, 182173461
mul a6, t6, t7
li t7, -85716312
mul t4, a7, t7
lw t6, 87(sp)
or s4, t6, t1, -13
add s2, t3, a5
li t7, 16612491
mul a5, t0, t7
lw t6, 96(sp)
lw t7, 219(sp)
and t6, t6, t7, 13
sw t6, 21(sp)
lw t6, 204(sp)
xor t0, t6, a3
lw t6, 57(sp)
li t7, 136195479
mul a7, t6, t7
lw t6, 96(sp)
lw t7, 66(sp)
or s0, t6, t7, -13
li t7, 54906477
mul s3, t0, t7
lw t6, 12(sp)
li t7, 165453018
mul t0, t6, t7
lw t6, 24(sp)
lw t7, 126(sp)
and.T t1, t6, t7, -13
li t7, -153160164
mul s4, s4, t7
lw t6, 255(sp)
xor t3, t6, a3
lw t6, 6(sp)
add a3, t6, s1
lw t6, 48(sp)
li t7, 31103510
and.T s1, t6, t7, -13
add a3, a3, t5
li t7, -30790839
mul t5, s1, t7
add t5, t5, t2
add t2, s2, a3
lw t6, 189(sp)
lw t7, 174(sp)
or.T a3, t6, t7
add t5, s3, t5
lw t6, 90(sp)
lw t7, 33(sp)
and s1, t6, t7, 13
add s2, t5, s4
lw t7, 27(sp)
xor.1 s1, s1, t7
add t4, t4, t0
lw t6, 54(sp)
lw t7, 150(sp)
and.T s3, t6, t7, -13
li t7, -74448351
mul t0, a3, t7
lw t7, 75(sp)
or t5, s0, t7, -13
or.T a3, a4, s3
xor.T a3, a4, a3
li t7, -86167386
mul a4, a3, t7
lw t6, 33(sp)
lw t7, 153(sp)
and.1 s0, t6, t7, 13
lw t6, 51(sp)
lw t7, 87(sp)
xor.T s3, t6, t7
lw t6, 192(sp)
lw t7, 132(sp)
or.T a3, t6, t7
add s2, s2, a4
lw t6, 96(sp)
xor s0, t6, s0
and.1 a4, s1, s3, 13
add s1, s2, a6
and.T s0, s0, t1, -13
lw t7, 255(sp)
xor a6, t3, t7
add t1, t4, s1
li t7, -27009927
mul t3, t5, t7
lw t6, 156(sp)
xor.T t4, t6, s0
add a5, a5, t3
add a7, a5, a7
li t7, -179155575
mul t3, a4, t7
add t1, t2, t1
lw t6, 18(sp)
li t7, 31103510
xor a5, t6, t7
li t7, 57330891
mul t2, a6, t7
lw t6, 132(sp)
lw t7, 183(sp)
xor.1 a4, t6, t7
li t7, -20766801
mul t5, t4, t7
lw t6, 96(sp)
li t7, 123382585
mul a6, t6, t7
lw t6, 189(sp)
lw t7, 234(sp)
or t4, t6, t7, -13
lw t6, 30(sp)
li t7, 102551764
mul t6, t6, t7
sw t6, 6(sp)
lw t6, 0(sp)
lw t7, 174(sp)
and s0, t6, t7, 13
li t7, -105251001
mul t4, t4, t7
add t3, t3, t5
lw t6, 111(sp)
li t7, -116686193
mul t6, t6, t7
sw t6, 0(sp)
lw t7, 21(sp)
xor.T t5, s0, t7
add t2, t3, t2
add t3, t0, t2
li t7, 53441064
mul t2, t5, t7
lw t6, 237(sp)
and a4, t6, a4, 13
lw t6, 141(sp)
li t7, 14750793
mul t0, t6, t7
li t7, -114955536
mul a4, a4, t7
lw t6, 90(sp)
lw t7, 234(sp)
and.T t5, t6, t7, -13
add t4, t4, t2
lw t6, 96(sp)
lw t7, 33(sp)
and.1 t2, t6, t7, 13
add t3, t3, t4
add t3, a7, t3
lw t6, 114(sp)
lw t7, 129(sp)
xor a7, t6, t7
add t6, t1, t3
sw t6, 27(sp)
or.1 t3, a3, t5
lw t6, 258(sp)
lw t7, 189(sp)
and.T t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 231(sp)
lw t7, 255(sp)
or a3, t6, t7, -13
lw t6, 159(sp)
or a3, t6, a3, -13
li t7, 181799994
mul t1, a5, t7
li t7, -167319870
mul t2, t2, t7
and.1 a5, t3, a7, 13
add a6, t2, a6
add a7, t0, a6
lw t6, 207(sp)
lw t7, 207(sp)
xor t6, t6, t7
sw t6, 87(sp)
lw t6, 36(sp)
lw t7, 216(sp)
and a6, t6, t7, 13
lw t6, 189(sp)
li t7, 167516518
and.T t6, t6, t7, -13
sw t6, 117(sp)
add t6, t1, a7
sw t6, 18(sp)
lw t6, 237(sp)
lw t7, 48(sp)
and.1 a7, t6, t7, 13
lw t6, 240(sp)
lw t7, 24(sp)
xor.T t2, t6, t7
lw t6, 132(sp)
li t7, -190888366
mul t0, t6, t7
lw t7, 66(sp)
or t1, a7, t7, -13
lw t6, 114(sp)
or.1 a7, t6, t2
li t7, 137258736
mul a5, a5, t7
li t7, -177076032
mul a7, a7, t7
li t7, 42896868
mul t2, a3, t7
lw t6, 258(sp)
li t7, 167516518
or.1 t6, t6, t7
sw t6, 90(sp)
lw t6, 36(sp)
lw t7, 150(sp)
xor a3, t6, t7
lw t6, 189(sp)
li t7, 167516518
or t6, t6, t7, -13
sw t6, 111(sp)
lw t6, 189(sp)
li t7, 167516518
or.T t6, t6, t7
sw t6, 36(sp)
lw t6, 12(sp)
li t7, -127325520
mul t6, t6, t7
sw t6, 57(sp)
lw t6, 0(sp)
add t3, t6, a5
li t7, -20458068
mul a5, a3, t7
lw t6, 12(sp)
lw t7, 36(sp)
or.1 t6, t6, t7
sw t6, 33(sp)
add t6, a4, t3
sw t6, 0(sp)
lw t6, 258(sp)
lw t7, 189(sp)
or.T t6, t6, t7
sw t6, 153(sp)
lw t6, 258(sp)
lw t7, 189(sp)
or a3, t6, t7, -13
lw t6, 189(sp)
lw t7, 258(sp)
and t6, t6, t7, 13
sw t6, 54(sp)
lw t6, 189(sp)
li t7, 167516518
xor.T t6, t6, t7
sw t6, 66(sp)
add t0, t2, t0
li t7, 31103510
xor.1 a4, t1, t7
xor.T a4, a6, a4
lw t6, 258(sp)
li t7, 167516518
or t6, t6, t7, -13
sw t6, 114(sp)
lw t6, 6(sp)
add t0, t6, t0
lw t6, 258(sp)
li t7, 167516518
xor.1 t6, t6, t7
sw t6, 45(sp)
lw t6, 189(sp)
li t7, 167516518
and.1 t6, t6, t7, 13
sw t6, 84(sp)
li t7, 49286016
mul a6, a4, t7
lw t7, 111(sp)
or.T t6, a3, t7
sw t6, 24(sp)
add a4, t0, a7
lw t6, 117(sp)
lw t7, 114(sp)
and.T a7, t6, t7, -13
lw t6, 258(sp)
li t7, 167516518
xor.T t6, t6, t7
sw t6, 177(sp)
lw t6, 153(sp)
or a7, t6, a7, -13
li t7, 38209635
mul t0, a3, t7
lw t6, 258(sp)
li t7, 167516518
and.T t6, t6, t7, -13
sw t6, 21(sp)
li t7, -61908310
mul t6, a7, t7
sw t6, 30(sp)
lw t6, 189(sp)
lw t7, 66(sp)
and.T t1, t6, t7, -13
lw t6, 189(sp)
lw t7, 258(sp)
xor.T t6, t6, t7
sw t6, 138(sp)
lw t6, 114(sp)
lw t7, 111(sp)
and.T t2, t6, t7, -13
lw t6, 84(sp)
lw t7, 114(sp)
or.T t3, t6, t7
lw t6, 258(sp)
li t7, 167516518
or.T t6, t6, t7
sw t6, 99(sp)
li t7, 64532630
mul a7, a3, t7
lw t6, 189(sp)
lw t7, 258(sp)
or.1 t6, t6, t7
sw t6, 159(sp)
lw t7, 231(sp)
or t3, t3, t7, -13
lw t6, 111(sp)
lw t7, 69(sp)
and t6, t6, t7, 13
sw t6, 141(sp)
lw t6, 189(sp)
li t7, 167516518
xor t6, t6, t7
sw t6, 147(sp)
and.1 t1, t1, t2, 13
add a6, a6, a5
li t7, 131999793
mul a5, t1, t7
li t7, 118192333
mul t6, t3, t7
sw t6, 39(sp)
add a5, a5, t0
lw t6, 189(sp)
li t7, 167516518
and t6, t6, t7, 13
sw t6, 51(sp)
lw t6, 189(sp)
li t7, 167516518
xor.1 t6, t6, t7
sw t6, 204(sp)
add a4, a4, a6
lw t6, 258(sp)
li t7, 167516518
xor t6, t6, t7
sw t6, 126(sp)
lw t6, 258(sp)
lw t7, 126(sp)
xor.1 t6, t6, t7
sw t6, 6(sp)
lw t6, 18(sp)
add a4, t6, a4
lw t6, 0(sp)
add a4, t6, a4
lw t6, 27(sp)
add a4, t6, a4
lw t6, 3(sp)
add a4, t6, a4
add t6, a5, a7
sw t6, 156(sp)
li t7, 142801993
xor a4, a4, t7
li t7, 167516518
or t6, a4, t7, -13
sw t6, 123(sp)
li t7, 167516518
xor.T t6, a4, t7
sw t6, 180(sp)
lw t7, 258(sp)
or.T t6, a4, t7
sw t6, 168(sp)
lw t6, 189(sp)
xor.T t6, t6, a4
sw t6, 27(sp)
lw t6, 33(sp)
lw t7, 27(sp)
or.T a6, t6, t7
lw t7, 189(sp)
and.1 t6, a4, t7, 13
sw t6, 105(sp)
lw t6, 258(sp)
or t6, t6, a4, -13
sw t6, 162(sp)
lw t6, 162(sp)
lw t7, 189(sp)
and.T t0, t6, t7, -13
lw t6, 27(sp)
lw t7, 177(sp)
xor.T t6, t6, t7
sw t6, 81(sp)
lw t6, 168(sp)
li t7, -44238970
mul a5, t6, t7
lw t6, 189(sp)
li t7, 167516518
or.1 t6, t6, t7
sw t6, 108(sp)
lw t7, 105(sp)
and t1, a6, t7, 13
lw t6, 105(sp)
or.1 a7, t6, a3
lw t7, 90(sp)
and.T a6, t0, t7, -13
lw t6, 105(sp)
li t7, -179151718
mul t6, t6, t7
sw t6, 18(sp)
li t7, -165807691
mul t0, t1, t7
li t7, 118215679
add t6, t0, t7
sw t6, 3(sp)
lw t6, 105(sp)
lw t7, 168(sp)
xor.1 t1, t6, t7
lw t6, 180(sp)
lw t7, 45(sp)
or t0, t6, t7, -13
lw t7, 189(sp)
or.1 t6, a4, t7
sw t6, 171(sp)
lw t6, 72(sp)
lw t7, 123(sp)
and.1 t3, t6, t7, 13
lw t7, 258(sp)
xor.T t2, t1, t7
lw t7, 258(sp)
or.1 t6, a4, t7
sw t6, 96(sp)
li t7, 167516518
xor t6, a4, t7
sw t6, 48(sp)
lw t6, 24(sp)
xor.T t1, t6, t3
lw t6, 189(sp)
xor t6, t6, a4
sw t6, 192(sp)
lw t6, 138(sp)
lw t7, 192(sp)
or t3, t6, t7, -13
lw t6, 171(sp)
lw t7, 177(sp)
xor.1 t4, t6, t7
li t7, 156357034
mul t2, t2, t7
li t7, -192765747
mul t4, t4, t7
lw t6, 258(sp)
xor.T t6, t6, a4
sw t6, 75(sp)
or.T t0, a3, t0
and t5, a7, t1, 13
li t7, 35811131
mul a3, t3, t7
add t1, t2, t4
lw t6, 75(sp)
lw t7, 45(sp)
xor a7, t6, t7
li t7, 12232072
mul t2, t5, t7
lw t6, 21(sp)
lw t7, 108(sp)
and.1 t6, t6, t7, 13
sw t6, 186(sp)
lw t6, 258(sp)
lw t7, 189(sp)
xor t6, t6, t7
sw t6, 150(sp)
lw t6, 258(sp)
and.T t6, t6, a4, -13
sw t6, 132(sp)
lw t6, 105(sp)
lw t7, 189(sp)
or.T t3, t6, t7
li t7, 21627451
mul t6, t3, t7
sw t6, 33(sp)
add a5, a5, t2
or.1 t0, a6, t0
lw t6, 39(sp)
add t6, t6, t1
sw t6, 0(sp)
lw t6, 57(sp)
add t1, t6, a5
lw t6, 189(sp)
or.T t6, t6, a4
sw t6, 129(sp)
lw t6, 258(sp)
lw t7, 129(sp)
or.T a5, t6, t7
lw t6, 258(sp)
xor.1 t2, t6, a4
lw t6, 123(sp)
lw t7, 96(sp)
xor t3, t6, t7
lw t7, 147(sp)
xor.1 a5, a5, t7
lw t6, 258(sp)
xor a6, t6, a7
li t7, -116464499
mul a5, a5, t7
lw t6, 111(sp)
lw t7, 75(sp)
or.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 258(sp)
li t7, 167516518
and t6, t6, t7, 13
sw t6, 225(sp)
li t7, -136018530
mul t3, t3, t7
lw t7, 189(sp)
and t6, a4, t7, 13
sw t6, 57(sp)
li t7, 167516518
xor.1 t6, a4, t7
sw t6, 39(sp)
li t7, 93591071
mul a7, t0, t7
lw t6, 30(sp)
add a7, t6, a7
add t1, a7, t1
lw t6, 96(sp)
lw t7, 39(sp)
xor t0, t6, t7
lw t6, 48(sp)
lw t7, 99(sp)
or t5, t6, t7, -13
lw t6, 159(sp)
or a7, t6, t2, -13
li t7, 167516518
or.T t6, a4, t7
sw t6, 30(sp)
li t7, 156749861
mul t4, t0, t7
lw t7, 72(sp)
or t2, t5, t7, -13
lw t6, 39(sp)
lw t7, 231(sp)
or t5, t6, t7, -13
add t0, a5, t3
lw t6, 129(sp)
xor t3, t6, t5
add a3, t1, a3
lw t6, 3(sp)
add a3, t6, a3
lw t7, 18(sp)
add a5, t4, t7
lw t6, 108(sp)
lw t7, 30(sp)
or.T t6, t6, t7
sw t6, 60(sp)
add t6, a3, a5
sw t6, 3(sp)
li t7, -85654762
mul a5, t2, t7
li t7, 97529923
mul a3, a6, t7
li t7, 166630837
mul a6, t3, t7
lw t6, 75(sp)
slli t6, t6, 7
sw t6, 183(sp)
lw t6, 189(sp)
and.T t6, t6, a4, -13
sw t6, 213(sp)
lw t6, 27(sp)
lw t7, 96(sp)
xor t1, t6, t7
lw t6, 57(sp)
lw t7, 189(sp)
and.T t3, t6, t7, -13
lw t7, 33(sp)
add a6, a6, t7
lw t6, 75(sp)
ori t2, t6, 0
xor.T a7, a7, t3
lw t6, 129(sp)
lw t7, 213(sp)
xor.1 t6, t6, t7
sw t6, 210(sp)
add a6, t0, a6
lw t7, 258(sp)
and t6, a4, t7, 13
sw t6, 135(sp)
li t7, 163993696
mul a7, a7, t7
li t7, 167516518
and.1 t6, a4, t7, 13
sw t6, 18(sp)
add a3, a3, a7
lw t6, 36(sp)
lw t7, 6(sp)
and.T t4, t6, t7, -13
lw t6, 258(sp)
lw t7, 135(sp)
or.T t0, t6, t7
lw t6, 225(sp)
lw t7, 189(sp)
and a7, t6, t7, 13
lw t6, 168(sp)
and a7, t6, a7, 13
lw t7, 45(sp)
or t3, t2, t7, -13
lw t7, 210(sp)
and.1 t2, t1, t7, 13
lw t6, 258(sp)
li t7, 167516518
and.1 t1, t6, t7, 13
li t7, 167516518
and t6, a4, t7, 13
sw t6, 33(sp)
lw t6, 45(sp)
lw t7, 33(sp)
xor s0, t6, t7
xor t6, a4, a4
sw t6, 120(sp)
lw t6, 33(sp)
lw t7, 105(sp)
or.T s1, t6, t7
li t7, -43410978
mul t5, t2, t7
lw t6, 150(sp)
xor.T t4, t6, t4
lw t6, 99(sp)
and t2, t6, s1, 13
lw t6, 81(sp)
and.T s0, t6, s0, -13
lw t6, 156(sp)
add a6, t6, a6
lw t6, 0(sp)
add t6, t6, a6
sw t6, 156(sp)
lw t6, 129(sp)
or.1 t1, t6, t1
lw t6, 48(sp)
lw t7, 117(sp)
or.1 s3, t6, t7
li t7, 123100052
mul t6, t3, t7
sw t6, 6(sp)
and.T a7, s0, a7, -13
and s1, t4, a4, 13
add t4, a5, t5
lw t6, 72(sp)
lw t7, 60(sp)
or.T s2, t6, t7
li t7, 167516518
and.T t6, a4, t7, -13
sw t6, 150(sp)
lw t7, 150(sp)
or s0, a4, t7, -13
lw t6, 12(sp)
lw t7, 171(sp)
or.1 a6, t6, t7
lw t6, 177(sp)
li t7, 137683728
mul t6, t6, t7
sw t6, 174(sp)
lw t6, 204(sp)
lw t7, 120(sp)
and.1 s4, t6, t7, 13
lw t6, 186(sp)
xor t3, t6, s3
lw t6, 132(sp)
or t6, t6, a4, -13
sw t6, 0(sp)
xor t5, t2, t0
lw t6, 225(sp)
lw t7, 192(sp)
xor.T a5, t6, t7
lw t7, 24(sp)
xor.1 t0, s1, t7
li t7, 28455451
mul t0, t0, t7
li t7, -110511164
mul t2, s2, t7
add t0, t0, t4
lw t6, 183(sp)
add t4, t6, t2
add a3, a3, t0
or.1 s1, s4, s0
lw t6, 18(sp)
lw t7, 54(sp)
xor.T t0, t6, t7
lw t6, 138(sp)
lw t7, 27(sp)
and.1 t2, t6, t7, 13
lw t6, 258(sp)
lw t7, 192(sp)
xor s0, t6, t7
and.1 t1, t1, s1, 13
lw t7, 258(sp)
xor t6, a4, t7
sw t6, 183(sp)
lw t6, 36(sp)
lw t7, 231(sp)
and s1, t6, t7, 13
and s2, t5, t3, 13
li t7, -139659906
mul t6, s1, t7
sw t6, 81(sp)
lw t6, 18(sp)
lw t7, 189(sp)
and.T t3, t6, t7, -13
lw t6, 51(sp)
lw t7, 171(sp)
or.1 s1, t6, t7
lw t6, 213(sp)
lw t7, 189(sp)
xor t5, t6, t7
xor a7, a7, s2
slli a7, a7, 1
lw t6, 123(sp)
xor.T s0, t6, s0
add a7, t4, a7
lw t6, 120(sp)
lw t7, 189(sp)
or.1 s2, t6, t7
add a3, a3, a7
xor.T a7, s1, t3
lw t6, 156(sp)
add t4, t6, a3
lw t6, 153(sp)
lw t7, 150(sp)
xor.1 t3, t6, t7
lw t6, 126(sp)
or.T a3, t6, s0
lw t6, 96(sp)
lw t7, 12(sp)
or.1 t6, t6, t7
sw t6, 60(sp)
lw t7, 138(sp)
and.1 s0, s2, t7, 13
or.T t5, t5, a6
lw t6, 39(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 198(sp)
lw t7, 189(sp)
xor.T t6, t2, t7
sw t6, 219(sp)
xor.1 a6, t0, t1
lw t6, 210(sp)
and t2, t6, t5, 13
lw t6, 3(sp)
add t4, t6, t4
lw t6, 108(sp)
lw t7, 141(sp)
or.1 t0, t6, t7
li t7, 34946688
mul t5, s0, t7
lw t6, 66(sp)
or.T t1, t6, a5
lw t7, 6(sp)
add t5, t5, t7
lw t7, 189(sp)
or a5, a4, t7, -13
add t6, t4, t5
sw t6, 3(sp)
li t7, -165066911
mul t6, t2, t7
sw t6, 6(sp)
lw t6, 258(sp)
lw t7, 168(sp)
and.1 t5, t6, t7, 13
lw t6, 138(sp)
lw t7, 48(sp)
and.1 t6, t6, t7, 13
sw t6, 186(sp)
li t7, 167516518
or.1 t6, a4, t7
sw t6, 156(sp)
lw t6, 114(sp)
xor.T t4, t6, a7
li t7, 95687121
mul t1, t1, t7
lw t6, 183(sp)
and.1 s0, t6, t3, 13
lw t6, 258(sp)
lw t7, 177(sp)
xor.T t3, t6, t7
lw t7, 21(sp)
or t2, a5, t7, -13
li t7, 17866559
mul s1, t5, t7
lw t6, 123(sp)
lw t7, 126(sp)
xor.T t5, t6, t7
li t7, 134551669
mul a7, t0, t7
lw t6, 168(sp)
lw t7, 213(sp)
or t6, t6, t7, -13
sw t6, 24(sp)
lw t6, 27(sp)
and.T s2, t6, a4, -13
lw t6, 0(sp)
and a6, t6, a6, 13
li t7, -25506680
mul t0, t4, t7
lw t6, 189(sp)
lw t7, 54(sp)
xor.T t6, t6, t7
sw t6, 27(sp)
add t4, s1, t1
lw t6, 108(sp)
li t7, -55410071
mul t6, t6, t7
sw t6, 216(sp)
lw t6, 39(sp)
and.T t1, t6, s2, -13
lw t6, 198(sp)
and t5, t6, t5, 13
xor a6, a6, a3
lw t6, 117(sp)
lw t7, 189(sp)
xor a3, t6, t7
or.1 t5, a3, t5
lw t6, 189(sp)
or.T s0, t6, s0
lw t6, 156(sp)
lw t7, 147(sp)
or a3, t6, t7, -13
li t7, -73823557
mul a6, a6, t7
lw t7, 189(sp)
and.T t3, t3, t7, -13
lw t6, 213(sp)
lw t7, 30(sp)
or s2, t6, t7, -13
lw t6, 258(sp)
lw t7, 90(sp)
or.T t6, t6, t7
sw t6, 195(sp)
li t7, -47024494
mul s0, s0, t7
lw t6, 219(sp)
and.1 s3, t6, t3, 13
lw t6, 138(sp)
lw t7, 189(sp)
or.1 t3, t6, t7
lw t6, 60(sp)
li t7, 108900204
mul s1, t6, t7
lw t7, 54(sp)
or s4, a3, t7, -13
lw t6, 258(sp)
lw t7, 189(sp)
xor.1 a3, t6, t7
li t7, 11250203
mul s3, s3, t7
and.T t2, t2, s4, -13
lw t7, 81(sp)
add s4, s3, t7
li t7, 85860532
mul s2, s2, t7
li t7, 108509554
mul s3, t2, t7
lw t6, 6(sp)
add t2, t6, s4
add t4, t2, t4
li t7, -148981778
mul t5, t5, t7
lw t6, 111(sp)
lw t7, 180(sp)
or t2, t6, t7, -13
lw t6, 174(sp)
add s1, t6, s1
li t7, -39847530
mul t6, a3, t7
sw t6, 141(sp)
add t5, s0, t5
add t6, a7, s1
sw t6, 174(sp)
add a7, t0, t5
add t6, s3, s2
sw t6, 60(sp)
lw t6, 39(sp)
lw t7, 48(sp)
and.1 t6, t6, t7, 13
sw t6, 0(sp)
slli t6, t1, 3
sw t6, 30(sp)
lw t6, 177(sp)
li t7, -19631412
mul t1, t6, t7
lw t7, 48(sp)
and.1 a5, a5, t7, 13
lw t6, 186(sp)
li t7, 101899800
mul t6, t6, t7
sw t6, 90(sp)
lw t6, 132(sp)
lw t7, 156(sp)
xor t6, t6, t7
sw t6, 132(sp)
lw t6, 153(sp)
lw t7, 126(sp)
and.1 t6, t6, t7, 13
sw t6, 186(sp)
xor.T t0, t3, a3
lw t6, 111(sp)
lw t7, 156(sp)
and.1 t5, t6, t7, 13
lw t6, 114(sp)
lw t7, 192(sp)
xor s0, t6, t7
lw t6, 180(sp)
lw t7, 210(sp)
and t3, t6, t7, 13
add t4, t4, a7
li t7, 173262275
mul a7, s0, t7
add t1, t1, a7
lw t6, 204(sp)
li t7, -153092785
mul a7, t6, t7
add t6, a6, t4
sw t6, 81(sp)
lw t7, 192(sp)
xor.1 a6, t5, t7
lw t6, 168(sp)
slli t6, t6, 8
sw t6, 114(sp)
lw t7, 135(sp)
xor.1 a6, a6, t7
lw t6, 216(sp)
add t1, t6, t1
and a6, t0, a6, 13
lw t6, 27(sp)
lw t7, 195(sp)
or t4, t6, t7, -13
lw t7, 126(sp)
and t0, t3, t7, 13
or t3, t2, t4, -13
lw t6, 189(sp)
lw t7, 120(sp)
xor.1 s0, t6, t7
lw t6, 36(sp)
li t7, -37361262
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 108(sp)
lw t7, 96(sp)
or.1 t2, t6, t7
lw t6, 210(sp)
li t7, 146840637
mul s1, t6, t7
lw t6, 84(sp)
lw t7, 54(sp)
and.T t4, t6, t7, -13
lw t6, 21(sp)
lw t7, 84(sp)
and s2, t6, t7, 13
lw t6, 126(sp)
lw t7, 12(sp)
and.1 t5, t6, t7, 13
lw t6, 75(sp)
li t7, -111488202
mul t6, t6, t7
sw t6, 6(sp)
xor.1 s2, s0, s2
lw t6, 18(sp)
lw t7, 117(sp)
xor s0, t6, t7
li t7, -27293743
mul a6, a6, t7
add t1, t1, s1
lw t7, 24(sp)
xor.T a5, a5, t7
li t7, -10383459
mul s3, t4, t7
lw t6, 141(sp)
add t1, t6, t1
lw t7, 156(sp)
or.T t4, a3, t7
xor.T s4, a5, t0
li t7, -44639316
mul a5, t3, t7
lw t6, 30(sp)
add s1, t6, a5
li t7, -89539886
mul t6, s2, t7
sw t6, 30(sp)
li t7, 182102095
mul a5, t5, t7
add t0, s3, a7
lw t6, 0(sp)
or a7, t6, s4, -13
li t7, -71498291
mul t6, s0, t7
sw t6, 24(sp)
lw t7, 132(sp)
xor.T t5, a7, t7
lw t6, 258(sp)
lw t7, 225(sp)
or.T a7, t6, t7
lw t6, 120(sp)
lw t7, 117(sp)
xor.T t3, t6, t7
lw t6, 186(sp)
lw t7, 159(sp)
xor s0, t6, t7
li t7, -7258688
mul t6, t2, t7
sw t6, 0(sp)
li t7, -7639932
mul s2, t5, t7
lw t6, 126(sp)
lw t7, 177(sp)
xor.T t2, t6, t7
lw t6, 123(sp)
lw t7, 147(sp)
and.1 t5, t6, t7, 13
lw t6, 60(sp)
add s1, t6, s1
lw t7, 156(sp)
xor.T t4, t4, t7
lw t6, 174(sp)
add s1, t6, s1
lw t6, 138(sp)
li t7, -148761388
mul t6, t6, t7
sw t6, 84(sp)
lw t6, 90(sp)
add s2, t6, s2
lw t6, 72(sp)
xor.1 a7, t6, a7
add t6, a6, s2
sw t6, 60(sp)
li t7, -134655855
mul s2, a7, t7
lw t7, 39(sp)
and.1 a7, a4, t7, 13
li t7, -125242256
mul s0, s0, t7
add a6, s1, t1
lw t6, 57(sp)
li t7, 167516518
and t1, t6, t7, 13
lw t6, 81(sp)
add t6, t6, a6
sw t6, 39(sp)
lw t7, 258(sp)
and.T t3, t3, t7, -13
li t7, -13582328
mul a6, t4, t7
lw t7, 57(sp)
xor.T t4, t5, t7
lw t7, 192(sp)
or a3, a3, t7, -13
li t7, -18066480
mul t4, t4, t7
xor a3, a3, a4
lw t6, 33(sp)
or.T s1, t6, a4
add t5, s0, s2
lw t6, 12(sp)
lw t7, 168(sp)
xor s3, t6, t7
lw t6, 258(sp)
and.1 t6, t6, a4, 13
sw t6, 12(sp)
li t7, 164540966
mul s0, t3, t7
lw t6, 171(sp)
lw t7, 135(sp)
and s2, t6, t7, 13
lw t6, 135(sp)
li t7, -119524132
mul t3, t6, t7
add t5, t0, t5
li t7, 179894160
mul t0, s3, t7
add t5, a5, t5
lw t7, 231(sp)
and a5, t2, t7, 13
lw t6, 204(sp)
lw t7, 18(sp)
or t2, t6, t7, -13
li t7, 45888762
mul s3, a3, t7
lw t6, 213(sp)
lw t7, 51(sp)
xor a3, t6, t7
li t7, -7420790
mul a3, a3, t7
lw t6, 6(sp)
add s3, t6, s3
xor s1, s1, t2
and.1 a5, s2, a5, 13
li t7, 95490691
mul a5, a5, t7
lw t6, 27(sp)
add s3, t6, s3
lw t6, 21(sp)
lw t7, 198(sp)
xor.T s2, t6, t7
lw t6, 138(sp)
lw t7, 57(sp)
and t6, t6, t7, 13
sw t6, 27(sp)
add t4, t4, s0
lw t6, 12(sp)
lw t7, 159(sp)
or t2, t6, t7, -13
lw t6, 30(sp)
add s0, t6, t4
lw t6, 0(sp)
add t4, t6, s3
lw t7, 114(sp)
add s3, t4, t7
and.1 t4, a7, t1, 13
lw t6, 24(sp)
add a7, t6, s0
li t7, -73346924
mul t6, s1, t7
sw t6, 0(sp)
lw t6, 189(sp)
lw t7, 192(sp)
and.1 s0, t6, t7, 13
add t1, t5, s3
add t0, t0, t3
lw t6, 168(sp)
or.T t3, t6, s2
add t0, a6, t0
lw t6, 60(sp)
add a6, t6, t1
li t7, -99101852
mul t1, t3, t7
lw t6, 45(sp)
li t7, -167516518
xor.T t3, t6, t7
li t7, 133121324
mul t4, t4, t7
lw t6, 258(sp)
lw t7, 189(sp)
and.1 t5, t6, t7, 13
lw t7, 258(sp)
or.T s0, s0, t7
lw t7, 84(sp)
add s1, a6, t7
lw t6, 135(sp)
li t7, -121486331
mul a6, t6, t7
add a7, s1, a7
add a7, a7, a5
li t7, 111424303
mul t2, t2, t7
li t7, -186487652
mul a5, t5, t7
li t7, -111455813
mul t5, s0, t7
add t6, t0, t5
sw t6, 24(sp)
add t0, t1, a3
li t7, 172102006
mul a3, t3, t7
add t0, t0, t4
add t1, t0, t2
lw t6, 231(sp)
lw t7, 51(sp)
or t0, t6, t7, -13
lw t6, 39(sp)
add t6, t6, a7
sw t6, 6(sp)
lw t6, 54(sp)
li t7, 2624925
mul a7, t6, t7
lw t7, 48(sp)
or t0, t0, t7, -13
li t7, 64072919
mul t2, t0, t7
lw t6, 45(sp)
lw t7, 162(sp)
xor.1 t0, t6, t7
add t1, t1, a5
lw t6, 156(sp)
li t7, -126830284
mul t6, t6, t7
sw t6, 18(sp)
add t2, t2, a3
lw t6, 189(sp)
li t7, -144964352
mul t6, t6, t7
sw t6, 30(sp)
lw t6, 189(sp)
lw t7, 183(sp)
or a3, t6, t7, -13
lw t6, 27(sp)
xor.T t3, t6, a3
lw t6, 21(sp)
li t7, 133342760
mul a3, t6, t7
li t7, 177606800
mul a5, t0, t7
lw t6, 96(sp)
lw t7, 189(sp)
and.1 t0, t6, t7, 13
lw t7, 96(sp)
xor t0, t0, t7
lw t6, 66(sp)
and t3, t6, t3, 13
li t7, 107113016
mul t3, t3, t7
add t3, t3, a6
li t7, 136633912
mul t0, t0, t7
lw t6, 213(sp)
lw t7, 192(sp)
xor.1 a6, t6, t7
add a7, t0, a7
lw t6, 153(sp)
li t7, 167516518
and.1 t4, t6, t7, 13
li t7, 157806430
mul t0, a6, t7
lw t6, 189(sp)
lw t7, 213(sp)
xor.1 a6, t6, t7
add t5, t2, t3
and t2, a4, t4, 13
lw t6, 138(sp)
lw t7, 111(sp)
or t3, t6, t7, -13
add t1, t1, t5
lw t6, 171(sp)
li t7, 25485655
mul t4, t6, t7
lw t6, 147(sp)
xor.1 t5, t6, a4
lw t6, 210(sp)
lw t7, 48(sp)
and.T s0, t6, t7, -13
lw t6, 171(sp)
lw t7, 54(sp)
and.1 s1, t6, t7, 13
lw t6, 0(sp)
add s2, t6, t1
lw t6, 96(sp)
lw t7, 147(sp)
and.1 t1, t6, t7, 13
lw t6, 12(sp)
or s1, t6, s1, -13
xor.T s0, s0, a6
lw t6, 24(sp)
add a6, t6, s2
lw t6, 135(sp)
and t3, t6, t3, 13
and.T t1, t1, s0, -13
lw t6, 147(sp)
or s0, t6, s1, -13
li t7, 143199347
mul t1, t1, t7
li t7, 182892126
mul s0, s0, t7
li t7, -9917885
mul t5, t5, t7
add t4, t4, s0
li t7, 9577640
mul t2, t2, t7
add t6, a3, t2
sw t6, 27(sp)
add a3, a5, t5
lw t6, 99(sp)
li t7, 142988891
mul t2, t6, t7
lw t6, 129(sp)
lw t7, 66(sp)
or.1 a5, t6, t7
add a3, t0, a3
add a3, a7, a3
lw t7, 189(sp)
and.1 a7, a5, t7, 13
lw t6, 153(sp)
lw t7, 120(sp)
xor.1 a5, t6, t7
lw t7, 75(sp)
and.1 a5, a5, t7, 13
lw t6, 207(sp)
li t7, -174134247
and.T t6, t6, t7, -13
sw t6, 114(sp)
lw t6, 258(sp)
lw t7, 45(sp)
xor.T t0, t6, t7
lw t6, 150(sp)
or s0, t6, t3, -13
li t7, -151330932
mul t5, a5, t7
lw t6, 36(sp)
lw t7, 258(sp)
and.T a5, t6, t7, -13
lw t6, 126(sp)
lw t7, 69(sp)
xor.1 t3, t6, t7
lw t6, 30(sp)
add t6, t6, t4
sw t6, 24(sp)
li t7, -51394440
mul t4, s0, t7
li t7, 5670199
mul a7, a7, t7
add t6, t2, t5
sw t6, 21(sp)
lw t7, 207(sp)
or.1 t6, a4, t7
sw t6, 126(sp)
lw t6, 51(sp)
li t7, 167516518
or t2, t6, t7, -13
li t7, -123082118
mul t6, t2, t7
sw t6, 0(sp)
add a7, t1, a7
add t1, a3, t4
lw t7, 105(sp)
or.T a3, t3, t7
add t1, a6, t1
lw t6, 126(sp)
li t7, -174134247
or a6, t6, t7, -13
lw t6, 6(sp)
add t6, t6, t1
sw t6, 6(sp)
xor.1 t0, t0, a3
lw t7, 207(sp)
xor.T t6, a4, t7
sw t6, 111(sp)
li t7, -174134247
or.T t6, a4, t7
sw t6, 96(sp)
lw t6, 207(sp)
lw t7, 96(sp)
and t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 144(sp)
li t7, -76337063
xor a3, t6, t7
li t7, -174134247
and.T t6, a3, t7, -13
sw t6, 66(sp)
li t7, -174134247
and.1 t6, a3, t7, 13
sw t6, 30(sp)
li t7, -174134247
or.1 t6, a4, t7
sw t6, 99(sp)
or.T a5, a5, t0
lw t6, 207(sp)
li t7, -174134247
and.1 t6, t6, t7, 13
sw t6, 162(sp)
xor.T t6, a4, a3
sw t6, 177(sp)
lw t7, 207(sp)
or.T t6, a3, t7
sw t6, 33(sp)
lw t7, 207(sp)
xor.T t6, a3, t7
sw t6, 129(sp)
lw t6, 207(sp)
xor t6, t6, a3
sw t6, 75(sp)
li t7, -174134247
or.T t6, a3, t7
sw t6, 12(sp)
lw t6, 33(sp)
lw t7, 114(sp)
xor t0, t6, t7
li t7, -120559147
mul t0, t0, t7
xor.1 t6, a3, a4
sw t6, 81(sp)
lw t7, 18(sp)
add a7, a7, t7
li t7, -174134247
xor t6, a3, t7
sw t6, 144(sp)
lw t6, 27(sp)
add a7, t6, a7
lw t6, 87(sp)
lw t7, 129(sp)
or.T t3, t6, t7
li t7, -174134247
and.T t6, a4, t7, -13
sw t6, 39(sp)
lw t6, 12(sp)
lw t7, 177(sp)
or.1 t1, t6, t7
xor.T t4, a6, t1
li t7, -174134247
or t6, a4, t7, -13
sw t6, 57(sp)
lw t6, 177(sp)
lw t7, 99(sp)
or.T t1, t6, t7
lw t6, 111(sp)
lw t7, 75(sp)
or t2, t6, t7, -13
li t7, -174134247
or.1 t6, a3, t7
sw t6, 141(sp)
li t7, 121587057
mul a6, t3, t7
lw t6, 24(sp)
add a7, t6, a7
lw t6, 144(sp)
lw t7, 30(sp)
and.T t3, t6, t7, -13
li t7, 50987992
mul t4, t4, t7
lw t7, 207(sp)
xor.1 t6, a3, t7
sw t6, 174(sp)
add t6, t4, t0
sw t6, 18(sp)
lw t7, 96(sp)
xor t0, t3, t7
li t7, 8007219
mul t3, a5, t7
lw t6, 66(sp)
or.1 a5, t6, t0
lw t6, 111(sp)
xor t0, t6, t2
li t7, -174134247
or t6, a3, t7, -13
sw t6, 69(sp)
lw t6, 0(sp)
add t2, t6, t3
lw t7, 207(sp)
and t6, a4, t7, 13
sw t6, 156(sp)
lw t6, 207(sp)
li t7, -174134247
or t6, t6, t7, -13
sw t6, 24(sp)
and.1 t0, t0, t1, 13
lw t6, 174(sp)
lw t7, 156(sp)
and.T t6, t6, t7, -13
sw t6, 90(sp)
lw t6, 21(sp)
add t1, t6, t2
xor t6, a3, a3
sw t6, 273(sp)
li t7, 32754029
mul a5, a5, t7
li t7, -66841160
mul t0, t0, t7
add t1, a7, t1
lw t6, 81(sp)
lw t7, 207(sp)
xor.1 t2, t6, t7
lw t6, 207(sp)
li t7, -174134247
xor t6, t6, t7
sw t6, 183(sp)
lw t6, 141(sp)
lw t7, 114(sp)
or.1 a7, t6, t7
li t7, -23151606
mul t6, t2, t7
sw t6, 0(sp)
lw t6, 183(sp)
lw t7, 141(sp)
xor.T t6, t6, t7
sw t6, 54(sp)
add a5, a5, a6
lw t6, 6(sp)
add a6, t6, t1
lw t6, 207(sp)
li t7, -174134247
or.1 t6, t6, t7
sw t6, 180(sp)
li t7, -174134247
xor.T t6, a4, t7
sw t6, 72(sp)
lw t6, 39(sp)
lw t7, 180(sp)
xor.T t1, t6, t7
and t6, a3, a4, 13
sw t6, 6(sp)
xor.T t2, a4, t1
lw t7, 207(sp)
or.T t1, a4, t7
li t7, -34716010
mul t2, t2, t7
add t3, t0, t2
lw t6, 207(sp)
and.1 t6, t6, a4, 13
sw t6, 27(sp)
lw t6, 75(sp)
li t7, 55266954
mul t6, t6, t7
sw t6, 51(sp)
lw t6, 207(sp)
and.T t6, t6, a3, -13
sw t6, 21(sp)
lw t7, 144(sp)
and.T t0, t1, t7, -13
lw t7, 81(sp)
and.T a7, a7, t7, -13
lw t7, 24(sp)
and.T t1, a7, t7, -13
lw t6, 177(sp)
li t7, -174134247
and.T t6, t6, t7, -13
sw t6, 105(sp)
lw t7, 162(sp)
xor.T a7, a3, t7
li t7, -145553437
mul t6, t1, t7
sw t6, 60(sp)
lw t6, 3(sp)
add t6, t6, a6
sw t6, 84(sp)
lw t6, 207(sp)
li t7, 174134247
xor a6, t6, t7
li t7, -47885436
mul t1, a6, t7
lw t6, 72(sp)
li t7, 12345069
mul t6, t6, t7
sw t6, 45(sp)
lw t6, 231(sp)
lw t7, 81(sp)
or a6, t6, t7, -13
li t7, -193159728
mul t2, a6, t7
lw t6, 207(sp)
li t7, -174134247
xor.T t6, t6, t7
sw t6, 48(sp)
add a5, a5, t3
lw t6, 6(sp)
li t7, 125682679
mul t6, t6, t7
sw t6, 117(sp)
lw t6, 273(sp)
or.T a6, t6, a3
lw t6, 48(sp)
lw t7, 87(sp)
and.T t3, t6, t7, -13
lw t7, 162(sp)
xor t5, a6, t7
lw t6, 99(sp)
lw t7, 48(sp)
or.1 t4, t6, t7
li t7, -152788089
mul a7, a7, t7
lw t6, 18(sp)
add a6, t6, a5
lw t6, 69(sp)
lw t7, 27(sp)
xor a5, t6, t7
or.1 t6, a4, a3
sw t6, 18(sp)
and t0, t0, a5, 13
li t7, -150964878
mul a5, t5, t7
lw t6, 90(sp)
or t0, t6, t0, -13
li t7, -174134247
and.1 t6, a4, t7, 13
sw t6, 90(sp)
lw t7, 75(sp)
and.1 t4, t4, t7, 13
li t7, 152190188
mul t5, t0, t7
lw t7, 126(sp)
or.T s1, a4, t7
lw t6, 183(sp)
lw t7, 18(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 273(sp)
lw t7, 126(sp)
xor s0, t6, t7
lw t6, 54(sp)
li t7, -23667551
mul t0, t6, t7
add t0, t0, t2
lw t7, 207(sp)
or t6, a4, t7, -13
sw t6, 54(sp)
add t1, t5, t1
li t7, -57536614
mul t5, t3, t7
lw t6, 21(sp)
and.1 t3, t6, s0, 13
li t7, 154888976
mul s0, t4, t7
and t4, s1, a3, 13
lw t6, 90(sp)
lw t7, 114(sp)
xor.1 s2, t6, t7
lw t6, 54(sp)
li t7, -147196670
mul t2, t6, t7
lw t6, 54(sp)
li t7, 154839593
mul s3, t6, t7
li t7, -113255773
mul t4, t4, t7
lw t6, 105(sp)
li t7, 158608555
mul s4, t6, t7
li t7, -174134247
xor.1 s1, a3, t7
li t7, 44083445
mul s5, t3, t7
lw t6, 114(sp)
lw t7, 183(sp)
or.1 t6, t6, t7
sw t6, 108(sp)
lw t7, 0(sp)
add s6, t1, t7
lw t6, 207(sp)
or.1 t6, t6, a3
sw t6, 168(sp)
li t7, -174134247
xor.1 t3, a4, t7
add t1, s3, s4
lw t6, 60(sp)
add s4, t6, s6
add a7, s5, a7
add s3, a7, t5
lw t6, 36(sp)
and t5, t6, s2, 13
lw t6, 117(sp)
add a7, t6, s0
add t6, a6, s4
sw t6, 159(sp)
xor t6, a4, a3
sw t6, 117(sp)
lw t6, 168(sp)
lw t7, 90(sp)
and a6, t6, t7, 13
lw t6, 33(sp)
xor s2, t6, a6
lw t6, 72(sp)
lw t7, 207(sp)
or.T s0, t6, t7
lw t7, 273(sp)
or.1 a6, s1, t7
lw t6, 45(sp)
add t4, t6, t4
add a5, a5, a7
lw t6, 168(sp)
or.1 a7, t6, s0
add a5, t0, a5
add t6, a5, s3
sw t6, 138(sp)
lw t7, 180(sp)
xor.1 s0, a3, t7
add t0, t4, t2
lw t6, 183(sp)
li t7, -141786436
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 6(sp)
lw t7, 57(sp)
or.T t6, t6, t7
sw t6, 150(sp)
lw t6, 72(sp)
or.1 t5, t6, t5
lw t6, 39(sp)
xor.1 t4, t6, t3
lw t6, 144(sp)
lw t7, 117(sp)
xor.1 t6, t6, t7
sw t6, 36(sp)
li t7, 111209961
mul a5, s2, t7
lw t6, 33(sp)
lw t7, 141(sp)
or.1 t2, t6, t7
li t7, -25989170
mul t3, t5, t7
li t7, -174134247
and t6, a4, t7, 13
sw t6, 171(sp)
lw t6, 72(sp)
li t7, -174134247
or.1 t5, t6, t7
lw t6, 207(sp)
li t7, -174134247
and t6, t6, t7, 13
sw t6, 105(sp)
add t1, t3, t1
lw t6, 6(sp)
lw t7, 24(sp)
and t3, t6, t7, 13
lw t6, 3(sp)
li t7, 77677587
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 57(sp)
li t7, 13720427
mul t6, t6, t7
sw t6, 60(sp)
or s1, s0, t3, -13
li t7, -174134247
and t6, a3, t7, 13
sw t6, 45(sp)
lw t6, 171(sp)
lw t7, 27(sp)
and.1 s0, t6, t7, 13
lw t7, 231(sp)
or t3, t2, t7, -13
add t6, t1, t0
sw t6, 153(sp)
lw t6, 105(sp)
li t7, -184336374
mul t1, t6, t7
lw t6, 129(sp)
lw t7, 96(sp)
and.1 t2, t6, t7, 13
lw t6, 66(sp)
li t7, 193666530
mul t6, t6, t7
sw t6, 135(sp)
li t7, -18119869
mul t0, a7, t7
lw t6, 72(sp)
or.1 s2, t6, t2
li t7, 158086964
mul t2, s1, t7
lw t6, 54(sp)
lw t7, 24(sp)
or.1 t6, t6, t7
sw t6, 123(sp)
lw t7, 69(sp)
or.T a7, a3, t7
li t7, -146175306
mul s1, s2, t7
and.1 a6, a6, t4, 13
li t7, -174134247
xor t6, a4, t7
sw t6, 132(sp)
lw t6, 75(sp)
lw t7, 90(sp)
or.T t4, t6, t7
lw t6, 108(sp)
xor.1 t4, t6, t4
lw t7, 45(sp)
or t5, t5, t7, -13
add s1, a5, s1
lw t6, 114(sp)
lw t7, 6(sp)
or a5, t6, t7, -13
li t7, -169612650
mul t5, t5, t7
lw t7, 45(sp)
and s3, a5, t7, 13
and s0, s0, a4, 13
slli a6, a6, 8
lw t6, 126(sp)
andi s2, t6, 0
or t6, a4, a3, -13
sw t6, 126(sp)
lw t6, 207(sp)
li t7, -174134247
or.T a5, t6, t7
li t7, 74089309
mul s3, s3, t7
li t7, 30662966
mul s0, s0, t7
lw t6, 36(sp)
and s4, t6, t3, 13
add t3, t5, s3
li t7, -103663591
mul s3, s4, t7
lw t6, 207(sp)
lw t7, 132(sp)
xor.T t5, t6, t7
lw t6, 0(sp)
add t3, t6, t3
add s4, t3, t1
lw t6, 57(sp)
lw t7, 33(sp)
or.1 t3, t6, t7
li t7, 70574213
mul t1, t4, t7
add t4, s3, s4
add s1, s1, t0
add t2, t2, t4
lw t6, 24(sp)
and.1 s3, t6, a5, 13
li t7, 76417956
mul t0, s2, t7
li t7, -174134247
xor.T t6, a3, t7
sw t6, 186(sp)
lw t6, 72(sp)
lw t7, 186(sp)
xor.T t4, t6, t7
lw t6, 39(sp)
li t7, 105174580
mul t6, t6, t7
sw t6, 0(sp)
and s2, s3, a7, 13
lw t6, 81(sp)
lw t7, 33(sp)
or s3, t6, t7, -13
lw t7, 129(sp)
and.1 a7, a4, t7, 13
lw t7, 207(sp)
and t6, a3, t7, 13
sw t6, 147(sp)
lw t6, 174(sp)
lw t7, 96(sp)
xor.T t6, t6, t7
sw t6, 36(sp)
lw t6, 3(sp)
add a6, t6, a6
add t6, s0, t1
sw t6, 108(sp)
lw t6, 30(sp)
and.T t1, t6, s3, -13
add s5, s1, a6
li t7, 16793873
mul a7, a7, t7
lw t6, 30(sp)
lw t7, 162(sp)
or.T s4, t6, t7
and.1 a6, a3, a4, 13
lw t6, 45(sp)
lw t7, 147(sp)
or.1 s0, t6, t7
li t7, -77584414
mul t1, t1, t7
lw t6, 111(sp)
and s3, t6, a5, 13
slli s1, t5, 7
li t7, 113420370
mul s4, s4, t7
lw t6, 171(sp)
lw t7, 186(sp)
xor t5, t6, t7
or.T t6, a3, a4
sw t6, 3(sp)
lw t6, 153(sp)
add s5, t6, s5
and t3, t3, s2, 13
li t7, -88435968
mul t3, t3, t7
lw t7, 60(sp)
add t3, t3, t7
lw t6, 51(sp)
add s2, t6, s5
add t6, s2, t2
sw t6, 60(sp)
lw t6, 162(sp)
lw t7, 72(sp)
or.1 t2, t6, t7
lw t6, 207(sp)
xor.T s2, t6, a5
lw t6, 33(sp)
slli t6, t6, 5
sw t6, 72(sp)
lw t7, 162(sp)
xor.T t4, t4, t7
add t6, t0, s4
sw t6, 153(sp)
lw t7, 147(sp)
or.T a5, s3, t7
li t7, 158281343
mul a5, a5, t7
li t7, -174134247
and.T t0, t2, t7, -13
li t7, -8710272
mul s0, s0, t7
lw t7, 162(sp)
xor.T t4, t4, t7
lw t6, 231(sp)
lw t7, 126(sp)
and t2, t6, t7, 13
add s0, s1, s0
li t7, -143998730
mul t4, t4, t7
lw t7, 135(sp)
add t3, t3, t7
add s1, a5, s0
lw t6, 24(sp)
and s0, t6, a4, 13
lw t6, 0(sp)
add a5, t6, t4
lw t6, 156(sp)
lw t7, 3(sp)
xor t4, t6, t7
add a7, t3, a7
li t7, 172986777
mul t3, t5, t7
lw t7, 33(sp)
or.T t5, s2, t7
add t6, t1, s1
sw t6, 0(sp)
li t7, -123225457
mul t5, t5, t7
lw t7, 207(sp)
and.1 t6, a3, t7, 13
sw t6, 51(sp)
lw t7, 150(sp)
and.T s0, s0, t7, -13
li t7, 27126624
mul s1, a6, t7
lw t6, 3(sp)
lw t7, 66(sp)
or t1, t6, t7, -13
li t7, -81262534
mul a6, t4, t7
lw t6, 111(sp)
lw t7, 18(sp)
and t4, t6, t7, 13
add s1, t5, s1
lw t6, 108(sp)
add t5, t6, a7
lw t6, 48(sp)
lw t7, 177(sp)
xor a7, t6, t7
lw t6, 48(sp)
lw t7, 3(sp)
xor.1 t6, t6, t7
sw t6, 108(sp)
or s2, t2, s0, -13
and t2, a3, t0, 13
lw t6, 30(sp)
lw t7, 168(sp)
or t0, t6, t7, -13
lw t6, 96(sp)
lw t7, 36(sp)
and.1 s0, t6, t7, 13
lw t6, 123(sp)
and.1 t0, t6, t0, 13
li t7, 49048130
mul s3, t2, t7
add t3, t3, s1
li t7, -103669671
mul t2, t4, t7
li t7, 86663466
add t4, s3, t7
xor s1, t1, s2
lw t6, 18(sp)
lw t7, 144(sp)
xor.1 t6, t6, t7
sw t6, 30(sp)
li t7, -76407849
mul s2, t0, t7
lw t6, 207(sp)
li t7, -152346627
mul t0, t6, t7
add t1, a5, t4
lw t6, 129(sp)
li t7, 122159487
mul a5, t6, t7
lw t7, 6(sp)
xor.1 t4, a4, t7
lw t7, 153(sp)
add t6, t5, t7
sw t6, 36(sp)
lw t7, 72(sp)
add t6, s2, t7
sw t6, 18(sp)
lw t7, 207(sp)
xor t5, a4, t7
add t6, t2, a5
sw t6, 6(sp)
xor.T t2, t5, a4
li t7, -177580249
mul a5, s0, t7
add a5, a6, a5
lw t6, 57(sp)
lw t7, 162(sp)
xor.T s0, t6, t7
lw t6, 90(sp)
li t7, 120693507
mul t6, t6, t7
sw t6, 66(sp)
add a6, t3, a5
lw t6, 162(sp)
li t7, -138248804
mul t6, t6, t7
sw t6, 123(sp)
li t7, 13452007
mul t3, s1, t7
and.T a5, a4, a3, -13
lw t6, 207(sp)
or t6, t6, a3, -13
sw t6, 57(sp)
lw t6, 207(sp)
slli t5, t6, 2
and.T s4, a5, a7, -13
lw t7, 120(sp)
and a7, a4, t7, 13
add t1, t1, t3
lw t6, 162(sp)
li t7, -181516037
mul s3, t6, t7
lw t6, 0(sp)
add t3, t6, t1
lw t6, 171(sp)
lw t7, 141(sp)
and t1, t6, t7, 13
li t7, -129919994
mul s1, t4, t7
lw t7, 48(sp)
and.T s2, a4, t7, -13
xor t4, s4, s0
li t7, -142685980
mul t4, t4, t7
lw t6, 120(sp)
lw t7, 39(sp)
or.T t6, t6, t7
sw t6, 72(sp)
xor.T t6, a5, a3
sw t6, 0(sp)
add t0, t4, t0
li t7, 67007933
mul a7, a7, t7
add t0, s3, t0
lw t6, 27(sp)
li t7, -174134247
xor t4, t6, t7
li t7, 154456183
mul t2, t2, t7
lw t6, 231(sp)
li t7, -174134247
or.T s3, t6, t7
add t2, t2, t5
li t7, -32038344
mul t5, s2, t7
lw t6, 180(sp)
lw t7, 108(sp)
and.1 s2, t6, t7, 13
add s1, t2, s1
lw t6, 105(sp)
li t7, -174134247
or.T s0, t6, t7
lw t6, 57(sp)
li t7, 113976320
mul t2, t6, t7
add s1, t0, s1
lw t6, 144(sp)
lw t7, 162(sp)
xor.T t0, t6, t7
lw t6, 45(sp)
lw t7, 174(sp)
or.1 s4, t6, t7
li t7, 104754885
mul t6, s3, t7
sw t6, 108(sp)
lw t7, 144(sp)
or.1 s3, a4, t7
lw t6, 6(sp)
add s1, t6, s1
lw t6, 144(sp)
li t7, 57607036
mul t6, t6, t7
sw t6, 48(sp)
lw t6, 36(sp)
add s5, t6, t3
li t7, -57105177
mul t3, s4, t7
add a6, s5, a6
lw t6, 207(sp)
li t7, -52976767
mul t6, t6, t7
sw t6, 27(sp)
lw t6, 60(sp)
add a6, t6, a6
and.1 s5, s3, s2, 13
lw t7, 30(sp)
and.1 s2, t1, t7, 13
lw t6, 180(sp)
lw t7, 81(sp)
or.T t1, t6, t7
lw t6, 171(sp)
lw t7, 207(sp)
and s3, t6, t7, 13
lw t6, 105(sp)
or t4, t6, t4, -13
lw t7, 147(sp)
or.1 s4, a4, t7
add t3, t5, t3
lw t7, 123(sp)
add t5, t3, t7
xor.T t3, s0, t1
lw t6, 138(sp)
add a6, t6, a6
li t7, -184873353
mul t1, s5, t7
add t1, t1, t2
add t6, t1, a7
sw t6, 6(sp)
lw t6, 66(sp)
add t1, t6, t5
lw t6, 159(sp)
add t6, t6, a6
sw t6, 123(sp)
lw t6, 18(sp)
add a6, t6, s1
lw t6, 132(sp)
lw t7, 12(sp)
xor.1 s0, t6, t7
lw t6, 174(sp)
lw t7, 99(sp)
xor.T a7, t6, t7
lw t7, 0(sp)
xor.T t2, s2, t7
li t7, -14779953
mul t6, s3, t7
sw t6, 0(sp)
li t7, 7822332
mul t6, s4, t7
sw t6, 30(sp)
li t7, -174134247
or.T t5, a5, t7
li t7, -28231141
mul t4, t4, t7
li t7, 98839953
mul s1, t2, t7
and.1 a5, a4, t0, 13
li t7, 191445115
mul t6, a7, t7
sw t6, 60(sp)
lw t6, 186(sp)
lw t7, 99(sp)
or s2, t6, t7, -13
lw t6, 183(sp)
lw t7, 174(sp)
xor.T a7, t6, t7
lw t6, 231(sp)
or t0, t6, t3, -13
lw t6, 171(sp)
xor.1 t2, t6, a4
li t7, -46854814
mul s3, t0, t7
or t3, s0, a5, -13
lw t6, 117(sp)
lw t7, 132(sp)
or.T a5, t6, t7
li t7, -20621878
mul t6, a3, t7
sw t6, 12(sp)
lw t6, 54(sp)
lw t7, 114(sp)
or.1 t0, t6, t7
add t4, t4, s3
add t1, s1, t1
and.T s0, s2, t5, -13
li t7, -193118720
mul t5, t3, t7
add a6, a6, t1
li t7, -125190185
mul t3, s0, t7
lw t6, 72(sp)
lw t7, 114(sp)
xor.T s2, t6, t7
lw t6, 75(sp)
lw t7, 96(sp)
or s0, t6, t7, -13
lw t6, 93(sp)
and.T t6, t6, a3, -13
sw t6, 36(sp)
lw t6, 207(sp)
li t7, -174134247
xor.1 t1, t6, t7
lw t6, 27(sp)
add s1, t6, t5
li t7, 103706706
mul t5, s2, t7
lw t7, 162(sp)
and s2, a4, t7, 13
lw t7, 168(sp)
and.1 s5, s0, t7, 13
add t6, t3, t5
sw t6, 27(sp)
lw t6, 174(sp)
lw t7, 24(sp)
or.1 t5, t6, t7
lw t6, 114(sp)
li t7, -174134247
and s3, t6, t7, 13
lw t7, 39(sp)
or.T s6, t1, t7
lw t7, 186(sp)
xor.T s0, t2, t7
lw t6, 90(sp)
li t7, 189689663
mul t3, t6, t7
lw t7, 45(sp)
or.T s4, a4, t7
lw t7, 207(sp)
xor.1 t2, a4, t7
or a4, s5, a4, -13
li t7, 80210504
mul t6, a4, t7
sw t6, 18(sp)
add t4, t4, s1
lw t6, 207(sp)
and.T a4, t6, s6, -13
and a7, s2, a7, 13
li t7, 126835854
mul s1, a7, t7
li t7, -171913975
mul t0, t0, t7
lw t6, 111(sp)
and.T a7, t6, s3, -13
lw t7, 111(sp)
and s3, s4, t7, 13
lw t6, 108(sp)
add s2, t6, t4
and t4, t5, s3, 13
lw t6, 0(sp)
add s1, t6, s1
lw t6, 54(sp)
or.T s0, t6, s0
lw t7, 30(sp)
add s2, s2, t7
xor t5, a5, a4
li t7, 186867534
mul s0, s0, t7
lw t6, 69(sp)
and.1 a5, t6, t1, 13
lw t6, 6(sp)
add s2, t6, s2
lw t6, 207(sp)
li t7, -45398261
xor.T t6, t6, t7
sw t6, 135(sp)
lw t7, 60(sp)
add a4, s1, t7
lw t6, 12(sp)
add t1, t6, s0
add t6, a6, s2
sw t6, 6(sp)
li t7, -150457653
mul a5, a5, t7
add a5, t3, a5
add a5, t0, a5
li t7, 29918073
mul a6, t4, t7
lw t6, 207(sp)
li t7, -45398261
and.T t6, t6, t7, -13
sw t6, 54(sp)
li t7, -85813553
mul t0, t2, t7
lw t6, 177(sp)
or a7, t6, a7, -13
lw t6, 3(sp)
xor.1 t2, t6, t5
lw t6, 93(sp)
or t6, t6, a3, -13
sw t6, 99(sp)
lw t6, 207(sp)
li t7, -45398261
or t6, t6, t7, -13
sw t6, 126(sp)
li t7, -189828750
mul t3, t2, t7
lw t6, 156(sp)
li t7, -101791445
mul t2, t6, t7
lw t6, 207(sp)
lw t7, 93(sp)
or t6, t6, t7, -13
sw t6, 66(sp)
lw t6, 93(sp)
and t6, t6, a3, 13
sw t6, 120(sp)
lw t6, 48(sp)
add t3, t6, t3
add t1, t3, t1
li t7, -104328045
mul a7, a7, t7
add a7, a6, a7
add a6, t0, t2
lw t6, 27(sp)
add t0, t6, t1
lw t6, 120(sp)
lw t7, 54(sp)
xor t1, t6, t7
lw t6, 207(sp)
lw t7, 93(sp)
xor.1 t6, t6, t7
sw t6, 81(sp)
li t7, -23358926
mul t6, t1, t7
sw t6, 105(sp)
lw t7, 18(sp)
add t0, t0, t7
add a4, a4, t0
li t7, -45398261
or t6, a3, t7, -13
sw t6, 24(sp)
lw t6, 126(sp)
lw t7, 81(sp)
and.1 t0, t6, t7, 13
lw t6, 36(sp)
and.1 t0, t6, t0, 13
lw t6, 93(sp)
xor.T t6, t6, a3
sw t6, 69(sp)
add a7, a7, a5
lw t6, 207(sp)
li t7, -45398261
or.T t6, t6, t7
sw t6, 138(sp)
li t7, 2227865
mul a5, t0, t7
lw t6, 207(sp)
li t7, -45398261
and.1 t6, t6, t7, 13
sw t6, 153(sp)
add t1, a4, a7
lw t6, 66(sp)
lw t7, 126(sp)
and.1 a4, t6, t7, 13
lw t6, 153(sp)
lw t7, 24(sp)
and.T t0, t6, t7, -13
lw t7, 153(sp)
xor.1 a7, a3, t7
lw t6, 93(sp)
li t7, -45398261
or.T t6, t6, t7
sw t6, 27(sp)
lw t6, 51(sp)
li t7, 109212734
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 207(sp)
li t7, -45398261
and t6, t6, t7, 13
sw t6, 171(sp)
li t7, -48581107
mul t0, t0, t7
lw t7, 93(sp)
or.T t6, a3, t7
sw t6, 39(sp)
add a6, t1, a6
lw t6, 99(sp)
lw t7, 27(sp)
and t1, t6, t7, 13
li t7, 99363361
mul t1, t1, t7
lw t6, 6(sp)
add a6, t6, a6
add a5, a5, t1
lw t6, 123(sp)
add t6, t6, a6
sw t6, 294(sp)
li t7, -45398261
xor.T t6, a3, t7
sw t6, 150(sp)
lw t6, 138(sp)
lw t7, 21(sp)
xor.1 a6, t6, t7
add t6, a5, t0
sw t6, 6(sp)
lw t7, 69(sp)
and.1 a5, a7, t7, 13
lw t6, 150(sp)
li t7, -45398261
and.T a7, t6, t7, -13
lw t6, 21(sp)
or.1 a7, t6, a7
li t7, 38736197
mul a5, a5, t7
lw t6, 33(sp)
lw t7, 135(sp)
or.1 t1, t6, t7
li t7, -45398261
or.1 t6, a3, t7
sw t6, 60(sp)
lw t6, 171(sp)
lw t7, 57(sp)
or.T t0, t6, t7
lw t6, 33(sp)
and.1 t2, t6, a3, 13
xor t5, a4, a7
lw t6, 207(sp)
li t7, -45398261
xor.1 t6, t6, t7
sw t6, 18(sp)
lw t6, 120(sp)
lw t7, 129(sp)
xor.1 t3, t6, t7
lw t6, 33(sp)
li t7, 33293572
mul a7, t6, t7
lw t6, 207(sp)
li t7, -45398261
xor t6, t6, t7
sw t6, 111(sp)
lw t7, 135(sp)
or.T s0, t1, t7
lw t6, 168(sp)
lw t7, 18(sp)
or.1 t1, t6, t7
lw t6, 93(sp)
xor a4, t6, a3
lw t6, 18(sp)
li t7, 54887633
mul t6, t6, t7
sw t6, 90(sp)
slli a6, a6, 5
or.T t3, t1, t3
li t7, -53149727
mul s1, a4, t7
lw t6, 27(sp)
lw t7, 60(sp)
and t1, t6, t7, 13
lw t6, 174(sp)
lw t7, 111(sp)
and t4, t6, t7, 13
li t7, -83644893
mul t5, t5, t7
li t7, -65689763
mul t6, t2, t7
sw t6, 72(sp)
lw t6, 39(sp)
or.T t2, t6, t0
li t7, 96423451
mul t0, s0, t7
lw t6, 93(sp)
xor.1 t6, t6, a3
sw t6, 48(sp)
add a5, a5, t5
add t0, t0, s1
li t7, -110801249
mul t2, t2, t7
lw t7, 93(sp)
or.1 t6, a3, t7
sw t6, 114(sp)
lw t6, 207(sp)
li t7, -45398261
or.1 t6, t6, t7
sw t6, 156(sp)
lw t6, 129(sp)
lw t7, 207(sp)
xor t6, t6, t7
sw t6, 3(sp)
lw t7, 156(sp)
or.T t5, a3, t7
li t7, 142678232
mul t3, t3, t7
add t6, a5, t0
sw t6, 30(sp)
lw t7, 0(sp)
add a5, t2, t7
li t7, 166627206
mul t6, t4, t7
sw t6, 45(sp)
lw t6, 63(sp)
lw t7, 51(sp)
xor.1 t4, t6, t7
lw t6, 48(sp)
lw t7, 24(sp)
and.1 t2, t6, t7, 13
lw t7, 54(sp)
or.1 s0, a3, t7
add t0, t3, a7
li t7, -19883516
mul t6, s0, t7
sw t6, 96(sp)
li t7, -45398261
and t6, a3, t7, 13
sw t6, 12(sp)
li t7, 92754299
mul a7, t4, t7
lw t6, 207(sp)
lw t7, 93(sp)
xor t6, t6, t7
sw t6, 21(sp)
lw t7, 12(sp)
xor.1 t1, t1, t7
and.1 t3, t1, t5, 13
lw t6, 12(sp)
lw t7, 171(sp)
and.T t1, t6, t7, -13
lw t7, 99(sp)
xor.1 t4, t1, t7
lw t6, 147(sp)
lw t7, 21(sp)
or.T t1, t6, t7
li t7, -189971471
mul t5, t3, t7
li t7, -53038623
mul t3, t4, t7
li t7, 46065158
mul t6, a3, t7
sw t6, 0(sp)
add a6, a6, t5
lw t6, 93(sp)
li t7, -45398261
and t6, t6, t7, 13
sw t6, 123(sp)
add t4, a6, t3
or.T a6, t1, t2
lw t7, 114(sp)
xor.1 a6, a6, t7
lw t6, 93(sp)
lw t7, 207(sp)
and.1 t6, t6, t7, 13
sw t6, 141(sp)
lw t6, 147(sp)
lw t7, 24(sp)
and.1 t2, t6, t7, 13
lw t6, 75(sp)
li t7, 149600249
mul t1, t6, t7
li t7, -45398261
xor t6, a3, t7
sw t6, 180(sp)
li t7, -180089476
mul t3, a6, t7
lw t6, 93(sp)
li t7, -45398261
or.1 t6, t6, t7
sw t6, 177(sp)
lw t6, 123(sp)
li t7, 164071748
mul a6, t6, t7
lw t7, 93(sp)
or.1 t2, t2, t7
lw t6, 114(sp)
lw t7, 141(sp)
or.T s0, t6, t7
lw t6, 123(sp)
lw t7, 60(sp)
or.1 t5, t6, t7
lw t6, 93(sp)
li t7, -45398261
xor t6, t6, t7
sw t6, 132(sp)
li t7, 50903038
mul t2, t2, t7
lw t6, 180(sp)
and.1 s0, t6, s0, 13
add t4, t0, t4
lw t6, 3(sp)
xor t0, t6, s0
lw t7, 177(sp)
xor.1 t5, t5, t7
li t7, -89491730
mul t6, a4, t7
sw t6, 63(sp)
add a4, a5, t4
lw t6, 90(sp)
add a5, t6, a4
li t7, -86244152
mul t6, t5, t7
sw t6, 3(sp)
li t7, -45398261
xor.1 t6, a3, t7
sw t6, 90(sp)
lw t6, 72(sp)
add t3, t6, t3
li t7, 59731495
mul a4, t0, t7
add a7, t3, a7
lw t6, 51(sp)
li t7, -177390193
mul t0, t6, t7
lw t7, 45(sp)
add t3, a5, t7
lw t6, 153(sp)
li t7, -152786985
mul a5, t6, t7
lw t6, 93(sp)
li t7, -45398261
xor.1 t6, t6, t7
sw t6, 72(sp)
lw t6, 93(sp)
lw t7, 207(sp)
or.T t6, t6, t7
sw t6, 144(sp)
lw t6, 48(sp)
lw t7, 132(sp)
and.T t4, t6, t7, -13
add t0, t0, t2
lw t6, 207(sp)
lw t7, 93(sp)
or.1 t6, t6, t7
sw t6, 183(sp)
li t7, 62975198
mul t4, t4, t7
add t0, t0, t1
lw t6, 30(sp)
add t1, t6, t3
lw t6, 183(sp)
lw t7, 90(sp)
and.1 t2, t6, t7, 13
add a7, t1, a7
lw t6, 150(sp)
slli t1, t6, 7
add a4, a7, a4
lw t6, 6(sp)
add t6, t6, a4
sw t6, 159(sp)
lw t6, 0(sp)
add a7, t6, t4
add t1, t1, a5
lw t6, 93(sp)
lw t7, 18(sp)
and a5, t6, t7, 13
lw t6, 93(sp)
and.1 a4, t6, a3, 13
lw t6, 93(sp)
li t7, -45398261
or t6, t6, t7, -13
sw t6, 162(sp)
add a6, a6, a7
lw t6, 162(sp)
or.T a7, t6, a3
lw t6, 144(sp)
xor t6, t6, a4
sw t6, 117(sp)
lw t7, 72(sp)
xor t3, a4, t7
lw t6, 96(sp)
add t6, t6, a6
sw t6, 6(sp)
lw t7, 21(sp)
and.1 t4, a7, t7, 13
lw t6, 93(sp)
lw t7, 171(sp)
or.T a6, t6, t7
lw t6, 129(sp)
xor.1 a7, t6, a4
lw t6, 93(sp)
lw t7, 90(sp)
and t5, t6, t7, 13
xor.T t2, t2, t3
lw t6, 126(sp)
lw t7, 90(sp)
and t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 18(sp)
lw t7, 180(sp)
xor.T s1, t6, t7
li t7, -94984379
mul t2, t2, t7
add t6, t0, t2
sw t6, 0(sp)
lw t6, 183(sp)
lw t7, 93(sp)
xor.T t3, t6, t7
lw t6, 114(sp)
lw t7, 177(sp)
xor t2, t6, t7
lw t6, 93(sp)
lw t7, 156(sp)
xor.1 s0, t6, t7
lw t6, 117(sp)
xor t0, t6, t4
li t7, -178515617
mul t0, t0, t7
lw t6, 33(sp)
lw t7, 39(sp)
xor.T t4, t6, t7
and.T t5, s1, t5, -13
add t0, t1, t0
lw t6, 129(sp)
lw t7, 207(sp)
and.T t1, t6, t7, -13
lw t6, 150(sp)
xor.T s1, t6, t4
xor.T t4, t5, a5
li t7, -122801909
mul t6, s1, t7
sw t6, 96(sp)
li t7, -168810460
mul t2, t2, t7
li t7, 11139526
mul t5, s0, t7
lw t7, 171(sp)
xor.1 s1, a3, t7
lw t6, 33(sp)
li t7, -101688103
mul a5, t6, t7
and s0, a6, t4, 13
li t7, 109495926
mul a6, s1, t7
lw t6, 93(sp)
li t7, -45398261
and.T t6, t6, t7, -13
sw t6, 108(sp)
lw t6, 72(sp)
lw t7, 12(sp)
xor.T t4, t6, t7
li t7, -27661574
mul s1, s0, t7
xor.T s0, t3, a7
lw t6, 108(sp)
and.1 t3, t6, a3, 13
lw t6, 93(sp)
li t7, -45398261
and.1 a7, t6, t7, 13
li t7, 153699591
mul s0, s0, t7
li t7, 6156959
mul t1, t1, t7
add s1, s1, t5
lw t6, 99(sp)
xor a7, t6, a7
li t7, -136420675
mul a7, a7, t7
li t7, -133493183
mul t5, t3, t7
add s1, t0, s1
li t7, -45398261
or.T t6, a3, t7
sw t6, 30(sp)
lw t6, 93(sp)
lw t7, 207(sp)
and.T t6, t6, t7, -13
sw t6, 99(sp)
li t7, -48509379
mul t0, a3, t7
lw t6, 168(sp)
lw t7, 93(sp)
xor t3, t6, t7
add t2, t2, t5
lw t6, 120(sp)
li t7, 99519866
mul t5, t6, t7
add s2, s1, s0
lw t6, 99(sp)
lw t7, 72(sp)
or s1, t6, t7, -13
li t7, -55074587
mul t4, t4, t7
add s0, t4, t2
lw t6, 27(sp)
lw t7, 30(sp)
and.1 t2, t6, t7, 13
lw t6, 3(sp)
add t4, t6, s2
li t7, 14362193
mul t2, t2, t7
lw t6, 0(sp)
add t4, t6, t4
lw t6, 63(sp)
add t4, t6, t4
lw t6, 45(sp)
xor.1 s1, t6, s1
li t7, 64770475
mul s1, s1, t7
lw t6, 6(sp)
add t4, t6, t4
li t7, -45398261
and.T t6, a3, t7, -13
sw t6, 6(sp)
add s0, a6, s0
add t1, t1, s1
li t7, 133793522
mul t3, t3, t7
lw t6, 36(sp)
li t7, 100359230
mul a6, t6, t7
add t6, t5, a5
sw t6, 3(sp)
lw t6, 54(sp)
lw t7, 150(sp)
or.1 a5, t6, t7
lw t7, 177(sp)
and a5, a5, t7, 13
lw t6, 96(sp)
add t5, t6, s0
li t7, -190709250
mul a5, a5, t7
add a7, a7, t1
lw t6, 99(sp)
lw t7, 168(sp)
xor.T t1, t6, t7
add a7, a7, t0
add a5, a5, t2
lw t6, 159(sp)
add t0, t6, t4
lw t6, 105(sp)
add t0, t6, t0
add a5, a5, t3
add t0, t0, t5
add t6, t0, a7
sw t6, 63(sp)
lw t6, 162(sp)
li t7, 92916843
mul t0, t6, t7
li t7, -45398261
and.1 t6, a3, t7, 13
sw t6, 45(sp)
lw t6, 36(sp)
lw t7, 45(sp)
xor t2, t6, t7
lw t6, 48(sp)
lw t7, 33(sp)
or.1 t3, t6, t7
lw t7, 231(sp)
or a7, a4, t7, -13
li t7, 12985045
mul t3, t3, t7
lw t7, 108(sp)
xor.1 t4, a4, t7
li t7, 164479163
mul t5, t1, t7
lw t6, 150(sp)
and.1 t1, t6, t4, 13
lw t6, 144(sp)
or t4, t6, a3, -13
xor t4, t4, a3
add t3, t3, t5
lw t6, 207(sp)
lw t7, 93(sp)
xor.T t6, t6, t7
sw t6, 96(sp)
lw t6, 174(sp)
lw t7, 108(sp)
xor s0, t6, t7
li t7, 57326712
mul t2, t2, t7
lw t6, 162(sp)
lw t7, 174(sp)
xor.1 s2, t6, t7
add s1, t2, t0
lw t6, 150(sp)
lw t7, 183(sp)
or.1 t2, t6, t7
lw t6, 132(sp)
lw t7, 96(sp)
and.1 t5, t6, t7, 13
li t7, -75294054
mul s3, t1, t7
or t1, s2, s0, -13
li t7, 66701313
mul t0, t4, t7
lw t6, 207(sp)
lw t7, 54(sp)
xor.1 s0, t6, t7
add t4, t3, s1
add a6, s3, a6
li t7, 47876231
mul s0, s0, t7
li t7, -190806395
mul s1, a4, t7
lw t7, 21(sp)
or.T a4, t5, t7
lw t6, 93(sp)
lw t7, 180(sp)
and t3, t6, t7, 13
lw t7, 231(sp)
or t5, a4, t7, -13
add a4, a5, t4
lw t6, 114(sp)
li t7, -45398261
or.1 t6, t6, t7
sw t6, 0(sp)
add a5, s0, s1
lw t6, 6(sp)
and t4, t6, t2, 13
lw t6, 51(sp)
li t7, -45398261
and t2, t6, t7, 13
and.T a7, t5, a7, -13
li t7, -167978967
mul t5, t4, t7
slli s0, a7, 3
lw t7, 81(sp)
xor.1 t4, t3, t7
slli a7, t1, 6
xor t1, a3, t2
add t5, s0, t5
lw t6, 132(sp)
lw t7, 12(sp)
or.T t2, t6, t7
lw t6, 120(sp)
li t7, -130744409
mul t3, t6, t7
li t7, -37128002
mul t4, t4, t7
add a6, a6, t5
add t6, a4, a6
sw t6, 36(sp)
add a4, a7, a5
lw t6, 90(sp)
li t7, 27174817
mul a7, t6, t7
add a4, t0, a4
li t7, -159845192
add t6, a4, t7
sw t6, 48(sp)
lw t6, 111(sp)
lw t7, 18(sp)
or a4, t6, t7, -13
lw t6, 123(sp)
lw t7, 66(sp)
and.1 a6, t6, t7, 13
lw t6, 27(sp)
lw t7, 183(sp)
xor.T t0, t6, t7
and t2, a4, t2, 13
lw t6, 114(sp)
or a4, t6, t1, -13
add a5, t4, t3
li t7, -79700097
mul a4, a4, t7
add a5, a4, a5
lw t6, 138(sp)
lw t7, 93(sp)
xor t3, t6, t7
lw t6, 24(sp)
li t7, -45398261
or.1 t4, t6, t7
lw t6, 33(sp)
lw t7, 96(sp)
or t1, t6, t7, -13
lw t6, 81(sp)
lw t7, 75(sp)
xor.T a4, t6, t7
lw t6, 123(sp)
lw t7, 75(sp)
xor.T t5, t6, t7
lw t6, 12(sp)
lw t7, 129(sp)
or s1, t6, t7, -13
lw t6, 93(sp)
or.1 t1, t6, t1
li t7, 184981455
mul s2, t1, t7
lw t6, 6(sp)
lw t7, 69(sp)
or.1 t1, t6, t7
lw t6, 129(sp)
lw t7, 39(sp)
xor s0, t6, t7
and t2, t2, s1, 13
lw t6, 30(sp)
lw t7, 231(sp)
or s1, t6, t7, -13
li t7, -31062148
mul s3, t2, t7
li t7, -169612184
mul t2, t3, t7
li t7, 49150456
mul t3, t4, t7
add a7, s3, a7
add a7, a7, s2
lw t7, 231(sp)
and t4, t5, t7, 13
lw t7, 171(sp)
or t4, t4, t7, -13
and.1 t0, t0, t4, 13
li t7, -1721332
mul t5, t0, t7
li t7, -121237984
mul t0, s0, t7
lw t7, 174(sp)
and s0, s1, t7, 13
lw t6, 30(sp)
li t7, 133918353
mul t4, t6, t7
and.1 a6, a6, s0, 13
add t3, t5, t3
add t3, a7, t3
lw t6, 0(sp)
lw t7, 147(sp)
and.T a7, t6, t7, -13
lw t7, 60(sp)
xor a6, a6, t7
and.T t1, a6, t1, -13
add a6, t2, t4
li t7, -90705987
mul t1, t1, t7
add a5, a5, t3
lw t6, 27(sp)
lw t7, 207(sp)
and t2, t6, t7, 13
lw t6, 48(sp)
add a5, t6, a5
lw t6, 90(sp)
or.1 t3, t6, t2
lw t6, 93(sp)
lw t7, 207(sp)
and t5, t6, t7, 13
add t0, a6, t0
lw t6, 150(sp)
li t7, -45398261
or t4, t6, t7, -13
lw t6, 66(sp)
lw t7, 27(sp)
or.T a6, t6, t7
lw t6, 99(sp)
lw t7, 114(sp)
or t2, t6, t7, -13
and a4, t5, a4, 13
or.T a4, a4, t3
li t7, -75203710
mul t3, a4, t7
lw t6, 27(sp)
lw t7, 183(sp)
and.T a4, t6, t7, -13
xor.T a4, t4, a4
li t7, 97132406
mul a4, a4, t7
add t3, t1, t3
lw t6, 69(sp)
lw t7, 156(sp)
xor.1 t1, t6, t7
add t0, t0, t3
lw t7, 183(sp)
and.1 t2, t2, t7, 13
lw t6, 39(sp)
lw t7, 30(sp)
and.T t4, t6, t7, -13
lw t6, 120(sp)
lw t7, 129(sp)
xor t3, t6, t7
li t7, 171525707
mul t5, t2, t7
li t7, 43986068
mul s0, t4, t7
lw t6, 72(sp)
xor.T s1, t6, a3
lw t6, 177(sp)
lw t7, 99(sp)
and.T t2, t6, t7, -13
li t7, -16718043
mul a7, a7, t7
lw t6, 18(sp)
lw t7, 72(sp)
or.T t4, t6, t7
li t7, 63325354
mul s1, s1, t7
add s0, s1, s0
add a4, a4, s0
add s0, a7, t5
lw t6, 93(sp)
or.T a7, t6, t3
lw t6, 126(sp)
li t7, -158575612
mul t3, t6, t7
lw t6, 39(sp)
or t5, t6, t1, -13
lw t6, 51(sp)
lw t7, 18(sp)
xor t1, t6, t7
add s0, t0, s0
lw t6, 93(sp)
xor.1 t0, t6, t4
add a5, a5, s0
lw t6, 36(sp)
add a5, t6, a5
or.1 a6, a6, t2
li t7, 2644311
mul t0, t0, t7
add t2, t0, t3
li t7, -3159773
mul t0, t5, t7
li t7, 74765346
mul t3, a6, t7
lw t6, 96(sp)
xor.1 a6, t6, a3
or.T a7, a7, t1
li t7, 169283747
mul t1, a7, t7
lw t7, 150(sp)
xor.1 a6, a6, t7
lw t6, 156(sp)
lw t7, 120(sp)
xor a7, t6, t7
add t1, t3, t1
add t1, t2, t1
add a4, a4, t1
add a4, a4, t0
lw t6, 27(sp)
lw t7, 141(sp)
and.T t0, t6, t7, -13
lw t6, 75(sp)
lw t7, 57(sp)
xor.1 t2, t6, t7
li t7, -100418275
mul t1, a7, t7
add a7, a5, a4
lw t6, 117(sp)
lw t7, 114(sp)
xor.T a4, t6, t7
lw t6, 114(sp)
lw t7, 147(sp)
or.1 t3, t6, t7
xor.T a5, t0, t2
li t7, -34430951
mul a5, a5, t7
add a5, t1, a5
li t7, -172489558
mul a6, a6, t7
lw t7, 231(sp)
or t0, t3, t7, -13
lw t6, 3(sp)
add a7, t6, a7
li t7, -22353535
mul t0, t0, t7
lw t6, 54(sp)
li t7, -45398261
xor t1, t6, t7
lw t6, 66(sp)
lw t7, 147(sp)
or.1 t2, t6, t7
xor.T t1, t1, t2
add a6, a6, t0
lw t6, 90(sp)
or t0, t6, t1, -13
add t6, a7, a5
sw t6, 3(sp)
li t7, -46658236
mul a4, a4, t7
li t7, -124157327
mul a5, t0, t7
add t6, a6, a4
sw t6, 36(sp)
lw t6, 135(sp)
lw t7, 24(sp)
xor.T a7, t6, t7
lw t6, 207(sp)
lw t7, 120(sp)
or.1 a4, t6, t7
lw t6, 93(sp)
lw t7, 174(sp)
and a6, t6, t7, 13
lw t7, 66(sp)
and.T a6, a6, t7, -13
li t7, -40454158
mul a6, a6, t7
add a6, a5, a6
lw t6, 231(sp)
and t1, t6, a3, 13
li t7, -108739545
mul a5, a7, t7
lw t6, 180(sp)
lw t7, 93(sp)
xor t0, t6, t7
li t7, -45398261
or a7, t1, t7, -13
li t7, 126736892
mul t1, a7, t7
lw t6, 129(sp)
lw t7, 45(sp)
or.T a7, t6, t7
add t1, t1, a5
li t7, 117072820
mul a5, t0, t7
add t6, a6, t1
sw t6, 0(sp)
li t7, 22539565
mul a4, a4, t7
lw t6, 12(sp)
lw t7, 57(sp)
xor.1 t1, t6, t7
lw t6, 123(sp)
lw t7, 153(sp)
xor.T t0, t6, t7
lw t6, 135(sp)
lw t7, 162(sp)
xor t2, t6, t7
lw t6, 132(sp)
li t7, -185647157
mul a6, t6, t7
lw t6, 93(sp)
xor t1, t6, t1
or a7, a7, t2, -13
lw t6, 15(sp)
li t7, 128084995
xor.T t6, t6, t7
sw t6, 24(sp)
li t7, 97136151
mul t2, a7, t7
li t7, -107851166
mul a7, t1, t7
lw t6, 75(sp)
lw t7, 33(sp)
and.1 t1, t6, t7, 13
add a5, a5, t2
xor.T t0, t0, t1
li t7, -145473089
mul t0, t0, t7
add a5, a5, a7
add a6, a6, t0
add a6, a5, a6
lw t6, 30(sp)
li t7, 81373059
mul a5, t6, t7
lw t6, 27(sp)
and.1 a7, t6, a3, 13
add a4, a4, a6
lw t6, 15(sp)
li t7, 128084995
and.1 t6, t6, t7, 13
sw t6, 33(sp)
lw t6, 21(sp)
lw t7, 93(sp)
xor.T t0, t6, t7
lw t6, 150(sp)
lw t7, 18(sp)
xor.T a6, t6, t7
lw t6, 99(sp)
xor a7, t6, a7
lw t6, 6(sp)
lw t7, 108(sp)
xor t1, t6, t7
lw t7, 141(sp)
or.1 t1, t1, t7
lw t6, 231(sp)
and t0, t6, t0, 13
and.1 a7, a7, t1, 13
li t7, 95589993
mul a7, a7, t7
lw t6, 294(sp)
lw t7, 294(sp)
xor t6, t6, t7
sw t6, 204(sp)
xor.T a6, a6, t0
li t7, 107359356
mul a6, a6, t7
lw t6, 84(sp)
lw t7, 84(sp)
xor t6, t6, t7
sw t6, 147(sp)
add a6, a7, a6
lw t6, 249(sp)
li t7, 128084995
or t6, t6, t7, -13
sw t6, 60(sp)
lw t6, 15(sp)
li t7, 128084995
and t6, t6, t7, 13
sw t6, 21(sp)
add a5, a5, a6
add a4, a4, a5
lw t6, 249(sp)
li t7, 128084995
xor.1 t6, t6, t7
sw t6, 144(sp)
lw t6, 21(sp)
lw t7, 144(sp)
or t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 0(sp)
add a4, t6, a4
lw t6, 36(sp)
add a4, t6, a4
lw t6, 249(sp)
li t7, 128084995
and t6, t6, t7, 13
sw t6, 108(sp)
lw t6, 3(sp)
add a4, t6, a4
lw t6, 63(sp)
add t6, t6, a4
sw t6, 126(sp)
lw t6, 294(sp)
lw t7, 126(sp)
xor t6, t6, t7
sw t6, 234(sp)
lw t6, 234(sp)
lw t7, 234(sp)
xor t6, t6, t7
sw t6, 174(sp)
lw t6, 84(sp)
lw t7, 234(sp)
xor a4, t6, t7
lw t6, 234(sp)
lw t7, 294(sp)
and.1 t6, t6, t7, 13
sw t6, 45(sp)
lw t6, 294(sp)
lw t7, 234(sp)
and t6, t6, t7, 13
sw t6, 252(sp)
lw t6, 294(sp)
lw t7, 234(sp)
and.T t6, t6, t7, -13
sw t6, 171(sp)
lw t6, 234(sp)
lw t7, 294(sp)
or t6, t6, t7, -13
sw t6, 282(sp)
lw t6, 294(sp)
lw t7, 234(sp)
xor.1 t6, t6, t7
sw t6, 198(sp)
lw t6, 294(sp)
lw t7, 234(sp)
or.1 t6, t6, t7
sw t6, 225(sp)
lw t6, 15(sp)
lw t7, 249(sp)
and t6, t6, t7, 13
sw t6, 132(sp)
li t7, 156242436
or.1 a5, a4, t7
xor t6, a4, a4
sw t6, 69(sp)
li t7, 156242436
xor.T a6, a4, t7
lw t6, 126(sp)
lw t7, 126(sp)
xor t6, t6, t7
sw t6, 39(sp)
lw t6, 294(sp)
lw t7, 234(sp)
xor.T t6, t6, t7
sw t6, 27(sp)
lw t6, 15(sp)
xor t6, t6, a4
sw t6, 219(sp)
lw t6, 294(sp)
lw t7, 234(sp)
or.T t6, t6, t7
sw t6, 120(sp)
lw t6, 294(sp)
lw t7, 234(sp)
xor t6, t6, t7
sw t6, 291(sp)
xor t6, a5, a6
sw t6, 81(sp)
lw t6, 219(sp)
lw t7, 60(sp)
and t6, t6, t7, 13
sw t6, 0(sp)
li t7, 128084995
xor t6, a4, t7
sw t6, 138(sp)
li t7, 156242436
xor t6, a4, t7
sw t6, 57(sp)
lw t6, 15(sp)
xor.1 t6, t6, a4
sw t6, 6(sp)
lw t7, 15(sp)
or.1 t6, a4, t7
sw t6, 36(sp)
lw t6, 144(sp)
li t7, -55081178
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 249(sp)
xor t6, t6, a4
sw t6, 93(sp)
lw t6, 36(sp)
lw t7, 108(sp)
and.T a5, t6, t7, -13
li t7, 128084995
xor.T t6, a4, t7
sw t6, 54(sp)
li t7, 128084995
or.T t6, a4, t7
sw t6, 192(sp)
lw t7, 15(sp)
and.1 t6, a4, t7, 13
sw t6, 210(sp)
lw t6, 15(sp)
lw t7, 249(sp)
or t6, t6, t7, -13
sw t6, 105(sp)
lw t7, 15(sp)
or.T t6, a4, t7
sw t6, 177(sp)
lw t6, 105(sp)
lw t7, 24(sp)
or.T a6, t6, t7
li t7, 189957747
mul t0, a5, t7
lw t6, 138(sp)
li t7, 128084995
or.1 a5, t6, t7
li t7, -122855931
mul t6, a5, t7
sw t6, 12(sp)
lw t6, 60(sp)
lw t7, 132(sp)
or.1 a5, t6, t7
lw t7, 249(sp)
and.T t6, a4, t7, -13
sw t6, 75(sp)
lw t6, 249(sp)
li t7, 128084995
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 36(sp)
li t7, -166410580
mul t6, t6, t7
sw t6, 63(sp)
li t7, 128084995
xor.1 t6, a4, t7
sw t6, 135(sp)
li t7, 128084995
and.1 t6, a4, t7, 13
sw t6, 66(sp)
lw t6, 108(sp)
lw t7, 192(sp)
xor.1 a7, t6, t7
lw t7, 249(sp)
xor.T t6, a4, t7
sw t6, 99(sp)
lw t6, 15(sp)
lw t7, 99(sp)
and.T t2, t6, t7, -13
lw t6, 54(sp)
or.1 t1, t6, a7
lw t6, 135(sp)
lw t7, 165(sp)
or.T a7, t6, t7
lw t6, 132(sp)
lw t7, 66(sp)
or.T t3, t6, t7
lw t7, 249(sp)
or t6, a4, t7, -13
sw t6, 186(sp)
li t7, -42448034
mul a5, a5, t7
lw t6, 33(sp)
lw t7, 135(sp)
and.1 t4, t6, t7, 13
lw t7, 30(sp)
or.T t4, t4, t7
lw t7, 15(sp)
or t6, a4, t7, -13
sw t6, 117(sp)
lw t6, 249(sp)
lw t7, 15(sp)
and.1 t6, t6, t7, 13
sw t6, 168(sp)
lw t6, 93(sp)
li t7, 26058614
mul t6, t6, t7
sw t6, 30(sp)
lw t7, 6(sp)
and t2, t2, t7, 13
lw t7, 186(sp)
or.1 t2, t2, t7
li t7, 598212
mul t5, t1, t7
li t7, -65256413
mul t1, t2, t7
lw t7, 249(sp)
xor t2, a6, t7
li t7, 161971801
mul a6, t3, t7
lw t6, 24(sp)
and t3, t6, t4, 13
add t4, t5, t0
lw t6, 93(sp)
lw t7, 18(sp)
xor s0, t6, t7
lw t6, 168(sp)
li t7, -160063551
mul t6, t6, t7
sw t6, 114(sp)
lw t6, 15(sp)
and t6, t6, a4, 13
sw t6, 228(sp)
lw t6, 177(sp)
li t7, -105792500
mul t0, t6, t7
lw t6, 210(sp)
lw t7, 66(sp)
and.T t5, t6, t7, -13
li t7, -39845580
mul s0, s0, t7
lw t6, 192(sp)
lw t7, 117(sp)
xor.1 s2, t6, t7
lw t6, 0(sp)
or.1 s3, t6, t3
lw t6, 228(sp)
li t7, 128084995
xor s1, t6, t7
lw t6, 165(sp)
lw t7, 228(sp)
or.1 t3, t6, t7
slli s3, s3, 3
lw t7, 168(sp)
or.T t5, t5, t7
xor s2, t2, s2
add t2, s3, t4
add s0, t1, s0
li t7, 175894504
mul t1, a7, t7
li t7, 128084995
and t6, a4, t7, 13
sw t6, 33(sp)
lw t6, 75(sp)
or.1 a7, t6, s1
xor.1 t4, s2, a7
lw t6, 12(sp)
add a7, t6, s0
lw t6, 102(sp)
lw t7, 165(sp)
xor.1 s0, t6, t7
lw t7, 249(sp)
or.1 t5, t5, t7
add a5, a5, a7
lw t6, 15(sp)
li t7, 162445217
mul a7, t6, t7
lw t6, 249(sp)
or t3, t6, t3, -13
lw t6, 15(sp)
li t7, 128084995
xor t6, t6, t7
sw t6, 51(sp)
add t6, t2, a5
sw t6, 90(sp)
li t7, -121341293
mul t2, s0, t7
lw t6, 33(sp)
lw t7, 6(sp)
xor.1 a5, t6, t7
lw t6, 210(sp)
xor.T t3, t6, t3
li t7, 104889905
mul t5, t5, t7
add t2, t0, t2
li t7, -75609185
mul t0, t4, t7
add a6, t5, a6
add t1, t0, t1
lw t6, 33(sp)
lw t7, 42(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
lw t6, 168(sp)
xor.T t3, t6, t3
lw t6, 105(sp)
lw t7, 18(sp)
xor.1 t0, t6, t7
li t7, -43712358
mul t3, t3, t7
lw t6, 15(sp)
li t7, 128084995
or.1 t6, t6, t7
sw t6, 48(sp)
li t7, 128084995
and.T t6, a4, t7, -13
sw t6, 162(sp)
lw t6, 249(sp)
or.1 t6, t6, a4
sw t6, 153(sp)
lw t6, 222(sp)
lw t7, 69(sp)
xor.1 t4, t6, t7
lw t6, 186(sp)
lw t7, 249(sp)
or.T t6, t6, t7
sw t6, 72(sp)
li t7, 59155344
mul t4, t4, t7
add t1, a6, t1
lw t7, 249(sp)
xor.1 t6, a4, t7
sw t6, 0(sp)
lw t6, 15(sp)
li t7, 128084995
and.T t6, t6, t7, -13
sw t6, 183(sp)
lw t6, 135(sp)
lw t7, 183(sp)
xor.T t5, t6, t7
li t7, 128084995
or t6, a4, t7, -13
sw t6, 96(sp)
lw t7, 249(sp)
and t6, a4, t7, 13
sw t6, 123(sp)
add t2, t2, t4
lw t7, 30(sp)
add a6, a7, t7
lw t7, 42(sp)
or.1 s0, t5, t7
lw t6, 177(sp)
andi a7, t6, 0
lw t6, 153(sp)
lw t7, 48(sp)
and t4, t6, t7, 13
lw t6, 15(sp)
li t7, 128084995
or t6, t6, t7, -13
sw t6, 30(sp)
lw t6, 108(sp)
lw t7, 30(sp)
or.1 t5, t6, t7
lw t7, 63(sp)
add s1, t3, t7
lw t7, 165(sp)
xor t5, t5, t7
and.T t3, t0, s0, -13
add t2, s1, t2
lw t6, 0(sp)
or t0, t6, a4, -13
lw t6, 249(sp)
li t7, 128084995
or.T t6, t6, t7
sw t6, 216(sp)
lw t6, 3(sp)
add s0, t6, t2
lw t6, 144(sp)
li t7, 128084995
or t2, t6, t7, -13
lw t6, 249(sp)
lw t7, 15(sp)
xor.1 t6, t6, t7
sw t6, 141(sp)
add t6, t1, s0
sw t6, 156(sp)
xor.1 a5, a5, t4
lw t6, 6(sp)
lw t7, 123(sp)
xor t1, t6, t7
lw t6, 15(sp)
lw t7, 162(sp)
or.1 t6, t6, t7
sw t6, 111(sp)
or.1 t0, a4, t0
li t7, 158151649
mul t5, t5, t7
lw t6, 153(sp)
lw t7, 6(sp)
and s0, t6, t7, 13
li t7, -83096556
mul t4, t1, t7
lw t6, 36(sp)
li t7, 128084995
xor.T s1, t6, t7
add t5, a6, t5
lw t6, 201(sp)
or.1 t1, t6, a7
li t7, -157026104
mul a7, t3, t7
lw t6, 24(sp)
li t7, 117944554
mul a6, t6, t7
li t7, -173423510
mul t1, t1, t7
lw t6, 192(sp)
li t7, -44110852
mul t6, t6, t7
sw t6, 24(sp)
lw t6, 21(sp)
lw t7, 216(sp)
or.1 t3, t6, t7
li t7, -111063938
mul s2, t3, t7
lw t7, 51(sp)
or.T t3, t2, t7
add a7, a7, s2
xor.T t2, s0, s1
li t7, -74594202
mul t2, t2, t7
lw t6, 249(sp)
li t7, 128084995
xor.T t6, t6, t7
sw t6, 3(sp)
add s0, t2, t4
lw t6, 168(sp)
lw t7, 6(sp)
or.1 t2, t6, t7
add a7, t5, a7
lw t7, 183(sp)
or.T s1, t2, t7
lw t6, 228(sp)
or.1 t5, t6, t0
lw t6, 51(sp)
li t7, 33015366
mul t4, t6, t7
lw t6, 78(sp)
lw t7, 108(sp)
or.1 t2, t6, t7
lw t6, 96(sp)
lw t7, 183(sp)
and.1 s2, t6, t7, 13
lw t6, 114(sp)
add t0, t6, s0
li t7, 189496658
mul s0, s1, t7
lw t6, 93(sp)
li t7, 96071321
mul t6, t6, t7
sw t6, 129(sp)
lw t6, 153(sp)
li t7, 10879720
mul t6, t6, t7
sw t6, 63(sp)
li t7, 128084995
or.1 t6, a4, t7
sw t6, 102(sp)
lw t6, 42(sp)
lw t7, 102(sp)
xor.T s1, t6, t7
lw t6, 6(sp)
xor.T s3, t6, s2
add s0, s0, t1
xor.1 a5, t3, a5
and s2, a5, t5, 13
lw t6, 141(sp)
lw t7, 18(sp)
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 102(sp)
li t7, 148029057
mul t6, t6, t7
sw t6, 114(sp)
li t7, -47504872
mul t5, s3, t7
li t7, -2480403
mul t6, a4, t7
sw t6, 150(sp)
lw t6, 111(sp)
li t7, -31555235
mul t1, t6, t7
lw t6, 177(sp)
lw t7, 3(sp)
or a5, t6, t7, -13
lw t6, 231(sp)
or t3, t6, s1, -13
li t7, -150957956
mul s2, s2, t7
add s1, t4, a6
lw t6, 141(sp)
lw t7, 48(sp)
or t4, t6, t7, -13
lw t7, 15(sp)
xor.T t6, a4, t7
sw t6, 189(sp)
add s2, s2, s0
lw t7, 93(sp)
and s0, t2, t7, 13
lw t6, 249(sp)
li t7, -192648246
mul a6, t6, t7
add t2, s2, s1
add a7, a7, t2
lw t6, 156(sp)
add a7, t6, a7
lw t6, 60(sp)
lw t7, 189(sp)
and t2, t6, t7, 13
lw t6, 24(sp)
add t6, t6, t5
sw t6, 213(sp)
add a7, a7, t0
lw t6, 90(sp)
add t6, t6, a7
sw t6, 111(sp)
lw t7, 249(sp)
or.T t6, a4, t7
sw t6, 24(sp)
lw t6, 168(sp)
xor t4, t6, t4
lw t6, 117(sp)
lw t7, 51(sp)
xor t5, t6, t7
li t7, -179664428
mul a7, s0, t7
li t7, 34983770
mul t6, t3, t7
sw t6, 159(sp)
add a7, a7, t1
lw t6, 249(sp)
li t7, -158498340
mul s0, t6, t7
lw t6, 6(sp)
lw t7, 30(sp)
and t1, t6, t7, 13
lw t7, 15(sp)
and.T t0, a4, t7, -13
lw t7, 78(sp)
xor.T t0, t0, t7
li t7, -56088394
mul t3, t5, t7
lw t7, 72(sp)
or s1, t1, t7, -13
lw t6, 69(sp)
lw t7, 60(sp)
and t6, t6, t7, 13
sw t6, 195(sp)
lw t6, 168(sp)
lw t7, 249(sp)
or t1, t6, t7, -13
lw t6, 123(sp)
lw t7, 132(sp)
or.T t5, t6, t7
lw t7, 60(sp)
or.1 a5, a5, t7
lw t6, 66(sp)
lw t7, 30(sp)
or t6, t6, t7, -13
sw t6, 90(sp)
xor t2, t4, t2
lw t6, 249(sp)
or.1 t4, t6, s1
li t7, 15315707
mul t4, t4, t7
add s1, s0, a6
lw t6, 180(sp)
li t7, -141043032
mul a6, t6, t7
li t7, 191732122
mul s0, t2, t7
li t7, 150323151
add t2, t4, t7
li t7, 128084995
and.T a5, a5, t7, -13
lw t6, 12(sp)
xor.1 a5, t6, a5
li t7, 143866212
mul t4, a5, t7
add t6, s1, t3
sw t6, 12(sp)
lw t6, 42(sp)
lw t7, 24(sp)
or.T s1, t6, t7
lw t6, 249(sp)
lw t7, 51(sp)
xor s2, t6, t7
li t7, 260534
mul a5, t5, t7
li t7, -4475928
mul t1, t1, t7
add t3, t2, a7
xor.1 t2, s2, s1
lw t6, 96(sp)
li t7, 157624213
mul t6, t6, t7
sw t6, 156(sp)
li t7, -103446526
mul t6, t0, t7
sw t6, 48(sp)
lw t6, 201(sp)
lw t7, 210(sp)
xor t5, t6, t7
add t1, t1, s0
lw t6, 183(sp)
li t7, -57001942
mul t6, t6, t7
sw t6, 72(sp)
lw t6, 3(sp)
li t7, -4721410
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 138(sp)
and.1 a7, t6, a4, 13
lw t6, 96(sp)
li t7, -21107552
mul s0, t6, t7
lw t6, 213(sp)
add t0, t6, t4
lw t6, 216(sp)
lw t7, 15(sp)
or t6, t6, t7, -13
sw t6, 132(sp)
lw t6, 0(sp)
lw t7, 210(sp)
xor s1, t6, t7
lw t6, 144(sp)
lw t7, 231(sp)
and t6, t6, t7, 13
sw t6, 180(sp)
lw t6, 15(sp)
li t7, 128084995
xor.1 t6, t6, t7
sw t6, 138(sp)
lw t7, 54(sp)
xor.1 s2, t5, t7
lw t6, 129(sp)
add s0, t6, s0
lw t6, 177(sp)
lw t7, 102(sp)
xor t4, t6, t7
lw t6, 123(sp)
lw t7, 216(sp)
xor.1 s3, t6, t7
add t1, a6, t1
li t7, 90139486
mul s1, s1, t7
lw t6, 135(sp)
li t7, -68435428
mul a6, t6, t7
lw t6, 114(sp)
add s4, t6, t1
lw t6, 201(sp)
li t7, 47010932
mul t1, t6, t7
lw t6, 195(sp)
lw t7, 168(sp)
and t5, t6, t7, 13
add t3, t3, s4
and s3, s3, s2, 13
li t7, -166396537
mul t2, t2, t7
lw t6, 159(sp)
add s0, t6, s0
add t0, t0, s0
lw t6, 63(sp)
add s2, t6, t3
li t7, 66465048
mul t3, s3, t7
add t3, t3, s1
add a5, a5, t2
lw t6, 150(sp)
add a5, t6, a5
lw t6, 249(sp)
and.T s0, t6, t4, -13
add t0, t0, s2
lw t6, 111(sp)
add t0, t6, t0
lw t6, 12(sp)
add t2, t6, a5
lw t6, 75(sp)
and.T a5, t6, a7, -13
lw t6, 228(sp)
xor.1 a5, t6, a5
lw t7, 165(sp)
xor a7, t5, t7
lw t7, 108(sp)
xor.T t4, a4, t7
lw t6, 249(sp)
li t7, 128084995
xor t6, t6, t7
sw t6, 63(sp)
lw t6, 249(sp)
li t7, 128084995
and.1 t6, t6, t7, 13
sw t6, 114(sp)
lw t7, 249(sp)
xor.1 t4, t4, t7
slli t5, t4, 2
lw t6, 15(sp)
li t7, 128084995
or.T t6, t6, t7
sw t6, 108(sp)
lw t7, 72(sp)
add t4, t3, t7
li t7, -54800333
mul s1, s0, t7
lw t6, 51(sp)
xor t3, t6, a4
lw t6, 63(sp)
li t7, 128084995
or.T s0, t6, t7
lw t6, 3(sp)
add s1, t6, s1
add t6, t5, s1
sw t6, 12(sp)
li t7, 105498146
mul t5, t3, t7
slli s0, s0, 8
lw t6, 216(sp)
lw t7, 108(sp)
and.T t3, t6, t7, -13
add t6, a6, t1
sw t6, 3(sp)
add t6, t5, s0
sw t6, 72(sp)
lw t6, 108(sp)
lw t7, 138(sp)
and t1, t6, t7, 13
lw t6, 114(sp)
lw t7, 135(sp)
or.T a6, t6, t7
lw t6, 54(sp)
and.1 t3, t6, t3, 13
lw t6, 249(sp)
xor s0, t6, t1
lw t6, 33(sp)
lw t7, 6(sp)
and.1 t1, t6, t7, 13
li t7, -105456425
mul t3, t3, t7
li t7, 182843470
mul t1, t1, t7
lw t6, 48(sp)
add s2, t6, t3
lw t6, 75(sp)
lw t7, 6(sp)
and.1 t5, t6, t7, 13
lw t6, 0(sp)
lw t7, 201(sp)
and t3, t6, t7, 13
lw t6, 114(sp)
li t7, -128084995
xor.1 s1, t6, t7
add s2, s2, t4
lw t7, 216(sp)
xor.1 t4, a4, t7
add s2, t2, s2
lw t6, 21(sp)
lw t7, 141(sp)
or.T t2, t6, t7
add t6, t0, s2
sw t6, 111(sp)
lw t6, 117(sp)
li t7, 128084995
and.T t0, t6, t7, -13
lw t7, 90(sp)
xor.T s2, t2, t7
li t7, -66027983
mul t6, s1, t7
sw t6, 0(sp)
lw t6, 132(sp)
xor.T s1, t6, s0
or.1 s0, a7, s2
and.1 a5, a5, s1, 13
lw t7, 231(sp)
and a7, a5, t7, 13
lw t6, 249(sp)
li t7, 128084995
or.1 a5, t6, t7
li t7, 136033639
mul t6, s0, t7
sw t6, 48(sp)
lw t6, 15(sp)
lw t7, 189(sp)
and.1 s3, t6, t7, 13
lw t6, 18(sp)
li t7, 144679869
mul s1, t6, t7
lw t6, 30(sp)
or s2, t6, t4, -13
and.T t5, t2, t5, -13
li t7, -108118891
mul t4, a7, t7
lw t7, 63(sp)
and a7, a5, t7, 13
li t7, -193275745
mul s0, a7, t7
lw t7, 96(sp)
or a7, s3, t7, -13
lw t6, 102(sp)
lw t7, 75(sp)
and.1 t2, t6, t7, 13
add s1, s1, t1
li t7, -71049171
mul t1, s2, t7
xor.T t3, t5, t3
lw t6, 117(sp)
lw t7, 36(sp)
xor.1 t6, t6, t7
sw t6, 75(sp)
lw t6, 156(sp)
add t4, t6, t4
lw t7, 12(sp)
add t5, t4, t7
lw t6, 180(sp)
li t7, 26017160
mul s2, t6, t7
li t7, 38879139
mul t4, a6, t7
lw t7, 141(sp)
xor a6, t3, t7
or s3, t0, a4, -13
add t3, s1, s0
lw t6, 42(sp)
lw t7, 51(sp)
and.1 t0, t6, t7, 13
add t6, t1, s2
sw t6, 12(sp)
lw t6, 231(sp)
lw t7, 15(sp)
and s0, t6, t7, 13
li t7, -120113150
mul t1, t2, t7
li t7, 189764684
mul t2, s3, t7
li t7, -29903603
mul a7, a7, t7
li t7, -130672706
mul s1, a6, t7
lw t6, 6(sp)
li t7, 128084995
xor.T a6, t6, t7
lw t6, 192(sp)
li t7, 128084995
xor.1 s2, t6, t7
add t1, t1, t2
lw t6, 60(sp)
lw t7, 99(sp)
or.T t2, t6, t7
lw t7, 3(sp)
add t6, t5, t7
sw t6, 90(sp)
lw t6, 51(sp)
and s2, t6, s2, 13
li t7, -25605428
mul a6, a6, t7
and.T a5, a5, s0, -13
lw t6, 114(sp)
xor.1 t5, t6, t0
li t7, 20562519
mul t6, s2, t7
sw t6, 42(sp)
lw t6, 0(sp)
add s0, t6, s1
lw t6, 135(sp)
slli t6, t6, 8
sw t6, 30(sp)
lw t6, 102(sp)
li t7, -151841557
mul t0, t6, t7
add s2, s0, t4
lw t6, 249(sp)
lw t7, 165(sp)
and s1, t6, t7, 13
lw t6, 93(sp)
lw t7, 249(sp)
and s0, t6, t7, 13
lw t6, 102(sp)
lw t7, 63(sp)
xor.T t4, t6, t7
add t3, s2, t3
lw t6, 24(sp)
lw t7, 228(sp)
and t6, t6, t7, 13
sw t6, 6(sp)
lw t7, 162(sp)
xor.1 s2, s1, t7
lw t6, 36(sp)
lw t7, 78(sp)
xor s1, t6, t7
or.T t5, t5, a5
lw t6, 48(sp)
add a5, t6, t3
lw t6, 72(sp)
add a5, t6, a5
li t7, 74053396
mul t6, s0, t7
sw t6, 15(sp)
lw t6, 18(sp)
lw t7, 66(sp)
and t3, t6, t7, 13
and s1, t5, s1, 13
li t7, 51227383
mul t5, s2, t7
add s2, t5, a7
lw t6, 51(sp)
lw t7, 18(sp)
xor.1 t5, t6, t7
lw t7, 75(sp)
and.T t4, t4, t7, -13
lw t6, 33(sp)
lw t7, 108(sp)
or.T t6, t6, t7
sw t6, 0(sp)
li t7, -72774890
mul s0, t2, t7
lw t6, 96(sp)
lw t7, 153(sp)
xor a7, t6, t7
add t2, t1, s2
li t7, 99886055
mul t4, t4, t7
li t7, 11327727
mul t1, t5, t7
lw t6, 153(sp)
lw t7, 249(sp)
and t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 60(sp)
lw t7, 186(sp)
and.T t5, t6, t7, -13
li t7, 145731076
mul s4, s1, t7
li t7, -71446442
mul s2, a4, t7
lw t6, 189(sp)
lw t7, 138(sp)
or.1 s5, t6, t7
add a6, a6, t4
lw t6, 249(sp)
and.1 s1, t6, a4, 13
lw t6, 69(sp)
lw t7, 114(sp)
xor.T s3, t6, t7
add t0, s4, t0
add t0, a6, t0
li t7, -38456493
mul a6, s5, t7
lw t6, 21(sp)
li t7, -23995211
mul t4, t6, t7
add a6, t1, a6
lw t6, 42(sp)
add t1, t6, s2
add s4, s0, t1
lw t6, 60(sp)
lw t7, 36(sp)
or.T s0, t6, t7
lw t6, 60(sp)
li t7, 46597820
mul t1, t6, t7
or s2, t3, s3, -13
add t0, t0, s4
lw t6, 12(sp)
add t2, t6, t2
lw t7, 105(sp)
or.1 s4, s1, t7
lw t6, 66(sp)
lw t7, 93(sp)
and.T t3, t6, t7, -13
lw t6, 33(sp)
lw t7, 168(sp)
or s3, t6, t7, -13
lw t7, 54(sp)
and.T s5, s0, t7, -13
lw t6, 186(sp)
li t7, 128084995
or.1 s1, t6, t7
lw t6, 63(sp)
lw t7, 153(sp)
and.1 s0, t6, t7, 13
add t2, a5, t2
and.1 a5, s4, t5, 13
lw t6, 6(sp)
or.1 t5, t6, a5
lw t6, 168(sp)
li t7, -37450002
mul a5, t6, t7
li t7, -100449611
mul s4, s5, t7
and a7, s2, a7, 13
li t7, -141132235
mul t5, t5, t7
li t7, -107724073
mul a7, a7, t7
lw t6, 30(sp)
add t5, t6, t5
lw t7, 60(sp)
and s2, s3, t7, 13
lw t7, 15(sp)
add t5, t5, t7
lw t6, 66(sp)
lw t7, 63(sp)
and.1 s3, t6, t7, 13
li t7, 60491832
mul s2, s2, t7
add a7, t4, a7
li t7, -10945718
mul t4, a4, t7
add s4, a7, s4
lw t6, 3(sp)
xor.T a4, t6, s1
li t7, 166615657
mul t3, t3, t7
li t7, -133236024
mul a7, s0, t7
li t7, 56494960
mul a4, a4, t7
lw t6, 249(sp)
lw t7, 219(sp)
or s5, t6, t7, -13
add a6, a6, s4
add s1, t1, a6
lw t6, 0(sp)
or.T s0, t6, s3
li t7, 77122128
mul a6, s5, t7
lw t6, 234(sp)
li t7, 83583863
mul t6, t6, t7
sw t6, 72(sp)
add t0, t0, t5
add t1, a4, s2
add a4, t0, s1
add a4, t2, a4
li t7, -90624403
mul t2, s0, t7
lw t6, 207(sp)
lw t7, 231(sp)
or t6, t6, t7, -13
sw t6, 12(sp)
lw t6, 114(sp)
lw t7, 144(sp)
or t0, t6, t7, -13
li t7, -30329194
mul t5, t0, t7
add t0, t4, t3
lw t6, 234(sp)
li t7, 71578667
xor t6, t6, t7
sw t6, 99(sp)
add t1, t2, t1
add a5, t5, a5
lw t6, 9(sp)
li t7, 71578667
or t6, t6, t7, -13
sw t6, 69(sp)
add a7, a7, t1
lw t6, 234(sp)
slli t6, t6, 2
sw t6, 0(sp)
lw t6, 9(sp)
lw t7, 234(sp)
or.1 t6, t6, t7
sw t6, 186(sp)
lw t6, 234(sp)
lw t7, 9(sp)
or t6, t6, t7, -13
sw t6, 51(sp)
lw t6, 105(sp)
lw t7, 21(sp)
xor t1, t6, t7
add a5, a5, a6
add a5, a7, a5
li t7, -167725082
mul a6, t1, t7
lw t6, 234(sp)
lw t7, 9(sp)
and.T t6, t6, t7, -13
sw t6, 105(sp)
lw t6, 9(sp)
li t7, 71578667
and a7, t6, t7, 13
lw t6, 234(sp)
lw t7, 9(sp)
or.T t6, t6, t7
sw t6, 162(sp)
lw t6, 234(sp)
li t7, 71578667
xor.1 t6, t6, t7
sw t6, 159(sp)
lw t6, 234(sp)
li t7, 71578667
xor.T t6, t6, t7
sw t6, 150(sp)
add t0, t0, a6
lw t6, 105(sp)
lw t7, 186(sp)
and t6, t6, t7, 13
sw t6, 18(sp)
lw t6, 99(sp)
li t7, -188134324
mul t6, t6, t7
sw t6, 21(sp)
lw t6, 9(sp)
li t7, 71578667
xor.1 t6, t6, t7
sw t6, 24(sp)
lw t6, 150(sp)
lw t7, 186(sp)
and.1 a6, t6, t7, 13
add a5, a5, t0
lw t6, 9(sp)
li t7, 71578667
or.T t6, t6, t7
sw t6, 123(sp)
add a4, a4, a5
lw t6, 234(sp)
lw t7, 9(sp)
xor.1 t6, t6, t7
sw t6, 54(sp)
lw t6, 90(sp)
add a4, t6, a4
li t7, -190653534
mul t6, a7, t7
sw t6, 6(sp)
lw t6, 234(sp)
li t7, 71578667
or.1 t6, t6, t7
sw t6, 183(sp)
lw t6, 9(sp)
li t7, 71578667
or.1 t6, t6, t7
sw t6, 30(sp)
lw t6, 111(sp)
add t6, t6, a4
sw t6, 90(sp)
lw t6, 105(sp)
lw t7, 159(sp)
and.1 a4, t6, t7, 13
lw t6, 234(sp)
li t7, 71578667
and.T a5, t6, t7, -13
lw t6, 9(sp)
and.1 t1, t6, a7, 13
lw t6, 234(sp)
li t7, 71578667
and.1 t6, t6, t7, 13
sw t6, 3(sp)
lw t6, 234(sp)
lw t7, 30(sp)
and t6, t6, t7, 13
sw t6, 75(sp)
lw t6, 90(sp)
lw t7, 57(sp)
xor.T t6, t6, t7
sw t6, 63(sp)
li t7, 153277592
mul t6, a5, t7
sw t6, 15(sp)
lw t6, 183(sp)
and t6, t6, a4, 13
sw t6, 36(sp)
lw t6, 90(sp)
lw t7, 57(sp)
and.1 a4, t6, t7, 13
lw t7, 234(sp)
xor.T t6, a4, t7
sw t6, 33(sp)
lw t7, 234(sp)
xor t6, a4, t7
sw t6, 111(sp)
lw t7, 69(sp)
or t2, a4, t7, -13
lw t6, 186(sp)
lw t7, 33(sp)
or a7, t6, t7, -13
lw t7, 9(sp)
and.T t6, a4, t7, -13
sw t6, 102(sp)
lw t7, 234(sp)
or t6, a4, t7, -13
sw t6, 129(sp)
xor t6, a4, a4
sw t6, 192(sp)
lw t6, 129(sp)
lw t7, 24(sp)
xor t3, t6, t7
lw t6, 9(sp)
and t6, t6, a4, 13
sw t6, 42(sp)
lw t6, 129(sp)
lw t7, 111(sp)
and.1 t0, t6, t7, 13
li t7, 71578667
and t6, a4, t7, 13
sw t6, 189(sp)
li t7, 71578667
xor.1 t6, a4, t7
sw t6, 114(sp)
li t7, 19455239
mul a7, a7, t7
lw t6, 9(sp)
and.1 t6, t6, a4, 13
sw t6, 144(sp)
lw t6, 9(sp)
xor.T t0, t6, t0
li t7, -89305345
mul t0, t0, t7
lw t6, 9(sp)
xor.T t6, t6, a4
sw t6, 165(sp)
lw t7, 189(sp)
xor.1 t4, a6, t7
lw t6, 234(sp)
and t6, t6, a4, 13
sw t6, 78(sp)
li t7, 71578667
xor.T a6, a4, t7
li t7, 68088150
mul t5, t3, t7
li t7, -126056668
mul t6, t1, t7
sw t6, 66(sp)
lw t6, 192(sp)
and t1, t6, a6, 13
lw t6, 102(sp)
lw t7, 114(sp)
or t3, t6, t7, -13
lw t6, 99(sp)
lw t7, 192(sp)
or s0, t6, t7, -13
or.1 t2, s0, t2
lw t6, 18(sp)
and t3, t6, t3, 13
li t7, 121410392
mul t1, t1, t7
li t7, -113434746
mul t3, t3, t7
xor.1 s1, t4, t2
lw t6, 144(sp)
lw t7, 162(sp)
and.1 s0, t6, t7, 13
lw t7, 21(sp)
add t1, t1, t7
lw t6, 165(sp)
li t7, 37033213
mul t4, t6, t7
lw t7, 165(sp)
or t2, a5, t7, -13
add t5, t5, t1
lw t6, 114(sp)
lw t7, 144(sp)
and.T t1, t6, t7, -13
lw t6, 9(sp)
li t7, 71578667
xor.T t6, t6, t7
sw t6, 177(sp)
li t7, -28973690
mul s2, s1, t7
li t7, 71578667
or.1 t6, a4, t7
sw t6, 60(sp)
lw t7, 234(sp)
or.1 t6, a4, t7
sw t6, 21(sp)
li t7, 71578667
and.T t6, a4, t7, -13
sw t6, 117(sp)
lw t7, 234(sp)
or.T t6, a4, t7
sw t6, 108(sp)
lw t6, 186(sp)
lw t7, 60(sp)
and.T a5, t6, t7, -13
xor a6, a6, s0
lw t6, 36(sp)
li t7, -47917635
mul t6, t6, t7
sw t6, 156(sp)
lw t6, 177(sp)
lw t7, 99(sp)
and s1, t6, t7, 13
lw t6, 117(sp)
or.T s0, t6, a6
add a6, a7, s2
add s2, t0, a6
lw t6, 114(sp)
lw t7, 189(sp)
and t0, t6, t7, 13
add t3, t3, t5
li t7, 71578667
or t6, a4, t7, -13
sw t6, 18(sp)
lw t6, 9(sp)
lw t7, 183(sp)
and a6, t6, t7, 13
lw t6, 123(sp)
lw t7, 42(sp)
and.T a7, t6, t7, -13
add t3, t3, t4
lw t6, 0(sp)
add t3, t6, t3
lw t6, 234(sp)
li t7, 71578667
or.T t6, t6, t7
sw t6, 153(sp)
add t6, s2, t3
sw t6, 132(sp)
and.1 t6, t2, s1, 13
sw t6, 48(sp)
lw t7, 105(sp)
or.T t2, t0, t7
li t7, 71578667
and.1 t4, a4, t7, 13
li t7, -17611068
mul s0, s0, t7
lw t6, 21(sp)
lw t7, 54(sp)
and.T t0, t6, t7, -13
li t7, -24352382
mul t5, t4, t7
li t7, 95165193
mul t3, t2, t7
lw t6, 243(sp)
and t2, t6, t4, 13
lw t6, 6(sp)
add t4, t6, s0
li t7, -168594769
mul t6, t1, t7
sw t6, 6(sp)
lw t6, 9(sp)
li t7, -140269446
mul t6, t6, t7
sw t6, 168(sp)
lw t6, 18(sp)
li t7, 179053526
mul t1, t6, t7
li t7, 71578667
xor t6, a4, t7
sw t6, 93(sp)
add t1, t1, t5
li t7, -193352001
mul t5, a7, t7
lw t6, 30(sp)
lw t7, 3(sp)
xor.1 a7, t6, t7
add t3, t3, t5
lw t6, 66(sp)
add t3, t6, t3
add t4, t1, t4
li t7, -141222333
mul t1, t0, t7
add t0, t3, t4
lw t6, 69(sp)
lw t7, 177(sp)
xor.1 t3, t6, t7
lw t6, 78(sp)
and.1 t3, t6, t3, 13
xor a5, t2, a5
lw t6, 234(sp)
lw t7, 9(sp)
and.1 t6, t6, t7, 13
sw t6, 135(sp)
lw t6, 105(sp)
li t7, 4375531
mul t6, t6, t7
sw t6, 138(sp)
lw t6, 51(sp)
lw t7, 111(sp)
and.1 t6, t6, t7, 13
sw t6, 96(sp)
li t7, 20745711
mul a5, a5, t7
add t1, t1, a5
xor.T a5, t3, a6
lw t6, 93(sp)
lw t7, 24(sp)
xor.1 t6, t6, t7
sw t6, 180(sp)
lw t6, 9(sp)
li t7, 71578667
and.1 t6, t6, t7, 13
sw t6, 36(sp)
lw t6, 135(sp)
lw t7, 102(sp)
or.T t2, t6, t7
lw t6, 162(sp)
lw t7, 111(sp)
or.T a6, t6, t7
li t7, 71578667
or.1 a5, a5, t7
lw t6, 153(sp)
lw t7, 243(sp)
xor t3, t6, t7
li t7, -13657998
mul t4, t3, t7
lw t6, 135(sp)
lw t7, 51(sp)
xor t3, t6, t7
lw t6, 93(sp)
lw t7, 108(sp)
and.T t5, t6, t7, -13
li t7, -90136811
mul t6, t5, t7
sw t6, 0(sp)
li t7, -166145944
mul t6, t2, t7
sw t6, 141(sp)
lw t7, 15(sp)
add t2, t4, t7
add t0, t0, t1
lw t6, 132(sp)
add t0, t6, t0
and.1 a7, a7, a6, 13
lw t6, 150(sp)
lw t7, 135(sp)
and.1 a6, t6, t7, 13
lw t7, 234(sp)
xor.1 t6, a4, t7
sw t6, 132(sp)
xor t1, a7, t3
lw t6, 9(sp)
li t7, 71578667
xor t6, t6, t7
sw t6, 54(sp)
lw t6, 54(sp)
li t7, 71578667
or.T a7, t6, t7
li t7, 84427838
mul t1, t1, t7
li t7, 183739912
mul a5, a5, t7
lw t6, 156(sp)
add a5, t6, a5
lw t6, 234(sp)
lw t7, 132(sp)
or t3, t6, t7, -13
add t6, t1, t2
sw t6, 66(sp)
li t7, 27409956
mul t3, t3, t7
lw t6, 18(sp)
lw t7, 177(sp)
and.1 t5, t6, t7, 13
lw t6, 6(sp)
add t1, t6, a5
li t7, 55901808
mul t6, a7, t7
sw t6, 15(sp)
lw t6, 165(sp)
xor.T a7, t6, a4
lw t6, 132(sp)
lw t7, 33(sp)
xor.1 t2, t6, t7
lw t6, 36(sp)
lw t7, 165(sp)
and t4, t6, t7, 13
lw t6, 69(sp)
lw t7, 117(sp)
and s0, t6, t7, 13
lw t6, 48(sp)
li t7, 102857963
mul a5, t6, t7
li t7, -78553836
mul a7, a7, t7
add t6, t0, t1
sw t6, 48(sp)
lw t6, 189(sp)
lw t7, 33(sp)
or.1 t0, t6, t7
lw t6, 123(sp)
lw t7, 78(sp)
xor.T t1, t6, t7
lw t6, 234(sp)
lw t7, 9(sp)
xor.T t6, t6, t7
sw t6, 156(sp)
lw t6, 3(sp)
lw t7, 177(sp)
and s2, t6, t7, 13
li t7, 175527868
mul t2, t2, t7
lw t6, 135(sp)
lw t7, 117(sp)
or.T s1, t6, t7
lw t6, 234(sp)
and.T s4, t6, a4, -13
lw t7, 18(sp)
or.1 s5, t0, t7
lw t7, 60(sp)
xor t0, s0, t7
lw t6, 144(sp)
xor a6, t6, a6
li t7, 50456575
mul s0, a6, t7
lw t6, 99(sp)
lw t7, 36(sp)
and.T t6, t6, t7, -13
sw t6, 6(sp)
lw t6, 96(sp)
xor.T a6, t6, s1
li t7, -42822413
mul t5, t5, t7
add t3, t3, t5
li t7, 96022708
mul s3, a6, t7
lw t6, 60(sp)
lw t7, 132(sp)
and.1 s1, t6, t7, 13
lw t6, 105(sp)
lw t7, 183(sp)
or s6, t6, t7, -13
lw t6, 33(sp)
lw t7, 54(sp)
or.1 s7, t6, t7
li t7, -6516545
mul t5, s5, t7
li t7, -136666475
mul t4, t4, t7
lw t6, 165(sp)
and.T a6, t6, s4, -13
lw t6, 0(sp)
add s5, t6, t3
xor.1 s2, s7, s2
lw t6, 156(sp)
lw t7, 165(sp)
xor t3, t6, t7
lw t6, 192(sp)
or t3, t6, t3, -13
lw t6, 180(sp)
or.1 s2, t6, s2
li t7, -157914032
mul s7, s2, t7
lw t6, 36(sp)
li t7, 71578667
or.T s4, t6, t7
xor.1 s2, t1, s6
lw t6, 33(sp)
lw t7, 117(sp)
xor.T t6, t6, t7
sw t6, 0(sp)
add a7, s7, a7
add s3, s0, s3
lw t6, 102(sp)
lw t7, 162(sp)
xor t1, t6, t7
lw t6, 51(sp)
li t7, -91592191
mul s0, t6, t7
lw t7, 168(sp)
add s5, s5, t7
add t2, t2, a7
add a5, s5, a5
lw t7, 159(sp)
and.1 a7, s1, t7, 13
lw t6, 66(sp)
add t2, t6, t2
lw t6, 72(sp)
add t4, t6, t4
lw t7, 141(sp)
add s1, t4, t7
lw t7, 15(sp)
add t4, t2, t7
li t7, -118331625
mul s4, s4, t7
add t2, s1, t5
and t0, s2, t0, 13
add t4, t4, s3
li t7, -14766991
mul s2, t0, t7
lw t6, 138(sp)
add a5, t6, a5
lw t6, 48(sp)
add t0, t6, a5
lw t6, 111(sp)
lw t7, 36(sp)
or s1, t6, t7, -13
li t7, -7169272
mul a5, t3, t7
lw t7, 129(sp)
and.T s3, a4, t7, -13
add t5, s4, s0
add t3, s2, a5
lw t6, 9(sp)
or.1 a5, t6, a4
lw t6, 186(sp)
lw t7, 6(sp)
xor.T s0, t6, t7
lw t7, 99(sp)
xor.1 s2, s3, t7
li t7, -35360874
mul s2, s2, t7
and.1 a6, a6, a5, 13
li t7, -74572244
mul a6, a6, t7
li t7, 41106804
mul s3, s0, t7
add s4, t3, a6
li t7, -162807006
mul s0, s1, t7
lw t6, 117(sp)
lw t7, 21(sp)
xor a6, t6, t7
lw t6, 117(sp)
lw t7, 111(sp)
or.T t3, t6, t7
add s3, s4, s3
li t7, -46351442
mul t1, t1, t7
add t1, s2, t1
lw t6, 123(sp)
lw t7, 234(sp)
xor.T s1, t6, t7
add t2, t2, s3
lw t6, 30(sp)
lw t7, 21(sp)
or.1 s2, t6, t7
add t4, t4, t2
add t2, t5, t1
lw t6, 9(sp)
lw t7, 234(sp)
and t6, t6, t7, 13
sw t6, 96(sp)
lw t6, 36(sp)
lw t7, 9(sp)
xor.T t1, t6, t7
li t7, 33763325
mul a7, a7, t7
add t6, t0, t4
sw t6, 66(sp)
lw t6, 0(sp)
and.T t4, t6, s2, -13
add t0, a7, s0
li t7, -172245557
mul a7, t4, t7
add a7, t2, a7
lw t7, 9(sp)
xor.1 t5, a4, t7
li t7, -142303229
mul t2, a4, t7
li t7, -96150887
mul t4, s1, t7
lw t6, 9(sp)
li t7, 71578667
and.T t6, t6, t7, -13
sw t6, 123(sp)
li t7, 71578667
or.T t6, a4, t7
sw t6, 6(sp)
or.T a6, a6, t5
xor.T t3, a6, t3
lw t6, 51(sp)
lw t7, 234(sp)
or.T a6, t6, t7
add t2, t2, t4
lw t7, 96(sp)
and.1 t1, t1, t7, 13
li t7, -28191947
mul t6, t3, t7
sw t6, 48(sp)
add t0, t2, t0
lw t7, 135(sp)
xor a5, a5, t7
li t7, 78211224
mul t1, t1, t7
lw t7, 123(sp)
xor.T t3, a6, t7
add t0, t0, t1
lw t6, 75(sp)
lw t7, 18(sp)
xor.T a6, t6, t7
lw t7, 6(sp)
xor.1 a5, a5, t7
add t6, a7, t0
sw t6, 0(sp)
lw t7, 69(sp)
xor a7, a5, t7
lw t7, 174(sp)
and.1 t2, a4, t7, 13
lw t6, 105(sp)
lw t7, 69(sp)
and.1 a5, t6, t7, 13
li t7, -172314674
mul t4, a7, t7
lw t6, 105(sp)
lw t7, 189(sp)
or.T a7, t6, t7
lw t6, 189(sp)
li t7, -29688406
mul t1, t6, t7
lw t6, 3(sp)
lw t7, 18(sp)
xor.T t0, t6, t7
lw t6, 231(sp)
lw t7, 135(sp)
and t5, t6, t7, 13
li t7, 174606536
mul t2, t2, t7
li t7, -171894542
mul t3, t3, t7
lw t6, 156(sp)
lw t7, 21(sp)
or.1 s0, t6, t7
add t3, t3, t4
lw t7, 243(sp)
xor.T s1, t5, t7
li t7, 122001459
mul t4, s0, t7
lw t6, 183(sp)
lw t7, 231(sp)
and t5, t6, t7, 13
li t7, -152172226
mul s1, s1, t7
lw t6, 54(sp)
li t7, -78709870
mul t6, t6, t7
sw t6, 75(sp)
lw t6, 153(sp)
lw t7, 234(sp)
xor s0, t6, t7
add t3, t3, s1
li t7, -101984576
mul a5, a5, t7
add s1, a5, t1
lw t6, 9(sp)
xor t1, t6, a4
lw t6, 111(sp)
lw t7, 102(sp)
and a5, t6, t7, 13
and a6, t5, a6, 13
li t7, -191777585
mul t5, a7, t7
lw t7, 177(sp)
or.1 a7, t0, t7
add t0, t2, t4
slli t6, s0, 4
sw t6, 138(sp)
li t7, -100254920
mul a6, a6, t7
add t0, s1, t0
lw t7, 174(sp)
or.T t2, t1, t7
lw t6, 234(sp)
li t7, 71578667
and t6, t6, t7, 13
sw t6, 54(sp)
add t3, t3, a6
li t7, -43715271
mul t2, t2, t7
lw t6, 9(sp)
lw t7, 105(sp)
or.1 a6, t6, t7
add t0, t0, t5
lw t6, 123(sp)
li t7, 22772246
mul t6, t6, t7
sw t6, 15(sp)
lw t6, 132(sp)
lw t7, 54(sp)
and t4, t6, t7, 13
add t3, t3, t0
slli s0, a7, 3
lw t6, 153(sp)
or.1 t0, t6, t1
lw t6, 9(sp)
or t6, t6, a4, -13
sw t6, 60(sp)
li t7, 192957991
mul t5, t4, t7
lw t6, 3(sp)
lw t7, 159(sp)
or t1, t6, t7, -13
lw t6, 93(sp)
lw t7, 132(sp)
or t6, t6, t7, -13
sw t6, 117(sp)
lw t6, 231(sp)
li t7, 71578667
xor a7, t6, t7
or.T t1, a4, t1
lw t6, 54(sp)
lw t7, 132(sp)
xor s1, t6, t7
lw t6, 234(sp)
lw t7, 135(sp)
and.T t4, t6, t7, -13
add t6, t2, s0
sw t6, 72(sp)
lw t6, 60(sp)
lw t7, 33(sp)
or.1 t2, t6, t7
lw t7, 9(sp)
or.T s0, a4, t7
lw t6, 3(sp)
lw t7, 6(sp)
xor.1 a4, t6, t7
add t5, t3, t5
li t7, -56381426
mul t3, s1, t7
lw t7, 129(sp)
and.T s2, s0, t7, -13
lw t6, 234(sp)
lw t7, 105(sp)
or s1, t6, t7, -13
lw t6, 69(sp)
lw t7, 6(sp)
or.1 s0, t6, t7
and s3, a5, a6, 13
lw t6, 150(sp)
li t7, 74945711
mul a6, t6, t7
li t7, -184809603
mul a5, t2, t7
li t7, -56188384
mul t2, t4, t7
xor.1 t0, s3, t0
lw t6, 156(sp)
lw t7, 114(sp)
xor.1 s3, t6, t7
lw t6, 129(sp)
lw t7, 177(sp)
or.T t4, t6, t7
lw t7, 54(sp)
or.T s2, s2, t7
xor.1 t0, t1, t0
li t7, 75892969
mul t0, t0, t7
and.T s1, s1, s3, -13
lw t7, 138(sp)
add t6, t5, t7
sw t6, 3(sp)
xor.T t1, a4, s0
lw t6, 129(sp)
lw t7, 123(sp)
or.1 a4, t6, t7
lw t6, 144(sp)
li t7, 119239915
mul t5, t6, t7
li t7, -68897827
mul t1, t1, t7
add t1, t1, t3
xor.T a7, s2, a7
lw t6, 156(sp)
li t7, 71578667
xor.1 s2, t6, t7
lw t6, 189(sp)
xor t3, t6, a7
lw t6, 42(sp)
lw t7, 189(sp)
and.1 a7, t6, t7, 13
li t7, 135044502
mul t3, t3, t7
li t7, -137525515
mul s3, s1, t7
lw t6, 75(sp)
add s0, t6, t3
li t7, 161116174
mul t3, t4, t7
li t7, 64687839
mul s1, a7, t7
lw t6, 15(sp)
add t4, t6, t5
add a7, t2, s3
lw t7, 21(sp)
xor.T s2, s2, t7
lw t6, 102(sp)
lw t7, 9(sp)
or s3, t6, t7, -13
lw t6, 129(sp)
lw t7, 159(sp)
xor t2, t6, t7
li t7, -134777213
mul t2, t2, t7
add t5, a6, s1
xor.T s1, s2, s3
lw t6, 162(sp)
lw t7, 234(sp)
xor.1 a6, t6, t7
add a5, a5, s0
add a5, t0, a5
lw t6, 72(sp)
add a5, t6, a5
lw t6, 96(sp)
lw t7, 30(sp)
xor.T t0, t6, t7
li t7, 92765878
mul s1, s1, t7
add a5, a5, a7
add t5, t1, t5
lw t6, 60(sp)
lw t7, 192(sp)
and.1 a7, t6, t7, 13
lw t6, 234(sp)
lw t7, 9(sp)
xor s0, t6, t7
lw t7, 6(sp)
xor t1, s0, t7
lw t6, 9(sp)
lw t7, 105(sp)
and.1 s2, t6, t7, 13
add t3, t3, s1
add t3, t4, t3
lw t7, 9(sp)
xor.1 t4, s2, t7
lw t7, 150(sp)
or a4, a4, t7, -13
or t0, t0, t4, -13
li t7, -76820238
mul t4, t0, t7
lw t6, 117(sp)
li t7, -190663926
mul s1, t6, t7
li t7, -180267064
mul a4, a4, t7
add t2, t2, a4
lw t6, 114(sp)
lw t7, 51(sp)
or t0, t6, t7, -13
lw t7, 192(sp)
or a4, t1, t7, -13
lw t6, 99(sp)
li t7, 71578667
xor.1 t1, t6, t7
lw t6, 156(sp)
xor.T s0, t6, s0
add t3, t5, t3
add t4, t4, t2
li t7, 73816115
add t2, s1, t7
li t7, -52416912
mul t5, s0, t7
add t5, t4, t5
slli t4, a6, 2
lw t6, 135(sp)
li t7, -128743022
mul a6, t6, t7
lw t6, 60(sp)
lw t7, 111(sp)
or.T s0, t6, t7
li t7, 7962113
mul a7, a7, t7
lw t6, 18(sp)
and.1 s0, t6, s0, 13
add t3, t3, t5
xor.1 t5, a4, s0
add a4, a5, t3
lw t6, 126(sp)
and.1 t6, t6, a3, 13
sw t6, 279(sp)
add a5, t2, t4
lw t6, 189(sp)
lw t7, 36(sp)
and t3, t6, t7, 13
add a4, a4, a5
lw t6, 165(sp)
lw t7, 93(sp)
and t2, t6, t7, 13
li t7, 124210178
mul a5, t5, t7
lw t6, 36(sp)
lw t7, 78(sp)
or.T t5, t6, t7
lw t7, 234(sp)
or t2, t2, t7, -13
lw t6, 231(sp)
lw t7, 42(sp)
and t4, t6, t7, 13
and.T s0, t0, t5, -13
lw t6, 192(sp)
li t7, -174939939
mul t0, t6, t7
li t7, -151733474
mul t1, t1, t7
lw t6, 54(sp)
xor t5, t6, t3
lw t6, 33(sp)
lw t7, 108(sp)
or t3, t6, t7, -13
lw t7, 126(sp)
xor t6, a3, t7
sw t6, 99(sp)
lw t7, 243(sp)
or.T s0, s0, t7
li t7, -26989488
mul s1, t4, t7
lw t6, 30(sp)
lw t7, 24(sp)
xor t4, t6, t7
li t7, 32923380
add s1, s1, t7
lw t6, 126(sp)
and.T t6, t6, a3, -13
sw t6, 117(sp)
li t7, 146467462
mul t5, t5, t7
lw t7, 126(sp)
xor.1 t6, a3, t7
sw t6, 42(sp)
or.1 t2, s0, t2
add a6, s1, a6
li t7, 38581397
mul t2, t2, t7
add t2, t2, a7
add t1, a6, t1
and a6, t4, t3, 13
add t0, t0, t5
li t7, -95533696
mul a7, a6, t7
lw t6, 144(sp)
li t7, 186557920
mul a6, t6, t7
add a5, a5, t2
lw t6, 126(sp)
or.T t6, t6, a3
sw t6, 54(sp)
add t1, a5, t1
lw t7, 117(sp)
or a5, a3, t7, -13
add t0, t1, t0
add a4, a4, t0
add a4, a4, a7
li t7, -182540537
mul t6, a5, t7
sw t6, 36(sp)
lw t6, 63(sp)
li t7, -84511917
xor t6, t6, t7
sw t6, 78(sp)
lw t6, 78(sp)
lw t7, 78(sp)
xor t6, t6, t7
sw t6, 189(sp)
lw t6, 3(sp)
add a4, t6, a4
add a4, a4, a6
li t7, -170899304
mul t6, a3, t7
sw t6, 162(sp)
lw t6, 126(sp)
lw t7, 207(sp)
or.T t6, t6, t7
sw t6, 270(sp)
lw t6, 126(sp)
slli t6, t6, 4
sw t6, 18(sp)
lw t6, 207(sp)
lw t7, 126(sp)
or t6, t6, t7, -13
sw t6, 9(sp)
lw t7, 126(sp)
or t6, a3, t7, -13
sw t6, 300(sp)
lw t6, 126(sp)
lw t7, 279(sp)
or t6, t6, t7, -13
sw t6, 105(sp)
lw t6, 54(sp)
li t7, 175711412
mul t6, t6, t7
sw t6, 216(sp)
lw t6, 126(sp)
or.1 t6, t6, a3
sw t6, 177(sp)
lw t6, 207(sp)
lw t7, 126(sp)
xor t6, t6, t7
sw t6, 201(sp)
lw t6, 300(sp)
li t7, -107973228
mul t6, t6, t7
sw t6, 75(sp)
lw t7, 126(sp)
and t6, a3, t7, 13
sw t6, 51(sp)
lw t6, 207(sp)
lw t7, 84(sp)
and t6, t6, t7, 13
sw t6, 63(sp)
lw t6, 84(sp)
lw t7, 207(sp)
and.T t6, t6, t7, -13
sw t6, 210(sp)
lw t6, 126(sp)
lw t7, 207(sp)
and.1 t6, t6, t7, 13
sw t6, 24(sp)
lw t6, 84(sp)
lw t7, 126(sp)
or.T t6, t6, t7
sw t6, 123(sp)
lw t6, 126(sp)
xor.T a5, t6, a3
lw t6, 123(sp)
lw t7, 84(sp)
or t6, t6, t7, -13
sw t6, 114(sp)
lw t6, 207(sp)
lw t7, 84(sp)
or t6, t6, t7, -13
sw t6, 228(sp)
lw t6, 48(sp)
add a4, t6, a4
lw t6, 0(sp)
add a4, t6, a4
lw t6, 51(sp)
lw t7, 99(sp)
and.T t6, t6, t7, -13
sw t6, 3(sp)
lw t6, 66(sp)
add a4, t6, a4
lw t7, 126(sp)
xor.1 t6, a5, t7
sw t6, 180(sp)
lw t7, 90(sp)
xor a5, a4, t7
xor.T t6, a3, a5
sw t6, 30(sp)
lw t6, 78(sp)
or a4, t6, a4, -13
lw t6, 126(sp)
xor.1 t6, t6, a4
sw t6, 195(sp)
or.1 a6, a4, a3
and t6, a5, a3, 13
sw t6, 0(sp)
xor.1 t6, a3, a5
sw t6, 192(sp)
and t6, a4, a3, 13
sw t6, 48(sp)
and.1 t6, a5, a4, 13
sw t6, 165(sp)
lw t7, 126(sp)
xor.T t6, a4, t7
sw t6, 159(sp)
lw t6, 279(sp)
lw t7, 0(sp)
or.T t0, t6, t7
li t7, -40896077
mul a7, a6, t7
lw t6, 192(sp)
lw t7, 48(sp)
or t1, t6, t7, -13
xor.T t6, a4, a5
sw t6, 6(sp)
or.T t6, a4, a5
sw t6, 93(sp)
or.T t1, t1, a4
lw t7, 99(sp)
xor.1 a6, a6, t7
li t7, -32017326
mul t0, t0, t7
lw t6, 6(sp)
or t3, t6, a4, -13
lw t7, 126(sp)
and.T t6, a5, t7, -13
sw t6, 33(sp)
li t7, 176344887
mul t2, t1, t7
lw t6, 6(sp)
lw t7, 30(sp)
or.T t1, t6, t7
xor t3, t3, a3
lw t6, 126(sp)
xor t6, t6, a4
sw t6, 21(sp)
and.1 t6, a3, a5, 13
sw t6, 213(sp)
lw t7, 126(sp)
and.1 t6, a4, t7, 13
sw t6, 60(sp)
or t6, a3, a5, -13
sw t6, 132(sp)
li t7, 94212431
mul t5, a6, t7
lw t6, 117(sp)
lw t7, 132(sp)
xor a6, t6, t7
li t7, 165757578
mul t4, t3, t7
add t3, t2, t5
lw t6, 195(sp)
and.T t2, t6, a3, -13
lw t6, 126(sp)
and.1 t6, t6, a5, 13
sw t6, 285(sp)
lw t6, 165(sp)
and t2, t6, t2, 13
add t6, t4, a7
sw t6, 72(sp)
lw t7, 126(sp)
or.T t6, a5, t7
sw t6, 267(sp)
or t6, a5, a4, -13
sw t6, 237(sp)
xor t6, a4, a4
sw t6, 153(sp)
lw t6, 33(sp)
li t7, 14090084
mul t6, t6, t7
sw t6, 96(sp)
add t6, t3, t0
sw t6, 108(sp)
lw t7, 126(sp)
and.T t6, a4, t7, -13
sw t6, 90(sp)
lw t7, 126(sp)
or t6, a4, t7, -13
sw t6, 219(sp)
lw t7, 90(sp)
xor t1, t1, t7
lw t6, 159(sp)
lw t7, 300(sp)
and.T a7, t6, t7, -13
lw t7, 126(sp)
and t6, a4, t7, 13
sw t6, 168(sp)
lw t6, 0(sp)
lw t7, 42(sp)
or.T t0, t6, t7
lw t6, 93(sp)
lw t7, 30(sp)
xor.T t6, t6, t7
sw t6, 15(sp)
li t7, -69967932
mul t6, t0, t7
sw t6, 135(sp)
or.1 t2, a7, t2
xor.T t6, a4, a3
sw t6, 129(sp)
lw t6, 168(sp)
lw t7, 267(sp)
or.1 t0, t6, t7
lw t6, 60(sp)
lw t7, 153(sp)
xor.T a7, t6, t7
and.T t6, a4, a5, -13
sw t6, 264(sp)
lw t6, 153(sp)
lw t7, 237(sp)
xor.1 t3, t6, t7
lw t6, 264(sp)
lw t7, 0(sp)
or.1 t4, t6, t7
lw t6, 192(sp)
and.T t5, t6, t0, -13
li t7, -20432349
mul t0, a6, t7
lw t6, 264(sp)
lw t7, 132(sp)
and.1 a6, t6, t7, 13
lw t6, 54(sp)
xor.1 a6, t6, a6
xor t6, a3, a5
sw t6, 54(sp)
li t7, 187630368
mul t3, t3, t7
or.1 t6, a5, a3
sw t6, 186(sp)
li t7, 109812179
mul t5, t5, t7
lw t6, 90(sp)
xor.T s1, t6, a7
lw t6, 126(sp)
or.1 t6, t6, a5
sw t6, 69(sp)
or.T a7, t4, a6
lw t6, 33(sp)
li t7, 56761070
mul a6, t6, t7
lw t6, 186(sp)
xor s2, t6, a4
or s0, t2, t1, -13
add a6, t5, a6
lw t6, 267(sp)
lw t7, 159(sp)
and.T t1, t6, t7, -13
lw t6, 195(sp)
lw t7, 54(sp)
and.T t5, t6, t7, -13
lw t6, 168(sp)
li t7, 76089360
mul t6, t6, t7
sw t6, 222(sp)
lw t6, 126(sp)
xor t6, t6, a5
sw t6, 276(sp)
lw t6, 33(sp)
lw t7, 300(sp)
xor t4, t6, t7
lw t6, 129(sp)
or t6, t6, a5, -13
sw t6, 102(sp)
or.1 t1, s1, t1
li t7, 1018928
mul t1, t1, t7
lw t6, 237(sp)
lw t7, 117(sp)
or t2, t6, t7, -13
lw t6, 285(sp)
xor.1 s1, t6, s2
xor t6, a5, a4
sw t6, 141(sp)
lw t6, 129(sp)
lw t7, 93(sp)
xor.T s2, t6, t7
lw t6, 126(sp)
lw t7, 213(sp)
or.T s3, t6, t7
li t7, 189273561
mul s0, s0, t7
lw t6, 117(sp)
lw t7, 69(sp)
xor t6, t6, t7
sw t6, 66(sp)
add t0, s0, t0
add t0, t0, t3
or t3, s3, t5, -13
lw t6, 72(sp)
add t0, t6, t0
lw t6, 108(sp)
add t0, t6, t0
and t5, s1, s2, 13
lw t7, 96(sp)
add t6, t0, t7
sw t6, 150(sp)
lw t6, 15(sp)
and.1 t0, t6, t4, 13
li t7, 100297550
mul t6, t3, t7
sw t6, 72(sp)
xor.1 t6, a4, a5
sw t6, 243(sp)
li t7, 91023259
mul t3, t5, t7
add t6, t1, t3
sw t6, 144(sp)
lw t6, 69(sp)
lw t7, 93(sp)
xor.1 t1, t6, t7
lw t7, 126(sp)
xor.1 t6, a5, t7
sw t6, 96(sp)
lw t6, 21(sp)
or a7, t6, a7, -13
or.T t6, a3, a4
sw t6, 111(sp)
lw t6, 276(sp)
lw t7, 96(sp)
or.T t6, t6, t7
sw t6, 108(sp)
lw t6, 219(sp)
lw t7, 51(sp)
xor t3, t6, t7
lw t6, 141(sp)
lw t7, 111(sp)
and.1 t4, t6, t7, 13
lw t7, 21(sp)
and t6, a4, t7, 13
sw t6, 156(sp)
slli a7, a7, 8
lw t6, 132(sp)
lw t7, 237(sp)
xor.T s0, t6, t7
or.T t2, t2, t0
lw t6, 276(sp)
xor t0, t6, a5
add a7, a6, a7
lw t6, 117(sp)
lw t7, 30(sp)
or.1 t5, t6, t7
li t7, -88108972
mul a6, s0, t7
and.T t6, a4, a3, -13
sw t6, 255(sp)
lw t6, 51(sp)
or.T s1, t6, a4
lw t6, 255(sp)
lw t7, 141(sp)
or.T t6, t6, t7
sw t6, 246(sp)
lw t6, 135(sp)
add a7, t6, a7
xor.1 t4, t0, t4
lw t6, 102(sp)
lw t7, 126(sp)
or.T s0, t6, t7
li t7, -118942545
mul t6, s1, t7
sw t6, 249(sp)
lw t6, 219(sp)
lw t7, 60(sp)
xor.1 t0, t6, t7
xor t6, a3, a4
sw t6, 138(sp)
or.1 t6, a4, a5
sw t6, 183(sp)
xor s1, t4, t3
lw t6, 183(sp)
lw t7, 168(sp)
and.1 t3, t6, t7, 13
lw t6, 126(sp)
lw t7, 183(sp)
or t6, t6, t7, -13
sw t6, 135(sp)
lw t6, 138(sp)
xor.1 t4, t6, a4
slli t6, t5, 6
sw t6, 102(sp)
lw t7, 126(sp)
or t6, a5, t7, -13
sw t6, 15(sp)
xor t1, t1, t2
li t7, 77334106
mul t2, s0, t7
li t7, -81758390
mul t5, t1, t7
li t7, 118960497
mul t1, s1, t7
add t5, a6, t5
lw t6, 126(sp)
or.T t6, t6, a4
sw t6, 297(sp)
xor.1 t6, a4, a3
sw t6, 240(sp)
lw t6, 222(sp)
add a6, t6, t2
lw t6, 195(sp)
lw t7, 240(sp)
xor.T s0, t6, t7
lw t7, 72(sp)
add s1, a6, t7
lw t6, 54(sp)
lw t7, 117(sp)
xor t2, t6, t7
lw t6, 219(sp)
lw t7, 153(sp)
xor.T a6, t6, t7
lw t6, 90(sp)
lw t7, 99(sp)
or.T s2, t6, t7
lw t6, 144(sp)
add s1, t6, s1
and.1 t4, t3, t4, 13
lw t6, 90(sp)
xor.1 t3, t6, s2
lw t6, 66(sp)
xor s2, t6, s0
li t7, -130752977
mul s0, t4, t7
li t7, -85262227
mul s2, s2, t7
lw t7, 126(sp)
xor.T t6, a5, t7
sw t6, 258(sp)
add t4, s1, t5
add t5, s0, s2
li t7, -69061703
mul t3, t3, t7
add t1, t1, t5
lw t6, 267(sp)
li t7, 59448837
mul t6, t6, t7
sw t6, 222(sp)
lw t6, 132(sp)
lw t7, 111(sp)
or.T t6, t6, t7
sw t6, 66(sp)
add t4, a7, t4
lw t6, 258(sp)
or.T a7, t6, t0
lw t6, 15(sp)
lw t7, 48(sp)
or.T t5, t6, t7
lw t6, 150(sp)
add t6, t6, t4
sw t6, 150(sp)
lw t6, 192(sp)
lw t7, 285(sp)
or.T t0, t6, t7
lw t6, 300(sp)
and t4, t6, t5, 13
lw t6, 246(sp)
xor.T s1, t6, t4
lw t7, 108(sp)
xor t2, t2, t7
lw t6, 243(sp)
xor t5, t6, a3
or t0, t2, t0, -13
and.T t6, a5, a3, -13
sw t6, 246(sp)
li t7, -179021052
mul s0, t0, t7
lw t6, 156(sp)
li t7, -181862101
mul t2, t6, t7
lw t6, 141(sp)
lw t7, 231(sp)
and t0, t6, t7, 13
li t7, -48592070
mul t4, a7, t7
add a7, t3, t2
lw t6, 33(sp)
lw t7, 255(sp)
and.T t2, t6, t7, -13
slli t3, s1, 6
lw t6, 162(sp)
add s1, t6, a7
lw t6, 192(sp)
li t7, 150833647
mul t6, t6, t7
sw t6, 261(sp)
lw t6, 0(sp)
lw t7, 126(sp)
or a7, t6, t7, -13
lw t6, 102(sp)
add s2, t6, s1
lw t6, 138(sp)
lw t7, 246(sp)
and s1, t6, t7, 13
add s3, t1, t3
li t7, -40830576
mul t3, t5, t7
lw t7, 129(sp)
xor.T t1, a6, t7
add a6, s3, s0
add a6, a6, s2
lw t7, 36(sp)
add t5, t3, t7
lw t6, 96(sp)
and t3, t6, a4, 13
li t7, -187139871
mul s0, t3, t7
lw t6, 111(sp)
lw t7, 48(sp)
xor.T t3, t6, t7
add t4, t4, s0
add t6, t5, t4
sw t6, 156(sp)
lw t6, 138(sp)
lw t7, 243(sp)
xor t5, t6, t7
lw t7, 117(sp)
xor.T s1, s1, t7
lw t6, 195(sp)
xor t4, t6, a5
lw t6, 195(sp)
lw t7, 42(sp)
or.T t6, t6, t7
sw t6, 144(sp)
lw t6, 141(sp)
lw t7, 297(sp)
xor s0, t6, t7
lw t6, 111(sp)
xor.T t2, t6, t2
li t7, 139408061
mul t6, t2, t7
sw t6, 99(sp)
lw t6, 6(sp)
lw t7, 177(sp)
and t2, t6, t7, 13
xor.T t0, t0, t2
or t6, a3, a4, -13
sw t6, 288(sp)
xor.T t4, t1, t4
lw t6, 66(sp)
li t7, 33634071
mul t1, t6, t7
li t7, -57924665
mul s1, s1, t7
li t7, 12719074
mul t6, t3, t7
sw t6, 36(sp)
lw t7, 135(sp)
and.T t2, t5, t7, -13
lw t6, 249(sp)
add s1, t6, s1
lw t6, 15(sp)
lw t7, 90(sp)
or.1 t6, t6, t7
sw t6, 6(sp)
or.T t6, a3, a5
sw t6, 15(sp)
lw t7, 132(sp)
xor t3, s0, t7
or t5, a7, t2, -13
li t7, -135827518
mul t6, t3, t7
sw t6, 102(sp)
lw t7, 267(sp)
or t2, a4, t7, -13
lw t6, 276(sp)
lw t7, 141(sp)
or t3, t6, t7, -13
lw t6, 15(sp)
li t7, 80829524
mul s0, t6, t7
add t6, a6, s1
sw t6, 108(sp)
lw t6, 231(sp)
lw t7, 285(sp)
or a6, t6, t7, -13
li t7, 124526890
mul t6, a6, t7
sw t6, 177(sp)
li t7, -126358905
mul a6, t0, t7
li t7, -103139971
mul t0, t4, t7
lw t7, 288(sp)
or.1 s1, a5, t7
lw t6, 285(sp)
li t7, -172088052
mul a7, t6, t7
lw t6, 195(sp)
li t7, 38749929
mul t6, t6, t7
sw t6, 66(sp)
add t4, s0, a6
li t7, -184550704
mul s0, s1, t7
lw t6, 90(sp)
or.T a6, t6, a3
lw t6, 42(sp)
xor.1 t5, t6, t5
add t0, t0, s0
li t7, 113117683
mul s0, t5, t7
lw t6, 264(sp)
lw t7, 231(sp)
or t5, t6, t7, -13
add t1, t1, s0
lw t6, 15(sp)
li t7, 36352363
mul t6, t6, t7
sw t6, 42(sp)
li t7, -147911673
mul t5, t5, t7
lw t6, 192(sp)
and.1 s1, t6, t2, 13
lw t6, 126(sp)
xor.1 s0, t6, t3
lw t6, 279(sp)
lw t7, 276(sp)
and t2, t6, t7, 13
lw t6, 297(sp)
lw t7, 267(sp)
or.T t3, t6, t7
li t7, -63578273
mul t6, t2, t7
sw t6, 249(sp)
lw t6, 213(sp)
lw t7, 285(sp)
and.1 t2, t6, t7, 13
lw t6, 138(sp)
and s1, t6, s1, 13
lw t7, 216(sp)
add s2, t5, t7
lw t7, 69(sp)
xor t5, s0, t7
li t7, 166802140
mul s0, s1, t7
add t6, s2, a7
sw t6, 138(sp)
add t4, s0, t4
lw t6, 255(sp)
lw t7, 30(sp)
or a7, t6, t7, -13
lw t7, 126(sp)
and t6, a5, t7, 13
sw t6, 72(sp)
lw t6, 153(sp)
lw t7, 111(sp)
or t6, t6, t7, -13
sw t6, 162(sp)
li t7, 189857919
mul t6, a7, t7
sw t6, 135(sp)
lw t6, 69(sp)
lw t7, 246(sp)
xor a7, t6, t7
lw t7, 36(sp)
add t6, t4, t7
sw t6, 117(sp)
lw t6, 237(sp)
and.1 t3, t6, t3, 13
li t7, -124961295
mul t4, t5, t7
lw t6, 219(sp)
li t7, -144296866
mul t6, t6, t7
sw t6, 36(sp)
lw t7, 102(sp)
add t4, t4, t7
li t7, -126380652
mul t6, t3, t7
sw t6, 102(sp)
lw t7, 99(sp)
add t3, t4, t7
lw t7, 261(sp)
add t4, t3, t7
li t7, -44809370
mul a7, a7, t7
lw t6, 126(sp)
or.1 t6, t6, a4
sw t6, 99(sp)
lw t6, 168(sp)
or.1 t3, t6, t2
lw t6, 222(sp)
add t2, t6, t4
add t0, t2, t0
lw t7, 144(sp)
xor a6, a6, t7
lw t6, 300(sp)
lw t7, 96(sp)
or.1 t4, t6, t7
add s0, t1, t0
lw t6, 72(sp)
lw t7, 264(sp)
xor.1 s1, t6, t7
lw t6, 168(sp)
lw t7, 288(sp)
xor t2, t6, t7
li t7, 81348777
mul t1, a6, t7
lw t6, 273(sp)
lw t7, 96(sp)
xor.1 a6, t6, t7
lw t6, 99(sp)
lw t7, 264(sp)
xor.T t5, t6, t7
lw t6, 255(sp)
lw t7, 258(sp)
and.1 t0, t6, t7, 13
lw t6, 96(sp)
li t7, 85849273
mul t6, t6, t7
sw t6, 30(sp)
lw t6, 300(sp)
xor.T s2, t6, a4
lw t6, 6(sp)
xor t5, t6, t5
lw t6, 54(sp)
lw t7, 51(sp)
or s4, t6, t7, -13
lw t7, 129(sp)
and s3, t0, t7, 13
lw t6, 93(sp)
or.T t0, t6, a3
li t7, -173969127
mul t5, t5, t7
or.1 s1, s1, s4
lw t6, 156(sp)
add s4, t6, s0
and a5, a5, a4, 13
lw t6, 111(sp)
and.1 s0, t6, t4, 13
or.1 s1, s1, s2
lw t6, 108(sp)
add t4, t6, s4
and.1 t3, s3, t3, 13
lw t6, 249(sp)
add s2, t6, t1
lw t6, 276(sp)
lw t7, 60(sp)
or t1, t6, t7, -13
lw t6, 150(sp)
add t6, t6, t4
sw t6, 6(sp)
li t7, 39369777
mul t4, t3, t7
xor.1 s1, s1, s0
lw t7, 267(sp)
xor.T t3, a3, t7
lw t6, 42(sp)
add s2, t6, s2
lw t7, 162(sp)
and s0, t2, t7, 13
lw t7, 60(sp)
or.1 t2, a5, t7
lw t7, 177(sp)
add s2, s2, t7
add a7, a7, t5
li t7, 49475645
mul s1, s1, t7
lw t7, 102(sp)
add t5, s2, t7
add t4, s1, t4
lw t6, 135(sp)
add a7, t6, a7
lw t7, 66(sp)
add s1, t5, t7
lw t6, 183(sp)
lw t7, 126(sp)
xor s2, t6, t7
and.T t5, a6, t2, -13
lw t6, 0(sp)
li t7, -144129999
mul t2, t6, t7
lw t6, 117(sp)
add a6, t6, s1
lw t7, 141(sp)
and s1, s2, t7, 13
lw t7, 54(sp)
or.T s2, a4, t7
li t7, 161678116
mul s0, s0, t7
lw t7, 138(sp)
add a6, a6, t7
lw t6, 195(sp)
lw t7, 99(sp)
xor s3, t6, t7
and t0, s3, t0, 13
lw t7, 36(sp)
add s3, s0, t7
li t7, -138652250
mul t5, t5, t7
lw t6, 96(sp)
xor.1 s0, t6, t3
add t3, t4, s3
lw t7, 297(sp)
xor.T t4, s2, t7
lw t6, 69(sp)
xor.1 s1, t6, s1
lw t6, 48(sp)
xor s1, t6, s1
add s3, a7, t3
lw t7, 21(sp)
and t3, a3, t7, 13
li t7, -56994365
mul a7, t1, t7
li t7, -111679519
mul s2, s1, t7
add s1, a6, s3
li t7, -137108063
mul t1, t4, t7
lw t6, 279(sp)
xor.1 a6, t6, a4
add t1, t1, a7
add a7, t5, s2
li t7, -117480504
mul t4, s0, t7
lw t6, 15(sp)
lw t7, 51(sp)
xor s2, t6, t7
lw t6, 285(sp)
and.1 a5, t6, a5, 13
lw t6, 246(sp)
lw t7, 111(sp)
xor t5, t6, t7
lw t6, 6(sp)
add t6, t6, s1
sw t6, 6(sp)
lw t7, 75(sp)
add s1, t2, t7
lw t6, 264(sp)
lw t7, 33(sp)
xor.1 s3, t6, t7
li t7, -113398886
mul s0, t0, t7
and.1 t0, a4, a3, 13
li t7, 94559770
mul s4, s2, t7
lw t6, 99(sp)
lw t7, 51(sp)
or.1 t2, t6, t7
lw t6, 0(sp)
lw t7, 3(sp)
or.1 s5, t6, t7
li t7, 86998470
mul s2, s3, t7
lw t6, 30(sp)
add s4, t6, s4
li t7, -127506486
mul s5, s5, t7
lw t7, 213(sp)
xor.T t3, t3, t7
li t7, -149438778
mul t3, t3, t7
lw t6, 153(sp)
lw t7, 126(sp)
xor s3, t6, t7
add s6, s1, t3
add s1, s5, s4
lw t6, 60(sp)
li t7, -121492700
mul t3, t6, t7
add t4, t4, s6
add s5, t1, t4
add s2, s2, s1
li t7, -89081843
mul t1, t5, t7
lw t6, 186(sp)
lw t7, 96(sp)
or.T s4, t6, t7
lw t6, 243(sp)
lw t7, 33(sp)
and.1 t4, t6, t7, 13
lw t7, 165(sp)
and s1, s3, t7, 13
add s0, s0, s5
li t7, 157704060
mul t5, a6, t7
add a6, a7, s0
add t6, a6, s2
sw t6, 0(sp)
li t7, 153976251
mul a7, s4, t7
li t7, 43779650
mul a6, t2, t7
lw t7, 126(sp)
and.T s0, t0, t7, -13
lw t6, 69(sp)
lw t7, 276(sp)
xor.1 t2, t6, t7
li t7, 51984461
mul s1, s1, t7
li t7, 179312102
mul t0, t4, t7
lw t6, 54(sp)
lw t7, 192(sp)
xor.T t4, t6, t7
add t5, s1, t5
add t6, t5, t3
sw t6, 3(sp)
xor.T s0, s0, a5
lw t6, 195(sp)
li t7, -189870660
mul a5, t6, t7
lw t6, 219(sp)
lw t7, 165(sp)
xor t3, t6, t7
lw t6, 258(sp)
li t7, 113766111
mul t5, t6, t7
or.1 s0, a4, s0
lw t7, 21(sp)
and.T s0, s0, t7, -13
and t2, t4, t2, 13
li t7, -12122085
mul t4, s0, t7
add a7, t4, a7
add a7, a7, t1
add a5, a7, a5
li t7, 139268480
mul t1, t2, t7
add s0, t0, t5
lw t7, 231(sp)
and t4, a4, t7, 13
lw t6, 54(sp)
lw t7, 126(sp)
and.1 t2, t6, t7, 13
li t7, -15997544
mul t5, t3, t7
lw t6, 264(sp)
lw t7, 105(sp)
xor.T t0, t6, t7
lw t7, 180(sp)
or.T t3, a4, t7
lw t6, 132(sp)
li t7, -189956527
mul a7, t6, t7
or a3, t3, a3, -13
lw t6, 60(sp)
lw t7, 192(sp)
or s1, t6, t7, -13
add t3, s0, t1
li t7, -126380576
mul a3, a3, t7
or.1 t1, t4, s1
li t7, -90147421
mul t1, t1, t7
add t4, t5, t1
lw t6, 219(sp)
lw t7, 69(sp)
xor.1 t5, t6, t7
lw t6, 240(sp)
lw t7, 159(sp)
xor.1 s0, t6, t7
lw t6, 285(sp)
li t7, -28854601
mul t1, t6, t7
add t4, a6, t4
and t2, t2, t5, 13
lw t6, 141(sp)
xor.T a6, t6, s0
li t7, 21053830
mul t2, t2, t7
add t2, t4, t2
add t2, t3, t2
lw t6, 99(sp)
lw t7, 126(sp)
xor.1 t3, t6, t7
lw t7, 90(sp)
xor t3, t3, t7
add t2, a5, t2
lw t6, 165(sp)
lw t7, 240(sp)
or.T a5, t6, t7
xor.1 t0, t0, a6
li t7, -81399333
mul a6, t3, t7
lw t6, 84(sp)
lw t7, 126(sp)
or t6, t6, t7, -13
sw t6, 186(sp)
li t7, 37087037
mul t0, t0, t7
add a7, a7, t0
lw t6, 84(sp)
lw t7, 207(sp)
xor t6, t6, t7
sw t6, 15(sp)
lw t6, 18(sp)
add a7, t6, a7
add a7, t2, a7
lw t6, 60(sp)
lw t7, 240(sp)
xor t0, t6, t7
lw t6, 84(sp)
lw t7, 207(sp)
xor.1 t6, t6, t7
sw t6, 30(sp)
and a4, t0, a4, 13
add a6, a6, t1
add a3, a3, a6
li t7, -121500657
mul a4, a4, t7
lw t6, 72(sp)
lw t7, 273(sp)
and t0, t6, t7, 13
add a6, a7, a3
lw t6, 9(sp)
lw t7, 228(sp)
xor.T a3, t6, t7
lw t6, 15(sp)
li t7, -86591738
mul t6, t6, t7
sw t6, 132(sp)
and.1 a5, t0, a5, 13
li t7, 75151847
mul a7, a5, t7
lw t6, 84(sp)
lw t7, 207(sp)
or.1 t6, t6, t7
sw t6, 72(sp)
lw t6, 201(sp)
lw t7, 147(sp)
xor.1 a5, t6, t7
add a4, a7, a4
lw t6, 3(sp)
add a6, t6, a6
lw t6, 126(sp)
lw t7, 84(sp)
xor.T t6, t6, t7
sw t6, 246(sp)
lw t6, 207(sp)
lw t7, 84(sp)
xor.T t6, t6, t7
sw t6, 90(sp)
lw t6, 39(sp)
lw t7, 84(sp)
or t6, t6, t7, -13
sw t6, 48(sp)
lw t6, 84(sp)
lw t7, 207(sp)
and.1 t6, t6, t7, 13
sw t6, 156(sp)
lw t6, 126(sp)
lw t7, 207(sp)
and.T t6, t6, t7, -13
sw t6, 54(sp)
lw t6, 156(sp)
and.T a3, t6, a3, -13
lw t6, 207(sp)
lw t7, 126(sp)
or.1 t6, t6, t7
sw t6, 213(sp)
lw t6, 12(sp)
lw t7, 213(sp)
xor a7, t6, t7
add a4, a6, a4
li t7, -33344912
mul t6, a3, t7
sw t6, 75(sp)
lw t6, 246(sp)
lw t7, 72(sp)
or.1 t6, t6, t7
sw t6, 51(sp)
li t7, 70986237
mul t6, a7, t7
sw t6, 33(sp)
lw t6, 0(sp)
add a3, t6, a4
lw t6, 126(sp)
lw t7, 207(sp)
xor.1 t6, t6, t7
sw t6, 195(sp)
lw t6, 30(sp)
lw t7, 195(sp)
and.T t6, t6, t7, -13
sw t6, 42(sp)
lw t6, 84(sp)
lw t7, 126(sp)
and.T a4, t6, t7, -13
lw t6, 6(sp)
add a3, t6, a3
lw t6, 207(sp)
and.T t6, t6, a3, -13
sw t6, 105(sp)
lw t7, 84(sp)
or t6, a3, t7, -13
sw t6, 12(sp)
lw t6, 84(sp)
and.T t6, t6, a3, -13
sw t6, 111(sp)
lw t7, 84(sp)
xor.1 t6, a3, t7
sw t6, 66(sp)
lw t6, 12(sp)
lw t7, 105(sp)
or a6, t6, t7, -13
lw t6, 207(sp)
xor t6, t6, a3
sw t6, 18(sp)
lw t6, 84(sp)
and t6, t6, a3, 13
sw t6, 36(sp)
lw t6, 111(sp)
lw t7, 126(sp)
or t0, t6, t7, -13
lw t6, 84(sp)
xor t6, t6, a3
sw t6, 219(sp)
lw t6, 18(sp)
and.T a5, t6, a5, -13
li t7, 130839512
mul t6, a5, t7
sw t6, 60(sp)
lw t7, 126(sp)
xor.T t6, a4, t7
sw t6, 6(sp)
lw t6, 219(sp)
lw t7, 126(sp)
or.1 a5, t6, t7
lw t6, 126(sp)
lw t7, 66(sp)
and t1, t6, t7, 13
lw t7, 84(sp)
or.1 t6, a3, t7
sw t6, 0(sp)
lw t6, 210(sp)
lw t7, 36(sp)
and.T a7, t6, t7, -13
lw t6, 15(sp)
lw t7, 0(sp)
and.T t3, t6, t7, -13
lw t6, 126(sp)
and.1 t6, t6, a3, 13
sw t6, 117(sp)
lw t6, 117(sp)
lw t7, 270(sp)
xor.1 t2, t6, t7
xor a5, a5, a3
lw t6, 105(sp)
and.1 a7, t6, a7, 13
li t7, 15963534
mul a7, a7, t7
lw t7, 114(sp)
and.T t3, t3, t7, -13
lw t7, 228(sp)
and.T t4, t3, t7, -13
lw t6, 84(sp)
xor.T t6, t6, a3
sw t6, 240(sp)
lw t6, 207(sp)
xor.T t6, t6, a3
sw t6, 3(sp)
li t7, -28453439
mul a5, a5, t7
and.T t3, t2, t0, -13
lw t6, 66(sp)
and.T t0, t6, t1, -13
li t7, -117824625
mul t1, t4, t7
lw t7, 123(sp)
xor.1 a6, a6, t7
lw t7, 207(sp)
and.1 t6, a3, t7, 13
sw t6, 165(sp)
lw t6, 126(sp)
or t6, t6, a3, -13
sw t6, 21(sp)
lw t7, 63(sp)
xor.T t4, t0, t7
lw t6, 186(sp)
lw t7, 240(sp)
or.T t0, t6, t7
lw t6, 3(sp)
lw t7, 51(sp)
and.1 t2, t6, t7, 13
lw t7, 9(sp)
xor t5, a6, t7
li t7, 108752616
mul t4, t4, t7
li t7, 157983614
mul s0, a3, t7
lw t6, 84(sp)
and.1 t6, t6, a3, 13
sw t6, 180(sp)
lw t6, 126(sp)
xor t6, t6, a3
sw t6, 69(sp)
li t7, 159388277
mul a6, t3, t7
lw t7, 9(sp)
or.T t3, t5, t7
li t7, -107009575
mul t3, t3, t7
lw t7, 75(sp)
add t5, s0, t7
lw t6, 42(sp)
or.1 s0, t6, a4
add a7, a7, t1
add t4, t4, a7
lw t6, 111(sp)
lw t7, 240(sp)
or.T t6, t6, t7
sw t6, 222(sp)
lw t7, 126(sp)
xor.T t6, a3, t7
sw t6, 99(sp)
li t7, 72522081
mul a7, s0, t7
lw t7, 33(sp)
add t5, t5, t7
li t7, 3287115
mul t1, t2, t7
lw t6, 111(sp)
and.T t2, t6, t0, -13
xor t6, a3, a3
sw t6, 192(sp)
add t0, t4, t3
lw t6, 54(sp)
lw t7, 192(sp)
or.T s0, t6, t7
add t4, a5, t5
lw t6, 207(sp)
lw t7, 36(sp)
or t3, t6, t7, -13
lw t7, 48(sp)
or.T t5, s0, t7
lw t7, 117(sp)
and.T a5, a3, t7, -13
lw t6, 18(sp)
lw t7, 222(sp)
xor.1 s0, t6, t7
lw t7, 117(sp)
xor.T a4, a4, t7
lw t7, 21(sp)
and.T a4, a4, t7, -13
lw t6, 165(sp)
and t3, t6, t3, 13
lw t6, 207(sp)
xor.1 t6, t6, a3
sw t6, 51(sp)
lw t6, 240(sp)
lw t7, 180(sp)
xor.1 s1, t6, t7
lw t7, 126(sp)
or.T t6, a3, t7
sw t6, 177(sp)
lw t6, 60(sp)
add t4, t6, t4
li t7, 1614622
mul t6, t5, t7
sw t6, 33(sp)
add t0, a6, t0
li t7, 78065546
mul a6, s0, t7
add a6, t1, a6
li t7, -88911679
mul t1, t2, t7
lw t6, 123(sp)
and.1 t2, t6, s1, 13
add a7, a7, a6
li t7, 52254164
mul a6, t2, t7
li t7, 29437587
mul t2, t3, t7
add t1, t2, t1
lw t6, 18(sp)
li t7, 13991195
mul t6, t6, t7
sw t6, 159(sp)
add t1, t4, t1
lw t6, 207(sp)
or.1 t3, t6, a5
lw t6, 30(sp)
lw t7, 69(sp)
xor a5, t6, t7
li t7, 37398628
mul t2, a4, t7
lw t6, 84(sp)
lw t7, 105(sp)
and.1 t6, t6, t7, 13
sw t6, 141(sp)
lw t6, 84(sp)
lw t7, 126(sp)
xor.1 t6, t6, t7
sw t6, 93(sp)
li t7, -187880186
mul a4, t3, t7
lw t6, 63(sp)
lw t7, 69(sp)
or.1 t3, t6, t7
li t7, 188156422
mul t4, t3, t7
lw t6, 126(sp)
lw t7, 207(sp)
xor.T t6, t6, t7
sw t6, 135(sp)
lw t6, 126(sp)
lw t7, 84(sp)
and t6, t6, t7, 13
sw t6, 129(sp)
add a7, t1, a7
lw t6, 192(sp)
lw t7, 210(sp)
xor.T t3, t6, t7
lw t6, 51(sp)
lw t7, 207(sp)
xor t1, t6, t7
add a7, t0, a7
lw t6, 207(sp)
or t6, t6, a3, -13
sw t6, 114(sp)
lw t6, 207(sp)
or.T t6, t6, a3
sw t6, 96(sp)
lw t7, 207(sp)
or.1 t6, a3, t7
sw t6, 150(sp)
lw t6, 114(sp)
lw t7, 219(sp)
xor.1 t5, t6, t7
lw t6, 207(sp)
and t6, t6, a3, 13
sw t6, 108(sp)
add t2, t4, t2
lw t6, 93(sp)
lw t7, 207(sp)
xor t0, t6, t7
add t2, t2, a6
lw t7, 126(sp)
xor.1 t6, a3, t7
sw t6, 75(sp)
lw t6, 99(sp)
lw t7, 18(sp)
and.1 a6, t6, t7, 13
lw t7, 75(sp)
xor.T t6, t3, t7
sw t6, 102(sp)
lw t6, 72(sp)
or.1 t6, t6, a3
sw t6, 216(sp)
li t7, 67278687
mul t6, t5, t7
sw t6, 162(sp)
lw t6, 129(sp)
lw t7, 156(sp)
xor.1 t3, t6, t7
lw t6, 129(sp)
li t7, 180984227
mul t6, t6, t7
sw t6, 60(sp)
lw t6, 192(sp)
lw t7, 123(sp)
and t6, t6, t7, 13
sw t6, 237(sp)
lw t6, 213(sp)
or.T a6, t6, a6
or.T a6, a6, t1
lw t6, 210(sp)
lw t7, 3(sp)
or t1, t6, t7, -13
lw t7, 180(sp)
xor t1, t1, t7
li t7, -164660031
mul t4, a6, t7
li t7, 111911359
mul a6, t0, t7
add t6, a7, t2
sw t6, 48(sp)
lw t6, 126(sp)
and t6, t6, a3, 13
sw t6, 183(sp)
or a5, t3, a5, -13
lw t6, 6(sp)
lw t7, 177(sp)
or.1 a7, t6, t7
lw t6, 24(sp)
xor.T a7, t6, a7
lw t6, 33(sp)
add t2, t6, t4
lw t6, 117(sp)
lw t7, 246(sp)
or.1 t0, t6, t7
lw t7, 246(sp)
and.T t5, t1, t7, -13
li t7, 183360161
mul t3, a7, t7
add t6, a4, t2
sw t6, 243(sp)
lw t6, 54(sp)
lw t7, 0(sp)
and.1 t1, t6, t7, 13
lw t6, 135(sp)
lw t7, 96(sp)
xor t4, t6, t7
lw t6, 135(sp)
li t7, 139015226
mul t6, t6, t7
sw t6, 138(sp)
lw t6, 90(sp)
or.1 a5, t6, a5
lw t6, 93(sp)
xor.T a7, t6, a3
lw t6, 108(sp)
lw t7, 150(sp)
and.T t2, t6, t7, -13
li t7, 77734022
mul t5, t5, t7
lw t6, 9(sp)
lw t7, 72(sp)
or a4, t6, t7, -13
slli a5, a5, 4
add a5, a5, a6
li t7, 20356193
mul t0, t0, t7
add a6, t5, t3
lw t7, 132(sp)
add t6, a6, t7
sw t6, 42(sp)
lw t6, 15(sp)
lw t7, 123(sp)
or.T t6, t6, t7
sw t6, 33(sp)
xor.T a6, t4, a4
li t7, 187097616
mul a6, a6, t7
lw t6, 105(sp)
li t7, -171595094
mul t6, t6, t7
sw t6, 153(sp)
li t7, -153116003
mul t3, t1, t7
lw t6, 126(sp)
lw t7, 207(sp)
and t6, t6, t7, 13
sw t6, 144(sp)
lw t7, 219(sp)
and.T t1, a3, t7, -13
lw t6, 165(sp)
xor.T t2, t6, t2
lw t6, 126(sp)
lw t7, 84(sp)
xor t6, t6, t7
sw t6, 6(sp)
lw t7, 102(sp)
and.T t2, t2, t7, -13
lw t6, 15(sp)
or.1 t4, t6, a7
lw t6, 30(sp)
lw t7, 186(sp)
and a7, t6, t7, 13
lw t6, 84(sp)
lw t7, 126(sp)
or.1 t6, t6, t7
sw t6, 102(sp)
lw t6, 102(sp)
or t4, t6, t4, -13
add a6, a6, t3
lw t6, 126(sp)
li t7, 77569941
mul t5, t6, t7
li t7, -69289253
mul t6, a7, t7
sw t6, 168(sp)
li t7, 4662631
mul s0, t1, t7
lw t6, 129(sp)
lw t7, 201(sp)
and a7, t6, t7, 13
lw t7, 60(sp)
add t3, t0, t7
li t7, 101546694
mul t0, t4, t7
lw t6, 141(sp)
li t7, 3389506
mul t1, t6, t7
lw t6, 90(sp)
lw t7, 75(sp)
xor t4, t6, t7
lw t6, 6(sp)
lw t7, 270(sp)
and.1 s1, t6, t7, 13
lw t7, 126(sp)
and.T t6, a3, t7, -13
sw t6, 132(sp)
lw t6, 126(sp)
lw t7, 84(sp)
and.1 t6, t6, t7, 13
sw t6, 141(sp)
add s2, t5, s0
lw t6, 75(sp)
li t7, -94642501
mul t6, t6, t7
sw t6, 0(sp)
lw t6, 159(sp)
add s0, t6, a5
lw t6, 144(sp)
li t7, -46375512
mul a5, t6, t7
lw t6, 105(sp)
or.T t5, t6, a4
lw t6, 141(sp)
xor s1, t6, s1
lw t6, 6(sp)
li t7, 144459933
mul a4, t6, t7
lw t7, 93(sp)
or t2, t2, t7, -13
li t7, 124668645
mul s3, t2, t7
add s2, t3, s2
lw t6, 210(sp)
lw t7, 165(sp)
and t2, t6, t7, 13
lw t7, 138(sp)
add s3, s3, t7
lw t6, 72(sp)
xor.T t3, t6, t4
lw t7, 162(sp)
add t4, s0, t7
lw t6, 201(sp)
lw t7, 126(sp)
xor t6, t6, t7
sw t6, 60(sp)
lw t6, 243(sp)
add s0, t6, t4
lw t6, 42(sp)
add t4, t6, s3
lw t6, 237(sp)
xor.1 s3, t6, s1
lw t6, 33(sp)
lw t7, 231(sp)
and s1, t6, t7, 13
and t5, t5, s3, 13
add s2, a6, s2
lw t6, 123(sp)
li t7, 34587427
mul a6, t6, t7
add t4, t4, s2
li t7, -102546669
mul t5, t5, t7
lw t7, 216(sp)
and.1 s2, a7, t7, 13
add a5, t0, a5
add a5, a5, t1
li t7, -126962583
mul a7, s1, t7
lw t6, 48(sp)
add t1, t6, s0
add a5, a5, t5
li t7, 102167784
mul t0, s2, t7
lw t6, 186(sp)
lw t7, 180(sp)
and t5, t6, t7, 13
lw t6, 123(sp)
lw t7, 51(sp)
xor s0, t6, t7
xor.T t2, t2, s0
lw t7, 132(sp)
and s0, t2, t7, 13
lw t6, 93(sp)
or t2, t6, t3, -13
add t6, t1, t4
sw t6, 30(sp)
li t7, 192403135
mul t1, s0, t7
lw t6, 132(sp)
lw t7, 111(sp)
xor.T t3, t6, t7
lw t6, 6(sp)
lw t7, 222(sp)
xor.1 s1, t6, t7
lw t6, 90(sp)
lw t7, 75(sp)
and t4, t6, t7, 13
add t1, a4, t1
li t7, 123371448
mul s0, t2, t7
lw t6, 201(sp)
lw t7, 165(sp)
or.T a4, t6, t7
lw t6, 0(sp)
add s2, t6, t1
lw t6, 87(sp)
lw t7, 108(sp)
xor t1, t6, t7
li t7, -30214582
mul t1, t1, t7
lw t6, 168(sp)
add s3, t6, t1
lw t6, 90(sp)
lw t7, 24(sp)
and.1 t2, t6, t7, 13
lw t6, 126(sp)
li t7, 190731017
mul t1, t6, t7
and.1 t5, a4, t5, 13
add t6, s2, t0
sw t6, 33(sp)
lw t7, 153(sp)
add a4, s3, t7
add t6, a4, a6
sw t6, 24(sp)
lw t7, 126(sp)
xor.1 s2, s1, t7
li t7, -25769062
mul a4, t3, t7
lw t6, 96(sp)
lw t7, 135(sp)
and.1 t3, t6, t7, 13
lw t6, 9(sp)
lw t7, 126(sp)
xor t0, t6, t7
lw t6, 231(sp)
lw t7, 102(sp)
or s1, t6, t7, -13
add s0, a7, s0
lw t7, 246(sp)
xor.T a7, a3, t7
lw t6, 63(sp)
lw t7, 114(sp)
or.T a6, t6, t7
or.1 t4, t4, t5
lw t6, 60(sp)
xor t5, t6, s2
li t7, -16368712
mul t5, t5, t7
add t6, a5, s0
sw t6, 42(sp)
li t7, 162169350
mul a5, t4, t7
lw t6, 54(sp)
lw t7, 126(sp)
xor.1 t4, t6, t7
add a5, t5, a5
li t7, -85796251
mul t4, t4, t7
lw t7, 66(sp)
xor.1 s0, s1, t7
lw t6, 126(sp)
lw t7, 36(sp)
and.T t5, t6, t7, -13
xor.1 s1, t2, t5
lw t6, 87(sp)
lw t7, 84(sp)
and t2, t6, t7, 13
li t7, 37443123
mul t5, a6, t7
add a6, t1, t4
li t7, 177424009
mul t1, s0, t7
li t7, -181616522
mul s0, s1, t7
lw t6, 114(sp)
li t7, -129195499
mul t4, t6, t7
li t7, 51339999
mul t3, t3, t7
lw t6, 90(sp)
lw t7, 63(sp)
or s1, t6, t7, -13
add t4, t1, t4
add t1, t5, s0
lw t7, 12(sp)
or.T s0, a3, t7
lw t7, 183(sp)
xor.T t5, a7, t7
or.1 a7, s1, s0
lw t7, 84(sp)
or t0, t0, t7, -13
li t7, 135173707
mul s0, t0, t7
li t7, 189481789
mul t0, t5, t7
lw t7, 90(sp)
or t5, a3, t7, -13
li t7, 182701010
mul a7, a7, t7
add a7, a7, s0
lw t6, 129(sp)
xor s0, t6, t2
add t2, t3, a4
lw t6, 216(sp)
li t7, -42570636
mul a4, t6, t7
lw t6, 207(sp)
lw t7, 180(sp)
and t3, t6, t7, 13
or.1 t5, s0, t5
lw t6, 126(sp)
or.1 t6, t6, a3
sw t6, 0(sp)
add t4, t4, t0
lw t6, 6(sp)
lw t7, 126(sp)
or t0, t6, t7, -13
li t7, -183527263
mul t5, t5, t7
add t1, t1, t4
lw t6, 207(sp)
lw t7, 0(sp)
and.T s1, t6, t7, -13
add a5, a5, t2
lw t6, 117(sp)
lw t7, 201(sp)
or.T t4, t6, t7
add a6, a5, a6
add t2, a7, t5
lw t6, 108(sp)
lw t7, 147(sp)
xor.T a5, t6, t7
lw t6, 201(sp)
lw t7, 6(sp)
xor s0, t6, t7
lw t6, 240(sp)
lw t7, 144(sp)
or.T s2, t6, t7
lw t6, 18(sp)
li t7, 54958565
mul a7, t6, t7
lw t6, 24(sp)
add t5, t6, a6
lw t6, 219(sp)
lw t7, 213(sp)
xor.T a6, t6, t7
or.T s3, s0, t3
lw t7, 165(sp)
or.T s0, s2, t7
lw t6, 210(sp)
lw t7, 201(sp)
or.1 s4, t6, t7
or s2, s1, a6, -13
lw t6, 228(sp)
lw t7, 84(sp)
or.1 a6, t6, t7
li t7, -139784620
mul a5, a5, t7
lw t6, 105(sp)
lw t7, 156(sp)
or.T t3, t6, t7
and t0, t0, s4, 13
or.T t4, t4, s3
lw t7, 18(sp)
or.T t4, t4, t7
li t7, -106986689
mul s3, t4, t7
li t7, 174972167
mul s1, t0, t7
li t7, 126660159
mul t0, s2, t7
lw t6, 150(sp)
lw t7, 195(sp)
xor t4, t6, t7
lw t6, 33(sp)
add s2, t6, t5
lw t6, 0(sp)
lw t7, 195(sp)
xor.T t5, t6, t7
add s3, t2, s3
li t7, 33841038
mul t2, s0, t7
add t1, t1, s3
lw t6, 42(sp)
add s0, t6, s2
add a4, t1, a4
lw t6, 12(sp)
lw t7, 207(sp)
or.1 t1, t6, t7
add t6, s0, a4
sw t6, 24(sp)
add a4, s1, t2
slli t2, t5, 2
add a4, a4, t2
slli t5, t3, 3
lw t6, 207(sp)
lw t7, 183(sp)
xor t3, t6, t7
lw t6, 108(sp)
xor.T t2, t6, a3
add a4, a7, a4
lw t7, 117(sp)
xor.T t4, t4, t7
lw t6, 132(sp)
lw t7, 9(sp)
or.T s1, t6, t7
lw t6, 15(sp)
lw t7, 84(sp)
xor.1 a7, t6, t7
lw t6, 126(sp)
lw t7, 156(sp)
and.1 s0, t6, t7, 13
li t7, 57615104
mul s2, s0, t7
and s0, t4, t1, 13
lw t6, 9(sp)
and s1, t6, s1, 13
add t4, t5, s2
li t7, 167755814
mul a6, a6, t7
lw t6, 207(sp)
lw t7, 18(sp)
or.T t5, t6, t7
lw t6, 69(sp)
lw t7, 165(sp)
and.T t1, t6, t7, -13
li t7, 163192653
mul s2, s0, t7
li t7, -111298574
mul s0, s1, t7
add t0, t0, s2
add a5, a5, t0
add t6, a4, a5
sw t6, 18(sp)
lw t6, 132(sp)
li t7, -129446784
mul a4, t6, t7
lw t7, 246(sp)
or.1 a5, t5, t7
or.1 t0, t3, a5
lw t6, 126(sp)
lw t7, 111(sp)
or.T t5, t6, t7
lw t6, 141(sp)
lw t7, 210(sp)
or.T t3, t6, t7
lw t6, 111(sp)
lw t7, 231(sp)
and a5, t6, t7, 13
lw t6, 102(sp)
or.T s2, t6, a5
li t7, 113346117
mul a5, t2, t7
li t7, 151234601
mul t0, t0, t7
lw t6, 0(sp)
lw t7, 207(sp)
xor.T t2, t6, t7
lw t6, 9(sp)
lw t7, 126(sp)
xor.T s1, t6, t7
li t7, 4307956
mul s2, s2, t7
add s2, t4, s2
add s0, s0, a6
add a6, t0, a5
lw t6, 3(sp)
li t7, -29991481
mul t4, t6, t7
add t6, s0, s2
sw t6, 6(sp)
lw t6, 219(sp)
li t7, -36901280
mul t0, t6, t7
lw t6, 99(sp)
lw t7, 231(sp)
and a5, t6, t7, 13
li t7, 43141636
mul a5, a5, t7
lw t6, 126(sp)
and.1 a7, t6, a7, 13
xor.1 t1, t5, t1
or.1 t1, t1, s1
li t7, -40005331
mul t1, t1, t7
lw t6, 228(sp)
lw t7, 66(sp)
and.1 s0, t6, t7, 13
lw t6, 12(sp)
li t7, 29082479
mul t5, t6, t7
lw t6, 156(sp)
and a7, t6, a7, 13
lw t6, 57(sp)
and t6, t6, a3, 13
sw t6, 114(sp)
lw t6, 3(sp)
lw t7, 93(sp)
xor.1 s1, t6, t7
li t7, 74019209
mul s0, s0, t7
lw t7, 165(sp)
and.T t3, t3, t7, -13
li t7, -33678005
mul a7, a7, t7
add t4, t4, a7
lw t6, 15(sp)
or.T s1, t6, s1
lw t6, 99(sp)
li t7, 83091141
mul a7, t6, t7
li t7, -59427917
mul s1, s1, t7
xor.T t3, t2, t3
add t2, s0, s1
add t2, t4, t2
li t7, 88951500
mul t3, t3, t7
add a4, a4, t3
add a4, t5, a4
lw t7, 234(sp)
and.1 t6, a3, t7, 13
sw t6, 159(sp)
lw t6, 294(sp)
li t7, 42873436
mul t6, t6, t7
sw t6, 12(sp)
add t1, t1, a4
lw t6, 57(sp)
li t7, -25517097
mul t6, t6, t7
sw t6, 3(sp)
lw t6, 156(sp)
li t7, 74685722
mul a4, t6, t7
lw t6, 234(sp)
lw t7, 57(sp)
or.1 t6, t6, t7
sw t6, 186(sp)
add t0, t0, t1
add t0, a6, t0
lw t6, 114(sp)
lw t7, 57(sp)
and.1 t6, t6, t7, 13
sw t6, 54(sp)
lw t7, 99(sp)
xor.1 a6, a3, t7
lw t7, 294(sp)
or.1 t6, a3, t7
sw t6, 147(sp)
li t7, 114756288
mul a6, a6, t7
lw t6, 198(sp)
lw t7, 174(sp)
or.T t1, t6, t7
lw t7, 171(sp)
or t6, t1, t7, -13
sw t6, 15(sp)
add a4, a4, a6
add a4, a4, a5
add a5, t2, a4
lw t7, 234(sp)
or t6, a3, t7, -13
sw t6, 156(sp)
lw t6, 15(sp)
li t7, -3143617
mul a4, t6, t7
lw t6, 57(sp)
lw t7, 234(sp)
or.T t6, t6, t7
sw t6, 108(sp)
add a5, a5, a7
lw t6, 159(sp)
li t7, 169665431
mul a6, t6, t7
add a7, t0, a5
lw t7, 294(sp)
and t6, a3, t7, 13
sw t6, 144(sp)
lw t6, 294(sp)
lw t7, 57(sp)
xor.T t6, t6, t7
sw t6, 141(sp)
lw t7, 234(sp)
xor t6, a3, t7
sw t6, 93(sp)
lw t6, 57(sp)
li t7, 59300497
mul a5, t6, t7
lw t7, 294(sp)
xor.T t6, a3, t7
sw t6, 123(sp)
lw t6, 294(sp)
or.T t6, t6, a3
sw t6, 210(sp)
lw t6, 93(sp)
lw t7, 123(sp)
or.1 t6, t6, t7
sw t6, 42(sp)
lw t7, 294(sp)
or t6, a3, t7, -13
sw t6, 135(sp)
lw t6, 141(sp)
lw t7, 186(sp)
xor.1 t0, t6, t7
lw t6, 147(sp)
lw t7, 156(sp)
xor.1 t1, t6, t7
li t7, -171716077
mul t1, t1, t7
lw t7, 282(sp)
or.1 t0, t0, t7
lw t6, 6(sp)
add a7, t6, a7
lw t6, 18(sp)
add t3, t6, a7
lw t6, 57(sp)
xor.T t6, t6, a3
sw t6, 33(sp)
lw t6, 108(sp)
lw t7, 210(sp)
and.1 a7, t6, t7, 13
lw t7, 144(sp)
or.T t6, a3, t7
sw t6, 6(sp)
lw t7, 159(sp)
xor.1 t0, t0, t7
lw t6, 57(sp)
and.T t6, t6, a3, -13
sw t6, 36(sp)
lw t6, 294(sp)
lw t7, 225(sp)
or.T t2, t6, t7
li t7, -23323491
mul t4, t0, t7
lw t6, 6(sp)
li t7, 129174935
mul t0, t6, t7
lw t6, 225(sp)
li t7, 86530703
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 57(sp)
and.1 t6, t6, a3, 13
sw t6, 51(sp)
lw t6, 3(sp)
add s0, t6, t1
lw t6, 24(sp)
add t1, t6, t3
lw t6, 30(sp)
add t6, t6, t1
sw t6, 60(sp)
lw t6, 252(sp)
lw t7, 294(sp)
xor.T t1, t6, t7
lw t6, 135(sp)
lw t7, 33(sp)
or t5, t6, t7, -13
lw t6, 294(sp)
lw t7, 57(sp)
and.T t6, t6, t7, -13
sw t6, 18(sp)
lw t6, 12(sp)
add t3, t6, s0
add a6, t4, a6
lw t6, 234(sp)
lw t7, 57(sp)
and.T t6, t6, t7, -13
sw t6, 48(sp)
add a6, a6, a4
lw t6, 204(sp)
lw t7, 48(sp)
or.1 a4, t6, t7
lw t7, 294(sp)
xor t6, a3, t7
sw t6, 162(sp)
lw t6, 234(sp)
and.T t6, t6, a3, -13
sw t6, 195(sp)
add a5, a6, a5
or a6, t2, t5, -13
lw t6, 57(sp)
lw t7, 294(sp)
xor.1 t6, t6, t7
sw t6, 138(sp)
lw t7, 162(sp)
and.1 a6, a6, t7, 13
lw t7, 57(sp)
or.1 a7, a7, t7
lw t6, 234(sp)
or.T t6, t6, a3
sw t6, 132(sp)
lw t7, 54(sp)
xor.1 a7, a7, t7
li t7, 39276816
mul a7, a7, t7
add t0, t0, a7
lw t6, 27(sp)
lw t7, 138(sp)
xor.1 a7, t6, t7
add t0, t3, t0
or a6, a6, t1, -13
add a5, a5, t0
lw t6, 195(sp)
lw t7, 114(sp)
and t0, t6, t7, 13
and.T a7, a3, a7, -13
lw t6, 294(sp)
lw t7, 57(sp)
or.1 t6, t6, t7
sw t6, 219(sp)
lw t6, 36(sp)
lw t7, 291(sp)
and.T t1, t6, t7, -13
xor t1, a4, t1
li t7, 41768775
mul t2, a6, t7
lw t6, 234(sp)
or.1 t6, t6, a3
sw t6, 54(sp)
lw t6, 132(sp)
lw t7, 234(sp)
and t3, t6, t7, 13
lw t6, 57(sp)
lw t7, 234(sp)
xor.T t6, t6, t7
sw t6, 213(sp)
lw t6, 45(sp)
lw t7, 234(sp)
or.T a6, t6, t7
lw t6, 234(sp)
li t7, -152291083
mul a4, t6, t7
xor t1, t1, t3
lw t7, 42(sp)
and.1 a7, a7, t7, 13
li t7, -137630693
mul a7, a7, t7
lw t6, 9(sp)
add t2, t6, t2
add t2, a7, t2
lw t6, 18(sp)
lw t7, 234(sp)
or.T a7, t6, t7
lw t6, 294(sp)
lw t7, 108(sp)
xor t3, t6, t7
li t7, -5436283
mul t6, t3, t7
sw t6, 3(sp)
lw t7, 138(sp)
and.T t0, t0, t7, -13
lw t6, 294(sp)
lw t7, 57(sp)
xor t6, t6, t7
sw t6, 201(sp)
li t7, -174484893
mul t0, t0, t7
li t7, -157252094
mul t3, t1, t7
lw t6, 198(sp)
lw t7, 219(sp)
and.T t1, t6, t7, -13
add t2, t2, t3
lw t6, 234(sp)
lw t7, 57(sp)
and.1 t6, t6, t7, 13
sw t6, 63(sp)
add t6, a5, t2
sw t6, 180(sp)
lw t6, 234(sp)
and t6, t6, a3, 13
sw t6, 12(sp)
lw t6, 51(sp)
or a5, t6, t1, -13
lw t6, 291(sp)
li t7, 74862200
mul t6, t6, t7
sw t6, 96(sp)
xor a5, a5, a6
lw t6, 63(sp)
lw t7, 45(sp)
or.1 a6, t6, t7
li t7, 86812119
mul t2, a5, t7
lw t6, 294(sp)
lw t7, 54(sp)
and.T a5, t6, t7, -13
lw t6, 156(sp)
lw t7, 48(sp)
or.T t1, t6, t7
lw t6, 234(sp)
xor.T t6, t6, a3
sw t6, 72(sp)
add t6, t0, t2
sw t6, 90(sp)
li t7, 32122255
mul a7, a7, t7
add t6, a7, a4
sw t6, 42(sp)
lw t6, 201(sp)
lw t7, 282(sp)
or.T t0, t6, t7
xor t1, t1, a6
lw t6, 108(sp)
lw t7, 234(sp)
and.1 t3, t6, t7, 13
lw t6, 294(sp)
lw t7, 57(sp)
or t6, t6, t7, -13
sw t6, 84(sp)
lw t6, 234(sp)
lw t7, 72(sp)
xor.1 t2, t6, t7
lw t6, 135(sp)
li t7, -3568881
mul a7, t6, t7
lw t6, 51(sp)
lw t7, 84(sp)
and.T t5, t6, t7, -13
lw t7, 162(sp)
or a4, a3, t7, -13
lw t7, 234(sp)
xor.1 t6, a3, t7
sw t6, 30(sp)
lw t6, 57(sp)
xor.1 t6, t6, a3
sw t6, 111(sp)
lw t6, 135(sp)
lw t7, 12(sp)
xor.T t4, t6, t7
lw t6, 171(sp)
or a6, t6, a3, -13
lw t6, 30(sp)
lw t7, 51(sp)
or.1 t6, t6, t7
sw t6, 102(sp)
and.1 a5, t5, a5, 13
lw t7, 111(sp)
and t5, t3, t7, 13
lw t6, 282(sp)
lw t7, 102(sp)
or.1 t3, t6, t7
xor.1 t0, t1, t0
lw t6, 294(sp)
lw t7, 213(sp)
xor.1 t1, t6, t7
lw t6, 195(sp)
or.T a5, t6, a5
or.1 t0, t2, t0
lw t7, 57(sp)
or t6, a3, t7, -13
sw t6, 66(sp)
li t7, 66127384
mul a5, a5, t7
li t7, -101613775
mul t0, t0, t7
lw t6, 186(sp)
lw t7, 294(sp)
and.1 s0, t6, t7, 13
and t5, t5, t4, 13
lw t6, 57(sp)
lw t7, 234(sp)
and t6, t6, t7, 13
sw t6, 105(sp)
lw t6, 66(sp)
li t7, 92177959
mul t2, t6, t7
lw t6, 294(sp)
lw t7, 105(sp)
or t4, t6, t7, -13
add t2, t2, a7
xor.1 a7, t1, s0
and a7, t3, a7, 13
lw t6, 294(sp)
and.1 t6, t6, a3, 13
sw t6, 129(sp)
li t7, -106777905
mul t1, a7, t7
li t7, -162933196
mul t5, t5, t7
lw t6, 198(sp)
lw t7, 15(sp)
and a7, t6, t7, 13
lw t6, 45(sp)
lw t7, 195(sp)
or t3, t6, t7, -13
lw t6, 105(sp)
li t7, 65685216
mul s0, t6, t7
li t7, 180224792
mul t4, t4, t7
li t7, 10203588
mul t3, t3, t7
lw t6, 120(sp)
and.1 a6, t6, a6, 13
li t7, 47784477
mul a4, a4, t7
add t2, t2, s0
add t5, t0, t5
lw t6, 294(sp)
lw t7, 57(sp)
and t6, t6, t7, 13
sw t6, 87(sp)
add t6, t2, t4
sw t6, 9(sp)
li t7, 109779645
mul t0, a6, t7
lw t6, 93(sp)
lw t7, 27(sp)
or.1 a6, t6, t7
li t7, -29456865
mul t2, a6, t7
add a6, t5, t1
lw t6, 3(sp)
add a6, t6, a6
add a6, a6, t3
add a6, a5, a6
lw t6, 234(sp)
lw t7, 57(sp)
xor.1 t6, t6, t7
sw t6, 15(sp)
lw t6, 87(sp)
lw t7, 51(sp)
or.T a5, t6, t7
lw t6, 57(sp)
lw t7, 294(sp)
and.1 t6, t6, t7, 13
sw t6, 24(sp)
add t2, t0, t2
lw t6, 294(sp)
and.T t6, t6, a3, -13
sw t6, 150(sp)
lw t6, 138(sp)
lw t7, 15(sp)
xor t0, t6, t7
or.1 t0, t0, a7
lw t6, 294(sp)
xor.1 t6, t6, a3
sw t6, 3(sp)
lw t6, 186(sp)
and.T a5, t6, a5, -13
lw t6, 120(sp)
li t7, -184527629
mul a7, t6, t7
li t7, -48161584
mul t3, a5, t7
lw t6, 72(sp)
lw t7, 66(sp)
or.T a5, t6, t7
lw t6, 231(sp)
lw t7, 150(sp)
or t1, t6, t7, -13
lw t6, 57(sp)
lw t7, 111(sp)
xor.T t4, t6, t7
li t7, -173860197
mul t1, t1, t7
add a4, a4, t2
lw t6, 42(sp)
add a6, t6, a6
lw t6, 33(sp)
li t7, -43951213
mul t2, t6, t7
lw t6, 231(sp)
lw t7, 27(sp)
or t5, t6, t7, -13
lw t6, 96(sp)
add a6, t6, a6
add t3, t3, a4
li t7, -16943555
mul s0, t4, t7
lw t6, 81(sp)
lw t7, 198(sp)
xor.T a4, t6, t7
lw t6, 156(sp)
lw t7, 144(sp)
xor.T t4, t6, t7
lw t6, 72(sp)
xor t5, t6, t5
li t7, -100009306
mul t0, t0, t7
add t2, s0, t2
lw t6, 84(sp)
lw t7, 282(sp)
xor.1 s0, t6, t7
li t7, -77049674
mul t5, t5, t7
lw t6, 63(sp)
lw t7, 195(sp)
and s1, t6, t7, 13
lw t6, 3(sp)
li t7, -58199405
mul s2, t6, t7
add t1, t3, t1
lw t7, 33(sp)
or.T t4, t4, t7
add a7, s2, a7
li t7, 33878835
mul t3, s1, t7
lw t6, 36(sp)
and s1, t6, t4, 13
li t7, -102233322
mul s0, s0, t7
lw t6, 159(sp)
lw t7, 111(sp)
and.T t4, t6, t7, -13
add a7, a7, t5
li t7, -27415076
mul t5, s1, t7
add t6, t2, t5
sw t6, 153(sp)
add t6, t3, s0
sw t6, 42(sp)
lw t6, 219(sp)
lw t7, 282(sp)
and.T t2, t6, t7, -13
add t0, t1, t0
lw t6, 9(sp)
add t5, t6, t0
lw t6, 120(sp)
lw t7, 57(sp)
xor t3, t6, t7
lw t6, 186(sp)
lw t7, 282(sp)
and t1, t6, t7, 13
lw t6, 36(sp)
or.1 t0, t6, a3
or.T a5, a5, t4
add a6, a6, t5
lw t6, 90(sp)
add t6, t6, a6
sw t6, 96(sp)
lw t6, 105(sp)
or a5, t6, a5, -13
lw t6, 135(sp)
li t7, 67880979
mul a6, t6, t7
li t7, 190559577
mul t5, a5, t7
lw t6, 201(sp)
li t7, 168723503
mul a5, t6, t7
li t7, 161405660
mul s1, t2, t7
lw t6, 141(sp)
lw t7, 135(sp)
xor t4, t6, t7
lw t6, 132(sp)
lw t7, 171(sp)
and.1 t2, t6, t7, 13
lw t6, 252(sp)
lw t7, 213(sp)
and s0, t6, t7, 13
add t5, t5, s1
or a4, a4, t3, -13
add t6, a7, t5
sw t6, 165(sp)
lw t7, 57(sp)
xor t6, a3, t7
sw t6, 216(sp)
lw t6, 12(sp)
xor.1 t3, t6, s0
lw t7, 195(sp)
or.1 a7, a3, t7
li t7, 185569551
mul s0, t0, t7
li t7, 131055388
mul t0, t3, t7
li t7, -144277583
mul t5, a4, t7
lw t6, 57(sp)
lw t7, 72(sp)
xor.1 t3, t6, t7
li t7, -103822589
mul t4, t4, t7
lw t6, 51(sp)
lw t7, 219(sp)
or a4, t6, t7, -13
add t0, a6, t0
lw t7, 216(sp)
xor a6, t1, t7
add t6, s0, t4
sw t6, 207(sp)
lw t6, 87(sp)
or.T t1, t6, t2
li t7, -64450343
mul t1, t1, t7
add t4, a5, t5
lw t6, 129(sp)
lw t7, 33(sp)
or t2, t6, t7, -13
lw t7, 27(sp)
xor.T s1, t3, t7
lw t7, 294(sp)
xor.1 a5, a6, t7
li t7, -150879979
mul t6, a5, t7
sw t6, 168(sp)
lw t6, 24(sp)
and t6, t6, a3, 13
sw t6, 144(sp)
lw t6, 84(sp)
lw t7, 105(sp)
or.1 a6, t6, t7
lw t6, 216(sp)
lw t7, 198(sp)
xor a5, t6, t7
lw t6, 111(sp)
lw t7, 198(sp)
xor.T t5, t6, t7
lw t6, 33(sp)
lw t7, 105(sp)
or s0, t6, t7, -13
lw t6, 57(sp)
lw t7, 294(sp)
or.T t6, t6, t7
sw t6, 12(sp)
li t7, -46116118
mul t3, a6, t7
li t7, 48803615
mul t6, a7, t7
sw t6, 90(sp)
lw t6, 30(sp)
li t7, -37779125
mul a6, t6, t7
li t7, 61651095
mul s4, s1, t7
lw t6, 198(sp)
xor s1, t6, a3
lw t6, 42(sp)
add s3, t6, t4
lw t6, 234(sp)
xor s2, t6, a7
add t1, s4, t1
lw t6, 87(sp)
lw t7, 252(sp)
xor.T t4, t6, t7
lw t7, 57(sp)
or.1 t6, a3, t7
sw t6, 30(sp)
lw t6, 12(sp)
lw t7, 15(sp)
or s4, t6, t7, -13
lw t6, 30(sp)
lw t7, 174(sp)
or.1 a7, t6, t7
add t6, s3, t0
sw t6, 42(sp)
lw t7, 132(sp)
and.1 t0, s0, t7, 13
lw t6, 15(sp)
xor.T t5, t6, t5
or.1 s0, t2, s4
lw t7, 234(sp)
xor a4, a4, t7
and.T t2, s2, t5, -13
li t7, -188440349
mul t2, t2, t7
li t7, 191008621
mul s1, s1, t7
lw t6, 108(sp)
or.T a4, t6, a4
li t7, -112762765
mul t5, a4, t7
lw t6, 294(sp)
li t7, 58536905
mul a4, t6, t7
li t7, -180001235
mul t6, a7, t7
sw t6, 9(sp)
add t5, t3, t5
li t7, -29612323
mul t3, s0, t7
lw t6, 51(sp)
lw t7, 192(sp)
xor.1 a7, t6, t7
add s0, t3, s1
lw t6, 171(sp)
lw t7, 54(sp)
or.T t3, t6, t7
lw t7, 66(sp)
xor t4, t4, t7
and t0, t0, t3, 13
lw t7, 159(sp)
and.1 t0, t0, t7, 13
lw t6, 15(sp)
lw t7, 123(sp)
and.1 t3, t6, t7, 13
xor.1 a5, t4, a5
li t7, -14883394
mul t0, t0, t7
add t1, t1, t5
lw t6, 87(sp)
and.T t4, t6, a3, -13
lw t6, 207(sp)
add t1, t6, t1
add a6, a6, s0
li t7, 186730658
mul t5, a5, t7
lw t6, 63(sp)
xor.1 a5, t6, t4
add a6, a6, t2
lw t6, 144(sp)
lw t7, 81(sp)
and.1 t2, t6, t7, 13
lw t6, 90(sp)
add t5, t6, t5
lw t7, 195(sp)
xor.T t4, t2, t7
lw t6, 219(sp)
lw t7, 27(sp)
or.1 t2, t6, t7
slli a5, a5, 5
lw t7, 198(sp)
and.T s0, t3, t7, -13
li t7, 190867247
mul t4, t4, t7
add t5, a6, t5
lw t6, 36(sp)
lw t7, 294(sp)
and.T t3, t6, t7, -13
li t7, -2694578
mul s0, s0, t7
lw t6, 150(sp)
li t7, -70647736
mul a6, t6, t7
lw t6, 24(sp)
li t7, -60413111
mul t6, t6, t7
sw t6, 87(sp)
li t7, 79606384
mul t2, t2, t7
add s0, s0, t4
add t4, t1, t5
lw t6, 156(sp)
lw t7, 210(sp)
and.1 t5, t6, t7, 13
lw t6, 225(sp)
lw t7, 141(sp)
and.1 t1, t6, t7, 13
lw t6, 63(sp)
lw t7, 282(sp)
xor.T s1, t6, t7
add t0, t0, s0
add a4, a4, t0
xor.T a7, t5, a7
xor.1 t0, s1, t3
lw t7, 15(sp)
or a7, a7, t7, -13
li t7, 60771805
mul t3, t0, t7
lw t6, 9(sp)
add t0, t6, a4
li t7, -162385240
mul a4, a7, t7
add a7, t4, t0
lw t6, 168(sp)
add t0, t6, a7
lw t6, 45(sp)
lw t7, 219(sp)
xor.T s0, t6, t7
lw t6, 6(sp)
li t7, 70832537
mul a7, t6, t7
lw t6, 201(sp)
lw t7, 234(sp)
and.1 t4, t6, t7, 13
add t5, t2, t3
lw t6, 63(sp)
and t2, t6, s0, 13
li t7, -9543693
mul t2, t2, t7
add t3, a6, t2
lw t6, 219(sp)
slli t2, t6, 7
add a5, a5, t5
lw t7, 210(sp)
or t4, t4, t7, -13
add a6, t0, a5
li t7, 93422606
mul a5, t1, t7
li t7, -96906985
mul t1, t4, t7
lw t6, 15(sp)
lw t7, 234(sp)
xor t0, t6, t7
lw t6, 93(sp)
xor.1 t4, t6, a3
add t1, t1, t3
lw t6, 186(sp)
lw t7, 54(sp)
xor t5, t6, t7
lw t6, 282(sp)
lw t7, 18(sp)
xor t3, t6, t7
add t1, t1, t2
lw t6, 216(sp)
and.1 t2, t6, t5, 13
or.T t0, t4, t0
li t7, 92786021
mul t0, t0, t7
add a7, t0, a7
lw t6, 57(sp)
slli t0, t6, 6
lw t6, 147(sp)
lw t7, 159(sp)
or.T t4, t6, t7
lw t7, 138(sp)
or t6, a3, t7, -13
sw t6, 9(sp)
or t2, t3, t2, -13
lw t6, 147(sp)
xor.T t4, t6, t4
li t7, -166945571
mul t3, t2, t7
add a4, a4, t1
lw t6, 159(sp)
lw t7, 18(sp)
or.T t2, t6, t7
li t7, 92029537
mul t5, t4, t7
lw t7, 87(sp)
add t4, a4, t7
lw t6, 204(sp)
lw t7, 129(sp)
xor.T t1, t6, t7
add t3, t3, t5
lw t6, 198(sp)
lw t7, 111(sp)
or.T a4, t6, t7
add t0, t3, t0
li t7, -111640777
mul t2, t2, t7
add a6, a6, t4
lw t6, 42(sp)
add a6, t6, a6
lw t6, 165(sp)
add a6, t6, a6
add t3, a6, a5
li t7, 28235210
mul a6, t1, t7
lw t6, 24(sp)
lw t7, 111(sp)
and.1 a5, t6, t7, 13
add t0, t0, t2
add a7, a7, t0
add a7, t3, a7
lw t6, 57(sp)
lw t7, 291(sp)
and.T t1, t6, t7, -13
lw t6, 105(sp)
li t7, 179494685
mul t0, t6, t7
lw t6, 162(sp)
lw t7, 24(sp)
and t2, t6, t7, 13
add t3, t0, a6
lw t6, 72(sp)
lw t7, 27(sp)
and t0, t6, t7, 13
xor a6, t2, t1
add a7, a7, t3
lw t6, 282(sp)
lw t7, 195(sp)
or.T t1, t6, t7
lw t6, 153(sp)
add a7, t6, a7
lw t6, 96(sp)
add t6, t6, a7
sw t6, 6(sp)
lw t6, 57(sp)
or.T t6, t6, a3
sw t6, 96(sp)
li t7, 151875170
mul a6, a6, t7
lw t7, 96(sp)
or a4, a4, t7, -13
lw t6, 114(sp)
lw t7, 225(sp)
xor t2, t6, t7
lw t6, 51(sp)
lw t7, 231(sp)
or a7, t6, t7, -13
lw t6, 198(sp)
xor.1 t0, t6, t0
and.1 t1, t1, t2, 13
and t0, t1, t0, 13
li t7, -90443547
mul a4, a4, t7
lw t6, 234(sp)
lw t7, 9(sp)
xor.1 t2, t6, t7
lw t6, 156(sp)
lw t7, 123(sp)
xor t3, t6, t7
lw t6, 192(sp)
xor.1 t1, t6, a3
or.1 a5, t3, a5
and.1 t0, t2, t0, 13
lw t7, 294(sp)
and.1 t2, a5, t7, 13
li t7, -77624468
mul t0, t0, t7
lw t6, 135(sp)
li t7, 64006630
mul a5, t6, t7
li t7, 18270759
mul t2, t2, t7
lw t7, 204(sp)
and.1 t3, t1, t7, 13
lw t6, 66(sp)
lw t7, 48(sp)
xor.1 t1, t6, t7
lw t7, 123(sp)
or.1 t3, t3, t7
and.1 a7, a7, t3, 13
lw t6, 105(sp)
or.T t1, t6, t1
li t7, -57295584
mul a7, a7, t7
add a7, t2, a7
add a6, a6, t0
lw t6, 12(sp)
lw t7, 231(sp)
and t0, t6, t7, 13
lw t6, 57(sp)
slli t2, t6, 7
lw t7, 12(sp)
xor.T t0, t0, t7
lw t6, 84(sp)
li t7, 74721522
mul t3, t6, t7
li t7, 80003588
mul t1, t1, t7
li t7, 68015264
mul t0, t0, t7
add a5, a5, t0
lw t6, 198(sp)
lw t7, 129(sp)
and t0, t6, t7, 13
add t3, t3, t2
add t2, a7, a5
add a7, t1, t3
lw t6, 213(sp)
lw t7, 120(sp)
or.1 a5, t6, t7
lw t6, 57(sp)
lw t7, 210(sp)
xor t3, t6, t7
lw t6, 3(sp)
li t7, -173003992
mul t1, t6, t7
li t7, 16300018
mul t3, t3, t7
add a6, a6, t2
add a4, a4, a6
lw t6, 213(sp)
lw t7, 18(sp)
and.T a6, t6, t7, -13
li t7, 21811441
mul t0, t0, t7
add a4, a4, a7
add a7, t0, t3
add t0, a7, t1
lw t6, 294(sp)
lw t7, 219(sp)
xor a7, t6, t7
li t7, -126204928
mul a6, a6, t7
lw t6, 15(sp)
lw t7, 102(sp)
xor.T t1, t6, t7
lw t6, 96(sp)
lw t7, 57(sp)
xor t2, t6, t7
li t7, -126323782
mul t1, t1, t7
and a5, t2, a5, 13
li t7, -81765280
mul a5, a5, t7
add a6, a6, t1
add a5, t0, a5
lw t6, 114(sp)
lw t7, 219(sp)
or.1 t0, t6, t7
lw t6, 126(sp)
lw t7, 78(sp)
xor.T t6, t6, t7
sw t6, 108(sp)
or.T a7, a7, t0
lw t6, 216(sp)
li t7, 11825017
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 126(sp)
lw t7, 57(sp)
or.T t6, t6, t7
sw t6, 3(sp)
lw t6, 57(sp)
lw t7, 78(sp)
or t6, t6, t7, -13
sw t6, 72(sp)
lw t6, 57(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 123(sp)
lw t6, 105(sp)
and t0, t6, a7, 13
lw t6, 3(sp)
lw t7, 72(sp)
xor a7, t6, t7
li t7, -176066158
mul t1, t0, t7
lw t6, 126(sp)
li t7, 171038817
mul t0, t6, t7
li t7, 155785007
mul a7, a7, t7
lw t6, 126(sp)
lw t7, 78(sp)
and.1 t6, t6, t7, 13
sw t6, 54(sp)
add a6, a6, t1
lw t6, 123(sp)
lw t7, 54(sp)
or t2, t6, t7, -13
add t1, a5, a6
lw t6, 123(sp)
lw t7, 108(sp)
xor.T a6, t6, t7
li t7, -159334642
mul t2, t2, t7
lw t6, 54(sp)
lw t7, 78(sp)
or.T a5, t6, t7
add a4, a4, t1
add t0, t0, t2
lw t6, 6(sp)
add a4, t6, a4
add t6, a7, t0
sw t6, 63(sp)
lw t6, 180(sp)
add t6, t6, a4
sw t6, 24(sp)
lw t6, 78(sp)
lw t7, 57(sp)
or.1 t6, t6, t7
sw t6, 132(sp)
lw t6, 78(sp)
lw t7, 57(sp)
or.T t6, t6, t7
sw t6, 45(sp)
lw t6, 45(sp)
lw t7, 132(sp)
xor.1 a4, t6, t7
or a4, a4, a6, -13
li t7, 173745280
mul t6, a4, t7
sw t6, 6(sp)
lw t6, 126(sp)
lw t7, 78(sp)
and t6, t6, t7, 13
sw t6, 129(sp)
lw t6, 78(sp)
xor t6, t6, a3
sw t6, 138(sp)
lw t6, 78(sp)
lw t7, 57(sp)
and.T t6, t6, t7, -13
sw t6, 42(sp)
lw t6, 42(sp)
lw t7, 129(sp)
or.1 a6, t6, t7
lw t6, 138(sp)
li t7, -61830383
mul a4, t6, t7
and a5, a5, a6, 13
li t7, -9873594
mul a5, a5, t7
add a4, a5, a4
lw t6, 0(sp)
lw t7, 75(sp)
and a5, t6, t7, 13
lw t7, 78(sp)
and.1 a6, a3, t7, 13
lw t6, 78(sp)
lw t7, 126(sp)
xor.1 t6, t6, t7
sw t6, 87(sp)
lw t6, 69(sp)
xor a6, t6, a6
lw t6, 231(sp)
lw t7, 129(sp)
or a7, t6, t7, -13
lw t6, 87(sp)
or.1 a7, t6, a7
xor a6, a6, a7
li t7, -60600819
mul a6, a6, t7
lw t6, 57(sp)
lw t7, 126(sp)
and t6, t6, t7, 13
sw t6, 12(sp)
add a4, a4, a6
lw t6, 114(sp)
lw t7, 87(sp)
xor.1 a6, t6, t7
lw t6, 126(sp)
lw t7, 57(sp)
xor t6, t6, t7
sw t6, 120(sp)
lw t6, 78(sp)
lw t7, 126(sp)
and.T t6, t6, t7, -13
sw t6, 90(sp)
lw t7, 108(sp)
or t0, a6, t7, -13
lw t6, 12(sp)
lw t7, 90(sp)
or.1 t6, t6, t7
sw t6, 93(sp)
lw t6, 126(sp)
lw t7, 78(sp)
or.T t6, t6, t7
sw t6, 18(sp)
lw t7, 93(sp)
or.1 a5, a5, t7
lw t6, 126(sp)
lw t7, 57(sp)
or t6, t6, t7, -13
sw t6, 102(sp)
li t7, 64623707
mul a7, a5, t7
lw t6, 120(sp)
slli t1, t6, 7
lw t6, 36(sp)
li t7, -184301881
mul a6, t6, t7
lw t6, 123(sp)
li t7, -177127067
mul a5, t6, t7
add a7, a7, t1
lw t7, 102(sp)
xor.1 t0, t0, t7
lw t6, 30(sp)
xor.1 t3, t6, a3
lw t6, 0(sp)
lw t7, 18(sp)
or.1 t1, t6, t7
lw t6, 21(sp)
lw t7, 126(sp)
xor t2, t6, t7
lw t6, 33(sp)
and t2, t6, t2, 13
lw t6, 99(sp)
xor.T t4, t6, t3
lw t6, 117(sp)
li t7, 92087747
mul t3, t6, t7
lw t6, 30(sp)
or.1 t4, t6, t4
li t7, 83710913
mul t0, t0, t7
add t0, t0, a6
li t7, -126154202
mul a6, t4, t7
li t7, -58044657
mul t4, t2, t7
lw t6, 189(sp)
lw t7, 18(sp)
or.T t2, t6, t7
add a7, a7, t0
add t0, t4, t3
lw t7, 81(sp)
and.1 t1, t1, t7, 13
lw t6, 3(sp)
lw t7, 12(sp)
xor.1 t3, t6, t7
lw t6, 78(sp)
lw t7, 126(sp)
or t6, t6, t7, -13
sw t6, 105(sp)
add a7, a4, a7
lw t7, 126(sp)
or.T a4, t3, t7
lw t6, 6(sp)
add a7, t6, a7
li t7, -21819128
mul t1, t1, t7
li t7, -79468026
mul t6, t2, t7
sw t6, 15(sp)
lw t6, 105(sp)
lw t7, 99(sp)
or.1 t2, t6, t7
lw t6, 78(sp)
lw t7, 57(sp)
and t6, t6, t7, 13
sw t6, 141(sp)
li t7, -30250405
mul t2, t2, t7
li t7, -90945144
mul a4, a4, t7
add a4, t1, a4
lw t6, 57(sp)
lw t7, 126(sp)
and.1 t6, t6, t7, 13
sw t6, 135(sp)
add t3, t2, a4
lw t6, 78(sp)
lw t7, 135(sp)
and.T t1, t6, t7, -13
lw t6, 87(sp)
lw t7, 45(sp)
or t4, t6, t7, -13
lw t6, 141(sp)
lw t7, 36(sp)
xor.T t2, t6, t7
lw t6, 78(sp)
xor.1 a4, t6, a3
li t7, -99244391
mul t2, t2, t7
lw t6, 132(sp)
lw t7, 114(sp)
and.T s0, t6, t7, -13
add t0, t0, t3
lw t6, 78(sp)
lw t7, 126(sp)
xor t6, t6, t7
sw t6, 27(sp)
add a5, a5, t0
li t7, -95054467
mul t1, t1, t7
lw t6, 105(sp)
lw t7, 75(sp)
or t3, t6, t7, -13
lw t6, 12(sp)
li t7, -86720790
mul t5, t6, t7
add a6, a6, a5
or.T a5, t4, s0
li t7, 91232134
mul a5, a5, t7
add a6, a7, a6
lw t6, 78(sp)
or.T t6, t6, a3
sw t6, 6(sp)
lw t6, 9(sp)
add t0, t6, a6
lw t6, 12(sp)
or.T a6, t6, a4
lw t6, 120(sp)
lw t7, 42(sp)
and.1 t4, t6, t7, 13
lw t6, 33(sp)
lw t7, 27(sp)
or.T a7, t6, t7
add t5, t2, t5
lw t7, 12(sp)
xor.T t2, a4, t7
xor.1 t2, t2, t3
lw t6, 123(sp)
lw t7, 6(sp)
or.1 t3, t6, t7
lw t6, 126(sp)
lw t7, 111(sp)
or.T s0, t6, t7
lw t7, 72(sp)
or s0, s0, t7, -13
add t5, t5, t1
lw t6, 0(sp)
and.T t3, t6, t3, -13
lw t7, 87(sp)
or.T t1, a7, t7
lw t6, 117(sp)
li t7, -175167352
mul a7, t6, t7
or.T t2, t2, s0
lw t6, 78(sp)
lw t7, 57(sp)
xor.1 t6, t6, t7
sw t6, 48(sp)
li t7, 80738875
mul s0, t2, t7
lw t6, 54(sp)
xor.1 t1, t6, t1
lw t6, 78(sp)
xor.T t6, t6, a3
sw t6, 144(sp)
li t7, 189408716
mul t1, t1, t7
li t7, -31138363
mul t2, a4, t7
lw t7, 96(sp)
or.T s1, a4, t7
add a5, a5, s0
lw t7, 3(sp)
and s0, t4, t7, 13
li t7, 55365174
mul t4, s1, t7
add a5, t5, a5
lw t6, 126(sp)
lw t7, 78(sp)
or.1 t6, t6, t7
sw t6, 84(sp)
lw t6, 15(sp)
add t5, t6, a5
lw t6, 123(sp)
li t7, 128442017
mul t6, t6, t7
sw t6, 9(sp)
lw t6, 18(sp)
li t7, -112778495
mul a5, t6, t7
add t6, t0, t5
sw t6, 15(sp)
lw t6, 99(sp)
lw t7, 93(sp)
xor.T t0, t6, t7
lw t6, 144(sp)
and.1 s0, t6, s0, 13
or.T t5, a6, t3
li t7, -154107588
mul a6, s0, t7
lw t6, 75(sp)
lw t7, 57(sp)
xor.1 s0, t6, t7
lw t6, 48(sp)
lw t7, 105(sp)
and.1 t3, t6, t7, 13
lw t7, 126(sp)
and.1 s1, t5, t7, 13
lw t7, 126(sp)
or.T t5, s0, t7
li t7, -13335588
mul s0, s1, t7
add s0, a6, s0
lw t6, 12(sp)
lw t7, 120(sp)
xor.T a6, t6, t7
or.1 t3, t5, t3
li t7, -110524489
mul t3, t3, t7
add a7, s0, a7
add t4, t4, t3
lw t6, 84(sp)
xor.1 t3, t6, a3
add a7, t1, a7
add t1, t2, t4
or.T a4, a4, a3
lw t6, 57(sp)
li t7, 176294354
mul t2, t6, t7
lw t6, 57(sp)
xor.1 a4, t6, a4
add t1, t1, t2
lw t6, 96(sp)
lw t7, 216(sp)
xor t2, t6, t7
add a7, a7, t1
or t0, t0, a3, -13
lw t6, 126(sp)
lw t7, 57(sp)
and.T t6, t6, t7, -13
sw t6, 42(sp)
li t7, -192236799
mul t1, t0, t7
lw t6, 96(sp)
lw t7, 120(sp)
or.1 t4, t6, t7
lw t7, 114(sp)
xor.T t0, t2, t7
li t7, 149509809
mul t2, t0, t7
li t7, -107553397
mul a4, a4, t7
lw t6, 21(sp)
lw t7, 12(sp)
and.1 t0, t6, t7, 13
lw t6, 57(sp)
and.T a6, t6, a6, -13
and.T a6, t3, a6, -13
add t2, a5, t2
li t7, 91928590
mul a6, a6, t7
li t7, -25469154
mul a5, t4, t7
add t1, t1, a6
lw t6, 96(sp)
lw t7, 135(sp)
or.T a6, t6, t7
lw t6, 9(sp)
add t3, t6, t1
lw t6, 126(sp)
lw t7, 42(sp)
or.1 t1, t6, t7
li t7, -55597799
mul t1, t1, t7
add t1, a4, t1
lw t6, 12(sp)
lw t7, 75(sp)
xor.T a4, t6, t7
add t2, t3, t2
add a7, a7, t2
lw t6, 15(sp)
add t2, t6, a7
lw t7, 75(sp)
or.T a7, t0, t7
lw t6, 63(sp)
add t6, t6, t2
sw t6, 15(sp)
lw t7, 78(sp)
or t6, a3, t7, -13
sw t6, 9(sp)
li t7, 2346728
mul a6, a6, t7
li t7, 18096558
mul a7, a7, t7
add t0, a7, a6
lw t6, 57(sp)
li t7, 140921834
mul a6, t6, t7
lw t6, 114(sp)
li t7, 94237226
mul a7, t6, t7
lw t6, 126(sp)
lw t7, 57(sp)
xor.1 t6, t6, t7
sw t6, 93(sp)
lw t6, 57(sp)
lw t7, 78(sp)
xor.T t6, t6, t7
sw t6, 63(sp)
add a5, t0, a5
add a5, t1, a5
lw t6, 75(sp)
lw t7, 144(sp)
xor.T t1, t6, t7
lw t6, 63(sp)
lw t7, 126(sp)
and.T t0, t6, t7, -13
lw t7, 132(sp)
and t0, t0, t7, 13
li t7, -55065395
mul t0, t0, t7
add a5, a5, t0
lw t6, 72(sp)
lw t7, 120(sp)
and.1 t3, t6, t7, 13
lw t6, 90(sp)
li t7, 76877365
mul t0, t6, t7
lw t6, 75(sp)
lw t7, 120(sp)
and.T t2, t6, t7, -13
lw t6, 93(sp)
lw t7, 141(sp)
and.1 t4, t6, t7, 13
or.1 a4, t3, a4
li t7, 60260017
mul a4, a4, t7
add t3, a6, a4
lw t7, 12(sp)
or.1 a6, a3, t7
lw t6, 126(sp)
lw t7, 57(sp)
or.1 t5, t6, t7
li t7, -118512078
mul a4, t4, t7
lw t6, 6(sp)
lw t7, 21(sp)
xor t4, t6, t7
or.1 t1, t1, t4
lw t6, 216(sp)
lw t7, 81(sp)
or.T t4, t6, t7
li t7, 91161091
mul t1, t1, t7
add a7, a7, t1
add a7, t3, a7
lw t7, 84(sp)
xor.T t3, t5, t7
lw t6, 27(sp)
lw t7, 36(sp)
and.1 t1, t6, t7, 13
li t7, 95609289
mul t2, t2, t7
li t7, -83415889
mul t3, t3, t7
add t3, a4, t3
li t7, 114345169
mul a4, t4, t7
add t0, t0, t3
add a7, a7, t0
add t6, t2, a4
sw t6, 111(sp)
li t7, 180903092
mul a4, a3, t7
add a5, a5, a7
lw t6, 129(sp)
li t7, -5701928
mul a7, t6, t7
lw t6, 15(sp)
add t6, t6, a5
sw t6, 90(sp)
lw t6, 27(sp)
lw t7, 216(sp)
xor.1 t0, t6, t7
lw t6, 108(sp)
xor.1 a5, t6, t1
lw t7, 123(sp)
or.T t0, t0, t7
and.1 a6, a6, t0, 13
li t7, -145244139
mul a6, a6, t7
lw t6, 177(sp)
lw t7, 18(sp)
and.T t1, t6, t7, -13
lw t6, 42(sp)
lw t7, 33(sp)
or.T t0, t6, t7
or.1 a5, a5, t0
li t7, 186783752
mul t0, a5, t7
li t7, 92870707
mul t1, t1, t7
lw t6, 96(sp)
lw t7, 132(sp)
and.1 t2, t6, t7, 13
lw t6, 57(sp)
lw t7, 78(sp)
xor a5, t6, t7
lw t6, 78(sp)
and t6, t6, a3, 13
sw t6, 81(sp)
lw t7, 39(sp)
or.T t5, a3, t7
lw t6, 126(sp)
and.1 t3, t6, a5, 13
lw t6, 78(sp)
lw t7, 81(sp)
and.1 t4, t6, t7, 13
lw t6, 126(sp)
lw t7, 57(sp)
xor.T t6, t6, t7
sw t6, 39(sp)
and.T t5, t2, t5, -13
lw t6, 33(sp)
lw t7, 42(sp)
xor.T t2, t6, t7
lw t6, 114(sp)
lw t7, 39(sp)
or s0, t6, t7, -13
xor.1 t4, t4, t5
xor.1 t3, t3, s0
lw t7, 36(sp)
or.1 t4, t4, t7
li t7, -30775031
mul t4, t4, t7
add t1, t1, t4
add t0, t0, t1
add t1, a7, t0
lw t6, 3(sp)
lw t7, 9(sp)
and a7, t6, t7, 13
lw t6, 93(sp)
or.T t0, t6, t2
lw t6, 51(sp)
or t3, t6, t3, -13
li t7, -40815925
mul t0, t0, t7
lw t7, 87(sp)
or.T t2, a3, t7
li t7, 150297052
mul t3, t3, t7
add t1, t1, t3
add a6, a6, t1
add a4, a4, a6
lw t6, 21(sp)
and.1 t1, t6, t2, 13
lw t6, 81(sp)
lw t7, 192(sp)
or.T a6, t6, t7
li t7, -6796036
mul a6, a6, t7
add a6, a6, t0
lw t6, 138(sp)
and.T a7, t6, a7, -13
li t7, -103966734
mul a7, a7, t7
lw t6, 78(sp)
and.T t6, t6, a3, -13
sw t6, 15(sp)
lw t6, 141(sp)
and.1 a5, t6, a5, 13
xor.T a5, a5, t1
lw t6, 105(sp)
lw t7, 99(sp)
and.T t1, t6, t7, -13
lw t6, 129(sp)
xor t0, t6, a3
lw t6, 144(sp)
lw t7, 27(sp)
xor.T t2, t6, t7
li t7, -153486459
mul t1, t1, t7
li t7, 22709515
mul t2, t2, t7
li t7, 78675877
mul t3, t0, t7
lw t7, 144(sp)
or a5, a5, t7, -13
lw t6, 15(sp)
lw t7, 57(sp)
and t0, t6, t7, 13
add t2, t2, t3
li t7, 97500027
mul t3, a5, t7
add a5, t1, t2
add a7, t3, a7
add a6, a6, a7
add a6, a6, a5
lw t6, 126(sp)
lw t7, 18(sp)
and.1 a7, t6, t7, 13
lw t6, 177(sp)
li t7, -144259773
mul a5, t6, t7
add a4, a4, a6
lw t6, 111(sp)
add a4, t6, a4
lw t7, 57(sp)
or.T a6, t0, t7
li t7, -146935131
mul t0, a6, t7
lw t6, 36(sp)
slli a6, t6, 7
lw t6, 9(sp)
li t7, -171427921
mul t1, t6, t7
add t0, t0, t1
lw t6, 6(sp)
lw t7, 42(sp)
xor.1 t2, t6, t7
lw t6, 135(sp)
lw t7, 132(sp)
xor.T t1, t6, t7
lw t6, 63(sp)
or.1 a7, t6, a7
lw t6, 87(sp)
and.1 t2, t6, t2, 13
li t7, 36862153
mul t2, t2, t7
add a5, a5, t2
add t0, t0, a5
li t7, -61640957
mul a5, t1, t7
li t7, -140085607
mul a7, a7, t7
add a6, a6, a7
add a6, t0, a6
add a4, a4, a6
lw t6, 108(sp)
lw t7, 45(sp)
xor a6, t6, t7
lw t7, 9(sp)
xor.T a7, a6, t7
lw t6, 78(sp)
li t7, 141145004
mul a6, t6, t7
li t7, -3824641
mul a7, a7, t7
add a7, a5, a7
lw t6, 15(sp)
lw t7, 135(sp)
and.T a5, t6, t7, -13
add a4, a4, a7
lw t6, 129(sp)
lw t7, 99(sp)
or.T a7, t6, t7
xor.T a5, a5, a7
li t7, -62866734
mul a5, a5, t7
add a5, a6, a5
lw t6, 117(sp)
lw t7, 81(sp)
or.1 a6, t6, t7
li t7, 165728452
mul a6, a6, t7
add a5, a5, a6
lw t6, 96(sp)
lw t7, 63(sp)
xor.T a6, t6, t7
lw t7, 84(sp)
xor a6, a6, t7
li t7, 183687489
mul a6, a6, t7
lw t6, 120(sp)
lw t7, 6(sp)
xor.1 a7, t6, t7
li t7, 159952959
mul a7, a7, t7
add a7, a6, a7
lw t6, 177(sp)
lw t7, 120(sp)
xor a6, t6, t7
add a5, a5, a7
add a4, a4, a5
lw t6, 105(sp)
lw t7, 99(sp)
and a5, t6, t7, 13
and.1 a5, a6, a5, 13
lw t6, 72(sp)
lw t7, 135(sp)
or.T a7, t6, t7
li t7, -153046878
mul a5, a5, t7
lw t7, 78(sp)
or.1 a6, a3, t7
lw t7, 183(sp)
and.T a7, a7, t7, -13
lw t7, 3(sp)
and.T a7, a7, t7, -13
li t7, -147409923
mul t0, a7, t7
lw t6, 132(sp)
lw t7, 126(sp)
xor a7, t6, t7
add a5, a5, t0
lw t6, 12(sp)
or.1 a6, t6, a6
lw t6, 96(sp)
lw t7, 57(sp)
and.1 t0, t6, t7, 13
li t7, 26415092
mul a6, a6, t7
and.1 a7, t0, a7, 13
and.1 a7, a3, a7, 13
li t7, -165166730
mul a7, a7, t7
add a7, a6, a7
lw t7, 138(sp)
and a6, a3, t7, 13
lw t6, 27(sp)
lw t7, 72(sp)
and.1 t0, t6, t7, 13
and.T t0, a6, t0, -13
lw t6, 69(sp)
li t7, -103379573
mul a6, t6, t7
li t7, -13275593
mul t0, t0, t7
add a7, a7, t0
add a5, a5, a7
lw t6, 0(sp)
lw t7, 102(sp)
and.1 a7, t6, t7, 13
add a4, a4, a5
li t7, -109465875
mul a5, a7, t7
add a5, a6, a5
lw t6, 9(sp)
lw t7, 39(sp)
and a6, t6, t7, 13
slli a6, a6, 7
lw t6, 9(sp)
li t7, 171017320
mul a7, t6, t7
lw t6, 69(sp)
lw t7, 123(sp)
and t0, t6, t7, 13
lw t6, 69(sp)
lw t7, 48(sp)
and.T t1, t6, t7, -13
or.1 t0, t0, t1
li t7, -162740561
mul t0, t0, t7
add a7, a7, t0
lw t6, 27(sp)
lw t7, 99(sp)
or.1 t0, t6, t7
li t7, 176862271
mul t0, t0, t7
add a7, a7, t0
add a6, a6, a7
add a5, a5, a6
lw t6, 66(sp)
lw t7, 75(sp)
or a6, t6, t7, -13
lw t7, 129(sp)
xor.T a6, a6, t7
li t7, -68756821
mul a6, a6, t7
lw t6, 87(sp)
li t7, 123217909
mul a7, t6, t7
lw t6, 42(sp)
li t7, 156085648
mul t0, t6, t7
add a7, a7, t0
add a6, a6, a7
lw t6, 177(sp)
lw t7, 15(sp)
and.1 a7, t6, t7, 13
lw t6, 54(sp)
lw t7, 126(sp)
xor.T t0, t6, t7
xor a7, a7, t0
li t7, 155351676
mul a7, a7, t7
lw t6, 30(sp)
li t7, 36621387
mul t0, t6, t7
add a7, a7, t0
lw t6, 105(sp)
lw t7, 78(sp)
and.T t0, t6, t7, -13
lw t6, 123(sp)
or.1 t0, t6, t0
li t7, 192999094
mul t0, t0, t7
add a7, a7, t0
lw t7, 81(sp)
or.1 a3, a3, t7
li t7, -139885439
mul a3, a3, t7
add a3, a7, a3
add a3, a6, a3
lw t6, 75(sp)
lw t7, 48(sp)
or a6, t6, t7, -13
lw t6, 129(sp)
or.1 a6, t6, a6
lw t6, 126(sp)
lw t7, 75(sp)
xor a7, t6, t7
xor a6, a6, a7
slli a6, a6, 5
add a3, a3, a6
add a3, a5, a3
add a3, a4, a3
lw t6, 90(sp)
add a3, t6, a3
lw t7, 60(sp)
sw t7, 0(a0)
lw t7, 24(sp)
sw t7, 0(a1)
sw a3, 0(a2)
li a0, 0
lw s0, 363(sp)
lw s1, 366(sp)
lw s2, 369(sp)
lw s3, 372(sp)
lw s4, 375(sp)
lw s5, 378(sp)
lw s6, 381(sp)
lw s7, 384(sp)
li t7, 387
add sp, sp, t7
ret 
__strings:
.tryte 105
.tryte 110
.tryte 112
.tryte 117
.tryte 116
.tryte 32
.tryte 102
.tryte 108
.tryte 97
.tryte 103
.tryte 58
.tryte 32
.tryte 0
.tryte 116
.tryte 114
.tryte 121
.tryte 32
.tryte 97
.tryte 103
.tryte 97
.tryte 105
.tryte 110
.tryte 0
.tryte 99
.tryte 111
.tryte 114
.tryte 114
.tryte 101
.tryte 99
.tryte 116
.tryte 0
.tryte 37
.tryte 115
.tryte 0
.tryte 0
.tryte 0
__globals: