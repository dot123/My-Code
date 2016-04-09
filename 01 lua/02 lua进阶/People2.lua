People = {age = 18}
 
function People:new()
	local  p = {}
	setmetatable(p,self)
	self.__index = self
	return p
end

function People:growUp()
	self.age = self.age + 1
	print("Peopl's growUp:" .. self.age)
end

Man = People:new()
Man:growUp()

function Man:growUp()
	self.age = self.age + 1
	print("Man's growUp:" .. self.age)
end

man1 = Man:new()
man1:growUp()
