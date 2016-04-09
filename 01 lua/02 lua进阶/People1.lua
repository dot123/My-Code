People = {age = 18}
 
 function People:new()
 	local p = {}
 	setmetatable(p,self)
 	self.__index = self
 	return p
 end

 function People:growUp()
 	self.age = self.age + 1
 	print(self.age)
 end

 p1 = People:new()
 p1:growUp()

 p2 = People:new()
 p2:growUp()


