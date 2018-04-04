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
      puts "Server is listening!"
      client = @server.accept
      request = handle_request(client)
      response = Response.new(request)
      send_response(client, response)
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

  def send_response(client, response)
    @client.puts response.status_line
    @client.puts response.headers
    @client.puts response.body
  end
    


  # Needs a test
  def add_to_request_count
    @request_count += 1
  end

  def close(client)
    client.close
  end
end