co = coroutine.create(function(i)
	print(i)
	print(coroutine.running())
end)
coroutine.resume(co,1) --1
print(coroutine.status(co)) --dead

co = coroutine.wrap(function(i)
	print(i)
end)

co(1)

co2 = coroutine.create(function()
	for i = 1,10 do
		print(i)
		if i==3 then
			print(coroutine.status(co2)) --running
			print(coroutine.running())
		end
		coroutine.yield()
	end
end)

coroutine.resume(co2) --1
coroutine.resume(co2) --2
coroutine.resume(co2) --3

print(coroutine.status(co2))
print(coroutine.running())


function foo(a)
	print("foo 函数输出",a)
	return coroutine.yield(2*a) -- 返回  2*a 的值
end
co = coroutine.create(function(a,b)
	print("第一次协同程序执行输出",a,b)
	local r = foo(a + 1)
	print("第二次协同程序执行输出",r)
	local r,s = coroutine.yield(a + b,a - b)
	print("第三次协同程序执行输出",r,s)
	return b,"结束协同程序"
end)

print("main",coroutine.resume(co,1,10))
print("--分割线----")
print("main",coroutine.resume(co,"r"))
print("--分割线----")
print("main",coroutine.resume(co,"x","y"))
print("--分割线----")
print("main",coroutine.resume(co,"x","y"))
print("--分割线----")

local newProductor
function productor()
	local i = 0
	while true do
		i = i + 1
		send(i)  -- 将生产的物品发送给消费者
	end
end

function consumer()
	while true do
		local i = receive()  -- 从生产者那里得到物品
		print(i)
	end
end

function receive()
	local status,value = coroutine.resume(newProductor)
	return value
end

function send(x)
	coroutine.yield(x) -- x表示需要发送的值，值返回以后，就挂起该协同程序
end

-- 启动程序
newProductor = coroutine.create(productor)
consumer()

local co = coroutine.create(function() print("Hello world") end)

print(coroutine.status(co))
coroutine.resume(co)

print(coroutine.status(co))

local co = coroutine.create(function()
	for i = 1,10 do
		print("co",i)
		coroutine.yield()
	end
end)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.status(co))

function foo(a)
	print("foo",a)
	return coroutine.yield(2*a)
end
co = coroutine.create(function(a,b)
	print("co-body",a,b)
	local r = foo(a + 1)
	print("co-body2",r)
	local r,s = coroutine.yield(a + b,a - b)
	print("co-body3",r,s)
	return b,"end"
end)
print("main",coroutine.resume(co,1,10))
print("main",coroutine.resume(co,"r"))
print("main",coroutine.resume(co,"x","y"))
print("main",coroutine.resume(co,"x","y"))

-- local newProductor
-- function productor()
-- 	local i = 0
-- 	while true do
-- 		i = i + 1
-- 		send(i)
-- 	end
-- end

-- function consumer()
-- 	while true do
-- 		local i = receive()
-- 		print(i)
-- 	end
-- end

-- function receive()
-- 	local status,value = coroutine.resume(newProductor)
-- 	return value
-- end
-- function send(x)
-- 	coroutine.yield(x)
-- end
-- newProductor = coroutine.create(productor)
-- consumer()

local co1 = coroutine.create(function()
	for i = 1,10 do
		print("func1")
		--coroutine.yield()
	end
end)

local co2 = coroutine.create(function()
	print("func2")
	coroutine.resume(co1)
	print("----")
end)

coroutine.resume(co2)
