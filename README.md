path_router
===========

HTTP routing by URL path, built on the excellent [ProxyMachine](https://github.com/mojombo/proxymachine) by the GitHub guys.

GitHub uses ProxyMachine to service millions of git connections every day.


Install
-------

```
gem install path_router  # installs path_router and proxymachine
path_router init         # creates example path_router.rb
vim path_router.rb       # specify your backends and URL patterns
path_router              # fire it up, optionally with -h host and -p port
```

Routes
------

See `example_path_router.rb` to get the general idea.

```ruby
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
```

The only non-obvious point is that the first backend in the hash is the default catch-all.
Ruby 1.8 users get random default backend; think of it as an easter egg ;)


Tests
-----

```
$ rspec spec/*_spec.rb

PathRouter::Router
  routes by specified patterns
  defaults to first backend for unmatched requests

Finished in 0.00056 seconds
2 examples, 0 failures
```


Meh.
----

(c) 2011 Paul Annesley, MIT licence.

