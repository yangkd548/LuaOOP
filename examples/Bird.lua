--[[
    module:Bird
    author:DylanYang
    time:2020-11-03 10:33:32
]]
local FlyAni = require("examples.FlyAni")
local _M = Class("Bird", FlyAni)

local public = _M.public
local protected = _M.protected
local static = _M.static
local readonly = _M.readonly
local set = _M.set
local get = _M.get

--使用说明，不需要的话，可以删除
--[[
1、以上属性，可以在不同类属性之间，进行任意组合，顺序随意，例如：
    local pubSet = _M.public.set

2、直接使用 _M.成员名，默认就是private的

3、以上属性可以不缓存，直接使用，例如：
    _M.static.public.total = 0

4、readonly可以先定义为nil，然后再ctor中根据输入参数，设置正式数值；后续就不能再修改了
    _M.readonly.originValue = 5

5、变量 建议用小写开头的驼峰样式
6、function 建议用大写开头的驼峰样式
]]

function _M.public:ctor(name)
    print("Bird初始化方法：", name)
    self.area = self.AreaEnum.air
    self.super:ctor(name)
    self.super:Move("很快----------")
    -- self.super:privateFunc()
end

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
--     print("", self.super)
-- end

return _M