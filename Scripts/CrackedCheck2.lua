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
local code = (18281737284919 and x[18281737284919] and getgenv().Code == "1" 
or 38319182737827 and x[38319182737827])

print(code)
return 18281737284919

--[[
18281737284919 | Not Cracked
38319182737827 | Cracked
]]--
