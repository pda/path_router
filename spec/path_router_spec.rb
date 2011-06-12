require_relative "spec_helper"

describe Router do

  let(:router) do
    Router.new.tap do |r|

      r.backends = {
        rails:  "127.0.0.1:3000",
        static: "127.0.0.1:8080",
        api:    "api:80"
      }

      r.connect :static,
        %r{^/robots.txt},
        %r{^/(?:images|stylesheets|javascripts)/}

      r.connect :api,
        %r{^/api/}

    end
  end

  it "routes by specified patterns" do
    router.lookup("GET", "/robots.txt").should == "127.0.0.1:8080"
    router.lookup("GET", "/images/logo.png").should == "127.0.0.1:8080"
    router.lookup("GET", "/api/list").should == "api:80"
  end

  it "defaults to first backend for unmatched requests" do
    router.lookup("GET", "/anything/else").should == "127.0.0.1:3000"
  end

end
