-- https://docs.konghq.com/gateway/latest/plugin-development/configuration/

return {
  name = "example",
  fields = {
    { 
      config = {
        type = "record",
        fields = {
          { 
            message = { 
              type = "string",
              required = false,
            }, 
          },
        },
      }, 
    },
  }
}

