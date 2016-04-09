file = io.open("text.lua","r")
io.input(file)
print(io.read(10))
io.close(file)

-- file = io.open("text.lua","a")
-- io.output(file)
-- io.write("-- text.lua 文件末尾注释")
-- io.close(file)

file = io.open("text.lua","r")
print(file:read())
file:close()

file = io.open("text.lua","a")
--file:write("--text")
file:close()

file = io.open("text.lua","r")
file:seek("end",-25)
--file:seek("set")
print(file:read("*a"))
file:close()
