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
    if type(data) == "table" then
        local sorted = { }
        
        for index, value in pairs(data) do
            if not data[index].username then return print(color("err", "[Appender]").." | ERR | No username provided") end
            if not data[index].avatar_url then return print(color("err", "[Appender]").." | ERR | No avatar URL provided") end
            if not data[index].content then return print(color("err", "[Appender]").." | ERR | No content provided") end
            if not data[index].timestamp then return print(color("err", "[Appender]").." | ERR | No timestamp provided") end

            local res = [[
            <div class="card">
                <div style="display: inline-block; vertical-align: top;">
                    <img src="]]..data[index].avatar_url..[[" alt="user icon" class="avatar" width="40px" height="40px">   
                </div>
        
                <div style="color: white; position: relative; top: 0px; display: inline-block;">
                    <span style="font-size: small;">
                        ]]..data[index].username..[[
                        <span style="opacity: 20%;">
                            ]]..data[index].timestamp..[[        
                        </span>
                    </span>

                    <br>

                    <span style="font-size: medium;">
                        ]]..data[index].content..[[

                    </span>
                </div>
            </div>
]]

            insert(sorted, #sorted+1, res)
        end

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
]]..concat(sorted, "\n")..[[
    </div>
</html>
]]

        return ret
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