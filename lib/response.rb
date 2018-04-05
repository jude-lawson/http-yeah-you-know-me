class Response
  attr_reader :status_line,
              :path,
              :method,
              :protocol,
              :body,
              :headers,
              :router

  def initialize(request, request_count)
    @request = request
    @request_count = request_count
    @status_line = "HTTP/1.1 200 OK"
    @path = request.path
    @method = request.method
    @protocol = request.protocol
    @request_count = request_count
    @router = Router.new
    @body = set_body(@path)
    @headers = [
      "Date: #{Time.now}",
      "Server: ruby",
      "Content-Type: text/html, charset=utf-8",
      "Content-Length: #{@body.length}",
      "\r\n"
    ]
  end

  def set_body(path)
    @router.respond('/', @request, @request_count)
  end
end