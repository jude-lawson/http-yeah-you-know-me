require 'socket'

class ServerWorker
  attr_reader :number_of_requests

  def initialize(port)
    @port = port
    @status_codes = {
      OK: "HTTP/1.1 200 OK\r\n"
    }
    @number_of_requests = 0
  end

  def create
    TCPServer.new(@port)
  end

  def response(status, headers)
    "#{@status_codes[status]}#{headers}\r\n"
  end

  def output
    "<html><head></head></body><p>Hello, World! (#{@number_of_requests})</p></body></html>"
  end

  def successful_request
    @number_of_requests += 1
  end

end