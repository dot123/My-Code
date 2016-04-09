array = {"Lua","Tutorial"}

for key,value in ipairs(array) do
	print(key,value)
end

function fun(iteratorMaxCount,currentNumber)
	if currentNumber < iteratorMaxCount then
		currentNumber = currentNumber + 1
		return currentNumber,currentNumber*currentNumber
	end
end

for k,v in fun,3,0 do
	print(k,v)
end

function it(tb,i)
	i = i + 1
	local v = tb[i]
	if v then
		return i,v
	end
end

function _pairs(tb)
	return it,tb,0
end

a = {"a","b","c","d"}

for k,v in _pairs(a) do
	print(k,v)
end

array = {"Lua","Tutorial"}
function elementIterator(collection)
	local index = 0
	local count = #collection
	return function()
		index = index + 1
		if index <= count
			then
			return collection[index]
		end
	end
end

for element in elementIterator(array) do
	print(element)
end
