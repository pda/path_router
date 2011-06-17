PathRouter::Router.instance.reset.tap do |r|

  r.backends = {
    rails:  "127.0.0.1:3000",
    static: "127.0.0.1:8080",
  }

  r.connect :static,
    %r{^/robots.txt},
    %r{^/(?:images|stylesheets|javascripts)/}

end
