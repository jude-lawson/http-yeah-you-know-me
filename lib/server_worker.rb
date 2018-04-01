require 'socket'

class ServerWorker
  def initialize(port)
    @port = port
  end

  def create
    TCPServer.new(@port)
  end

end