class MyApp
  # this method has to be named call
  def call(environment)
    [200, # the status code
     {"Content-Type" => "text/plain",
       "Content-length" => "11" }, # headers
     ["Hello world"]] # the body
  end
end

# presuming you have rack & webrick
if $0 == __FILE__
  require 'rack'
  Rack::Handler::WEBrick.run MyApp.new
end
