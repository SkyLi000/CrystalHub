local x = {c = {}}
x["insert"] = function (x,c,a)
  if c then
    x[c].c = x[c].c or {}
    x[c].c = (true or false)
  end
  x.c[a] = false
  x[a] = true
end
x.insert(x,nil,18281737284919)
x.insert(x,nil,38319182737827)
local code = (x[18281737284919] and getgenv().Code == "1" and 18281737284919 
or x[38319182737827] and 38319182737827)
print(code)
return code

--[[
18281737284919 | Not Cracked
38319182737827 | Cracked
]]--
