local appender = require("discordia-appender").append

local data = appender:sort({
    {
        username = "Ken and Richie#8601",
        avatar_url = "https://cdn.discordapp.com/avatars/1023482322890281042/4fb15c961276e9c8e5b35603d266c756.webp?size=240",
        content = "Hello, world!",
        timestamp = "01/01/1970 ",
    },
})

function append(count)
    local identifier = count
    if io.open("./transcript"..identifier..".html", "r") then
        identifier = identifier + 1
        append(identifier)
    else
        appender:write("./transcript"..identifier..".html", data)
    end
end

append(1)