-- Dependancies

local json = require("json")
local prettyPrint = require("pretty-print")

-- Overrides

local open, parse, stringify = io.open, json.parse, json.stringify
local print, color = prettyPrint.print, prettyPrint.colorize

--// Read Files

local files = {}

function files:read(file)
    local ret 

    if open(file, "r") then
        local file = io.open(file, "r")
        local content = file:read("*all")
        file:close()
    else
        return (print(color("err", "[APPENDER/JSON]").." | ERR | File does not exist"))
    end

    return ret
end

function files:readJSON(file)
    local ret

    if not file then
        return (print(color("err", "[APPENDER/JSON]") .. " | ERR | Invalid argument #1 (file), string not provided."))
    end

    if type(file) ~= "string" then
        return  (print(color("err", "[APPENDER/JSON]") .. " | ERR | Invalid argument #1 (file), expected string [got " .. type(file) .. "]"))
    end

    if open(file, "r") then
        print(file)
        local file = assert(open(file, "r"))
        ret = parse(file:read("*all"))
        file:close()
        if ret == "" or not ret then
            return (print(color("err", "[APPENDER/JSON]") .. " | ERR | Encountered error while decoding JSON to lua table [returned nil]"))
        end
    else
        return (print(color("err", "[APPENDER/JSON]").." | ERR | File does not exist"))
    end

    return ret
end

--// Write Files

function files:writeJSON(file, data)
    local file = open(file, "w")
    file:write(stringify(data, {indent = true}))
    file:close()

    return true
end

function files:write(file, content)
    local file = open(file, "w")
    file:write(content)
    file:close()

    return true
end

return files
