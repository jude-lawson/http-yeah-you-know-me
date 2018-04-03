require 'socket'
require_relative './router'

class ServerWorker
  attr_reader :server,
              :request

  def initialize(port)
    @server = TCPServer.new(port)
    @request = []
    @request_count = 0
  end

  def start_server_loop
    loop do
      puts "Server has started!"
      client = create_client
      receive_request(client)
      puts "Received request: "
      p @request
      route = Router.new(client)
      route.respond('/')
      # ======= #
      # output = "<html><head></head><body><p>Hello, World! (#{@request_count})4</p></body></html>"
      # headers = ["HTTP/1.1 200 ok\r\n",
      #           "Content-Length: #{output.length}\r\n\r\n"]
      # client.puts Response.headers
      # client.puts Response.body
      # client.puts headers
      # client.puts output
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
    add_to_request_count
  end

  def add_to_request_count
    @request_count += 1
  end

  def close(client)
    client.close
  end
end