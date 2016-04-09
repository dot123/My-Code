People = {age = 18}

function People:new()
	local p = {}
	setmetatable(p,self)
	self.__index = self
	return p
end

function People:growUp()
	self.age = self.age + 1
	print("People's growUp:" .. self.age)
end

Man = People:new()

function Man:growUp()
	self.age = self.age + 1
	print("Man's growUp:" .. self.age)
end

person = People:new()
person:growUp()
person = Man:new()
person:growUp()