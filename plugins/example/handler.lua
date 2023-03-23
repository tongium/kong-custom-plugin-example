local CustomHandler = {
    VERSION  = "1.0.0",
    PRIORITY = 10,
}

function CustomHandler:access(config)
    kong.log("access")
    kong.log.inspect(config)
    kong.service.request.set_header("Finno-Message", config.message)
    kong.response.set_header("Finno-Message", config.message)
end

return CustomHandler
