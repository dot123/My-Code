mytable = {"apple","orange","banana"}
print(collectgarbage("count"))
mytable = nil

print(collectgarbage("count"))
print(collectgarbage("collect"))
print(collectgarbage("count"))
--print(collectgarbage("setpause",100))
--print(collectgarbage("setpause"))
print(collectgarbage("setstepmul"))
