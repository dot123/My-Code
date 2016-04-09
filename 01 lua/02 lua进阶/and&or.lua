-- and or not

-- 逻辑运算符认为false和nil是假(false),其他为真,0 也是true。
-- and和or的运算结果不是true和false,而是和它的两个操作数相关。

-- 注:下面的和其他语法有区别
-- a and b -- 如果a 为false，则返回a，否则返回b
-- a or b -- 如果a 为true，则返回a，否则返回b
-- 例如:
print(4 and 5) --> 5
print(nil and 13) --> nil
print(false and 13) --> false
print(4 or 5) --> 4
print(false or 5) --> 5

-- 一个很实用的技巧:如果x为false或者nil则给x赋初始值v
-- x = x or v
-- 等价于
if not x then
x = v
end
-- and的优先级比or高。

-- C语言中的三元运算符
-- a ? b : c
-- 在Lua 中可以这样实现：
-- (a and b) or c
-- not的结果只返回false或者true
print(not nil) --> true
print(not false) --> true
print(not 0) --> false
print(not not nil) --> false

-- 测试代码如下:

a = nil
b = 1
x = 1 < 2 and a or b
print(x == a) --false

x = 1 > 2 and a or b
print(x == b) --true

x = (1 < 2 and {a} or {b})[1]
print(x == a) --true

x = (1 > 2 and {a} or {b})[1]
print(x == b) --true

print((nil and 0)) --nil
