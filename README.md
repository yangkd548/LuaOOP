# LuaOOP
### Lua OOP framework.<br>
实现Lua开发语言的面向对象编程

## 1.定义一个类(module/Class)
```lua
require("oop.Class")
local _M = Class("A")
return _M
```
或
```lua
local A = require("examples.A")
local _M = Class("B", A)
return _M
```

## 2.实例化一个类的对象（Object）
```lua
local B = require(examples.B)
--...代替必要的多个参数
local b = B.new(...)
```

## 3.在类中定义一个成员（Member）
### 3.1.简单举例
```lua
require("examples.A")
local _M = Class("B", A)
_M.name = "human"
return _M
```
###3.2.特殊说明
```lua
--1.定义成员，不能使用双下划线开头“__”
_M.__name = "human" --这样定义是不允许的，会报错提示
_M.name = "human" --OK
_M._name = "human" --OK

--2.实例化一个对象时，OOP会自动调用ctor方法，并传递参数
--2.1.ctor方法，固定为private、非static、非readonly的function
--2.2.ctor方法，可以赋值成员，生成一些“引用对象”（定义的时候就生成，会造成所有类实例，使用同一个对象）
function _M:ctor(name)
    self.name = name
end

--3.可以定义一个数值为nil的成员
--相当于没有赋值的成员，也可以赋值一个方法
_M.public.name = nil

--4.所有成员，无论类型和属性，名字不允许重复
--(下面是错误例子)
_M.public.age = 100
function _M.set:age(v)
    --do something
end
```

## 4.成员的属性
### 4.1.包含的内容
    1.成员的“访问域”属性
        1.private 私有访问域
        2.protected 保护访问域
        3.public 公共访问域

    2.static 成员“静态”属性
        1.是static属性
        2.不是static（普通成员）

    3.readonly 成员“只读”属性
        1.是readonly属性
        2.不是readoly（普通成员）

    4.type 成员“类型”属性
        1.普通 类型
            1.变量（variable）
            2.方法（function）
        2.set 类型
        3.get 类型

    5.value 成员数值
### 4.2.使用说明（代码举例）
```lua
--1.默认成员定义
--1.1.默认变量定义

_M._name = "human"
--1.2.默认方法定义

function _M.ctor(...)
    --可以调用父类的ctor
    self.super:ctor(...)
end

--1.3.默认的set成员定义
function _M.set:name(v)
    self._name = v
end

--1.4.默认的get成员的定义
function _M.get:name(v)
    return self._name
end

--2.多种属性混合定义
--2.1.示例
_M.static.private._maxAge = 100
function _M.public.static.readonly.set:maxAge(v)
    self._maxAge = v
end

--2.2.属性组合可以缓存，并多次使用
local pset = _M.public.set
function pset:Move()
    print(self.name.."Start Move!")
end

--2.3.同类属性，不允许重复使用（下面是错误示例）
local testErr1 = _M.public.static.private
local testErr2 = _M.public.public

--2.4.属性的顺序
--2.4.1.成员名（value属性），必须放最后
--2.4.2.其他属性可以任意顺序，建议set、get放最后
function _M.protected.set:height()
    --do something
end

--3.1.readonly的static属性的成员，所有实例公用，但是不能修改
_M.staitc.public.width = 88
```
## 5.成员的访问
```lua
--1.--static，所有实例公用
--可以在当前类内部，使用类名B直接调用
--也可以用self调用

--1.1.定义
_M.static.age = 18

--1.2.调用
local age = _M.static.age
--或
local age = self.age

--2.public的static属性的成员，可以在类以外，用类名B直接调用
_M.static.public.height = 182
```

## 6.继承和覆盖
### 6.1.基类中public、protected的成员是可以被覆盖
```lua
--A类中的Move方法(A.lua)
local _M = Class("A")
function _M.public:Move()
    --do something
end
return _M

--B类中的Move方法
local A = require("examples.A")
local _M = Class("B", A)
function _M.public:Move()
    --do something
    --还可以调用基类的Move方法
    self.super:Move()
end
return _M
```


## 7.访问基类方法
### 7.1.基类的ctor，只允许在子类的ctor中访问
```lua
function _M.ctor(...)
    --可以调用父类的ctor
    self.super:ctor(...)
end
```
### 7.2.基类中非ctor方法，可以在子类的任意方法中访问
```lua
function _M:Move()
    self.super:Move()
    --可以访问非同名的基类函数
    self.super:Speak()
end
```
