-- Dependancies

local json = require("json")
local prettyPrint = require("pretty-print")

-- Overrides

local open, parse, stringify = io.open, json.parse, json.stringify
local print, color = prettyPrint.print, prettyPrint.colorize

--// Read Files

function append:read(file)
    local ret 

    if open(file, "r") then
        local file = open(file, "r")
        local content = file:read("*all")
        file:close()
    else
        return (print(color("err", "[APPENDER/JSON]").." | ERR | File does not exist"))
    end

    return ret
end

function append:readJSON(file)
    local ret

    if open(file, "r") then
        local file = open(file, "r")
        ret = parse(file:read(file))
        file:close()
    else
        return (print(color("err", "[APPENDER/JSON]").." | ERR | File does not exist"))
    end

    return ret
end

--// Write Files

function append:writeJSON(file, data)
    local file = open(file, "w")
    file:write(stringify(data, {indent = true}))
    file:close()

    return true
end

function append:write(file, content)
    local file = open(file, "w")
    file:write(content)
    file:close()

    return true
end