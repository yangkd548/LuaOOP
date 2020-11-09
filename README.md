# LuaOOP
### Lua OOP framework.<br>
实现Lua开发语言的面向对象编程

## 1、定义一个类(module/class)
```lua
require("oop.Class")
local _M = Class("A")
return _M
```
或
```lua
require("examples.A")
local _M = Class("B", A)
return _M
```
## 2、实例化一个类的对象（Object）
```lua
local B = require(examples.B)
--...代替必要的多个参数
local b = B.new(...)
```

## 3.在类中增加一个成员（变量variable、方法function、set/get）

require("examples.A")

local _M = Class("B", A)


--实例化，调用B.new(...)时，默认会调用的方法，其中...是原样传递的

function _M.ctor(...)

    --可以调用父类的ctor
    
    self.super:ctor(...)
    
end


_M.va = "the first variable"

_M.name = nil

--static是成员的一种静态属性，所有实例公用

_M.static.age = 18

--public的static属性的成员，可以在类以外，用类名B直接调用

_M.static.public.height = 182

--readonly的static属性的成员，所有实例公用，但是不能修改

_M.staitc.public.width = 88


function _M.func(p1, p2)

    print("the first func's params :", p1, p2)
    
end


--public是一种访问域（默认是private访问域）

function _M.public.set:myName(v)

    self.name = v
    
end


_M.speed = 6


--protected是一种访问域(可以提前缓存下来，多次使用)

local protected = _M.protected

function protected:ChangeSpeed(v)

    self.speed = v
    
end


return _M
