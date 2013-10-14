require_relative 'eliza_client'
require 'socket'

cl = ElizaClient.new('localhost', 12345)
puts cl.say 'Hello'
