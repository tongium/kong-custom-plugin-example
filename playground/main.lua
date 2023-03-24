local httpc = require("resty.http").new()
local cjson = require "cjson.safe"

local function dataType()
    local private = "private"
    public = "public"

    print(private) --> private
    print(public) --> publuc

    local word = "Hello World"
    local number = 1
    local flag = true
    local array = {"A", "B", "D"} 
    local records = {
        A = "b",
        B = 1,
    }

    print(type(word)) --> string
    print(type(number)) --> number
    print(type(flag)) --> boolean
    print(type(array)) --> table
    print(type(records)) --> table
    print(type(records.A)) --> string
    print(type(records.C)) --> nil

    for k, v in pairs(records) do
        print("record - key: " .. k  .. ", type: " .. type(v)) --> [`record - key: B, type: number`, `record - key: A, type: string`]
    end
end

local function stringOperation()
    local message = "Hello World!"
    print("Ho, " .. message) --> Ho, Hello World!
    
    print(string.find(message, "Hello")) --> 1 5
    print(string.match(message, "Hello")) --> Hello

    print(string.sub(message, string.find(message, "%w%w%w"))) --> 'Hel'
end

local function doHTTPRequest()
    local res, err = httpc:request_uri("https://httpbin.org/anything", {
        method = "GET",
        ssl_verify = false,
        headers = {
            ["My-Header"] = "Tong",
        }
    })

    if err ~= nil then
        print("request error: " .. err)
    else
        print(res.body)
        local data = cjson.decode(res.body)
        print(data.headers["My-Header"])
    end
end

dataType()
print(private) --> nil
print(public) --> publuc

stringOperation()
doHTTPRequest()