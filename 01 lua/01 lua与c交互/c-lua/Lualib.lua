require "mLualib"  
local ave,sum = ss.average(1,2,3,4,5)	--参数对应堆栈中的数据  
print(ave,sum)  -- 3 15  
ss.sayHello()   -- hello world!  

-- local path = "mLualib.dll"    
-- local f = package.loadlib(path,"luaopen_mLualib")   -- 返回luaopen_mLualib函数  
-- f()                                                 -- 执行  
-- lua和c++是通过一个虚拟栈来交互的。

-- c++调用lua实际上是：由c++先把数据放入栈中，由lua去栈中取数据，然后返回数据对应的值到栈顶，再由栈顶返回c++。

-- lua调c++也一样：先编写自己的c模块，然后注册函数到lua解释器中，然后由lua去调用这个模块的函数。