local weblit = require('weblit')

-- stack overflow to the rescue!
function readAll(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end


weblit.app
  .bind({host = "127.0.0.1", port = 1337})

  -- Configure weblit server
  .use(weblit.logger)
  .use(weblit.autoHeaders)

  -- main webpage - reading file everytime isn't a good idea
  .route({ path = "/"}, function (req, res)
    res.body = readAll("templates/main.html")
    res.code = 200
    res.headers["Content-Type"] = "text/html"
  end)

  -- basic js script hosting
  .route({ path = "/main.js"}, function (req, res)
    res.body = readAll("js/main.js")
    res.code = 200
    res.headers["Content-Type"] = "application/javascript"
  end)

  -- A custom route that sends back method and part of url.
  .route({ path = "/test/:name"}, function (req, res)
    res.body = '{"' .. req.method .. '" : "' .. req.params.name .. '"}'
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)

  -- Start the server
  .start()
