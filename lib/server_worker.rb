require 'socket'

class ServerWorker
  attr_reader :server,
              :request

  def initialize(port)
    @server = TCPServer.new(port)
    @request = []
  end

  def create_client
    @server.accept
  end

  def receive_request(client)
    @request = []
    line = client.gets
    until line == "\r\n"
      @request << line
      line = client.gets
    end
  end
end