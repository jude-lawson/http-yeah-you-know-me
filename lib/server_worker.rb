require 'socket'

class ServerWorker
  attr_reader :server
  
  def initialize(port)
    @server = TCPServer.new(port)
  end
end