require 'socket'

class ServerWorker
  def initialize(port)
    @port = port
    @status_codes = {
      OK: "HTTP/1.1 200 OK\r\n"
    }
  end

  def create
    TCPServer.new(@port)
  end

  def response(status, headers)
    "#{@status_codes[status]}#{headers}\r\n"
  end

end