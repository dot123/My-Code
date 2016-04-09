window = {}
window.mt = {}
window.mt.__newindex  = function(table,key,value)
	print("update of element [" .. tostring(key) .. "]" .. "=" .. tostring(value))
	rawset(table,key,value)
end

function window.new(t)
	setmetatable(t,window.mt)
	return t
end

w = window.new{x = 10, y = 20}
-- w.a = 20
w.a = 10
print(w.a)