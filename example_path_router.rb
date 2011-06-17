PathRouter::Router.instance.reset.tap do |r|

  r.backends = {
    rails:  "127.0.0.1:3000", # default
    static: "127.0.0.1:8080",
    wordpress: "10.0.0.1:80",
  }

  r.connect :static,
    %r{^/robots.txt},
    %r{^/(?:images|stylesheets|javascripts)/}

  r.connect :wordpress,
    %r{^/blog/},
    %r{^/feed}

end
