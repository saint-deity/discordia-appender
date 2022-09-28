-- dependancies

local json = require("json")
local prettyPrint = require("pretty-print")

-- keywords/shortcuts/overrides

local open, execute = io.open, os.execute
local insert, remove, concat = table.insert, table.remove, table.concat

local print, color = prettyPrint.print, prettyPrint.colorize
local parse, stringify = json.parse, json.stringify

local newthread = coroutine.wrap
local function thread(func)
    newthread(func())()
end

local append = { }

-- Sort data as JSON 

function append:sort(data)
    prettyPrint.loadColors(256)
    if data[1] then
        print(data[1]["content"])
    end
    if type(data) == "table" then
        for i,v in pairs(data) do
            print(i)
        end

        local sorted = { }
        local sortedi = { }

        for index, value in pairs(data) do
            if index == nil then return print(color("err", "[Appender]").." | ERR | Unexpected Error") end
            if not value['username'] then return print(color("err", "[Appender]").." | ERR | No username provided") end
            if not value['avatar_url'] then return print(color("err", "[Appender]").." | ERR | No avatar URL provided") end
            if not value['content'] then return print(color("err", "[Appender]").." | ERR | No content provided") end
            if not value['timestamp'] then return print(color("err", "[Appender]").." | ERR | No timestamp provided") end

            local res = [[
            <div class="card">
                <div style="display: inline-block; vertical-align: top;">
                    <img src="]]..value['avatar_url']..[[" alt="user icon" class="avatar" width="40px" height="40px">   
                </div>
        
                <div style="color: white; position: relative; top: 0px; display: inline-block;">
                    <span style="font-size: small;">
                        ]]..value['username']..[[
                        <span style="opacity: 20%;">
                            ]]..value['timestamp']..[[        
                        </span>
                    </span>

                    <br>

                    <span style="font-size: medium;">
                        ]]..value['content']..[[

                    </span>
                </div>
            </div>
]]
            print(res)
            insert(sorted, #sorted+1, res)
        end

        if sorted[1] then
            local ret = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Appended Transcript</title>

        <style>
            body {
                background-color: #2c2f33;
                font-family: sans-serif;
            }

            img {
                border-radius: 50%;
            }

            .card {
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <div class="cards">
]]..table.concat(sorted)..[[
    </div>
</html>
]]
return ret
        else
            print(color("err", "[Appender]").." | ERR | Unexpected Error")
            return [[
                <!DOCTYPE html>
                <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                
                        <title>Appended Transcript</title>
                
                        <style>
                            body {
                                background-color: #2c2f33;
                                font-family: sans-serif;
                            }
                
                            img {
                                border-radius: 50%;
                            }
                
                            .card {
                                margin-top: 10px;
                            }
                        </style>
                    </head>
                
                    <body>
                        <div class="cards">
                            <div class="card">
                                <div style="display: inline-block; vertical-align: top;">
                                    <img src="https://cdn.discordapp.com/avatars/1023482322890281042/4fb15c961276e9c8e5b35603d266c756.webp?size=240" alt="user icon" class="avatar" width="40px" height="40px">   
                                </div>
                        
                                <div style="color: white; position: relative; top: 0px; display: inline-block;">
                                    <span style="font-size: small;">
                                        Ken and Richie#8601                        <span style="opacity: 20%;">
                                            01/01/1970         
                                        </span>
                                    </span>
                
                                    <br>
                
                                    <span style="font-size: medium;">
                                        Hello, world!
                                    </span>
                                </div>
                            </div>
                        </div>
                    </body>
                </html>]]
        end
    else
        return print(color("err", "[Appender]").." | ERR | type \"table\" expected (got "..type(data)..")")
    end
end

function append:read(file)
    local file = open(file, "r")
    local content = file:read("*all")
    file:close()
    return content
end

function append:write(file, content)
    local file = open(file, "w")
    file:write(content)
    file:close()
    
end

return append
