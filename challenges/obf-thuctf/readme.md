# TriVM-obf

This challenge was used in THUCTF2021.

## Write Up

(Chinese brief writeup only)

首先写一个反汇编器以及模拟器。

使用反汇编器大概看一下 encrypt 函数的结构，可以发现分为若干个整体结构相同的部分。用模拟器模拟，并且在中间乱改变量的值可以发现，每个部分其实只会对两个数做简单的运算。然后可以通过模拟把常数解方程解出来，然后写解密程序。

本题是 https://github.com/GANGE666/MyCTFChallenges/tree/master/0ctf_tctf_2021_final/0bf 的三进制版本。改了分组密码的设计，以及混淆的实现。MBA表达式是用该论文中提到的方法求出的。更多信息可以参考该题。