-- 简单的OpenResty测试模块
local _M = {}

-- 测试函数：返回Hello World
function _M.hello()
    return "Hello, OpenResty!"
end

-- 测试函数：计算两个数的和
function _M.add(a, b)
    return a + b
end

-- 测试函数：获取当前时间
function _M.get_time()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- 测试处理函数（用于Nginx路由）
function _M.handler()
    local args = ngx.req.get_uri_args()
    local action = args.action or "hello"

    if action == "hello" then
        ngx.say(_M.hello())
    elseif action == "add" then
        local a = tonumber(args.a) or 0
        local b = tonumber(args.b) or 0
        ngx.say("Result: " .. _M.add(a, b))
    elseif action == "time" then
        ngx.say("Current time: " .. _M.get_time())
    else
        ngx.say("Unknown action: " .. action)
    end
end

-- 直接执行处理逻辑，使其能够作为 Nginx 处理程序运行
--[[
    if ngx then
        _M.handler()
    end
]]

ngx.say("hello OpenResty!!!")

return _M
