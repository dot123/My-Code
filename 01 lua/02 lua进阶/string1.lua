string1 = "Lua"
print("\"字符串1是\"",string1)
strng2 = 'w3cschool.cc'
print("字符串2是",strng2)
string3 = [["Lua 教程"]]
print("字符串3是",string3)

print(string.upper("abc"))
print(string.lower("Abc"))
print(string.gsub("aaaa","a","z",3))
print(string.find("Hello Lua user","Lua",1))
print(string.reverse("Lua"))
print(string.format("the value is:%d",4))

string4 = string.char(97,98,99,100)
print(string4)
print(string.byte("ABCD",4))
print(string.byte("ABCD"))
print(string.len("abc"))
print(string.rep("abc",2))
print("www.w3cschool".."cc")
string = "Lua Tutorial"
print(string.find(string,"Tutorial"))
reversedString = string.reverse(string)
print("新字符串为",reversedString)

string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
print(string.format("基本格式化 %s %s",string1,string2))
date = 2
month = 1
year = 2014
print(string.format("日期格式化 %02d/%02d/%03d",date,month,year))
print(string.format("%.4f",1/3))

print(string.byte("Lua"))
print(string.byte("Lua",3))
print(string.byte("Lua",-1))
print(string.byte("Lua",2))
print(string.byte("Lua",-2))

print(string.char(97))

string1 = "www."
string2 = "w3cshool"
string3 = ".cc"
print("连接字符串",string1 .. string2 .. string3)
print("字符串长度 ",string.len(string2))