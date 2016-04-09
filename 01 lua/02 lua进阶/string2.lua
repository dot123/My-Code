local str = "Hello World"
local i,j = string.find(str,"Hello")
print(i,j)

local str = "Hello12345World"
local i,j = string.find(str,"%d+")
print(i,j)

local str = "Hello12345World"
local subStr = string.match(str,"%d+")
print(subStr)

local i,j = string.find(str,"%d+")
subStr = string.sub(str,i,j)
print(subStr)

local str = "Hello World"
local strResult = string.gsub(str,"Hello","Jelly")
print(strResult)

local strResult,cnt = string.gsub(str,"l","o")
print(strResult)
print(cnt)

strResult,cnt = string.gsub(str,"l","o",1)
print(strResult)
print(cnt)

local replaceTb = {hello = "Jelly",world = "Think"}
local str = "hello world"
local strResult = string.gsub(str,"hello",replaceTb)
print(strResult)
strResult = string.gsub(strResult,"world",replaceTb)
print(strResult)
strResult = string.gsub(strResult,"hello",replaceTb)
print(strResult)

local replaceFunc = function(str)
	return str .. "JellyThink"
end
local str = "hello world"
local strResult = string.gsub(str,"hello",replaceFunc)
print(strResult)

local str = "Hello World"
local iteratorFunc = string.gmatch(str,"%a+")
for i in iteratorFunc do
	print(i)
end

local str = "Hello World"
local myGmatch = function(s,pattern)
	local resultTb = {}
	local index = 0
	local i,j = string.find(s,pattern)
	while i do
		resultTb[#resultTb + 1] = string.sub(s,i,j)
		i,j = string.find(s,pattern,j + 1)
	end

	return function()
		index = index + 1
		return resultTb[index]
	end
end

for i in myGmatch(str,"%a+") do
	print(i)
end



