--[[
    module:aaaa
    author:DylanYang
    time:2020-11-09 16:15:46
]]
local _M = Class("aaaa")

local public = _M.public
local protected = _M.protected
local static = _M.static
local readonly = _M.readonly
local set = _M.set
local get = _M.get

--使用说明，不需要的话，可以删除
--[[
1、通过module.new进行实例化

2、以上属性，可以在不同类属性之间，进行任意组合，顺序随意，例如：
    local pubSet = _M.public.set
直接使用 _M.成员名，默认就是private的
3、以上属性可以不缓存，直接使用，例如：
    _M.static.public.total = 0

4、readonly可以先定义为nil，然后再ctor中根据输入参数，设置正式数值；后续就不能再修改了
    _M.readonly.originValue = 5

5、变量 建议用小写开头的驼峰样式
6、function 建议用大写开头的驼峰样式

7、通过类名（module）只能直接访问static变量和方法（TODO：方法中是否错误用到了self，未做检查）
8、通过self.super:XXXX能够访问基类的方法（其中ctor初始化方法，只能在子类的ctor方法中被调用）
]]

-- function _M:ctor()

-- end

return _M