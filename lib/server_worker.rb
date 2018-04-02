require 'socket'

class ServerWorker
  attr_reader :server,
              :request

  def initialize(port)
    @server = TCPServer.new(port)
    @request = []
  end

  def start_server_loop
    loop do
      client = create_client
      receive_request(client)
      puts "Received request: "
      p request
      close(client)
    end
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

  def close(client)
    client.close
  end
end