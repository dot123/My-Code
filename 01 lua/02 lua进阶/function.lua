-- function foo(x)
-- 	return 2*x 
-- end

-- foo = function(x) return 2*x end

function newCounter(i)
	--local i = 0
		return function()
		i  = i + 1
		return i
    end
end
c1 = newCounter(10)

print(c1())
print(c1())

function Fun()
	local iVal = 10
	function InnerFunc1()
		print(iVal)
	end

	function InnerFunc2()
		iVal = iVal + 10
	end
	return InnerFunc1,InnerFunc2
end

local a,b = Fun()
a()
b()
a()

function fun()  
    local i = 0  
    return function()     -- 注意这里是返回函数的地址，不是执行  
       i = i + 1  
        return i  
    end  
end  
  
c1 = fun()           -- 接收函数返回的地址  
print(c1())  --> 1          --c1()才表示执行  
print(c1())  --> 2  

-- 尾调用是一种类似在函数结尾的goto调用。
-- 当函数最后一个动作是调用另外一个函数时，我们称这种调用尾调用。

function g(x)
	print(x)
end

function f(x)  
    return g(x)  -- 类似于goto g(x)函数的地址  
end  

-- 尾调用不需要使用栈空间，因此尾调用递归的层次可以无限制的。
-- 例如下面调用不论n为何值不会导致栈溢出。
function foo (n)  
    if n > 0 then 
    	return foo(n - 1)
    end  
end 

-- 一些调用者函数调用其他函数后也没有做其他的事情但不属于尾调用。比如：
-- function f (x)  
--     g(x)  
--     return  
-- end  
-- 上面这个例子中f在调用g后，不得不丢弃g地返回值，所以不是尾调用，同样的下面几个例子也不时尾调用：
-- return g(x) + 1      -- 还需+1  
-- return x or g(x)     -- 还需比较  
-- return (g(x))        -- 还需调整为一个返回值  
