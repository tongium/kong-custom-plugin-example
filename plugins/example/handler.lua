-- https://docs.konghq.com/gateway/latest/plugin-development/custom-logic/

local CustomHandler = {
    VERSION  = "1.0.0",
    PRIORITY = 10,
}

-- before request to upstream
function CustomHandler:access(config)
    kong.log("access")
    kong.log.inspect(config)
    kong.service.request.set_header("X-Message", config.message)
end

-- after upstream response
function CustomHandler:response(config)
    kong.response.set_header("X-Message", config.message)
end

return CustomHandler
