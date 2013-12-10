require 'goliath'
require 'em-synchrony/em-http'
require 'em-synchrony/activerecord'

module Movies
  class App < Goliath::API
    use Goliath::Rack::Params                 # parse & merge query and body parameters
    use Goliath::Rack::DefaultMimeType        # cleanup accepted media types
    use Goliath::Rack::Render                 # auto-negotiate response format
    use Goliath::Rack::Heartbeat              # respond to /status with 200, OK (monitoring, etc)


    def response(env)
      Movies::API.call(env)
    end
  end
end
