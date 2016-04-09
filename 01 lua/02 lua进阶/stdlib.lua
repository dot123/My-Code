print(math.sin(math.rad(30)))

print(math.floor(5.6))
print(math.ceil(5.6))

print(math.max(2,3,2,14,2,30,-3))
print(math.min(2,3,2,14,2,30,-3))

math.randomseed(os.time())
print(math.random())
print(math.random(2))
print(math.random(3,4))

for i = 1,10 do
	---math.randomseed(os.time())
	print(math.random(1,10))
end

local tb = {10,20,30}
table.insert(tb,40)
table.insert(tb,2,15)

for k,v in pairs(tb) do
	print(k,v)
end

local tb = {10,20,30}
print(table.remove(tb))
print(table.remove(tb,1))

local tb = {20,10,2,3,4,89,20,33,2,3}
table.sort(tb)
for _,v in ipairs(tb) do
	print(v)
end

print("========")

table.sort(tb,function(a,b) if a > b then return true end end)

for _,v in ipairs(tb) do
	print(v)
end

print("========")
local tb = {x = 20,z = 10,y = 30,m = 2,n = 8}
-- table.sort(tb)
-- for k,v in pairs(tb) do
-- 	print(k .."=" .. v)
-- end

local keyTb = {}
for k,_ in pairs(tb) do
	keyTb[#keyTb + 1] = k
end

table.sort(keyTb)
for _,v in ipairs(keyTb) do
	print(v .. "=" .. tb[v])
end

local tb = {"Jelly", "Think", "Is", "Good"}
local strTb = table.concat(tb," ")
print(strTb)

for k,v in pairs(tb) do
	print(k,v)
end

local str = "Jelly Think"
local len = string.len(str)
print(len)
str = "ab"
local newStr = string.rep(str,2)
print(newStr)

str = "Jelly Think"
newStr = string.lower(str)
print(newStr)

newStr = string.upper(str)
print(newStr)

local str = "[Jelly Think]"
local newStr = string.sub(str,2,-2)
print(newStr)
newStr = string.sub(str,2,6)
print(newStr)

print(string.char(97))
local i = 98
print(string.char(i,i + 1,i + 2))
print(string.byte("abc",-1))

print(os.time())
print(os.time({year = 2014,month = 8,day = 14}))

local CurrentTime = os.date("*t")
for k,v in pairs(CurrentTime) do
	print(k .. "=" ..tostring(v))
end
