--[[
    module:Test
    author:DylanYang
    time:2020-11-03 10:05:12
]]
local Bird = require("examples.Bird")

local _M = Class("Test")

_M.bird = nil --Bird.new("小红鹳") --直接在定义时生成，每个Test实例就会使用相同的bird，需要根据需要决定是否此时生成

_M.name = "666"

function _M:ctor()
    self.bird = Bird.new("小红鹳")
end

function _M.public:Begin()
    print("打印名字赋值结果：", self.bird.name)
    self.bird:Move("Test.Begin通过self.bird访问")
end

function _M:Hello()
    print("测试 类名调用")
end

function _M.static:HelloWorld()
    
end

return _M