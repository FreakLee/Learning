## LLDB常用命令使用

LLDB基本语法如下：

```objc
<command> [subcommand,[subcommand...]] <action> [-options [option-value]] [argument [arguments...]]
```
其中中括号内的是可选项

* help

可以查阅其它命令的用法，help command [subcommand]即可，比如help breakpoint就可以列出breakpoint的详细用法

* expression

简写exp，动态执行一些表达式指令，比如expression self.view.backgroundColor = [UIColor yellowColor]

很多时候效果跟p、po、print、call等指令差不多。

* thread
    - thread backtrace 打印堆栈信息，类似于bt
    - thread return[exp] 让函数直接返回
    - thread step-in 单步执行（进入）类似step、s
    - thread step-out 直接执行完当前函数所有代码返回上个函数
    - thread step-over 单步执行（跳过），类似next、n
    - thread continue 继续，类似continue、c
si、ni与s、n类似，前者是汇编指令级别的（instruction），后者是源码级别的。注：一条高级语言包含多条汇编指令。

* breakpoint
    - breakpoint list ：列出所有断点
    - breakpoint set -n 函数名：给某个函数加断点
    - breakpoint disable 断点编号：禁用某个断点
    - breakpoint enable 断点编号：启用某个断点
    - breakpoint delete 断点编号：删除某个断点
    - breakpoint command add 断点编号：给某个断点添加命令

* watchpoint 当内存发生改变时触发断点
    - watchpoint list ：列出所有断点
    - watchpoint set variable 变量名
    - watchpoint set expression 地址
    - watchpoint disable 断点编号
    - watchpoint enable 断点编号
    - watchpoint delete 断点编号
    - watchpoint command add 断点编号

* image lookup
    - image lookup -a 地址 ：根据内存地址查找所处模块的位置
    - image lookup -t 类型 ：查找某个类型的信息


