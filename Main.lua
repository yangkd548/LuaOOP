--[[
    module:Main
    author:DylanYang
    time:2020-11-09 16:20:12
]]
print(string.format("The current lua version is %s .", _VERSION))

require("framework.ImportFrame")

local Test = require("examples.Test")

local test = Test.new()
test:Begin()