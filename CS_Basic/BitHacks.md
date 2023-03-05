## 位运算概述
程序中的数据在内存中都是以二进制形式存储的。即以0、1的两种形态存储在内存中，计算机对二进制数据进行的运算都叫位运算。位运算通常用于低级编程，如图形编程、设备驱动编程等。

## 常见的位运算

| 符号 | 描述 | 运算规则 |
|---|----|------------------------|
| & | 与 | 两个位都为1时结果才为1 |
| \| | 或 | 两个位都为0是结果才为0 |
| ^ | 异或 | 两个位相同为0，相异为1 |
| ~ | 取反 | 1变为0，0变为1 |
| << | 左移 | 各二进位全部左移若干位，高位丢弃，低位补0 |
| >> | 右移 | 各二进位全部右移若干位，对无符号数，高位补0，有符号数，各编译器处理方法不一样，有的补符号位（算术右移），有的补0（逻辑右移） |

## 复合赋值运算符
* &= 例：a&=b 相当于 a=a&b
* |= 例：a|=b 相当于 a=a|b
* \>>= 例：a>>=b 相当于 a=a>>b
* \<<= 例：a<<=b 相当于 a=a<<b
* ^= 例：a^=b 相当于 a=a^b

## 位运算的优先级
位运算存在优先级，在C语言中位运算的优先级如下所示
| 优先级别 | 运算符 |
|---|----|
| 1 | ~ |
| 2 |  <<、>> |
| 3 | & | 
| 4 | ^ | 
| 5 | \| | 
| 6 | &=、^=、\|=、\>>=、\<<= | 

## 位运算的应用
* 判断整数的奇偶性
~~~ c
/// 判断整数的奇偶性，返回YES则为偶数，否则为奇数
/// @param number 传入的某个整数
bool checkIsEven (int number) {
    return ((number & 1) == 0);
}
~~~
* 判断某个整数的第N位是否设置了
~~~ c
/// 判断某个整数的第N位是否设置了，返回YES则为设置，否则未设置
/// @param number 传入的某个整数
/// @param nth 第N位
bool checkNthIsSet (int number, int nth) {
    return (number & (1<<nth));
}
~~~
* 将某个整数的第N位设置上
~~~ c
/// 将某个整数的第N位设置上，返回一个新整数，若已设置上则返回原数
/// @param number 传入的某个整数
/// @param nth 第N位
int setNthBit (int number, int nth) {
    //if (checkNthIsSet(number, nth)) return number;
    return (number | (1<<nth));
}
~~~
* 将某个整数的第N位取消设置
~~~ c
/// 将某个整数的第N位取消设置，若未设置则返回原数
/// @param number 传入的某个整数
/// @param nth 第N位
int unSetNthBit (int number, int nth) {
    //if (!checkNthIsSet(number, nth)) return number;
    return (number & ~(1<<nth));
}
~~~
* 交换两个整数
~~~ c
/// 交换两个整数
/// @param a 整数a
/// @param b 整数b
void swap (int a, int b) {
    NSLog(@"交换前：a = %d，b = %d",a,b);
    if (a != b) {
        a ^= b;//a = a^b
        b ^= a;
        a ^= b;
    }
    NSLog(@"交换后：a = %d，b = %d",a,b);
}
~~~