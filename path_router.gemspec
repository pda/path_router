# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "path_router/version"

Gem::Specification.new do |s|
  s.name        = "path_router"
  s.version     = PathRouter::VERSION
  s.authors     = ["Paul Annesley"]
  s.email       = ["paul@annesley.cc"]
  s.homepage    = ""
  s.summary     = %q{HTTP routing by URL path, built on ProxyMachine.}
  s.description = %q{Easily route HTTP requests to different backends by pattern matching the URL path.}

  s.rubyforge_project = "path_router"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "proxymachine", "~> 1.2.4"
  s.add_development_dependency "rspec"
end
