li a0,2
la a1,flag-1
li a2,0
li a3,0
ecall
mv a1,a0
li a0,0
la a2,buf
li a3,729
ecall
li a0,1
li a1,1
la a2,buf
li a3,729
ecall
li a0,4
li a1,0
ecall
flag:
.tryte 102
.tryte 108
.tryte 97
.tryte 103
.tryte 46
.tryte 116
.tryte 120
.tryte 116
.tryte 0
.tryte 0
.tryte 0
.tryte 0
.tryte 0
.tryte 0
.tryte 0
buf: