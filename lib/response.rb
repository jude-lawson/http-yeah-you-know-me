class Response
  attr_reader :status_line,
              :path,
              :method,
              :protocol,
              :body,
              :headers,
              :router

  def initialize(request)
    # @request = request
    @status_line = "HTTP/1.1 200 OK"
    @path = request.path
    @method = request.method
    @protocol = request.protocol
    @router = Router.new
    # Body string
    @body = "<html><head></head><body><p>Hello, World! (0)</p></body></html>"
    # Headers, just a string?
      # Date
      # Server
      # Content-Type
      # Content-Length
    @headers = [
      "Date: #{Time.now}",
      "Server: ruby",
      "Content-Type: text/html, charset=utf-8",
      "Content-Length: #{@body.length}"
    ]
  end
end