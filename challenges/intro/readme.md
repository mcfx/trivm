# TriVM-intro

This challenge was used in THUCTF2021.

This challenge is a simple introduction to TriVM, and it helps contestants to get familiar with the ISA.

## Write Up

(Chinese only)

第一问，根据文档可以知道，是 $-\frac{3^{18}-1}2$.

第二问，可以根据 asm.py 看出来，三进制文件是如何被编码到二进制的。据此可以得到指令是啥。而至于指令的位置，可以把 .S 里随便写一条，asm 后 diff 一下。

第三问代码可在 [solve.py](solve.py) 中查看。