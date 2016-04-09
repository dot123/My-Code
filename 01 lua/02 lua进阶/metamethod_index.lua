window = {}
window.mt = {}
window.prototype = {x = 0, y = 0, width = 100, height = 100}
window.mt.__index = function(table,key)
	return window.prototype[key]
end
function window.new(t)
	setmetatable(t,window.mt)
	return t
end
w = window.new{x = 10, y = 20}
print(w.height)