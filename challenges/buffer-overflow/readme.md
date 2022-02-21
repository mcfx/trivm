# TriVM-buffer-overflow

This challenge was used in THUCTF2021.

This challenge is a simple buffer overflow in TriVM.

## Write Up

(Chinese only)

代码有两个 buffer，一个在栈上，一个是全局变量。

查看 scanf 的源码可以知道，这两个都可以读任意长的串，但是读的值必须在 0~255 之间，而不是 tryte 值域的 -364~364。

使用模拟器的 -g 模式，可以发现程序会被加载到0地址，而栈在一个负的地址上。如果想写代码到栈上，则需要写入负的地址，这是很难做到的。于是代码只能写到全局变量，栈上放一个返回地址。

代码可以放到 5*729 的位置，这样地址不含负数。而代码本身也需要一些调整来使得所有值都在 0~255 之间。