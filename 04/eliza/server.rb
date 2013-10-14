require_relative 'eliza_server'

server = ElizaServer.new(12345)
server.audit = true                  # Turn logging on.
server.start.join