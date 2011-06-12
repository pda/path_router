require "proxymachine"
$LOAD_PATH.unshift "./lib"
require "router"

Signal.trap("USR2") { Router.instance.load_routes }

Router.instance.load_routes

proxy do |data|
  if data =~ %r{^(\w+) (\S+) HTTP/\d.\d\r\n}
    { remote: Router.instance.lookup($1, $2) }
  else
    { noop: true }
  end
end
