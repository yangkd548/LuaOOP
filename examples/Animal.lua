--[[
    module:Animal
    author:DylanYang
    time:2020-11-03 10:44:09
]]
local _M = Class("Animal")

local public = _M.public
local protected = _M.protected
local static = _M.static
local readonly = _M.readonly
local set = _M.set
local get = _M.get

public.readonly.name = nil

public.readonly.AreaEnum = Readonly {land = 1, water = 2, air = 3}
public.readonly.area = nil

function _M:ctor(name, a, b, c)
    self.name = name
    print("初始化方法：", self.name)
end

function _M.public:Move(t)
    print("动物，都可以移动，是基本能力:", t, "----", self, "******", self.name)
end

function _M.protected:Eat()
    print("动物，都需要吃东西，才能生存")
end

-- function _M:privateFunc()

-- end

protected.aaa = 666
-- function protected:Eat()
--     print("动物，都需要吃东西，才能生存2222222")
-- end

return _M