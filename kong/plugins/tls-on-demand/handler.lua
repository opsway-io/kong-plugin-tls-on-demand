local plugin = {
  PRIORITY = 1000,
  VERSION = "0.0.1",
}

function plugin:init_worker()
  kong.log.debug("saying hi from the 'init_worker' handler")
end

function plugin:access(plugin_conf)
  kong.log.inspect(plugin_conf)
  kong.service.request.set_header(plugin_conf.request_header, "this is on a request")
end

function plugin:header_filter(plugin_conf)
  kong.response.set_header(plugin_conf.response_header, "this is on the response")
end

return plugin
