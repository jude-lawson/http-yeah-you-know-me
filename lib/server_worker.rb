require 'socket'
require './lib/router'
require './lib/response'
require './lib/request'

class ServerWorker
  attr_reader :server,
              :request

  def initialize(port)
    @server = TCPServer.new(port)
    @router = Router.new
    @request = []
    @request_count = 0
  end

  def start_server_loop
    loop do
      # puts "Server has started!"
      # client = create_client
      # receive_request(client)
      # puts "Received request: "
      # p @request
      # @router.respond('/')
      # # ======= #
      # # output = "<html><head></head><body><p>Hello, World! (#{@request_count})4</p></body></html>"
      # # headers = ["HTTP/1.1 200 ok\r\n",
      # #           "Content-Length: #{output.length}\r\n\r\n"]
      # # client.puts Response.headers
      # # client.puts Response.body
      # # client.puts headers
      # # client.puts output
      # close(client)
      puts "Server is listening!"
      client = @server.accept
      request = handle_request(client)
      create_response(request)
      client.close
    end
  end

  def handle_request(client)
    lines_of_request = []
    line = client.gets
    until line == "\r\n"
      lines_of_request << line
      line = client.gets
    end
    puts "Received request: #{lines_of_request}"
    add_to_request_count
    Request.new(lines_of_request)
  end

  def create_response(request)
  end
    


  # Needs a test
  def add_to_request_count
    @request_count += 1
  end

  def close(client)
    client.close
  end
end