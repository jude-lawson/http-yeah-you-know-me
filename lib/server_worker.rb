require 'socket'

class ServerWorker
  def initialize(port)
    @server = TCPServer.new(port)
  end
end