#!/bin/ruby
require 'socket'

module SocketClient

  def connect(host, port)
    sock = TCPSocket.new(host, port)
    begin
      result = yield sock
    ensure
      sock.close
    end
    result
  rescue Errno::ECONNREFUSED
  end

end

class ElizaClient
  
  # TODO: something is missing here. have a look at mixins
  
  def say(what)
    puts "client: connecting to #{@host}:#{@port}"
    ElizaClient.connect(@host, @port) do |sock|
      sock.puts(what)
      return sock.readline.strip
    end
  end

end