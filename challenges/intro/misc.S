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
la a1, __globals+15
li a2, 0
la a3, __globals+15
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
la a1, __globals+15
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
la a1, __globals+744
li t7, 729
add a1, a1, t7
bne a0, a1, _putchar_label17
li a0, 1
la a1, __globals+744
li a2, 729
jal write
la a0, __globals+6
la a1, __globals+744
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
la a4, __globals+15
sw a4, 0(a3)
sw a4, 0(a2)
la a2, __globals+6
la a3, __globals+744
sw a3, 0(a2)
jal main
jal exit
flush:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 1
la a1, __globals+744
la a2, __globals+6
lw a2, 0(a2)
la a3, __globals+744
sub a2, a2, a3
jal write
la a0, __globals+6
la a1, __globals+744
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
show_q:
sw ra, -3(sp)
addi sp, sp, -3
la a1, __strings+618
mv t6, a0
mv a0, a1
mv a1, t6
jal printf
addi sp, sp, 3
lw ra, -3(sp)
ret 
q1:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 1
jal show_q
la a0, __strings+800
jal printf
la a0, __strings+874
la a1, __globals+9
jal scanf
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
q2:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 2
jal show_q
la a0, __strings+330
jal puts
la a0, __strings+70
jal puts
la a0, __strings+665
jal puts
la a0, __strings+854
jal printf
la a0, __strings+877
la a1, __globals+1473
jal scanf
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
censored: 
[[ there was an instruction here ]] 
q3:
sw ra, -3(sp)
addi sp, sp, -3
li a0, 3
jal show_q
la a0, __strings+566
jal puts
la a0, __strings+868
jal puts
la a0, __strings+202
jal puts
la a0, __strings+756
jal puts
la a0, __strings+0
jal puts
la a0, __strings+138
jal puts
la a0, __strings+854
jal printf
la a0, __strings+874
la a1, __globals+12
jal scanf
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
main:
sw ra, -3(sp)
addi sp, sp, -3
la a0, __strings+513
jal puts
la a0, __strings+392
jal puts
jal q1
jal q2
jal q3
la a0, __strings+454
jal puts
la a0, __strings+711
jal puts
la a0, __strings+69
jal puts
la a0, __strings+830
jal puts
la a0, __strings+266
la a1, __globals+9
lw a1, 0(a1)
la a2, __globals+1473
la a3, __globals+12
lw a3, 0(a3)
jal printf
li a0, 0
addi sp, sp, 3
lw ra, -3(sp)
ret 
__strings:
.tryte 50
.tryte 46
.tryte 32
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 49
.tryte 48
.tryte 48
.tryte 32
.tryte 97
.tryte 110
.tryte 100
.tryte 32
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 49
.tryte 48
.tryte 48
.tryte 32
.tryte 97
.tryte 114
.tryte 101
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 115
.tryte 97
.tryte 109
.tryte 101
.tryte 32
.tryte 105
.tryte 110
.tryte 115
.tryte 116
.tryte 114
.tryte 117
.tryte 99
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 0
.tryte 65
.tryte 110
.tryte 115
.tryte 119
.tryte 101
.tryte 114
.tryte 32
.tryte 115
.tryte 104
.tryte 111
.tryte 117
.tryte 108
.tryte 100
.tryte 32
.tryte 98
.tryte 101
.tryte 32
.tryte 105
.tryte 110
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 98
.tryte 97
.tryte 108
.tryte 97
.tryte 110
.tryte 99
.tryte 101
.tryte 100
.tryte 32
.tryte 116
.tryte 101
.tryte 114
.tryte 110
.tryte 97
.tryte 114
.tryte 121
.tryte 32
.tryte 102
.tryte 111
.tryte 114
.tryte 109
.tryte 97
.tryte 116
.tryte 32
.tryte 111
.tryte 102
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 105
.tryte 110
.tryte 115
.tryte 116
.tryte 114
.tryte 117
.tryte 99
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 44
.tryte 0
.tryte 39
.tryte 101
.tryte 99
.tryte 97
.tryte 108
.tryte 108
.tryte 39
.tryte 44
.tryte 32
.tryte 115
.tryte 105
.tryte 110
.tryte 99
.tryte 101
.tryte 32
.tryte 111
.tryte 110
.tryte 108
.tryte 121
.tryte 32
.tryte 111
.tryte 112
.tryte 99
.tryte 111
.tryte 100
.tryte 101
.tryte 32
.tryte 105
.tryte 115
.tryte 32
.tryte 117
.tryte 115
.tryte 101
.tryte 100
.tryte 44
.tryte 32
.tryte 97
.tryte 108
.tryte 108
.tryte 32
.tryte 111
.tryte 116
.tryte 104
.tryte 101
.tryte 114
.tryte 32
.tryte 116
.tryte 114
.tryte 105
.tryte 116
.tryte 115
.tryte 32
.tryte 97
.tryte 114
.tryte 101
.tryte 32
.tryte 105
.tryte 103
.tryte 110
.tryte 111
.tryte 114
.tryte 101
.tryte 100
.tryte 0
.tryte 49
.tryte 46
.tryte 32
.tryte 39
.tryte 97
.tryte 100
.tryte 100
.tryte 32
.tryte 116
.tryte 48
.tryte 44
.tryte 32
.tryte 122
.tryte 101
.tryte 114
.tryte 111
.tryte 44
.tryte 32
.tryte 122
.tryte 101
.tryte 114
.tryte 111
.tryte 44
.tryte 32
.tryte 48
.tryte 39
.tryte 32
.tryte 97
.tryte 110
.tryte 100
.tryte 32
.tryte 39
.tryte 97
.tryte 100
.tryte 100
.tryte 105
.tryte 32
.tryte 116
.tryte 48
.tryte 44
.tryte 32
.tryte 122
.tryte 101
.tryte 114
.tryte 111
.tryte 44
.tryte 32
.tryte 48
.tryte 39
.tryte 32
.tryte 97
.tryte 114
.tryte 101
.tryte 32
.tryte 100
.tryte 105
.tryte 102
.tryte 102
.tryte 101
.tryte 114
.tryte 101
.tryte 110
.tryte 116
.tryte 0
.tryte 112
.tryte 114
.tryte 105
.tryte 110
.tryte 116
.tryte 40
.tryte 39
.tryte 84
.tryte 72
.tryte 85
.tryte 67
.tryte 84
.tryte 70
.tryte 123
.tryte 83
.tryte 105
.tryte 109
.tryte 112
.tryte 108
.tryte 101
.tryte 95
.tryte 86
.tryte 77
.tryte 95
.tryte 37
.tryte 37
.tryte 115
.tryte 125
.tryte 39
.tryte 32
.tryte 37
.tryte 37
.tryte 32
.tryte 109
.tryte 100
.tryte 53
.tryte 40
.tryte 98
.tryte 39
.tryte 37
.tryte 100
.tryte 95
.tryte 37
.tryte 115
.tryte 95
.tryte 37
.tryte 100
.tryte 39
.tryte 41
.tryte 46
.tryte 104
.tryte 101
.tryte 120
.tryte 100
.tryte 105
.tryte 103
.tryte 101
.tryte 115
.tryte 116
.tryte 40
.tryte 41
.tryte 41
.tryte 10
.tryte 0
.tryte 73
.tryte 110
.tryte 32
.tryte 116
.tryte 104
.tryte 105
.tryte 115
.tryte 32
.tryte 99
.tryte 111
.tryte 100
.tryte 101
.tryte 44
.tryte 32
.tryte 97
.tryte 110
.tryte 32
.tryte 105
.tryte 110
.tryte 115
.tryte 116
.tryte 114
.tryte 99
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 32
.tryte 105
.tryte 115
.tryte 32
.tryte 99
.tryte 101
.tryte 110
.tryte 115
.tryte 111
.tryte 114
.tryte 101
.tryte 100
.tryte 46
.tryte 32
.tryte 67
.tryte 97
.tryte 110
.tryte 32
.tryte 121
.tryte 111
.tryte 117
.tryte 32
.tryte 102
.tryte 105
.tryte 110
.tryte 100
.tryte 32
.tryte 105
.tryte 116
.tryte 32
.tryte 111
.tryte 117
.tryte 116
.tryte 63
.tryte 0
.tryte 89
.tryte 111
.tryte 117
.tryte 32
.tryte 110
.tryte 101
.tryte 101
.tryte 100
.tryte 32
.tryte 116
.tryte 111
.tryte 32
.tryte 97
.tryte 110
.tryte 115
.tryte 119
.tryte 101
.tryte 114
.tryte 32
.tryte 97
.tryte 32
.tryte 102
.tryte 101
.tryte 119
.tryte 32
.tryte 113
.tryte 117
.tryte 101
.tryte 115
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 115
.tryte 32
.tryte 116
.tryte 111
.tryte 32
.tryte 103
.tryte 101
.tryte 116
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 99
.tryte 111
.tryte 114
.tryte 114
.tryte 101
.tryte 99
.tryte 116
.tryte 32
.tryte 97
.tryte 110
.tryte 115
.tryte 119
.tryte 101
.tryte 114
.tryte 46
.tryte 0
.tryte 67
.tryte 111
.tryte 110
.tryte 103
.tryte 114
.tryte 97
.tryte 116
.tryte 117
.tryte 108
.tryte 97
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 115
.tryte 33
.tryte 32
.tryte 73
.tryte 102
.tryte 32
.tryte 121
.tryte 111
.tryte 117
.tryte 32
.tryte 97
.tryte 110
.tryte 115
.tryte 119
.tryte 101
.tryte 114
.tryte 101
.tryte 100
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 115
.tryte 101
.tryte 32
.tryte 113
.tryte 117
.tryte 101
.tryte 115
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 32
.tryte 99
.tryte 111
.tryte 114
.tryte 114
.tryte 101
.tryte 99
.tryte 116
.tryte 108
.tryte 121
.tryte 44
.tryte 0
.tryte 84
.tryte 104
.tryte 105
.tryte 115
.tryte 32
.tryte 99
.tryte 104
.tryte 97
.tryte 108
.tryte 108
.tryte 101
.tryte 110
.tryte 103
.tryte 101
.tryte 32
.tryte 104
.tryte 101
.tryte 108
.tryte 112
.tryte 115
.tryte 32
.tryte 121
.tryte 111
.tryte 117
.tryte 32
.tryte 116
.tryte 111
.tryte 32
.tryte 103
.tryte 101
.tryte 116
.tryte 32
.tryte 102
.tryte 97
.tryte 109
.tryte 105
.tryte 108
.tryte 105
.tryte 97
.tryte 114
.tryte 32
.tryte 119
.tryte 105
.tryte 116
.tryte 104
.tryte 32
.tryte 84
.tryte 114
.tryte 105
.tryte 86
.tryte 77
.tryte 46
.tryte 0
.tryte 72
.tryte 111
.tryte 119
.tryte 32
.tryte 109
.tryte 97
.tryte 110
.tryte 121
.tryte 32
.tryte 100
.tryte 105
.tryte 102
.tryte 102
.tryte 101
.tryte 114
.tryte 101
.tryte 110
.tryte 116
.tryte 32
.tryte 105
.tryte 110
.tryte 115
.tryte 116
.tryte 114
.tryte 117
.tryte 99
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 115
.tryte 32
.tryte 97
.tryte 114
.tryte 101
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 114
.tryte 101
.tryte 32
.tryte 105
.tryte 110
.tryte 32
.tryte 84
.tryte 114
.tryte 105
.tryte 86
.tryte 77
.tryte 63
.tryte 0
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 32
.tryte 81
.tryte 117
.tryte 101
.tryte 115
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 32
.tryte 37
.tryte 100
.tryte 32
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 61
.tryte 10
.tryte 0
.tryte 101
.tryte 46
.tryte 103
.tryte 46
.tryte 32
.tryte 39
.tryte 115
.tryte 108
.tryte 116
.tryte 32
.tryte 97
.tryte 50
.tryte 44
.tryte 32
.tryte 116
.tryte 49
.tryte 44
.tryte 32
.tryte 122
.tryte 101
.tryte 114
.tryte 111
.tryte 39
.tryte 32
.tryte 45
.tryte 62
.tryte 32
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 48
.tryte 84
.tryte 84
.tryte 49
.tryte 84
.tryte 49
.tryte 84
.tryte 84
.tryte 48
.tryte 48
.tryte 48
.tryte 0
.tryte 121
.tryte 111
.tryte 117
.tryte 32
.tryte 99
.tryte 97
.tryte 110
.tryte 32
.tryte 103
.tryte 101
.tryte 116
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 102
.tryte 108
.tryte 97
.tryte 103
.tryte 32
.tryte 117
.tryte 115
.tryte 105
.tryte 110
.tryte 103
.tryte 32
.tryte 116
.tryte 104
.tryte 105
.tryte 115
.tryte 32
.tryte 112
.tryte 121
.tryte 116
.tryte 104
.tryte 111
.tryte 110
.tryte 32
.tryte 99
.tryte 111
.tryte 100
.tryte 101
.tryte 58
.tryte 0
.tryte 105
.tryte 110
.tryte 115
.tryte 116
.tryte 114
.tryte 117
.tryte 99
.tryte 116
.tryte 105
.tryte 111
.tryte 110
.tryte 115
.tryte 44
.tryte 32
.tryte 116
.tryte 104
.tryte 111
.tryte 117
.tryte 103
.tryte 104
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 121
.tryte 32
.tryte 100
.tryte 111
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 115
.tryte 97
.tryte 109
.tryte 101
.tryte 32
.tryte 116
.tryte 104
.tryte 105
.tryte 110
.tryte 103
.tryte 0
.tryte 87
.tryte 104
.tryte 97
.tryte 116
.tryte 39
.tryte 115
.tryte 32
.tryte 116
.tryte 104
.tryte 101
.tryte 32
.tryte 73
.tryte 78
.tryte 84
.tryte 95
.tryte 77
.tryte 73
.tryte 78
.tryte 32
.tryte 105
.tryte 110
.tryte 32
.tryte 84
.tryte 114
.tryte 105
.tryte 86
.tryte 77
.tryte 63
.tryte 32
.tryte 0
.tryte 102
.tryte 114
.tryte 111
.tryte 109
.tryte 32
.tryte 104
.tryte 97
.tryte 115
.tryte 104
.tryte 108
.tryte 105
.tryte 98
.tryte 32
.tryte 105
.tryte 109
.tryte 112
.tryte 111
.tryte 114
.tryte 116
.tryte 32
.tryte 109
.tryte 100
.tryte 53
.tryte 0
.tryte 89
.tryte 111
.tryte 117
.tryte 114
.tryte 32
.tryte 97
.tryte 110
.tryte 115
.tryte 119
.tryte 101
.tryte 114
.tryte 58
.tryte 32
.tryte 0
.tryte 84
.tryte 105
.tryte 112
.tryte 115
.tryte 58
.tryte 0
.tryte 37
.tryte 100
.tryte 0
.tryte 37
.tryte 115
.tryte 0
.tryte 0
.tryte 0
__globals: