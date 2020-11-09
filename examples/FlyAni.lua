--[[
    module:FlyAni
    author:DylanYang
    time:2020-11-03 10:41:32
]]
local Animal = require("examples.Animal")
local _M = Class("FlyAni", Animal)

local public = _M.public
local protected = _M.protected
local static = _M.static
local readonly = _M.readonly
local set = _M.set
local get = _M.get
-- local super = _M.super

-- function _M:ctor(name)
--     self.area = self.AreaEnum.air
--     self.super:ctor(name)
--     print("55555")
-- end

-- function _M.public:Move()
--     -- _M.super.Move(self)

--     --功能一：通过self，访问基类的方法
--     --返回一个代理；
--     --代理只能被请求方法；
--     --在被请求方法的时候，需要把代理中缓存的self做为t；
--     --只能访问 public 和 protected 方法
--     --在执行一个方法的时候，需要记录当前的cls，方便实现继承相关的查找功能（相当于方法的“上下文环境”）
--     -- self.super:

--     print("鸟，还会 飞行！")
--     -- self.super:Move()
--     -- self.super:Eat()
--     -- self.aaa = 888
-- end

-- function public:Eat()
--     print("飞行动物 可以吃飞行动物！")
-- end

-- public.aaa = 777

return _M