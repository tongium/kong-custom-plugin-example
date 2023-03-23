-- https://www.lua.org/pil/20.1.html

s = "hello world"
i, j = string.find(s, "hello")
print(i, j)                      --> 1    5
print(string.sub(s, i, j))       --> hello
print(string.find(s, "world"))   --> 7    11
i, j = string.find(s, "l")
print(i, j)                      --> 3    3
print(string.find(s, "lll"))
