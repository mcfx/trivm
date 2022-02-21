# TriVM-ternaryop

This challenge was used in THUCTF2021.

## Write Up

(Chinese only)

整个题分为三部分。第一部分是找出 password，第二部分是加速 korand，第三部分是加速后面的四重循环。

第一部分，可以把 rand_nxt 看作一个 trit 之间的线性变换。可以使用矩阵求逆解决。

第二部分，同样运用矩阵的思想，可以发现每次是把之前的矩阵平方，再乘上最初的矩阵。

第三部分，可以发现这实际是进行了三次奇怪的卷积。如果有 OI 基础可以搜索到 [https://www.cnblogs.com/reverymoon/p/10197711.html](https://www.cnblogs.com/reverymoon/p/10197711.html)。但是这个只解决了 and.T 和 xor。xor.1 由于没有结合律，（听选手说）大概是不能使用FWT做的。

接下来可以考虑，FWT的（某种）本质是，transform(a)\*transform(b)=transform(a mul b)，其中\*是点积，mul 是我们的奇怪卷积，transform 是这个变换，需要可逆。考虑让 transform 把长度 3^n 变成 4^n，即每一维都乘上一个 3\*4 的矩阵。并且 a 和 b 的矩阵可以不同。然后我们可以再找一个 4\*3 的矩阵构成 invert_transform，使得 invert_transform(transform1(a)\*transform2(b))=a mul b

本题中，这三个矩阵可以手推出一种可能的值，同时也可以有其他复杂度为 4^n 的做法。

我的做法中，这三个矩阵的元素其实可以作为变量，然后让invert_transform(transform1(a)*transform2(b))-a mul b 作为优化目标，跑一些常见的优化算法就能得到若干解。而求出一个满足要求的变换之后就可以在 4^n 的复杂度内计算了。

前两部分代码见 [solve.cpp](solve.cpp)，第三部分的优化可见 [br_coe3.cpp](br_coe3.cpp)，求解见 [conv_opt_mt.cpp](conv_opt_mt.cpp)。