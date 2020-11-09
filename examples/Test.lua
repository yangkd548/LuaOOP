local Bird = require("examples.Bird")

local _M = Class("Test")

_M.private.bird = Bird.new("小红鹳")

_M.name = "666"

function _M.public:Begin()
    print("我找到的动物，名字叫：", self.bird.name)
    self.bird:Move()
end

function _M:Hello()
    print("测试 类名调用")
end

function _M.static:HelloWorld()
    
end

return _M