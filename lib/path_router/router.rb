module PathRouter
  class Router

    def self.instance
      @instance ||= new
    end

    def initialize
      reset
    end

    def reset
      @backends = {}
      @routes = {}
      self
    end

    def load_routes(file = "routes")
      puts "Loading routes."
      load file + ".rb"
    rescue LoadError => e
      puts "Failed to load routes: " << e.message
    end

    # Hash of backends, { Regexp => "ip:port", ... }
    def backends=(backends)
      backends.default = backends.values.first
      @backends = backends
    end

    # Connect patterns to the given backend.
    def connect(backend, *patterns)
      patterns.each { |p| @routes[p] = backend }
    end

    # method e.g. "GET", currently unused
    # path e.g. "/some/path?including=query+string"
    def lookup(method, path)
      _, backend = @routes.detect do |pattern, _|
        path =~ pattern
      end
      @backends[backend]
    end

  end
end
